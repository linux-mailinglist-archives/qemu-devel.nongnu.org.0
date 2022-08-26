Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62ADE5A2F6B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 20:58:15 +0200 (CEST)
Received: from localhost ([::1]:45852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oReX0-0005Fl-3k
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 14:58:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oReVB-0003Zi-S0; Fri, 26 Aug 2022 14:56:21 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:27760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oReV9-00016h-FA; Fri, 26 Aug 2022 14:56:21 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7182674632B;
 Fri, 26 Aug 2022 20:56:11 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3832D7461AE; Fri, 26 Aug 2022 20:56:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 366E5745702;
 Fri, 26 Aug 2022 20:56:11 +0200 (CEST)
Date: Fri, 26 Aug 2022 20:56:11 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org, 
 david@gibson.dropbear.id.au, alistair.francis@wdc.com
Subject: Re: [PATCH for-7.2 v4 06/21] hw/ppc: set machine->fdt in
 sam460ex_load_device_tree()
In-Reply-To: <20220826141150.7201-7-danielhb413@gmail.com>
Message-ID: <32f11c71-b8c4-1af0-2c39-166dc6f013ac@eik.bme.hu>
References: <20220826141150.7201-1-danielhb413@gmail.com>
 <20220826141150.7201-7-danielhb413@gmail.com>
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

On Fri, 26 Aug 2022, Daniel Henrique Barboza wrote:
> This will enable support for 'dumpdtb' and 'info fdt' HMP commands for
> the sam460ex machine.

This only works when booting with -kernel not when the firmware is used 
which creates its own DT. (The same is true for pegasos2 but there VOF is 
the default as the firmware is not free like for sam460ex.) After reading 
the other comments I wonder if this info fdt command is really useful or 
would it be easier to boot some simple Linux guest and inspect the device 
tree from there. The dumpdtb command might be simple enough and a bit more 
useful for debugging before the guest boots but that alone could be enough 
as external tools can be used to decode the binary dump. The info fdt 
might be too complex and an overkill if it might not even work or give 
correct results. But I don't mind either way and not against adding it 
just noted the possible shortcoming here.

(In case you do another iteration I wouldn't mind if the comment could be 
shortened to one line instead of 4 but it's not critical. Something like:

/* Set machine->fdt for dumpdtb and info fdt QMP/HMP commands */

would be enough and use less space. The current one is unnecessarily 
verbose for a simple line.)

Regards,
BALATON Zoltan

> Cc: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
> hw/ppc/sam460ex.c | 8 +++++++-
> 1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index 0357ee077f..413a425d37 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -138,6 +138,7 @@ static int sam460ex_load_device_tree(hwaddr addr,
>                                      hwaddr initrd_size,
>                                      const char *kernel_cmdline)
> {
> +    MachineState *machine = MACHINE(qdev_get_machine());
>     uint32_t mem_reg_property[] = { 0, 0, cpu_to_be32(ramsize) };
>     char *filename;
>     int fdt_size;
> @@ -209,7 +210,12 @@ static int sam460ex_load_device_tree(hwaddr addr,
>                               EBC_FREQ);
>
>     rom_add_blob_fixed(BINARY_DEVICE_TREE_FILE, fdt, fdt_size, addr);
> -    g_free(fdt);
> +
> +    /*
> +     * Update the machine->fdt pointer to enable support for
> +     * 'dumpdtb' and 'info fdt' QMP/HMP commands.
> +     */
> +    machine->fdt = fdt;
>
>     return fdt_size;
> }
>

