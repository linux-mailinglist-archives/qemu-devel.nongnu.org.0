Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F626ADC6C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:52:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZUv6-0000B5-PS; Tue, 07 Mar 2023 05:51:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZUv4-0000Aa-5v
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:51:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZUv2-0008Dl-S2
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:51:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678186304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e6GGopRCseNGNt9T3f/XAl8tBdjLi4GcQ0MVsE4LQmU=;
 b=dSid7wyuBJ1K6vtdh2rqIi3WvyURB1qHGyprJqH9q/o8iPH24tu8+IF5POFM1b112hV18o
 yrGoIFsWd2oOVFOQK9Q5aQizUe7umxSwLPQMWTvWKIu6kzbFq4fripSIhyoLrHTMWlXRtr
 j/4MAzJi/r/MUm3hALohAPTepuznds0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-HxYsaufnOUOD_LD5AtYMUQ-1; Tue, 07 Mar 2023 05:51:42 -0500
X-MC-Unique: HxYsaufnOUOD_LD5AtYMUQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 u5-20020a5d6da5000000b002cd82373455so2073098wrs.9
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 02:51:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678186302;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e6GGopRCseNGNt9T3f/XAl8tBdjLi4GcQ0MVsE4LQmU=;
 b=WlMrqAJYNFdtNgYeg2e0R+5M0iGMoiy/Sk4sbyzieJ06l0rXY5o4UR2qp/jQpz6W0i
 4C6VM9ahCdkYUVLhTvIO2414MayDoFsuKwqMWPl/xOjwTYslYIGaa1bZ2ictD7pQ0EKj
 kTo7et/95+44z+7HcntMrj9yCzk1bueait8/0uphqZYKpiZ2c6jvyHUzVfOiw46zUPwr
 TvtAlQlGds0ksSUQKYHrq3mi6P0b6GrFrytD6ucwuWzD/V3BXiI1qHo+OzQI2G/BKc69
 GY5wybQtz5Xllos6VNuwmXbxTm5QekZsiOrMStinVKnzDyjPlu8BL4lEnuOBulr8LhE4
 KYTg==
X-Gm-Message-State: AO0yUKUkb3QKP1A0zgjWZQho8FQhnjpgeSiUKNWf5Pr0zLGMxnEga8dq
 oIV22zxSh7trvxkGKEOfEEethSL+oIw7NoMVtLLfJhM4LzuXeomxmL8BqcRUuv1MkRpChKV3XUK
 Wu7Qx3kaokcvbIgM=
X-Received: by 2002:a05:600c:5008:b0:3df:e41f:8396 with SMTP id
 n8-20020a05600c500800b003dfe41f8396mr11881855wmr.37.1678186301836; 
 Tue, 07 Mar 2023 02:51:41 -0800 (PST)
X-Google-Smtp-Source: AK7set/iNYTB1FBqTCU9sXFNdlQ/5dMi1llwc77IJ6Eg0ErLEPeYK4wC7CKolFdwitgg38Mh2xOf4g==
X-Received: by 2002:a05:600c:5008:b0:3df:e41f:8396 with SMTP id
 n8-20020a05600c500800b003dfe41f8396mr11881839wmr.37.1678186301555; 
 Tue, 07 Mar 2023 02:51:41 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:a100:e20:41da:c49b:8974?
 (p200300cbc707a1000e2041dac49b8974.dip0.t-ipconnect.de.
 [2003:cb:c707:a100:e20:41da:c49b:8974])
 by smtp.gmail.com with ESMTPSA id
 ip21-20020a05600ca69500b003eb596cbc54sm12774504wmb.0.2023.03.07.02.51.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 02:51:41 -0800 (PST)
Message-ID: <541aaa46-bef8-363d-e068-3f9adf253daa@redhat.com>
Date: Tue, 7 Mar 2023 11:51:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 9/9] async: clarify usage of barriers in the polling
 case
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, stefanha@redhat.com,
 cohuck@redhat.com, eauger@redhat.com, richard.henderson@linaro.org
References: <20230306223306.84383-1-pbonzini@redhat.com>
 <20230306223306.84383-10-pbonzini@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230306223306.84383-10-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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

On 06.03.23 23:33, Paolo Bonzini wrote:
> Explain that aio_context_notifier_poll() relies on
> aio_notify_accept() to catch all the memory writes that were
> done before ctx->notified was set to true.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   util/async.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/util/async.c b/util/async.c
> index e4b494150e7d..21016a1ac7c1 100644
> --- a/util/async.c
> +++ b/util/async.c
> @@ -474,8 +474,9 @@ void aio_notify_accept(AioContext *ctx)
>       qatomic_set(&ctx->notified, false);
>   
>       /*
> -     * Write ctx->notified before reading e.g. bh->flags.  Pairs with smp_wmb
> -     * in aio_notify.
> +     * Order reads of ctx->notified (in aio_context_notifier_poll()) and the
> +     * above clearing of ctx->notified before reads of e.g. bh->flags.  Pairs
> +     * with smp_wmb() in aio_notify.
>        */
>       smp_mb();
>   }
> @@ -498,6 +499,11 @@ static bool aio_context_notifier_poll(void *opaque)
>       EventNotifier *e = opaque;
>       AioContext *ctx = container_of(e, AioContext, notifier);
>   
> +    /*
> +     * No need for load-acquire because we just want to kick the
> +     * event loop.  aio_notify_accept() takes care of synchronizing
> +     * the event loop with the producers.
> +     */
>       return qatomic_read(&ctx->notified);
>   }
>   

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


