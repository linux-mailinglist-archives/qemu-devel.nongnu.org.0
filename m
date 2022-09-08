Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F00D5B2753
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 22:00:44 +0200 (CEST)
Received: from localhost ([::1]:51908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWNha-0000MG-03
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 16:00:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oWNev-0005M7-KY; Thu, 08 Sep 2022 15:57:57 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:55537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oWNet-00019X-Cf; Thu, 08 Sep 2022 15:57:56 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D284D74633E;
 Thu,  8 Sep 2022 21:57:51 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 999DA74632B; Thu,  8 Sep 2022 21:57:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 97F79746335;
 Thu,  8 Sep 2022 21:57:51 +0200 (CEST)
Date: Thu, 8 Sep 2022 21:57:51 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v7 07/14] hw/ppc: set machine->fdt in
 xilinx_load_device_tree()
In-Reply-To: <20220908194040.518400-8-danielhb413@gmail.com>
Message-ID: <e6c5e7cd-b545-8bbe-51d9-b74a704d5fc9@eik.bme.hu>
References: <20220908194040.518400-1-danielhb413@gmail.com>
 <20220908194040.518400-8-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, 8 Sep 2022, Daniel Henrique Barboza wrote:
> This will enable support for 'dumpdtb' QMP/HMP command for the
> virtex_ml507 machine.
>
> Setting machine->fdt requires a MachineState pointer to be used inside
> xilinx_load_device_tree(). Let's change the function to receive this
> pointer from the caller. kernel_cmdline' can be retrieved directly from
> the 'machine' pointer. 'ramsize' wasn't being used so can be removed.
>
> Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> hw/ppc/virtex_ml507.c | 25 ++++++++++++++-----------
> 1 file changed, 14 insertions(+), 11 deletions(-)
>
> diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
> index 493ea0c19f..13cace229b 100644
> --- a/hw/ppc/virtex_ml507.c
> +++ b/hw/ppc/virtex_ml507.c
> @@ -45,6 +45,8 @@
> #include "hw/qdev-properties.h"
> #include "ppc405.h"
>
> +#include <libfdt.h>
> +
> #define EPAPR_MAGIC    (0x45504150)
> #define FLASH_SIZE     (16 * MiB)
>
> @@ -144,11 +146,10 @@ static void main_cpu_reset(void *opaque)
> }
>
> #define BINARY_DEVICE_TREE_FILE "virtex-ml507.dtb"
> -static int xilinx_load_device_tree(hwaddr addr,
> -                                      uint32_t ramsize,
> -                                      hwaddr initrd_base,
> -                                      hwaddr initrd_size,
> -                                      const char *kernel_cmdline)
> +static int xilinx_load_device_tree(MachineState *machine,
> +                                   hwaddr addr,
> +                                   hwaddr initrd_base,
> +                                   hwaddr initrd_size)
> {
>     char *path;
>     int fdt_size;
> @@ -190,18 +191,21 @@ static int xilinx_load_device_tree(hwaddr addr,
>         error_report("couldn't set /chosen/linux,initrd-end");
>     }
>
> -    r = qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", kernel_cmdline);
> +    r = qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
> +                                machine->kernel_cmdline);
>     if (r < 0)
>         fprintf(stderr, "couldn't set /chosen/bootargs\n");
>     cpu_physical_memory_write(addr, fdt, fdt_size);
> -    g_free(fdt);
> +
> +    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
> +    machine->fdt = fdt;
> +
>     return fdt_size;
> }
>
> static void virtex_init(MachineState *machine)
> {
>     const char *kernel_filename = machine->kernel_filename;
> -    const char *kernel_cmdline = machine->kernel_cmdline;
>     hwaddr initrd_base = 0;
>     int initrd_size = 0;
>     MemoryRegion *address_space_mem = get_system_memory();
> @@ -294,9 +298,8 @@ static void virtex_init(MachineState *machine)
>         boot_info.fdt = high + (8192 * 2);
>         boot_info.fdt &= ~8191;
>
> -        xilinx_load_device_tree(boot_info.fdt, machine->ram_size,
> -                                initrd_base, initrd_size,
> -                                kernel_cmdline);
> +        xilinx_load_device_tree(machine, boot_info.fdt,
> +                                initrd_base, initrd_size);
>     }
>     env->load_info = &boot_info;
> }
>

