Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D7A6D0034
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 11:53:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phowM-0006Lg-PS; Thu, 30 Mar 2023 05:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phowL-0006LY-3n
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 05:51:29 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phowJ-00053X-Hl
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 05:51:28 -0400
Received: by mail-ed1-x52f.google.com with SMTP id eh3so74075638edb.11
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 02:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680169885;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lZfkPH7jXcjLbCI7wOhoJA7xNE91KTsX/WK31WDX6z8=;
 b=Yfn+aWGhUYf5h/TDy74UWDEPdTNcKR7poiEEYmQ4qgqWAi/ty9THVkW8xDbILFAy/f
 2ePoBeOaS3v5plCvJ5zDPoP+bxphafIGFKhv9wdJVSEjD4IFkfIcHUgfbF/kKfeH5fQi
 oF3Sa7V2lVwNhWDGchuFenqhJJAfKSy4sqNYCWMhxhVB6JuTtIU6c9CWketauKWHcXKq
 AO8+sNawF/nh0R8hFMuubFgAOdLbJ95HBWf3dS4mURB6tXgamrpmK7tynOskFYN3nDCe
 t9ermuopppe0rsIC9J2Fu4Rv+p0ekbDchw/d44Ur+9hDB+LM+TBSATmjBru7MvJgSNy4
 eifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680169885;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lZfkPH7jXcjLbCI7wOhoJA7xNE91KTsX/WK31WDX6z8=;
 b=iqNtBb41xWdlN40Qj+H4Jq3jH7TNh6BT96a1p8ilY6pfX/7ZYshVWfXNnGuN+1Qtg6
 zImho9GzndhJ1UNBoYZpKAfhen2Zmffog+Eu+zhQyJPB4ukPIBj2pNVWviBPgZXhw8tj
 pGd2bJvK0O1VOXSoxvr1Bh7dGe6V1cXCNhFeX9au3RSXUKg/Pwk2x5a5cg+0e3HfDe+i
 zfUPldqm9CkEOziWuUhuhSvwuFu1yTfhURcL9gBJO+1OLwijpuTUqIfTPjJr404e4C81
 fYSEGW3obfhGqM+glh+AskBzgwa1CLxrRy8seO9xYpzCr1SwaCvA3RLmpNS3LQIYYzXB
 i9RA==
X-Gm-Message-State: AAQBX9f+jiRot/FCAjyrzpGAkyJGRSQHwin9IMYVQcehGbcOHYqwbKp1
 Tm3TPTG/nDHMrXnpNQaxsvU7jaG081zr9Z6SCP/fZg==
X-Google-Smtp-Source: AKy350as8EC2bLGuM6OeuzyhSByCrTuGj00NXM3iSRQiBFhdZ3XtAUS5K17O45GsL2nFP5W9/pk4p3B2sW7tTsszxqA=
X-Received: by 2002:a17:906:cf89:b0:932:4577:6705 with SMTP id
 um9-20020a170906cf8900b0093245776705mr12072793ejb.6.1680169885050; Thu, 30
 Mar 2023 02:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230323182811.2641044-1-crauer@google.com>
In-Reply-To: <20230323182811.2641044-1-crauer@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Mar 2023 10:51:14 +0100
Message-ID: <CAFEAcA-znULw-5Y=Eaz6Ecsiu1YfcFv_M6aBmSO=a2=FM=AvKg@mail.gmail.com>
Subject: Re: [PATCH] hw/ssi: Fix Linux driver init issue with xilinx_spi
To: Chris Rauer <crauer@google.com>
Cc: alistair@alistair23.me, qemu-devel@nongnu.org, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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

Ping to the Xilinx folks, do you want to review this?

thanks
-- PMM

On Thu, 23 Mar 2023 at 18:28, Chris Rauer <crauer@google.com> wrote:
>
> The problem is that the Linux driver expects the master transaction inhibit
> bit(R_SPICR_MTI) to be set during driver initialization so that it can
> detect the fifo size but QEMU defaults it to zero out of reset.  The
> datasheet indicates this bit is active on reset.
>
> See page 25, SPI Control Register section:
> https://www.xilinx.com/content/dam/xilinx/support/documents/ip_documentation/axi_quad_spi/v3_2/pg153-axi-quad-spi.pdf
>
> Signed-off-by: Chris Rauer <crauer@google.com>
> ---
>  hw/ssi/xilinx_spi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/ssi/xilinx_spi.c b/hw/ssi/xilinx_spi.c
> index 552927622f..d4de2e7aab 100644
> --- a/hw/ssi/xilinx_spi.c
> +++ b/hw/ssi/xilinx_spi.c
> @@ -156,6 +156,7 @@ static void xlx_spi_do_reset(XilinxSPI *s)
>      txfifo_reset(s);
>
>      s->regs[R_SPISSR] = ~0;
> +    s->regs[R_SPICR] = R_SPICR_MTI;
>      xlx_spi_update_irq(s);
>      xlx_spi_update_cs(s);
>  }
> --
> 2.40.0.348.gf938b09366-goog
>

