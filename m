Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F083AEB84
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 16:37:23 +0200 (CEST)
Received: from localhost ([::1]:37982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvL3C-00040d-JY
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 10:37:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvL1x-0003Dy-0E
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:36:05 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:37397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvL1v-0006rW-9A
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:36:04 -0400
Received: by mail-ej1-x636.google.com with SMTP id ji1so23112534ejc.4
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 07:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KZyc0kXV3nI9z/doDucq+sdcQVnxLxmyFliXPOVWAQg=;
 b=r1F9xuUKmGTsA2QqaI4EyFXnkP+jQGU/uYcPGnU4OhXlfU+bDs/TmyJWqKNL1SIMAe
 O2kb0ZkAdFX77k3Fc9mfnCfoo3HmAx+YwUHaWxJWusJM1kaBSShX4EzM7c7z2e2UCPkJ
 pgCYkt5ke06LZyxd7CfX03QFaRwGyVHRTpmrpBnNoIU8f03+x6s9TKgLdJTxLpLMTv8e
 1g/MtgDBqou9bXZ6kYifPhxC3Wp11hD7OMXpbPuWSogn8MlEa3jSamLNlMmC01CWEJL4
 1tdsgde1LDsxVUButm1ihPI3zJRVdItk3QhsL9MrVRKDMxrKU+gAD5i310Xba+LyljyF
 lfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KZyc0kXV3nI9z/doDucq+sdcQVnxLxmyFliXPOVWAQg=;
 b=e0bH6DFLm0H2ZOd6GgNmOawTifwT83l3FLf4CHKXIHAorFTK7kXQcMnFuqwcmfIDzk
 ANvZSmgpxMlGJyupSRwuPROznAXLrbKihKFv/FLkmpz0ISAuZ787Ba8W88un1QY629x/
 SJsLTqty67OFzEId0bFp9VfE6k+YFpdwsY79y6d00uLTIjrgUx1ho6wPp3xbGrQM3sGN
 NCy1HuWMBYdZCsZUcpHv4KSyv5mqsoVEorYdq7+d54eSiqePCSD3jvZvXONw0pMHfyFg
 tfvGbXhdKsCAhD1zWOPDEYnnM5WMLJ7Abp/ohQPg7jBtNXmGQFaVKt3h9Pj0H8oJmCEk
 YBUg==
X-Gm-Message-State: AOAM531ENtwWMIZLNzaoXd3SCQVSJisrEk5vjrbzGv9zRKwTJS8ficn8
 gnxaLOIB3YYsNiLe2UfUcwipMeaEEoUVyepdHVDWkaVYwG+w7w==
X-Google-Smtp-Source: ABdhPJz/4C4WaQeMTd1xxoq88q6bjWGyWxuX9kzMz+iJUvhGH/c46P0SkDvmODP5kQ88endHruGp8jGbngQVzToTAbQ=
X-Received: by 2002:a17:906:90c4:: with SMTP id
 v4mr10359969ejw.382.1624286155902; 
 Mon, 21 Jun 2021 07:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-10-richard.henderson@linaro.org>
In-Reply-To: <20210614083800.1166166-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 15:35:19 +0100
Message-ID: <CAFEAcA8AVNtjJyvo7eW=D8W0hRoKEcAM2_a5Kycx9NF4mXyyUA@mail.gmail.com>
Subject: Re: [PATCH 09/28] tcg/ppc: Split out tcg_out_bswap64
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Jun 2021 at 09:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/ppc/tcg-target.c.inc | 51 +++++++++++++++++-----------------------
>  1 file changed, 21 insertions(+), 30 deletions(-)
>
> diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
> index f0e42e4b88..690c77b4da 100644
> --- a/tcg/ppc/tcg-target.c.inc
> +++ b/tcg/ppc/tcg-target.c.inc
> @@ -809,6 +809,26 @@ static void tcg_out_bswap32(TCGContext *s, TCGReg dst, TCGReg src)
>      tcg_out_mov(s, TCG_TYPE_REG, dst, tmp);
>  }
>
> +static void tcg_out_bswap64(TCGContext *s, TCGReg dst, TCGReg src)
> +{
> +    TCGReg t0 = dst == src ? TCG_REG_R0 : dst;
> +    TCGReg t1 = dst == src ? dst : TCG_REG_R0;
> +
> +                                                   /* src = abcd efgh */
> +    tcg_out_rlw(s, RLWINM, t0, src, 8, 0, 31);     /* t0  = 0000 fghe */
> +    tcg_out_rlw(s, RLWIMI, t0, src, 24, 0, 7);     /* t0  = 0000 hghe */
> +    tcg_out_rlw(s, RLWIMI, t0, src, 24, 16, 23);   /* t0  = 0000 hgfe */
> +
> +    tcg_out_rld(s, RLDICL, t0, t0, 32, 0);         /* t0  = hgfe 0000 */
> +    tcg_out_rld(s, RLDICL, t1, src, 32, 0);        /* t1  = efgh abcd */
> +
> +    tcg_out_rlw(s, RLWIMI, t0, t1, 8, 0, 31);      /* t0  = hgfe bcda */
> +    tcg_out_rlw(s, RLWIMI, t0, t1, 24, 0, 7);      /* t0  = hgfe dcda */
> +    tcg_out_rlw(s, RLWIMI, t0, t1, 24, 16, 23);    /* t0  = hgfe dcba */
> +
> +    tcg_out_mov(s, TCG_TYPE_REG, dst, t0);
> +}
> +
>  /* Emit a move into ret of arg, if it can be done in one insn.  */
>  static bool tcg_out_movi_one(TCGContext *s, TCGReg ret, tcg_target_long arg)
>  {
> @@ -2806,37 +2826,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>      case INDEX_op_bswap32_i64:
>          tcg_out_bswap32(s, args[0], args[1]);
>          break;
> -
>      case INDEX_op_bswap64_i64:
> -        a0 = args[0], a1 = args[1], a2 = TCG_REG_R0;
> -        if (a0 == a1) {
> -            a0 = TCG_REG_R0;
> -            a2 = a1;
> -        }
> -
> -        /* a1 = # abcd efgh */
> -        /* a0 = rl32(a1, 8) # 0000 fghe */
> -        tcg_out_rlw(s, RLWINM, a0, a1, 8, 0, 31);
> -        /* a0 = dep(a0, rl32(a1, 24), 0xff000000) # 0000 hghe */
> -        tcg_out_rlw(s, RLWIMI, a0, a1, 24, 0, 7);
> -        /* a0 = dep(a0, rl32(a1, 24), 0x0000ff00) # 0000 hgfe */
> -        tcg_out_rlw(s, RLWIMI, a0, a1, 24, 16, 23);
> -
> -        /* a0 = rl64(a0, 32) # hgfe 0000 */
> -        /* a2 = rl64(a1, 32) # efgh abcd */
> -        tcg_out_rld(s, RLDICL, a0, a0, 32, 0);
> -        tcg_out_rld(s, RLDICL, a2, a1, 32, 0);
> -
> -        /* a0 = dep(a0, rl32(a2, 8), 0xffffffff)  # hgfe bcda */
> -        tcg_out_rlw(s, RLWIMI, a0, a2, 8, 0, 31);
> -        /* a0 = dep(a0, rl32(a2, 24), 0xff000000) # hgfe dcda */
> -        tcg_out_rlw(s, RLWIMI, a0, a2, 24, 0, 7);
> -        /* a0 = dep(a0, rl32(a2, 24), 0x0000ff00) # hgfe dcba */
> -        tcg_out_rlw(s, RLWIMI, a0, a2, 24, 16, 23);
> -
> -        if (a0 == 0) {
> -            tcg_out_mov(s, TCG_TYPE_REG, args[0], a0);
> -        }
> +        tcg_out_bswap64(s, args[0], args[1]);
>          break;
>

Again, keep the comments, otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

