Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A969842E866
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 07:31:45 +0200 (CEST)
Received: from localhost ([::1]:33874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbFom-0003jx-Lw
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 01:31:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mbFlz-0002NN-Mt
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 01:28:51 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:45877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mbFlx-0001Ly-Ui
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 01:28:51 -0400
Received: by mail-io1-xd36.google.com with SMTP id 188so6410877iou.12
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 22:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S+xlcjGQRmLTldmDeOPK3H8CQ61uXeLl51seCRqw900=;
 b=GvTxEY3FShm50QTEmts/wafN0muMQfQpoU0l+eBGkcKP0SweyrmkQcPQBUUOb5jO5C
 6HdM1wpqZBeOS7jz86+yf+72lICIrvn5Bpx0lm/+TmX+BHd7NhH38OzGIA/jZX+Lj2Jl
 PQy0J7wQMix18St6xYi0RDIyfFetr4puIIhyJGzSbFNXWROd4CFgfJLJ5oisIFFlUnGW
 fTpV2dgGGjnVr7Xau86LJwqVq93NQ0PMa4klpNRtaawLj1vEzwh5nz2X0SCI9q/Xx7KE
 4tJUFdH4hHTqdcvXLivg0mqCRDUWlVYEsSV2hPepRqLhGgHhPsLLaI/cKTPx0FZnJcuP
 vNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S+xlcjGQRmLTldmDeOPK3H8CQ61uXeLl51seCRqw900=;
 b=MaaGWg/FRI+vQ8uA3xRobUpcnOVDvIUIJeFc1RV7ZdRuakKP7DB4q74GLikrLDukyA
 DgfC0TROxs9FaCrxh4BnG32+6OqEujgkCztTmq3RbxWShALz35QQDpDzpaLkoIOn8a1+
 uMi49cPB9dLymxF7ipLIJayDBzsuUevCgGtdus9i8ru8ao9BvwCwOJfLHCWgcgsbSGep
 cB3fAZ08cans2suRDqoZF7swWtWpSYo0BZE90m3QDAGw1d/RrWfeS4XUcAvRIADCB1/v
 u60TUrCVF+bLOZkuwDNwsPfuIWOGo1HjC7XxRKGtpcfM1qNUqDzaoudLh5JQNaPvgrlt
 zG5g==
X-Gm-Message-State: AOAM531WgxMJv93AzLJKzXnmZaCrXLtkfGxWTmkqtEWqnTixOYj5i0uA
 mfrbr7lkSAFCeU33u90G5rxgXsty8zhauo9uSlg=
X-Google-Smtp-Source: ABdhPJzoS6laqokdH4h7gjcWBUCszVRwTxCjPgW3ReTLH5hQT3+EQbU2ELBVnHAWocRIe2ubibYr1ZUxMGqSomSB8Lg=
X-Received: by 2002:a5e:9612:: with SMTP id a18mr2328695ioq.57.1634275728739; 
 Thu, 14 Oct 2021 22:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211013184125.2010897-1-philipp.tomsich@vrull.eu>
In-Reply-To: <20211013184125.2010897-1-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Oct 2021 15:28:22 +1000
Message-ID: <CAKmqyKPgxAY25sHDH6+JDVbmOTNJv=bYe5bpkPqr6TAYwaBFHg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix orc.b implementation
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
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
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Vincent Palatin <vpalatin@rivosinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 14, 2021 at 4:43 AM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> The earlier implementation fell into a corner case for bytes that were
> 0x01, giving a wrong result (but not affecting our application test
> cases for strings, as an ASCII value 0x01 is rare in those...).
>
> This changes the algorithm to:
>  1. Mask out the high-bit of each bytes (so that each byte is <= 127).
>  2. Add 127 to each byte (i.e. if the low 7 bits are not 0, this will overflow
>     into the highest bit of each byte).
>  3. Bitwise-or the original value back in (to cover those cases where the
>     source byte was exactly 128) to saturate the high-bit.
>  4. Shift-and-mask (implemented as a mask-and-shift) to extract the MSB of
>     each byte into its LSB.
>  5. Multiply with 0xff to fan out the LSB to all bits of each byte.
>
> Fixes: d7a4fcb034 ("target/riscv: Add orc.b instruction for Zbb, removing gorc/gorci")
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Reported-by: Vincent Palatin <vpalatin@rivosinc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

>
> ---
>
>  target/riscv/insn_trans/trans_rvb.c.inc | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index 185c3e9a60..3095624f32 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -249,13 +249,16 @@ static bool trans_rev8_64(DisasContext *ctx, arg_rev8_64 *a)
>  static void gen_orc_b(TCGv ret, TCGv source1)
>  {
>      TCGv  tmp = tcg_temp_new();
> -    TCGv  ones = tcg_constant_tl(dup_const_tl(MO_8, 0x01));
> +    TCGv  low7 = tcg_constant_tl(dup_const_tl(MO_8, 0x7f));
>
> -    /* Set lsb in each byte if the byte was zero. */
> -    tcg_gen_sub_tl(tmp, source1, ones);
> -    tcg_gen_andc_tl(tmp, tmp, source1);
> +    /* Set msb in each byte if the byte was non-zero. */
> +    tcg_gen_and_tl(tmp, source1, low7);
> +    tcg_gen_add_tl(tmp, tmp, low7);
> +    tcg_gen_or_tl(tmp, tmp, source1);
> +
> +    /* Extract the msb to the lsb in each byte */
> +    tcg_gen_andc_tl(tmp, tmp, low7);
>      tcg_gen_shri_tl(tmp, tmp, 7);
> -    tcg_gen_andc_tl(tmp, ones, tmp);
>
>      /* Replicate the lsb of each byte across the byte. */
>      tcg_gen_muli_tl(ret, tmp, 0xff);
> --
> 2.25.1
>
>

