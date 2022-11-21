Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F26B631C1F
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 09:56:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox2XE-0003ew-Ut; Mon, 21 Nov 2022 03:52:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ox2X3-0003e6-BK
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 03:52:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ox2X1-0001JS-Qw
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 03:52:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669020719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0msWXAW24xXVCx6ogGXQEs0tdWOdsvvc0LtMYYx+tLk=;
 b=JHsBk0Mp3Say3DPwa2bxUX3tLdwOyHwxQ7v66zEskdok2OM0w7BrniY575OS1tW+pArIM5
 xuNQNvDubJLAemqEYJv64gsvTAHvP3aokaDyGJa/+uJvpXKd7jDWSuFUkPu5f3fSfCG11B
 4bRwlnpMExvjn0Z745M1Y94jd8BYQN0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-571-gNYlbr3rOwiJXjPkvxixIw-1; Mon, 21 Nov 2022 03:51:57 -0500
X-MC-Unique: gNYlbr3rOwiJXjPkvxixIw-1
Received: by mail-wr1-f72.google.com with SMTP id
 n13-20020adf8b0d000000b0023658a75751so2997010wra.23
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 00:51:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0msWXAW24xXVCx6ogGXQEs0tdWOdsvvc0LtMYYx+tLk=;
 b=kuDsse2q9MOs1MjZTvDZZExbwBv3V+eX1ql7CNqhEZCK9vjqhtaExVFgOeAG1JEZ50
 uszW9aM2DI6Vx6bM8EswFbZJpOL6zzVpJ+ULPTlKR0nXHZ8ZY4EPVJv/ltGFjWwSXR5u
 EKdHLUs9GxHB7pEZqvHPREjfZ/E9taMTumbTORZ8StuyzNnl83+SXT4BOBlNTRBaBic7
 JHxn0vTeL9gv3j0uddibrEl98GL9zeMHC3YyvCA45ZqW1T9c+X0HWZh5FKQ1bWeobGEH
 ij73xGWjy3fh1rOGZRjEA8adf639cKITiUvxWGzbPl9Gl/Xas0PvqtzQ/QKT6xaH1udh
 B1fw==
X-Gm-Message-State: ANoB5pmxhkR9sKRioMPM3O0qcfw9WPSSBB9OluznRKwOR0F2re8Js5eq
 fV9SGUKSDDfM0v4UZVMqe/8JnRyWchDuaXuUrVXD3QCnSTT8/yE5x6VrfPhI5bX3WjOMVhzKCNC
 6g1W1vHYsonZTsOo=
X-Received: by 2002:a5d:5952:0:b0:241:a79b:3c41 with SMTP id
 e18-20020a5d5952000000b00241a79b3c41mr10055927wri.22.1669020716129; 
 Mon, 21 Nov 2022 00:51:56 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6aTg+9T5CQHQFV/lJ/HAS39hu3AIDEcxs96kXRhTAdL7C+XsPCFxs+C9JpBvt47GOCeIgDEg==
X-Received: by 2002:a5d:5952:0:b0:241:a79b:3c41 with SMTP id
 e18-20020a5d5952000000b00241a79b3c41mr10055903wri.22.1669020715571; 
 Mon, 21 Nov 2022 00:51:55 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 bn6-20020a056000060600b00241d2df4960sm3522771wrb.17.2022.11.21.00.51.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 00:51:54 -0800 (PST)
Message-ID: <c30c7321-a2b6-5094-16d0-2aee5a327c80@redhat.com>
Date: Mon, 21 Nov 2022 09:51:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 01/11] block-copy: add missing coroutine_fn annotations
Content-Language: en-US
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20221116122241.2856527-1-eesposit@redhat.com>
 <20221116122241.2856527-2-eesposit@redhat.com> <Y3fXgfKe5H7j22aj@redhat.com>
 <c1c9e6b2-78a5-bd0c-6c95-a3123b89ce91@redhat.com>
In-Reply-To: <c1c9e6b2-78a5-bd0c-6c95-a3123b89ce91@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



Am 21/11/2022 um 09:32 schrieb Emanuele Giuseppe Esposito:
> 
> 
> Am 18/11/2022 um 20:05 schrieb Kevin Wolf:
>> Am 16.11.2022 um 13:22 hat Emanuele Giuseppe Esposito geschrieben:
>>> These functions end up calling bdrv_common_block_status_above(), a
>>> generated_co_wrapper function.
>>> In addition, they also happen to be always called in coroutine context,
>>> meaning all callers are coroutine_fn.
>>> This means that the g_c_w function will enter the qemu_in_coroutine()
>>> case and eventually suspend (or in other words call qemu_coroutine_yield()).
>>> Therefore we need to mark such functions coroutine_fn too.
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>
>> Ideally, we'd convert them to new wrappers bdrv_co_is_allocated() and
>> bdrv_co_block_status_above() instead of having to argue that they always
>> take the coroutine path in g_c_w.
>>
> 
> Ok so basically I should introduce bdrv_co_is_allocated, because so far
> in this and next series I never thought about creating it.
> Since these functions will be eventually split anyways, I agree let's
> start doing this now.

Actually bdrv_is_allocated would be a g_c_w functions in itself, that
calls another g_c_w and it is probably called by functions that are or
will be g_c_w.
Is this actually the scope of this series? I think switching this
specific function and its callers or similar will require a lot of
efforts, and if I do it here it won't cover all the cases for sure.

Wouldn't it be better to do these kind of things in a different serie
using Paolo's vrc tool?

> Thank you,
> Emanuele
> 


