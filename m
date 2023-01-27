Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2455367E4D4
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 13:14:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLNbi-0002qj-4f; Fri, 27 Jan 2023 07:13:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pLNbe-0002qN-Tl
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 07:13:22 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pLNbc-0006cO-PD
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 07:13:22 -0500
Received: by mail-wm1-x332.google.com with SMTP id fl24so3314337wmb.1
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 04:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+KjD4sLp6KZ7CauVDw4OeKp/fDqtErJKNNG46+Iopq8=;
 b=tuFn2EF5Dyp1VIqoMkP29fKwmEkiNSlxA6AcmKS619TqiIJlbZlghFVPW2seFhCwcq
 DMDfDtJceEYSIrnJrwmwaGveKgD/evV1V8RytWqcxjly8oJ6tdzPwn75nJ8j+rbb6OyZ
 Wmug94LtNN+Ydjg3XgykLZ9gQLzqOhr+qWQot8ENOW1ovO8n8ArBwvG8ZBo20Urr0yIv
 2oxo/9j47CQeD3ATHiFHN+75flfxpD55VEs4Tbf0HJa0URQdFm2hwSk688AHmaKWpnen
 HUO5b3+NcMf0ybrx3sdoPdA5GljzP+33/fAHnffjAYb8cGZU2kOC4X8QIh8NsVKQFkr9
 FT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+KjD4sLp6KZ7CauVDw4OeKp/fDqtErJKNNG46+Iopq8=;
 b=WVHv7QsEvZXPSHG9cojqC+JHcs5BIsoJ4OE3mPEbEMuyp0JYSQAFpJAEg/lfzV3PaA
 bz+Nq0q80FLAL2SN8XuQ1ZCGktViLhPd9BNOtQmu90RyN4lLzXQj6HmeQOwYGbG7xbKT
 0NlRhVJjAROJjDFvlVdx1CKn0/3S+IGa2/bSVgk3xgDZ94loyl5RxIoZlvv849sCP4b4
 NIFiwhdWg3q1v/hxe1KEKi4fvXbUoaQGZhkHiXsvQwIzoqHSYn58J6UqDEg8zSps3YBz
 5Xo7ZHGyMg+tvQ/pakCo6k2Z71K4mu6b70Qn5MNOFzv1ovD0T6A9lRehh2vU1x4OYMDQ
 cNzA==
X-Gm-Message-State: AFqh2kqkxAIGIuA4kSgeh5PczWRElrXjJGRNnpTnsuI799j+oERHxQjL
 J5FLyvvvZUxeJncVmLv5h1I7fw==
X-Google-Smtp-Source: AMrXdXt0NLnIolj+WHH56cKQA2mxjecEgBqeCf0ODbw9NCJzErcbZgsGvfKiF+K1tHm7WbnkjHu2Xg==
X-Received: by 2002:a7b:cd11:0:b0:3d9:6c7d:c9ee with SMTP id
 f17-20020a7bcd11000000b003d96c7dc9eemr47180497wmj.25.1674821598781; 
 Fri, 27 Jan 2023 04:13:18 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c2caf00b003d974076f13sm4915654wmc.3.2023.01.27.04.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 04:13:18 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C4FFD1FFB7;
 Fri, 27 Jan 2023 12:13:17 +0000 (GMT)
References: <20230126043824.54819-1-richard.henderson@linaro.org>
 <20230126043824.54819-6-richard.henderson@linaro.org>
User-agent: mu4e 1.9.16; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v5 05/36] tcg: Add TCG_CALL_{RET,ARG}_BY_REF
Date: Fri, 27 Jan 2023 10:40:43 +0000
In-reply-to: <20230126043824.54819-6-richard.henderson@linaro.org>
Message-ID: <87zga4npk2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


Richard Henderson <richard.henderson@linaro.org> writes:

> These will be used by some hosts, both 32 and 64-bit, to pass and
> return i128.  Not yet used, because allocation is not yet enabled.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tcg-internal.h |   3 +
>  tcg/tcg.c          | 135 ++++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 135 insertions(+), 3 deletions(-)
>
> diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
> index 6e50aeba3a..2ec1ea01df 100644
> --- a/tcg/tcg-internal.h
> +++ b/tcg/tcg-internal.h
> @@ -36,6 +36,7 @@
>   */
>  typedef enum {
>      TCG_CALL_RET_NORMAL,         /* by registers */
> +    TCG_CALL_RET_BY_REF,         /* for i128, by reference */
>  } TCGCallReturnKind;
>=20=20
>  typedef enum {
> @@ -44,6 +45,8 @@ typedef enum {
>      TCG_CALL_ARG_EXTEND,         /* for i32, as a sign/zero-extended i64=
 */
>      TCG_CALL_ARG_EXTEND_U,       /*      ... as a zero-extended i64 */
>      TCG_CALL_ARG_EXTEND_S,       /*      ... as a sign-extended i64 */
> +    TCG_CALL_ARG_BY_REF,         /* for i128, by reference, first */
> +    TCG_CALL_ARG_BY_REF_N,       /*       ... by reference, subsequent */
>  } TCGCallArgumentKind;
>=20=20
>  typedef struct TCGCallArgumentLoc {
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index a561ef3ced..644dc53196 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -104,8 +104,7 @@ static void tcg_out_ld(TCGContext *s, TCGType type, T=
CGReg ret, TCGReg arg1,
>  static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg =
arg);
>  static void tcg_out_movi(TCGContext *s, TCGType type,
>                           TCGReg ret, tcg_target_long arg);
> -static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_l=
ong)
> -    __attribute__((unused));
> +static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_l=
ong);
>  static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg);
>  static void tcg_out_goto_tb(TCGContext *s, int which);
>  static void tcg_out_op(TCGContext *s, TCGOpcode opc,
> @@ -683,6 +682,38 @@ static void layout_arg_normal_n(TCGCumulativeArgs *c=
um,
>      cum->arg_slot +=3D n;
>  }
>=20=20
> +static void layout_arg_by_ref(TCGCumulativeArgs *cum, TCGHelperInfo *inf=
o)
> +{
> +    TCGCallArgumentLoc *loc =3D &info->in[cum->info_in_idx];
> +    int n =3D 128 / TCG_TARGET_REG_BITS;
> +
> +    /* The first subindex carries the pointer. */
> +    layout_arg_1(cum, info, TCG_CALL_ARG_BY_REF);
> +
> +    /*
> +     * The callee is allowed to clobber memory associated with
> +     * structure pass by-reference.  Therefore we must make copies.
> +     * Allocate space from "ref_slot", which will be adjusted to
> +     * follow the parameters on the stack.
> +     */
> +    loc[0].ref_slot =3D cum->ref_slot;
> +
> +    /*
> +     * Subsequent words also go into the reference slot, but
> +     * do not accumulate into the regular arguments.
> +     */
> +    for (int i =3D 1; i < n; ++i) {
> +        loc[i] =3D (TCGCallArgumentLoc){
> +            .kind =3D TCG_CALL_ARG_BY_REF_N,
> +            .arg_idx =3D cum->arg_idx,
> +            .tmp_subindex =3D i,
> +            .ref_slot =3D cum->ref_slot + i,
> +        };
> +    }
> +    cum->info_in_idx +=3D n;
> +    cum->ref_slot +=3D n;
> +}

I'm surprised this is in the core TCG. Are the stack frames organised
the same way across all our host architectures?

> +
>  static void init_call_layout(TCGHelperInfo *info)
>  {
>      int max_reg_slots =3D ARRAY_SIZE(tcg_target_call_iarg_regs);
> @@ -718,6 +749,14 @@ static void init_call_layout(TCGHelperInfo *info)
>          case TCG_CALL_RET_NORMAL:
>              assert(info->nr_out <=3D ARRAY_SIZE(tcg_target_call_oarg_reg=
s));
>              break;
> +        case TCG_CALL_RET_BY_REF:
> +            /*
> +             * Allocate the first argument to the output.
> +             * We don't need to store this anywhere, just make it
> +             * unavailable for use in the input loop below.
> +             */
> +            cum.arg_slot =3D 1;
> +            break;

It would have helped if ->typemask was documented or accessed with
something like dh_get_typemask(0) for my understanding here.

>          default:
>              qemu_build_not_reached();
>          }
> @@ -796,6 +835,9 @@ static void init_call_layout(TCGHelperInfo *info)
>              case TCG_CALL_ARG_NORMAL:
>                  layout_arg_normal_n(&cum, info, 128 / TCG_TARGET_REG_BIT=
S);
>                  break;
> +            case TCG_CALL_ARG_BY_REF:
> +                layout_arg_by_ref(&cum, info);
> +                break;
>              default:
>                  qemu_build_not_reached();
>              }
> @@ -811,7 +853,39 @@ static void init_call_layout(TCGHelperInfo *info)
>      assert(cum.info_in_idx <=3D ARRAY_SIZE(info->in));
>      /* Validate the backend has enough argument space. */
>      assert(cum.arg_slot <=3D max_reg_slots + max_stk_slots);
> -    assert(cum.ref_slot <=3D max_stk_slots);
> +
> +    /*
> +     * Relocate the "ref_slot" area to the end of the parameters.
> +     * Minimizing this stack offset helps code size for x86,
> +     * which has a signed 8-bit offset encoding.
> +     */

I don't quite follow this. Are we free to move parameters around in the
stack frame? I thought the position would be directly related to the
argument number?

> +    if (cum.ref_slot !=3D 0) {
> +        int ref_base =3D 0;
> +
> +        if (cum.arg_slot > max_reg_slots) {
> +            int align =3D __alignof(Int128) / sizeof(tcg_target_long);
> +
> +            ref_base =3D cum.arg_slot - max_reg_slots;
> +            if (align > 1) {
> +                ref_base =3D ROUND_UP(ref_base, align);
> +            }
> +        }
> +        assert(ref_base + cum.ref_slot <=3D max_stk_slots);
> +
> +        if (ref_base !=3D 0) {
> +            for (int i =3D cum.info_in_idx - 1; i >=3D 0; --i) {
> +                TCGCallArgumentLoc *loc =3D &info->in[i];
> +                switch (loc->kind) {
> +                case TCG_CALL_ARG_BY_REF:
> +                case TCG_CALL_ARG_BY_REF_N:
> +                    loc->ref_slot +=3D ref_base;
> +                    break;
> +                default:
> +                    break;
> +                }
> +            }
> +        }
> +    }
>  }
>=20=20
>  static int indirect_reg_alloc_order[ARRAY_SIZE(tcg_target_reg_alloc_orde=
r)];
> @@ -1738,6 +1812,8 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int na=
rgs, TCGTemp **args)
>=20=20
>          switch (loc->kind) {
>          case TCG_CALL_ARG_NORMAL:
> +        case TCG_CALL_ARG_BY_REF:
> +        case TCG_CALL_ARG_BY_REF_N:
>              op->args[pi++] =3D temp_arg(ts);
>              break;
>=20=20
> @@ -4404,6 +4480,27 @@ static void load_arg_normal(TCGContext *s, const T=
CGCallArgumentLoc *l,
>      }
>  }
>=20=20
> +static void load_arg_ref(TCGContext *s, int arg_slot, TCGReg ref_base,
> +                         intptr_t ref_off, TCGRegSet *allocated_regs)
> +{
> +    TCGReg reg;
> +    int stk_slot =3D arg_slot - ARRAY_SIZE(tcg_target_call_iarg_regs);
> +
> +    if (stk_slot < 0) {
> +        reg =3D tcg_target_call_iarg_regs[arg_slot];
> +        tcg_reg_free(s, reg, *allocated_regs);
> +        tcg_out_addi_ptr(s, reg, ref_base, ref_off);
> +        tcg_regset_set_reg(*allocated_regs, reg);
> +    } else {
> +        reg =3D tcg_reg_alloc(s, tcg_target_available_regs[TCG_TYPE_PTR],
> +                            *allocated_regs, 0, false);
> +        tcg_out_addi_ptr(s, reg, ref_base, ref_off);
> +        tcg_out_st(s, TCG_TYPE_PTR, reg, TCG_REG_CALL_STACK,
> +                   TCG_TARGET_CALL_STACK_OFFSET
> +                   + stk_slot * sizeof(tcg_target_long));
> +    }
> +}
> +
>  static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
>  {
>      const int nb_oargs =3D TCGOP_CALLO(op);
> @@ -4427,6 +4524,16 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGO=
p *op)
>          case TCG_CALL_ARG_EXTEND_S:
>              load_arg_normal(s, loc, ts, &allocated_regs);
>              break;
> +        case TCG_CALL_ARG_BY_REF:
> +            load_arg_stk(s, loc->ref_slot, ts, allocated_regs);
> +            load_arg_ref(s, loc->arg_slot, TCG_REG_CALL_STACK,
> +                         TCG_TARGET_CALL_STACK_OFFSET
> +                         + loc->ref_slot * sizeof(tcg_target_long),
> +                         &allocated_regs);
> +            break;
> +        case TCG_CALL_ARG_BY_REF_N:
> +            load_arg_stk(s, loc->ref_slot, ts, allocated_regs);
> +            break;
>          default:
>              g_assert_not_reached();
>          }
> @@ -4458,6 +4565,19 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGO=
p *op)
>          save_globals(s, allocated_regs);
>      }
>=20=20
> +    /*
> +     * If the ABI passes a pointer to the returned struct as the first
> +     * argument, load that now.  Pass a pointer to the output home slot.
> +     */
> +    if (info->out_kind =3D=3D TCG_CALL_RET_BY_REF) {
> +        TCGTemp *ts =3D arg_temp(op->args[0]);
> +
> +        if (!ts->mem_allocated) {
> +            temp_allocate_frame(s, ts);
> +        }
> +        load_arg_ref(s, 0, ts->mem_base->reg, ts->mem_offset, &allocated=
_regs);
> +    }
> +
>      tcg_out_call(s, tcg_call_func(op), info);
>=20=20
>      /* Assign output registers and emit moves if needed.  */
> @@ -4474,6 +4594,15 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGO=
p *op)
>              ts->mem_coherent =3D 0;
>          }
>          break;
> +
> +    case TCG_CALL_RET_BY_REF:
> +        /* The callee has performed a write through the reference. */
> +        for (i =3D 0; i < nb_oargs; i++) {
> +            TCGTemp *ts =3D arg_temp(op->args[i]);
> +            ts->val_type =3D TEMP_VAL_MEM;
> +        }
> +        break;
> +
>      default:
>          g_assert_not_reached();
>      }


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

