Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA73134FD5
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jan 2020 00:15:19 +0100 (CET)
Received: from localhost ([::1]:50374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipKXh-0008Ce-A2
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 18:15:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36312)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ipKWC-0006ZX-Jh
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 18:13:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ipKW8-0000eA-Vb
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 18:13:39 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:33771
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ipKW8-0000by-KW
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 18:13:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578525215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zb9EpEUaEHaEMuc+ltdJ+aur1vTtFUsc3g+Taigajj4=;
 b=VuFYZ3MxPmQuQJdncLnwpCsMFpd5W8Nrfh0ZaMQkaCz7eEoRaH577AHRjzkUxN1oKNrujf
 PPvM+/V91t8R8hS/y0tWGaMv3JjbUJMclIuNW/sxtX4ysd2jRANbnIsJBJAGQGXo3+GXBt
 0CCNvKE3cmmSHP7MyKB8yjTBd5XvVzs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-DnDJ2flXM9KTxQtprKrvJQ-1; Wed, 08 Jan 2020 18:13:30 -0500
Received: by mail-wm1-f70.google.com with SMTP id m133so58475wmf.2
 for <qemu-devel@nongnu.org>; Wed, 08 Jan 2020 15:13:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zb9EpEUaEHaEMuc+ltdJ+aur1vTtFUsc3g+Taigajj4=;
 b=UqPxBvguAcpbukJBD58v4f9gpEYV11zoO6APv00spkcGRocGneDnwUarGeTmhaJoG6
 DQ9FVQ46wdueRi8Xaj+4qQwR+C3L4bompUFEih1mXPEyeVeSD5Dyba8HHy1ZNOwkTPFy
 M27CjIYExQWGqCcGVRrey6Kg/IXaGJaeeYdaBUSU8i3y4BubwXoLCpVl4bdxoKOnpKYT
 kFc39VTYrmJ/cg5xvK7dxam7HXWzSlKz6WSvJ+bnwSheukoiT6IvypoU3b8cw0OxoOfZ
 8hHgBF8EQ4d3POf9wQmfhCaSwhB8v80sfH0Yw8pc2WA7d+Vtv/7GgFUUp4CHdl1A01gu
 sCLQ==
X-Gm-Message-State: APjAAAXk5lmSK6Py/APMrtAMLZ+mxKyZOfT0LHWN70JJN2CYeSwLeGon
 jhng4Baih0epbvYjIAuiNitQrb6kOUiHI8ZjIjawp8To+NPffWK60RbF4nEVBE5rJ4jmc1uS+VN
 VymgzCglEg1RK0pQ=
X-Received: by 2002:a1c:4d18:: with SMTP id o24mr1018680wmh.35.1578525209340; 
 Wed, 08 Jan 2020 15:13:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqwQR82F3EbggRJcmxzbKummUzNl04b02RM669S9ANYedMr/pQxCIs2wlOlMg/ca7Oi1/8E2UQ==
X-Received: by 2002:a1c:4d18:: with SMTP id o24mr1018643wmh.35.1578525208785; 
 Wed, 08 Jan 2020 15:13:28 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id e8sm5856306wrt.7.2020.01.08.15.13.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2020 15:13:28 -0800 (PST)
Subject: Re: [PATCH v3 01/17] hw/arm: add Allwinner H3 System-on-Chip
To: Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-devel@nongnu.org
References: <20200108200020.4745-1-nieklinnenbank@gmail.com>
 <20200108200020.4745-2-nieklinnenbank@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d1a13b5c-1308-17b3-601c-429a645ae7ec@redhat.com>
Date: Thu, 9 Jan 2020 00:13:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200108200020.4745-2-nieklinnenbank@gmail.com>
Content-Language: en-US
X-MC-Unique: DnDJ2flXM9KTxQtprKrvJQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/8/20 9:00 PM, Niek Linnenbank wrote:
> The Allwinner H3 is a System on Chip containing four ARM Cortex A7
> processor cores. Features and specifications include DDR2/DDR3 memory,
> SD/MMC storage cards, 10/100/1000Mbit ethernet, USB 2.0, HDMI and

"Ethernet"

> various I/O modules. This commit adds support for the Allwinner H3
> System on Chip.
> 
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> ---
>   default-configs/arm-softmmu.mak |   1 +
>   include/hw/arm/allwinner-h3.h   | 107 +++++++++++
>   hw/arm/allwinner-h3.c           | 328 ++++++++++++++++++++++++++++++++
>   MAINTAINERS                     |   7 +
>   hw/arm/Kconfig                  |   8 +
>   hw/arm/Makefile.objs            |   1 +
>   6 files changed, 452 insertions(+)
>   create mode 100644 include/hw/arm/allwinner-h3.h
>   create mode 100644 hw/arm/allwinner-h3.c
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 1f2e0e7fde..d75a239c2c 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -40,3 +40,4 @@ CONFIG_FSL_IMX25=y
>   CONFIG_FSL_IMX7=y
>   CONFIG_FSL_IMX6UL=y
>   CONFIG_SEMIHOSTING=y
> +CONFIG_ALLWINNER_H3=y
> diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.h
> new file mode 100644
> index 0000000000..4e2e6202a9
> --- /dev/null
> +++ b/include/hw/arm/allwinner-h3.h
> @@ -0,0 +1,107 @@
> +/*
> + * Allwinner H3 System on Chip emulation
> + *
> + * Copyright (C) 2019 Niek Linnenbank <nieklinnenbank@gmail.com>
> + *
> + * This program is free software: you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation, either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +/*
> + * The Allwinner H3 is a System on Chip containing four ARM Cortex A7
> + * processor cores. Features and specifications include DDR2/DDR3 memory,
> + * SD/MMC storage cards, 10/100/1000Mbit ethernet, USB 2.0, HDMI and
> + * various I/O modules.
> + *
> + * This implementation is based on the following datasheet:
> + *
> + *   https://linux-sunxi.org/File:Allwinner_H3_Datasheet_V1.2.pdf
> + *
> + * The latest datasheet and more info can be found on the Linux Sunxi wiki:
> + *
> + *   https://linux-sunxi.org/H3
> + */
> +
> +#ifndef HW_ARM_ALLWINNER_H3_H
> +#define HW_ARM_ALLWINNER_H3_H
> +
> +#include "qemu/osdep.h"

Check CODING_STYLE.rst:

   Do not include "qemu/osdep.h" from header files since
   the .c file will have already included it.

> +#include "qom/object.h"
> +#include "qemu/error-report.h"
> +#include "qemu/units.h"
> +#include "hw/qdev-core.h"
> +#include "hw/arm/boot.h"

Please only keep the minimum required headers here, move the rest to the 
source files.

> +#include "hw/timer/allwinner-a10-pit.h"
> +#include "hw/intc/arm_gic.h"
> +#include "target/arm/cpu.h"

These looks OK in this header.

> +
> +/**
> + * Allwinner H3 device list
> + *
> + * This enumeration is can be used refer to a particular device in the
> + * Allwinner H3 SoC. For example, the physical memory base address for
> + * each device can be found in the AwH3State object in the memmap member
> + * using the device enum value as index.
> + *
> + * @see AwH3State
> + */
> +enum {
> +    AW_H3_SRAM_A1,
> +    AW_H3_SRAM_A2,
> +    AW_H3_SRAM_C,
> +    AW_H3_PIT,
> +    AW_H3_UART0,
> +    AW_H3_UART1,
> +    AW_H3_UART2,
> +    AW_H3_UART3,
> +    AW_H3_GIC_DIST,
> +    AW_H3_GIC_CPU,
> +    AW_H3_GIC_HYP,
> +    AW_H3_GIC_VCPU,
> +    AW_H3_SDRAM
> +};
> +
> +/** Total number of CPU cores in the SoC */

"the H3 SoC"

> +#define AW_H3_NUM_CPUS      (4)
> +
> +/**
> + * Allwinner H3 object model
> + * @{
> + */
> +
> +/** Object type for the Allwinner H3 SoC */
> +#define TYPE_AW_H3 "allwinner-h3"
> +
> +/** Convert input object to Allwinner H3 state object */
> +#define AW_H3(obj) OBJECT_CHECK(AwH3State, (obj), TYPE_AW_H3)
> +
> +/** @} */
> +
> +/**
> + * Allwinner H3 object instance state

I find this comment more noisy than helpful.

> + */
> +typedef struct AwH3State {
> +    /*< private >*/
> +    DeviceState parent_obj;
> +    /*< public >*/
> +
> +    ARMCPU cpus[AW_H3_NUM_CPUS];
> +    const hwaddr *memmap;
> +    AwA10PITState timer;
> +    GICState gic;
> +    MemoryRegion sram_a1;
> +    MemoryRegion sram_a2;
> +    MemoryRegion sram_c;
> +} AwH3State;
> +
> +#endif /* HW_ARM_ALLWINNER_H3_H */
> diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
> new file mode 100644
> index 0000000000..c1ef31e875
> --- /dev/null
> +++ b/hw/arm/allwinner-h3.c
> @@ -0,0 +1,328 @@
> +/*
> + * Allwinner H3 System on Chip emulation
> + *
> + * Copyright (C) 2019 Niek Linnenbank <nieklinnenbank@gmail.com>
> + *
> + * This program is free software: you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation, either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "exec/address-spaces.h"
> +#include "qapi/error.h"
> +#include "qemu/module.h"
> +#include "qemu/units.h"
> +#include "cpu.h"
> +#include "hw/sysbus.h"
> +#include "hw/char/serial.h"
> +#include "hw/misc/unimp.h"
> +#include "sysemu/sysemu.h"
> +#include "hw/arm/allwinner-h3.h"
> +
> +/* Memory map */
> +const hwaddr allwinner_h3_memmap[] = {
> +    [AW_H3_SRAM_A1]    = 0x00000000,
> +    [AW_H3_SRAM_A2]    = 0x00044000,
> +    [AW_H3_SRAM_C]     = 0x00010000,
> +    [AW_H3_PIT]        = 0x01c20c00,
> +    [AW_H3_UART0]      = 0x01c28000,
> +    [AW_H3_UART1]      = 0x01c28400,
> +    [AW_H3_UART2]      = 0x01c28800,
> +    [AW_H3_UART3]      = 0x01c28c00,
> +    [AW_H3_GIC_DIST]   = 0x01c81000,
> +    [AW_H3_GIC_CPU]    = 0x01c82000,
> +    [AW_H3_GIC_HYP]    = 0x01c84000,
> +    [AW_H3_GIC_VCPU]   = 0x01c86000,
> +    [AW_H3_SDRAM]      = 0x40000000
> +};
> +
> +/* List of unimplemented devices */
> +struct AwH3Unimplemented {
> +    const char *device_name;
> +    hwaddr base;
> +    hwaddr size;
> +} unimplemented[] = {
> +    { "d-engine",  0x01000000, 4 * MiB },
> +    { "d-inter",   0x01400000, 128 * KiB },
> +    { "syscon",    0x01c00000, 4 * KiB },
> +    { "dma",       0x01c02000, 4 * KiB },
> +    { "nfdc",      0x01c03000, 4 * KiB },
> +    { "ts",        0x01c06000, 4 * KiB },
> +    { "keymem",    0x01c0b000, 4 * KiB },
> +    { "lcd0",      0x01c0c000, 4 * KiB },
> +    { "lcd1",      0x01c0d000, 4 * KiB },
> +    { "ve",        0x01c0e000, 4 * KiB },
> +    { "mmc0",      0x01c0f000, 4 * KiB },
> +    { "mmc1",      0x01c10000, 4 * KiB },
> +    { "mmc2",      0x01c11000, 4 * KiB },
> +    { "sid",       0x01c14000, 1 * KiB },
> +    { "crypto",    0x01c15000, 4 * KiB },
> +    { "msgbox",    0x01c17000, 4 * KiB },
> +    { "spinlock",  0x01c18000, 4 * KiB },
> +    { "usb0-otg",  0x01c19000, 4 * KiB },
> +    { "usb0",      0x01c1a000, 4 * KiB },
> +    { "usb1",      0x01c1b000, 4 * KiB },
> +    { "usb2",      0x01c1c000, 4 * KiB },
> +    { "usb3",      0x01c1d000, 4 * KiB },

To avoid the churn in patch #4, directly name them usb-phy:

        { "usb0-phy",  0x01c1a000, 4 * KiB },
        { "usb1-phy",  0x01c1b000, 4 * KiB },
        { "usb2-phy",  0x01c1c000, 4 * KiB },
        { "usb3-phy",  0x01c1d000, 4 * KiB },

> +    { "smc",       0x01c1e000, 4 * KiB },
> +    { "ccu",       0x01c20000, 1 * KiB },
> +    { "pio",       0x01c20800, 1 * KiB },
> +    { "owa",       0x01c21000, 1 * KiB },
> +    { "pwm",       0x01c21400, 1 * KiB },
> +    { "keyadc",    0x01c21800, 1 * KiB },
> +    { "pcm0",      0x01c22000, 1 * KiB },
> +    { "pcm1",      0x01c22400, 1 * KiB },
> +    { "pcm2",      0x01c22800, 1 * KiB },
> +    { "audio",     0x01c22c00, 2 * KiB },
> +    { "smta",      0x01c23400, 1 * KiB },
> +    { "ths",       0x01c25000, 1 * KiB },
> +    { "uart0",     0x01c28000, 1 * KiB },
> +    { "uart1",     0x01c28400, 1 * KiB },
> +    { "uart2",     0x01c28800, 1 * KiB },
> +    { "uart3",     0x01c28c00, 1 * KiB },
> +    { "twi0",      0x01c2ac00, 1 * KiB },
> +    { "twi1",      0x01c2b000, 1 * KiB },
> +    { "twi2",      0x01c2b400, 1 * KiB },
> +    { "scr",       0x01c2c400, 1 * KiB },
> +    { "emac",      0x01c30000, 64 * KiB },
> +    { "gpu",       0x01c40000, 64 * KiB },
> +    { "hstmr",     0x01c60000, 4 * KiB },
> +    { "dramcom",   0x01c62000, 4 * KiB },
> +    { "dramctl0",  0x01c63000, 4 * KiB },
> +    { "dramphy0",  0x01c65000, 4 * KiB },
> +    { "spi0",      0x01c68000, 4 * KiB },
> +    { "spi1",      0x01c69000, 4 * KiB },
> +    { "csi",       0x01cb0000, 320 * KiB },
> +    { "tve",       0x01e00000, 64 * KiB },
> +    { "hdmi",      0x01ee0000, 128 * KiB },
> +    { "rtc",       0x01f00000, 1 * KiB },
> +    { "r_timer",   0x01f00800, 1 * KiB },
> +    { "r_intc",    0x01f00c00, 1 * KiB },
> +    { "r_wdog",    0x01f01000, 1 * KiB },
> +    { "r_prcm",    0x01f01400, 1 * KiB },
> +    { "r_twd",     0x01f01800, 1 * KiB },
> +    { "r_cpucfg",  0x01f01c00, 1 * KiB },
> +    { "r_cir-rx",  0x01f02000, 1 * KiB },
> +    { "r_twi",     0x01f02400, 1 * KiB },
> +    { "r_uart",    0x01f02800, 1 * KiB },
> +    { "r_pio",     0x01f02c00, 1 * KiB },
> +    { "r_pwm",     0x01f03800, 1 * KiB },
> +    { "core-dbg",  0x3f500000, 128 * KiB },
> +    { "tsgen-ro",  0x3f506000, 4 * KiB },
> +    { "tsgen-ctl", 0x3f507000, 4 * KiB },
> +    { "ddr-mem",   0x40000000, 2 * GiB },
> +    { "n-brom",    0xffff0000, 32 * KiB },
> +    { "s-brom",    0xffff0000, 64 * KiB }
> +};
> +
> +/* Per Processor Interrupts */
> +enum {
> +    AW_H3_GIC_PPI_MAINT     =  9,
> +    AW_H3_GIC_PPI_HYPTIMER  = 10,
> +    AW_H3_GIC_PPI_VIRTTIMER = 11,
> +    AW_H3_GIC_PPI_SECTIMER  = 13,
> +    AW_H3_GIC_PPI_PHYSTIMER = 14
> +};
> +
> +/* Shared Processor Interrupts */
> +enum {
> +    AW_H3_GIC_SPI_UART0     =  0,
> +    AW_H3_GIC_SPI_UART1     =  1,
> +    AW_H3_GIC_SPI_UART2     =  2,
> +    AW_H3_GIC_SPI_UART3     =  3,
> +    AW_H3_GIC_SPI_TIMER0    = 18,
> +    AW_H3_GIC_SPI_TIMER1    = 19,
> +};
> +
> +/* Allwinner H3 constants */

Another not very useful comment.

> +enum {
> +    AW_H3_GIC_NUM_SPI       = 128
> +};
> +
> +static void allwinner_h3_init(Object *obj)
> +{
> +    AwH3State *s = AW_H3(obj);
> +
> +    s->memmap = allwinner_h3_memmap;
> +
> +    for (int i = 0; i < AW_H3_NUM_CPUS; i++) {
> +        object_initialize_child(obj, "cpu[*]", &s->cpus[i], sizeof(s->cpus[i]),
> +                                ARM_CPU_TYPE_NAME("cortex-a7"),
> +                                &error_abort, NULL);
> +    }
> +
> +    sysbus_init_child_obj(obj, "gic", &s->gic, sizeof(s->gic),
> +                          TYPE_ARM_GIC);
> +
> +    sysbus_init_child_obj(obj, "timer", &s->timer, sizeof(s->timer),
> +                          TYPE_AW_A10_PIT);
> +    object_property_add_alias(obj, "clk0-freq", OBJECT(&s->timer),
> +                              "clk0-freq", &error_abort);
> +    object_property_add_alias(obj, "clk1-freq", OBJECT(&s->timer),
> +                              "clk1-freq", &error_abort);
> +}
> +
> +static void allwinner_h3_realize(DeviceState *dev, Error **errp)
> +{
> +    AwH3State *s = AW_H3(dev);
> +    unsigned i = 0;

No need to initialize i since you re-init it in the for().

> +
> +    /* CPUs */
> +    for (i = 0; i < AW_H3_NUM_CPUS; i++) {
> +
> +        /* Provide Power State Coordination Interface */
> +        object_property_set_int(OBJECT(&s->cpus[i]), QEMU_PSCI_CONDUIT_HVC,
> +                                "psci-conduit", &error_abort);
> +
> +        /* Disable secondary CPUs */
> +        object_property_set_bool(OBJECT(&s->cpus[i]), i > 0,
> +                                "start-powered-off", &error_abort);
> +
> +        /* All exception levels required */
> +        object_property_set_bool(OBJECT(&s->cpus[i]),
> +                                 true, "has_el3", &error_abort);
> +
> +        object_property_set_bool(OBJECT(&s->cpus[i]),
> +                                 true, "has_el2", &error_abort);

You previously used the object API, ...

> +
> +        /* Mark realized */
> +        qdev_init_nofail(DEVICE(&s->cpus[i]));

... and here switch to the qdev API. Odd.

> +    }
> +
> +    /* Generic Interrupt Controller */
> +    qdev_prop_set_uint32(DEVICE(&s->gic), "num-irq", AW_H3_GIC_NUM_SPI +
> +                                                     GIC_INTERNAL);
> +    qdev_prop_set_uint32(DEVICE(&s->gic), "revision", 2);
> +    qdev_prop_set_uint32(DEVICE(&s->gic), "num-cpu", AW_H3_NUM_CPUS);
> +    qdev_prop_set_bit(DEVICE(&s->gic), "has-security-extensions", false);
> +    qdev_prop_set_bit(DEVICE(&s->gic), "has-virtualization-extensions", true);
> +    qdev_init_nofail(DEVICE(&s->gic));
> +
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gic), 0, s->memmap[AW_H3_GIC_DIST]);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gic), 1, s->memmap[AW_H3_GIC_CPU]);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gic), 2, s->memmap[AW_H3_GIC_HYP]);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gic), 3, s->memmap[AW_H3_GIC_VCPU]);
> +
> +    /*
> +     * Wire the outputs from each CPU's generic timer and the GICv3
> +     * maintenance interrupt signal to the appropriate GIC PPI inputs,
> +     * and the GIC's IRQ/FIQ/VIRQ/VFIQ interrupt outputs to the CPU's inputs.
> +     */
> +    for (i = 0; i < AW_H3_NUM_CPUS; i++) {
> +        DeviceState *cpudev = DEVICE(qemu_get_cpu(i));

Why not use DEVICE(&s->cpus[i])?

> +        int ppibase = AW_H3_GIC_NUM_SPI + i * GIC_INTERNAL + GIC_NR_SGIS;
> +        int irq;
> +        /*
> +         * Mapping from the output timer irq lines from the CPU to the
> +         * GIC PPI inputs used for this board.
> +         */
> +        const int timer_irq[] = {
> +            [GTIMER_PHYS] = AW_H3_GIC_PPI_PHYSTIMER,
> +            [GTIMER_VIRT] = AW_H3_GIC_PPI_VIRTTIMER,
> +            [GTIMER_HYP]  = AW_H3_GIC_PPI_HYPTIMER,
> +            [GTIMER_SEC]  = AW_H3_GIC_PPI_SECTIMER,
> +        };
> +
> +        /* Connect CPU timer outputs to GIC PPI inputs */
> +        for (irq = 0; irq < ARRAY_SIZE(timer_irq); irq++) {
> +            qdev_connect_gpio_out(cpudev, irq,
> +                                  qdev_get_gpio_in(DEVICE(&s->gic),
> +                                                   ppibase + timer_irq[irq]));
> +        }
> +
> +        /* Connect GIC outputs to CPU interrupt inputs */
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i,
> +                           qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i + AW_H3_NUM_CPUS,
> +                           qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i + (2 * AW_H3_NUM_CPUS),
> +                           qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i + (3 * AW_H3_NUM_CPUS),
> +                           qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
> +
> +        /* GIC maintenance signal */
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i + (4 * AW_H3_NUM_CPUS),
> +                           qdev_get_gpio_in(DEVICE(&s->gic),
> +                                            ppibase + AW_H3_GIC_PPI_MAINT));
> +    }
> +
> +    /* Timer */
> +    qdev_init_nofail(DEVICE(&s->timer));
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->timer), 0, s->memmap[AW_H3_PIT]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer), 0,
> +                       qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_TIMER0));
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer), 1,
> +                       qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_TIMER1));
> +
> +    /* SRAM */
> +    memory_region_init_ram(&s->sram_a1, OBJECT(dev), "sram A1",
> +                            64 * KiB, &error_abort);
> +    memory_region_init_ram(&s->sram_a2, OBJECT(dev), "sram A2",
> +                            32 * KiB, &error_abort);
> +    memory_region_init_ram(&s->sram_c, OBJECT(dev), "sram C",
> +                            44 * KiB, &error_abort);

This looks like an ECC SRAM layout, but no info about this in the 
datasheet...

> +    memory_region_add_subregion(get_system_memory(), s->memmap[AW_H3_SRAM_A1],
> +                                &s->sram_a1);
> +    memory_region_add_subregion(get_system_memory(), s->memmap[AW_H3_SRAM_A2],
> +                                &s->sram_a2);
> +    memory_region_add_subregion(get_system_memory(), s->memmap[AW_H3_SRAM_C],
> +                                &s->sram_c);
> +
> +    /* UART0 */
> +    serial_mm_init(get_system_memory(), s->memmap[AW_H3_UART0], 2,
> +                   qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_UART0),
> +                   115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);

This is APB2_CLK / 16. Can you add a comment, so it will be easier to 
adapt to the future clocktree API?

> +    /* UART1 */
> +    serial_mm_init(get_system_memory(), s->memmap[AW_H3_UART1], 2,
> +                   qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_UART1),
> +                   115200, serial_hd(1), DEVICE_NATIVE_ENDIAN);
> +    /* UART2 */
> +    serial_mm_init(get_system_memory(), s->memmap[AW_H3_UART2], 2,
> +                   qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_UART2),
> +                   115200, serial_hd(2), DEVICE_NATIVE_ENDIAN);
> +    /* UART3 */
> +    serial_mm_init(get_system_memory(), s->memmap[AW_H3_UART3], 2,
> +                   qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_UART3),
> +                   115200, serial_hd(3), DEVICE_NATIVE_ENDIAN);
> +
> +    /* Unimplemented devices */
> +    for (int i = 0; i < ARRAY_SIZE(unimplemented); i++) {

You already declared i, earlier.

> +        create_unimplemented_device(unimplemented[i].device_name,
> +                                    unimplemented[i].base,
> +                                    unimplemented[i].size);
> +    }
> +}
> +
> +static void allwinner_h3_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->realize = allwinner_h3_realize;
> +    /* Reason: uses serial_hds and nd_table */
> +    dc->user_creatable = false;
> +}
> +
> +static const TypeInfo allwinner_h3_type_info = {
> +    .name = TYPE_AW_H3,
> +    .parent = TYPE_DEVICE,
> +    .instance_size = sizeof(AwH3State),
> +    .instance_init = allwinner_h3_init,
> +    .class_init = allwinner_h3_class_init,
> +};
> +
> +static void allwinner_h3_register_types(void)
> +{
> +    type_register_static(&allwinner_h3_type_info);
> +}
> +
> +type_init(allwinner_h3_register_types)
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cd2dc137a3..dc2d7991bf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -481,6 +481,13 @@ F: hw/*/allwinner*
>   F: include/hw/*/allwinner*
>   F: hw/arm/cubieboard.c
>   
> +Allwinner-h3
> +M: Niek Linnenbank <nieklinnenbank@gmail.com>
> +L: qemu-arm@nongnu.org
> +S: Maintained
> +F: hw/*/allwinner-h3*
> +F: include/hw/*/allwinner-h3*
> +
>   ARM PrimeCell and CMSDK devices
>   M: Peter Maydell <peter.maydell@linaro.org>
>   L: qemu-arm@nongnu.org
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index c6e7782580..ebf8d2325f 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -291,6 +291,14 @@ config ALLWINNER_A10
>       select SERIAL
>       select UNIMP
>   
> +config ALLWINNER_H3
> +    bool
> +    select ALLWINNER_A10_PIT
> +    select SERIAL
> +    select ARM_TIMER
> +    select ARM_GIC
> +    select UNIMP
> +
>   config RASPI
>       bool
>       select FRAMEBUFFER
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index fe749f65fd..956e496052 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -34,6 +34,7 @@ obj-$(CONFIG_DIGIC) += digic.o
>   obj-$(CONFIG_OMAP) += omap1.o omap2.o
>   obj-$(CONFIG_STRONGARM) += strongarm.o
>   obj-$(CONFIG_ALLWINNER_A10) += allwinner-a10.o cubieboard.o
> +obj-$(CONFIG_ALLWINNER_H3) += allwinner-h3.o
>   obj-$(CONFIG_RASPI) += bcm2835_peripherals.o bcm2836.o raspi.o
>   obj-$(CONFIG_STM32F205_SOC) += stm32f205_soc.o
>   obj-$(CONFIG_XLNX_ZYNQMP_ARM) += xlnx-zynqmp.o xlnx-zcu102.o
> 


