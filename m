Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553DD30735F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 11:06:18 +0100 (CET)
Received: from localhost ([::1]:47636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l54Bt-0001bL-9q
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 05:06:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l54AU-0001A6-I6
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 05:04:50 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:57848
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l54AR-0005wV-RN
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 05:04:50 -0500
Received: from mobile-149-057.wlan.uni-mannheim.de
 (mobile-149-057.wlan.uni-mannheim.de [134.155.149.57])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id C0177DA0D84;
 Thu, 28 Jan 2021 11:04:45 +0100 (CET)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210128082331.196801-1-richard.henderson@linaro.org>
 <20210128082331.196801-23-richard.henderson@linaro.org>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH 22/23] tcg/tci: Implement 64-bit division
Message-ID: <8d395910-8656-9c4f-5dfa-749c50e8de22@weilnetz.de>
Date: Thu, 28 Jan 2021 11:04:44 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210128082331.196801-23-richard.henderson@linaro.org>
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

> Trivially implemented like other arithmetic.
> Tested via check-tcg and the ppc64 target.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tci/tcg-target.h     |  4 ++--
>   tcg/tci.c                | 28 ++++++++++++++++++++++------
>   tcg/tci/tcg-target.c.inc | 12 ++++--------
>   3 files changed, 28 insertions(+), 16 deletions(-)
>
> diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
> index bb784e018e..7fc349a3de 100644
> --- a/tcg/tci/tcg-target.h
> +++ b/tcg/tci/tcg-target.h
> @@ -100,8 +100,8 @@
>   #define TCG_TARGET_HAS_extract_i64      0
>   #define TCG_TARGET_HAS_sextract_i64     0
>   #define TCG_TARGET_HAS_extract2_i64     0
> -#define TCG_TARGET_HAS_div_i64          0
> -#define TCG_TARGET_HAS_rem_i64          0
> +#define TCG_TARGET_HAS_div_i64          1
> +#define TCG_TARGET_HAS_rem_i64          1
>   #define TCG_TARGET_HAS_ext8s_i64        1
>   #define TCG_TARGET_HAS_ext16s_i64       1
>   #define TCG_TARGET_HAS_ext32s_i64       1
> diff --git a/tcg/tci.c b/tcg/tci.c
> index 32931ea611..0065c854a4 100644
> --- a/tcg/tci.c
> +++ b/tcg/tci.c
> @@ -889,14 +889,30 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUAr=
chState *env,
>               t2 =3D tci_read_ri64(regs, &tb_ptr);
>               tci_write_reg(regs, t0, t1 * t2);
>               break;
> -#if TCG_TARGET_HAS_div_i64


I suggest to keep this and other identical #if TCG_TARGET_HAS_div_i64=20
and the matching #endif in the code.

They are not needed for the default case, but useful as long as it is=20
possible to write a TCG backend without those opcodes. Then it helps=20
running TCI with the same subset of opcodes.

As far as I see currently s390 does not set that macro. So to compare=20
the s390 TCG with TCI, I'd want to have the same subset of TCG opcodes,=20
which means none of those implemented here. That can be done when the=20
preprocessor conditionals remain in the code.


>           case INDEX_op_div_i64:
> -        case INDEX_op_divu_i64:
> -        case INDEX_op_rem_i64:
> -        case INDEX_op_remu_i64:
> -            TODO();
> +            t0 =3D *tb_ptr++;
> +            t1 =3D tci_read_ri64(regs, &tb_ptr);
> +            t2 =3D tci_read_ri64(regs, &tb_ptr);
> +            tci_write_reg(regs, t0, (int64_t)t1 / (int64_t)t2);
> +            break;
> +        case INDEX_op_divu_i64:
> +            t0 =3D *tb_ptr++;
> +            t1 =3D tci_read_ri64(regs, &tb_ptr);
> +            t2 =3D tci_read_ri64(regs, &tb_ptr);
> +            tci_write_reg(regs, t0, (uint64_t)t1 / (uint64_t)t2);
> +            break;
> +        case INDEX_op_rem_i64:
> +            t0 =3D *tb_ptr++;
> +            t1 =3D tci_read_ri64(regs, &tb_ptr);
> +            t2 =3D tci_read_ri64(regs, &tb_ptr);
> +            tci_write_reg(regs, t0, (int64_t)t1 % (int64_t)t2);
> +            break;
> +        case INDEX_op_remu_i64:
> +            t0 =3D *tb_ptr++;
> +            t1 =3D tci_read_ri64(regs, &tb_ptr);
> +            t2 =3D tci_read_ri64(regs, &tb_ptr);
> +            tci_write_reg(regs, t0, (uint64_t)t1 % (uint64_t)t2);
>               break;
> -#endif
>           case INDEX_op_and_i64:
>               t0 =3D *tb_ptr++;
>               t1 =3D tci_read_ri64(regs, &tb_ptr);
> diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
> index 842807ff2e..8c0e77a0be 100644
> --- a/tcg/tci/tcg-target.c.inc
> +++ b/tcg/tci/tcg-target.c.inc
> @@ -146,12 +146,10 @@ static const TCGTargetOpDef tcg_target_op_defs[] =
=3D {
>       { INDEX_op_add_i64, { R, RI, RI } },
>       { INDEX_op_sub_i64, { R, RI, RI } },
>       { INDEX_op_mul_i64, { R, RI, RI } },
> -#if TCG_TARGET_HAS_div_i64
>       { INDEX_op_div_i64, { R, R, R } },
>       { INDEX_op_divu_i64, { R, R, R } },
>       { INDEX_op_rem_i64, { R, R, R } },
>       { INDEX_op_remu_i64, { R, R, R } },
> -#endif
>       { INDEX_op_and_i64, { R, RI, RI } },
>   #if TCG_TARGET_HAS_andc_i64
>       { INDEX_op_andc_i64, { R, RI, RI } },
> @@ -678,6 +676,10 @@ static void tcg_out_op(TCGContext *s, TCGOpcode op=
c, const TCGArg *args,
>       case INDEX_op_sar_i64:
>       case INDEX_op_rotl_i64:     /* Optional (TCG_TARGET_HAS_rot_i64).=
 */
>       case INDEX_op_rotr_i64:     /* Optional (TCG_TARGET_HAS_rot_i64).=
 */
> +    case INDEX_op_div_i64:      /* Optional (TCG_TARGET_HAS_div_i64). =
*/
> +    case INDEX_op_divu_i64:     /* Optional (TCG_TARGET_HAS_div_i64). =
*/
> +    case INDEX_op_rem_i64:      /* Optional (TCG_TARGET_HAS_div_i64). =
*/
> +    case INDEX_op_remu_i64:     /* Optional (TCG_TARGET_HAS_div_i64). =
*/
>           tcg_out_r(s, args[0]);
>           tcg_out_ri64(s, const_args[1], args[1]);
>           tcg_out_ri64(s, const_args[2], args[2]);
> @@ -691,12 +693,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode op=
c, const TCGArg *args,
>           tcg_debug_assert(args[4] <=3D UINT8_MAX);
>           tcg_out8(s, args[4]);
>           break;
> -    case INDEX_op_div_i64:      /* Optional (TCG_TARGET_HAS_div_i64). =
*/
> -    case INDEX_op_divu_i64:     /* Optional (TCG_TARGET_HAS_div_i64). =
*/
> -    case INDEX_op_rem_i64:      /* Optional (TCG_TARGET_HAS_div_i64). =
*/
> -    case INDEX_op_remu_i64:     /* Optional (TCG_TARGET_HAS_div_i64). =
*/
> -        TODO();
> -        break;
>       case INDEX_op_brcond_i64:
>           tcg_out_r(s, args[0]);
>           tcg_out_ri64(s, const_args[1], args[1]);


Thanks. See my comment above where I suggest a slight modification.

Reviewed-by: Stefan Weil <sw@weilnetz.de>




