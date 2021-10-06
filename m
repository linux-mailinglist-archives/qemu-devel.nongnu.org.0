Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A02694249AF
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 00:28:27 +0200 (CEST)
Received: from localhost ([::1]:38352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYFOk-0004Sb-6k
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 18:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mYFNd-0003mc-Lr
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 18:27:17 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:39556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mYFNc-00069T-7r
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 18:27:17 -0400
Received: by mail-il1-x12b.google.com with SMTP id w11so1146725ilv.6
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 15:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6V3NZIZyy2AbHYf0J/t74Qhnz2zCJmCu9KGMPvtCn90=;
 b=h7/IgR6c5//SS35iVVXdiTBUjvMBxgU7SYpDIXCpHAaM2SCqDKzqo4FJ0NFyci5WA0
 70OCzpVvLycXNlbH7ymTAXYEftciEDmBopHDVE+7qc85DMufMdYMf3l5iAfgglLVR5C7
 hAXe1iHhcgB77aqO3Pbju7TdU4OtZBJFLqTffoXXOcnz37tKU1Y/In416R2roco9YdCT
 ZzpKFphggiFOXu7Ggx/jmrGOeS1Sb0toqPlHRMU1J/UPUXh2woDh/0QkFiOMU1ji7iGv
 PROJK3Pl5tepet2vFizxDy5gUOTndeXtqzTaZbah6u8Ajcn2FNAqPT1nULtW4OGY9CcH
 ibuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6V3NZIZyy2AbHYf0J/t74Qhnz2zCJmCu9KGMPvtCn90=;
 b=1YhPDc+y+NmllJGZRAHHiPcb806rtVMEnxK72gfNBGFQf8cdFr+CupHLwmDfxteABG
 6ki+3m8ncO7vi+33osniKsYtXR1xQero9S8H8zp7uQaT9nqPCAh8A2ub3Y28PnglYlOh
 ou/Z2+z96kYY4UvCRYjxRw02m/1yRhynKbpgd1LG45wgaSLrjbY6iTz40HMSNnQDC+Gt
 X94M1rgXSkIlWFq4rlbjnNF27fO3nYNwF3ogetr0bhlp6X7x0l8jhKQyTeKTEZ63fpby
 ICMIeqbd5RdztU+Jd6b+xiDB79RY70MgrBauVwEam0I6xHo2HoQJJIFZV4VqkYl9VzVi
 mS9A==
X-Gm-Message-State: AOAM532NQorj6MqSMIJSSOK70trgZHnqj+J2BwmC25TprN8+MGC0AR7B
 vZG/2Y9j1W+2LCgwZ7rp0vge/9y51KaqRPrpKAo=
X-Google-Smtp-Source: ABdhPJzCUcfQg0Do75u7pi1hClGOKTA3KBEvgtmmDxar9vifJ+Szy8bfquxhErpgiwAnLChWJjKd8+wWcVpoBgaCReE=
X-Received: by 2002:a05:6e02:164a:: with SMTP id
 v10mr505637ilu.74.1633559235258; 
 Wed, 06 Oct 2021 15:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211003214243.3813425-1-philipp.tomsich@vrull.eu>
 <20211003214243.3813425-2-philipp.tomsich@vrull.eu>
In-Reply-To: <20211003214243.3813425-2-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 7 Oct 2021 08:26:49 +1000
Message-ID: <CAKmqyKO+k7OtQ_G+eSqGzYJZrfLQh3NAJAT08UO0aWcKrCiaFw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] target/riscv: Use dup_const_tl in orc.b to
 legalise truncation of constant
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12b.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 4, 2021 at 7:44 AM Philipp Tomsich <philipp.tomsich@vrull.eu> wrote:
>
> We need to use the newly introduced dup_const_tl in orc.b to legalise
> the truncation (to target_long) of the constant generated with dup_const.
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> (no changes since v1)
>
>  target/riscv/insn_trans/trans_rvb.c.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index 2927353d9b..185c3e9a60 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -249,7 +249,7 @@ static bool trans_rev8_64(DisasContext *ctx, arg_rev8_64 *a)
>  static void gen_orc_b(TCGv ret, TCGv source1)
>  {
>      TCGv  tmp = tcg_temp_new();
> -    TCGv  ones = tcg_constant_tl(dup_const(MO_8, 0x01));
> +    TCGv  ones = tcg_constant_tl(dup_const_tl(MO_8, 0x01));
>
>      /* Set lsb in each byte if the byte was zero. */
>      tcg_gen_sub_tl(tmp, source1, ones);
> --
> 2.25.1
>
>

