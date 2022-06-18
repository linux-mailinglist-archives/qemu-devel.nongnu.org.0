Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4CC550225
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jun 2022 04:50:03 +0200 (CEST)
Received: from localhost ([::1]:47706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2OXC-0000RO-Ao
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 22:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o2OVa-0007ng-Lr
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 22:48:22 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:37887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o2OVZ-0000kO-3I
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 22:48:22 -0400
Received: by mail-pf1-x430.google.com with SMTP id bo5so5613420pfb.4
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 19:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6TjHRVRoYyugwt6pdz2SQjGt2FOrJmVeXpOER5k00p0=;
 b=CuR68YH5WA6b4VBCsx6+PzyFnGUMhE8sFAkXs7/xy68iJFflMH8+0CDM90RfF0BX8u
 O6sgN0/+7yYeIp0K8j/KcgMI5OTFR57z7rlcJcFyIGUH8lnZmH2HE7SR34r03DE5iEkG
 EQWMu5XgPUIMC415ID0Wb9DFkmkCjdJkRSClJoQmDFYA+rEMfUyvRCteBTHfjB/KSXa/
 CPTAaBy08V+kFGhJWu92EZLFK50QKETCUy8ybmVCemRS2IzKG8eiDhG58P43SmURpVll
 KS7LbSeGk4Pjf6G0oH15S8lRgEi9U+XiXPRuM4beWnp4ndz5tvpDBXxcFFPkzQpnmIYp
 0gkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6TjHRVRoYyugwt6pdz2SQjGt2FOrJmVeXpOER5k00p0=;
 b=UWaKY7XG+bjLJ5CK0wv8E1o3ASW0n4MzZjAm3zBCG5AYwbcxsPq8gAiQgE3b78LKwj
 ccfonTsMEVfbCqIxSvNwNYYPL4C70zkp2aAIfR4fpB5slgcdiBc69oHpfjn+ePaROR5Y
 Vo3FPfJXO1YxBF6zqpvvgUCsVNGO7i+k9BN1YQzqM5fJVKzzsosgyVLG3JQm5EKWr9zz
 dgOZ8miMzNtg8bgSyGIwJwBl4sfHkZyGV8GOc9zKthhQcIv88E5M2Z9oBv4jH68F9udl
 8LNXLsNR/kRBaqP3Z9sWeWgymYus3M9is7B4US/GqQNgDJv3WOyf1sBLbDMqX2Oe9qU5
 K8YA==
X-Gm-Message-State: AJIora9Uw5bjAdO+n3dIsg3sw9pfK3aqyawh4uGVnuirZjfL+sSO2vJy
 chvWhNkPXK53hHvR2KO6jjKbdw==
X-Google-Smtp-Source: AGRyM1saQhNHFey9bgAxwpur0EIO8aBXzcJPRd/kUWrCTZUJbdISWFO4t6izifwUm0QBf+ZNeJo6Nw==
X-Received: by 2002:a63:7946:0:b0:408:c6ac:939b with SMTP id
 u67-20020a637946000000b00408c6ac939bmr11735117pgc.349.1655520499633; 
 Fri, 17 Jun 2022 19:48:19 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:da58:e2:88d1:d15b?
 ([2602:47:d49e:3c01:da58:e2:88d1:d15b])
 by smtp.gmail.com with ESMTPSA id
 j4-20020aa783c4000000b0051b9e224623sm4493188pfn.141.2022.06.17.19.48.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 19:48:19 -0700 (PDT)
Message-ID: <985e7a95-1e40-2a47-370c-7a0a90dc46d9@linaro.org>
Date: Fri, 17 Jun 2022 19:48:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v17 07/13] target/loongarch: remove badaddr from
 CPULoongArch
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20220616121611.3316074-1-gaosong@loongson.cn>
 <20220616121611.3316074-8-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220616121611.3316074-8-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

On 6/16/22 05:16, Song Gao wrote:
> We can use CSR_BADV to replace badaddr.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

>   target/loongarch/cpu.h     | 2 --
>   target/loongarch/gdbstub.c | 2 +-
>   2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
> index 71a5036c3c..4b4fbcdc71 100644
> --- a/target/loongarch/cpu.h
> +++ b/target/loongarch/cpu.h
> @@ -246,8 +246,6 @@ typedef struct CPUArchState {
>       uint64_t lladdr; /* LL virtual address compared against SC */
>       uint64_t llval;
>   
> -    uint64_t badaddr;
> -
>       /* LoongArch CSRs */
>       uint64_t CSR_CRMD;
>       uint64_t CSR_PRMD;
> diff --git a/target/loongarch/gdbstub.c b/target/loongarch/gdbstub.c
> index 0c48834201..24e126fb2d 100644
> --- a/target/loongarch/gdbstub.c
> +++ b/target/loongarch/gdbstub.c
> @@ -21,7 +21,7 @@ int loongarch_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
>       } else if (n == 32) {
>           return gdb_get_regl(mem_buf, env->pc);
>       } else if (n == 33) {
> -        return gdb_get_regl(mem_buf, env->badaddr);
> +        return gdb_get_regl(mem_buf, env->CSR_BADV);
>       }
>       return 0;
>   }


