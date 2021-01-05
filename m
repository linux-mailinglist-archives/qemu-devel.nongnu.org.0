Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB852EAC3E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 14:48:46 +0100 (CET)
Received: from localhost ([::1]:37890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwmhZ-0005fi-F9
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 08:48:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwmfN-0004sy-EZ
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 08:46:29 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwmfL-0003hI-SO
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 08:46:29 -0500
Received: by mail-wr1-x429.google.com with SMTP id 91so36218562wrj.7
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 05:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Pg17M0Uo6A0KAu/38JyMj2f0H1yS1QX9sKct4Q6EXaQ=;
 b=QTSMDdz/nnJl+G6fCTwNz6oXeyP2LXJ84g2u0lea3ZrkIavC9dGuoIx8BW/yov7KHq
 W/AgEhE83lutCU7iW4YrwpCyHT5M7WVXCcAg18wIchlcKyAMyKvN7bipPXebFrLARMMc
 P5/hHwh5GoIVzjm44VozRpTHTpDk3NfV4Wk3w9xMYYE4oZFfWWVFAWuSH0fybH906Bb2
 CLn2kzLbMmfatviekXywKmgWCuowDRLUKDO8KO0ywslmpibfYrFXtwo7ThIdp8Tpo2tP
 3swoDBOIYq2CTokUG3nIPlmDMsZH4VaXdh/fXkdx1T7UvHqOBBH3g7ls64ru7STYQgOX
 OOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Pg17M0Uo6A0KAu/38JyMj2f0H1yS1QX9sKct4Q6EXaQ=;
 b=pMV82qAeJ+/6jjXKDMHCEbJ5OkqN/llZwQSUnSYW3KMdL9yJg/ckui/CXmLnTYpTT8
 xLaHUugf1NPKT3GPzh7M8gZxdv3be4TzoXnGGguxGZBi/DehUfvUP3IIFD5trdFyh7/d
 JygdDRbxGGM9a8KTqx/AmqLI84D09g4SKEBIYwID3dHC2WSqXQPC2gQ8pt2BafxmrtGz
 fYsLib/f0uAKA5X097WHnff39oH4tG9bD4GaU2bhqLJS+bIFr3EQVTeZPMb9kwxloWl3
 0N+kPVWQ6eZY9MpPwsnCA3CFEj7pKTq0Yhwg4sLF0IvLj1kP142mPT8H4Rrtoy1JAATU
 go7g==
X-Gm-Message-State: AOAM532QLXWaLPfOdQ8CfDmXGsL8zjTt3UUOup9hNWgqT+nMX7KovSAo
 A7D7RaHGeLxWT7kypJoCnbMgCaI/aKQ=
X-Google-Smtp-Source: ABdhPJxDpFMjSs3DLc2gTlqI+umH9xOPkNMxlwP4DPQFdSYrybwMZkrso7HybaxZpwacXaqMgKAg/w==
X-Received: by 2002:a5d:4104:: with SMTP id l4mr86545728wrp.340.1609854386247; 
 Tue, 05 Jan 2021 05:46:26 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id m5sm89194668wrz.18.2021.01.05.05.46.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 05:46:25 -0800 (PST)
Subject: Re: [PATCH 2/2] tcg: Introduce INDEX_op_qemu_st8_i32
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201211011453.475155-1-richard.henderson@linaro.org>
 <20201211011453.475155-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <218c430a-9151-576b-2e1a-5a6db91dbb31@amsat.org>
Date: Tue, 5 Jan 2021 14:46:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201211011453.475155-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.249,
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

On 12/11/20 2:14 AM, Richard Henderson wrote:
> Enable this on i386 to restrict the set of input registers
> for an 8-bit store, as required by the architecture.  This
> removes the last use of scratch registers for user-only mode.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg-opc.h     |  5 +++++
>  tcg/aarch64/tcg-target.h  |  1 +
>  tcg/arm/tcg-target.h      |  1 +
>  tcg/i386/tcg-target.h     |  3 +++
>  tcg/mips/tcg-target.h     |  1 +
>  tcg/ppc/tcg-target.h      |  1 +
>  tcg/riscv/tcg-target.h    |  1 +
>  tcg/s390/tcg-target.h     |  1 +
>  tcg/sparc/tcg-target.h    |  1 +
>  tcg/tci/tcg-target.h      |  1 +
>  tcg/optimize.c            |  1 +
>  tcg/tcg-op.c              |  6 +++++-
>  tcg/tcg.c                 |  4 ++++
>  tcg/README                |  5 +++++
>  tcg/i386/tcg-target.c.inc | 29 ++++++++++++++++++-----------
>  15 files changed, 49 insertions(+), 12 deletions(-)
...

> diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
> index 01588cdcb4..f8e9a24e3b 100644
> --- a/tcg/i386/tcg-target.c.inc
> +++ b/tcg/i386/tcg-target.c.inc
> @@ -245,11 +245,21 @@ static const char *target_parse_constraint(TCGArgConstraint *ct,
>          ct->regs |= ALL_VECTOR_REGS;
>          break;
>  
> -        /* qemu_ld/st address constraint */
>      case 'L':
> +        /* qemu_ld/st data+address constraint */
>          ct->regs = TCG_TARGET_REG_BITS == 64 ? 0xffff : 0xff;
> +#ifdef CONFIG_SOFTMMU
>          tcg_regset_reset_reg(ct->regs, TCG_REG_L0);
>          tcg_regset_reset_reg(ct->regs, TCG_REG_L1);
> +#endif
> +        break;
> +    case 's':
> +        /* qemu_st8_i32 data constraint */
> +        ct->regs = 0xf;
> +#ifdef CONFIG_SOFTMMU
> +        tcg_regset_reset_reg(ct->regs, TCG_REG_L0);
> +        tcg_regset_reset_reg(ct->regs, TCG_REG_L1);
> +#endif
>          break;
>  
>      case 'e':
> @@ -2120,7 +2130,6 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
>                                     TCGReg base, int index, intptr_t ofs,
>                                     int seg, MemOp memop)
>  {
> -    const TCGReg scratch = TCG_REG_L0;
>      bool use_movbe = false;
>      int movop = OPC_MOVL_EvGv;
>  
> @@ -2136,15 +2145,8 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
>  
>      switch (memop & MO_SIZE) {
>      case MO_8:
> -        /*
> -         * In 32-bit mode, 8-bit stores can only happen from [abcd]x.
> -         * TODO: Adjust constraints such that this is is forced,
> -         * then we won't need a scratch at all for user-only.
> -         */
> -        if (TCG_TARGET_REG_BITS == 32 && datalo >= 4) {
> -            tcg_out_mov(s, TCG_TYPE_I32, scratch, datalo);
> -            datalo = scratch;
> -        }
> +        /* This is handled with constraints on INDEX_op_qemu_st8_i32. */
> +        tcg_debug_assert(TCG_TARGET_REG_BITS == 64 || datalo < 4);
>          tcg_out_modrm_sib_offset(s, OPC_MOVB_EvGv + P_REXB_R + seg,
>                                   datalo, base, index, 0, ofs);
>          break;
> @@ -2491,6 +2493,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
>          tcg_out_qemu_ld(s, args, 1);
>          break;
>      case INDEX_op_qemu_st_i32:
> +    case INDEX_op_qemu_st8_i32:
>          tcg_out_qemu_st(s, args, 0);
>          break;
>      case INDEX_op_qemu_st_i64:
> @@ -2949,9 +2952,11 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
>      static const TCGTargetOpDef r_0_ci = { .args_ct_str = { "r", "0", "ci" } };
>      static const TCGTargetOpDef r_L = { .args_ct_str = { "r", "L" } };
>      static const TCGTargetOpDef L_L = { .args_ct_str = { "L", "L" } };
> +    static const TCGTargetOpDef s_L = { .args_ct_str = { "s", "L" } };
>      static const TCGTargetOpDef r_L_L = { .args_ct_str = { "r", "L", "L" } };
>      static const TCGTargetOpDef r_r_L = { .args_ct_str = { "r", "r", "L" } };
>      static const TCGTargetOpDef L_L_L = { .args_ct_str = { "L", "L", "L" } };
> +    static const TCGTargetOpDef s_L_L = { .args_ct_str = { "s", "L", "L" } };
>      static const TCGTargetOpDef r_r_L_L
>          = { .args_ct_str = { "r", "r", "L", "L" } };
>      static const TCGTargetOpDef L_L_L_L
> @@ -3145,6 +3150,8 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
>          return TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? &r_L : &r_L_L;
>      case INDEX_op_qemu_st_i32:
>          return TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? &L_L : &L_L_L;
> +    case INDEX_op_qemu_st8_i32:
> +        return TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? &s_L : &s_L_L;
>      case INDEX_op_qemu_ld_i64:
>          return (TCG_TARGET_REG_BITS == 64 ? &r_L
>                  : TARGET_LONG_BITS <= TCG_TARGET_REG_BITS ? &r_r_L
> 

Again, another review from a x86 developer welcomed.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

