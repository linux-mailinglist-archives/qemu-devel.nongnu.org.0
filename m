Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7535B2766
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 22:04:01 +0200 (CEST)
Received: from localhost ([::1]:39448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWNkm-00031c-M5
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 16:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oWNcs-0002kd-Tv; Thu, 08 Sep 2022 15:55:50 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:44811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oWNcp-0000wG-HK; Thu, 08 Sep 2022 15:55:49 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3469674632B;
 Thu,  8 Sep 2022 21:55:42 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id ED84D7461AE; Thu,  8 Sep 2022 21:55:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id EB909745702;
 Thu,  8 Sep 2022 21:55:41 +0200 (CEST)
Date: Thu, 8 Sep 2022 21:55:41 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org
Subject: Re: [PATCH v7 05/14] hw/ppc: set machine->fdt in
 bamboo_load_device_tree()
In-Reply-To: <20220908194040.518400-6-danielhb413@gmail.com>
Message-ID: <be8c4e-f9f8-9695-1559-6017f5df91a3@eik.bme.hu>
References: <20220908194040.518400-1-danielhb413@gmail.com>
 <20220908194040.518400-6-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1111005198-1662666941=:65589"
X-Spam-Probability: 9%
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1111005198-1662666941=:65589
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 8 Sep 2022, Daniel Henrique Barboza wrote:
> This will enable support for 'dumpdtb' QMP/HMP command for the bamboo
> machine.
>
> Setting machine->fdt requires a MachineState pointer to be used inside
> bamboo_load_device_tree(). Let's change the function to receive this
> pointer from the caller. 'ramsize' and 'kernel_cmdline' can be retrieved
> directly from the 'machine' pointer.
>
> Cc: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> hw/ppc/ppc440_bamboo.c | 25 ++++++++++++++-----------
> 1 file changed, 14 insertions(+), 11 deletions(-)
>
> diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
> index ea945a1c99..9cc58fccf9 100644
> --- a/hw/ppc/ppc440_bamboo.c
> +++ b/hw/ppc/ppc440_bamboo.c
> @@ -34,6 +34,8 @@
> #include "hw/qdev-properties.h"
> #include "qapi/error.h"
>
> +#include <libfdt.h>
> +
> #define BINARY_DEVICE_TREE_FILE "bamboo.dtb"
>
> /* from u-boot */
> @@ -56,14 +58,13 @@ static const ram_addr_t ppc440ep_sdram_bank_sizes[] = {
>
> static hwaddr entry;
>
> -static int bamboo_load_device_tree(hwaddr addr,
> -                                     uint32_t ramsize,
> -                                     hwaddr initrd_base,
> -                                     hwaddr initrd_size,
> -                                     const char *kernel_cmdline)
> +static int bamboo_load_device_tree(MachineState *machine,
> +                                   hwaddr addr,
> +                                   hwaddr initrd_base,
> +                                   hwaddr initrd_size)
> {
>     int ret = -1;
> -    uint32_t mem_reg_property[] = { 0, 0, cpu_to_be32(ramsize) };
> +    uint32_t mem_reg_property[] = { 0, 0, cpu_to_be32(machine->ram_size) };
>     char *filename;
>     int fdt_size;
>     void *fdt;
> @@ -98,7 +99,7 @@ static int bamboo_load_device_tree(hwaddr addr,
>         fprintf(stderr, "couldn't set /chosen/linux,initrd-end\n");
>     }
>     ret = qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
> -                                  kernel_cmdline);
> +                                  machine->kernel_cmdline);
>     if (ret < 0) {
>         fprintf(stderr, "couldn't set /chosen/bootargs\n");
>     }
> @@ -119,7 +120,10 @@ static int bamboo_load_device_tree(hwaddr addr,
>                           tb_freq);
>
>     rom_add_blob_fixed(BINARY_DEVICE_TREE_FILE, fdt, fdt_size, addr);
> -    g_free(fdt);
> +
> +    /* Set ms->fdt for 'dumpdtb' QMP/HMP command */
> +    machine->fdt = fdt;
> +
>     return 0;
> }
>
> @@ -163,7 +167,6 @@ static void main_cpu_reset(void *opaque)
> static void bamboo_init(MachineState *machine)
> {
>     const char *kernel_filename = machine->kernel_filename;
> -    const char *kernel_cmdline = machine->kernel_cmdline;
>     const char *initrd_filename = machine->initrd_filename;
>     unsigned int pci_irq_nrs[4] = { 28, 27, 26, 25 };
>     MemoryRegion *address_space_mem = get_system_memory();
> @@ -289,8 +292,8 @@ static void bamboo_init(MachineState *machine)
>
>     /* If we're loading a kernel directly, we must load the device tree too. */
>     if (kernel_filename) {
> -        if (bamboo_load_device_tree(FDT_ADDR, machine->ram_size, RAMDISK_ADDR,
> -                                    initrd_size, kernel_cmdline) < 0) {
> +        if (bamboo_load_device_tree(machine, FDT_ADDR,
> +                                    RAMDISK_ADDR, initrd_size) < 0) {
>             error_report("couldn't load device tree");
>             exit(1);
>         }
>
--3866299591-1111005198-1662666941=:65589--

