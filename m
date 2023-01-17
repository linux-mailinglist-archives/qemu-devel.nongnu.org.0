Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A409A66E5F0
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 19:27:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHqey-0004RM-Lu; Tue, 17 Jan 2023 13:26:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHqew-0004PJ-J4
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 13:26:10 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHqet-0006Wv-3Q
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 13:26:09 -0500
Received: by mail-wr1-x42f.google.com with SMTP id b5so10370307wrn.0
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 10:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bju+VQalxvPII3L94F/t/jIIp0nTUHi8cCTevyl9eOI=;
 b=Np1zO0zRv/RJU2r74K1chhDzM+V7UJSVT/iFqGav4a5l96nbx2bGr5dXhCvkVqoZyq
 M0fBiJNZymIO91JdjJRGR98gnTUxpGzVR15ZufTOU0eRNJQSF1lBepRQVpQjiNuIIeif
 wj19PcypdLxLMph95GnCDzJ2JtgYjOVFUAtqVw2xxcSFagtZ8KN+650LKUqx4v6Da452
 FJzoUOITymyXOfVPazAULblb7ElPe3qi9hzUDdO5VQCLoAFph7vp7cPt/EzqTXk6G2Bd
 JjgU9j/DZZ+ONDelXpSLGFmwGYnjbcaMo76VMPA2LZDVMgNRn4Nwo4RMOelfwDGpwWbc
 B6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Bju+VQalxvPII3L94F/t/jIIp0nTUHi8cCTevyl9eOI=;
 b=po9WSDv2H0+6g4EafRJHZZR693+K1EtqHjzDULRpI5HR+UeaAID+xIeL8X/SwHL+VA
 OCkSsamGVM1V7CEn0e5l4pywELbDvYBPSlsQOI1Whm8+oCV0w2GTj4VY/nX1So8i3E6T
 6Xs/yjl44qo/Da8ipDYOLf0P/wivCdiM4v3qrSM5wW3mTI/tR54RPuwiIsEk4GKPHDuz
 h6L10EpDt9t4pTc8/yHq8mxPpgX0t3CUdLh2kRjx6aRh0+x6k7MqXC48IL/TqjXdhUbG
 uPdUv9hBdk4uPI7PzPm4J6ZtLgjdoSgvtYUTAnOoKS3PCZw59TbZqhtpuS0KO6Le8qGx
 i0lw==
X-Gm-Message-State: AFqh2kqWdarxFklGDz9IPsPk4WjXAXLYTfl8MKUmFk/3baMyimDYEeYl
 Vt3jMhOIQpaFxnG6jB8OUvBp6g==
X-Google-Smtp-Source: AMrXdXtUdYxteQ5glYy5Isr1CjlPQznVSTMs3gik8Fu0dw5WJzro/E0tKv/NqM3wSJo5XTuhREmRIA==
X-Received: by 2002:adf:e3cf:0:b0:2bd:c7c6:d1aa with SMTP id
 k15-20020adfe3cf000000b002bdc7c6d1aamr3898185wrm.35.1673979965147; 
 Tue, 17 Jan 2023 10:26:05 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 w8-20020adf8bc8000000b002bdc39849d1sm17354723wra.44.2023.01.17.10.26.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 10:26:04 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 40F7C1FFB7;
 Tue, 17 Jan 2023 18:26:04 +0000 (GMT)
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
 <20230109014248.2894281-16-richard.henderson@linaro.org>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 15/22] tcg: Remove TCG_TARGET_HAS_direct_jump
Date: Tue, 17 Jan 2023 18:25:47 +0000
In-reply-to: <20230109014248.2894281-16-richard.henderson@linaro.org>
Message-ID: <87y1q110hv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

> We now have the option to generate direct or indirect
> goto_tb depending on the dynamic displacement, thus
> the define is no longer necessary or completely accurate.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/aarch64/tcg-target.h     |  1 -
>  tcg/arm/tcg-target.h         |  1 -
>  tcg/i386/tcg-target.h        |  1 -
>  tcg/loongarch64/tcg-target.h |  1 -
>  tcg/mips/tcg-target.h        |  1 -
>  tcg/ppc/tcg-target.h         |  1 -
>  tcg/riscv/tcg-target.h       |  1 -
>  tcg/s390x/tcg-target.h       |  1 -
>  tcg/sparc64/tcg-target.h     |  1 -
>  tcg/tci/tcg-target.h         |  1 -
>  accel/tcg/cpu-exec.c         | 13 ++++++-------
>  tcg/tcg.c                    |  1 -
>  tcg/arm/tcg-target.c.inc     |  1 -
>  tcg/mips/tcg-target.c.inc    |  1 -
>  tcg/riscv/tcg-target.c.inc   |  1 -
>  tcg/s390x/tcg-target.c.inc   |  3 +++
>  tcg/tci/tcg-target.c.inc     |  1 -
>  17 files changed, 9 insertions(+), 22 deletions(-)
>
> diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
> index a585d035d9..6067446b03 100644
> --- a/tcg/aarch64/tcg-target.h
> +++ b/tcg/aarch64/tcg-target.h
> @@ -123,7 +123,6 @@ typedef enum {
>  #define TCG_TARGET_HAS_muls2_i64        0
>  #define TCG_TARGET_HAS_muluh_i64        1
>  #define TCG_TARGET_HAS_mulsh_i64        1
> -#define TCG_TARGET_HAS_direct_jump      1
>=20=20
>  #define TCG_TARGET_HAS_v64              1
>  #define TCG_TARGET_HAS_v128             1
> diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
> index d347a5dc53..91b8954804 100644
> --- a/tcg/arm/tcg-target.h
> +++ b/tcg/arm/tcg-target.h
> @@ -121,7 +121,6 @@ extern bool use_neon_instructions;
>  #define TCG_TARGET_HAS_mulsh_i32        0
>  #define TCG_TARGET_HAS_div_i32          use_idiv_instructions
>  #define TCG_TARGET_HAS_rem_i32          0
> -#define TCG_TARGET_HAS_direct_jump      0
>  #define TCG_TARGET_HAS_qemu_st8_i32     0
>=20=20
>  #define TCG_TARGET_HAS_v64              use_neon_instructions
> diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
> index d3705da2ed..5797a55ea0 100644
> --- a/tcg/i386/tcg-target.h
> +++ b/tcg/i386/tcg-target.h
> @@ -141,7 +141,6 @@ extern bool have_movbe;
>  #define TCG_TARGET_HAS_muls2_i32        1
>  #define TCG_TARGET_HAS_muluh_i32        0
>  #define TCG_TARGET_HAS_mulsh_i32        0
> -#define TCG_TARGET_HAS_direct_jump      1
>=20=20
>  #if TCG_TARGET_REG_BITS =3D=3D 64
>  /* Keep target addresses zero-extended in a register.  */
> diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
> index 5782c6887c..1c3e48d662 100644
> --- a/tcg/loongarch64/tcg-target.h
> +++ b/tcg/loongarch64/tcg-target.h
> @@ -128,7 +128,6 @@ typedef enum {
>  #define TCG_TARGET_HAS_clz_i32          1
>  #define TCG_TARGET_HAS_ctz_i32          1
>  #define TCG_TARGET_HAS_ctpop_i32        0
> -#define TCG_TARGET_HAS_direct_jump      1
>  #define TCG_TARGET_HAS_brcond2          0
>  #define TCG_TARGET_HAS_setcond2         0
>  #define TCG_TARGET_HAS_qemu_st8_i32     0
> diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
> index 82b40100cf..7bc8e15293 100644
> --- a/tcg/mips/tcg-target.h
> +++ b/tcg/mips/tcg-target.h
> @@ -134,7 +134,6 @@ extern bool use_mips32r2_instructions;
>  #define TCG_TARGET_HAS_muluh_i32        1
>  #define TCG_TARGET_HAS_mulsh_i32        1
>  #define TCG_TARGET_HAS_bswap32_i32      1
> -#define TCG_TARGET_HAS_direct_jump      0
>=20=20
>  #if TCG_TARGET_REG_BITS =3D=3D 64
>  #define TCG_TARGET_HAS_add2_i32         0
> diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
> index 5ffb41fb57..f253184915 100644
> --- a/tcg/ppc/tcg-target.h
> +++ b/tcg/ppc/tcg-target.h
> @@ -108,7 +108,6 @@ extern bool have_vsx;
>  #define TCG_TARGET_HAS_muls2_i32        0
>  #define TCG_TARGET_HAS_muluh_i32        1
>  #define TCG_TARGET_HAS_mulsh_i32        1
> -#define TCG_TARGET_HAS_direct_jump      1
>  #define TCG_TARGET_HAS_qemu_st8_i32     0
>=20=20
>  #if TCG_TARGET_REG_BITS =3D=3D 64
> diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
> index c9af6d592f..1337bc1f1e 100644
> --- a/tcg/riscv/tcg-target.h
> +++ b/tcg/riscv/tcg-target.h
> @@ -121,7 +121,6 @@ typedef enum {
>  #define TCG_TARGET_HAS_clz_i32          0
>  #define TCG_TARGET_HAS_ctz_i32          0
>  #define TCG_TARGET_HAS_ctpop_i32        0
> -#define TCG_TARGET_HAS_direct_jump      0
>  #define TCG_TARGET_HAS_brcond2          1
>  #define TCG_TARGET_HAS_setcond2         1
>  #define TCG_TARGET_HAS_qemu_st8_i32     0
> diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
> index 9f5d1cf1c7..e597e47e60 100644
> --- a/tcg/s390x/tcg-target.h
> +++ b/tcg/s390x/tcg-target.h
> @@ -105,7 +105,6 @@ extern uint64_t s390_facilities[3];
>  #define TCG_TARGET_HAS_mulsh_i32      0
>  #define TCG_TARGET_HAS_extrl_i64_i32  0
>  #define TCG_TARGET_HAS_extrh_i64_i32  0
> -#define TCG_TARGET_HAS_direct_jump    1
>  #define TCG_TARGET_HAS_qemu_st8_i32   0
>=20=20
>  #define TCG_TARGET_HAS_div2_i64       1
> diff --git a/tcg/sparc64/tcg-target.h b/tcg/sparc64/tcg-target.h
> index b78a545581..1d6a5c8b07 100644
> --- a/tcg/sparc64/tcg-target.h
> +++ b/tcg/sparc64/tcg-target.h
> @@ -111,7 +111,6 @@ extern bool use_vis3_instructions;
>  #define TCG_TARGET_HAS_muls2_i32        1
>  #define TCG_TARGET_HAS_muluh_i32        0
>  #define TCG_TARGET_HAS_mulsh_i32        0
> -#define TCG_TARGET_HAS_direct_jump      1
>  #define TCG_TARGET_HAS_qemu_st8_i32     0
>=20=20
>  #define TCG_TARGET_HAS_extrl_i64_i32    1
> diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
> index 359d62c2f3..1414ab4d5b 100644
> --- a/tcg/tci/tcg-target.h
> +++ b/tcg/tci/tcg-target.h
> @@ -82,7 +82,6 @@
>  #define TCG_TARGET_HAS_muls2_i32        1
>  #define TCG_TARGET_HAS_muluh_i32        0
>  #define TCG_TARGET_HAS_mulsh_i32        0
> -#define TCG_TARGET_HAS_direct_jump      0
>  #define TCG_TARGET_HAS_qemu_st8_i32     0
>=20=20
>  #if TCG_TARGET_REG_BITS =3D=3D 64
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index ac5b581e52..0892c6534a 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -572,14 +572,13 @@ void cpu_exec_step_atomic(CPUState *cpu)
>=20=20
>  void tb_set_jmp_target(TranslationBlock *tb, int n, uintptr_t addr)
>  {
> +    const TranslationBlock *c_tb =3D tcg_splitwx_to_rx(tb);
> +    uintptr_t offset =3D tb->jmp_insn_offset[n];
> +    uintptr_t jmp_rx =3D (uintptr_t)tb->tc.ptr + offset;
> +    uintptr_t jmp_rw =3D jmp_rx - tcg_splitwx_diff;
> +
>      tb->jmp_target_addr[n] =3D addr;
> -    if (TCG_TARGET_HAS_direct_jump) {
> -        const TranslationBlock *c_tb =3D tcg_splitwx_to_rx(tb);
> -        uintptr_t offset =3D tb->jmp_insn_offset[n];
> -        uintptr_t jmp_rx =3D (uintptr_t)tb->tc.ptr + offset;
> -        uintptr_t jmp_rw =3D jmp_rx - tcg_splitwx_diff;
> -        tb_target_set_jmp_target(c_tb, n, jmp_rx, jmp_rw);
> -    }
> +    tb_target_set_jmp_target(c_tb, n, jmp_rx, jmp_rw);
>  }
>=20=20
>  static inline void tb_add_jump(TranslationBlock *tb, int n,
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 7b16af17da..9d7e2b1f1b 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -319,7 +319,6 @@ static void G_GNUC_UNUSED set_jmp_insn_offset(TCGCont=
ext *s, int which)
>       * We will check for overflow at the end of the opcode loop in
>       * tcg_gen_code, where we bound tcg_current_code_size to UINT16_MAX.
>       */
> -    tcg_debug_assert(TCG_TARGET_HAS_direct_jump);
>      s->gen_tb->jmp_insn_offset[which] =3D tcg_current_code_size(s);
>  }
>=20=20
> diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
> index b21dd561fa..e1e1c2620d 100644
> --- a/tcg/arm/tcg-target.c.inc
> +++ b/tcg/arm/tcg-target.c.inc
> @@ -1945,7 +1945,6 @@ static void tcg_out_goto_tb(TCGContext *s, int whic=
h)
>      intptr_t ptr, dif, dil;
>      TCGReg base =3D TCG_REG_PC;
>=20=20
> -    qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
>      ptr =3D get_jmp_target_addr(s, which);
>      dif =3D tcg_pcrel_diff(s, (void *)ptr) - 8;
>      dil =3D sextract32(dif, 0, 12);
> diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
> index 0b5e100cb1..6e000d8e69 100644
> --- a/tcg/mips/tcg-target.c.inc
> +++ b/tcg/mips/tcg-target.c.inc
> @@ -1969,7 +1969,6 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_=
t a0)
>  static void tcg_out_goto_tb(TCGContext *s, int which)
>  {
>      /* indirect jump method */
> -    qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
>      tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP0, TCG_REG_ZERO,
>                 get_jmp_target_addr(s, which));
>      tcg_out_opc_reg(s, OPC_JR, 0, TCG_TMP0, 0);
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index e6a3915859..136fe54d4b 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -1302,7 +1302,6 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_=
t a0)
>=20=20
>  static void tcg_out_goto_tb(TCGContext *s, int which)
>  {
> -    qemu_build_assert(!TCG_TARGET_HAS_direct_jump);
>      /* indirect jump method */
>      tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_REG_ZERO,
>                 get_jmp_target_addr(s, which));
> diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
> index 2d049a4cc7..218318feb2 100644
> --- a/tcg/s390x/tcg-target.c.inc
> +++ b/tcg/s390x/tcg-target.c.inc
> @@ -1973,6 +1973,9 @@ static void tcg_out_goto_tb(TCGContext *s, int whic=
h)
>  void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
>                                uintptr_t jmp_rx, uintptr_t jmp_rw)
>  {
> +    if (!HAVE_FACILITY(GEN_INST_EXT)) {
> +        return;
> +    }

Someone told me this should always be true.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

