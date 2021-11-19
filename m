Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D65744576B8
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 19:51:09 +0100 (CET)
Received: from localhost ([::1]:56124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo8yb-0001BY-0d
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 13:51:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mo8r3-0003uK-Tn
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 13:43:21 -0500
Received: from [2001:738:2001:2001::2001] (port=19275 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mo8r1-0002Lv-Ux
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 13:43:21 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7FCB9748F54;
 Fri, 19 Nov 2021 19:43:17 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5CE52746353; Fri, 19 Nov 2021 19:43:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 5B76F7462D3;
 Fri, 19 Nov 2021 19:43:17 +0100 (CET)
Date: Fri, 19 Nov 2021 19:43:17 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-7.0 4/5] hw/mips/jazz: Inline vga_mmio_init() and
 remove it
In-Reply-To: <20211119171202.458919-5-f4bug@amsat.org>
Message-ID: <31779b1a-3bb3-fb54-f39a-64b45f4fa57@eik.bme.hu>
References: <20211119171202.458919-1-f4bug@amsat.org>
 <20211119171202.458919-5-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-178502945-1637347397=:35384"
X-Spam-Probability: 9%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-178502945-1637347397=:35384
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 19 Nov 2021, Philippe Mathieu-Daudé wrote:
> vga_mmio_init() is used only one time and not very helpful,
> inline and remove it.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> include/hw/display/vga.h |  6 ------
> hw/display/vga-mmio.c    | 20 --------------------
> hw/mips/jazz.c           |  9 ++++++++-
> 3 files changed, 8 insertions(+), 27 deletions(-)
>
> diff --git a/include/hw/display/vga.h b/include/hw/display/vga.h
> index 03c65a14218..451e4c9898c 100644
> --- a/include/hw/display/vga.h
> +++ b/include/hw/display/vga.h
> @@ -9,8 +9,6 @@
> #ifndef QEMU_HW_DISPLAY_VGA_H
> #define QEMU_HW_DISPLAY_VGA_H
>
> -#include "exec/hwaddr.h"
> -
> /*
>  * modules can reference this symbol to avoid being loaded
>  * into system emulators without vga support
> @@ -24,8 +22,4 @@ enum vga_retrace_method {
>
> extern enum vga_retrace_method vga_retrace_method;
>
> -int vga_mmio_init(hwaddr vram_base,
> -                    hwaddr ctrl_base, int it_shift,
> -                    MemoryRegion *address_space);
> -
> #endif
> diff --git a/hw/display/vga-mmio.c b/hw/display/vga-mmio.c
> index d1c5f31c134..af9229794c9 100644
> --- a/hw/display/vga-mmio.c
> +++ b/hw/display/vga-mmio.c
> @@ -25,7 +25,6 @@
>
> #include "qemu/osdep.h"
> #include "qapi/error.h"
> -#include "hw/display/vga.h"
> #include "hw/sysbus.h"
> #include "hw/qdev-properties.h"
> #include "vga_int.h"
> @@ -87,25 +86,6 @@ static void vga_mmio_reset(DeviceState *dev)
>     vga_common_reset(s);
> }
>
> -int vga_mmio_init(hwaddr vram_base,
> -                    hwaddr ctrl_base, int it_shift,
> -                    MemoryRegion *address_space)
> -{
> -    DeviceState *dev;
> -    SysBusDevice *s;
> -
> -    dev = qdev_new(TYPE_VGA_MMIO);
> -    qdev_prop_set_uint8(dev, "it_shift", it_shift);
> -    s = SYS_BUS_DEVICE(dev);
> -    sysbus_realize_and_unref(s, &error_fatal);
> -
> -    sysbus_mmio_map(s, 0, ctrl_base);
> -    sysbus_mmio_map(s, 1, vram_base + 0x000a0000);
> -    sysbus_mmio_map(s, 2, VBE_DISPI_LFB_PHYSICAL_ADDRESS);
> -
> -    return 0;
> -}
> -
> static void vga_mmio_realizefn(DeviceState *dev, Error **errp)
> {
>     VGAMmioState *s = VGA_MMIO(dev);
> diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
> index 8f345afd137..bd9815c773e 100644
> --- a/hw/mips/jazz.c
> +++ b/hw/mips/jazz.c
> @@ -43,6 +43,7 @@
> #include "hw/rtc/mc146818rtc.h"
> #include "hw/timer/i8254.h"
> #include "hw/display/vga.h"
> +#include "hw/display/bochs-vbe.h"
> #include "hw/audio/pcspk.h"
> #include "hw/input/i8042.h"
> #include "hw/sysbus.h"
> @@ -274,7 +275,13 @@ static void mips_jazz_init(MachineState *machine,
>         }
>         break;
>     case JAZZ_PICA61:
> -        vga_mmio_init(0x40000000, 0x60000000, 0, get_system_memory());
> +        dev = qdev_new("vga-mmio");

Does it worth moving TYPE_VGA_MMIO to vga.h so you could use it here? 
Other than that:

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> +        qdev_prop_set_uint8(dev, "it_shift", 0);
> +        sysbus = SYS_BUS_DEVICE(dev);
> +        sysbus_realize_and_unref(sysbus, &error_fatal);
> +        sysbus_mmio_map(sysbus, 0, 0x60000000);
> +        sysbus_mmio_map(sysbus, 1, 0x400a0000);
> +        sysbus_mmio_map(sysbus, 2, VBE_DISPI_LFB_PHYSICAL_ADDRESS);
>         break;
>     default:
>         break;
>
--3866299591-178502945-1637347397=:35384--

