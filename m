Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 086244A91DE
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 02:07:11 +0100 (CET)
Received: from localhost ([::1]:55984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFn49-0000y8-N6
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 20:07:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nFmxk-0007oF-7X
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 20:00:32 -0500
Received: from [2607:f8b0:4864:20::135] (port=41625
 helo=mail-il1-x135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nFmxh-0000pz-2v
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 20:00:31 -0500
Received: by mail-il1-x135.google.com with SMTP id 15so3580114ilg.8
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 17:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=imt5mjhHArAvrvzGT5EpUaY+u81f8WSjx6PXj/+VR8E=;
 b=TZ9rcEekH5BUJwamyoHaGrB/i0efCAYEuw9DL8V20uYvCPZgB15CrZckY4iRDYTRKD
 h6nArWqQkbU22sYELy0mz+uwLsbTfn+rFnCDrZ2cpjmvgKhfm1H3P/tXRH96DA3BBVxL
 16SD25dgd5IP7M0CQWq8xYnJyko1TPGsJdbCPhAdSgaauYxMKjd+HvNPeLdZOEKsC0/5
 Fe91gt4gTZ4CFz3QcVr5FKLgQSkbfGyYXLGF/+mm0Yq4OfHolb6uVETw3a68JpxDuduJ
 XY2Lomg0qeNEdCRBoUKisvVPnTQrNTDQ+FOgubU+sWFOVvSDAw/jFDZiS6H20z2iuBO0
 ZqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=imt5mjhHArAvrvzGT5EpUaY+u81f8WSjx6PXj/+VR8E=;
 b=QKR+A/WixyWAlRnjjk0/m2lI99teyyilNNscWW53Wf6GwrtGHBU0M+5ms2RTbsng1K
 GkfF0la197ToBwV1uFONQo0d+RaHzTjEVhRoJwnOhrljyH9jTiAZrzjqCyEZhleuq8rg
 HQayVnQQPaIAjE8R0GjikTyQIBGEN2Ug2nFhOnhTioI+Zx2Ijx1wLmiU/TVkamSsY55e
 /4P2z4HdSTVuCA+K4Wc9NNYDJxxyx4KAhXB0j1Xj4jNcJO0IrDdOs8QB+HPtb1Qh5e3E
 F7xrME5MIaPvkOQNbl2sKvHvCodAxI7q1ELjjY4NTizzA1nB2teFNrFls2LqGnXG9Gfr
 Fl7A==
X-Gm-Message-State: AOAM530UCSJDdqjjTldg/Y5/AVJ5niL7Ay3ywwspiCIaHbXLU16PhvRl
 kGyoJWFT9y7rcL+tvjOUqYgNafqDJsxHWJ+S/C4=
X-Google-Smtp-Source: ABdhPJx6GW6n5LMeY5n1tAPZR3jLaU8u58meRLFwgoFAIXWdNBWmDJMI109kBd54JIwj32olr8VMhS4lcTtlpx1lU28=
X-Received: by 2002:a05:6e02:1307:: with SMTP id
 g7mr331534ilr.46.1643936423476; 
 Thu, 03 Feb 2022 17:00:23 -0800 (PST)
MIME-Version: 1.0
References: <20220203153946.2676353-1-philipp.tomsich@vrull.eu>
In-Reply-To: <20220203153946.2676353-1-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 4 Feb 2022 10:59:55 +1000
Message-ID: <CAKmqyKOLO7VdSPsXmeqQN-z3a2bKZQ3yeQqCmjt-SBpT9MfcgA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: fix inverted checks for ext_zb[abcs]
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::135
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x135.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 4, 2022 at 1:42 AM Philipp Tomsich <philipp.tomsich@vrull.eu> wrote:
>
> While changing to the use of cfg_ptr, the conditions for REQUIRE_ZB[ABCS]
> inadvertently became inverted and slipped through the initial testing (which
> used RV64GC_XVentanaCondOps as a target).
> This fixes the regression.
>
> Tested against SPEC2017 w/ GCC 12 (prerelease) for RV64GC_zba_zbb_zbc_zbs.
>
> Fixes: 718143c126 ("target/riscv: add a MAINTAINERS entry for XVentanaCondOps")
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

>
> ---
> We may want to squash this onto the affected commit, if it hasn't made
> it beyond the next-tree, yet.

Yeah, agreed. I'll squash it in

Alistair

>
>  target/riscv/insn_trans/trans_rvb.c.inc | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index f9bd3b7ec4..e3c6b459d6 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -19,25 +19,25 @@
>   */
>
>  #define REQUIRE_ZBA(ctx) do {                    \
> -    if (ctx->cfg_ptr->ext_zba) {                 \
> +    if (!ctx->cfg_ptr->ext_zba) {                 \
>          return false;                            \
>      }                                            \
>  } while (0)
>
>  #define REQUIRE_ZBB(ctx) do {                    \
> -    if (ctx->cfg_ptr->ext_zbb) {                 \
> +    if (!ctx->cfg_ptr->ext_zbb) {                 \
>          return false;                            \
>      }                                            \
>  } while (0)
>
>  #define REQUIRE_ZBC(ctx) do {                    \
> -    if (ctx->cfg_ptr->ext_zbc) {                 \
> +    if (!ctx->cfg_ptr->ext_zbc) {                 \
>          return false;                            \
>      }                                            \
>  } while (0)
>
>  #define REQUIRE_ZBS(ctx) do {                    \
> -    if (ctx->cfg_ptr->ext_zbs) {                 \
> +    if (!ctx->cfg_ptr->ext_zbs) {                 \
>          return false;                            \
>      }                                            \
>  } while (0)
> --
> 2.34.1
>
>

