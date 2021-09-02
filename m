Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD553FE7AA
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 04:30:33 +0200 (CEST)
Received: from localhost ([::1]:47856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLcUq-0006dt-9U
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 22:30:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mLcRU-00053w-3I
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 22:27:04 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:33555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mLcRR-0005Js-Gy
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 22:27:03 -0400
Received: by mail-io1-xd2f.google.com with SMTP id f6so623113iox.0
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 19:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a2J1c3+gStWkxecwCupCIkl6cbI9wvjGa1t34WVzUIQ=;
 b=JQAE49M8pZ52UOYEj39dAzDMRD+IRTHjvzf/k5gNeto1KErtHw0STsxcpF/mkgYwaO
 ln2VhghtSxIMTw5YfpMuQd5EWYR4NjTwoJ7KAPku3mUbqUpjxGgydahQ0hAmt0YcrOJO
 JRNWl1RMqEu3EBwUbSiMJMZu9hFn/4owefsvHcRBU5hthVsVCWuo1FHFIiP66F5HeCGO
 +NkY/m80P1tJ/qMKNHx/7VkxHTQ0jKusAvAjMhPUYQEXbp8fKYCRU8Y2bRHIXzU4fJnM
 WL+pYN/2i5pEkLAcZx0EY56W97FKrJnWrSVVQcZJFFTOki6jbR4JNhOMWN2Mu/FR/yxz
 IzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a2J1c3+gStWkxecwCupCIkl6cbI9wvjGa1t34WVzUIQ=;
 b=cDWALi8Qdjd6pX0gCqII5mah2dM4iGB8WM62k7Gp+z+teFqVUZn42eN1GqgWOP9w2s
 vZVaQDGkSwflPowoB5Q7n+ogStV2LwgTsJXIMACughPj4Q+AQ6y38GOHc3hO4vqEOZU1
 4j6bH1VWUqCcCZj9t2pZpeVVPaCPUsnlbOCiZoyocKVFOQBE0wUYBNSQrEP14v4ZCIsW
 W66frnfg3HBMeKcO1vwTBs83Fzi82gEFDNywh8K3vTD3NT1EM5d2CbMO/km7aohpy81N
 enbmqxBrm/JXu0+a1ke9wbX8DBLyX64UFGzUGgTbSwsjMiOd++IGTTVEOSZ1lZGYuflj
 uCxA==
X-Gm-Message-State: AOAM530kYxFR519a0rKz10gRLlHGzqFdmAx8ok2DnHkbcTwl44aWC9u5
 emLV68G+ICf9rPwh3Wwav5J+FjRftWjnjL8pV4Q=
X-Google-Smtp-Source: ABdhPJy57Hd5gFyNQk9YWpPCCRMcb9C+UHUFxFymKSYAxAZIZiREH9rkIg8cbwYvkHKMI+lCeOkx5v6Y5vqBdMMIvf0=
X-Received: by 2002:a05:6638:3048:: with SMTP id
 u8mr822663jak.91.1630549620351; 
 Wed, 01 Sep 2021 19:27:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210830111511.1905048-1-philipp.tomsich@vrull.eu>
 <20210830111511.1905048-15-philipp.tomsich@vrull.eu>
In-Reply-To: <20210830111511.1905048-15-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Sep 2021 12:26:34 +1000
Message-ID: <CAKmqyKO_rJv41wr_WLR=U3XqCfL1eMo+rLd8jAnJ4VDa5zg+Mw@mail.gmail.com>
Subject: Re: [PATCH v7 14/14] disas/riscv: Add Zb[abcs] instructions
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
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

On Mon, Aug 30, 2021 at 9:22 PM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> With the addition of Zb[abcs], we also need to add disassembler
> support for these new instructions.
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> (no changes since v2)
>
> Changes in v2:
> - Fix missing ';' from last-minute whitespace cleanups.
>
>  disas/riscv.c | 157 +++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 154 insertions(+), 3 deletions(-)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index 278d9be924..793ad14c27 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -478,6 +478,49 @@ typedef enum {
>      rv_op_fsflags = 316,
>      rv_op_fsrmi = 317,
>      rv_op_fsflagsi = 318,
> +    rv_op_bseti = 319,
> +    rv_op_bclri = 320,
> +    rv_op_binvi = 321,
> +    rv_op_bexti = 322,
> +    rv_op_rori = 323,
> +    rv_op_clz = 324,
> +    rv_op_ctz = 325,
> +    rv_op_cpop = 326,
> +    rv_op_sext_h = 327,
> +    rv_op_sext_b = 328,
> +    rv_op_xnor = 329,
> +    rv_op_orn = 330,
> +    rv_op_andn = 331,
> +    rv_op_rol = 332,
> +    rv_op_ror = 333,
> +    rv_op_sh1add = 334,
> +    rv_op_sh2add = 335,
> +    rv_op_sh3add = 336,
> +    rv_op_sh1add_uw = 337,
> +    rv_op_sh2add_uw = 338,
> +    rv_op_sh3add_uw = 339,
> +    rv_op_clmul = 340,
> +    rv_op_clmulr = 341,
> +    rv_op_clmulh = 342,
> +    rv_op_min = 343,
> +    rv_op_minu = 344,
> +    rv_op_max = 345,
> +    rv_op_maxu = 346,
> +    rv_op_clzw = 347,
> +    rv_op_ctzw = 348,
> +    rv_op_cpopw = 349,
> +    rv_op_slli_uw = 350,
> +    rv_op_add_uw = 351,
> +    rv_op_rolw = 352,
> +    rv_op_rorw = 353,
> +    rv_op_rev8 = 354,
> +    rv_op_zext_h = 355,
> +    rv_op_roriw = 356,
> +    rv_op_orc_b = 357,
> +    rv_op_bset = 358,
> +    rv_op_bclr = 359,
> +    rv_op_binv = 360,
> +    rv_op_bext = 361,
>  } rv_op;
>
>  /* structures */
> @@ -1117,6 +1160,49 @@ const rv_opcode_data opcode_data[] = {
>      { "fsflags", rv_codec_i_csr, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>      { "fsrmi", rv_codec_i_csr, rv_fmt_rd_zimm, NULL, 0, 0, 0 },
>      { "fsflagsi", rv_codec_i_csr, rv_fmt_rd_zimm, NULL, 0, 0, 0 },
> +    { "bseti", rv_codec_i_sh7, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
> +    { "bclri", rv_codec_i_sh7, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
> +    { "binvi", rv_codec_i_sh7, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
> +    { "bexti", rv_codec_i_sh7, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
> +    { "rori", rv_codec_i_sh7, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
> +    { "clz", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> +    { "ctz", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> +    { "cpop", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> +    { "sext.h", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> +    { "sext.b", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> +    { "xnor", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> +    { "orn", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> +    { "andn", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> +    { "rol", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "ror", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "sh1add", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "sh2add", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "sh3add", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "sh1add.uw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "sh2add.uw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "sh3add.uw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "clmul", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "clmulr", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "clmulh", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "min", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "minu", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "max", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "maxu", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> +    { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> +    { "cpopw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> +    { "slli.uw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "add.uw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "rolw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "rorw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "rev8", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> +    { "zext.h", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> +    { "roriw", rv_codec_i_sh5, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
> +    { "orc.b", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> +    { "bset", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "bclr", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "binv", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "bext", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>  };
>
>  /* CSR names */
> @@ -1507,7 +1593,20 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>              case 0: op = rv_op_addi; break;
>              case 1:
>                  switch (((inst >> 27) & 0b11111)) {
> -                case 0: op = rv_op_slli; break;
> +                case 0b00000: op = rv_op_slli; break;
> +                case 0b00101: op = rv_op_bseti; break;
> +                case 0b01001: op = rv_op_bclri; break;
> +                case 0b01101: op = rv_op_binvi; break;
> +                case 0b01100:
> +                    switch (((inst >> 20) & 0b1111111)) {
> +                    case 0b0000000: op = rv_op_clz; break;
> +                    case 0b0000001: op = rv_op_ctz; break;
> +                    case 0b0000010: op = rv_op_cpop; break;
> +                      /* 0b0000011 */
> +                    case 0b0000100: op = rv_op_sext_b; break;
> +                    case 0b0000101: op = rv_op_sext_h; break;
> +                    }
> +                    break;
>                  }
>                  break;
>              case 2: op = rv_op_slti; break;
> @@ -1515,8 +1614,16 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>              case 4: op = rv_op_xori; break;
>              case 5:
>                  switch (((inst >> 27) & 0b11111)) {
> -                case 0: op = rv_op_srli; break;
> -                case 8: op = rv_op_srai; break;
> +                case 0b00000: op = rv_op_srli; break;
> +                case 0b00101: op = rv_op_orc_b; break;
> +                case 0b01000: op = rv_op_srai; break;
> +                case 0b01001: op = rv_op_bexti; break;
> +                case 0b01100: op = rv_op_rori; break;
> +                case 0b01101:
> +                    switch ((inst >> 20) & 0b1111111) {
> +                    case 0b0111000: op = rv_op_rev8; break;
> +                    }
> +                    break;
>                  }
>                  break;
>              case 6: op = rv_op_ori; break;
> @@ -1530,12 +1637,21 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>              case 1:
>                  switch (((inst >> 25) & 0b1111111)) {
>                  case 0: op = rv_op_slliw; break;
> +                case 4: op = rv_op_slli_uw; break;
> +                case 48:
> +                    switch ((inst >> 20) & 0b11111) {
> +                    case 0b00000: op = rv_op_clzw; break;
> +                    case 0b00001: op = rv_op_ctzw; break;
> +                    case 0b00010: op = rv_op_cpopw; break;
> +                    }
> +                    break;
>                  }
>                  break;
>              case 5:
>                  switch (((inst >> 25) & 0b1111111)) {
>                  case 0: op = rv_op_srliw; break;
>                  case 32: op = rv_op_sraiw; break;
> +                case 48: op = rv_op_roriw; break;
>                  }
>                  break;
>              }
> @@ -1623,8 +1739,32 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>              case 13: op = rv_op_divu; break;
>              case 14: op = rv_op_rem; break;
>              case 15: op = rv_op_remu; break;
> +            case 36:
> +                switch ((inst >> 20) & 0b11111) {
> +                case 0: op = rv_op_zext_h; break;
> +                }
> +                break;
> +            case 41: op = rv_op_clmul; break;
> +            case 42: op = rv_op_clmulr; break;
> +            case 43: op = rv_op_clmulh; break;
> +            case 44: op = rv_op_min; break;
> +            case 45: op = rv_op_minu; break;
> +            case 46: op = rv_op_max; break;
> +            case 47: op = rv_op_maxu; break;
> +            case 130: op = rv_op_sh1add; break;
> +            case 132: op = rv_op_sh2add; break;
> +            case 134: op = rv_op_sh3add; break;
> +            case 161: op = rv_op_bset; break;
>              case 256: op = rv_op_sub; break;
> +            case 260: op = rv_op_xnor; break;
>              case 261: op = rv_op_sra; break;
> +            case 262: op = rv_op_orn; break;
> +            case 263: op = rv_op_andn; break;
> +            case 289: op = rv_op_bclr; break;
> +            case 293: op = rv_op_bext; break;
> +            case 385: op = rv_op_rol; break;
> +            case 386: op = rv_op_ror; break;
> +            case 417: op = rv_op_binv; break;
>              }
>              break;
>          case 13: op = rv_op_lui; break;
> @@ -1638,8 +1778,19 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>              case 13: op = rv_op_divuw; break;
>              case 14: op = rv_op_remw; break;
>              case 15: op = rv_op_remuw; break;
> +            case 32: op = rv_op_add_uw; break;
> +            case 36:
> +                switch ((inst >> 20) & 0b11111) {
> +                case 0: op = rv_op_zext_h; break;
> +                }
> +                break;
> +            case 130: op = rv_op_sh1add_uw; break;
> +            case 132: op = rv_op_sh2add_uw; break;
> +            case 134: op = rv_op_sh3add_uw; break;
>              case 256: op = rv_op_subw; break;
>              case 261: op = rv_op_sraw; break;
> +            case 385: op = rv_op_rolw; break;
> +            case 389: op = rv_op_rorw; break;
>              }
>              break;
>          case 16:
> --
> 2.25.1
>
>

