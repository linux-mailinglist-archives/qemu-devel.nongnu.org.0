Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE30396CB5
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 07:19:34 +0200 (CEST)
Received: from localhost ([::1]:43532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnwoP-00050Q-Ul
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 01:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lnwnW-0004Jg-Ma
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 01:18:38 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lnwnT-0005hX-Ee
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 01:18:38 -0400
Received: by mail-wr1-x434.google.com with SMTP id l2so5356238wrw.6
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 22:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gz0d9vXH33E7go0Xhj0LRdMFT7s+/7CoYK7KJ7HlfyE=;
 b=OI5j3EZgUC37+F4RPvKl/VYiyBU8ytVtCCeDI98R1vnLtFRTta/LvpOSnpp+wqlERd
 XCZrWa2naxpYQRkIbrU79atfGZvJzr2mE3z2NMkCsYveI8lkFQdEGAmeIOkdQDbKTa5o
 nd4A7YUflh5tcJYI3/ji1Xe62eE16mqXSrB8IV9cALd2Pyy06a6jotb10RHUoeGjEZWV
 TZElmsiHkEufpAmKmD5TKJj3fZesplACoJOGH9jbNSZBN5Y+vJQWO3GN4qFY2uAVdvVi
 Jn37JmgGxCI8ttbwo2Hv3qf+pw0z4uOUZqViT960/VGKGB9V9ks421nlMnsyscN1LN8Y
 Xrxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gz0d9vXH33E7go0Xhj0LRdMFT7s+/7CoYK7KJ7HlfyE=;
 b=mT9PWnE/oz1a/dJEk0J3J/jl23mnwlV+23h3YFgZzLfvn4jJydUGhQNIp2VgU68oQM
 iKbGRHZUsFnY6ZOydlSqeqkVPHtWrLt2yuTSzuqEHUXaT2Gree1pHPWa1YhiBlJhLkyx
 UgLjslCTC5rK53MpcWk5Yq/J8mjq0/o9aWeOjup3IK8eHcezq0lhDqffJgDnIAlGcc0M
 KAEkC2LdXFvxVJ5ohExfsS9MCrEOL9RuJNXLMZEHPHlFaLd0cL+aLEyI4leXslYtqAEd
 dA96kzuMcxpGlhmjGVe77iCJ+Y7Nt/A0Lbd/R/E7Jlp/tBQBvPh4M4Fl1Aqz9A+ZTi7b
 h9yA==
X-Gm-Message-State: AOAM5321h6aCMjXqI8LQ+Z2NlE4VwA6fPHgYGYwLfCToyHFA4+6K0WuC
 lydb19hohWbC10bkkr7HZVdtoEOyfp00+g==
X-Google-Smtp-Source: ABdhPJwsnTMCT0JIni10zAk8zFum1kydJfyigheDm9nS1U1NftqFn/uCs42wN5k6x40LpebDmgyXZA==
X-Received: by 2002:a05:6000:1447:: with SMTP id
 v7mr6458685wrx.252.1622524712884; 
 Mon, 31 May 2021 22:18:32 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id f8sm16429841wmg.43.2021.05.31.22.18.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 22:18:32 -0700 (PDT)
Subject: Re: [PATCH v6 11/26] tcg/tci: Use ffi for calls
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
 <20210502235727.1979457-12-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2d6171f6-146c-3fe8-1078-fce144769bc7@amsat.org>
Date: Tue, 1 Jun 2021 07:18:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210502235727.1979457-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.591,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 1:57 AM, Richard Henderson wrote:
> This requires adjusting where arguments are stored.
> Place them on the stack at left-aligned positions.
> Adjust the stack frame to be at entirely positive offsets.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg.h        |   1 +
>  tcg/tci/tcg-target.h     |   2 +-
>  tcg/tcg.c                |  64 +++++++++++++------
>  tcg/tci.c                | 135 ++++++++++++++++++++++-----------------
>  tcg/tci/tcg-target.c.inc |  50 +++++++--------
>  5 files changed, 148 insertions(+), 104 deletions(-)
> 
> diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
> index 0f0695e90d..e5573a9877 100644
> --- a/include/tcg/tcg.h
> +++ b/include/tcg/tcg.h
> @@ -53,6 +53,7 @@
>  #define MAX_OPC_PARAM (4 + (MAX_OPC_PARAM_PER_ARG * MAX_OPC_PARAM_ARGS))
>  
>  #define CPU_TEMP_BUF_NLONGS 128
> +#define TCG_STATIC_FRAME_SIZE  (CPU_TEMP_BUF_NLONGS * sizeof(long))
>  
>  /* Default target word size to pointer size.  */
>  #ifndef TCG_TARGET_REG_BITS
> diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
> index 52af6d8bc5..4df10e2e83 100644
> --- a/tcg/tci/tcg-target.h
> +++ b/tcg/tci/tcg-target.h
> @@ -161,7 +161,7 @@ typedef enum {
>  
>  /* Used for function call generation. */
>  #define TCG_TARGET_CALL_STACK_OFFSET    0
> -#define TCG_TARGET_STACK_ALIGN          16
> +#define TCG_TARGET_STACK_ALIGN          8

Is this FFI_SIZEOF_ARG?

>  
>  #define HAVE_TCG_QEMU_TB_EXEC
...
>  static void tci_args_rr(const uint8_t **tb_ptr,
>                          TCGReg *r0, TCGReg *r1)
>  {
> @@ -487,11 +479,13 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
>  {
>      const uint8_t *tb_ptr = v_tb_ptr;
>      tcg_target_ulong regs[TCG_TARGET_NB_REGS];
> -    long tcg_temps[CPU_TEMP_BUF_NLONGS];
> -    uintptr_t sp_value = (uintptr_t)(tcg_temps + CPU_TEMP_BUF_NLONGS);
> +    uint64_t stack[(TCG_STATIC_CALL_ARGS_SIZE + TCG_STATIC_FRAME_SIZE)
> +                   / sizeof(uint64_t)];

Why not simply use a char* array? Ah I see later "call_slots[i] =
&stack[i];", OK.

> +    void *call_slots[TCG_STATIC_CALL_ARGS_SIZE / sizeof(uint64_t)];
>  
>      regs[TCG_AREG0] = (tcg_target_ulong)env;
> -    regs[TCG_REG_CALL_STACK] = sp_value;
> +    regs[TCG_REG_CALL_STACK] = (uintptr_t)stack;
> +    call_slots[0] = NULL;

Maybe add a comment "Other slots initialization delayed (see below)"?

>      tci_assert(tb_ptr);
>  
>      for (;;) {
> @@ -509,40 +503,58 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
>  #endif
>          TCGMemOpIdx oi;
>          int32_t ofs;
> -        void *ptr;
> +        void *ptr, *cif;
>  
>          /* Skip opcode and size entry. */
>          tb_ptr += 2;
>  
>          switch (opc) {
>          case INDEX_op_call:
> -            tci_args_l(&tb_ptr, &ptr);
> +            /*
> +             * Set up the ffi_avalue array once, delayed until now
> +             * because many TB's do not make any calls. In tcg_gen_callN,
> +             * we arranged for every real argument to be "left-aligned"
> +             * in each 64-bit slot.
> +             */
> +            if (unlikely(call_slots[0] == NULL)) {
> +                for (int i = 0; i < ARRAY_SIZE(call_slots); ++i) {
> +                    call_slots[i] = &stack[i];
> +                }
> +            }
> +
> +            tci_args_nll(&tb_ptr, &len, &ptr, &cif);

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

