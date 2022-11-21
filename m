Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5252F631B7E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 09:34:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox2Ef-00087c-6B; Mon, 21 Nov 2022 03:33:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ox2Ed-00086n-CP
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 03:32:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ox2Eb-0005Cu-IW
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 03:32:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669019576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p5fDlTHprZBJuRg7Sf+IGz4CHr429y1PrYfhSpFhthc=;
 b=aByjVGRUcawulZ4s2fotWbJ4mdWlct30e+HodiQ89IReQlcblbKuFlmA0gqnrglQu/FKNf
 RxO5LdXC/TB0GRa+6W5B/sd8aWn9yFnTRBVW2b85vBIdoXOD8AbIrG61oh7TptlhWrQd/1
 wjAqbWFgT3GpOMI0iv+E3x9bJ998jxE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-130-LzIleJlIPeCZIfiyaYYVWA-1; Mon, 21 Nov 2022 03:32:54 -0500
X-MC-Unique: LzIleJlIPeCZIfiyaYYVWA-1
Received: by mail-wr1-f71.google.com with SMTP id
 n13-20020adf8b0d000000b0023658a75751so2979365wra.23
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 00:32:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p5fDlTHprZBJuRg7Sf+IGz4CHr429y1PrYfhSpFhthc=;
 b=k9jLPFr4HaqHkWBtc+1K1UH2R07CPZNkoVf7/8TBbPyhXeOAikRhqoyQ1T/+4cBJEO
 dBBDsI+XkfSh+cgVkSfuocASr20kdNe2fIVBbxQsJ5zSim3unkmb28ofB0jlksGc2M4p
 vC01o9u+6yHFRkK5/JmhNNdpDXtvD9VfDjEbx/+MarBD07BAai9UdlQxht1+ssXnR7w2
 LnSlou4xX8nBjg6Nako9ug9FnxeE4D3OL2ih5qzFy7/RcAGiFAOu7f4giMY1WMrY9cNM
 1Dk2Lg/v19jHb5W/CErz/sC8HX9o5W8SK16gfXQWB/2/AL4L1TwcuicMp+x+WcO2HxNF
 kzvQ==
X-Gm-Message-State: ANoB5plnH6tgUQFOsBTh/UWhdr72dabMJYHNAuV/yy6zOs4wTY8nWFje
 pHQBQ2kZ0Ucn7KrV0YIwNuyb+iBdm4rpwmyZTcRdEoTQQfERqhU/0eMc1jnfBEUGw0WB593tEg4
 aq360aAgEAYFqeIE=
X-Received: by 2002:a05:600c:2118:b0:3cf:d70d:d5b3 with SMTP id
 u24-20020a05600c211800b003cfd70dd5b3mr332013wml.202.1669019573818; 
 Mon, 21 Nov 2022 00:32:53 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7kKjoBamD1dPNUHxn5FAlIPFMF4yKjKCY5ByqT0ZZcip1FHUNtAaBfZdAAm4BS4RAR3aydOw==
X-Received: by 2002:a05:600c:2118:b0:3cf:d70d:d5b3 with SMTP id
 u24-20020a05600c211800b003cfd70dd5b3mr331998wml.202.1669019573608; 
 Mon, 21 Nov 2022 00:32:53 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a05600c4f8300b003d01b84e9b2sm3769236wmq.27.2022.11.21.00.32.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 00:32:52 -0800 (PST)
Message-ID: <c1c9e6b2-78a5-bd0c-6c95-a3123b89ce91@redhat.com>
Date: Mon, 21 Nov 2022 09:32:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 01/11] block-copy: add missing coroutine_fn annotations
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20221116122241.2856527-1-eesposit@redhat.com>
 <20221116122241.2856527-2-eesposit@redhat.com> <Y3fXgfKe5H7j22aj@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <Y3fXgfKe5H7j22aj@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 18/11/2022 um 20:05 schrieb Kevin Wolf:
> Am 16.11.2022 um 13:22 hat Emanuele Giuseppe Esposito geschrieben:
>> These functions end up calling bdrv_common_block_status_above(), a
>> generated_co_wrapper function.
>> In addition, they also happen to be always called in coroutine context,
>> meaning all callers are coroutine_fn.
>> This means that the g_c_w function will enter the qemu_in_coroutine()
>> case and eventually suspend (or in other words call qemu_coroutine_yield()).
>> Therefore we need to mark such functions coroutine_fn too.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> 
> Ideally, we'd convert them to new wrappers bdrv_co_is_allocated() and
> bdrv_co_block_status_above() instead of having to argue that they always
> take the coroutine path in g_c_w.
> 

Ok so basically I should introduce bdrv_co_is_allocated, because so far
in this and next series I never thought about creating it.
Since these functions will be eventually split anyways, I agree let's
start doing this now.

Thank you,
Emanuele


