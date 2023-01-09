Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2207566281E
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:09:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEscF-0006ze-4Z; Mon, 09 Jan 2023 08:55:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pEscC-0006zN-Sc
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 08:55:04 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pEscA-0001jV-IT
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 08:55:04 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0A8B8745712;
 Mon,  9 Jan 2023 14:52:40 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C6D8D745706; Mon,  9 Jan 2023 14:52:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C53107456E3;
 Mon,  9 Jan 2023 14:52:39 +0100 (CET)
Date: Mon, 9 Jan 2023 14:52:39 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 19/21] hw/ppc: Open-code pflash_cfi01_register()
In-Reply-To: <20230109120833.3330-20-philmd@linaro.org>
Message-ID: <e4ea9f6d-1ac6-27f5-0aaf-faf37643d95f@eik.bme.hu>
References: <20230109120833.3330-1-philmd@linaro.org>
 <20230109120833.3330-20-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1384785753-1673272359=:7264"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1384785753-1673272359=:7264
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 9 Jan 2023, Philippe Mathieu-Daudé wrote:
> pflash_cfi01_register() hides an implicit sysbus mapping of
> MMIO region #0. This is not practical in a heterogeneous world
> where multiple cores use different address spaces. In order to
> remove pflash_cfi01_register() from the pflash API, open-code it
> as a qdev creation call followed by an explicit sysbus mapping.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> hw/ppc/sam460ex.c     | 19 ++++++++++++++-----
> hw/ppc/virtex_ml507.c | 15 ++++++++++++---
> 2 files changed, 26 insertions(+), 8 deletions(-)
>
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index cf7213f7c9..d2bf11d774 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -99,14 +99,23 @@ static int sam460ex_load_uboot(void)
>      *
>      * TODO Figure out what we really need here, and clean this up.
>      */
> -
> +    DeviceState *dev;
>     DriveInfo *dinfo;
>
>     dinfo = drive_get(IF_PFLASH, 0, 0);
> -    pflash_cfi01_register(FLASH_BASE | ((hwaddr)FLASH_BASE_H << 32),
> -                          "sam460ex.flash", FLASH_SIZE,
> -                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
> -                          64 * KiB, 1, 0x89, 0x18, 0x0000, 0x0, 1));
> +    dev = qdev_new(TYPE_PFLASH_CFI01);
> +    qdev_prop_set_string(dev, "name", "sam460ex.flash");
> +    qdev_prop_set_drive(dev, "drive",
> +                        dinfo ? blk_by_legacy_dinfo(dinfo) : NULL);
> +    qdev_prop_set_uint32(dev, "num-blocks", FLASH_SIZE / (64 * KiB));
> +    qdev_prop_set_uint64(dev, "sector-length", 64 * KiB);
> +    qdev_prop_set_uint8(dev, "width", 1);
> +    qdev_prop_set_bit(dev, "big-endian", true);
> +    qdev_prop_set_uint16(dev, "id0", 0x0089);
> +    qdev_prop_set_uint16(dev, "id1", 0x0018);

Can you drop unneeded zeros? Otherwise

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

Regards,
BALATON Zoltan

> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0,
> +                    FLASH_BASE | ((hwaddr)FLASH_BASE_H << 32));
>
>     if (!dinfo) {
>         /*error_report("No flash image given with the 'pflash' parameter,"
> diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
> index f2f81bd425..2532806922 100644
> --- a/hw/ppc/virtex_ml507.c
> +++ b/hw/ppc/virtex_ml507.c
> @@ -233,9 +233,18 @@ static void virtex_init(MachineState *machine)
>     memory_region_add_subregion(address_space_mem, ram_base, machine->ram);
>
>     dinfo = drive_get(IF_PFLASH, 0, 0);
> -    pflash_cfi01_register(PFLASH_BASEADDR, "virtex.flash", FLASH_SIZE,
> -                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
> -                          64 * KiB, 1, 0x89, 0x18, 0x0000, 0x0, 1);
> +    dev = qdev_new(TYPE_PFLASH_CFI01);
> +    qdev_prop_set_string(dev, "name", "virtex.flash");
> +    qdev_prop_set_drive(dev, "drive",
> +                        dinfo ? blk_by_legacy_dinfo(dinfo) : NULL);
> +    qdev_prop_set_uint32(dev, "num-blocks", FLASH_SIZE / (64 * KiB));
> +    qdev_prop_set_uint64(dev, "sector-length", 64 * KiB);
> +    qdev_prop_set_uint8(dev, "width", 1);
> +    qdev_prop_set_bit(dev, "big-endian", true);
> +    qdev_prop_set_uint16(dev, "id0", 0x0089);
> +    qdev_prop_set_uint16(dev, "id1", 0x0018);
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, PFLASH_BASEADDR);
>
>     cpu_irq = qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT);
>     dev = qdev_new("xlnx.xps-intc");
>
--3866299591-1384785753-1673272359=:7264--

