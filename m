Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C10645ACC10
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 09:22:09 +0200 (CEST)
Received: from localhost ([::1]:41956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV6Ql-0005QC-AF
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 03:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oV6KJ-0001mB-Tl; Mon, 05 Sep 2022 03:15:25 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:61112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oV6KG-0002Cw-3G; Mon, 05 Sep 2022 03:15:23 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E13EE74632B;
 Mon,  5 Sep 2022 09:15:14 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3FF047461AE; Mon,  5 Sep 2022 09:15:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 3D0DC745702;
 Mon,  5 Sep 2022 09:15:14 +0200 (CEST)
Date: Mon, 5 Sep 2022 09:15:14 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org
Subject: Re: [PATCH v6 06/14] hw/ppc: set machine->fdt in
 sam460ex_load_device_tree()
In-Reply-To: <20220904233456.209027-7-danielhb413@gmail.com>
Message-ID: <fbf6b3f-4fa3-928a-8ef9-83af7e2e835@eik.bme.hu>
References: <20220904233456.209027-1-danielhb413@gmail.com>
 <20220904233456.209027-7-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Sun, 4 Sep 2022, Daniel Henrique Barboza wrote:
> This will enable support for 'dumpdtb' QMP/HMP command for the sam460ex
> machine.
>
> Setting machine->fdt requires a MachineState pointer to be used inside
> sam460ex_load_device_tree(). Let's change the function to receive this
> pointer from the caller. 'ramsize' and 'kernel_cmdline' can be retrieved
> directly from the 'machine' pointer.
>
> Cc: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

but could you please do the same at least for bamboo and virtex too to 
keep these consistent? (and to simplify them a little.)

Regards,
BALATON Zoltan

> ---
> hw/ppc/sam460ex.c | 21 +++++++++++----------
> 1 file changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index 850bb3b817..5d09d3c6ab 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -131,13 +131,12 @@ static int sam460ex_load_uboot(void)
>     return 0;
> }
>
> -static int sam460ex_load_device_tree(hwaddr addr,
> -                                     uint32_t ramsize,
> +static int sam460ex_load_device_tree(MachineState *machine,
> +                                     hwaddr addr,
>                                      hwaddr initrd_base,
> -                                     hwaddr initrd_size,
> -                                     const char *kernel_cmdline)
> +                                     hwaddr initrd_size)
> {
> -    uint32_t mem_reg_property[] = { 0, 0, cpu_to_be32(ramsize) };
> +    uint32_t mem_reg_property[] = { 0, 0, cpu_to_be32(machine->ram_size) };
>     char *filename;
>     int fdt_size;
>     void *fdt;
> @@ -171,7 +170,8 @@ static int sam460ex_load_device_tree(hwaddr addr,
>     qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
>                           (initrd_base + initrd_size));
>
> -    qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", kernel_cmdline);
> +    qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
> +                            machine->kernel_cmdline);
>
>     /* Copy data from the host device tree into the guest. Since the guest can
>      * directly access the timebase without host involvement, we must expose
> @@ -208,7 +208,9 @@ static int sam460ex_load_device_tree(hwaddr addr,
>                               EBC_FREQ);
>
>     rom_add_blob_fixed(BINARY_DEVICE_TREE_FILE, fdt, fdt_size, addr);
> -    g_free(fdt);
> +
> +    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
> +    machine->fdt = fdt;
>
>     return fdt_size;
> }
> @@ -496,9 +498,8 @@ static void sam460ex_init(MachineState *machine)
>     if (machine->kernel_filename) {
>         int dt_size;
>
> -        dt_size = sam460ex_load_device_tree(FDT_ADDR, machine->ram_size,
> -                                    RAMDISK_ADDR, initrd_size,
> -                                    machine->kernel_cmdline);
> +        dt_size = sam460ex_load_device_tree(machine, FDT_ADDR,
> +                                            RAMDISK_ADDR, initrd_size);
>
>         boot_info->dt_base = FDT_ADDR;
>         boot_info->dt_size = dt_size;
>

