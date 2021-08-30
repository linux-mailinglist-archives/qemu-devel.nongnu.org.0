Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 750B33FB086
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 06:48:29 +0200 (CEST)
Received: from localhost ([::1]:36038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKZDW-0004mB-Ab
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 00:48:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKZBe-0003TP-2g
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 00:46:22 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:45881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKZBc-0000ZF-5y
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 00:46:21 -0400
Received: by mail-io1-xd32.google.com with SMTP id e186so18209221iof.12
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 21:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aNfWn3sn/ipy6A3IVQcNz7DAAieJCihLtfPtUWG6HYM=;
 b=sR/OL9Tqbyeb/QQuqhzan8e1OBXJjiT1dRoGlxSwHk80l+v47wN3eAu+MwGMdi9xPc
 Di69idRp1w9+9r0wyphJ5iXg55EIMS0BWMggjz/kJXZRuypfZ8Mi/IXCRQUC5nqUNNpD
 rD4dr0j3TZ8Dg4qX5p2wIUi2UMmVYhv4n3ZEEQwVuqRvjIu+s5QY0Un/s4b2fserY1X2
 Mb30oVACEKXWT4d3bzUeeSQZ/xt78bn26gxARNUm6FT1i0tnn57/gtmKD/wfS+I7rGnM
 ox9pDjgwBnORg5C0PJxABY5qOwYO5X2eU3AtzIL1LoFKAXhFhYfVh5XiRNf98xIGorO4
 rEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aNfWn3sn/ipy6A3IVQcNz7DAAieJCihLtfPtUWG6HYM=;
 b=kx7bKK6ydv0lBll6LuOgETwIOXfJExcRfDVD/Y/ECk3KZGi4Y9SnsRCCft8F2HLvMH
 oZwcU605hmkcKFRMwCiuFLXTqUs7NLHcIWMSLHumJgB03fxHaKsWrUerBjGGeD2hE1SM
 bToIh79h3qNcsOcIJvDrLZYXqz5sbjons1tg7nnhS5CSDMPHSVPaM0ua3+WnvCvt4lPY
 yFPKOHTPgKbxQV8sbHdGZqyVtWNthzizFWh8JHyXd0+TJl8OH8cnUYb1o2Gx6XURx1SJ
 42voJs0tKhLbV9rJIGWtzeV74XWXX5Qi9Q1E/s+C4MFXAGTrI9WgJQEbHv+MogsVeNC+
 zJeQ==
X-Gm-Message-State: AOAM533ahp4PStmEjmGCLLXDM8RAGepl7Gn6+3sC9ZtR+Np8IsuTI92I
 o4VaVemQV7nDPb544dVXRORie6kp1PnYFTxHhEw=
X-Google-Smtp-Source: ABdhPJxgsiTNFk2/bFj5RhBtQi64smxjQlbKoqMkBXa1a0C6vN3s33SMWPlSoQsk/hpl2VUQ9++SnZ9UWo6mCp9au2E=
X-Received: by 2002:a6b:5819:: with SMTP id m25mr16702687iob.105.1630298778745; 
 Sun, 29 Aug 2021 21:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210825165907.34026-1-philipp.tomsich@vrull.eu>
 <20210825165907.34026-3-philipp.tomsich@vrull.eu>
In-Reply-To: <20210825165907.34026-3-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Aug 2021 14:45:52 +1000
Message-ID: <CAKmqyKNJgpNo3n6Zf_NU3shYvJs73kn6Bter8O1nCQx-L9Z6xQ@mail.gmail.com>
Subject: Re: [PATCH v6 02/14] target/riscv: Reassign instructions to the
 Zba-extension
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 26, 2021 at 3:07 AM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> The following instructions are part of Zba:
>  - add.uw (RV64 only)
>  - sh[123]add (RV32 and RV64)
>  - sh[123]add.uw (RV64-only)
>  - slli.uw (RV64-only)
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> (no changes since v3)
>
> Changes in v3:
> - The changes to the Zba instructions (i.e. the REQUIRE_ZBA macro
>   and its use for qualifying the Zba instructions) are moved into
>   a separate commit.
>
>  target/riscv/insn32.decode              | 20 ++++++++++++--------
>  target/riscv/insn_trans/trans_rvb.c.inc | 17 ++++++++++++-----
>  2 files changed, 24 insertions(+), 13 deletions(-)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index f09f8d5faf..68b163b72d 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -659,6 +659,18 @@ vamomaxd_v      10100 . . ..... ..... 111 ..... 0101111 @r_wdvm
>  vamominud_v     11000 . . ..... ..... 111 ..... 0101111 @r_wdvm
>  vamomaxud_v     11100 . . ..... ..... 111 ..... 0101111 @r_wdvm
>
> +# *** RV32 Zba Standard Extension ***
> +sh1add     0010000 .......... 010 ..... 0110011 @r
> +sh2add     0010000 .......... 100 ..... 0110011 @r
> +sh3add     0010000 .......... 110 ..... 0110011 @r
> +
> +# *** RV64 Zba Standard Extension (in addition to RV32 Zba) ***
> +add_uw     0000100 .......... 000 ..... 0111011 @r
> +sh1add_uw  0010000 .......... 010 ..... 0111011 @r
> +sh2add_uw  0010000 .......... 100 ..... 0111011 @r
> +sh3add_uw  0010000 .......... 110 ..... 0111011 @r
> +slli_uw    00001 ............ 001 ..... 0011011 @sh
> +
>  # *** RV32B Standard Extension ***
>  clz        011000 000000 ..... 001 ..... 0010011 @r2
>  ctz        011000 000001 ..... 001 ..... 0010011 @r2
> @@ -686,9 +698,6 @@ ror        0110000 .......... 101 ..... 0110011 @r
>  rol        0110000 .......... 001 ..... 0110011 @r
>  grev       0110100 .......... 101 ..... 0110011 @r
>  gorc       0010100 .......... 101 ..... 0110011 @r
> -sh1add     0010000 .......... 010 ..... 0110011 @r
> -sh2add     0010000 .......... 100 ..... 0110011 @r
> -sh3add     0010000 .......... 110 ..... 0110011 @r
>
>  bseti      00101. ........... 001 ..... 0010011 @sh
>  bclri      01001. ........... 001 ..... 0010011 @sh
> @@ -717,10 +726,6 @@ rorw       0110000 .......... 101 ..... 0111011 @r
>  rolw       0110000 .......... 001 ..... 0111011 @r
>  grevw      0110100 .......... 101 ..... 0111011 @r
>  gorcw      0010100 .......... 101 ..... 0111011 @r
> -sh1add_uw  0010000 .......... 010 ..... 0111011 @r
> -sh2add_uw  0010000 .......... 100 ..... 0111011 @r
> -sh3add_uw  0010000 .......... 110 ..... 0111011 @r
> -add_uw     0000100 .......... 000 ..... 0111011 @r
>
>  bsetiw     0010100 .......... 001 ..... 0011011 @sh5
>  bclriw     0100100 .......... 001 ..... 0011011 @sh5
> @@ -731,4 +736,3 @@ roriw      0110000 .......... 101 ..... 0011011 @sh5
>  greviw     0110100 .......... 101 ..... 0011011 @sh5
>  gorciw     0010100 .......... 101 ..... 0011011 @sh5
>
> -slli_uw    00001. ........... 001 ..... 0011011 @sh
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index 9e81f6e3de..3cdd70a2b9 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -1,8 +1,9 @@
>  /*
> - * RISC-V translation routines for the RVB Standard Extension.
> + * RISC-V translation routines for the RVB draft and Zba Standard Extension.
>   *
>   * Copyright (c) 2020 Kito Cheng, kito.cheng@sifive.com
>   * Copyright (c) 2020 Frank Chang, frank.chang@sifive.com
> + * Copyright (c) 2021 Philipp Tomsich, philipp.tomsich@vrull.eu
>   *
>   * This program is free software; you can redistribute it and/or modify it
>   * under the terms and conditions of the GNU General Public License,
> @@ -17,6 +18,12 @@
>   * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>
> +#define REQUIRE_ZBA(ctx) do {                    \
> +    if (!RISCV_CPU(ctx->cs)->cfg.ext_zba) {      \
> +        return false;                            \
> +    }                                            \
> +} while (0)
> +
>  static bool trans_clz(DisasContext *ctx, arg_clz *a)
>  {
>      REQUIRE_EXT(ctx, RVB);
> @@ -229,7 +236,7 @@ static bool trans_gorci(DisasContext *ctx, arg_gorci *a)
>  #define GEN_TRANS_SHADD(SHAMT)                                             \
>  static bool trans_sh##SHAMT##add(DisasContext *ctx, arg_sh##SHAMT##add *a) \
>  {                                                                          \
> -    REQUIRE_EXT(ctx, RVB);                                                 \
> +    REQUIRE_ZBA(ctx);                                                      \
>      return gen_arith(ctx, a, gen_sh##SHAMT##add);                          \
>  }
>
> @@ -403,7 +410,7 @@ static bool trans_sh##SHAMT##add_uw(DisasContext *ctx,        \
>                                      arg_sh##SHAMT##add_uw *a) \
>  {                                                             \
>      REQUIRE_64BIT(ctx);                                       \
> -    REQUIRE_EXT(ctx, RVB);                                    \
> +    REQUIRE_ZBA(ctx);                                         \
>      return gen_arith(ctx, a, gen_sh##SHAMT##add_uw);          \
>  }
>
> @@ -414,14 +421,14 @@ GEN_TRANS_SHADD_UW(3)
>  static bool trans_add_uw(DisasContext *ctx, arg_add_uw *a)
>  {
>      REQUIRE_64BIT(ctx);
> -    REQUIRE_EXT(ctx, RVB);
> +    REQUIRE_ZBA(ctx);
>      return gen_arith(ctx, a, gen_add_uw);
>  }
>
>  static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
>  {
>      REQUIRE_64BIT(ctx);
> -    REQUIRE_EXT(ctx, RVB);
> +    REQUIRE_ZBA(ctx);
>
>      TCGv source1 = tcg_temp_new();
>      gen_get_gpr(source1, a->rs1);
> --
> 2.25.1
>
>

