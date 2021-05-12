Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E197037D388
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 20:23:51 +0200 (CEST)
Received: from localhost ([::1]:40882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgtWQ-0003s1-RO
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 14:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgtT5-0000EG-5q
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:20:23 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:41657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgtT1-0003qJ-51
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:20:22 -0400
Received: by mail-qk1-x72c.google.com with SMTP id l129so23141187qke.8
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 11:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZvY9QSjy81jn8oTFimr9EM1j8zt9ktsZmA3DSotjzSc=;
 b=u3Ea4Hu53osoDTCBvKP/b9xjyEbNkunofOeekzFJfUlcA26yzQsVsjQ0JTpS/yt1QB
 Obge2Gv8uFUlWFuHCEosTqJXcF7q3l5YuA3w70nGtVit+Bbd3xmG4NCRTM5rJMCt2BOn
 oZ0TbYsPknVKIw9ALixiavrtfzUyFya0f0IESgquzGYSVtk0xatZW/6bz6zgaG7/DZGG
 k00euIQW8EvKAafIEuUGY+sl7BCWgCXnviuRxJvPvAkGxJGFD00vEhJ4NN/jhOrA2hFf
 I3aNsdBxxI6bOj4NV9GKFYg+28tiCu8Wd75HE+L/vmT9ML6PzPJ+TK2Vu/2hZStU892N
 XvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZvY9QSjy81jn8oTFimr9EM1j8zt9ktsZmA3DSotjzSc=;
 b=coTPf7rGEe3KMGmLjKxGDBbwYk0JMn9k/rSt44FJYP/gRx8Gs3BLDJlUtzIzJANKdM
 S5NkQrdWexnNMxFBAFZExv/TEGfDyVPVnHTUfBehXwJww0IWslHAQMdLzpE1hPuiv+x7
 BpfB4VwhkaawHBWKWufkHSBBhNisPEH5nZ5bCy3+f/SYPWxmGdjzjFWcN9qTqiHy79Zr
 rHri8SugNMHheTOtoa76/GJPLIIYtZe4CUM4YWO5oZmkrcn9fWHFW54pi/UxvqUSL1bI
 RiBd+zd5heacoWE4kI+EDM58zTI8mepxOmNk5x1A2aPPoQdkffVEhknO97OM0vSYLZmX
 t5AA==
X-Gm-Message-State: AOAM532VwFHiM0aDPfsHuS8vN4qzaA4oNBL8yv8xHJ6VqVo17EfrrxFT
 /GMMF1yRuhCEAhu3AHw7Ei9bvw==
X-Google-Smtp-Source: ABdhPJzLhDbNnWaAGXZEsZFJEegspWkK5BKNCROJuNL18V+a/UiRUzqvKIiKi3g9ecoRN5RqhTESww==
X-Received: by 2002:a37:486:: with SMTP id 128mr35531525qke.23.1620843617723; 
 Wed, 12 May 2021 11:20:17 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id g64sm624284qkf.41.2021.05.12.11.20.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 11:20:17 -0700 (PDT)
Subject: Re: [PATCH 07/11] target/ppc: added KVM fallback to fpscr manipulation
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-8-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a9ac8b35-faae-167d-ff78-4b7ddd8f75c9@linaro.org>
Date: Wed, 12 May 2021 13:20:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512140813.112884-8-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 9:08 AM, Bruno Larsen (billionai) wrote:
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index 104a308abb..a8a720eb48 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -2947,3 +2947,17 @@ bool kvm_arch_cpu_check_are_resettable(void)
>   {
>       return true;
>   }
> +
> +void kvmppc_store_fpscr(CPUPPCState *env, uint64_t arg, uint32_t mask)
> +{
> +    CPUState *cs = env_cpu(env);
> +    struct kvm_one_reg reg;
> +    int ret;
> +    reg.id = KVM_REG_PPC_FPSCR;
> +    reg.addr = (uintptr_t) &env->fpscr;
> +    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> +    if (ret < 0)
> +    {
> +        fprintf(stderr, "Unable to set FPSCR to KVM: %s", strerror(errno));
> +    }
> +}

This is all unnecessary.  All you need to do is store to env->fpscr and the 
value will be synced back with kvm_put_fp.

I'll note that some of the trouble you may be having with extracting 
helper_store_fpscr to a ppc_store_fpscr function is due to an existing bug in 
the tcg code:

Storing to fpscr should *never* raise an exception -- see MTFSF, MTFSB0, 
MTFSB1.  Thus the mucking about with cs->exception_index and env->error_code is 
incorrect.

In addition, the masking is being done weirdly and could use a complete overhaul.

This could all be rewritten as

-- %< -- cpu.h

  /* Invalid operation exception summary */
- #define fpscr_ix ((env->fpscr) & ((1 << FPSCR_VXSNAN) ...
+ #define FPSCR_IX  ((1 << FPSCR_VXSNAN) | ...)

-- %< -- cpu.c

// move fpscr_set_rounding_mode here

void ppc_store_fpscr(CPUPPCState *env, target_ulong val)
{
     /* Recompute exception summary state. */
     val &= ~(FP_VX | FP_FEX);
     if (val & FPSCR_IX) {
         val |= FP_VX;
     }
     if ((val >> FPSCR_XX) & (val >> FPSCR_XE) & 0x1f) {
         val |= FP_FEX;
     }
     env->fpscr = val;
     if (tcg_enabled()) {
         fpscr_set_rounding_mode(env);
     }
}

-- %< -- fpu_helper.c

void helper_store_fpscr(CPUPPCState *env, target_ulong val,
                         uint32_t nibbles)
{
     target_ulong mask = 0;

     /* TODO: Push this expansion back to translation time. */
     for (int i = 0; i < sizeof(target_ulong) * 2; ++i) {
         if (nibbles & (1 << i)) {
             mask |= (target_ulong)0xf << (4 * i);
         }
     }

     val = (val & mask) | (env->fpscr & ~mask);
     ppc_store_fpscr(env, val);
}

void helper_fpscr_clrbit(CPUPPCState *env, uint32_t bit)
{
     uint32_t mask = 1u << bit;
     if (env->fpscr & mask) {
         ppc_store_fpscr(env, env->fpscr & ~mask);
     }
}

void helper_fpscr_setbit(CPUPPCState *env, uint32_t bit)
{
     uint32_t mask = 1u << bit;
     if (!(env->fpscr & mask)) {
         ppc_store_fpscr(env, env->fpscr | mask);
     }
}

There are a couple of other uses of fpscr_set_rounding_mode, where the 
softfloat value is changed temporarily (do_fri, VSX_ROUND).  These should 
simply save the previous softfloat value (using get_float_rounding_mode) around 
the operation instead of re-computing from fpscr.

Which leaves us with exactly one use of fpscr_set_rounding_mode, which can then 
be moved to cpu.c next to ppc_store_fpscr.


r~

