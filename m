Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D8E55B116
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 12:19:45 +0200 (CEST)
Received: from localhost ([::1]:45968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5PMm-0007hX-9I
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 06:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5PK7-0006Kz-Bp
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 06:16:59 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:41773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5PK5-00010P-HQ
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 06:16:59 -0400
Received: by mail-yb1-xb36.google.com with SMTP id v185so2469632ybe.8
 for <qemu-devel@nongnu.org>; Sun, 26 Jun 2022 03:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/ACeV8SkCDjNXFtvA3lLRQ01BvMG3tA9CRLg7EeLG4w=;
 b=j51W2z3Xxe6hFqndVU5Ti25BBIxJSEmmtMxb5Dn5Y4PPGdoRUfBbTuFB+BJc99d7yt
 9ZkrWZFKo/+BHld5bIkggu0r/xod4YyB9jmt46UqKPOo8oLXElWrUMKTTozocj4VGngB
 ThKQ0CbSTsX8BXm03r58wTDPO77hQI3JxJQyb7DSonTZbtNA8H8ekN/FsQyHUL1a2e9G
 X+PPt8PcxVZb/iyAAo8rJ/MXAOf+A+f8UbOdKETWci9yB8se9rpmtPBXD5EwSe5z7xe9
 RUUozsczUEBeCtDYHHKkYxVzYRtOFj27lhrLDm7dpPL689PFWij5yiPavSi4YZShC6R3
 PtNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/ACeV8SkCDjNXFtvA3lLRQ01BvMG3tA9CRLg7EeLG4w=;
 b=0Qm160Zwr0cZkG0cqKhq0JZFSX4r+DElYtvBe+CiuektnJOaXctUgqlnAl/Vksloqc
 QykxbA4STRh2m1HgwztoJrlzxRKDw81UhSi4JOYSKXoudiB8qN2MNlQ2+FsAPXgS43Vu
 PqireSQdfzSSEM+uwJeOuK06tjvytBVyuDBHluSfKFADzz0JwCMRPaNAnLcABeA3TcIb
 8LUkJlbIetcPgeUW7FaaS1mp5nDXE/ijLcdgC+Bp3jil8jvmTdOa6lLtVdZ4SJzl0tS0
 /XtrUKtegiMc5t4nUmDAIrc7qk2HiTgJCPkZQLY1UpUcoOdmnFC/TjulJpbZL3KXirUk
 A4ng==
X-Gm-Message-State: AJIora8YU+YQnan1n5YIXm8X4X6MnZdts+9fo7EOLZXNfFH4mBg/a4RQ
 rAgJD0sNurDfneKI9IyHzJOoXua4gPaPIUpzUf37ElUwRRU=
X-Google-Smtp-Source: AGRyM1v72yVgnYdXT2iZSAtugU1T01z+4kmDzt+AKpvE324jywIxKLRSXPw+f71UKuEzYYCH1LodJIzntGHwBoep8vo=
X-Received: by 2002:a05:6902:1505:b0:668:c93b:d1d0 with SMTP id
 q5-20020a056902150500b00668c93bd1d0mr8028118ybu.140.1656238616048; Sun, 26
 Jun 2022 03:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220624195206.671993-1-andrey.makarov@auriga.com>
In-Reply-To: <20220624195206.671993-1-andrey.makarov@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 26 Jun 2022 11:16:18 +0100
Message-ID: <CAFEAcA_xQd45CGsmU-_C4LcTP6M+5PfkgKOJuk2SSBVDbm7pyg@mail.gmail.com>
Subject: Re: [PATCH] Align Raspberry Pi DMA interrupts with Linux DTS
To: Andrey Makarov <ph.makarov@gmail.com>
Cc: qemu-devel@nongnu.org, Andrey Makarov <andrey.makarov@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 24 Jun 2022 at 21:54, Andrey Makarov <ph.makarov@gmail.com> wrote:
>
> All Raspberry Pi models 1-3 (based on bcm2835) have
> Linux device tree (arch/arm/boot/dts/bcm2835-common.dtsi +25):
>
>     /* dma channel 11-14 share one irq */
>
> which mismatched the Qemu model.
> In this patch channels 0--10 and 11--14 are handled separately.

Is there any hardware documentation that says whether QEMU or
the DTB is correct? The device tree is at best a secondary source...

> Signed-off-by: Andrey Makarov <andrey.makarov@auriga.com>
> ---
>  hw/arm/bcm2835_peripherals.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
> index 48538c9360..3d808b0e31 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -322,13 +322,21 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
>      memory_region_add_subregion(&s->peri_mr, DMA15_OFFSET,
>                  sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->dma), 1));
>
> -    for (n = 0; n <= 12; n++) {
> +    for (n = 0; n <= 10; n++) {
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->dma), n,
>                             qdev_get_gpio_in_named(DEVICE(&s->ic),
>                                                    BCM2835_IC_GPU_IRQ,
>                                                    INTERRUPT_DMA0 + n));
>      }
>
> +    /* According to DTS, dma channels 11-14 share one irq */
> +    for (n = 11; n <= 14; n++) {
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->dma), n,
> +                           qdev_get_gpio_in_named(DEVICE(&s->ic),
> +                                                  BCM2835_IC_GPU_IRQ,
> +                                                  INTERRUPT_DMA0 + 11));

You can't connect multiple qemu_irq lines to one like this.
If the hardware behaves this way then you need to create
an OR gate, wire all the lines from the devices to the
OR gate inputs, and wire the OR gate output to the destination.

thanks
-- PMM

