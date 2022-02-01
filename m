Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E19664A5581
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 04:13:51 +0100 (CET)
Received: from localhost ([::1]:53444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEjc7-0007eu-2b
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 22:13:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nEjZ6-0004hZ-Rb
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 22:10:46 -0500
Received: from [2607:f8b0:4864:20::d31] (port=35700
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nEjZ5-0005WL-6u
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 22:10:44 -0500
Received: by mail-io1-xd31.google.com with SMTP id 9so19594547iou.2
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 19:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2nwaAFN+FIQOQnTufO/oV8zvpLp0th5OdNOrjvdKpcM=;
 b=bUvJow6AJlRsKqqZtbMm/p1me9WTLKGWypI+LQvgvPg6wLz8SsS5fcbFEi5dh0vHOx
 MOpGkAriMXDFgXTTywfScC0jQN0+8bmL9HPLR/Dhz1Hn/dqo+ycwkRNO/rlYTAWpuFOM
 x5L5YweA6D7+KEEMcTUpPG8BnUnMT8ITJAZXBZzAM1yBWzrdjHYq4I2cmQOjqAMsHboE
 AIRrbtPFrG5lbZjf0DNrmWa0Tt4GrLW++x2vtiABkjI9hKB49HIy125SkVCb6/MXm2Zn
 IeKzX60ZHvN0FDBCX97cYYkzvjnZFg6NOGQhsFsWf+114gI2QQ111dZ0THUKO8piWtIX
 s1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2nwaAFN+FIQOQnTufO/oV8zvpLp0th5OdNOrjvdKpcM=;
 b=Vaji1I4UFKQevVuwulxoFmoL214aSLV2ilTXIz8woPJetyXRinyN5gdF2ftEoVTkai
 hvfRnn2XNMzYZq6W5Y75x/fkP+lMuS512g3uu9TXjXWy8Ogy0DcbvRtkW0dKLx7QG3nF
 637FgLS5yHoIXsccG5y7AwH0j35a9Op1tANmNv0MEk75cxprR5Bk3616GEHX27Ve+6ph
 LUx5UQjYd/0PmIghkx95pjUOIxRf+YWYeM3n07NU4jdKcXsRCyfMw5oM8yYPZFuG+Q/R
 KJjMAwcNmjwJ9l/Vq0JBkR+MQGEkryzre+DEO2ZENqmSJe18y1XQ1U92PPpUMgpx6WUr
 A1Qw==
X-Gm-Message-State: AOAM533Z7UY8JWi6BnAFbNAdMieE/u16G+jgIC1GCyuocHVkHApjO9Y9
 HpccTjheTjhXr81C5q3memkt4pKWK2u8ox8VUBM=
X-Google-Smtp-Source: ABdhPJxkpZkcU7PMWfJtY7t4ejHNm3PHn6zuVCW456CRj1M0LHo/eJYJc7PFX5vvpVdsOBUSVjQVLexa7CMGm4TdFZ4=
X-Received: by 2002:a02:9606:: with SMTP id c6mr11517093jai.169.1643685042194; 
 Mon, 31 Jan 2022 19:10:42 -0800 (PST)
MIME-Version: 1.0
References: <20220131110201.2303275-1-philipp.tomsich@vrull.eu>
 <20220131110201.2303275-6-philipp.tomsich@vrull.eu>
In-Reply-To: <20220131110201.2303275-6-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 1 Feb 2022 13:10:15 +1000
Message-ID: <CAKmqyKNyDMdXh3OLaO-nHhep4XKN1LgaN8Gt85RMKvjQXM8NFA@mail.gmail.com>
Subject: Re: [PATCH v5 5/7] target/riscv: iterate over a table of decoders
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Greg Favor <gfavor@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 31, 2022 at 9:32 PM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> To split up the decoder into multiple functions (both to support
> vendor-specific opcodes in separate files and to simplify maintenance
> of orthogonal extensions), this changes decode_op to iterate over a
> table of decoders predicated on guard functions.
>
> This commit only adds the new structure and the table, allowing for
> the easy addition of additional decoders in the future.
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> (no changes since v4)
>
> Changes in v4:
> - add braces to comply with coding standard (as suggested by Richard)
> - merge the two if-statements to reduce clutter after (now that the
>   braces have been added)
>
> Changes in v3:
> - expose only the DisasContext* to predicate functions
> - mark the table of decoder functions as static
> - drop the inline from always_true_p, until the need arises (i.e.,
>   someone finds a use for it and calls it directly)
> - rewrite to drop the 'handled' temporary in iterating over the
>   decoder table, removing the assignment in the condition of the if
>
> Changes in v2:
> - (new patch) iterate over a table of guarded decoder functions
>
>  target/riscv/translate.c | 32 +++++++++++++++++++++++++++-----
>  1 file changed, 27 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index f19d5cd0c0..30b1b68341 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -111,6 +111,11 @@ static inline bool has_ext(DisasContext *ctx, uint32_t ext)
>      return ctx->misa_ext & ext;
>  }
>
> +static bool always_true_p(DisasContext *ctx  __attribute__((__unused__)))
> +{
> +    return true;
> +}
> +
>  #ifdef TARGET_RISCV32
>  #define get_xl(ctx)    MXL_RV32
>  #elif defined(CONFIG_USER_ONLY)
> @@ -855,15 +860,26 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
>
>  static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>  {
> -    /* check for compressed insn */
> +    /*
> +     * A table with predicate (i.e., guard) functions and decoder functions
> +     * that are tested in-order until a decoder matches onto the opcode.
> +     */
> +    static const struct {
> +        bool (*guard_func)(DisasContext *);
> +        bool (*decode_func)(DisasContext *, uint32_t);
> +    } decoders[] = {
> +        { always_true_p,  decode_insn32 },
> +    };
> +
> +    /* Check for compressed insn */
>      if (extract16(opcode, 0, 2) != 3) {
>          if (!has_ext(ctx, RVC)) {
>              gen_exception_illegal(ctx);
>          } else {
>              ctx->opcode = opcode;
>              ctx->pc_succ_insn = ctx->base.pc_next + 2;
> -            if (!decode_insn16(ctx, opcode)) {
> -                gen_exception_illegal(ctx);
> +            if (decode_insn16(ctx, opcode)) {
> +                return;
>              }
>          }
>      } else {
> @@ -873,10 +889,16 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>                                               ctx->base.pc_next + 2));
>          ctx->opcode = opcode32;
>          ctx->pc_succ_insn = ctx->base.pc_next + 4;
> -        if (!decode_insn32(ctx, opcode32)) {
> -            gen_exception_illegal(ctx);
> +
> +        for (size_t i = 0; i < ARRAY_SIZE(decoders); ++i) {
> +            if (decoders[i].guard_func(ctx) &&
> +                decoders[i].decode_func(ctx, opcode32)) {
> +                return;
> +            }
>          }
>      }
> +
> +    gen_exception_illegal(ctx);
>  }
>
>  static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
> --
> 2.33.1
>
>

