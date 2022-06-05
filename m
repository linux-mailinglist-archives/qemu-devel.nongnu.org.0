Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC3753DA66
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Jun 2022 08:23:13 +0200 (CEST)
Received: from localhost ([::1]:56398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxjfM-0001PM-85
	for lists+qemu-devel@lfdr.de; Sun, 05 Jun 2022 02:23:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nxjc2-0000Sm-S7; Sun, 05 Jun 2022 02:19:46 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:43894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nxjby-0001Cc-Bf; Sun, 05 Jun 2022 02:19:43 -0400
Received: by mail-ed1-x532.google.com with SMTP id x62so14886443ede.10;
 Sat, 04 Jun 2022 23:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nbdeXpjkOJoKAdXlo4MHRzo8ccQ0sJiM0pxaq9ODvus=;
 b=q7A31XGC4WCt9t7GQOTAsqO4NGs70kptQSLkZGuaxApc0iPnPtJBoXOGmG3P3qTXbv
 FQjfe71CdQ36lR5dkIHbQIvq5Vc0tcwZj329WYo5xugWTEp2EUSojLGyE55T2izLZGOp
 DLtHwT0N6h+N1hMKGnDb3swAempH+6HSTMNpj0rerW3INIL2GrmxLY2C7diu5Ob4qJLS
 xYx8+g+QEF68ImUhROYzfz9JhF4FPFVmNqrJDMavKyg36BSARJHK1dQdA8F9OpMnmXZo
 4iTpMRhUSqHmLdvnEJ4NgiQfYh7uaGXs9GgbhazF/6b+ZGldHuPyi3BKg3TrjYvfw18y
 Lxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nbdeXpjkOJoKAdXlo4MHRzo8ccQ0sJiM0pxaq9ODvus=;
 b=WP5DzUzOrCrhrob2Tu7ag1HohLCngHmBRio71VZRQx8XiaEwcb5jSM6wWdh2q7qORH
 gYjg3dU4PNiyt1fnpu9GAaW6MK900FyTwmkf31zf48XxQcsm+MQyXZbs8uffxE1Spv+z
 cbHCn88jwY3aw3kr3Sa0sIrrg3Iwuwvbv3RLMGfQW4R4gReZutvSFpIuC9t0MVJ0tmfq
 vxPCAkxA1fnYa8Gycs97FQhOy2GFojex8uswmhSDp3Nm3f37FlDXO4nF9ZUBvVn4oR0I
 SjA/bPXlpXeTiqgyQO7duMFr52LQ7SkwYS93N8WDufnCo87Q0LlKYzZ5L2QDHWmICRXn
 YhGQ==
X-Gm-Message-State: AOAM531yEwtLsB98XsGb2lG7Ejb5TSJVmfYnwbgX00AxVB5XV5wV9xE5
 FRxFEAL6lL3Ifqod8rXITZs=
X-Google-Smtp-Source: ABdhPJz4nW1URzre+5cXTWe1fHUVy2FSrPiDxthoTdXxzwYfd4yqItfW37zNGtpbX/2I5jsYDwwKmA==
X-Received: by 2002:a05:6402:2714:b0:42a:ec89:ca72 with SMTP id
 y20-20020a056402271400b0042aec89ca72mr19227343edd.243.1654409979602; 
 Sat, 04 Jun 2022 23:19:39 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 l4-20020a170906644400b006feb047502bsm4793042ejn.151.2022.06.04.23.19.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Jun 2022 23:19:38 -0700 (PDT)
Message-ID: <a31c2c6b-60d0-0759-2ae9-879d5d34549e@redhat.com>
Date: Sun, 5 Jun 2022 08:19:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] aio_wait_kick: add missing memory barrier
Content-Language: en-US
To: Roman Kagan <rvkagan@yandex-team.ru>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
References: <20220524173054.12651-1-eesposit@redhat.com>
 <YptVOJ7CGZW1MvrW@rvkaganb>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YptVOJ7CGZW1MvrW@rvkaganb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 6/4/22 14:51, Roman Kagan wrote:
> On Tue, May 24, 2022 at 01:30:54PM -0400, Emanuele Giuseppe Esposito wrote:
>> It seems that aio_wait_kick always required a memory barrier
>> or atomic operation in the caller, but nobody actually
>> took care of doing it.
>>
>> Let's put the barrier in the function instead, and pair it
>> with another one in AIO_WAIT_WHILE. Read aio_wait_kick()
>> comment for further explanation.
>>
>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   include/block/aio-wait.h |  2 ++
>>   util/aio-wait.c          | 16 +++++++++++++++-
>>   2 files changed, 17 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/block/aio-wait.h b/include/block/aio-wait.h
>> index b39eefb38d..54840f8622 100644
>> --- a/include/block/aio-wait.h
>> +++ b/include/block/aio-wait.h
>> @@ -81,6 +81,8 @@ extern AioWait global_aio_wait;
>>       AioContext *ctx_ = (ctx);                                      \
>>       /* Increment wait_->num_waiters before evaluating cond. */     \
>>       qatomic_inc(&wait_->num_waiters);                              \
>> +    /* Paired with smp_mb in aio_wait_kick(). */                   \
>> +    smp_mb();                                                      \
> 
> IIRC qatomic_inc() ensures sequential consistency, isn't it enough here?

Nope, it only ensures sequential consistency with other SEQ_CST 
operations, i.e. not with qatomic_read or qatomic_set. :(

The smp_mb() is needed on ARM, in particular.


Paolo


