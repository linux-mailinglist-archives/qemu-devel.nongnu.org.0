Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C82439F473
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 12:59:28 +0200 (CEST)
Received: from localhost ([::1]:46918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqZS9-0005qq-CA
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 06:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqZR8-0004wA-Em
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 06:58:22 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:34584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqZR5-0000hf-Tx
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 06:58:22 -0400
Received: by mail-ej1-x629.google.com with SMTP id g8so31944464ejx.1
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 03:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wFtMIOteWNe1S1235gXpZtYI6u36aCxMswOl0OX0NPQ=;
 b=I0w7EkbEVLF0qERjbt85X4yLmzeBrwJB59U59GVkJrmB5DnHd4OV3WvyHIaICtSo9R
 Q31LTHUzxRCGmPla4Zc6Fep59RU8HrMOB1tgGWE2cJLLhKUcyrrP6HGLfxnaocLiDWnB
 7rzMgzh3ijHsEmv9MIVzICd16EJca1rEVBDJJi0k22GRnVxj3JpsJen0zZ827LB5zPOU
 uNmOI2EF0T/cbWp9OtNMiBBNM2YFrPUmSO/mRNBngGIilDp8mjzqiJKfRQQav9T/1zNx
 ZtRUW09Sr93P75afaPQsluMfincqB9zgmk4TMf42jgNo9uIWzPVqLELbmdEK1Wm/jp2a
 qLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wFtMIOteWNe1S1235gXpZtYI6u36aCxMswOl0OX0NPQ=;
 b=KuXR+TYLq9hHXgRJ1CQ+Z+2WUZ/krQLI8lKEGZFoFPlUniwNLlQx86rNIIfuQn8+ey
 oxY6Sd7HHvgFpZYAmiaq7uOUbNcry62yE7SzeEur1R+PFi6hTurrvYDNdMOOQ7NzDxRs
 LZXxLTiTrJ/Xo3bFU+7LiLpRMccFXpH0yyWGhIvChG4T0ZOty1r16Vf/HoGd7n6YU21c
 6+vH3FM0dS724o7rPUbThhXFBQk4uogFtveqQGJIfqJeMI8KOstHoYp14sfkibS5qlDV
 znOklztEJhi1LKy9U9N5bctD2t1t1wyPilJZo0Z9q6n27iB3/Rm041tBpembo/TLxtk9
 oiiQ==
X-Gm-Message-State: AOAM5332F3uO0PruRVMKT10HRSTOVh7hSxDYlPMACSL0lF3TrAclEx1G
 xMZYbI2xzieJd6jQWtypmcSU8Kl9PsNlpsnYr2kpmA==
X-Google-Smtp-Source: ABdhPJyTwxE3Avm4WQd4StRo0ASa8BLjKJqNM/qgkAbJ1un/Vvzx8QMjK0vBY55duG3L8NDOYcin42DGJYlL9VMvBfY=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr3259235ejy.407.1623149897868; 
 Tue, 08 Jun 2021 03:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
 <20210602180042.111347-6-shashi.mallela@linaro.org>
In-Reply-To: <20210602180042.111347-6-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Jun 2021 11:57:44 +0100
Message-ID: <CAFEAcA-W86FSM3kKORDcpuMto6jm6bNnSajY9g5F7AiLE0QYJg@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] hw/intc: GICv3 ITS Feature enablement
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Jun 2021 at 19:00, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Added properties to enable ITS feature and define qemu system
> address space memory in gicv3 common,setup distributor and
> redistributor registers to indicate LPI support.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/intc/arm_gicv3_common.c         | 12 ++++++++++++
>  hw/intc/arm_gicv3_dist.c           |  7 +++++--
>  hw/intc/arm_gicv3_its.c            |  9 ++++++++-
>  hw/intc/arm_gicv3_redist.c         | 14 +++++++++++---
>  hw/intc/gicv3_internal.h           | 17 +++++++++++++++++
>  include/hw/intc/arm_gicv3_common.h |  1 +
>  6 files changed, 54 insertions(+), 6 deletions(-)


> @@ -386,7 +388,8 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
>          bool sec_extn = !(s->gicd_ctlr & GICD_CTLR_DS);
>
>          *data = (1 << 25) | (1 << 24) | (sec_extn << 10) |
> -            (0xf << 19) | itlinesnumber;
> +            (s->lpi_enable << GICD_TYPER_LPIS_OFFSET) |
> +            (GICD_TYPER_IDBITS << GICD_TYPER_IDBITS_OFFSET) | itlinesnumber;
>          return MEMTX_OK;
>      }
>      case GICD_IIDR:

This change is doing two things at once:
(1) setting the LPI enable bit
(2) changing from (0xf << 19) to something using symbolic constants.

If you want to do (2) as a cleanup I don't object, but please put
it in its own patch as it is unrelated to this one.

> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index 82bb5b84ef..0a978cf55b 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -294,6 +294,7 @@ static MemTxResult process_mapti(GICv3ITSState *s, uint64_t value,
>      uint64_t itel = 0;
>      uint32_t iteh = 0;
>      uint32_t int_spurious = INTID_SPURIOUS;
> +    uint64_t idbits;
>
>      devid = (value >> DEVID_SHIFT) & DEVID_MASK;
>      offset += NUM_BYTES_IN_DW;
> @@ -330,7 +331,13 @@ static MemTxResult process_mapti(GICv3ITSState *s, uint64_t value,
>      max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
>
>      if (!ignore_pInt) {
> -        max_Intid = (1UL << (FIELD_EX64(s->typer, GITS_TYPER, IDBITS) + 1));
> +        idbits = MIN(FIELD_EX64(s->gicv3->cpu->gicr_propbaser, GICR_PROPBASER,
> +                                IDBITS), GICD_TYPER_IDBITS);
> +
> +        if (idbits < GICR_PROPBASER_IDBITS_THRESHOLD) {
> +            return res;
> +        }
> +        max_Intid = (1ULL << (idbits + 1));
>      }
>

This change should be folded into the patch where you add
this process_mapti() code, so it is correct from the start.

>      if ((devid > s->dt.max_devids) || (icid > s->ct.max_collids) ||
> diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
> index 8645220d61..fb9a4ee3cc 100644
> --- a/hw/intc/arm_gicv3_redist.c
> +++ b/hw/intc/arm_gicv3_redist.c
> @@ -244,14 +244,21 @@ static MemTxResult gicr_readl(GICv3CPUState *cs, hwaddr offset,
>  static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
>                                 uint64_t value, MemTxAttrs attrs)
>  {
> +

Stray new blank line.

>      switch (offset) {
>      case GICR_CTLR:
>          /* For our implementation, GICR_TYPER.DPGS is 0 and so all
>           * the DPG bits are RAZ/WI. We don't do anything asynchronously,
> -         * so UWP and RWP are RAZ/WI. And GICR_TYPER.LPIS is 0 (we don't
> -         * implement LPIs) so Enable_LPIs is RES0. So there are no writable
> -         * bits for us.
> +         * so UWP and RWP are RAZ/WI. GICR_TYPER.LPIS is 1 (we
> +         * implement LPIs) so Enable_LPIs is programmable.
>           */
> +        if (cs->gicr_typer & GICR_TYPER_PLPIS) {
> +            if (value & GICR_CTLR_ENABLE_LPIS) {
> +                cs->gicr_ctlr |= GICR_CTLR_ENABLE_LPIS;
> +            } else {
> +                cs->gicr_ctlr &= ~GICR_CTLR_ENABLE_LPIS;
> +            }
> +        }
>          return MEMTX_OK;
>      case GICR_STATUSR:
>          /* RAZ/WI for our implementation */
> @@ -395,6 +402,7 @@ static MemTxResult gicr_readll(GICv3CPUState *cs, hwaddr offset,
>  static MemTxResult gicr_writell(GICv3CPUState *cs, hwaddr offset,
>                                  uint64_t value, MemTxAttrs attrs)
>  {
> +
>      switch (offset) {
>      case GICR_PROPBASER:
>          cs->gicr_propbaser = value;

Another stray new blank line.

thanks
-- PMM

