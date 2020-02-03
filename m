Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FA915019C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 07:17:34 +0100 (CET)
Received: from localhost ([::1]:34836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyV37-0003g2-RW
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 01:17:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57216)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iyUxO-0002Q2-65
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 01:11:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iyUxN-0002a5-4o
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 01:11:38 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:47861 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iyUxM-0002UZ-PV; Mon, 03 Feb 2020 01:11:37 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 489yBm6YgCz9sSL; Mon,  3 Feb 2020 17:11:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1580710288;
 bh=2jmkwg3BUMMJqmimdvGd8n4T5fRDXI2SsSNGCZE1miI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pvOIeJ19AGrkYSYMXUmehRLeWeTDizlEzExZ7w8JhEIu4K5oGRlN21QJ0vehloSlo
 cscTyyMOSTRp/J07PIY9UrvCXfohesu8aWRoVKgGbF/joadmlUmp/6AaqqR7yuNuI9
 dWjUfFF/zA0aSpEXVRpxR5Q/ADR8RYhvmnWgp2wU=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 09/35] spapr: Don't allow multiple active vCPUs at CAS
Date: Mon,  3 Feb 2020 17:10:57 +1100
Message-Id: <20200203061123.59150-10-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200203061123.59150-1-david@gibson.dropbear.id.au>
References: <20200203061123.59150-1-david@gibson.dropbear.id.au>
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
Cc: lvivier@redhat.com, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

According to the description of "ibm,client-architecture-support" that
can found in LoPAPR "B.6.2.3 Root Node Methods":

If multiple partition processors or threads are active at the time of
the ibm,client-architecture-support method call, or an error is detected
in the format of the ibm,architecture.vec structure, the err? boolean
shall be TRUE; else FALSE.

We certainly don't want to temper with the platform or with the PCR of
the other vCPUs if they happen to be active. Ensure we have only one
active vCPU and fail CAS otherwise. This is just for conformance and
robustness, it doesn't fix any known bugs.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <157969867170.571404.12117797348882189656.stgit@bahia.lan>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_hcall.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index ffb14641f9..b8bb66b5c0 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1676,6 +1676,18 @@ static target_ulong h_client_architecture_support(=
PowerPCCPU *cpu,
     Error *local_err =3D NULL;
     bool raw_mode_supported =3D false;
     bool guest_xive;
+    CPUState *cs;
+
+    /* CAS is supposed to be called early when only the boot vCPU is act=
ive. */
+    CPU_FOREACH(cs) {
+        if (cs =3D=3D CPU(cpu)) {
+            continue;
+        }
+        if (!cs->halted) {
+            warn_report("guest has multiple active vCPUs at CAS, which i=
s not allowed");
+            return H_MULTI_THREADS_ACTIVE;
+        }
+    }
=20
     cas_pvr =3D cas_check_pvr(spapr, cpu, &addr, &raw_mode_supported, &l=
ocal_err);
     if (local_err) {
--=20
2.24.1


