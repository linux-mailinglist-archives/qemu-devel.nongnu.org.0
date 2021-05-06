Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60610374D36
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 04:00:05 +0200 (CEST)
Received: from localhost ([::1]:43352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leTJ6-0005pZ-Ag
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 22:00:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1leTHy-0005Hi-Q9; Wed, 05 May 2021 21:58:54 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:41791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1leTHw-0001it-W8; Wed, 05 May 2021 21:58:54 -0400
Received: by mail-yb1-xb36.google.com with SMTP id l7so5315575ybf.8;
 Wed, 05 May 2021 18:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=55PulxY+2aI7FSmUytdxrXIbJ7zdhQbJKacth6BW6MQ=;
 b=YmlDCjNeYowmqAaWSWt1rSpTyv+nDsZk1UMw6sEQB/Qa1Ld+5EXKjrVs3g11vldlIK
 wG64IZQhPFSrv1E9zMgzM02xj0/pj5yHA46IWyzuE8PLP5b+IT/i8j5i16CZ3NoXnI3S
 TUW8eNAq8lbOpdSnx95nkLv+/h2RmAgpZdfo6v8KDUnWUt0i3Q1YINgEqbv2bGfyxQzO
 poV3vH9PsxfKsU0YR9P3/Q9M0CyE2RENuBjjj/tD3qPNQ4P481DzdnF+HByWGz3fj3GB
 u3AK/dc01gLtBdj2eaYGG0n7ImhWCo9zU/4uwBWNTBJ2p+AXA+YrwDtPv9Ly/Itw6182
 RpNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=55PulxY+2aI7FSmUytdxrXIbJ7zdhQbJKacth6BW6MQ=;
 b=ETRmh6GvKgGKA5F8kMqIew+s7zNpRx0EnAmN/oKC5WPokHLlyP9pAT05z/EBF5BA/3
 kMDZzVvzLS4tN9N7k83nb+WS+wLs4R2QM2tgtrqvpIATXehUX5VborgFBynUCPn5mA3U
 D2QVpjHqzn9xXHD30Pxnlel2O5anlL5QOmrpPZvYtGxjTWsC3MyvSLdvqqEI07SkFH96
 eulGdp6Z/FQLt6b8WTWs+yBX4+NPnAG2OjZGzJ9sKb68N/WF1MvA0jkSf4C6+zeAGL6Y
 A89xKqeod5oiB8LRlRa3ry5HNNni7JOkN7hHpLOOvOEE6vu0FupAxvNvewlhMBeRPC2X
 8bCA==
X-Gm-Message-State: AOAM531GPzYoMSrUz0ujGqcYrTmLPa913xn6tLLuJKoyiNQCyndaQGos
 Wl/jrVubn+3N9bcVzKLvKphAoOIx1rznNlvrDkE=
X-Google-Smtp-Source: ABdhPJwVJAzeIPxfVhdvdwgegC93VJQ4n3e12PkuItf48v3IeGlM40tQa4QNHRA1w8gFjTmuYxVmjmdZRK+UiiYRA54=
X-Received: by 2002:a25:d990:: with SMTP id q138mr2585649ybg.387.1620266331043; 
 Wed, 05 May 2021 18:58:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210504124140.1100346-1-linux@roeck-us.net>
In-Reply-To: <20210504124140.1100346-1-linux@roeck-us.net>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 6 May 2021 09:58:39 +0800
Message-ID: <CAEUhbmVPqHyfZXSR0TS0_E1x-BbfHN869fjZWjWxQx4ASLVGnA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/xlnx: Fix PHY address for xilinx-zynq-a9
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Guenter,

On Tue, May 4, 2021 at 8:41 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Commit dfc388797cc4 ("hw/arm: xlnx: Set all boards' GEM 'phy-addr'
> property value to 23") configured the PHY address for xilinx-zynq-a9
> to 23. When trying to boot xilinx-zynq-a9 with zynq-zc702.dtb or
> zynq-zc706.dtb, this results in the following error message when
> trying to use the Ethernet interface.
>
> macb e000b000.ethernet eth0: Could not attach PHY (-19)
>
> The devicetree files for ZC702 and ZC706 configure PHY address 7. The
> documentation for the ZC702 and ZC706 evaluation boards suggest that the
> PHY address is 7, not 23. Other boards use PHY address 0, 1, 3, or 7.
> I was unable to find a documentation or a devicetree file suggesting
> or using PHY address 23.

I can't find one neither :(

> The Ethernet interface starts working with
> zynq-zc702.dtb and zynq-zc706.dtb when setting the PHY address to 7,
> so let's use it.
>
> Cc: Bin Meng <bin.meng@windriver.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  hw/arm/xilinx_zynq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 8db6cfd47f..5ac0294f9e 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -119,7 +119,7 @@ static void gem_init(NICInfo *nd, uint32_t base, qemu_irq irq)
>          qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
>          qdev_set_nic_properties(dev, nd);
>      }
> -    object_property_set_int(OBJECT(dev), "phy-addr", 23, &error_abort);
> +    object_property_set_int(OBJECT(dev), "phy-addr", 7, &error_abort);
>      s = SYS_BUS_DEVICE(dev);
>      sysbus_realize_and_unref(s, &error_fatal);
>      sysbus_mmio_map(s, 0, base);
> --

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

While we are here, could you please create a doc for the target you
are testing with Linux/U-Boot/etc?

I was having a hard time booting upstream U-Boot/Linux on QEMU zynqmp before.

Regards,
Bin

