Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CACF93FB087
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 06:49:08 +0200 (CEST)
Received: from localhost ([::1]:37660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKZEE-0005pm-SQ
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 00:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKZCe-0004UG-2K
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 00:47:25 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:44599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKZCc-0001JK-Hw
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 00:47:23 -0400
Received: by mail-io1-xd2d.google.com with SMTP id g9so18218539ioq.11
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 21:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/jDnAEsLwmXrPiH1U9g9iPBT3l6OckoJnIWYTKwi6bs=;
 b=Lh2hpA+dB3fS2T6/xHDvZg942Hy+PyuJK7EbiU807HVqyWnG49IDtZw8tS+lATIwjE
 TyTZABizTGR9CSOHgEiSFHNgN35g8U2Q7wOyoh4Nf+BMrd0ABwnVmBg8HOIUUQlsD4ri
 EEMV/aEMAQ2l0/8JJO6xuKFtmfXPhe/HY8ODG94YxD7fdI4zuOtWKV6TMyL8jaMKw3BO
 +vhjQJZ2t5CbKvsruwQptnI7ngY2xFYSU5voukgAgVF6NA1BAYpWri9CTOpQDk1op70x
 3qIFs4/4njQRMiMLuJDu4IY3vPlsmkEWN5RkvUCopKh3uU3u8K78euBBRPj/lA+rIPDw
 Fi/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/jDnAEsLwmXrPiH1U9g9iPBT3l6OckoJnIWYTKwi6bs=;
 b=hvBqJRGwCsHAKKrSp8BXojucNLLRudTv5+FC5UUbNRZTUisfwgrZPRhSyE6Zn+w8Xb
 IAZ0WYbM3G01/CXY43mJax4P2lgDmecJOEOUnGYbUjN50qJw9EyFO7FMNhmt9qS2lkpt
 onaD2d3UJbV6v/MYlh/Opf9GkyfiB4fLyfKBQHVEeVTo1vLFgOLvutyrO9Z5P27Cs7Jc
 PayEFoNHSWPx9Fvhuoeq7nYp59aDSQ7kWPhCAHxELvwYXktOWSeKZkMyNrIEXvDTIEK7
 aOnOugbAeKDj8VXbGzWPhIzflrlozTGdunNGwE7EhNN2jdR6AVCGJPqlqqgukQ3Mp4wF
 V/EQ==
X-Gm-Message-State: AOAM5318NIrvSdNwVvHitCIrlvqLqO2YzK703uadwItnWho1UuRNmJw3
 9DAXTf+FiAHK+1TbD2EE908LLDA9SWXb4qk7q0w/KprYd4BSdT2x
X-Google-Smtp-Source: ABdhPJzBQvsMjcJJ2ep1LLiY3xjluz6DpLR+5cG0iHBsg7alCs1Jka0dMZiXRIOtSHbaViwUG/ciUNZbA48+l0OPOXw=
X-Received: by 2002:a5d:850f:: with SMTP id q15mr17020114ion.118.1630298840962; 
 Sun, 29 Aug 2021 21:47:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210825165907.34026-1-philipp.tomsich@vrull.eu>
 <20210825165907.34026-4-philipp.tomsich@vrull.eu>
In-Reply-To: <20210825165907.34026-4-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Aug 2021 14:46:54 +1000
Message-ID: <CAKmqyKPo8-Lb9HFsRz9Lxa8S7DYABj6HWFLjcUsOAEdN5q-F4Q@mail.gmail.com>
Subject: Re: [PATCH v6 03/14] target/riscv: slli.uw is only a valid encoding
 if shamt first in 64 bits
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
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

On Thu, Aug 26, 2021 at 3:09 AM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> For RV64, the shamt field in slli.uw is 6 bits wide. While the encoding
> space currently reserves a wider shamt-field (for use is a future RV128
> ISA), setting the additional bit to 1 will not map to slli.uw for RV64
> and needs to be treated as an illegal instruction.
>
> Note that this encoding being reserved for a future RV128 does not imply
> that no other instructions for RV64-only could be added in this encoding
> space in the future.
>
> As the implementation is separate from the gen_shifti helpers, we keep
> it that way and add the check for the shamt-width here.
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
> - Instead of defining a new decoding format, we treat slli.uw as if it
>   had a 7bit-wide field for shamt (the 7th bit is reserved for RV128)
>   and check for validity of the encoding in C code.
>
>  target/riscv/insn_trans/trans_rvb.c.inc | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index 3cdd70a2b9..dcc7b6893d 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -430,6 +430,15 @@ static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
>      REQUIRE_64BIT(ctx);
>      REQUIRE_ZBA(ctx);
>
> +    /*
> +     * The shamt field is only 6 bits for RV64 (with the 7th bit
> +     * remaining reserved for RV128).  If the reserved bit is set
> +     * on RV64, the encoding is illegal.
> +     */
> +    if (a->shamt >= TARGET_LONG_BITS) {
> +        return false;
> +    }
> +
>      TCGv source1 = tcg_temp_new();
>      gen_get_gpr(source1, a->rs1);
>
> --
> 2.25.1
>
>

