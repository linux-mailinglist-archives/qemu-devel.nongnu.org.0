Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A12E6FB03E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 14:38:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw07p-000668-Hd; Mon, 08 May 2023 08:37:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pw07n-00065W-KL
 for qemu-devel@nongnu.org; Mon, 08 May 2023 08:37:55 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pw07k-00076p-B0
 for qemu-devel@nongnu.org; Mon, 08 May 2023 08:37:55 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1927718b240so2850334fac.1
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 05:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1683549467; x=1686141467;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i5vIWyZvbakiL3+wI4z7F6gn4eoS+eEGsZFQMFmufaw=;
 b=pFN88kpBLlVMMURwcJeLX7jSZxJ+I1293imyhNiOw1UW8vYZJdWxXRxs9uJhJXAmxN
 64kgFRpeXKJat0XhXls/mLQb/+Gj2UJAcpi8txqsnyXe0E0wZhInxdgdOxBDbncx+qFj
 vA5hb9hefn4pno81gY+ijxtOxb/zHx7d/jwS/59pBow1HBf7iJiM9jXVPgjG6cS+TOnF
 +mUjxt3H7zEc1BD1SUAj2MA6IPmYpnwKtHQyRYGmeEqsfF+urrZ8JpibfwW9o1kc6Rjs
 UTS4x9nFQDQG3wplSCx/X1/GVuD6ZPlDLzQog7pW2bGGvp1J+m1pQkQ2Wua0d1nquCzB
 F8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683549467; x=1686141467;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i5vIWyZvbakiL3+wI4z7F6gn4eoS+eEGsZFQMFmufaw=;
 b=Ftqnr7PcF6TZUZznxvnxEcqtdpyxrGOt9XFn7udAAlaKg3uwoXUM63YacMz8ZTGlsU
 FRnn8qyu858MqmKxpR2R+goMaLWvSwkqbsK7bEK4uFfxaz19qrpAbQQ+VhnDtX0b+ZwX
 Mcfq9rfAqeoZhKyBgpRgUu6+5XJAreZRYg9wRjyMSK3OcUHe7P7FTKhgat5QX8z2rPVt
 qeKM3Mtw3UHD7u7Sk71hfpdx9Cymfb8QjSkfyJiAsE7K8kE7hRGLDnO6Np2OwdFFPtQm
 YrZHT2CFy8F18CgXZHfvkC8nRMJ3ShbkbzqJyrURaWsQwedJ2klQM24HAX4H9LSmsCv5
 KoLg==
X-Gm-Message-State: AC+VfDypbCrElEoVnpfj45HxLOTbw9XFwIOQif02bwWgYh+2hmzYsJHz
 ahiXuwEx7a2NBE0Yg8tJqQWg+A==
X-Google-Smtp-Source: ACHHUZ6bfUFyqIwrJsixXezTqpJuvT/0MXMY/Kf3fwTGWYYG6lpEmJmqet4VUscTZLRi42tqb+R7fQ==
X-Received: by 2002:a05:6870:8c31:b0:18b:999:aa27 with SMTP id
 ec49-20020a0568708c3100b0018b0999aa27mr5049491oab.52.1683549467666; 
 Mon, 08 May 2023 05:37:47 -0700 (PDT)
Received: from [192.168.68.107] (189-46-207-53.dsl.telesp.net.br.
 [189.46.207.53]) by smtp.gmail.com with ESMTPSA id
 q1-20020a4ae641000000b0054f80ba6c55sm986499oot.4.2023.05.08.05.37.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 05:37:47 -0700 (PDT)
Message-ID: <aba4b7e7-b0cc-9c12-de9c-ad5a5e02b288@ventanamicro.com>
Date: Mon, 8 May 2023 09:37:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 02/11] tcg/riscv: Probe for Zba, Zbb, Zicond extensions
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230503085657.1814850-1-richard.henderson@linaro.org>
 <20230503085657.1814850-3-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230503085657.1814850-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.802,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 5/3/23 05:56, Richard Henderson wrote:
> Define a useful subset of the extensions.  Probe for them
> via compiler pre-processor feature macros and SIGILL.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   tcg/riscv/tcg-target.h     |  6 +++
>   tcg/riscv/tcg-target.c.inc | 96 ++++++++++++++++++++++++++++++++++++++
>   2 files changed, 102 insertions(+)
> 
> diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
> index 494c986b49..863ac8ba2f 100644
> --- a/tcg/riscv/tcg-target.h
> +++ b/tcg/riscv/tcg-target.h
> @@ -90,6 +90,12 @@ typedef enum {
>   #define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_NORMAL
>   #define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_NORMAL
>   
> +#if defined(__riscv_arch_test) && defined(__riscv_zbb)
> +# define have_zbb true
> +#else
> +extern bool have_zbb;
> +#endif
> +
>   /* optional instructions */
>   #define TCG_TARGET_HAS_movcond_i32      0
>   #define TCG_TARGET_HAS_div_i32          1
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 4dd33c73e8..49ff9c8b9d 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -113,6 +113,20 @@ static const int tcg_target_call_iarg_regs[] = {
>       TCG_REG_A7,
>   };
>   
> +#ifndef have_zbb
> +bool have_zbb;
> +#endif
> +#if defined(__riscv_arch_test) && defined(__riscv_zba)
> +# define have_zba true
> +#else
> +static bool have_zba;
> +#endif
> +#if defined(__riscv_arch_test) && defined(__riscv_zicond)
> +# define have_zicond true
> +#else
> +static bool have_zicond;
> +#endif
> +
>   static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
>   {
>       tcg_debug_assert(kind == TCG_CALL_RET_NORMAL);
> @@ -234,6 +248,34 @@ typedef enum {
>   
>       OPC_FENCE = 0x0000000f,
>       OPC_NOP   = OPC_ADDI,   /* nop = addi r0,r0,0 */
> +
> +    /* Zba: Bit manipulation extension, address generation */
> +    OPC_ADD_UW = 0x0800003b,
> +
> +    /* Zbb: Bit manipulation extension, basic bit manipulaton */
> +    OPC_ANDN   = 0x40007033,
> +    OPC_CLZ    = 0x60001013,
> +    OPC_CLZW   = 0x6000101b,
> +    OPC_CPOP   = 0x60201013,
> +    OPC_CPOPW  = 0x6020101b,
> +    OPC_CTZ    = 0x60101013,
> +    OPC_CTZW   = 0x6010101b,
> +    OPC_ORN    = 0x40006033,
> +    OPC_REV8   = 0x6b805013,
> +    OPC_ROL    = 0x60001033,
> +    OPC_ROLW   = 0x6000103b,
> +    OPC_ROR    = 0x60005033,
> +    OPC_RORW   = 0x6000503b,
> +    OPC_RORI   = 0x60005013,
> +    OPC_RORIW  = 0x6000501b,
> +    OPC_SEXT_B = 0x60401013,
> +    OPC_SEXT_H = 0x60501013,
> +    OPC_XNOR   = 0x40004033,
> +    OPC_ZEXT_H = 0x0800403b,
> +
> +    /* Zicond: integer conditional operations */
> +    OPC_CZERO_EQZ = 0x0e005033,
> +    OPC_CZERO_NEZ = 0x0e007033,
>   } RISCVInsn;
>   
>   /*
> @@ -1612,8 +1654,62 @@ static void tcg_target_qemu_prologue(TCGContext *s)
>       tcg_out_opc_imm(s, OPC_JALR, TCG_REG_ZERO, TCG_REG_RA, 0);
>   }
>   
> +static volatile sig_atomic_t got_sigill;
> +
> +static void sigill_handler(int signo, siginfo_t *si, void *data)
> +{
> +    /* Skip the faulty instruction */
> +    ucontext_t *uc = (ucontext_t *)data;
> +    uc->uc_mcontext.__gregs[REG_PC] += 4;
> +
> +    got_sigill = 1;
> +}
> +
> +static void tcg_target_detect_isa(void)
> +{
> +#if !defined(have_zba) || !defined(have_zbb) || !defined(have_zicond)
> +    /*
> +     * TODO: It is expected that this will be determinable via
> +     * linux riscv_hwprobe syscall, not yet merged.
> +     * In the meantime, test via sigill.
> +     */
> +
> +    struct sigaction sa_old, sa_new;
> +
> +    memset(&sa_new, 0, sizeof(sa_new));
> +    sa_new.sa_flags = SA_SIGINFO;
> +    sa_new.sa_sigaction = sigill_handler;
> +    sigaction(SIGILL, &sa_new, &sa_old);
> +
> +#ifndef have_zba
> +    /* Probe for Zba: add.uw zero,zero,zero. */
> +    got_sigill = 0;
> +    asm volatile(".insn %0" : : "i"(OPC_ADD_UW) : "memory");
> +    have_zba = !got_sigill;
> +#endif
> +
> +#ifndef have_zbb
> +    /* Probe for Zba: andn zero,zero,zero. */
> +    got_sigill = 0;
> +    asm volatile(".insn %0" : : "i"(OPC_ANDN) : "memory");
> +    have_zbb = !got_sigill;
> +#endif
> +
> +#ifndef have_zicond
> +    /* Probe for Zicond: czero.eqz zero,zero,zero. */
> +    got_sigill = 0;
> +    asm volatile(".insn %0" : : "i"(OPC_CZERO_EQZ) : "memory");
> +    have_zicond = !got_sigill;
> +#endif
> +
> +    sigaction(SIGILL, &sa_old, NULL);
> +#endif
> +}
> +
>   static void tcg_target_init(TCGContext *s)
>   {
> +    tcg_target_detect_isa();
> +
>       tcg_target_available_regs[TCG_TYPE_I32] = 0xffffffff;
>       tcg_target_available_regs[TCG_TYPE_I64] = 0xffffffff;
>   

