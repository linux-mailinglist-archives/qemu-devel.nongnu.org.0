Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B14EE68633C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 10:58:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN9sq-0006js-Hk; Wed, 01 Feb 2023 04:58:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pN9so-0006iw-KR
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 04:58:26 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pN9sm-00044l-FY
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 04:58:26 -0500
Received: by mail-wr1-x434.google.com with SMTP id r2so16729741wrv.7
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 01:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GsYilLP28kPYYbC2n1OEFF8Y7J+1oIkw+DX4UwWbFx8=;
 b=c4h/l3BT5H1T8A8axPvGi3h2acFRXtRLhcmje6FtRCvyTW+muAMUBXHIwWhivFM0Uj
 V7sqcWrjrK/vPCVR3imDmsEDt9L9B9Z7Wu5SX8XHdE0KBlYFAXL5C5KsGXvamIB8KOrX
 7IzPIRsC6A8uW/to2EvJTAK/6S3tt0ywh2+DKwvDnA/EKhLRC3buE2eB5FiKGVnTmSaS
 V8Xke1iuIyYwQWXUF13pL07SPpu7j9guzhyxanlOR3tpONQZ/3ZLtiQyh449YozSIIkL
 9c/lBRzOIQDroVv0YiZ9ATsjZnp//yCK7jOqfI/KpPCACjFYwyr1XGBFwlCSOwo62kLA
 320g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GsYilLP28kPYYbC2n1OEFF8Y7J+1oIkw+DX4UwWbFx8=;
 b=umWS3x/tnjIVSIAC92H5TejJxekZ+Sp3dr9k+0Pwa8Bm4j7MgoCPPSEN7BSh2GTpRy
 Lw5bKGf8tq7+CiQC1E1voCHPbotS15p6S0r0ABUE4BiT6a6Chx6lpbzHlSIa9Xf9h8lD
 sVFU1gQlVxjUQgfiNtnNHH24Xo2JvMKDduTsrXSiCeEO8XEUymi+PAYATZI+zdbzVwuU
 KPedHR4hxFtANke2La6ciNKDodXnVYOOx9F9o4uxaXz9VsjFWtQUHV7KaG1QP9BspJx+
 ceHwnV9MLDcy1fHXtpfOEc0gkawPv1v0nLa87hQZDYpys2Qi5H+VvEiGi0iVvyRCuW1n
 dZ1g==
X-Gm-Message-State: AO0yUKXeGd9s7TXNWCNg1otaIq0yISNxl3aH8spKcyySio5jvtw6RGtp
 TxOW5d7gmI9jSIT3W4HmApP+/g==
X-Google-Smtp-Source: AK7set9057qtMvJrpGPuNNBRChISPTDFV9O4q+SLZnlQZemLc44EOahbA1MU8sa1HYP5rQdEk50Z7w==
X-Received: by 2002:a5d:6103:0:b0:2bf:f7e9:2a18 with SMTP id
 v3-20020a5d6103000000b002bff7e92a18mr5706071wrt.45.1675245502790; 
 Wed, 01 Feb 2023 01:58:22 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a056000180200b002bfb5618ee7sm16894025wrh.91.2023.02.01.01.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 01:58:22 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DFB371FFB7;
 Wed,  1 Feb 2023 09:58:21 +0000 (GMT)
References: <20230130214844.1158612-1-richard.henderson@linaro.org>
 <20230130214844.1158612-16-richard.henderson@linaro.org>
User-agent: mu4e 1.9.18; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, philmd@linaro.org
Subject: Re: [PATCH v6 15/36] tcg: Add guest load/store primitives for
 TCGv_i128
Date: Wed, 01 Feb 2023 09:52:13 +0000
In-reply-to: <20230130214844.1158612-16-richard.henderson@linaro.org>
Message-ID: <874js5u2pu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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

> These are not yet considering atomicity of the 16-byte value;
> this is a direct replacement for the current target code which
> uses a pair of 8-byte operations.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/cpu_ldst.h |  10 +++
>  include/tcg/tcg-op.h    |   2 +
>  accel/tcg/cputlb.c      | 112 +++++++++++++++++++++++++++++++++
>  accel/tcg/user-exec.c   |  66 ++++++++++++++++++++
>  tcg/tcg-op.c            | 134 ++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 324 insertions(+)
>
> diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
> index d0c7c0d5fe..09b55cc0ee 100644
> --- a/include/exec/cpu_ldst.h
> +++ b/include/exec/cpu_ldst.h
> @@ -220,6 +220,11 @@ uint32_t cpu_ldl_le_mmu(CPUArchState *env, abi_ptr p=
tr,
>  uint64_t cpu_ldq_le_mmu(CPUArchState *env, abi_ptr ptr,
>                          MemOpIdx oi, uintptr_t ra);
>=20=20
> +Int128 cpu_ld16_be_mmu(CPUArchState *env, abi_ptr addr,
> +                       MemOpIdx oi, uintptr_t ra);
> +Int128 cpu_ld16_le_mmu(CPUArchState *env, abi_ptr addr,
> +                       MemOpIdx oi, uintptr_t ra);
> +
>  void cpu_stb_mmu(CPUArchState *env, abi_ptr ptr, uint8_t val,
>                   MemOpIdx oi, uintptr_t ra);
>  void cpu_stw_be_mmu(CPUArchState *env, abi_ptr ptr, uint16_t val,
> @@ -235,6 +240,11 @@ void cpu_stl_le_mmu(CPUArchState *env, abi_ptr ptr, =
uint32_t val,
>  void cpu_stq_le_mmu(CPUArchState *env, abi_ptr ptr, uint64_t val,
>                      MemOpIdx oi, uintptr_t ra);
>=20=20
> +void cpu_st16_be_mmu(CPUArchState *env, abi_ptr addr, Int128 val,
> +                     MemOpIdx oi, uintptr_t ra);
> +void cpu_st16_le_mmu(CPUArchState *env, abi_ptr addr, Int128 val,
> +                     MemOpIdx oi, uintptr_t ra);
> +
>  uint32_t cpu_atomic_cmpxchgb_mmu(CPUArchState *env, target_ulong addr,
>                                   uint32_t cmpv, uint32_t newv,
>                                   MemOpIdx oi, uintptr_t retaddr);
> diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
> index c4276767d1..e5f5b63c37 100644
> --- a/include/tcg/tcg-op.h
> +++ b/include/tcg/tcg-op.h
> @@ -845,6 +845,8 @@ void tcg_gen_qemu_ld_i32(TCGv_i32, TCGv, TCGArg, MemO=
p);
>  void tcg_gen_qemu_st_i32(TCGv_i32, TCGv, TCGArg, MemOp);
>  void tcg_gen_qemu_ld_i64(TCGv_i64, TCGv, TCGArg, MemOp);
>  void tcg_gen_qemu_st_i64(TCGv_i64, TCGv, TCGArg, MemOp);
> +void tcg_gen_qemu_ld_i128(TCGv_i128, TCGv, TCGArg, MemOp);
> +void tcg_gen_qemu_st_i128(TCGv_i128, TCGv, TCGArg, MemOp);
>=20=20
>  static inline void tcg_gen_qemu_ld8u(TCGv ret, TCGv addr, int mem_index)
>  {
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 4e040a1cb9..e3604ad313 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -2187,6 +2187,64 @@ uint64_t cpu_ldq_le_mmu(CPUArchState *env, abi_ptr=
 addr,
>      return cpu_load_helper(env, addr, oi, ra, helper_le_ldq_mmu);
>  }
>=20=20
> +Int128 cpu_ld16_be_mmu(CPUArchState *env, abi_ptr addr,
> +                       MemOpIdx oi, uintptr_t ra)
> +{
> +    MemOp mop =3D get_memop(oi);
> +    int mmu_idx =3D get_mmuidx(oi);
> +    MemOpIdx new_oi;
> +    unsigned a_bits;
> +    uint64_t h, l;
> +
> +    tcg_debug_assert((mop & (MO_BSWAP|MO_SSIZE)) =3D=3D (MO_BE|MO_128));
> +    a_bits =3D get_alignment_bits(mop);
> +
> +    /* Handle CPU specific unaligned behaviour */
> +    if (addr & ((1 << a_bits) - 1)) {
> +        cpu_unaligned_access(env_cpu(env), addr, MMU_DATA_LOAD,
> +                             mmu_idx, ra);
> +    }
> +
> +    /* Construct an unaligned 64-bit replacement MemOpIdx. */
> +    mop =3D (mop & ~(MO_SIZE | MO_AMASK)) | MO_64 | MO_UNALN;
> +    new_oi =3D make_memop_idx(mop, mmu_idx);
> +
> +    h =3D helper_be_ldq_mmu(env, addr, new_oi, ra);
> +    l =3D helper_be_ldq_mmu(env, addr + 8, new_oi, ra);
> +
> +    qemu_plugin_vcpu_mem_cb(env_cpu(env), addr, oi, QEMU_PLUGIN_MEM_R);
> +    return int128_make128(l, h);
> +}
> +
> +Int128 cpu_ld16_le_mmu(CPUArchState *env, abi_ptr addr,
> +                       MemOpIdx oi, uintptr_t ra)
> +{
> +    MemOp mop =3D get_memop(oi);
> +    int mmu_idx =3D get_mmuidx(oi);
> +    MemOpIdx new_oi;
> +    unsigned a_bits;
> +    uint64_t h, l;
> +
> +    tcg_debug_assert((mop & (MO_BSWAP|MO_SSIZE)) =3D=3D (MO_LE|MO_128));

Why not use validate_memop for this like elsewhere in cputlb?

<snip>
>=20=20
> +void cpu_st16_be_mmu(CPUArchState *env, abi_ptr addr, Int128 val,
> +                     MemOpIdx oi, uintptr_t ra)
> +{
> +    MemOp mop =3D get_memop(oi);
> +    int mmu_idx =3D get_mmuidx(oi);
> +    MemOpIdx new_oi;
> +    unsigned a_bits;
> +
> +    tcg_debug_assert((mop & (MO_BSWAP|MO_SSIZE)) =3D=3D (MO_BE|MO_128));

ditto for the others

> diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
> index cb83d2375d..33ef325f6e 100644
> --- a/tcg/tcg-op.c
> +++ b/tcg/tcg-op.c
> @@ -3109,6 +3109,140 @@ void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr,=
 TCGArg idx, MemOp memop)
>      }
>  }
>

I'm confused because the TCG ops in this patch are still using i64  and
the atomic use hasn't come in yet. Worth splitting the patch?

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


> +static void canonicalize_memop_i128_as_i64(MemOp ret[2], MemOp orig)
> +{
> +    MemOp mop_1 =3D orig, mop_2;
> +
> +    tcg_debug_assert((orig & MO_SIZE) =3D=3D MO_128);
> +    tcg_debug_assert((orig & MO_SIGN) =3D=3D 0);
> +
> +    /* Use a memory ordering implemented by the host. */
> +    if (!TCG_TARGET_HAS_MEMORY_BSWAP && (orig & MO_BSWAP)) {
> +        mop_1 &=3D ~MO_BSWAP;
> +    }
> +
> +    /* Reduce the size to 64-bit. */
> +    mop_1 =3D (mop_1 & ~MO_SIZE) | MO_64;
> +
> +    /* Retain the alignment constraints of the original. */
> +    switch (orig & MO_AMASK) {
> +    case MO_UNALN:
> +    case MO_ALIGN_2:
> +    case MO_ALIGN_4:
> +        mop_2 =3D mop_1;
> +        break;
> +    case MO_ALIGN_8:
> +        /* Prefer MO_ALIGN+MO_64 to MO_ALIGN_8+MO_64. */
> +        mop_1 =3D (mop_1 & ~MO_AMASK) | MO_ALIGN;
> +        mop_2 =3D mop_1;
> +        break;
> +    case MO_ALIGN:
> +        /* Second has 8-byte alignment; first has 16-byte alignment. */
> +        mop_2 =3D mop_1;
> +        mop_1 =3D (mop_1 & ~MO_AMASK) | MO_ALIGN_16;
> +        break;
> +    case MO_ALIGN_16:
> +    case MO_ALIGN_32:
> +    case MO_ALIGN_64:
> +        /* Second has 8-byte alignment; first retains original. */
> +        mop_2 =3D (mop_1 & ~MO_AMASK) | MO_ALIGN;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +    ret[0] =3D mop_1;
> +    ret[1] =3D mop_2;
> +}
> +
> +void tcg_gen_qemu_ld_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp me=
mop)
> +{
> +    MemOp mop[2];
> +    TCGv addr_p8;
> +    TCGv_i64 x, y;
> +
> +    canonicalize_memop_i128_as_i64(mop, memop);
> +
> +    tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
> +    addr =3D plugin_prep_mem_callbacks(addr);
> +
> +    /* TODO: respect atomicity of the operation. */
> +    /* TODO: allow the tcg backend to see the whole operation. */
> +
> +    /*
> +     * Since there are no global TCGv_i128, there is no visible state
> +     * changed if the second load faults.  Load directly into the two
> +     * subwords.
> +     */
> +    if ((memop & MO_BSWAP) =3D=3D MO_LE) {
> +        x =3D TCGV128_LOW(val);
> +        y =3D TCGV128_HIGH(val);
> +    } else {
> +        x =3D TCGV128_HIGH(val);
> +        y =3D TCGV128_LOW(val);
> +    }
> +
> +    gen_ldst_i64(INDEX_op_qemu_ld_i64, x, addr, mop[0], idx);
> +
> +    if ((mop[0] ^ memop) & MO_BSWAP) {
> +        tcg_gen_bswap64_i64(x, x);
> +    }
> +
> +    addr_p8 =3D tcg_temp_new();
> +    tcg_gen_addi_tl(addr_p8, addr, 8);
> +    gen_ldst_i64(INDEX_op_qemu_ld_i64, y, addr_p8, mop[1], idx);
> +    tcg_temp_free(addr_p8);
> +
> +    if ((mop[0] ^ memop) & MO_BSWAP) {
> +        tcg_gen_bswap64_i64(y, y);
> +    }
> +
> +    plugin_gen_mem_callbacks(addr, make_memop_idx(memop, idx),
> +                             QEMU_PLUGIN_MEM_R);
> +}
> +
> +void tcg_gen_qemu_st_i128(TCGv_i128 val, TCGv addr, TCGArg idx, MemOp me=
mop)
> +{
> +    MemOp mop[2];
> +    TCGv addr_p8;
> +    TCGv_i64 x, y;
> +
> +    canonicalize_memop_i128_as_i64(mop, memop);
> +
> +    tcg_gen_req_mo(TCG_MO_ST_LD | TCG_MO_ST_ST);
> +    addr =3D plugin_prep_mem_callbacks(addr);
> +
> +    /* TODO: respect atomicity of the operation. */
> +    /* TODO: allow the tcg backend to see the whole operation. */
> +
> +    if ((memop & MO_BSWAP) =3D=3D MO_LE) {
> +        x =3D TCGV128_LOW(val);
> +        y =3D TCGV128_HIGH(val);
> +    } else {
> +        x =3D TCGV128_HIGH(val);
> +        y =3D TCGV128_LOW(val);
> +    }
> +
> +    addr_p8 =3D tcg_temp_new();
> +    if ((mop[0] ^ memop) & MO_BSWAP) {
> +        TCGv_i64 t =3D tcg_temp_new_i64();
> +
> +        tcg_gen_bswap64_i64(t, x);
> +        gen_ldst_i64(INDEX_op_qemu_st_i64, t, addr, mop[0], idx);
> +        tcg_gen_bswap64_i64(t, y);
> +        tcg_gen_addi_tl(addr_p8, addr, 8);
> +        gen_ldst_i64(INDEX_op_qemu_st_i64, t, addr_p8, mop[1], idx);
> +        tcg_temp_free_i64(t);
> +    } else {
> +        gen_ldst_i64(INDEX_op_qemu_st_i64, x, addr, mop[0], idx);
> +        tcg_gen_addi_tl(addr_p8, addr, 8);
> +        gen_ldst_i64(INDEX_op_qemu_st_i64, y, addr_p8, mop[1], idx);
> +    }
> +    tcg_temp_free(addr_p8);
> +
> +    plugin_gen_mem_callbacks(addr, make_memop_idx(memop, idx),
> +                             QEMU_PLUGIN_MEM_W);
> +}
> +
>  static void tcg_gen_ext_i32(TCGv_i32 ret, TCGv_i32 val, MemOp opc)
>  {
>      switch (opc & MO_SSIZE) {


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

