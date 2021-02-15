Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 750F831C362
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 22:05:02 +0100 (CET)
Received: from localhost ([::1]:59900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBl3E-00043Y-Ph
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 16:05:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBl0L-0001Ty-AR
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 16:02:02 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:45450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBl0H-00069q-Bu
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 16:02:00 -0500
Received: by mail-pf1-x435.google.com with SMTP id j12so4849921pfj.12
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 13:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1qwBER4EcrbMZjvmGZZNRHvT6bcLut3Nyjir6UuUSTM=;
 b=stEBuHL5Zs9HajyqRofpvrfveKymN40/q4BteQNJgxUEPK6PuQd81n2GjO67jIM6/X
 UcwfSnrtHQCHAWkb/DegXKluZX0qTi/GJxBxaJBeFyp7R4Arr/S1poGIrQJO6nppheVt
 mR6PwmE2REBv9+kTPxAT01c5kl6JhrbV7QGdlmIt/Gz6kvH3MJ7pKsqElpA9es0SpKUk
 iSMR6EwPiwXvhaZxua4cgw3QfTrSusRYs1hTpvj2JnOiuR4vNCnzNTR2fUG857/wWvag
 R5QPhlBwNDWStFETPeBGtMvTF6SoRkYHM7QcOw5Hr/Zn0yauOGW2N+IqOkrZNnBZ55Ir
 Cpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1qwBER4EcrbMZjvmGZZNRHvT6bcLut3Nyjir6UuUSTM=;
 b=bguMKyAx22NoyQbxnT5S0KBeP4Nm4BeVQ9YVmmS8Qwu0NCO3YAu6gWGDj4ma974vyi
 R1jcE2b+QZQ1x0dYXAOZDtPESCWoZ9T60gHsWQ02p2MYKtZIJmdZ3OsJEqsYpCMQPtpd
 c7T6cJJpIxG5uxK6JEoWLYC3//xaZrDOXiDNiVPZIbZr2/iMn6MSlrzUWBqeT5I3V2yD
 7JnnGCFGWT5betrqV6oCqVQc7Y1HbXgHlyC12jzn6zYQqWYJC6JjrCsCgCYpg9UpCdh8
 G2iurhRXyJGCaLQA/AzPEyaSjTILPaMkIv4c/Tsf1E2mxNIagSF9zLxzWpFNW3ZedWLD
 /cLw==
X-Gm-Message-State: AOAM530oboMLZ9B+GNmQwLQgcjPAPRYViZnrdozg/z30TIjD55EExLkq
 x0Y49OAFGppwJ1i+eEMThQLZug==
X-Google-Smtp-Source: ABdhPJyhCAV6dWJeXggWl44xxXocf9KaGapd9p/MlnTdbDUvLR+wtdyu7hniwrF8JSSv4OAdvAUGRg==
X-Received: by 2002:aa7:8b59:0:b029:1e9:8229:c100 with SMTP id
 i25-20020aa78b590000b02901e98229c100mr15641702pfd.19.1613422915773; 
 Mon, 15 Feb 2021 13:01:55 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id kr16sm352606pjb.23.2021.02.15.13.01.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 13:01:55 -0800 (PST)
Subject: Re: [RFC PATCH 28/42] target/mips/tx79: Move RDHWR usermode kludge to
 trans_SQ()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-29-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d47d5ab7-9663-8647-483f-878e0bcb3bbe@linaro.org>
Date: Mon, 15 Feb 2021 13:01:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210214175912.732946-29-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fredrik Noring <noring@nocrew.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/21 9:58 AM, Philippe Mathieu-Daudé wrote:
> Now than SQ is properly implemented, we can move the RDHWR
> kludge required to have usermode working with recent glibc.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c      | 56 ------------------------------------
>  target/mips/tx79_translate.c | 34 +++++++++++++++++++++-
>  2 files changed, 33 insertions(+), 57 deletions(-)
> 
> diff --git a/target/mips/translate.c b/target/mips/translate.c
> index c1d07a4591d..0fa2b3bcc15 100644
> --- a/target/mips/translate.c
> +++ b/target/mips/translate.c
> @@ -1780,7 +1780,6 @@ enum {
>  
>  enum {
>      MMI_OPC_CLASS_MMI = 0x1C << 26,    /* Same as OPC_SPECIAL2 */
> -    MMI_OPC_SQ        = 0x1F << 26,    /* Same as OPC_SPECIAL3 */
>  };
>  
>  /*
> @@ -27330,53 +27329,6 @@ static void decode_mmi(CPUMIPSState *env, DisasContext *ctx)
>      }
>  }
>  
> -static void gen_mmi_sq(DisasContext *ctx, int base, int rt, int offset)
> -{
> -    gen_reserved_instruction(ctx);    /* TODO: MMI_OPC_SQ */
> -}
> -
> -/*
> - * The TX79-specific instruction Store Quadword
> - *
> - * +--------+-------+-------+------------------------+
> - * | 011111 |  base |   rt  |           offset       | SQ
> - * +--------+-------+-------+------------------------+
> - *      6       5       5                 16
> - *
> - * has the same opcode as the Read Hardware Register instruction
> - *
> - * +--------+-------+-------+-------+-------+--------+
> - * | 011111 | 00000 |   rt  |   rd  | 00000 | 111011 | RDHWR
> - * +--------+-------+-------+-------+-------+--------+
> - *      6       5       5       5       5        6
> - *
> - * that is required, trapped and emulated by the Linux kernel. However, all
> - * RDHWR encodings yield address error exceptions on the TX79 since the SQ
> - * offset is odd. Therefore all valid SQ instructions can execute normally.
> - * In user mode, QEMU must verify the upper and lower 11 bits to distinguish
> - * between SQ and RDHWR, as the Linux kernel does.
> - */
> -static void decode_mmi_sq(CPUMIPSState *env, DisasContext *ctx)
> -{
> -    int base = extract32(ctx->opcode, 21, 5);
> -    int rt = extract32(ctx->opcode, 16, 5);
> -    int offset = extract32(ctx->opcode, 0, 16);
> -
> -#ifdef CONFIG_USER_ONLY
> -    uint32_t op1 = MASK_SPECIAL3(ctx->opcode);
> -    uint32_t op2 = extract32(ctx->opcode, 6, 5);
> -
> -    if (base == 0 && op2 == 0 && op1 == OPC_RDHWR) {
> -        int rd = extract32(ctx->opcode, 11, 5);
> -
> -        gen_rdhwr(ctx, rt, rd, 0);
> -        return;
> -    }
> -#endif
> -
> -    gen_mmi_sq(ctx, base, rt, offset);
> -}
> -
>  #endif
>  
>  static void decode_opc_special3(CPUMIPSState *env, DisasContext *ctx)
> @@ -27561,15 +27513,7 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
>          }
>          break;
>      case OPC_SPECIAL3:
> -#if defined(TARGET_MIPS64)
> -        if (ctx->insn_flags & INSN_R5900) {
> -            decode_mmi_sq(env, ctx);    /* MMI_OPC_SQ */
> -        } else {
> -            decode_opc_special3(env, ctx);
> -        }
> -#else
>          decode_opc_special3(env, ctx);
> -#endif
>          break;
>      case OPC_REGIMM:
>          op1 = MASK_REGIMM(ctx->opcode);
> diff --git a/target/mips/tx79_translate.c b/target/mips/tx79_translate.c
> index 386bae7808b..2aa3182d21d 100644
> --- a/target/mips/tx79_translate.c
> +++ b/target/mips/tx79_translate.c
> @@ -411,7 +411,7 @@ static bool trans_LQ(DisasContext *ctx, arg_itype *a)
>      return true;
>  }
>  
> -static bool trans_SQ(DisasContext *ctx, arg_itype *a)
> +static bool trans_SQ_real(DisasContext *ctx, arg_itype *a)
>  {
>      TCGv_i64 t0 = tcg_temp_new_i64();
>      TCGv addr = tcg_temp_new();
> @@ -438,6 +438,38 @@ static bool trans_SQ(DisasContext *ctx, arg_itype *a)
>      return true;
>  }
>  
> +static bool trans_SQ(DisasContext *ctx, arg_itype *a)
> +{
> +    /*
> +     * The TX79-specific instruction Store Quadword
> +     *
> +     * +--------+-------+-------+------------------------+
> +     * | 011111 |  base |   rt  |           offset       | SQ
> +     * +--------+-------+-------+------------------------+
> +     *      6       5       5                 16
> +     *
> +     * has the same opcode as the Read Hardware Register instruction
> +     *
> +     * +--------+-------+-------+-------+-------+--------+
> +     * | 011111 | 00000 |   rt  |   rd  | 00000 | 111011 | RDHWR
> +     * +--------+-------+-------+-------+-------+--------+
> +     *      6       5       5       5       5        6
> +     *
> +     * that is required, trapped and emulated by the Linux kernel. However, all
> +     * RDHWR encodings yield address error exceptions on the TX79 since the SQ
> +     * offset is odd.

Not that it's odd (the final address is masked, remember), but that it a store
to an address in the zero page.

> Therefore all valid SQ instructions can execute normally.
> +     * In user mode, QEMU must verify the upper and lower 13 bits to distinguish

11 bits.

> +     * between SQ and RDHWR, as the Linux kernel does.
> +     */
> +#if defined(CONFIG_USER_ONLY)
> +    if (!a->base && extract32(a->offset, 0, 11) == 0b00000111011) {
> +        gen_rdhwr(ctx, a->rt, extract32(ctx->opcode, 11, 5), 0);
> +        return true;
> +    }
> +#endif

I would do this as

{
  RDHWR_user  011111 00000 ..... ..... 00000 111011   @rd_rt
  SQ          011111 ..... ..... ................     @ldst
}

static bool trans_RDHWR_user(DisasContext *ctx, arg_rtype *a)
{
#ifdef CONFIG_USER_ONLY
    gen_rdhwr(ctx, a->rt, a->rd, 0);
    return true;
#else
    return false;
#endif
}


r~

