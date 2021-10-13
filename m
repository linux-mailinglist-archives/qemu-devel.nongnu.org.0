Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8DA42C1A6
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 15:43:39 +0200 (CEST)
Received: from localhost ([::1]:47818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maeXh-0007Me-Ki
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 09:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vpalatin@rivosinc.com>)
 id 1maagb-00014t-Ju
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:36:34 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:34365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vpalatin@rivosinc.com>)
 id 1maagY-00009T-Ja
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:36:33 -0400
Received: by mail-lf1-x12f.google.com with SMTP id t9so9203632lfd.1
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tOoT0aVEEwITynKjuW01nYul3B+MqulsLVVQ2mpbSYE=;
 b=Sb4dC37Cf5hw3np9lHBLysqxPdeHeAXnRrmx+IqotdQKCvMJvo3r3cVGAxg63Cu7mm
 uxOj8BqJkOdBAWJ5+UiAc0Fq0Xo8LgXcsXCB7n45AI9GQEyolGHP3wHqMJ5rYdj7PraN
 RSgGiDp2PqQuDFTao8rL84uBIbH1VisJair5/pMdP5BHaju0/QsiGUJYcJ3XatVFRVzS
 s92kNtm1y1E8ItFGgehPtHSrB8o/KQeeoyOPxv8ujCpz0p7BOmiuFyBOQo0biu+iXDqj
 UIPkbaRsNtlmt2rAfVteSt3RqKMcDrjG/awEFxtg1yPE2cRjY5z57esqmUr4tnEeDbf0
 TqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tOoT0aVEEwITynKjuW01nYul3B+MqulsLVVQ2mpbSYE=;
 b=sptjOf06gQlBVOPZeNFq+z6xfVI2bbCybF3ijEqAh+vvyA17CWXYWAwHARPhbi84gR
 6G37phNfSPgAYY3DBdaZH5c5dQsmRP0+TQC7lMJClmGfruuEI26C2jmErWYHJHdIuAyH
 9QQikjlJhUPM1Q48lse/k0oGZibGh1WnNh4Zqg8U+h+Uur9fPSD2Dudmka8UQTgOrLhr
 XTDsRn5pE/NaMNOB47J3HSkSMAnWbJ8Srk2CrTfwSEO1lfHcaEWpUSp+F2u9i2oYrF6e
 KYRcZpaKKn7L303ysFXw7mZcThxofqOGOYy0SQKSUIHrJDBtzGpLR1J9LfYbg8ZHaHE7
 n5xA==
X-Gm-Message-State: AOAM53333WDgOe4M9pvb3iQB2VyvF1iJLqnTLb6aMN+P9xbOF3Laaewm
 I6xcnmCJP9XMcqmBlB+bWewCtc0lYHexmfur0rg=
X-Google-Smtp-Source: ABdhPJxtF72hrDsw8f3rC/0dsGdPd7UA5xY5Mb6g+5xw2POGXwIgKSG6LUeIH4aCOQ2z1gB2mszhXg==
X-Received: by 2002:a19:c114:: with SMTP id r20mr37951430lff.375.1634117786986; 
 Wed, 13 Oct 2021 02:36:26 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43])
 by smtp.gmail.com with ESMTPSA id r188sm1273735lff.75.2021.10.13.02.36.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 02:36:26 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id t9so9203278lfd.1
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:36:26 -0700 (PDT)
X-Received: by 2002:ac2:44ae:: with SMTP id c14mr14841277lfm.27.1634117785169; 
 Wed, 13 Oct 2021 02:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
 <20211007064751.608580-12-alistair.francis@opensource.wdc.com>
In-Reply-To: <20211007064751.608580-12-alistair.francis@opensource.wdc.com>
From: Vincent Palatin <vpalatin@rivosinc.com>
Date: Wed, 13 Oct 2021 11:36:15 +0200
X-Gmail-Original-Message-ID: <CANVmJF=2awVA+6CZ1D1BrdZQG=OyXdYZk63ZnDOVEBooEGzE8g@mail.gmail.com>
Message-ID: <CANVmJF=2awVA+6CZ1D1BrdZQG=OyXdYZk63ZnDOVEBooEGzE8g@mail.gmail.com>
Subject: Re: [PULL 11/26] target/riscv: Add orc.b instruction for Zbb,
 removing gorc/gorci
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=vpalatin@rivosinc.com; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Oct 2021 09:30:50 -0400
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
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 7, 2021 at 8:58 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Philipp Tomsich <philipp.tomsich@vrull.eu>
>
> The 1.0.0 version of Zbb does not contain gorc/gorci.  Instead, a
> orc.b instruction (equivalent to the orc.b pseudo-instruction built on
> gorci from pre-0.93 draft-B) is available, mainly targeting
> string-processing workloads.
>
> This commit adds the new orc.b instruction and removed gorc/gorci.
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Message-id: 20210911140016.834071-12-philipp.tomsich@vrull.eu
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/helper.h                   |  2 --
>  target/riscv/insn32.decode              |  6 +---
>  target/riscv/bitmanip_helper.c          | 26 -----------------
>  target/riscv/insn_trans/trans_rvb.c.inc | 39 +++++++++++--------------
>  4 files changed, 18 insertions(+), 55 deletions(-)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 8a318a2dbc..a9bda2c8ac 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -61,8 +61,6 @@ DEF_HELPER_FLAGS_1(fclass_d, TCG_CALL_NO_RWG_SE, tl, i64)
>  /* Bitmanip */
>  DEF_HELPER_FLAGS_2(grev, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>  DEF_HELPER_FLAGS_2(grevw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
> -DEF_HELPER_FLAGS_2(gorc, TCG_CALL_NO_RWG_SE, tl, tl, tl)
> -DEF_HELPER_FLAGS_2(gorcw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>  DEF_HELPER_FLAGS_2(clmul, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>  DEF_HELPER_FLAGS_2(clmulr, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index a509cfee11..59202196dc 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -681,6 +681,7 @@ max        0000101 .......... 110 ..... 0110011 @r
>  maxu       0000101 .......... 111 ..... 0110011 @r
>  min        0000101 .......... 100 ..... 0110011 @r
>  minu       0000101 .......... 101 ..... 0110011 @r
> +orc_b      001010 000111 ..... 101 ..... 0010011 @r2
>  orn        0100000 .......... 110 ..... 0110011 @r
>  rol        0110000 .......... 001 ..... 0110011 @r
>  ror        0110000 .......... 101 ..... 0110011 @r
> @@ -702,19 +703,14 @@ pack       0000100 .......... 100 ..... 0110011 @r
>  packu      0100100 .......... 100 ..... 0110011 @r
>  packh      0000100 .......... 111 ..... 0110011 @r
>  grev       0110100 .......... 101 ..... 0110011 @r
> -gorc       0010100 .......... 101 ..... 0110011 @r
> -
>  grevi      01101. ........... 101 ..... 0010011 @sh
> -gorci      00101. ........... 101 ..... 0010011 @sh
>
>  # *** RV64B Standard Extension (in addition to RV32B) ***
>  packw      0000100 .......... 100 ..... 0111011 @r
>  packuw     0100100 .......... 100 ..... 0111011 @r
>  grevw      0110100 .......... 101 ..... 0111011 @r
> -gorcw      0010100 .......... 101 ..... 0111011 @r
>
>  greviw     0110100 .......... 101 ..... 0011011 @sh5
> -gorciw     0010100 .......... 101 ..... 0011011 @sh5
>
>  # *** RV32 Zbc Standard Extension ***
>  clmul      0000101 .......... 001 ..... 0110011 @r
> diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
> index 73be5a81c7..bb48388fcd 100644
> --- a/target/riscv/bitmanip_helper.c
> +++ b/target/riscv/bitmanip_helper.c
> @@ -64,32 +64,6 @@ target_ulong HELPER(grevw)(target_ulong rs1, target_ulong rs2)
>      return do_grev(rs1, rs2, 32);
>  }
>
> -static target_ulong do_gorc(target_ulong rs1,
> -                            target_ulong rs2,
> -                            int bits)
> -{
> -    target_ulong x = rs1;
> -    int i, shift;
> -
> -    for (i = 0, shift = 1; shift < bits; i++, shift <<= 1) {
> -        if (rs2 & shift) {
> -            x |= do_swap(x, adjacent_masks[i], shift);
> -        }
> -    }
> -
> -    return x;
> -}
> -
> -target_ulong HELPER(gorc)(target_ulong rs1, target_ulong rs2)
> -{
> -    return do_gorc(rs1, rs2, TARGET_LONG_BITS);
> -}
> -
> -target_ulong HELPER(gorcw)(target_ulong rs1, target_ulong rs2)
> -{
> -    return do_gorc(rs1, rs2, 32);
> -}
> -
>  target_ulong HELPER(clmul)(target_ulong rs1, target_ulong rs2)
>  {
>      target_ulong result = 0;
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index bdfb495f24..d32af5915a 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -295,16 +295,27 @@ static bool trans_grevi(DisasContext *ctx, arg_grevi *a)
>      return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_grevi);
>  }
>
> -static bool trans_gorc(DisasContext *ctx, arg_gorc *a)
> +static void gen_orc_b(TCGv ret, TCGv source1)
>  {
> -    REQUIRE_EXT(ctx, RVB);
> -    return gen_shift(ctx, a, EXT_ZERO, gen_helper_gorc);
> +    TCGv  tmp = tcg_temp_new();
> +    TCGv  ones = tcg_constant_tl(dup_const_tl(MO_8, 0x01));
> +
> +    /* Set lsb in each byte if the byte was zero. */
> +    tcg_gen_sub_tl(tmp, source1, ones);
> +    tcg_gen_andc_tl(tmp, tmp, source1);
> +    tcg_gen_shri_tl(tmp, tmp, 7);
> +    tcg_gen_andc_tl(tmp, ones, tmp);
> +
> +    /* Replicate the lsb of each byte across the byte. */
> +    tcg_gen_muli_tl(ret, tmp, 0xff);
> +
> +    tcg_temp_free(tmp);
>  }

It seems there is a bug in the current orc.b implementation,
the following 7 hexadecimal patterns return one wrong byte (0x00
instead of 0xff):
orc.b(0x............01..) = 0x............00.. (instead of 0x............ff..)
orc.b(0x..........01....) = 0x..........00.... (instead of 0x..........ff....)
orc.b(0x........01......) = 0x........00...... (instead of 0x........ff......)
orc.b(0x......01........) = 0x......00........ (instead of 0x......ff........)
orc.b(0x....01..........) = 0x....00.......... (instead of 0x....ff..........)
orc.b(0x..01............) = 0x..00............ (instead of 0x..ff............)
orc.b(0x01..............) = 0x00.............. (instead of 0xff..............)
(see test cases below)

The issue seems to be related to the propagation of the carry.
I had a hard time fixing it. With some help, I have added a prolog
which basically computes:
(source1 | ((source1 << 1) & ~ones)) in order to avoid the carry.
I will send the patch as a follow-up in this thread as 'Patch 1A'.

But it's notably less optimized than the current code,  so feel free
to come up with better options.
Actually my initial stab at fixing it was implementing a more
straightforward but less astute 'divide and conquer' method
where bits are or'ed by pairs, then the pairs are or'ed by pair ...
using the following formula:
tmp = source1 | (source1 >> 1)
tmp = tmp | (tmp >> 2)
tmp = tmp | (tmp >> 4)
ret = tmp & 0x0101010101010101
ret = tmp * 0xff
as it's notably less optimized than the current code when converted in
tcg_gen_ primitives but de par with the fixed version.
I'm also sending in this thread as 'Patch 1B' as I feel it's slightly
easier to grasp.


Test cases run on current implementation:
orc.b(0x0000000000000000) = 0x0000000000000000   OK (expect 0x0000000000000000)
orc.b(0x0000000000000001) = 0x00000000000000ff   OK (expect 0x00000000000000ff)
orc.b(0x0000000000000002) = 0x00000000000000ff   OK (expect 0x00000000000000ff)
orc.b(0x0000000000000004) = 0x00000000000000ff   OK (expect 0x00000000000000ff)
orc.b(0x0000000000000008) = 0x00000000000000ff   OK (expect 0x00000000000000ff)
orc.b(0x0000000000000010) = 0x00000000000000ff   OK (expect 0x00000000000000ff)
orc.b(0x0000000000000020) = 0x00000000000000ff   OK (expect 0x00000000000000ff)
orc.b(0x0000000000000040) = 0x00000000000000ff   OK (expect 0x00000000000000ff)
orc.b(0x0000000000000080) = 0x00000000000000ff   OK (expect 0x00000000000000ff)
orc.b(0x0000000000000100) = 0x0000000000000000 FAIL (expect 0x000000000000ff00)
orc.b(0x0000000000000200) = 0x000000000000ff00   OK (expect 0x000000000000ff00)
orc.b(0x0000000000000400) = 0x000000000000ff00   OK (expect 0x000000000000ff00)
orc.b(0x0000000000000800) = 0x000000000000ff00   OK (expect 0x000000000000ff00)
orc.b(0x0000000000001000) = 0x000000000000ff00   OK (expect 0x000000000000ff00)
orc.b(0x0000000000002000) = 0x000000000000ff00   OK (expect 0x000000000000ff00)
orc.b(0x0000000000004000) = 0x000000000000ff00   OK (expect 0x000000000000ff00)
orc.b(0x0000000000008000) = 0x000000000000ff00   OK (expect 0x000000000000ff00)
orc.b(0x0000000000010000) = 0x0000000000000000 FAIL (expect 0x0000000000ff0000)
orc.b(0x0000000000020000) = 0x0000000000ff0000   OK (expect 0x0000000000ff0000)
orc.b(0x0000000001000000) = 0x0000000000000000 FAIL (expect 0x00000000ff000000)
orc.b(0x0000000002000000) = 0x00000000ff000000   OK (expect 0x00000000ff000000)
orc.b(0x0000000100000000) = 0x0000000000000000 FAIL (expect 0x000000ff00000000)
orc.b(0x0000000200000000) = 0x000000ff00000000   OK (expect 0x000000ff00000000)
orc.b(0x0000010000000000) = 0x0000000000000000 FAIL (expect 0x0000ff0000000000)
orc.b(0x0000020000000000) = 0x0000ff0000000000   OK (expect 0x0000ff0000000000)
orc.b(0x0001000000000000) = 0x0000000000000000 FAIL (expect 0x00ff000000000000)
orc.b(0x0002000000000000) = 0x00ff000000000000   OK (expect 0x00ff000000000000)
orc.b(0x0100000000000000) = 0x0000000000000000 FAIL (expect 0xff00000000000000)
orc.b(0x0200000000000000) = 0xff00000000000000   OK (expect 0xff00000000000000)
orc.b(0x0400000000000000) = 0xff00000000000000   OK (expect 0xff00000000000000)
orc.b(0x0800000000000000) = 0xff00000000000000   OK (expect 0xff00000000000000)
orc.b(0x1000000000000000) = 0xff00000000000000   OK (expect 0xff00000000000000)
orc.b(0x2000000000000000) = 0xff00000000000000   OK (expect 0xff00000000000000)
orc.b(0x4000000000000000) = 0xff00000000000000   OK (expect 0xff00000000000000)
orc.b(0x8000000000000000) = 0xff00000000000000   OK (expect 0xff00000000000000)
orc.b(0xffffffffffffffff) = 0xffffffffffffffff   OK (expect 0xffffffffffffffff)
orc.b(0x00ff00ff00ff00ff) = 0x00ff00ff00ff00ff   OK (expect 0x00ff00ff00ff00ff)
orc.b(0xff00ff00ff00ff00) = 0xff00ff00ff00ff00   OK (expect 0xff00ff00ff00ff00)
orc.b(0x0001000100010001) = 0x00000000000000ff FAIL (expect 0x00ff00ff00ff00ff)
orc.b(0x0100010001000100) = 0x0000000000000000 FAIL (expect 0xff00ff00ff00ff00)
orc.b(0x8040201008040201) = 0xffffffffffffffff   OK (expect 0xffffffffffffffff)
orc.b(0x0804020180402010) = 0xffffffffffffffff   OK (expect 0xffffffffffffffff)
orc.b(0x010055aa00401100) = 0x0000ffff00ffff00 FAIL (expect 0xff00ffff00ffff00)


>
> -static bool trans_gorci(DisasContext *ctx, arg_gorci *a)
> +static bool trans_orc_b(DisasContext *ctx, arg_orc_b *a)
>  {
> -    REQUIRE_EXT(ctx, RVB);
> -    return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_helper_gorc);
> +    REQUIRE_ZBB(ctx);
> +    return gen_unary(ctx, a, EXT_ZERO, gen_orc_b);
>  }
>
>  #define GEN_SHADD(SHAMT)                                       \
> @@ -476,22 +487,6 @@ static bool trans_greviw(DisasContext *ctx, arg_greviw *a)
>      return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_helper_grev);
>  }
>
> -static bool trans_gorcw(DisasContext *ctx, arg_gorcw *a)
> -{
> -    REQUIRE_64BIT(ctx);
> -    REQUIRE_EXT(ctx, RVB);
> -    ctx->w = true;
> -    return gen_shift(ctx, a, EXT_ZERO, gen_helper_gorc);
> -}
> -
> -static bool trans_gorciw(DisasContext *ctx, arg_gorciw *a)
> -{
> -    REQUIRE_64BIT(ctx);
> -    REQUIRE_EXT(ctx, RVB);
> -    ctx->w = true;
> -    return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_helper_gorc);
> -}
> -
>  #define GEN_SHADD_UW(SHAMT)                                       \
>  static void gen_sh##SHAMT##add_uw(TCGv ret, TCGv arg1, TCGv arg2) \
>  {                                                                 \
> --
> 2.31.1
>
>

