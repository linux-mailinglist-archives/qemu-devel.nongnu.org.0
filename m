Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F22A256D6E1
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 09:33:58 +0200 (CEST)
Received: from localhost ([::1]:57006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAnvZ-00038G-MT
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 03:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oAnsh-0000za-M7
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 03:30:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oAnsf-0006XD-5n
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 03:30:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657524655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ahWdTxOOIMa//8Fto3gxbjMZZQTBoXU5Wp3wEK9+/bQ=;
 b=g5GeBgvR3mEitvWHdBd4+MoZU+nFmaax1uIjgbnjmka5dt///S5Jx7cnpD8NV9a0fvkRUT
 RdLiiSLtmy5FZUkt2FxcjzOObPHxKfZs4VncGjH0c15eBKT+Kwb8imhaHjfHDVEqdYExsD
 GA17yR+kWoOTQMD3/+cirBtqe5P08l0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-QPMmsUKDMFSYj68HZ2Cbhw-1; Mon, 11 Jul 2022 03:30:54 -0400
X-MC-Unique: QPMmsUKDMFSYj68HZ2Cbhw-1
Received: by mail-wm1-f71.google.com with SMTP id
 h10-20020a1c210a000000b003a2cf5b5aaaso491739wmh.8
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 00:30:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ahWdTxOOIMa//8Fto3gxbjMZZQTBoXU5Wp3wEK9+/bQ=;
 b=JlyzvVe2yqv3tBOzeRB/cS4r0kpp6As4BI54fpEuzSkX88JXiBGXAza+Sgzn8tmnHj
 E19jzTuMbTTKsEB+kJJymsbfUvg7UZPO8cGSLOEkHZuCLdCoIk6p/RMy0nvuJEtIqbOi
 D+X3IqGAv5mU4EL1Ed7kENBHbcY1dV296GmLJzEBBtLLqI0XSJhKi6nqGz2/MRqgnNgm
 M3verOahlmh3eO3H3sgMgAzcs5pM0dBJ3s/L/HzCk7DGzYktgqCFY3Ov/FPMyP+ITPdH
 sSmE0X2B2ntGIilxyXdFTQxOfxFoBE4coFZYGK4m05d5/YhEPWLyKnUmvy8zDs1x1aHy
 exAQ==
X-Gm-Message-State: AJIora+Atfox/iIxrx3lhXcrAp4rdEi5oCsV9G3fYyILxrYarFuWH8o3
 OHlJOBPljEMSK8lav66/Iv0W+RuswaZtkKlwNX9sVQJWsstffhAWiWLRJozcE3dSirTcMbZZgk1
 MKSyYRQsxLzZ0q7Q=
X-Received: by 2002:a1c:f60f:0:b0:3a0:3e0c:1de1 with SMTP id
 w15-20020a1cf60f000000b003a03e0c1de1mr14543564wmc.56.1657524653436; 
 Mon, 11 Jul 2022 00:30:53 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vQj7mkTYKf80n5a5Og1XnRe/JzkF2ympIn0Df9OyzoTk4uvBS+Qu4iFNCjpPipg0X0hfJDaA==
X-Received: by 2002:a1c:f60f:0:b0:3a0:3e0c:1de1 with SMTP id
 w15-20020a1cf60f000000b003a03e0c1de1mr14543528wmc.56.1657524653162; 
 Mon, 11 Jul 2022 00:30:53 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a5d538f000000b0021b5861eaf7sm5181897wrv.3.2022.07.11.00.30.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 00:30:52 -0700 (PDT)
Message-ID: <9e9e1bcb-3085-a903-b056-151e23ab0fe9@redhat.com>
Date: Mon, 11 Jul 2022 09:30:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v9 05/21] job.c: add job_lock/unlock while keeping job.h
 intact
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220706201533.289775-1-eesposit@redhat.com>
 <20220706201533.289775-6-eesposit@redhat.com>
 <1c7b5083-01eb-f53d-4b3e-fae0e630cea2@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <1c7b5083-01eb-f53d-4b3e-fae0e630cea2@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 08/07/2022 um 21:25 schrieb Vladimir Sementsov-Ogievskiy:
>>   static bool job_started(Job *job)
> 
> So we can call it both with mutex locked and without. Hope it never race
> with job_start.

Where exactly do you see it called with mutex not held?

I don't see it anywhere, and if you agree too, we should rename it in
_locked.

Emanuele


