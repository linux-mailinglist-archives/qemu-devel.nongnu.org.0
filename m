Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA59CB7C7
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 12:01:30 +0200 (CEST)
Received: from localhost ([::1]:43978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGKOu-0001yX-62
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 06:01:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52469)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK2M-0004yp-1E
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:38:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK2J-000588-T9
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:38:09 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:60441)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iGK2J-00054j-DD; Fri, 04 Oct 2019 05:38:07 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46l4YH48pvz9sRf; Fri,  4 Oct 2019 19:37:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1570181875;
 bh=xY4OGrUKEbU4bMX/8oj3IWDkzKs4o9UUNxOR/KQ9Avo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I2a34dL7jl+ebcGt5Iiy0NW5P8SjhOgPI5CLQo7r+6woluetnzziE85tZhw4cNF8X
 TD26sTkJ1YA1aDdgBtAIaVJKjS99VCQwVUDQTMo+Td4D7ebTnLd/nZUIP6aJJJhCfl
 8ad9nbDMSiHQx6HUumzXWs+VzBsH4icd4tc4QK2g=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 16/53] spapr: Move handling of special NVLink numa node from
 reset to init
Date: Fri,  4 Oct 2019 19:37:10 +1000
Message-Id: <20191004093747.31350-17-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004093747.31350-1-david@gibson.dropbear.id.au>
References: <20191004093747.31350-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The number of NUMA nodes in the system is fixed from the command line.
Therefore, there's no need to recalculate it at reset time, and we can
determine the special gpu_numa_id value used for NVLink2 devices at init
time.

This simplifies the reset path a bit which will make further improvements
easier.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Tested-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 hw/ppc/spapr.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index b906ac6547..7c3a443776 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1739,16 +1739,6 @@ static void spapr_machine_reset(MachineState *mach=
ine)
         spapr_setup_hpt_and_vrma(spapr);
     }
=20
-    /*
-     * NVLink2-connected GPU RAM needs to be placed on a separate NUMA n=
ode.
-     * We assign a new numa ID per GPU in spapr_pci_collect_nvgpu() whic=
h is
-     * called from vPHB reset handler so we initialize the counter here.
-     * If no NUMA is configured from the QEMU side, we start from 1 as G=
PU RAM
-     * must be equally distant from any other node.
-     * The final value of spapr->gpu_numa_id is going to be written to
-     * max-associativity-domains in spapr_build_fdt().
-     */
-    spapr->gpu_numa_id =3D MAX(1, machine->numa_state->num_nodes);
     qemu_devices_reset();
=20
     /*
@@ -2887,6 +2877,17 @@ static void spapr_machine_init(MachineState *machi=
ne)
=20
     }
=20
+    /*
+     * NVLink2-connected GPU RAM needs to be placed on a separate NUMA n=
ode.
+     * We assign a new numa ID per GPU in spapr_pci_collect_nvgpu() whic=
h is
+     * called from vPHB reset handler so we initialize the counter here.
+     * If no NUMA is configured from the QEMU side, we start from 1 as G=
PU RAM
+     * must be equally distant from any other node.
+     * The final value of spapr->gpu_numa_id is going to be written to
+     * max-associativity-domains in spapr_build_fdt().
+     */
+    spapr->gpu_numa_id =3D MAX(1, machine->numa_state->num_nodes);
+
     if ((!kvm_enabled() || kvmppc_has_cap_mmu_radix()) &&
         ppc_type_check_compat(machine->cpu_type, CPU_POWERPC_LOGICAL_3_0=
0, 0,
                               spapr->max_compat_pvr)) {
--=20
2.21.0


