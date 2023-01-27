Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4EB67E7B7
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 15:05:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLPLF-0008W8-5M; Fri, 27 Jan 2023 09:04:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pLPLC-0008Vj-RF
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 09:04:30 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pLPLA-0007h7-Mn
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 09:04:30 -0500
Received: by mail-wr1-x42c.google.com with SMTP id h16so5033621wrz.12
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 06:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V8DKI5k0xoo2khStMqO3VoHW11j1aqvMZ4BdQY59f94=;
 b=CRWLbUAP1XGclvqUZBODHd+d8EQiZ/ib9v/3TN7XRgHGmOZxdQ1HS4y9wOVvg2XIR+
 xyYcRH4CxQmz7yggsgwR73sxf78ydC4Omp6ahprzkTo+yPGDgFJD8YUX+MlK72wKwT+P
 XqUxYjSKrXq+m4KDd7pHCOu950UekE85Ur35ahQ/H//Y/iFNVGRAJMrQsh/Tb8mjDE1W
 ok8hEntax0eT5PlmQgHYKhbClXd3ldh671/UKBTTsTW1IS8vHz3YOpSpNMIm3oijsTCm
 ALaL8sCHNMiO0xIjV6KQQ2r4w7RICLS+jzzrqkAZmxmWUaJ/ds9lD128g+hEm02Zv2DL
 iivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=V8DKI5k0xoo2khStMqO3VoHW11j1aqvMZ4BdQY59f94=;
 b=ulmJfnJ6PL8WOD3xkjy0SNYFKcYQ5YxVTuXtGw4Df/KYjMvOPX1LfKhnpLo+OQixqG
 HqLCpKTgdTmldDl2XDIEgL3dhVHanm9PFLX+PQP3M0iLXAfdoNiZ1BWm5p5Q+CTwpR+R
 C3g5UcIjDboFmtzX2SN4B8SygihqmgOgRs3PoP4RcbdKhPttzTcubzEe72iqb2p8E81C
 hZwXmHUOfPqCEvvOZ3XuA7q/HWtMigA+R0Yiyj62g9zH5ROnxQ10NxBc5U8aRPO1UVA4
 uHhgrTfDzVI7yOZ1cclUnirO31G8uoULw+pIbJbQZSPYWzyDuXYQixHViINZWxf1UUFx
 hK/Q==
X-Gm-Message-State: AFqh2kqyXziKxRKqtI9OGSHRMXiMS7q+dp8e3FM5tCyVUM65aD9h+tLh
 iVPlLPHQQPfOnS5qH6UQ3Gm20A==
X-Google-Smtp-Source: AMrXdXv8gEP6zl5saaFiU5aS/6A2OKTioe4UkAEMfa3cODXve8Zk29VkwRYQN+aP9kKXpGcgA1/ZpQ==
X-Received: by 2002:a05:6000:38a:b0:2be:4c32:a7df with SMTP id
 u10-20020a056000038a00b002be4c32a7dfmr28381237wrf.63.1674828262237; 
 Fri, 27 Jan 2023 06:04:22 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 x13-20020adfdccd000000b002bbddb89c71sm4152354wrm.67.2023.01.27.06.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 06:04:21 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 42E7D1FFB7;
 Fri, 27 Jan 2023 14:04:21 +0000 (GMT)
References: <20230126043824.54819-1-richard.henderson@linaro.org>
 <20230126043824.54819-12-richard.henderson@linaro.org>
User-agent: mu4e 1.9.16; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v5 11/36] tcg/tci: Add TCG_TARGET_CALL_{RET,ARG}_I128
Date: Fri, 27 Jan 2023 14:00:01 +0000
In-reply-to: <20230126043824.54819-12-richard.henderson@linaro.org>
Message-ID: <87ilgsnkey.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

> Fill in the parameters for libffi for Int128.
> Adjust the interpreter to allow for 16-byte return values.
> Adjust tcg_out_call to record the return value length.
>
> Call parameters are no longer all the same size, so we
> cannot reuse the same call_slots array for every function.
> Compute it each time now, but only fill in slots required
> for the call we're about to make.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci/tcg-target.h     |  3 +++
>  tcg/tcg.c                | 19 +++++++++++++++++
>  tcg/tci.c                | 44 ++++++++++++++++++++--------------------
>  tcg/tci/tcg-target.c.inc | 10 ++++-----
>  4 files changed, 49 insertions(+), 27 deletions(-)
>
> diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
> index 1414ab4d5b..7140a76a73 100644
> --- a/tcg/tci/tcg-target.h
> +++ b/tcg/tci/tcg-target.h
> @@ -160,10 +160,13 @@ typedef enum {
>  #if TCG_TARGET_REG_BITS =3D=3D 32
>  # define TCG_TARGET_CALL_ARG_I32        TCG_CALL_ARG_EVEN
>  # define TCG_TARGET_CALL_ARG_I64        TCG_CALL_ARG_EVEN
> +# define TCG_TARGET_CALL_ARG_I128       TCG_CALL_ARG_EVEN
>  #else
>  # define TCG_TARGET_CALL_ARG_I32        TCG_CALL_ARG_NORMAL
>  # define TCG_TARGET_CALL_ARG_I64        TCG_CALL_ARG_NORMAL
> +# define TCG_TARGET_CALL_ARG_I128       TCG_CALL_ARG_NORMAL
>  #endif
> +#define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_NORMAL
>=20=20
>  #define HAVE_TCG_QEMU_TB_EXEC
>  #define TCG_TARGET_NEED_POOL_LABELS
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 084e3c3a54..4c43fd28ba 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -570,6 +570,22 @@ static GHashTable *helper_table;
>  #ifdef CONFIG_TCG_INTERPRETER
>  static ffi_type *typecode_to_ffi(int argmask)
>  {
> +    /*
> +     * libffi does not support __int128_t, so we have forced Int128
> +     * to use the structure definition instead of the builtin type.
> +     */
> +    static ffi_type *ffi_type_i128_elements[3] =3D {
> +        &ffi_type_uint64,
> +        &ffi_type_uint64,
> +        NULL
> +    };
> +    static ffi_type ffi_type_i128 =3D {
> +        .size =3D 16,
> +        .alignment =3D __alignof__(Int128),
> +        .type =3D FFI_TYPE_STRUCT,
> +        .elements =3D ffi_type_i128_elements,
> +    };
> +
>      switch (argmask) {
>      case dh_typecode_void:
>          return &ffi_type_void;
> @@ -583,6 +599,8 @@ static ffi_type *typecode_to_ffi(int argmask)
>          return &ffi_type_sint64;
>      case dh_typecode_ptr:
>          return &ffi_type_pointer;
> +    case dh_typecode_i128:
> +        return &ffi_type_i128;
>      }
>      g_assert_not_reached();
>  }
> @@ -613,6 +631,7 @@ static void init_ffi_layouts(void)
>          /* Ignoring the return type, find the last non-zero field. */
>          nargs =3D 32 - clz32(typemask >> 3);
>          nargs =3D DIV_ROUND_UP(nargs, 3);
> +        assert(nargs <=3D MAX_CALL_IARGS);
>=20=20
>          ca =3D g_malloc0(sizeof(*ca) + nargs * sizeof(ffi_type *));
>          ca->cif.rtype =3D typecode_to_ffi(typemask & 7);
> diff --git a/tcg/tci.c b/tcg/tci.c
> index eeccdde8bc..022fe9d0f8 100644
> --- a/tcg/tci.c
> +++ b/tcg/tci.c
> @@ -470,12 +470,9 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchS=
tate *env,
>      tcg_target_ulong regs[TCG_TARGET_NB_REGS];
>      uint64_t stack[(TCG_STATIC_CALL_ARGS_SIZE + TCG_STATIC_FRAME_SIZE)
>                     / sizeof(uint64_t)];
> -    void *call_slots[TCG_STATIC_CALL_ARGS_SIZE / sizeof(uint64_t)];
>=20=20
>      regs[TCG_AREG0] =3D (tcg_target_ulong)env;
>      regs[TCG_REG_CALL_STACK] =3D (uintptr_t)stack;
> -    /* Other call_slots entries initialized at first use (see below). */
> -    call_slots[0] =3D NULL;
>      tci_assert(tb_ptr);
>=20=20
>      for (;;) {
> @@ -498,26 +495,26 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArch=
State *env,
>=20=20
>          switch (opc) {
>          case INDEX_op_call:
> -            /*
> -             * Set up the ffi_avalue array once, delayed until now
> -             * because many TB's do not make any calls. In tcg_gen_callN,
> -             * we arranged for every real argument to be "left-aligned"
> -             * in each 64-bit slot.
> -             */
> -            if (unlikely(call_slots[0] =3D=3D NULL)) {
> -                for (int i =3D 0; i < ARRAY_SIZE(call_slots); ++i) {
> -                    call_slots[i] =3D &stack[i];
> -                }
> -            }
> -
> -            tci_args_nl(insn, tb_ptr, &len, &ptr);
> -
> -            /* Helper functions may need to access the "return address" =
*/
> -            tci_tb_ptr =3D (uintptr_t)tb_ptr;
> -
>              {
> -                void **pptr =3D ptr;
> -                ffi_call(pptr[1], pptr[0], stack, call_slots);
> +                void *call_slots[MAX_CALL_IARGS];
> +                ffi_cif *cif;
> +                void *func;
> +                unsigned i, s, n;
> +
> +                tci_args_nl(insn, tb_ptr, &len, &ptr);
> +                func =3D ((void **)ptr)[0];
> +                cif =3D ((void **)ptr)[1];
> +
> +                n =3D cif->nargs;
> +                for (i =3D s =3D 0; i < n; ++i) {

Why the pre-increment for ++i here? It doesn't make a difference surely?

> +                    ffi_type *t =3D cif->arg_types[i];
> +                    call_slots[i] =3D &stack[s];
> +                    s +=3D DIV_ROUND_UP(t->size, 8);
> +                }
> +
> +                /* Helper functions may need to access the "return addre=
ss" */
> +                tci_tb_ptr =3D (uintptr_t)tb_ptr;
> +                ffi_call(cif, func, stack, call_slots);
>              }
>=20=20
>              switch (len) {
> @@ -542,6 +539,9 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchSt=
ate *env,
>                   */
>                  memcpy(&regs[TCG_REG_R0], stack, 8);
>                  break;
> +            case 3: /* Int128 */
> +                memcpy(&regs[TCG_REG_R0], stack, 16);
> +                break;
>              default:
>                  g_assert_not_reached();
>              }
> diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
> index e3b0ff303f..c1d34d7bd1 100644
> --- a/tcg/tci/tcg-target.c.inc
> +++ b/tcg/tci/tcg-target.c.inc
> @@ -203,7 +203,7 @@ static const int tcg_target_call_iarg_regs[] =3D { };
>  static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
>  {
>      tcg_debug_assert(kind =3D=3D TCG_CALL_RET_NORMAL);
> -    tcg_debug_assert(slot >=3D 0 && slot < 64 / TCG_TARGET_REG_BITS);
> +    tcg_debug_assert(slot >=3D 0 && slot < 128 / TCG_TARGET_REG_BITS);
>      return TCG_REG_R0 + slot;
>  }
>=20=20
> @@ -573,11 +573,11 @@ static void tcg_out_call(TCGContext *s, const tcg_i=
nsn_unit *func,
>=20=20
>      if (cif->rtype =3D=3D &ffi_type_void) {
>          which =3D 0;
> -    } else if (cif->rtype->size =3D=3D 4) {
> -        which =3D 1;
>      } else {
> -        tcg_debug_assert(cif->rtype->size =3D=3D 8);
> -        which =3D 2;
> +        tcg_debug_assert(cif->rtype->size =3D=3D 4 ||
> +                         cif->rtype->size =3D=3D 8 ||
> +                         cif->rtype->size =3D=3D 16);
> +        which =3D ctz32(cif->rtype->size) - 1;
>      }
>      new_pool_l2(s, 20, s->code_ptr, 0, (uintptr_t)func, (uintptr_t)cif);
>      insn =3D deposit32(insn, 0, 8, INDEX_op_call);

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

