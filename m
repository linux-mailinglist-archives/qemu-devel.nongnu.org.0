Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDA2AF4CB
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 06:07:41 +0200 (CEST)
Received: from localhost ([::1]:46372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7tut-0002Gv-SB
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 00:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46465)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1i7tsS-0000TF-7b
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 00:05:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1i7tsO-0002o0-8q
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 00:05:06 -0400
Received: from ozlabs.org ([203.11.71.1]:53195)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1i7tsM-0002gV-A0; Wed, 11 Sep 2019 00:05:03 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46SpFh2WDHz9sPT; Wed, 11 Sep 2019 14:04:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1568174696;
 bh=0D9EaTAy03qlicbnrizkJdRGliPDljqrRoq2NdZgOSU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HUCwcgYb345QzUUTAshAU5Xuhv41OceiIErK/P51WTREZs5kKt3x9C0r7NvnEi7GD
 jgE4OMLX/iztcgsvdiml+NaHjeuIaufLVe4zl3QFHxvS77GeNAC9w5zhWRJhr0/YfT
 YAHngo5HHQjcjCfk+0m/PA3ifSj6cR+jpfGVqr3c=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Date: Wed, 11 Sep 2019 14:04:50 +1000
Message-Id: <20190911040452.8341-6-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190911040452.8341-1-david@gibson.dropbear.id.au>
References: <20190911040452.8341-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PATCH 5/7] spapr: Do not put empty properties for
 -kernel/-initrd/-append
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, groug@kaod.org, clg@kaod.org,
 philmd@redhat.com, David Gibson <david@gibson.dropbear.id.au>
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

This only creates such properties if we are booting with "-kernel" and
"-initrd" so they won't get included into the DT update blob and
therefore the guest is more likely to boot successfully.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index d072c2aa3d..d18744268f 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1177,11 +1177,16 @@ static void spapr_dt_chosen(SpaprMachineState *sp=
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


