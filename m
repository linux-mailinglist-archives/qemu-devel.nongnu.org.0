Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 779546F2681
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 23:12:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psrqc-0003Ie-OV; Sat, 29 Apr 2023 17:11:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1psrqa-0003I5-Hp; Sat, 29 Apr 2023 17:11:12 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1psrqX-0005zm-7Q; Sat, 29 Apr 2023 17:11:11 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-64115eef620so19800991b3a.1; 
 Sat, 29 Apr 2023 14:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682802666; x=1685394666;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oNIGn1E4+fN2DwpTx6WCTFSLsCwjbBwwycGBveF1JiU=;
 b=LfO/mloDXrOyTZknm+8Bw85AlZrAnMDiSGOsOqMpGN9yNm0/tMh9mKO/3sCtvJGr2I
 3mKK741E4CGV8bF1nvb2VAlFfwDIougM6bapyRY2xG4Z4BNZgG0YorUmJkwksth6r3mH
 IedHe7ienyz+0D5tYkKksJBQe5A20SLe7T3nyeT+RdMGAHVCG3YCLEvD4ouxQA4pmiY3
 TlEWpHzcxRksPJmkoWhynANp42OJ/xAD2rndYlU1ly2tafgrheN3pbm/ziiofUwpyYDl
 h97+fkCv3FbL2z1SKmpjksSq/4NOj1BI7Z1p1urQfuyyOj5VMuHzbKylh+K1rgGWQKwS
 WkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682802666; x=1685394666;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oNIGn1E4+fN2DwpTx6WCTFSLsCwjbBwwycGBveF1JiU=;
 b=hCBQTVlZyyUPSiNVXhpW1+LzT+rD6Or/VVJsITD1plu0g1rmgd2GTAq4biNX2i/urn
 EbcmQi40M/VgTKCFav0VIpa2xZc3OaiWSK8o2ia0iqXhlXZ9xr8oc275xJgcfz1UzyyI
 TpUBVQS+6zDTM86EfDY6M6c10Qz/dfj+vbOUVgY87V6M8eS4uRnTnTmpWtZviHljTEZe
 HTE18xWN350uCS9ygMJRD4yR0EJn89D3gEXnyO9z11Q/GG87pI40yXfFHaAKyp12igN4
 Uz65ZGcxal49JilCvqqxemsZ7Xc2qW5EGdnSF4IvIg2BGxiGRXjwBr7+oEGV9rl/Fi7G
 Ch5A==
X-Gm-Message-State: AC+VfDym8w8Hgf31txXCTy1/yRd+7FS/V4Jh6znsjPpcX/trS0UhNwJG
 zd8Yma35BX7bMshm1GD3H00=
X-Google-Smtp-Source: ACHHUZ7SMMcJzRN+aGy0xgNLHMV4ESZ8lOA4yzbofbYFic2Xv2f8pQ3gBOaip55CtTqNo92/YlIOeQ==
X-Received: by 2002:a05:6a00:1d23:b0:63b:8cdc:b38f with SMTP id
 a35-20020a056a001d2300b0063b8cdcb38fmr14566060pfx.5.1682802666492; 
 Sat, 29 Apr 2023 14:11:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a62b80a000000b00636c4bd7c8bsm17205990pfe.43.2023.04.29.14.11.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Apr 2023 14:11:05 -0700 (PDT)
Date: Sat, 29 Apr 2023 14:11:04 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org
Subject: Re: [PATCH v6 2/3] hw/sd/sdhci: Support big endian SD host
 controller interfaces
Message-ID: <378d019b-e05a-4e7f-b97f-2edbc191889f@roeck-us.net>
References: <20221101222934.52444-1-philmd@linaro.org>
 <20221101222934.52444-3-philmd@linaro.org>
 <a85ae94f-69d5-4098-8a48-51a55a9616f4@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a85ae94f-69d5-4098-8a48-51a55a9616f4@roeck-us.net>
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=groeck7@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Sat, Apr 29, 2023 at 01:46:26PM -0700, Guenter Roeck wrote:
> Hi,
> 
> On Tue, Nov 01, 2022 at 11:29:33PM +0100, Philippe Mathieu-Daudé wrote:
> > Some SDHCI IP can be synthetized in various endianness:
> > https://github.com/u-boot/u-boot/blob/v2021.04/doc/README.fsl-esdhc
> > 
> >  - CONFIG_SYS_FSL_ESDHC_BE
> > 
> >    ESDHC IP is in big-endian mode. Accessing ESDHC registers can be
> >    determined by ESDHC IP's endian mode or processor's endian mode.
> > 
> > Our current implementation is little-endian. In order to support
> > big endianness:
> > 
> > - Rename current MemoryRegionOps as sdhci_mmio_le_ops ('le')
> > - Add an 'endianness' property to SDHCIState (default little endian)
> > - Set the 'io_ops' field in realize() after checking the property
> > - Add the sdhci_mmio_be_ops (big-endian) MemoryRegionOps.
> > 
> > Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> With this patch in place (in qemu v8.0), I can no longer boot linux
> from SD card with sabrelite, mcimx6ul-evk, and mcimx7d-sabre emulations.
> I get the following persistent errors.
> 
> [   12.210101] sdhci-esdhc-imx 2194000.mmc: esdhc_wait_for_card_clock_gate_off: card clock still not gate off in 100us!.
> [   12.213222] sdhci-esdhc-imx 2194000.mmc: esdhc_wait_for_card_clock_gate_off: card clock still not gate off in 100us!.
> [   12.215072] sdhci-esdhc-imx 2194000.mmc: esdhc_wait_for_card_clock_gate_off: card clock still not gate off in 100us!.
> [   12.218766] sdhci-esdhc-imx 2190000.mmc: esdhc_wait_for_card_clock_gate_off: card clock still not gate off in 100us!.
> [   12.220441] sdhci-esdhc-imx 2190000.mmc: esdhc_wait_for_card_clock_gate_off: card clock still not gate off in 100us!.
> [   12.221542] sdhci-esdhc-imx 2190000.mmc: esdhc_wait_for_card_clock_gate_off: card clock still not gate off in 100us!.
> [   12.241544] sdhci-esdhc-imx 2190000.mmc: esdhc_wait_for_card_clock_gate_off: card clock still not gate off in 100us!.
> [   12.242608] sdhci-esdhc-imx 2190000.mmc: card clock still not stable in 100us!.
> 
> The emulations start to work again after reverting this patch.
> 
Cause explained below.

> Guenter
> 
> > ---
> >  hw/sd/sdhci-internal.h |  1 +
> >  hw/sd/sdhci.c          | 32 +++++++++++++++++++++++++++++---
> >  include/hw/sd/sdhci.h  |  1 +
> >  3 files changed, 31 insertions(+), 3 deletions(-)
> > 
> > diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
> > index 964570f8e8..5f3765f12d 100644
> > --- a/hw/sd/sdhci-internal.h
> > +++ b/hw/sd/sdhci-internal.h
> > @@ -308,6 +308,7 @@ extern const VMStateDescription sdhci_vmstate;
> >  #define SDHC_CAPAB_REG_DEFAULT 0x057834b4
> >  
> >  #define DEFINE_SDHCI_COMMON_PROPERTIES(_state) \
> > +    DEFINE_PROP_UINT8("endianness", _state, endianness, DEVICE_LITTLE_ENDIAN), \
> >      DEFINE_PROP_UINT8("sd-spec-version", _state, sd_spec_version, 2), \
> >      DEFINE_PROP_UINT8("uhs", _state, uhs_mode, UHS_NOT_SUPPORTED), \
> >      DEFINE_PROP_UINT8("vendor", _state, vendor, SDHCI_VENDOR_NONE), \
> > diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> > index 22c758ad91..289baa879e 100644
> > --- a/hw/sd/sdhci.c
> > +++ b/hw/sd/sdhci.c
> > @@ -1329,7 +1329,7 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
> >                         value >> shift, value >> shift);
> >  }
> >  
> > -static const MemoryRegionOps sdhci_mmio_ops = {
> > +static const MemoryRegionOps sdhci_mmio_le_ops = {
> >      .read = sdhci_read,
> >      .write = sdhci_write,
> >      .impl = {
> > @@ -1344,6 +1344,21 @@ static const MemoryRegionOps sdhci_mmio_ops = {
> >      .endianness = DEVICE_LITTLE_ENDIAN,
> >  };
> >  
> > +static const MemoryRegionOps sdhci_mmio_be_ops = {
> > +    .read = sdhci_read,
> > +    .write = sdhci_write,
> > +    .impl = {
> > +        .min_access_size = 4,
> > +        .max_access_size = 4,
> > +    },
> > +    .valid = {
> > +        .min_access_size = 1,
> > +        .max_access_size = 4,
> > +        .unaligned = false
> > +    },
> > +    .endianness = DEVICE_BIG_ENDIAN,
> > +};
> > +
> >  static void sdhci_init_readonly_registers(SDHCIState *s, Error **errp)
> >  {
> >      ERRP_GUARD();
> > @@ -1371,8 +1386,6 @@ void sdhci_initfn(SDHCIState *s)
> >  
> >      s->insert_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_raise_insertion_irq, s);
> >      s->transfer_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_data_transfer, s);
> > -
> > -    s->io_ops = &sdhci_mmio_ops;

The reason for initializing io_ops here is that the same driver also
supports imx_usdhc. That function also sets io_ops to usdhc specific
io ops. This is now overwritten by ...

> >  }
> >  
> >  void sdhci_uninitfn(SDHCIState *s)
> > @@ -1388,10 +1401,23 @@ void sdhci_common_realize(SDHCIState *s, Error **errp)
> >  {
> >      ERRP_GUARD();
> >  
> > +    switch (s->endianness) {
> > +    case DEVICE_LITTLE_ENDIAN:
> > +        s->io_ops = &sdhci_mmio_le_ops;
> > +        break;
> > +    case DEVICE_BIG_ENDIAN:
> > +        s->io_ops = &sdhci_mmio_be_ops;
> > +        break;
> > +    default:
> > +        error_setg(errp, "Incorrect endianness");
> > +        return;
> > +    }
> > +

... this code which runs later and never sets usdhc_mmio_ops.
Consequently io_ops now points to the wrong ops functions for imx.

Guenter

