Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 131D936E5D7
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 09:23:00 +0200 (CEST)
Received: from localhost ([::1]:45378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc10l-00046S-4Z
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 03:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc0yH-0002l8-5J
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:20:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lc0yE-0007tJ-4z
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 03:20:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619680821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5gJ1sDyySLIW59/+rvhVuPm4u8US9cchsJbbeyBusSI=;
 b=e2kUDbRB4E+KKT75vrFVEj6v1tWKsFP590E4kXthaDTyJqEx0H1Ct/JluQZjzUVw+qw8ld
 ZKPzA8jfMV/Sf5AOL5gqNiIC4s59utaVrzEQMfhdBUghyn390jhiQQqcfsq1x130BI4h/+
 D+FA+pCEokoQVbUip7jcSo7xz1TMg2g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-7mwPaHyWMzuuvK2L3QR-Xg-1; Thu, 29 Apr 2021 03:20:19 -0400
X-MC-Unique: 7mwPaHyWMzuuvK2L3QR-Xg-1
Received: by mail-wm1-f72.google.com with SMTP id
 v186-20020a1cacc30000b0290137364410e2so4380930wme.3
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 00:20:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=5gJ1sDyySLIW59/+rvhVuPm4u8US9cchsJbbeyBusSI=;
 b=aoyhiqKjbZhfzu26/+Ew4C7/ykUZcwV/f1O79Z45F7GBVCw/kgp3/oZCe1iMv7a1Jm
 EIZT1cBqnSvSKJ9mLR2ccKJUW/tjalN7uiYJL+fCuUgftGeZD/FTbiwi9f01Ktq79tme
 ci91CiR08FyKXCA3PoXv51cuvBBbJjvgy0tiDbrbf3Im3EMqGhjNmk6J+fZeDbK+1DKx
 ccl54Q+BhFzcrwao/x/5C1A3+TWUuwYmSSAFgpqyN6bru/DxHqiX46xOtXFtgZJliA/8
 ZtI93qWMr2zLbK3M7024dLpLmthWuuS6xp/5nX8awqN0pmpUW0CuiRO8EQJOJR8PS8WZ
 QvGg==
X-Gm-Message-State: AOAM530mfSTU3SoI2NH1rU54OFYsxayJGWuiHfNfmhcplToWOuzsqgn1
 dLvKlhRHZWDwyiZkpzaNpOoOLi29/oEzmICCmIM+myYVU5OmImzDNIrCQLABAm+nKdPtALdLleX
 MHvozpts8mPuqIeQ=
X-Received: by 2002:a05:600c:d5:: with SMTP id
 u21mr35155159wmm.153.1619680818049; 
 Thu, 29 Apr 2021 00:20:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkGNs0po4iNqmvjd1t30FqgWAAJP4SRsuH/ly3IYHtqOCWRhBnf3traj78kvBRFpAxdHn4Jw==
X-Received: by 2002:a05:600c:d5:: with SMTP id
 u21mr35155135wmm.153.1619680817825; 
 Thu, 29 Apr 2021 00:20:17 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6158.dip0.t-ipconnect.de. [91.12.97.88])
 by smtp.gmail.com with ESMTPSA id
 r18sm3723418wrs.90.2021.04.29.00.20.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 00:20:17 -0700 (PDT)
Subject: Re: [PATCH v2 10/15] linux-user/s390x: Set psw.mask properly for the
 signal handler
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210428193408.233706-1-richard.henderson@linaro.org>
 <20210428193408.233706-11-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <3534d6c2-e5b0-a3b2-47b6-867d1305cc5e@redhat.com>
Date: Thu, 29 Apr 2021 09:20:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210428193408.233706-11-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: thuth@redhat.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.04.21 21:34, Richard Henderson wrote:
> Note that PSW_ADDR_{64,32} are called PSW_MASK_{EA,BA}
> in the kernel source.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/s390x/signal.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
> index 64a9eab097..17f617c655 100644
> --- a/linux-user/s390x/signal.c
> +++ b/linux-user/s390x/signal.c
> @@ -162,6 +162,9 @@ void setup_frame(int sig, struct target_sigaction *ka,
>   
>       /* Set up registers for signal handler */
>       env->regs[15] = frame_addr;
> +    /* Force default amode and default user address space control. */
> +    env->psw.mask = PSW_MASK_64 | PSW_MASK_32 | PSW_ASC_PRIMARY
> +                  | (env->psw.mask & ~PSW_MASK_ASC);
>       env->psw.addr = ka->_sa_handler;
>   
>       env->regs[2] = sig; //map_signal(sig);
> @@ -215,6 +218,9 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>   
>       /* Set up registers for signal handler */
>       env->regs[15] = frame_addr;
> +    /* Force default amode and default user address space control. */
> +    env->psw.mask = PSW_MASK_64 | PSW_MASK_32 | PSW_ASC_PRIMARY
> +                  | (env->psw.mask & ~PSW_MASK_ASC);
>       env->psw.addr = ka->_sa_handler;
>   
>       env->regs[2] = sig; //map_signal(sig);
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


