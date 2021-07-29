Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 263A43D9D8F
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 08:20:55 +0200 (CEST)
Received: from localhost ([::1]:40306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8zPa-00077O-7h
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 02:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8zOl-0006Qg-8H
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 02:20:03 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:52894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8zOj-0004r7-ML
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 02:20:02 -0400
Received: by mail-wm1-x335.google.com with SMTP id n11so2944887wmd.2
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 23:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SqCj+rtCUsGzFMdD+sCL6SieIcImkQv358AIUZnoiQY=;
 b=BHT08SIUffThRlCnd0xiYmALdjfJNkJiW0S1s6rxrOVDroXx/A49HS0JtYYkzsA4bL
 NNgSgEdXSjsQffE+YDJ89dCflA+48jVusgdUhQrF+c1ifKvcNETsyLvamIZTiOwyr4Xx
 vhq/v07NMbc7qJ2+xwqnT/MKq6D8wI+m7GpD+C4A41QeSShCiScJV6W877oWV6eQ3/Jd
 kIFEwYq6RlZejmSeKmC9wdLk3HWjmOhTUkyBAyXQ0xsWltg3cj8nBlWUCa6mD1jVKPXK
 GKfDHeFaLTv7xEBsNyNKkYCLgJd3KS6ueK0mBic7jInkzfTjkild3jz5Joxu/9mcsZnS
 oq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SqCj+rtCUsGzFMdD+sCL6SieIcImkQv358AIUZnoiQY=;
 b=LOx/LGutiBcA03hIqDYQyGa7G/zP8sHH9NIGS++rYkFveK9piz8+U4Fs2xMeJ5owD4
 yI0Qq1tfV8PtXIPsdBz3dTEkNHt46Mbqxyizr1qbje1P+XH+hbGu9VnY3Kraj3TeblCz
 UG+W4XNDrZHA1sJVU/gtzO0suP22j98IPYI0jnrld9Vn1rNprJmr0KlceR2taBPuU0Yl
 k5N2FfO8AVC6LaDXMu5YQ+yTA23SXDspookt4EU8eaGVQsFojzDi02xrK1DAq1sz8/Ms
 u1oFj1GD8m9ExI+xj/HCxLS1c/9TP3/lf9HKvPCFodbZgDMLzabb9SZI09gzViVL21i/
 NLDg==
X-Gm-Message-State: AOAM533whF9VF+ESuBdHYOf7yjvY/icnBTJ/WNeJVCBB36SyW0D1SNfL
 1zVQiQLubj+bbrIatWFe6FJfkwExNwJYBg==
X-Google-Smtp-Source: ABdhPJxGeIQ1fXhdrB0cwo/wIShoZiXdtiUhJ0FDE5IK2Sm0QAMth9nt6OIPKXHKpzhHVQIuAshQ4A==
X-Received: by 2002:a05:600c:d3:: with SMTP id
 u19mr12790922wmm.186.1627539599924; 
 Wed, 28 Jul 2021 23:19:59 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id 140sm2034734wmb.43.2021.07.28.23.19.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 23:19:59 -0700 (PDT)
Subject: Re: [PATCH for-6.2 01/43] hw/core: Make do_unaligned_access available
 to user-only
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b777e16d-8a5c-90bd-82cc-dc4d2b13945e@amsat.org>
Date: Thu, 29 Jul 2021 08:19:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729004647.282017-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.277,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 2:46 AM, Richard Henderson wrote:
> We shouldn't be ignoring SIGBUS for user-only.
> Move our existing TCGCPUOps hook out from CONFIG_SOFTMMU.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/hw/core/tcg-cpu-ops.h | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
> index eab27d0c03..513d6bfe72 100644
> --- a/include/hw/core/tcg-cpu-ops.h
> +++ b/include/hw/core/tcg-cpu-ops.h
> @@ -60,6 +60,13 @@ struct TCGCPUOps {
>      /** @debug_excp_handler: Callback for handling debug exceptions */
>      void (*debug_excp_handler)(CPUState *cpu);
>  
> +    /**
> +     * @do_unaligned_access: Callback for unaligned access handling
> +     */
> +    void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
> +                                MMUAccessType access_type,
> +                                int mmu_idx, uintptr_t retaddr);

Shouldn't it be QEMU_NORETURN?

