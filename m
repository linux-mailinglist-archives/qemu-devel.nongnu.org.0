Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F99F33E2CE
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 01:33:48 +0100 (CET)
Received: from localhost ([::1]:60272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMK8B-00013Y-Gh
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 20:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMK6e-0000Yt-F8
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 20:32:12 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:38619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMK6c-00011o-NS
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 20:32:12 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 m20-20020a7bcb940000b029010cab7e5a9fso2421731wmi.3
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 17:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3XdBanYH6wiEX1AV9Wi8rz7py5KZ+TXCkOf1tNhTHy4=;
 b=LUKiwq+QCyICMvDkNs6rc9wUHSH9uj8W1sBW9zdpy662FjKTs85wJGT0ZuKTo7pt7j
 CvOo0bi4v6luTR/4QdDoaM55GauCU4j/X7v9THsP2m3jkc2meOIvHLnyLb53gxXwA/QY
 za4T31nvZsoaCrPIzxb32sYduVJ7Wi/fCw6ZcoaDRdI1HLuo4VJMSsoF2MQFZ0qdgNC+
 9Dk1qpdekVWsvgGGhO9cMe9VtufTISQSphVTESiea8bYlODX6qLLKXd3PMtJv/Yg3waH
 53dMU7jhXiCEY0vP58KybM/B1/+NENWR1L3aXQAzxKBPVFjmzScs6lKFGc/GatyQph/y
 n7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3XdBanYH6wiEX1AV9Wi8rz7py5KZ+TXCkOf1tNhTHy4=;
 b=koS73DRaRk06yGJ3eR+SkoS55OReY4sADzaTI2C8eqMa2JTAtfPAaavnohYt+ssfTe
 9n/9iIZMangRHsa+VAmlJtlj/AQ1nIV4rhHs6pCsBgSCYo4txEUy2Hm0kPFriDwIuyiP
 BNeMlBgABjtRrmZFP2TaLnLWypDfO9SKx0agZ2hME2uQVJyKUdJ2sa69MN4FEuU8JzoP
 pSpMmrh/t4vCXDGSXK0ZMSFDmaESw+yaq1KCWhdNXFQ4l0mfwvVaiflFecR9+r+mO90Y
 ebrrwIuzAE/EA4/FSYhkIB/TOr6ruJjTIjKbYgFJflNL9CaP4zVwupVbCjBilax18QYe
 cFag==
X-Gm-Message-State: AOAM530S6rvgs5/8+dEiK8pCsXS2NdwUM5n0k6ANBE3Fa2Ba6vNl5xN7
 2N73PKOrLGx9ZkyvC/hX+Dg=
X-Google-Smtp-Source: ABdhPJwsMD0U4ZnF99XFX5lI2e4+Txszo5gPEzQyo0bGuKZUQ2pb+lyevWH+SfjvOVmryG1D4wFzNQ==
X-Received: by 2002:a05:600c:4f8e:: with SMTP id
 n14mr1200670wmq.166.1615941129330; 
 Tue, 16 Mar 2021 17:32:09 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u9sm766768wmc.38.2021.03.16.17.32.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 17:32:08 -0700 (PDT)
Subject: Re: [PATCH v5 16/57] tcg/tci: Clean up deposit operations
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-17-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <de09ec1f-30b4-880e-6982-cb0d50804966@amsat.org>
Date: Wed, 17 Mar 2021 01:32:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
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
> Use the correct set of asserts during code generation.
> We do not require the first input to overlap the output;
> the existing interpreter already supported that.
> 
> Split out tci_args_rrrbb in the translator.
> Use the deposit32/64 functions rather than inline expansion.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci/tcg-target-con-set.h |  1 -
>  tcg/tci.c                    | 33 ++++++++++++++++-----------------
>  tcg/tci/tcg-target.c.inc     | 24 ++++++++++++++----------
>  3 files changed, 30 insertions(+), 28 deletions(-)
> 
> diff --git a/tcg/tci/tcg-target-con-set.h b/tcg/tci/tcg-target-con-set.h
> index f51b7bcb13..316730f32c 100644
> --- a/tcg/tci/tcg-target-con-set.h
> +++ b/tcg/tci/tcg-target-con-set.h
> @@ -13,7 +13,6 @@ C_O0_I2(r, r)
>  C_O0_I3(r, r, r)
>  C_O0_I4(r, r, r, r)
>  C_O1_I1(r, r)
> -C_O1_I2(r, 0, r)
>  C_O1_I2(r, r, r)
>  C_O1_I4(r, r, r, r, r)
>  C_O2_I1(r, r, r)
> diff --git a/tcg/tci.c b/tcg/tci.c
> index 10f58e4f25..3ce2b72316 100644
> --- a/tcg/tci.c
> +++ b/tcg/tci.c
> @@ -168,6 +168,7 @@ static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
>   *   tci_args_<arguments>
>   * where arguments is a sequence of
>   *
> + *   b = immediate (bit position)
>   *   i = immediate (uint32_t)
>   *   I = immediate (tcg_target_ulong)
>   *   r = register
> @@ -236,6 +237,16 @@ static void tci_args_rrrc(const uint8_t **tb_ptr,
>      *c3 = tci_read_b(tb_ptr);
>  }
>  
> +static void tci_args_rrrbb(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
> +                           TCGReg *r2, uint8_t *i3, uint8_t *i4)
> +{
> +    *r0 = tci_read_r(tb_ptr);
> +    *r1 = tci_read_r(tb_ptr);
> +    *r2 = tci_read_r(tb_ptr);
> +    *i3 = tci_read_b(tb_ptr);
> +    *i4 = tci_read_b(tb_ptr);
> +}
> +
>  #if TCG_TARGET_REG_BITS == 32
>  static void tci_args_rrrr(const uint8_t **tb_ptr,
>                            TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGReg *r3)
> @@ -432,11 +443,9 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
>          TCGReg r0, r1, r2;
>          tcg_target_ulong t0;
>          tcg_target_ulong t1;
> -        tcg_target_ulong t2;
>          TCGCond condition;
>          target_ulong taddr;
> -        uint8_t tmp8;
> -        uint16_t tmp16;
> +        uint8_t pos, len;
>          uint32_t tmp32;
>          uint64_t tmp64;
>  #if TCG_TARGET_REG_BITS == 32
> @@ -627,13 +636,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
>  #endif
>  #if TCG_TARGET_HAS_deposit_i32
>          case INDEX_op_deposit_i32:
> -            t0 = *tb_ptr++;
> -            t1 = tci_read_rval(regs, &tb_ptr);
> -            t2 = tci_read_rval(regs, &tb_ptr);
> -            tmp16 = *tb_ptr++;
> -            tmp8 = *tb_ptr++;
> -            tmp32 = (((1 << tmp8) - 1) << tmp16);
> -            tci_write_reg(regs, t0, (t1 & ~tmp32) | ((t2 << tmp16) & tmp32));
> +            tci_args_rrrbb(&tb_ptr, &r0, &r1, &r2, &pos, &len);
> +            regs[r0] = deposit32(regs[r1], pos, len, regs[r2]);
>              break;
>  #endif
>          case INDEX_op_brcond_i32:
> @@ -789,13 +793,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
>  #endif
>  #if TCG_TARGET_HAS_deposit_i64
>          case INDEX_op_deposit_i64:
> -            t0 = *tb_ptr++;
> -            t1 = tci_read_rval(regs, &tb_ptr);
> -            t2 = tci_read_rval(regs, &tb_ptr);
> -            tmp16 = *tb_ptr++;
> -            tmp8 = *tb_ptr++;
> -            tmp64 = (((1ULL << tmp8) - 1) << tmp16);
> -            tci_write_reg(regs, t0, (t1 & ~tmp64) | ((t2 << tmp16) & tmp64));
> +            tci_args_rrrbb(&tb_ptr, &r0, &r1, &r2, &pos, &len);
> +            regs[r0] = deposit64(regs[r1], pos, len, regs[r2]);
>              break;
>  #endif
>          case INDEX_op_brcond_i64:
> diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
> index 2c64b4f617..640407b4a8 100644
> --- a/tcg/tci/tcg-target.c.inc
> +++ b/tcg/tci/tcg-target.c.inc
> @@ -126,11 +126,9 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
>      case INDEX_op_rotr_i64:
>      case INDEX_op_setcond_i32:
>      case INDEX_op_setcond_i64:
> -        return C_O1_I2(r, r, r);
> -
>      case INDEX_op_deposit_i32:
>      case INDEX_op_deposit_i64:
> -        return C_O1_I2(r, 0, r);
> +        return C_O1_I2(r, r, r);
>  
>      case INDEX_op_brcond_i32:
>      case INDEX_op_brcond_i64:
> @@ -480,13 +478,19 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
>          break;
>  
>      CASE_32_64(deposit)  /* Optional (TCG_TARGET_HAS_deposit_*). */
> -        tcg_out_r(s, args[0]);
> -        tcg_out_r(s, args[1]);
> -        tcg_out_r(s, args[2]);
> -        tcg_debug_assert(args[3] <= UINT8_MAX);
> -        tcg_out8(s, args[3]);
> -        tcg_debug_assert(args[4] <= UINT8_MAX);
> -        tcg_out8(s, args[4]);
> +        {
> +            TCGArg pos = args[3], len = args[4];
> +            TCGArg max = opc == INDEX_op_deposit_i32 ? 32 : 64;
> +
> +            tcg_debug_assert(pos < max);
> +            tcg_debug_assert(pos + len <= max);
> +
> +            tcg_out_r(s, args[0]);
> +            tcg_out_r(s, args[1]);
> +            tcg_out_r(s, args[2]);
> +            tcg_out8(s, pos);
> +            tcg_out8(s, len);
> +        }
>          break;
>  
>      CASE_32_64(brcond)
> 

Another KISS :)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


