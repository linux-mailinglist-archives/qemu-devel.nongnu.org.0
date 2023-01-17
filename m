Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 361A666E5F1
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 19:28:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHqhO-0005Y0-7I; Tue, 17 Jan 2023 13:28:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHqhK-0005Xr-K1
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 13:28:39 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHqh7-0006pE-MV
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 13:28:36 -0500
Received: by mail-wr1-x433.google.com with SMTP id z5so30489125wrt.6
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 10:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lCCtL0wmK3tBv+weXnw4cKC+WWG39HsjxKX8Up4A6PM=;
 b=Y5mEJyyMPZx78V+Y+xNSQUlk1jNYNs2N9752UcC8LjXVH9MZXMuORQYbTzLl2ZsK2J
 A0UuiFizVqOxdxjEkP9PBgkKLxNlNJs1flpTcghPDD4YASpoxQTIJ15ddJrwvuBiLsjy
 qYBoq4UNaHCatNBUJJ3BoVvOs1o0kuGsPnI8XfmVrjS7a4iWLBioGlzuUnwK2BaBxAkU
 /Gwr3aA6sE1N2hENMPaqhMpeUJRQq8Z2lVlSGXXhhYzaEkSBhwoKAS9cYVslEGLjMJvn
 H+rCCrwCBSvrpHkypkGyWQdMg0wj+HESNsDRyMLHEi7BrqHfFgH+Q/QFl9R+u4oYfWQQ
 yj9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lCCtL0wmK3tBv+weXnw4cKC+WWG39HsjxKX8Up4A6PM=;
 b=Rc8x7o/cdAg9yJZi4sNe3+/GBhwzZe7uVit8IFPK+t/EOTlVHn1FzwI1mNVyZEqc6m
 eYQQLxPgZ6Dxvzl4BW1LK3K6qyJ4Xiu6Z8EZBghMsbRmrXLrKg+UPU2CaSNd3K0Cptmk
 /RcR24pZScFbjSo5Fx3Vqaem6ND0/yrxkG1PJDhuVRkdwR1yBfGg+RBVwNsA+ZgHCph/
 cMxn1FWYVVyO/Sw6iagNLWpl40VERgR/hRGxG3/QYvDAzenldEglwDiQ+Q+L82EQtISK
 r7SR6Iy/8ktGXDoXP4UyubW9xo4SxN3iLvgIZ/psQnWOQg5ozg22bKtIfk4N6TkbmiiZ
 VrIA==
X-Gm-Message-State: AFqh2kp0j0fTXmhYks9QtBVGP4e1AUqfb90ew0dRsNywIo+M41WHQ39s
 Yf0zcJ1PLkeISlPrKeTueKia09/77Ok3UOHS
X-Google-Smtp-Source: AMrXdXv59fxT9aoKq0OThj4kFg+cMVAlDUInzWqM/WejwRDdUGKsM4BiO2IM8HfOD+7L4OyIfVEGKA==
X-Received: by 2002:adf:f78d:0:b0:2bd:bed5:9207 with SMTP id
 q13-20020adff78d000000b002bdbed59207mr3570906wrp.12.1673980102207; 
 Tue, 17 Jan 2023 10:28:22 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 w5-20020adfcd05000000b002bdc914a139sm19373762wrm.108.2023.01.17.10.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 10:28:21 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 657B21FFB7;
 Tue, 17 Jan 2023 18:28:21 +0000 (GMT)
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
 <20230109014248.2894281-17-richard.henderson@linaro.org>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: hev <r@hev.cc>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 16/22] tcg/aarch64: Reorg goto_tb implementation
Date: Tue, 17 Jan 2023 18:26:29 +0000
In-reply-to: <20230109014248.2894281-17-richard.henderson@linaro.org>
Message-ID: <87tu0p10e2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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

> The old implementation replaces two insns, swapping between
>
> 	b	<dest>
> 	nop
> 	br	x30
> and
> 	adrp	x30, <dest>
> 	addi	x30, x30, lo12:<dest>
> 	br	x30
>
> There is a race condition in which a thread could be stopped at
> the PC of the second insn, and when restarted does not see the
> complete address computation and branches to nowhere.
>
> The new implemetation replaces only one insn, swapping between
>
> 	b	<dest>
> 	br	tmp
> and
> 	ldr	tmp, <jmp_addr>
> 	br	tmp
>
> Reported-by: hev <r@hev.cc>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/aarch64/tcg-target.h     |  3 +-
>  tcg/aarch64/tcg-target.c.inc | 64 +++++++++++++++---------------------
>  2 files changed, 28 insertions(+), 39 deletions(-)
>
> diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
> index 6067446b03..0ba2298ea6 100644
> --- a/tcg/aarch64/tcg-target.h
> +++ b/tcg/aarch64/tcg-target.h
> @@ -15,7 +15,8 @@
>=20=20
>  #define TCG_TARGET_INSN_UNIT_SIZE  4
>  #define TCG_TARGET_TLB_DISPLACEMENT_BITS 24
> -#define MAX_CODE_GEN_BUFFER_SIZE  (2 * GiB)
> +#define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
> +#undef TCG_TARGET_STACK_GROWSUP
>=20=20
>  typedef enum {
>      TCG_REG_X0, TCG_REG_X1, TCG_REG_X2, TCG_REG_X3,
> diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
> index 0b65f2cac1..1d0ebf01a5 100644
> --- a/tcg/aarch64/tcg-target.c.inc
> +++ b/tcg/aarch64/tcg-target.c.inc
> @@ -1353,33 +1353,6 @@ static void tcg_out_call(TCGContext *s, const tcg_=
insn_unit *target,
>      tcg_out_call_int(s, target);
>  }
>=20=20
> -void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
> -                              uintptr_t jmp_rx, uintptr_t jmp_rw)
> -{
> -    uintptr_t addr =3D tb->jmp_target_addr[n];
> -    tcg_insn_unit i1, i2;
> -    TCGType rt =3D TCG_TYPE_I64;
> -    TCGReg  rd =3D TCG_REG_TMP;
> -    uint64_t pair;
> -
> -    ptrdiff_t offset =3D addr - jmp_rx;
> -
> -    if (offset =3D=3D sextract64(offset, 0, 26)) {
> -        i1 =3D I3206_B | ((offset >> 2) & 0x3ffffff);
> -        i2 =3D NOP;
> -    } else {
> -        offset =3D (addr >> 12) - (jmp_rx >> 12);
> -
> -        /* patch ADRP */
> -        i1 =3D I3406_ADRP | (offset & 3) << 29 | (offset & 0x1ffffc) << =
(5 - 2) | rd;
> -        /* patch ADDI */
> -        i2 =3D I3401_ADDI | rt << 31 | (addr & 0xfff) << 10 | rd << 5 | =
rd;
> -    }
> -    pair =3D (uint64_t)i2 << 32 | i1;
> -    qatomic_set((uint64_t *)jmp_rw, pair);
> -    flush_idcache_range(jmp_rx, jmp_rw, 8);
> -}
> -
>  static inline void tcg_out_goto_label(TCGContext *s, TCGLabel *l)
>  {
>      if (!l->has_value) {
> @@ -1902,23 +1875,38 @@ static void tcg_out_exit_tb(TCGContext *s, uintpt=
r_t a0)
>  static void tcg_out_goto_tb(TCGContext *s, int which)
>  {
>      /*
> -     * Ensure that ADRP+ADD are 8-byte aligned so that an atomic
> -     * write can be used to patch the target address.
> +     * Direct branch, or indirect address load, will be patched
> +     * by tb_target_set_jmp_target.  Assert indirect load offset
> +     * in range early, regardless of direct branch distance.
>       */
> -    if ((uintptr_t)s->code_ptr & 7) {
> -        tcg_out32(s, NOP);
> -    }
> +    intptr_t i_off =3D tcg_pcrel_diff(s, (void *)get_jmp_target_addr(s, =
which));
> +    tcg_debug_assert(i_off =3D=3D sextract64(i_off, 0, 21));
> +
>      set_jmp_insn_offset(s, which);
> -    /*
> -     * actual branch destination will be patched by
> -     * tb_target_set_jmp_target later
> -     */
> -    tcg_out_insn(s, 3406, ADRP, TCG_REG_TMP, 0);
> -    tcg_out_insn(s, 3401, ADDI, TCG_TYPE_I64, TCG_REG_TMP, TCG_REG_TMP, =
0);
> +    tcg_out32(s, I3206_B);
>      tcg_out_insn(s, 3207, BR, TCG_REG_TMP);
>      set_jmp_reset_offset(s, which);
>  }
>=20=20
> +void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
> +                              uintptr_t jmp_rx, uintptr_t jmp_rw)
> +{
> +    uintptr_t d_addr =3D tb->jmp_target_addr[n];
> +    uintptr_t i_addr =3D (uintptr_t)&tb->jmp_target_addr[n];
> +    ptrdiff_t d_offset =3D d_addr - jmp_rx;
> +    ptrdiff_t i_offset =3D i_addr - jmp_rx;
> +    tcg_insn_unit insn;
> +
> +    /* Either directly branch, or indirect branch load. */
> +    if (d_offset =3D=3D sextract64(d_offset, 0, 26)) {
> +        insn =3D I3206_B | ((d_offset >> 2) & 0x3ffffff);
> +    } else {
> +        insn =3D I3305_LDR | TCG_REG_TMP | (((i_offset >> 2) & 0x7ffff) =
<< 5);
> +    }

Could we use deposits to build our instructions here? Also the mask
doesn't match the 24 bits you have left, bug from old code?

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

