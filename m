Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D8A187E10
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 11:19:02 +0100 (CET)
Received: from localhost ([::1]:55746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jE9JN-0000xP-4n
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 06:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46581)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1jE96V-0002Mh-Ah
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 06:05:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1jE96T-0008P1-U9
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 06:05:43 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:43735 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1jE96T-0005o2-H7; Tue, 17 Mar 2020 06:05:41 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48hTL12ZBpz9sTV; Tue, 17 Mar 2020 21:04:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1584439481;
 bh=lfwtAqakSHQ2oL/cyuePyT3lif+wTyFCZKQf8mU9yS0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bWg75vvtYOff8Cyx7nXTWFHze0b2yh4vu2qehCJ7Fc6kZjsW3j/Y86QzvQ3tr2CD5
 ak5FrhyaTrwMLa707GrZJ8XVCGHjqbsbslYZwIZEKRtKxS4XyvcKxUTtLTbf/XJ9Y7
 1HfX7KnHB6/MehZo39jQGxXscxTohlf6qQmxSOiE=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 37/45] ppc/spapr: Fix FWNMI machine check failure handling
Date: Tue, 17 Mar 2020 21:04:15 +1100
Message-Id: <20200317100423.622643-38-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200317100423.622643-1-david@gibson.dropbear.id.au>
References: <20200317100423.622643-1-david@gibson.dropbear.id.au>
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, mdroth@linux.vnet.ibm.com,
 Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nicholas Piggin <npiggin@gmail.com>

ppc_cpu_do_system_reset delivers a system rreset interrupt to the guest,
which is certainly not what is intended here. Panic the guest like other
failure cases here do.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Message-Id: <20200316142613.121089-2-npiggin@gmail.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_events.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index 2afd1844e4..11303258d4 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -785,7 +785,6 @@ static uint32_t spapr_mce_get_elog_type(PowerPCCPU *c=
pu, bool recovered,
 static void spapr_mce_dispatch_elog(PowerPCCPU *cpu, bool recovered)
 {
     SpaprMachineState *spapr =3D SPAPR_MACHINE(qdev_get_machine());
-    CPUState *cs =3D CPU(cpu);
     uint64_t rtas_addr;
     CPUPPCState *env =3D &cpu->env;
     PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
@@ -823,8 +822,7 @@ static void spapr_mce_dispatch_elog(PowerPCCPU *cpu, =
bool recovered)
     /* get rtas addr from fdt */
     rtas_addr =3D spapr_get_rtas_addr();
     if (!rtas_addr) {
-        /* Unable to fetch rtas_addr. Hence reset the guest */
-        ppc_cpu_do_system_reset(cs);
+        qemu_system_guest_panicked(NULL);
         g_free(ext_elog);
         return;
     }
--=20
2.24.1


