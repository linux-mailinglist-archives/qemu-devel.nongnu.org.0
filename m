Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B94966E5A9
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 19:11:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHqPh-00082b-MH; Tue, 17 Jan 2023 13:10:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHqPe-00080j-0M
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 13:10:22 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHqPb-0002TL-VY
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 13:10:21 -0500
Received: by mail-wr1-x42f.google.com with SMTP id h16so31484532wrz.12
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 10:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oUBiT6mZP3iozDsDacQZRptXGuS11QBY3apcaJjxcYA=;
 b=Q/xGx26oe5qYCN3dcDqc8pkq9qqxsVCsGGmZ+6w8Xn6x0Lrie+cT1g1xLpW4YR73TH
 NYL0A/5R7ZsKPdJ3+9V2IbqzRnCl90fFyz7FT4B8KR8gVDHZcP2G9pyyRBNpGymcm9WS
 O9RRqGqcuABa1zZStMq3iXvEqo1gLRBCKBSXvOXZSrxAjVpK0T/GMOg1osI1iKl+5Efo
 0lrjJStTUnb9wQMgouvAqhcMh/ZWqFg/o+INWBO5krYBfgbGbfb0L5jBI+NklbHPUKp6
 SZlkIQwP0z5SnHolOYR1asrQpdEZf/cfgi3DEGfPv2Adnrl7PskVA8QlMn4bwEZdfs/a
 xhkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oUBiT6mZP3iozDsDacQZRptXGuS11QBY3apcaJjxcYA=;
 b=KyLZC/WwhLFmlDMnmY2qxdZXVfUJzOHcFsVTEoIEkS0+4O97a/He51xWdhXmY4yR8E
 rsrnYLsYOMNeHNoWrFgO3kbaA1oGa2aHarGNnxEEI73CdjSoSu8aSRYvvRm9A3a7JevC
 j/YgwuBC6FTrbhj8sKWgOdGQbEERmPpC59paHK3Mztwf/FRgJ9QXp+zMGBjTiOcEl4RN
 xMYfUGP0CRxliZdQ1bzvagL7zl7Cj9PPAJPTg6Qr+yUJ4JbLQ3uh5dGJYbWLy/4e8yN9
 HsJlFU6QN06GvMy0KzHQ687Tmu180vPkd8QPH5TX9pu7bvmfywk2EThmjp6jDgYvhELd
 82Fg==
X-Gm-Message-State: AFqh2kpUwwFohXxxWWaDiar/4IlTEPTCrbu652omy8arhGE6YmwobkHU
 GTAnZL6qjNNdUE1ZQ8GEKOlOKQ==
X-Google-Smtp-Source: AMrXdXv2K19St4UUlefOWy9CtQk97Lws+XpxiUEjld775/gqRFIQgLWiMrlnc35wr1UrKk5udhoclQ==
X-Received: by 2002:a5d:66c6:0:b0:2bd:d966:7fff with SMTP id
 k6-20020a5d66c6000000b002bdd9667fffmr4121095wrw.20.1673979017988; 
 Tue, 17 Jan 2023 10:10:17 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a056000120700b00241dd5de644sm29358212wrx.97.2023.01.17.10.10.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 10:10:17 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 11A0B1FFB7;
 Tue, 17 Jan 2023 18:10:17 +0000 (GMT)
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
 <20230109014248.2894281-13-richard.henderson@linaro.org>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 12/22] tcg: Change tb_target_set_jmp_target arguments
Date: Tue, 17 Jan 2023 18:05:00 +0000
In-reply-to: <20230109014248.2894281-13-richard.henderson@linaro.org>
Message-ID: <87bkmx2fsm.fsf@linaro.org>
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

> Replace 'tc_ptr' and 'addr' with 'tb' and 'n'.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/aarch64/tcg-target.h         |  3 ++-
>  tcg/arm/tcg-target.h             |  3 ++-
>  tcg/i386/tcg-target.h            |  9 ++-------
>  tcg/loongarch64/tcg-target.h     |  3 ++-
>  tcg/mips/tcg-target.h            |  3 ++-
>  tcg/ppc/tcg-target.h             |  3 ++-
>  tcg/riscv/tcg-target.h           |  3 ++-
>  tcg/s390x/tcg-target.h           | 10 ++--------
>  tcg/sparc64/tcg-target.h         |  3 ++-
>  tcg/tci/tcg-target.h             |  3 ++-
>  accel/tcg/cpu-exec.c             |  6 +++---
>  tcg/aarch64/tcg-target.c.inc     |  5 +++--
>  tcg/i386/tcg-target.c.inc        |  9 +++++++++
>  tcg/loongarch64/tcg-target.c.inc |  5 +++--
>  tcg/ppc/tcg-target.c.inc         |  7 ++++---
>  tcg/s390x/tcg-target.c.inc       | 10 ++++++++++
>  tcg/sparc64/tcg-target.c.inc     |  7 ++++---
>  17 files changed, 56 insertions(+), 36 deletions(-)
>
> diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
> index 413a5410c5..d491c198da 100644
> --- a/tcg/aarch64/tcg-target.h
> +++ b/tcg/aarch64/tcg-target.h
> @@ -152,7 +152,8 @@ typedef enum {
>  #define TCG_TARGET_DEFAULT_MO (0)
>  #define TCG_TARGET_HAS_MEMORY_BSWAP     0
>=20=20
> -void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t=
);
> +void tb_target_set_jmp_target(const TranslationBlock *, int,
> +                              uintptr_t, uintptr_t);
>=20=20
>  #define TCG_TARGET_NEED_LDST_LABELS
>  #define TCG_TARGET_NEED_POOL_LABELS
> diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
> index b7843d2d54..4c1433093c 100644
> --- a/tcg/arm/tcg-target.h
> +++ b/tcg/arm/tcg-target.h
> @@ -152,7 +152,8 @@ extern bool use_neon_instructions;
>  #define TCG_TARGET_HAS_MEMORY_BSWAP     0
>=20=20
>  /* not defined -- call should be eliminated at compile time */
> -void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t=
);
> +void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
> +                              uintptr_t, uintptr_t);
>=20=20
>  #define TCG_TARGET_NEED_LDST_LABELS
>  #define TCG_TARGET_NEED_POOL_LABELS
> diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
> index 7edb7f1d9a..7500ceaab9 100644
> --- a/tcg/i386/tcg-target.h
> +++ b/tcg/i386/tcg-target.h
> @@ -220,13 +220,8 @@ extern bool have_movbe;
>  #define TCG_TARGET_extract_i64_valid(ofs, len) \
>      (((ofs) =3D=3D 8 && (len) =3D=3D 8) || ((ofs) + (len)) =3D=3D 32)
>=20=20
> -static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t =
jmp_rx,
> -                                            uintptr_t jmp_rw, uintptr_t =
addr)
> -{
> -    /* patch the branch destination */
> -    qatomic_set((int32_t *)jmp_rw, addr - (jmp_rx + 4));
> -    /* no need to flush icache explicitly */
> -}
> +void tb_target_set_jmp_target(const TranslationBlock *, int,
> +                              uintptr_t, uintptr_t);
>=20=20
>  /* This defines the natural memory order supported by this
>   * architecture before guarantees made by various barrier
> diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
> index e5f7a1f09d..a150c3c7b2 100644
> --- a/tcg/loongarch64/tcg-target.h
> +++ b/tcg/loongarch64/tcg-target.h
> @@ -171,7 +171,8 @@ typedef enum {
>  #define TCG_TARGET_HAS_muluh_i64        1
>  #define TCG_TARGET_HAS_mulsh_i64        1
>=20=20
> -void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t=
);
> +void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
> +                              uintptr_t, uintptr_t);
>=20=20
>  #define TCG_TARGET_DEFAULT_MO (0)
>=20=20
> diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
> index 15721c3e42..d1adf3e326 100644
> --- a/tcg/mips/tcg-target.h
> +++ b/tcg/mips/tcg-target.h
> @@ -206,7 +206,8 @@ extern bool use_mips32r2_instructions;
>  #define TCG_TARGET_HAS_MEMORY_BSWAP     1
>=20=20
>  /* not defined -- call should be eliminated at compile time */
> -void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t)
> +void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
> +                              uintptr_t, uintptr_t)
>      QEMU_ERROR("code path is reachable");
>=20=20
>  #define TCG_TARGET_NEED_LDST_LABELS
> diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
> index b5cd225cfa..02764c3331 100644
> --- a/tcg/ppc/tcg-target.h
> +++ b/tcg/ppc/tcg-target.h
> @@ -180,7 +180,8 @@ extern bool have_vsx;
>  #define TCG_TARGET_HAS_bitsel_vec       have_vsx
>  #define TCG_TARGET_HAS_cmpsel_vec       0
>=20=20
> -void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t=
);
> +void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
> +                              uintptr_t, uintptr_t);
>=20=20
>  #define TCG_TARGET_DEFAULT_MO (0)
>  #define TCG_TARGET_HAS_MEMORY_BSWAP     1
> diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
> index 232537ccea..bce164fde2 100644
> --- a/tcg/riscv/tcg-target.h
> +++ b/tcg/riscv/tcg-target.h
> @@ -166,7 +166,8 @@ typedef enum {
>  #endif
>=20=20
>  /* not defined -- call should be eliminated at compile time */
> -void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t=
);
> +void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
> +                              uintptr_t, uintptr_t);
>=20=20
>  #define TCG_TARGET_DEFAULT_MO (0)
>=20=20
> diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
> index 68dcbc6645..57ba165800 100644
> --- a/tcg/s390x/tcg-target.h
> +++ b/tcg/s390x/tcg-target.h
> @@ -175,14 +175,8 @@ extern uint64_t s390_facilities[3];
>=20=20
>  #define TCG_TARGET_DEFAULT_MO (TCG_MO_ALL & ~TCG_MO_ST_LD)
>=20=20
> -static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t =
jmp_rx,
> -                                            uintptr_t jmp_rw, uintptr_t =
addr)
> -{
> -    /* patch the branch destination */
> -    intptr_t disp =3D addr - (jmp_rx - 2);
> -    qatomic_set((int32_t *)jmp_rw, disp / 2);
> -    /* no need to flush icache explicitly */
> -}
> +void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
> +                              uintptr_t jmp_rx, uintptr_t jmp_rw);
>=20=20
>  #define TCG_TARGET_NEED_LDST_LABELS
>  #define TCG_TARGET_NEED_POOL_LABELS
> diff --git a/tcg/sparc64/tcg-target.h b/tcg/sparc64/tcg-target.h
> index 0044ac8d78..282833bd8d 100644
> --- a/tcg/sparc64/tcg-target.h
> +++ b/tcg/sparc64/tcg-target.h
> @@ -155,7 +155,8 @@ extern bool use_vis3_instructions;
>  #define TCG_TARGET_DEFAULT_MO (0)
>  #define TCG_TARGET_HAS_MEMORY_BSWAP     1
>=20=20
> -void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t=
);
> +void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
> +                              uintptr_t, uintptr_t);
>=20=20
>  #define TCG_TARGET_NEED_POOL_LABELS
>=20=20
> diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
> index 94ec541b4e..f9ee83d751 100644
> --- a/tcg/tci/tcg-target.h
> +++ b/tcg/tci/tcg-target.h
> @@ -177,6 +177,7 @@ typedef enum {
>  #define TCG_TARGET_HAS_MEMORY_BSWAP     1
>=20=20
>  /* not defined -- call should be eliminated at compile time */
> -void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t=
);
> +void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
> +                              uintptr_t, uintptr_t);
>=20=20
>  #endif /* TCG_TARGET_H */
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index a87fbf74f4..ac5b581e52 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -574,11 +574,11 @@ void tb_set_jmp_target(TranslationBlock *tb, int n,=
 uintptr_t addr)
>  {
>      tb->jmp_target_addr[n] =3D addr;
>      if (TCG_TARGET_HAS_direct_jump) {
> +        const TranslationBlock *c_tb =3D tcg_splitwx_to_rx(tb);

This may be deserving of a small comment, "address of TB purely for
calculation".

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

