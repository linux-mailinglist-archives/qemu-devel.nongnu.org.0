Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FC357EA34
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jul 2022 01:17:16 +0200 (CEST)
Received: from localhost ([::1]:49172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oF1tT-0000om-QM
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 19:17:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oF1sU-0007pG-PB
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 19:16:14 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:20036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oF1sS-0005iN-Uh
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 19:16:14 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id AEE957475F9;
 Sat, 23 Jul 2022 01:16:10 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 76CBC7470B9; Sat, 23 Jul 2022 01:16:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7581D746FDE;
 Sat, 23 Jul 2022 01:16:10 +0200 (CEST)
Date: Sat, 23 Jul 2022 01:16:10 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH for-7.2 00/10] add hmp 'save-fdt' and 'info fdt' commands
In-Reply-To: <20220722200007.1602174-1-danielhb413@gmail.com>
Message-ID: <58c8906a-392e-7120-1e23-7ab0cfaffcd1@eik.bme.hu>
References: <20220722200007.1602174-1-danielhb413@gmail.com>
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

On Fri, 22 Jul 2022, Daniel Henrique Barboza wrote:
> Hi,
>
> After dealing with a FDT element that isn't being shown in the userspace
> and having to shutdown the guest, dump the FDT using 'machine -dumpdtb' and
> then using 'dtc' to see what was inside the FDT, I thought it was a good
> idea to add extra support for FDT handling in QEMU.
>
> This series introduces 2 commands. 'fdt-save' behaves similar to what
> 'machine -dumpdtb' does, with the advantage of saving the FDT of a running
> guest on demand. This command is implemented in patch 03.
>
> The second command, 'info fdt <command>' is more sophisticated. This
> command can print specific nodes and properties of the FDT. A few
> examples:
>
> - print the /cpus/cpu@0 from an ARM 'virt' machine:
>
> (qemu) info fdt /cpus/cpu@0
> /cpus/cpu@0 {
>    phandle = <0x8001>
>    reg = <0x0>
>    compatible = 'arm,cortex-a57'
>    device_type = 'cpu'
> }
> (qemu)
>
> - print the device_type property of the interrupt-controller node of a
> pSeries machine:
>
> (qemu) info fdt /interrupt-controller/device_type
> /interrupt-controller/device_type = 'PowerPC-External-Interrupt-Presentation'
> (qemu)
>
> Issuing a 'info fdt /' will dump all the FDT. 'info fdt' is implemented
> in patches 4-10.
>
> Both 'fdt-save' and 'info fdt' works across machines and archs based on
> two premises: the FDT must be created using libfdt (which is the case of
> all FDTs created with device_tree.c helpers and the _FDT macro) and the
> FDT must be reachable via MachineState->fdt.
>
> To meet the prerequisites for ARM machines, patch 1 makes a change in
> arm_load_dtb(). Patches 2 and 3 makes a similar change for two PowerPC
> machines that weren't using machine->fdt.

There are some other machines that load a dtb with load_device_tree(). Do 
they need some patches too?

Regards,
BALATON Zoltan

> Tests were done using the ARM machvirt machine and ppc64 pSeries
> machine, but any machine that meets the forementioned conditions will be
> supported by these 2 new commands.
>
>
> Daniel Henrique Barboza (10):
>  hw/arm/boot.c: do not free machine->fdt in arm_load_dtb()
>  hw/ppc/pegasos2.c: set machine->fdt in machine_reset()
>  hw/ppc: set machine->fdt in spapr machine
>  hmp, device_tree.c: introduce fdt-save
>  hmp, device_tree.c: introduce 'info fdt' command
>  device_tree.c: support printing of strings props
>  device_tree.c: support remaining FDT prop types
>  device_node.c: enable 'info fdt' to print subnodes
>  device_tree.c: add fdt_print_property() helper
>  hmp, device_tree.c: add 'info fdt <property>' support
>
> hmp-commands-info.hx         |  13 +++
> hmp-commands.hx              |  13 +++
> hw/arm/boot.c                |   3 +-
> hw/ppc/pegasos2.c            |   3 +
> hw/ppc/spapr.c               |   3 +
> hw/ppc/spapr_hcall.c         |   3 +
> include/sysemu/device_tree.h |   3 +
> monitor/misc.c               |  25 ++++
> softmmu/device_tree.c        | 219 +++++++++++++++++++++++++++++++++++
> 9 files changed, 284 insertions(+), 1 deletion(-)
>
>

