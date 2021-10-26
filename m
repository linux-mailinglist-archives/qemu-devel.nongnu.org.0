Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7AB43B71C
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 18:26:21 +0200 (CEST)
Received: from localhost ([::1]:37262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfPHG-00086m-JK
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 12:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfP9z-00074a-12
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:18:47 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:44002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfP9u-0002Ly-Ll
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:18:46 -0400
Received: by mail-lj1-x22d.google.com with SMTP id o11so24258896ljg.10
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 09:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=HDsoNVZJkhS9gVo4IeEmB3y8d1N9EVDy5Wh6Ib2Hx2E=;
 b=PO4pAN+FJY8k+wMfXECU+uvwF0ivvVV1oHt/l0LpDfpU8fD/fqKlb0U05M0T18MPtF
 PylPXt435b11vMgymAIKfr7bYJ9TcxQYmICKUt3dqGS8zFv72K4FbXwDR3ankTgATVVY
 a5rx+gCBJRJZy6SIhHYg+E9ydMW2+6yoiiyBMKHjMK/Z5Y0Sn1HBl9l+9XMTIapiXVsd
 YRCc1AyIH1TFgo/Vv5ZbXuXAwDNECEn5MC7KqItxnpxTidQ8aEXTvk4viOcQedqPAbf2
 rv7WIMbY6lMgMttYccALpQ0sy1eqQ9C21YzrvDocRjZYiEuEvRw0qcQdnzuiGeEXemlH
 vHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=HDsoNVZJkhS9gVo4IeEmB3y8d1N9EVDy5Wh6Ib2Hx2E=;
 b=VCwWihD2sUdBpDXQNyn67jrGtnRTHtIIvY0e0sMdIbTa5dStlVYDTbh8O7Xv4XFoEH
 0H7MdUWwAKiCoFhzBDz6o0tqKiPSheB2588ak1YuHsRlk7nJSUiOVP4OoQVfY+p2vkSv
 Anf4xmLKGcvCWAv73F8k03HF+Yw4eIlkNsV9XnehrDuMxG2saDkSVjyQ08JQiRKSbOCK
 A+1eIcqJzbr2kvey7fEleY4TJcUodHb3LwR5tzIPNDHniot3V+zDDW/9Nq3PdsR3J/nb
 f0htZ7FDXsCz8/K5jERPPKCw/IQjlY4q55lNXXoviT/OCHLGgtepIPHcILmJjiSUg6EK
 D4Xw==
X-Gm-Message-State: AOAM530ulMBA7bWQQK2DPdjHsMBZXV0e+zMZx+fo2tx13Ggw2lqsTH44
 R68XKHOaJFfMTvPKaeWsDWdqTQ==
X-Google-Smtp-Source: ABdhPJwCYzMBkTdSqG/VtT5T2XuPob5erGuRisjfiPV307qa8pW/x1MTvvgFyLn1HUSggUYgmgU3fA==
X-Received: by 2002:a2e:8706:: with SMTP id m6mr27448845lji.502.1635265119424; 
 Tue, 26 Oct 2021 09:18:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y3sm191277lfl.56.2021.10.26.09.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 09:18:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BC7501FF96;
 Tue, 26 Oct 2021 17:18:36 +0100 (BST)
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-39-richard.henderson@linaro.org>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 38/48] tcg/optimize: Split out fold_masks
Date: Tue, 26 Oct 2021 16:32:45 +0100
In-reply-to: <20211021210539.825582-39-richard.henderson@linaro.org>
Message-ID: <871r472203.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=alex.bennee@linaro.org; helo=mail-lj1-x22d.google.com
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
Cc: luis.pires@eldorado.org.br, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Move all of the known-zero optimizations into the per-opcode
> functions.  Use fold_masks when there is a possibility of the
> result being determined, and simply set ctx->z_mask otherwise.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 545 ++++++++++++++++++++++++++-----------------------
>  1 file changed, 294 insertions(+), 251 deletions(-)
>
> diff --git a/tcg/optimize.c b/tcg/optimize.c
> index 6c1cc3e635..f0086ee789 100644
> --- a/tcg/optimize.c
> +++ b/tcg/optimize.c
> @@ -50,7 +50,8 @@ typedef struct OptContext {
>      TCGTempSet temps_used;
>=20=20
>      /* In flight values from optimization. */
> -    uint64_t z_mask;
> +    uint64_t a_mask;  /* mask bit is 0 iff value identical to first inpu=
t */
> +    uint64_t z_mask;  /* mask bit is 0 iff value bit is 0 */

nit: too much iff?

>      TCGType type;
>  } OptContext;
>=20=20
> @@ -694,6 +695,31 @@ static bool fold_const2(OptContext *ctx, TCGOp *op)
>      return false;
>  }
>=20=20
> +static bool fold_masks(OptContext *ctx, TCGOp *op)
> +{
> +    uint64_t a_mask =3D ctx->a_mask;
> +    uint64_t z_mask =3D ctx->z_mask;
> +
> +    /*
> +     * 32-bit ops generate 32-bit results.  For the result is zero test
> +     * below, we can ignore high bits, but for further optimizations we
> +     * need to record that the high bits contain garbage.
> +     */
> +    if (ctx->type =3D=3D TCG_TYPE_I32) {
> +        ctx->z_mask |=3D MAKE_64BIT_MASK(32, 32);
> +        a_mask &=3D MAKE_64BIT_MASK(0, 32);
> +        z_mask &=3D MAKE_64BIT_MASK(0, 32);
> +    }
> +
> +    if (z_mask =3D=3D 0) {
> +        return tcg_opt_gen_movi(ctx, op, op->args[0], 0);
> +    }
> +    if (a_mask =3D=3D 0) {
> +        return tcg_opt_gen_mov(ctx, op, op->args[0], op->args[1]);
> +    }
> +    return false;
> +}
> +
>  /*
>   * Convert @op to NOT, if NOT is supported by the host.
>   * Return true f the conversion is successful, which will still
> @@ -847,24 +873,55 @@ static bool fold_add2_i32(OptContext *ctx, TCGOp *o=
p)
>=20=20
>  static bool fold_and(OptContext *ctx, TCGOp *op)
>  {
> +    uint64_t z1, z2;
> +
>      if (fold_const2(ctx, op) ||
>          fold_xi_to_i(ctx, op, 0) ||
>          fold_xi_to_x(ctx, op, -1) ||
>          fold_xx_to_x(ctx, op)) {
>          return true;
>      }
> -    return false;
> +
> +    z1 =3D arg_info(op->args[1])->z_mask;
> +    z2 =3D arg_info(op->args[2])->z_mask;
> +    ctx->z_mask =3D z1 & z2;
> +
> +    /*
> +     * Known-zeros does not imply known-ones.  Therefore unless
> +     * arg2 is constant, we can't infer affected bits from it.
> +     */
> +    if (arg_is_const(op->args[2])) {
> +        ctx->a_mask =3D z1 & ~z2;
> +    }
> +
> +    return fold_masks(ctx, op);
>  }
>=20=20
>  static bool fold_andc(OptContext *ctx, TCGOp *op)
>  {
> +    uint64_t z1;
> +
>      if (fold_const2(ctx, op) ||
>          fold_xx_to_i(ctx, op, 0) ||
>          fold_xi_to_x(ctx, op, 0) ||
>          fold_ix_to_not(ctx, op, -1)) {
>          return true;
>      }
> -    return false;
> +
> +    z1 =3D arg_info(op->args[1])->z_mask;
> +
> +    /*
> +     * Known-zeros does not imply known-ones.  Therefore unless
> +     * arg2 is constant, we can't infer anything from it.
> +     */
> +    if (arg_is_const(op->args[2])) {
> +        uint64_t z2 =3D ~arg_info(op->args[2])->z_mask;
> +        ctx->a_mask =3D z1 & ~z2;
> +        z1 &=3D z2;
> +    }
> +    ctx->z_mask =3D z1;
> +
> +    return fold_masks(ctx, op);
>  }
>=20=20
>  static bool fold_brcond(OptContext *ctx, TCGOp *op)
> @@ -963,13 +1020,52 @@ static bool fold_brcond2(OptContext *ctx, TCGOp *o=
p)
>=20=20
>  static bool fold_bswap(OptContext *ctx, TCGOp *op)
>  {
> +    uint64_t z_mask, sign;
> +
>      if (arg_is_const(op->args[1])) {
>          uint64_t t =3D arg_info(op->args[1])->val;
>=20=20
>          t =3D do_constant_folding(op->opc, ctx->type, t, op->args[2]);
>          return tcg_opt_gen_movi(ctx, op, op->args[0], t);
>      }
> -    return false;
> +
> +    z_mask =3D arg_info(op->args[1])->z_mask;
> +    switch (op->opc) {
> +    case INDEX_op_bswap16_i32:
> +    case INDEX_op_bswap16_i64:
> +        z_mask =3D bswap16(z_mask);
> +        sign =3D INT16_MIN;
> +        break;
> +    case INDEX_op_bswap32_i32:
> +    case INDEX_op_bswap32_i64:
> +        z_mask =3D bswap32(z_mask);
> +        sign =3D INT32_MIN;
> +        break;
> +    case INDEX_op_bswap64_i64:
> +        z_mask =3D bswap64(z_mask);
> +        sign =3D INT64_MIN;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    switch (op->args[2] & (TCG_BSWAP_OZ | TCG_BSWAP_OS)) {
> +    case TCG_BSWAP_OZ:
> +        break;
> +    case TCG_BSWAP_OS:
> +        /* If the sign bit may be 1, force all the bits above to 1. */
> +        if (z_mask & sign) {
> +            z_mask |=3D sign;
> +        }
> +        break;
> +    default:
> +        /* The high bits are undefined: force all bits above the sign to=
 1. */
> +        z_mask |=3D sign << 1;
> +        break;
> +    }
> +    ctx->z_mask =3D z_mask;
> +
> +    return fold_masks(ctx, op);
>  }
>=20=20
>  static bool fold_call(OptContext *ctx, TCGOp *op)
> @@ -1006,6 +1102,8 @@ static bool fold_call(OptContext *ctx, TCGOp *op)
>=20=20
>  static bool fold_count_zeros(OptContext *ctx, TCGOp *op)
>  {
> +    uint64_t z_mask;
> +
>      if (arg_is_const(op->args[1])) {
>          uint64_t t =3D arg_info(op->args[1])->val;
>=20=20
> @@ -1015,12 +1113,39 @@ static bool fold_count_zeros(OptContext *ctx, TCG=
Op *op)
>          }
>          return tcg_opt_gen_mov(ctx, op, op->args[0], op->args[2]);
>      }
> +
> +    switch (ctx->type) {
> +    case TCG_TYPE_I32:
> +        z_mask =3D 31;
> +        break;
> +    case TCG_TYPE_I64:
> +        z_mask =3D 63;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +    ctx->z_mask =3D arg_info(op->args[2])->z_mask | z_mask;
> +
>      return false;
>  }
>=20=20
>  static bool fold_ctpop(OptContext *ctx, TCGOp *op)
>  {
> -    return fold_const1(ctx, op);
> +    if (fold_const1(ctx, op)) {
> +        return true;
> +    }
> +
> +    switch (ctx->type) {
> +    case TCG_TYPE_I32:
> +        ctx->z_mask =3D 32 | 31;
> +        break;
> +    case TCG_TYPE_I64:
> +        ctx->z_mask =3D 64 | 63;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +    return false;
>  }
>=20=20
>  static bool fold_deposit(OptContext *ctx, TCGOp *op)
> @@ -1032,6 +1157,10 @@ static bool fold_deposit(OptContext *ctx, TCGOp *o=
p)
>          t1 =3D deposit64(t1, op->args[3], op->args[4], t2);
>          return tcg_opt_gen_movi(ctx, op, op->args[0], t1);
>      }
> +
> +    ctx->z_mask =3D deposit64(arg_info(op->args[1])->z_mask,
> +                            op->args[3], op->args[4],
> +                            arg_info(op->args[2])->z_mask);
>      return false;
>  }
>=20=20
> @@ -1072,6 +1201,8 @@ static bool fold_eqv(OptContext *ctx, TCGOp *op)
>=20=20
>  static bool fold_extract(OptContext *ctx, TCGOp *op)
>  {
> +    uint64_t z_mask_old, z_mask;
> +
>      if (arg_is_const(op->args[1])) {
>          uint64_t t;
>=20=20
> @@ -1079,7 +1210,15 @@ static bool fold_extract(OptContext *ctx, TCGOp *o=
p)
>          t =3D extract64(t, op->args[2], op->args[3]);
>          return tcg_opt_gen_movi(ctx, op, op->args[0], t);
>      }
> -    return false;
> +
> +    z_mask_old =3D arg_info(op->args[1])->z_mask;
> +    z_mask =3D sextract64(z_mask_old, op->args[2], op->args[3]);
> +    if (op->args[2] =3D=3D 0) {
> +        ctx->a_mask =3D z_mask_old ^ z_mask;
> +    }
> +    ctx->z_mask =3D z_mask;
> +
> +    return fold_masks(ctx, op);
>  }
>=20=20
>  static bool fold_extract2(OptContext *ctx, TCGOp *op)
> @@ -1103,12 +1242,83 @@ static bool fold_extract2(OptContext *ctx, TCGOp =
*op)
>=20=20
>  static bool fold_exts(OptContext *ctx, TCGOp *op)
>  {
> -    return fold_const1(ctx, op);
> +    uint64_t z_mask_old, z_mask, sign;
> +    bool type_change =3D false;
> +
> +    if (fold_const1(ctx, op)) {
> +        return true;
> +    }
> +
> +    z_mask_old =3D z_mask =3D arg_info(op->args[1])->z_mask;
> +
> +    switch (op->opc) {
> +    CASE_OP_32_64(ext8s):
> +        sign =3D INT8_MIN;
> +        z_mask =3D (uint8_t)z_mask;
> +        break;
> +    CASE_OP_32_64(ext16s):
> +        sign =3D INT16_MIN;
> +        z_mask =3D (uint16_t)z_mask;
> +        break;
> +    case INDEX_op_ext_i32_i64:
> +        type_change =3D true;
> +        QEMU_FALLTHROUGH;
> +    case INDEX_op_ext32s_i64:
> +        sign =3D INT32_MIN;
> +        z_mask =3D (uint32_t)z_mask;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    if (z_mask & sign) {
> +        z_mask |=3D sign;
> +    } else if (!type_change) {
> +        ctx->a_mask =3D z_mask_old ^ z_mask;
> +    }
> +    ctx->z_mask =3D z_mask;
> +
> +    return fold_masks(ctx, op);
>  }
>=20=20
>  static bool fold_extu(OptContext *ctx, TCGOp *op)
>  {
> -    return fold_const1(ctx, op);
> +    uint64_t z_mask_old, z_mask;
> +    bool type_change =3D false;
> +
> +    if (fold_const1(ctx, op)) {
> +        return true;
> +    }
> +
> +    z_mask_old =3D z_mask =3D arg_info(op->args[1])->z_mask;
> +
> +    switch (op->opc) {
> +    CASE_OP_32_64(ext8u):
> +        z_mask =3D (uint8_t)z_mask;
> +        break;
> +    CASE_OP_32_64(ext16u):
> +        z_mask =3D (uint16_t)z_mask;
> +        break;
> +    case INDEX_op_extrl_i64_i32:
> +    case INDEX_op_extu_i32_i64:
> +        type_change =3D true;
> +        QEMU_FALLTHROUGH;
> +    case INDEX_op_ext32u_i64:
> +        z_mask =3D (uint32_t)z_mask;
> +        break;
> +    case INDEX_op_extrh_i64_i32:
> +        type_change =3D true;
> +        z_mask >>=3D 32;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    ctx->z_mask =3D z_mask;
> +    if (!type_change) {
> +        ctx->a_mask =3D z_mask_old ^ z_mask;
> +    }
> +    return fold_masks(ctx, op);
>  }
>=20=20
>  static bool fold_mb(OptContext *ctx, TCGOp *op)
> @@ -1149,6 +1359,9 @@ static bool fold_movcond(OptContext *ctx, TCGOp *op)
>          return tcg_opt_gen_mov(ctx, op, op->args[0], op->args[4 - i]);
>      }
>=20=20
> +    ctx->z_mask =3D arg_info(op->args[3])->z_mask
> +                | arg_info(op->args[4])->z_mask;
> +
>      if (arg_is_const(op->args[3]) && arg_is_const(op->args[4])) {
>          uint64_t tv =3D arg_info(op->args[3])->val;
>          uint64_t fv =3D arg_info(op->args[4])->val;
> @@ -1214,9 +1427,16 @@ static bool fold_nand(OptContext *ctx, TCGOp *op)
>=20=20
>  static bool fold_neg(OptContext *ctx, TCGOp *op)
>  {
> +    uint64_t z_mask;
> +
>      if (fold_const1(ctx, op)) {
>          return true;
>      }
> +
> +    /* Set to 1 all bits to the left of the rightmost.  */
> +    z_mask =3D arg_info(op->args[1])->z_mask;
> +    ctx->z_mask =3D -(z_mask & -z_mask);
> +
>      /*
>       * Because of fold_sub_to_neg, we want to always return true,
>       * via finish_folding.
> @@ -1252,7 +1472,10 @@ static bool fold_or(OptContext *ctx, TCGOp *op)
>          fold_xx_to_x(ctx, op)) {
>          return true;
>      }
> -    return false;
> +
> +    ctx->z_mask =3D arg_info(op->args[1])->z_mask
> +                | arg_info(op->args[2])->z_mask;
> +    return fold_masks(ctx, op);
>  }
>=20=20
>  static bool fold_orc(OptContext *ctx, TCGOp *op)
> @@ -1266,6 +1489,15 @@ static bool fold_orc(OptContext *ctx, TCGOp *op)
>=20=20
>  static bool fold_qemu_ld(OptContext *ctx, TCGOp *op)
>  {
> +    const TCGOpDef *def =3D &tcg_op_defs[op->opc];
> +    MemOpIdx oi =3D op->args[def->nb_oargs + def->nb_iargs];
> +    MemOp mop =3D get_memop(oi);
> +    int width =3D 8 << (mop & MO_SIZE);

Given we have a helper memop_size() it might be worth adding another
memop_size_bits()?

> +
> +    if (!(mop & MO_SIGN) && width < 64) {
> +        ctx->z_mask =3D MAKE_64BIT_MASK(0, width);
> +    }
> +
>      /* Opcodes that touch guest memory stop the mb optimization.  */
>      ctx->prev_mb =3D NULL;
>      return false;
> @@ -1286,6 +1518,8 @@ static bool fold_setcond(OptContext *ctx, TCGOp *op)
>      if (i >=3D 0) {
>          return tcg_opt_gen_movi(ctx, op, op->args[0], i);
>      }
> +
> +    ctx->z_mask =3D 1;
>      return false;
>  }
>=20=20
> @@ -1352,6 +1586,8 @@ static bool fold_setcond2(OptContext *ctx, TCGOp *o=
p)
>          op->opc =3D INDEX_op_setcond_i32;
>          break;
>      }
> +
> +    ctx->z_mask =3D 1;
>      return false;
>=20=20
>   do_setcond_const:
> @@ -1360,6 +1596,8 @@ static bool fold_setcond2(OptContext *ctx, TCGOp *o=
p)
>=20=20
>  static bool fold_sextract(OptContext *ctx, TCGOp *op)
>  {
> +    int64_t z_mask_old, z_mask;
> +
>      if (arg_is_const(op->args[1])) {
>          uint64_t t;
>=20=20
> @@ -1367,7 +1605,15 @@ static bool fold_sextract(OptContext *ctx, TCGOp *=
op)
>          t =3D sextract64(t, op->args[2], op->args[3]);
>          return tcg_opt_gen_movi(ctx, op, op->args[0], t);
>      }
> -    return false;
> +
> +    z_mask_old =3D arg_info(op->args[1])->z_mask;
> +    z_mask =3D sextract64(z_mask_old, op->args[2], op->args[3]);
> +    if (op->args[2] =3D=3D 0 && z_mask >=3D 0) {
> +        ctx->a_mask =3D z_mask_old ^ z_mask;
> +    }
> +    ctx->z_mask =3D z_mask;
> +
> +    return fold_masks(ctx, op);
>  }
>=20=20
>  static bool fold_shift(OptContext *ctx, TCGOp *op)
> @@ -1377,6 +1623,13 @@ static bool fold_shift(OptContext *ctx, TCGOp *op)
>          fold_xi_to_x(ctx, op, 0)) {
>          return true;
>      }
> +
> +    if (arg_is_const(op->args[2])) {
> +        ctx->z_mask =3D do_constant_folding(op->opc, ctx->type,
> +                                          arg_info(op->args[1])->z_mask,
> +                                          arg_info(op->args[2])->val);
> +        return fold_masks(ctx, op);
> +    }
>      return false;
>  }
>=20=20
> @@ -1432,6 +1685,25 @@ static bool fold_sub2_i32(OptContext *ctx, TCGOp *=
op)
>      return fold_addsub2_i32(ctx, op, false);
>  }
>=20=20
> +static bool fold_tcg_ld(OptContext *ctx, TCGOp *op)
> +{
> +    /* We can't do any folding with a load, but we can record bits. */
> +    switch (op->opc) {
> +    CASE_OP_32_64(ld8u):
> +        ctx->z_mask =3D 0xff;
> +        break;
> +    CASE_OP_32_64(ld16u):
> +        ctx->z_mask =3D 0xffff;
> +        break;
> +    case INDEX_op_ld32u_i64:
> +        ctx->z_mask =3D 0xffffffffu;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +    return false;

Given we use MAKE_64BIT_MASK elsewhere we should do here as well.

> +}
> +
>  static bool fold_xor(OptContext *ctx, TCGOp *op)
>  {
>      if (fold_const2(ctx, op) ||
> @@ -1440,7 +1712,10 @@ static bool fold_xor(OptContext *ctx, TCGOp *op)
>          fold_xi_to_not(ctx, op, -1)) {
>          return true;
>      }
> -    return false;
> +
> +    ctx->z_mask =3D arg_info(op->args[1])->z_mask
> +                | arg_info(op->args[2])->z_mask;
> +    return fold_masks(ctx, op);
>  }
>=20=20
>  /* Propagate constants and copies, fold constant expressions. */
> @@ -1461,7 +1736,6 @@ void tcg_optimize(TCGContext *s)
>      }
>=20=20
>      QTAILQ_FOREACH_SAFE(op, &s->ops, link, op_next) {
> -        uint64_t z_mask, partmask, affected, tmp;
>          TCGOpcode opc =3D op->opc;
>          const TCGOpDef *def;
>          bool done =3D false;
> @@ -1542,245 +1816,9 @@ void tcg_optimize(TCGContext *s)
>              break;
>          }
>=20=20
> -        /* Simplify using known-zero bits. Currently only ops with a sin=
gle
> -           output argument is supported. */
> -        z_mask =3D -1;
> -        affected =3D -1;
> -        switch (opc) {
> -        CASE_OP_32_64(ext8s):
> -            if ((arg_info(op->args[1])->z_mask & 0x80) !=3D 0) {
> -                break;
> -            }
> -            QEMU_FALLTHROUGH;
> -        CASE_OP_32_64(ext8u):
> -            z_mask =3D 0xff;
> -            goto and_const;
> -        CASE_OP_32_64(ext16s):
> -            if ((arg_info(op->args[1])->z_mask & 0x8000) !=3D 0) {
> -                break;
> -            }
> -            QEMU_FALLTHROUGH;
> -        CASE_OP_32_64(ext16u):
> -            z_mask =3D 0xffff;
> -            goto and_const;
> -        case INDEX_op_ext32s_i64:
> -            if ((arg_info(op->args[1])->z_mask & 0x80000000) !=3D 0) {
> -                break;
> -            }
> -            QEMU_FALLTHROUGH;
> -        case INDEX_op_ext32u_i64:
> -            z_mask =3D 0xffffffffU;
> -            goto and_const;
> -
> -        CASE_OP_32_64(and):
> -            z_mask =3D arg_info(op->args[2])->z_mask;
> -            if (arg_is_const(op->args[2])) {
> -        and_const:
> -                affected =3D arg_info(op->args[1])->z_mask & ~z_mask;
> -            }
> -            z_mask =3D arg_info(op->args[1])->z_mask & z_mask;
> -            break;
> -
> -        case INDEX_op_ext_i32_i64:
> -            if ((arg_info(op->args[1])->z_mask & 0x80000000) !=3D 0) {
> -                break;
> -            }
> -            QEMU_FALLTHROUGH;
> -        case INDEX_op_extu_i32_i64:
> -            /* We do not compute affected as it is a size changing op.  =
*/
> -            z_mask =3D (uint32_t)arg_info(op->args[1])->z_mask;
> -            break;
> -
> -        CASE_OP_32_64(andc):
> -            /* Known-zeros does not imply known-ones.  Therefore unless
> -               op->args[2] is constant, we can't infer anything from it.=
  */
> -            if (arg_is_const(op->args[2])) {
> -                z_mask =3D ~arg_info(op->args[2])->z_mask;
> -                goto and_const;
> -            }
> -            /* But we certainly know nothing outside args[1] may be set.=
 */
> -            z_mask =3D arg_info(op->args[1])->z_mask;
> -            break;
> -
> -        case INDEX_op_sar_i32:
> -            if (arg_is_const(op->args[2])) {
> -                tmp =3D arg_info(op->args[2])->val & 31;
> -                z_mask =3D (int32_t)arg_info(op->args[1])->z_mask >> tmp;
> -            }
> -            break;
> -        case INDEX_op_sar_i64:
> -            if (arg_is_const(op->args[2])) {
> -                tmp =3D arg_info(op->args[2])->val & 63;
> -                z_mask =3D (int64_t)arg_info(op->args[1])->z_mask >> tmp;
> -            }
> -            break;
> -
> -        case INDEX_op_shr_i32:
> -            if (arg_is_const(op->args[2])) {
> -                tmp =3D arg_info(op->args[2])->val & 31;
> -                z_mask =3D (uint32_t)arg_info(op->args[1])->z_mask >> tm=
p;
> -            }
> -            break;
> -        case INDEX_op_shr_i64:
> -            if (arg_is_const(op->args[2])) {
> -                tmp =3D arg_info(op->args[2])->val & 63;
> -                z_mask =3D (uint64_t)arg_info(op->args[1])->z_mask >> tm=
p;
> -            }
> -            break;
> -
> -        case INDEX_op_extrl_i64_i32:
> -            z_mask =3D (uint32_t)arg_info(op->args[1])->z_mask;
> -            break;
> -        case INDEX_op_extrh_i64_i32:
> -            z_mask =3D (uint64_t)arg_info(op->args[1])->z_mask >> 32;
> -            break;
> -
> -        CASE_OP_32_64(shl):
> -            if (arg_is_const(op->args[2])) {
> -                tmp =3D arg_info(op->args[2])->val & (TCG_TARGET_REG_BIT=
S - 1);
> -                z_mask =3D arg_info(op->args[1])->z_mask << tmp;
> -            }
> -            break;
> -
> -        CASE_OP_32_64(neg):
> -            /* Set to 1 all bits to the left of the rightmost.  */
> -            z_mask =3D -(arg_info(op->args[1])->z_mask
> -                       & -arg_info(op->args[1])->z_mask);
> -            break;
> -
> -        CASE_OP_32_64(deposit):
> -            z_mask =3D deposit64(arg_info(op->args[1])->z_mask,
> -                               op->args[3], op->args[4],
> -                               arg_info(op->args[2])->z_mask);
> -            break;
> -
> -        CASE_OP_32_64(extract):
> -            z_mask =3D extract64(arg_info(op->args[1])->z_mask,
> -                               op->args[2], op->args[3]);
> -            if (op->args[2] =3D=3D 0) {
> -                affected =3D arg_info(op->args[1])->z_mask & ~z_mask;
> -            }
> -            break;
> -        CASE_OP_32_64(sextract):
> -            z_mask =3D sextract64(arg_info(op->args[1])->z_mask,
> -                                op->args[2], op->args[3]);
> -            if (op->args[2] =3D=3D 0 && (tcg_target_long)z_mask >=3D 0) {
> -                affected =3D arg_info(op->args[1])->z_mask & ~z_mask;
> -            }
> -            break;
> -
> -        CASE_OP_32_64(or):
> -        CASE_OP_32_64(xor):
> -            z_mask =3D arg_info(op->args[1])->z_mask
> -                   | arg_info(op->args[2])->z_mask;
> -            break;
> -
> -        case INDEX_op_clz_i32:
> -        case INDEX_op_ctz_i32:
> -            z_mask =3D arg_info(op->args[2])->z_mask | 31;
> -            break;
> -
> -        case INDEX_op_clz_i64:
> -        case INDEX_op_ctz_i64:
> -            z_mask =3D arg_info(op->args[2])->z_mask | 63;
> -            break;
> -
> -        case INDEX_op_ctpop_i32:
> -            z_mask =3D 32 | 31;
> -            break;
> -        case INDEX_op_ctpop_i64:
> -            z_mask =3D 64 | 63;
> -            break;
> -
> -        CASE_OP_32_64(setcond):
> -        case INDEX_op_setcond2_i32:
> -            z_mask =3D 1;
> -            break;
> -
> -        CASE_OP_32_64(movcond):
> -            z_mask =3D arg_info(op->args[3])->z_mask
> -                   | arg_info(op->args[4])->z_mask;
> -            break;
> -
> -        CASE_OP_32_64(ld8u):
> -            z_mask =3D 0xff;
> -            break;
> -        CASE_OP_32_64(ld16u):
> -            z_mask =3D 0xffff;
> -            break;
> -        case INDEX_op_ld32u_i64:
> -            z_mask =3D 0xffffffffu;
> -            break;
> -
> -        CASE_OP_32_64(qemu_ld):
> -            {
> -                MemOpIdx oi =3D op->args[def->nb_oargs + def->nb_iargs];
> -                MemOp mop =3D get_memop(oi);
> -                if (!(mop & MO_SIGN)) {
> -                    z_mask =3D (2ULL << ((8 << (mop & MO_SIZE)) - 1)) - =
1;
> -                }
> -            }
> -            break;
> -
> -        CASE_OP_32_64(bswap16):
> -            z_mask =3D arg_info(op->args[1])->z_mask;
> -            if (z_mask <=3D 0xffff) {
> -                op->args[2] |=3D TCG_BSWAP_IZ;
> -            }
> -            z_mask =3D bswap16(z_mask);
> -            switch (op->args[2] & (TCG_BSWAP_OZ | TCG_BSWAP_OS)) {
> -            case TCG_BSWAP_OZ:
> -                break;
> -            case TCG_BSWAP_OS:
> -                z_mask =3D (int16_t)z_mask;
> -                break;
> -            default: /* undefined high bits */
> -                z_mask |=3D MAKE_64BIT_MASK(16, 48);
> -                break;
> -            }
> -            break;
> -
> -        case INDEX_op_bswap32_i64:
> -            z_mask =3D arg_info(op->args[1])->z_mask;
> -            if (z_mask <=3D 0xffffffffu) {
> -                op->args[2] |=3D TCG_BSWAP_IZ;
> -            }
> -            z_mask =3D bswap32(z_mask);
> -            switch (op->args[2] & (TCG_BSWAP_OZ | TCG_BSWAP_OS)) {
> -            case TCG_BSWAP_OZ:
> -                break;
> -            case TCG_BSWAP_OS:
> -                z_mask =3D (int32_t)z_mask;
> -                break;
> -            default: /* undefined high bits */
> -                z_mask |=3D MAKE_64BIT_MASK(32, 32);
> -                break;
> -            }
> -            break;
> -
> -        default:
> -            break;
> -        }
> -
> -        /* 32-bit ops generate 32-bit results.  For the result is zero t=
est
> -           below, we can ignore high bits, but for further optimizations=
 we
> -           need to record that the high bits contain garbage.  */
> -        partmask =3D z_mask;
> -        if (ctx.type =3D=3D TCG_TYPE_I32) {
> -            z_mask |=3D ~(tcg_target_ulong)0xffffffffu;
> -            partmask &=3D 0xffffffffu;
> -            affected &=3D 0xffffffffu;
> -        }
> -        ctx.z_mask =3D z_mask;
> -
> -        if (partmask =3D=3D 0) {
> -            tcg_opt_gen_movi(&ctx, op, op->args[0], 0);
> -            continue;
> -        }
> -        if (affected =3D=3D 0) {
> -            tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[1]);
> -            continue;
> -        }
> +        /* Assume all bits affected, and no bits known zero. */
> +        ctx.a_mask =3D -1;
> +        ctx.z_mask =3D -1;
>=20=20
>          /*
>           * Process each opcode.
> @@ -1853,6 +1891,11 @@ void tcg_optimize(TCGContext *s)
>          case INDEX_op_extrh_i64_i32:
>              done =3D fold_extu(&ctx, op);
>              break;
> +        CASE_OP_32_64(ld8u):
> +        CASE_OP_32_64(ld16u):
> +        case INDEX_op_ld32u_i64:
> +            done =3D fold_tcg_ld(&ctx, op);
> +            break;
>          case INDEX_op_mb:
>              done =3D fold_mb(&ctx, op);
>              break;

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--=20
Alex Benn=C3=A9e

