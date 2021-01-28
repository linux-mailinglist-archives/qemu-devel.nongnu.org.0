Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 784B33079F5
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 16:43:36 +0100 (CET)
Received: from localhost ([::1]:38472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l59SJ-0001W7-H6
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 10:43:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l59Os-0007w1-Tj
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:40:02 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:60148
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l59Oq-0003GJ-9o
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:40:02 -0500
Received: from macbook01.bib.uni-mannheim.de (macbook01.bib.uni-mannheim.de
 [134.155.36.117])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 0C313DA043C;
 Thu, 28 Jan 2021 16:39:58 +0100 (CET)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210128082331.196801-1-richard.henderson@linaro.org>
 <20210128082331.196801-22-richard.henderson@linaro.org>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH 21/23] tcg/tci: Remove dead code for TCG_TARGET_HAS_div2_*
Message-ID: <993a9d04-049b-7e31-9833-115ce07ee8e7@weilnetz.de>
Date: Thu, 28 Jan 2021 16:39:57 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210128082331.196801-22-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Am 28.01.21 um 09:23 schrieb Richard Henderson:

> We do not simultaneously support div and div2 -- it's one
> or the other.  TCI is already using div, so remove div2.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tci.c                | 12 ------------
>   tcg/tci/tcg-target.c.inc | 16 ----------------
>   2 files changed, 28 deletions(-)
>
> diff --git a/tcg/tci.c b/tcg/tci.c
> index 2ce67a8fd3..32931ea611 100644
> --- a/tcg/tci.c
> +++ b/tcg/tci.c
> @@ -647,7 +647,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArch=
State *env,
>               t2 =3D tci_read_ri32(regs, &tb_ptr);
>               tci_write_reg(regs, t0, t1 * t2);
>               break;
> -#if TCG_TARGET_HAS_div_i32
>           case INDEX_op_div_i32:
>               t0 =3D *tb_ptr++;
>               t1 =3D tci_read_ri32(regs, &tb_ptr);
> @@ -672,12 +671,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArc=
hState *env,
>               t2 =3D tci_read_ri32(regs, &tb_ptr);
>               tci_write_reg(regs, t0, t1 % t2);
>               break;
> -#elif TCG_TARGET_HAS_div2_i32
> -        case INDEX_op_div2_i32:
> -        case INDEX_op_divu2_i32:
> -            TODO();
> -            break;
> -#endif
>           case INDEX_op_and_i32:
>               t0 =3D *tb_ptr++;
>               t1 =3D tci_read_ri32(regs, &tb_ptr);
> @@ -903,11 +896,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArc=
hState *env,
>           case INDEX_op_remu_i64:
>               TODO();
>               break;
> -#elif TCG_TARGET_HAS_div2_i64
> -        case INDEX_op_div2_i64:
> -        case INDEX_op_divu2_i64:
> -            TODO();
> -            break;
>   #endif
>           case INDEX_op_and_i64:
>               t0 =3D *tb_ptr++;
> diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
> index a60fa524a4..842807ff2e 100644
> --- a/tcg/tci/tcg-target.c.inc
> +++ b/tcg/tci/tcg-target.c.inc
> @@ -71,15 +71,10 @@ static const TCGTargetOpDef tcg_target_op_defs[] =3D=
 {
>       { INDEX_op_add_i32, { R, RI, RI } },
>       { INDEX_op_sub_i32, { R, RI, RI } },
>       { INDEX_op_mul_i32, { R, RI, RI } },
> -#if TCG_TARGET_HAS_div_i32
>       { INDEX_op_div_i32, { R, R, R } },
>       { INDEX_op_divu_i32, { R, R, R } },
>       { INDEX_op_rem_i32, { R, R, R } },
>       { INDEX_op_remu_i32, { R, R, R } },
> -#elif TCG_TARGET_HAS_div2_i32
> -    { INDEX_op_div2_i32, { R, R, "0", "1", R } },
> -    { INDEX_op_divu2_i32, { R, R, "0", "1", R } },
> -#endif
>       /* TODO: Does R, RI, RI result in faster code than R, R, RI?
>          If both operands are constants, we can optimize. */
>       { INDEX_op_and_i32, { R, RI, RI } },
> @@ -156,9 +151,6 @@ static const TCGTargetOpDef tcg_target_op_defs[] =3D=
 {
>       { INDEX_op_divu_i64, { R, R, R } },
>       { INDEX_op_rem_i64, { R, R, R } },
>       { INDEX_op_remu_i64, { R, R, R } },
> -#elif TCG_TARGET_HAS_div2_i64
> -    { INDEX_op_div2_i64, { R, R, "0", "1", R } },
> -    { INDEX_op_divu2_i64, { R, R, "0", "1", R } },
>   #endif
>       { INDEX_op_and_i64, { R, RI, RI } },
>   #if TCG_TARGET_HAS_andc_i64
> @@ -705,10 +697,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode op=
c, const TCGArg *args,
>       case INDEX_op_remu_i64:     /* Optional (TCG_TARGET_HAS_div_i64).=
 */
>           TODO();
>           break;
> -    case INDEX_op_div2_i64:     /* Optional (TCG_TARGET_HAS_div2_i64).=
 */
> -    case INDEX_op_divu2_i64:    /* Optional (TCG_TARGET_HAS_div2_i64).=
 */
> -        TODO();
> -        break;
>       case INDEX_op_brcond_i64:
>           tcg_out_r(s, args[0]);
>           tcg_out_ri64(s, const_args[1], args[1]);
> @@ -748,10 +736,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode op=
c, const TCGArg *args,
>           tcg_out_ri32(s, const_args[1], args[1]);
>           tcg_out_ri32(s, const_args[2], args[2]);
>           break;
> -    case INDEX_op_div2_i32:     /* Optional (TCG_TARGET_HAS_div2_i32).=
 */
> -    case INDEX_op_divu2_i32:    /* Optional (TCG_TARGET_HAS_div2_i32).=
 */
> -        TODO();
> -        break;
>   #if TCG_TARGET_REG_BITS =3D=3D 32
>       case INDEX_op_add2_i32:
>       case INDEX_op_sub2_i32:


One of the ideas for TCI is that it should ideally support any subset of =

TCG opcodes which is used by an existing TCG backend or a newly written=20
backend.

This only requires copying the TCG_TARGET_HAS... defines.

So this patch should keep the preprocessor conditionals, and the TODO=20
statements have to be replaced by code (or #error for the moment).

Patch 22 should also keep the preprocessor conditionals, see my comment=20
there.

Thanks,

Stefan



