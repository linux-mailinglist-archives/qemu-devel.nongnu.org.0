Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4E536A9F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 06:11:05 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54137 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYjjz-0006Va-TO
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 00:11:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36635)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1hYjj1-0005zi-8U
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 00:10:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1hYjiz-0002Jg-DL
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 00:10:03 -0400
Received: from ozlabs.ru ([107.173.13.209]:48391)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>)
	id 1hYjiz-0002Cr-7t; Thu, 06 Jun 2019 00:10:01 -0400
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
	by ozlabs.ru (Postfix) with ESMTP id 95B7EAE80017;
	Thu,  6 Jun 2019 00:09:23 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 14:09:19 +1000
Message-Id: <20190606040919.110655-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 107.173.13.209
Subject: [Qemu-devel] spapr_pci: Advertise BAR reallocation capability
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Shawn Anastasio <shawn@anastas.io>,
	qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The pseries guests do not normally allocate PCI resouces and rely on
the system firmware doing so. Furthermore at least at some point in
the past the pseries guests won't even be allowed to change BARs, probably
it is still the case for phyp. So since the initial commit we have [1]
which prevents resource reallocation.

This is not a problem until we want specific BAR alignments, for example,
PAGE_SIZE==64k to make sure we can still map MMIO BARs directly. For
the boot time devices we handle this in SLOF [2] but since QEMU's RTAS
does not allocate BARs, the guest does this instead and does not align
BARs even if Linux is given pci=resource_alignment=16@pci:0:0 as
PCI_PROBE_ONLY makes Linux ignore alignment requests.

ARM folks added a dial to control PCI_PROBE_ONLY via the device tree [3].
This makes use of the dial to advertise to the guest that we can handle
BAR reassignments.

We do not remove the flag from [1] as pseries guests are still supported
under phyp so having that removed may cause problems.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/powerpc/platforms/pseries/setup.c?h=v5.1#n773
[2] https://git.qemu.org/?p=SLOF.git;a=blob;f=board-qemu/slof/pci-phb.fs;h=06729bcf77a0d4e900c527adcd9befe2a269f65d;hb=HEAD#l338
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f81c11af
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 hw/ppc/spapr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 6dd8aaac3340..84d16f9edaca 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1209,6 +1209,9 @@ static void spapr_dt_chosen(SpaprMachineState *spapr, void *fdt)
         _FDT(fdt_setprop_string(fdt, chosen, "stdout-path", stdout_path));
     }
 
+    /* We can deal with BAR reallocation just fine, advertise it to the guest */
+    _FDT(fdt_setprop_cell(fdt, chosen, "linux,pci-probe-only", 0));
+
     spapr_dt_ov5_platform_support(spapr, fdt, chosen);
 
     g_free(stdout_path);
-- 
2.17.1


