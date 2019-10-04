Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A97CB7C8
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 12:01:46 +0200 (CEST)
Received: from localhost ([::1]:43990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGKPA-0002Fj-2h
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 06:01:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52725)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK2g-0005Is-AE
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:38:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK2d-0005PP-R8
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:38:30 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:52659)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iGK2d-00054q-EY; Fri, 04 Oct 2019 05:38:27 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46l4YJ2B0vz9sRc; Fri,  4 Oct 2019 19:37:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1570181876;
 bh=xRc5zUmFKHE/39kn3SK8iYoYoLoZG31dgP+InV2MVxE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=flXWFfDDNSmpDubHA7srZ9s4WLHP0Yi3Vkq5NKM521VEw8DEALrVNC2GCH2pZcmBR
 +l+BQze6s1WTrz963deaWAyWpLWygSfRTV7i25mh9clLmEQkFOpniTzrWve/VIoeVt
 CEk9wqRB1ldm3ixdMM4znXu6kx8zyVSdOsjkSJb4=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 19/53] spapr: Do not put empty properties for
 -kernel/-initrd/-append
Date: Fri,  4 Oct 2019 19:37:13 +1000
Message-Id: <20191004093747.31350-20-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004093747.31350-1-david@gibson.dropbear.id.au>
References: <20191004093747.31350-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexey Kardashevskiy <aik@ozlabs.ru>

We are going to use spapr_build_fdt() for the boot time FDT and as an
update for SLOF during handling of H_CAS. SLOF will apply all properties
from the QEMU's FDT which is usually ok unless there are properties
changed by grub or guest kernel. The properties are:
bootargs, linux,initrd-start, linux,initrd-end, linux,stdout-path,
linux,rtas-base, linux,rtas-entry. Resetting those during CAS will most
likely cause grub failure.

Don't create such properties if we're booting without "-kernel" and
"-initrd" so they won't get included into the DT update blob and
therefore the guest is more likely to boot successfully.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
[dwg: Tweaked commit message based on Greg Kurz's input]
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 42a5b8d2fd..f1c57c21cc 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1179,11 +1179,16 @@ static void spapr_dt_chosen(SpaprMachineState *sp=
apr, void *fdt)
=20
     _FDT(chosen =3D fdt_add_subnode(fdt, 0, "chosen"));
=20
-    _FDT(fdt_setprop_string(fdt, chosen, "bootargs", machine->kernel_cmd=
line));
-    _FDT(fdt_setprop_cell(fdt, chosen, "linux,initrd-start",
-                          spapr->initrd_base));
-    _FDT(fdt_setprop_cell(fdt, chosen, "linux,initrd-end",
-                          spapr->initrd_base + spapr->initrd_size));
+    if (machine->kernel_cmdline && machine->kernel_cmdline[0]) {
+        _FDT(fdt_setprop_string(fdt, chosen, "bootargs",
+                                machine->kernel_cmdline));
+    }
+    if (spapr->initrd_size) {
+        _FDT(fdt_setprop_cell(fdt, chosen, "linux,initrd-start",
+                              spapr->initrd_base));
+        _FDT(fdt_setprop_cell(fdt, chosen, "linux,initrd-end",
+                              spapr->initrd_base + spapr->initrd_size));
+    }
=20
     if (spapr->kernel_size) {
         uint64_t kprop[2] =3D { cpu_to_be64(KERNEL_LOAD_ADDR),
--=20
2.21.0


