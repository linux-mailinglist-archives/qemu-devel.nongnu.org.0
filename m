Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CE0324C01
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 09:26:59 +0100 (CET)
Received: from localhost ([::1]:59484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFBz9-0005xA-1c
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 03:26:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lFBxr-0005Gy-98
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 03:25:39 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:44825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lFBxo-0001fC-CD
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 03:25:38 -0500
Received: by mail-wr1-x435.google.com with SMTP id h98so4312055wrh.11
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 00:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=GetQXnjTJ+yFFLuyHcxVO2ADma/dnx2w41yHgtqt588=;
 b=npt32lGk+cR5HqYnSgZta4TuF8nzBVuZnMBodWCEzqfJ9JzqK8tGXg0ZlVADhdFxEU
 r7HHkpL6sRZcPCkbNt8pIIUEwnqIMU/+IJrdshdB4i6M9RvkTXCvvdd0zJvcy37L4x5e
 2nTHMMbclDEqK5lfEap3Ab/Du5KQ5VQuITBIUudK7BhATgTIuMfmlKkRuMeLWO6HmRgx
 iG+RLPoNTmKd0GyKAj65u6ACKf2/Izz6LuYHUyFaRtMKliOMLB0W724WrWiRC5GRW4E7
 tgd3hw4TDa/erJwUUn4C1/7i0hH1U7x5nTKEz2q//Jszr2ksNr5an7mUAFcCEOdw14I6
 P4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=GetQXnjTJ+yFFLuyHcxVO2ADma/dnx2w41yHgtqt588=;
 b=L1ndVhkZ8C3WtPWub324sFV+ZcIO0uvGPB9X7fUnw97ev7wb6CacwrKGZHilbEGHIg
 sv77KT2AVFG9mBKzAdZmS4aiq4qFH3FpWW2wRfGYBHKKYJDQGAdOL9pPipWsOzPWzRNC
 YdS5JfwDRIuRrjTvHbFPYu4/h+Zwg8o6WE2hlxlx+EllAhIhZMz/8ZAF9KyMsYCL/SyR
 0+9FYPOZ4WKxSj6vWtOflCqtIZrsxEA0RCBORUeOJid0sHJp7CzwiNj+ZOkv+k4x46KT
 2n1Gnah/UiPhcGsN1sXf5DTuO1BvM88JbHL49KglxtjLhOQNPFCzbVrXDxQzm4H8hjph
 Fysw==
X-Gm-Message-State: AOAM533k5EPd6q6kGSm5IvY8IytLA+xBSLWNRfZP//2uv+jF7iO7yhlc
 TzsI6vkH/umLwFDJAyBUQfqCwg==
X-Google-Smtp-Source: ABdhPJxF5sqM9Pby0BGQ2rw2u+94iPQOv1tyk1ZSPiiaJoKsZm7J1Vnjd4YZWaS33DKyh0Jir8sK+A==
X-Received: by 2002:a5d:4e41:: with SMTP id r1mr2216041wrt.6.1614241534254;
 Thu, 25 Feb 2021 00:25:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f22sm6098400wmb.31.2021.02.25.00.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 00:25:33 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 439DE1FF7E;
 Thu, 25 Feb 2021 08:25:32 +0000 (GMT)
References: <20210224224459.275146-1-richard.henderson@linaro.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] target/arm: Speed up aarch64 TBL/TBX
Date: Thu, 25 Feb 2021 08:22:45 +0000
In-reply-to: <20210224224459.275146-1-richard.henderson@linaro.org>
Message-ID: <87a6rsblkz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Always perform one call instead of two for 16-byte operands.
> Use byte loads/stores directly into the vector register file
> instead of extractions and deposits to a 64-bit local variable.
>
> In order to easily receive pointers into the vector register file,
> convert the helper to the gvec out-of-line signature.  Move the
> helper into vec_helper.c, where it can make use of H1 and clear_tail.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Much better, drops from 12.34% to 5.09% of total runtime, now almost all
inline:

  https://fileserver.linaro.org/s/cEZxoLGQ2pMi4xe


Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>
> Alex, as briefly discussed on IRC today, streamline the TBL/TBX
> implementation.  Would you run this through whatever benchmark
> you were experimenting with today?  This is unmeasureable in RISU
> (exactly one perf hit in the helper through the entire run).
>
> r~
>
> ---
>  target/arm/helper-a64.h    |  2 +-
>  target/arm/helper-a64.c    | 32 ---------------------
>  target/arm/translate-a64.c | 58 +++++---------------------------------
>  target/arm/vec_helper.c    | 52 ++++++++++++++++++++++++++++++++++
>  4 files changed, 60 insertions(+), 84 deletions(-)
>
> diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
> index 7bd6aed659..c139fa81f9 100644
> --- a/target/arm/helper-a64.h
> +++ b/target/arm/helper-a64.h
> @@ -28,7 +28,7 @@ DEF_HELPER_3(vfp_cmps_a64, i64, f32, f32, ptr)
>  DEF_HELPER_3(vfp_cmpes_a64, i64, f32, f32, ptr)
>  DEF_HELPER_3(vfp_cmpd_a64, i64, f64, f64, ptr)
>  DEF_HELPER_3(vfp_cmped_a64, i64, f64, f64, ptr)
> -DEF_HELPER_FLAGS_5(simd_tbl, TCG_CALL_NO_RWG_SE, i64, env, i64, i64, i32=
, i32)
> +DEF_HELPER_FLAGS_4(simd_tblx, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_3(vfp_mulxs, TCG_CALL_NO_RWG, f32, f32, f32, ptr)
>  DEF_HELPER_FLAGS_3(vfp_mulxd, TCG_CALL_NO_RWG, f64, f64, f64, ptr)
>  DEF_HELPER_FLAGS_3(neon_ceq_f64, TCG_CALL_NO_RWG, i64, i64, i64, ptr)
> diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
> index 7f56c78fa6..061c8ff846 100644
> --- a/target/arm/helper-a64.c
> +++ b/target/arm/helper-a64.c
> @@ -179,38 +179,6 @@ float64 HELPER(vfp_mulxd)(float64 a, float64 b, void=
 *fpstp)
>      return float64_mul(a, b, fpst);
>  }
>=20=20
> -uint64_t HELPER(simd_tbl)(CPUARMState *env, uint64_t result, uint64_t in=
dices,
> -                          uint32_t rn, uint32_t numregs)
> -{
> -    /* Helper function for SIMD TBL and TBX. We have to do the table
> -     * lookup part for the 64 bits worth of indices we're passed in.
> -     * result is the initial results vector (either zeroes for TBL
> -     * or some guest values for TBX), rn the register number where
> -     * the table starts, and numregs the number of registers in the tabl=
e.
> -     * We return the results of the lookups.
> -     */
> -    int shift;
> -
> -    for (shift =3D 0; shift < 64; shift +=3D 8) {
> -        int index =3D extract64(indices, shift, 8);
> -        if (index < 16 * numregs) {
> -            /* Convert index (a byte offset into the virtual table
> -             * which is a series of 128-bit vectors concatenated)
> -             * into the correct register element plus a bit offset
> -             * into that element, bearing in mind that the table
> -             * can wrap around from V31 to V0.
> -             */
> -            int elt =3D (rn * 2 + (index >> 3)) % 64;
> -            int bitidx =3D (index & 7) * 8;
> -            uint64_t *q =3D aa64_vfp_qreg(env, elt >> 1);
> -            uint64_t val =3D extract64(q[elt & 1], bitidx, 8);
> -
> -            result =3D deposit64(result, shift, 8, val);
> -        }
> -    }
> -    return result;
> -}
> -
>  /* 64bit/double versions of the neon float compare functions */
>  uint64_t HELPER(neon_ceq_f64)(float64 a, float64 b, void *fpstp)
>  {
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index b23a8975d5..496e14688a 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -7520,10 +7520,8 @@ static void disas_simd_tb(DisasContext *s, uint32_=
t insn)
>      int rm =3D extract32(insn, 16, 5);
>      int rn =3D extract32(insn, 5, 5);
>      int rd =3D extract32(insn, 0, 5);
> -    int is_tblx =3D extract32(insn, 12, 1);
> -    int len =3D extract32(insn, 13, 2);
> -    TCGv_i64 tcg_resl, tcg_resh, tcg_idx;
> -    TCGv_i32 tcg_regno, tcg_numregs;
> +    int is_tbx =3D extract32(insn, 12, 1);
> +    int len =3D (extract32(insn, 13, 2) + 1) * 16;
>=20=20
>      if (op2 !=3D 0) {
>          unallocated_encoding(s);
> @@ -7534,53 +7532,11 @@ static void disas_simd_tb(DisasContext *s, uint32=
_t insn)
>          return;
>      }
>=20=20
> -    /* This does a table lookup: for every byte element in the input
> -     * we index into a table formed from up to four vector registers,
> -     * and then the output is the result of the lookups. Our helper
> -     * function does the lookup operation for a single 64 bit part of
> -     * the input.
> -     */
> -    tcg_resl =3D tcg_temp_new_i64();
> -    tcg_resh =3D NULL;
> -
> -    if (is_tblx) {
> -        read_vec_element(s, tcg_resl, rd, 0, MO_64);
> -    } else {
> -        tcg_gen_movi_i64(tcg_resl, 0);
> -    }
> -
> -    if (is_q) {
> -        tcg_resh =3D tcg_temp_new_i64();
> -        if (is_tblx) {
> -            read_vec_element(s, tcg_resh, rd, 1, MO_64);
> -        } else {
> -            tcg_gen_movi_i64(tcg_resh, 0);
> -        }
> -    }
> -
> -    tcg_idx =3D tcg_temp_new_i64();
> -    tcg_regno =3D tcg_const_i32(rn);
> -    tcg_numregs =3D tcg_const_i32(len + 1);
> -    read_vec_element(s, tcg_idx, rm, 0, MO_64);
> -    gen_helper_simd_tbl(tcg_resl, cpu_env, tcg_resl, tcg_idx,
> -                        tcg_regno, tcg_numregs);
> -    if (is_q) {
> -        read_vec_element(s, tcg_idx, rm, 1, MO_64);
> -        gen_helper_simd_tbl(tcg_resh, cpu_env, tcg_resh, tcg_idx,
> -                            tcg_regno, tcg_numregs);
> -    }
> -    tcg_temp_free_i64(tcg_idx);
> -    tcg_temp_free_i32(tcg_regno);
> -    tcg_temp_free_i32(tcg_numregs);
> -
> -    write_vec_element(s, tcg_resl, rd, 0, MO_64);
> -    tcg_temp_free_i64(tcg_resl);
> -
> -    if (is_q) {
> -        write_vec_element(s, tcg_resh, rd, 1, MO_64);
> -        tcg_temp_free_i64(tcg_resh);
> -    }
> -    clear_vec_high(s, is_q, rd);
> +    tcg_gen_gvec_2_ptr(vec_full_reg_offset(s, rd),
> +                       vec_full_reg_offset(s, rm), cpu_env,
> +                       is_q ? 16 : 8, vec_full_reg_size(s),
> +                       (len << 6) | (is_tbx << 5) | rn,
> +                       gen_helper_simd_tblx);
>  }
>=20=20
>  /* ZIP/UZP/TRN
> diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
> index 7174030377..d164273f20 100644
> --- a/target/arm/vec_helper.c
> +++ b/target/arm/vec_helper.c
> @@ -1937,3 +1937,55 @@ DO_VRINT_RMODE(gvec_vrint_rm_h, helper_rinth, uint=
16_t)
>  DO_VRINT_RMODE(gvec_vrint_rm_s, helper_rints, uint32_t)
>=20=20
>  #undef DO_VRINT_RMODE
> +
> +#ifdef TARGET_AARCH64
> +void HELPER(simd_tblx)(void *vd, void *vm, void *venv, uint32_t desc)
> +{
> +    uint64_t *d =3D vd;
> +    const uint8_t *indices =3D vm;
> +    CPUARMState *env =3D venv;
> +    size_t oprsz =3D simd_oprsz(desc);
> +    uint32_t rn =3D extract32(desc, SIMD_DATA_SHIFT, 5);
> +    bool is_tbx =3D extract32(desc, SIMD_DATA_SHIFT + 5, 1);
> +    uint32_t table_len =3D desc >> (SIMD_DATA_SHIFT + 6);
> +    union {
> +        uint8_t b[16];
> +        uint64_t d[2];
> +    } result;
> +
> +    /*
> +     * We must construct the final result in a temp, lest the output
> +     * overlaps the input table.  For TBL, begin with zero; for TBX,
> +     * begin with the original register contents.  Note that for
> +     * oprsz =3D=3D 8, we always clear the balance of the register.
> +     */
> +    if (is_tbx) {
> +        uint64_t d1 =3D d[1];
> +        result.d[0] =3D d[0];
> +        result.d[1] =3D oprsz =3D=3D 8 ? 0 : d1;
> +    } else {
> +        result.d[0] =3D 0;
> +        result.d[1] =3D 0;
> +    }
> +
> +    for (size_t i =3D 0; i < oprsz; ++i) {
> +        uint32_t index =3D indices[H1(i)];
> +
> +        if (index < table_len) {
> +            /*
> +             * Convert index (a byte offset into the virtual table
> +             * which is a series of 128-bit vectors concatenated)
> +             * into the correct register element, bearing in mind
> +             * that the table can wrap around from V31 to V0.
> +             */
> +            const uint8_t *table =3D (const uint8_t *)
> +                aa64_vfp_qreg(env, (rn + (index >> 4)) % 32);
> +            result.b[H1(i)] =3D table[H1(index % 16)];
> +        }
> +    }
> +
> +    d[0] =3D result.d[0];
> +    d[1] =3D result.d[1];
> +    clear_tail(d, 16, simd_maxsz(desc));
> +}
> +#endif


--=20
Alex Benn=C3=A9e

