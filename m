Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD45B66AF7C
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 06:34:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGvds-0001qf-A2; Sun, 15 Jan 2023 00:33:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGvdk-0001qO-J2
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 00:33:08 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGvdi-00051P-N4
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 00:33:08 -0500
Received: by mail-pl1-x631.google.com with SMTP id d15so27283163pls.6
 for <qemu-devel@nongnu.org>; Sat, 14 Jan 2023 21:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gUbZQX/OWTbZqHeJf/hqU/N0+eY7Zb4jj0V1oO8xNB4=;
 b=TU8iBgmRUZemNwoQfSwxysJe6DsueiL5nSdbxea0G/m2M8yuPMAgsEbrW1u1Ql7rjH
 4vhxDpMj/nMZCb9a5HShhxVJJKya9xxSnUgYSV/+NzJHxwe3noOR/on1K7kXXVze2O3G
 1dfID8h2rLneExFF7LfYlqR1Xm+mStPE8JrGbLLtBjzduPqUe+VsnJlc5c450YywQfON
 2KyLsJFxFt1wgRkUmgaAvpq6a/r2IqN/uJDnY2BeyecweKiszuXI2cwnjUmlqQgCZmlq
 Utjju/vCFT9y4rspPIiVGPKHtTCuoOCAX2zPtshECeTbXdhMBl6CIwMP1fcX4GAjm2vx
 MDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gUbZQX/OWTbZqHeJf/hqU/N0+eY7Zb4jj0V1oO8xNB4=;
 b=Pj99zC+YNYVto8o67yjcxG8jCkIYEFQQBKqgdvFtmmOnGLLNwYVJ3Qq1mMPWyE9Njs
 GnwzjB39GOPz/0edApIlx+KEkWcb4E9d7O5QZlv8GVw78UrX/LvrEaR/iCVbLnt6AQLi
 vvECvegiVuPr36xfhjDt/KGJmWoqWPrBqOLVP5uGKN3fUbGRsNOC+hOXp4bdwIBbTZ2d
 B9AUxXNihnUQ1Jq5+ADnFEF0WQDqqeNFkLmwLGWJVdaoeDCco26mWf6qmBGGcN0ZyolF
 VUj8EAhyd1RIVo6uoiqiyBfDnfCW6g0WYGBaHmeKy78uQRaBA0E/lpVhJceRcyiiyERN
 FQ1Q==
X-Gm-Message-State: AFqh2kpHTdE8aCWXZKqtS3j21xaRcNpFhwQZ6GwG3KkLtPm1IQvLv4J7
 1Vwfgdo7E80K5tQf7N6nzuFDow==
X-Google-Smtp-Source: AMrXdXsRxd7e69CAaro4cKKBpdEdDXZqCCRMMyOBQM+queUxV9WbfuRdVkyVsZ5/q9D4h3g/dy41Tw==
X-Received: by 2002:a17:902:e887:b0:193:e89:f5ff with SMTP id
 w7-20020a170902e88700b001930e89f5ffmr21570083plg.28.1673760784296; 
 Sat, 14 Jan 2023 21:33:04 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 o1-20020a170902d4c100b0019320b4f832sm5776342plg.178.2023.01.14.21.33.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Jan 2023 21:33:03 -0800 (PST)
Message-ID: <b367e047-6f33-fd40-6d34-6516b01f53c7@linaro.org>
Date: Sat, 14 Jan 2023 19:32:59 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] linux-user: fix bug about incorrect base addresss of gdt
 on i386 and x86_64
Content-Language: en-US
To: fanwenjie <fanwj@mail.ustc.edu.cn>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu
References: <20230103113833.3421-1-fanwj@mail.ustc.edu.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230103113833.3421-1-fanwj@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/3/23 01:38, fanwenjie wrote:
> On linux user mode, CPUX86State::gdt::base from Different CPUX86State Objects have same value, It is incorrect! Every CPUX86State::gdt::base Must points to independent memory space.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1405
> Signed-off-by: fanwenjie <fanwj@mail.ustc.edu.cn>
> ---
>   linux-user/i386/cpu_loop.c | 9 +++++++++
>   linux-user/main.c          | 7 +++++++
>   2 files changed, 16 insertions(+)
> 
> diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
> index 865413c..48511cd 100644
> --- a/linux-user/i386/cpu_loop.c
> +++ b/linux-user/i386/cpu_loop.c
> @@ -314,8 +314,17 @@ void cpu_loop(CPUX86State *env)
>       }
>   }
>   
> +static void target_cpu_free(void *obj)
> +{
> +    CPUArchState* env = ((CPUState*)obj)->env_ptr;
> +    target_munmap(env->gdt.base, sizeof(uint64_t) * TARGET_GDT_ENTRIES);
> +    g_free(obj);
> +}
> +
>   void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
>   {
> +    CPUState* cpu = env_cpu(env);
> +    OBJECT(cpu)->free = target_cpu_free;
>       env->cr[0] = CR0_PG_MASK | CR0_WP_MASK | CR0_PE_MASK;
>       env->hflags |= HF_PE_MASK | HF_CPL_MASK;
>       if (env->features[FEAT_1_EDX] & CPUID_SSE) {
> diff --git a/linux-user/main.c b/linux-user/main.c
> index a17fed0..3acd9b4 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -234,6 +234,13 @@ CPUArchState *cpu_copy(CPUArchState *env)
>   
>       new_cpu->tcg_cflags = cpu->tcg_cflags;
>       memcpy(new_env, env, sizeof(CPUArchState));
> +#if defined(TARGET_I386) || defined(TARGET_X86_64)
> +    new_env->gdt.base = target_mmap(0, sizeof(uint64_t) * TARGET_GDT_ENTRIES,
> +                                    PROT_READ|PROT_WRITE,
> +                                    MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
> +    memcpy((void*)new_env->gdt.base, (void*)env->gdt.base, sizeof(uint64_t) * TARGET_GDT_ENTRIES);
> +    OBJECT(new_cpu)->free = OBJECT(cpu)->free;
> +#endif

This isn't a fantastic solution, because neither the ldt nor the gdt should be mapped into 
the user address space -- these are kernel private data structures. But cpu.h uses a 
target_ulong, and seg_helper.c is set up to load data from the guest, and it would be a 
medium sized job to address that.

The memcpy is definitely wrong, because you're casting a guest address into a host 
address, which is incorrect.  You have to use g2h().

I'm actually surprised that you need this for TARGET_X86_64 at all -- the two TLS segments 
don't really use the GDT at all, since fs_base and gs_base may be set directly.


r~

