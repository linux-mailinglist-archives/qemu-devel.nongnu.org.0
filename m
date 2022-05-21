Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D6F52F8C6
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 06:54:19 +0200 (CEST)
Received: from localhost ([::1]:59596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsH86-0003Hl-FU
	for lists+qemu-devel@lfdr.de; Sat, 21 May 2022 00:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsH5W-0002WD-7M
 for qemu-devel@nongnu.org; Sat, 21 May 2022 00:51:38 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:37409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsH5U-0008Dq-8X
 for qemu-devel@nongnu.org; Sat, 21 May 2022 00:51:37 -0400
Received: by mail-pf1-x42f.google.com with SMTP id bo5so9281584pfb.4
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 21:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=s0a8SCWwFgknN9TuupinAVlrcGdOhN2zWbBgKH291M8=;
 b=rYqsS6Djb7Vf93K9B6/PHnKa0u4Kavs8MVWahBizjwbWDX89k1niF2xAyzBLjyv6Dx
 R3b2vyl/QhlvLkoX1xu4QYHnNS6yXRezEG4LxebGw8nuh3719lCbk+x8unwxiX+dUVCi
 r6dS3a149Vdgwtwh0Cz8v8pJHbtj9+6g1LccBwiG3BA2RcGiBJ3OV4PNWJe89BRAaFmm
 xJ44J8pTPfnDAcOTNufsxWBiJzrFpqNsR/MlrwttaJ5vdGCwkOBcRCQTfKaNxcXTBauC
 YRSivuwiCXvkX6A+fvN+57kzI/NT1G1WQBMnz3eMCATawFzcckn0P9L4iBB9GGuru1iq
 +5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=s0a8SCWwFgknN9TuupinAVlrcGdOhN2zWbBgKH291M8=;
 b=vGQG/1PFnAW2yfwYfJZEd+NKEYDNgYGG69rPDkBwL5flkZ2nPlkmCIvS8NbSvPxY7k
 6zHjrLT/potqyWkKCHM+r2smnNqRsDX+0/TKErYa1ES74x7qZBwhjKgCxxD3FozoeorF
 EVgantzBQtHRzOVYf9jtqZ8GpvtJ3sg7hbD9z1wIV47Zz/xoeI00U+D6Omz5s1zvkHln
 pSF41gpAhFHNx2NO+4lBuuVnIbuiPcbXoHhuewCzbDHEgTaWuBXjZ2DV+VvluiR2VMFI
 SgAVQ460kqJkFUneDfXJoNW3oF0J4cUIVD3tbe+qSh8svBVMRf2LBCCU8jnBygPpHspe
 p3Qg==
X-Gm-Message-State: AOAM533Up4HSQu9FloTmHTCe0MeBptR4wFaEatVv9BhAbUAry8Gdk82O
 MTLNzIkTtVMwjV4g9/RJ6uV+HG+p14SGww==
X-Google-Smtp-Source: ABdhPJxw8bi0S67lSTGRKfI6ZgDMVUts1XgaRdFWqFXAd6WWV4BUYZbOLKMvQihRR3XYRuxaBZzgYQ==
X-Received: by 2002:a05:6a00:e8e:b0:4fa:a52f:59cf with SMTP id
 bo14-20020a056a000e8e00b004faa52f59cfmr13213930pfb.84.1653108691440; 
 Fri, 20 May 2022 21:51:31 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 c1-20020a170902d48100b0015e8d4eb29csm552481plg.230.2022.05.20.21.51.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 May 2022 21:51:30 -0700 (PDT)
Message-ID: <ac96f55e-8884-e763-6308-6b41a89eb46a@linaro.org>
Date: Fri, 20 May 2022 21:51:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 05/49] semihosting: Add target_strlen for
 softmmu-uaccess.h
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
 <20220521000400.454525-6-richard.henderson@linaro.org>
In-Reply-To: <20220521000400.454525-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/20/22 17:03, Richard Henderson wrote:
> Mirror the interface of the user-only function of the same name.
> Use probe_access_flags for the common case of ram, and
> cpu_memory_rw_debug for the uncommon case of mmio.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v3: Use probe_access_flags (pmm)

Ho hum.  MIPS still selects semihosting without TCG, which means that
probe_access_flags is not present.

At present I'm assuming that semihosting can't work with KVM, and that we should disable 
the feature.


r~

> ---
>   include/semihosting/softmmu-uaccess.h |  3 ++
>   semihosting/uaccess.c                 | 49 +++++++++++++++++++++++++++
>   2 files changed, 52 insertions(+)
> 
> diff --git a/include/semihosting/softmmu-uaccess.h b/include/semihosting/softmmu-uaccess.h
> index 03300376d3..4f08dfc098 100644
> --- a/include/semihosting/softmmu-uaccess.h
> +++ b/include/semihosting/softmmu-uaccess.h
> @@ -53,4 +53,7 @@ void softmmu_unlock_user(CPUArchState *env, void *p,
>                            target_ulong addr, target_ulong len);
>   #define unlock_user(s, args, len) softmmu_unlock_user(env, s, args, len)
>   
> +ssize_t softmmu_strlen_user(CPUArchState *env, target_ulong addr);
> +#define target_strlen(p) softmmu_strlen_user(env, p)
> +
>   #endif /* SEMIHOSTING_SOFTMMU_UACCESS_H */
> diff --git a/semihosting/uaccess.c b/semihosting/uaccess.c
> index 0d3b32b75d..51019b79ff 100644
> --- a/semihosting/uaccess.c
> +++ b/semihosting/uaccess.c
> @@ -8,6 +8,7 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "exec/exec-all.h"
>   #include "semihosting/softmmu-uaccess.h"
>   
>   void *softmmu_lock_user(CPUArchState *env, target_ulong addr,
> @@ -23,6 +24,54 @@ void *softmmu_lock_user(CPUArchState *env, target_ulong addr,
>       return p;
>   }
>   
> +ssize_t softmmu_strlen_user(CPUArchState *env, target_ulong addr)
> +{
> +    int mmu_idx = cpu_mmu_index(env, false);
> +    size_t len = 0;
> +
> +    while (1) {
> +        size_t left_in_page;
> +        int flags;
> +        void *h;
> +
> +        /* Find the number of bytes remaining in the page. */
> +        left_in_page = -(addr | TARGET_PAGE_MASK);
> +
> +        flags = probe_access_flags(env, addr, MMU_DATA_LOAD,
> +                                   mmu_idx, true, &h, 0);
> +        if (flags & TLB_INVALID_MASK) {
> +            return -1;
> +        }
> +        if (flags & TLB_MMIO) {
> +            do {
> +                uint8_t c;
> +                if (cpu_memory_rw_debug(env_cpu(env), addr, &c, 1, 0)) {
> +                    return -1;
> +                }
> +                if (c == 0) {
> +                    return len;
> +                }
> +                addr++;
> +                len++;
> +                if (len > INT32_MAX) {
> +                    return -1;
> +                }
> +            } while (--left_in_page != 0);
> +        } else {
> +            char *p = memchr(h, 0, left_in_page);
> +            if (p) {
> +                len += p - (char *)h;
> +                return len <= INT32_MAX ? (ssize_t)len : -1;
> +            }
> +            addr += left_in_page;
> +            len += left_in_page;
> +            if (len > INT32_MAX) {
> +                return -1;
> +            }
> +        }
> +    }
> +}
> +
>   char *softmmu_lock_user_string(CPUArchState *env, target_ulong addr)
>   {
>       /* TODO: Make this something that isn't fixed size.  */


