Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 330F433E2A1
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 01:30:20 +0100 (CET)
Received: from localhost ([::1]:58066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMK4p-0008Cf-7G
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 20:30:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMK2l-0007gX-7p
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 20:28:11 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:45569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMK2j-0007eh-PV
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 20:28:11 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 r10-20020a05600c35cab029010c946c95easo317077wmq.4
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 17:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GorYu64IIJLHfr3W5pPGTPxmoWxHUxS9az3fx03Y8Ks=;
 b=mevwRa0QZfzkUWcuyLnNq2Cxh0wADkC87RmczkpGfSkagsd5GcY/soHGsnQiizIS+m
 9TfnfjJCCwfoPe6OOG3JaE74IzPAwLlyiwHosc5uyyqrztXbYSudDK8cynVlBMjfR5Ci
 N/f04s1h7LW0PfImHwjZrPKvu4akHeZKta3IjdzAmqSqeE4AfIUV60flTSoT3QuFlrDk
 C/t4rcSSkMwZm+8oqn75w/5nqptroVug3xgFGArlTs9IvpMMj3Bm9TQnG90Jrjn+HNau
 o6rqUC0m/2e7ONLseJ2DpphU+PaEjbMT2St5qoZ5bzJzRjXwYu0ibte4Ek6cLirNsbH/
 XiwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GorYu64IIJLHfr3W5pPGTPxmoWxHUxS9az3fx03Y8Ks=;
 b=K7BoaklgKkY07eT2QjHKl2gwrC19vPGAMR6nD1bMHWtb2ox6QYnXh/O32lz8okbeUt
 QQdEjFeRJD0/lAcmhhDp7vQGljLYpEBrgMCzZIQyVr8lgb7/aK8dYqCu4wI9+U3snT8y
 1InwxFwKD6rIA31RJ6oVFgQ0nDlydTXy9s7mdD0+z8dc08uw+MYJLZrl61NRzw08k4KB
 0fuagcDx8i9Zpje9buN9EeKFwQzev9cGoegKS7eKJcfnho7tfeWmNCJ0MV7JrDp6zQO9
 FJOHTazC7nIOvWFSQ9/zafF0+mxHRw+YIL0tSUxBhFdxbfw8qYk+iY8/aPBa9ljGGn1l
 P5jw==
X-Gm-Message-State: AOAM531p9k8L+kabR7p0ghM3J8ko0wF+daIZfOjlzXDoqYMdA/MCMadC
 Qr/nH7DHanT2CMN8IfaV3TU=
X-Google-Smtp-Source: ABdhPJyUCk9x83XGyRLoP0inSf5Ctvwf48at7Q1SpEUGneeLXtlYaAqk05lGJIPeUSbmBwgUpH5oxw==
X-Received: by 2002:a05:600c:204f:: with SMTP id
 p15mr1114269wmg.165.1615940888133; 
 Tue, 16 Mar 2021 17:28:08 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id s8sm24624466wrn.97.2021.03.16.17.28.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 17:28:07 -0700 (PDT)
Subject: Re: [PATCH v5 13/57] tcg/tci: Reuse tci_args_l for goto_tb
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7f95b318-3c99-a867-2d87-e2329a14f4b1@amsat.org>
Date: Wed, 17 Mar 2021 01:28:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 3:39 PM, Richard Henderson wrote:
> Convert to indirect jumps, as it's less complicated.
> Then we just have a pointer to the tb address at which
> the chain is stored, from which we read.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci/tcg-target.h     | 11 +++--------
>  tcg/tci.c                |  8 +++-----
>  tcg/tci/tcg-target.c.inc | 13 +++----------
>  3 files changed, 9 insertions(+), 23 deletions(-)
> 
> diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
> index 9c0021a26f..9285c930a2 100644
> --- a/tcg/tci/tcg-target.h
> +++ b/tcg/tci/tcg-target.h
> @@ -87,7 +87,7 @@
>  #define TCG_TARGET_HAS_muluh_i32        0
>  #define TCG_TARGET_HAS_mulsh_i32        0
>  #define TCG_TARGET_HAS_goto_ptr         0
> -#define TCG_TARGET_HAS_direct_jump      1
> +#define TCG_TARGET_HAS_direct_jump      0
>  #define TCG_TARGET_HAS_qemu_st8_i32     0
>  
>  #if TCG_TARGET_REG_BITS == 64
> @@ -174,12 +174,7 @@ void tci_disas(uint8_t opc);
>  
>  #define TCG_TARGET_HAS_MEMORY_BSWAP     1
>  
> -static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
> -                                            uintptr_t jmp_rw, uintptr_t addr)
> -{
> -    /* patch the branch destination */
> -    qatomic_set((int32_t *)jmp_rw, addr - (jmp_rx + 4));
> -    /* no need to flush icache explicitly */
> -}
> +/* not defined -- call should be eliminated at compile time */
> +void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
>  
>  #endif /* TCG_TARGET_H */
> diff --git a/tcg/tci.c b/tcg/tci.c
> index 6fbbc48ecf..3fe0831b33 100644
> --- a/tcg/tci.c
> +++ b/tcg/tci.c
> @@ -816,13 +816,11 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
>              return (uintptr_t)ptr;
>  
>          case INDEX_op_goto_tb:
> -            /* Jump address is aligned */
> -            tb_ptr = QEMU_ALIGN_PTR_UP(tb_ptr, 4);
> -            t0 = qatomic_read((int32_t *)tb_ptr);
> -            tb_ptr += sizeof(int32_t);
> +            tci_args_l(&tb_ptr, &ptr);
>              tci_assert(tb_ptr == old_code_ptr + op_size);
> -            tb_ptr += (int32_t)t0;
> +            tb_ptr = *(void **)ptr;
>              continue;
> +
>          case INDEX_op_qemu_ld_i32:
>              t0 = *tb_ptr++;
>              taddr = tci_read_ulong(regs, &tb_ptr);
> diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
> index ff8040510f..2c64b4f617 100644
> --- a/tcg/tci/tcg-target.c.inc
> +++ b/tcg/tci/tcg-target.c.inc
> @@ -405,16 +405,9 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
>          break;
>  
>      case INDEX_op_goto_tb:
> -        if (s->tb_jmp_insn_offset) {
> -            /* Direct jump method. */
> -            /* Align for atomic patching and thread safety */
> -            s->code_ptr = QEMU_ALIGN_PTR_UP(s->code_ptr, 4);
> -            s->tb_jmp_insn_offset[args[0]] = tcg_current_code_size(s);
> -            tcg_out32(s, 0);
> -        } else {
> -            /* Indirect jump method. */
> -            TODO();
> -        }
> +        tcg_debug_assert(s->tb_jmp_insn_offset == 0);
> +        /* indirect jump method. */
> +        tcg_out_i(s, (uintptr_t)(s->tb_jmp_target_addr + args[0]));
>          set_jmp_reset_offset(s, args[0]);
>          break;
> 

Lovely KISS!

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

