Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0A428FAA9
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Oct 2020 23:29:24 +0200 (CEST)
Received: from localhost ([::1]:48086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTAoM-0005RE-V2
	for lists+qemu-devel@lfdr.de; Thu, 15 Oct 2020 17:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kTAha-0007r5-Eu
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 17:22:24 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:53063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kTAhY-0001ZZ-0h
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 17:22:21 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-j1UHeKcCMxSkP1SEha9QxQ-1; Thu, 15 Oct 2020 17:18:28 -0400
X-MC-Unique: j1UHeKcCMxSkP1SEha9QxQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CB428030DC;
 Thu, 15 Oct 2020 21:18:27 +0000 (UTC)
Received: from bahia.lan (ovpn-112-78.ams2.redhat.com [10.36.112.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 616C976673;
 Thu, 15 Oct 2020 21:18:26 +0000 (UTC)
Subject: [PATCH v2 1/5] spapr: Fix leak of CPU machine specific data
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Thu, 15 Oct 2020 23:18:25 +0200
Message-ID: <160279670540.1808373.17319746576919615623.stgit@bahia.lan>
In-Reply-To: <160279669833.1808373.9524145092720289601.stgit@bahia.lan>
References: <160279669833.1808373.9524145092720289601.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 17:18:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When a CPU core is being removed, the machine specific data of each
CPU thread object is leaked.

Fix this by calling the dedicated helper we have for that instead of
simply unparenting the CPU object. Call it from a separate loop in
spapr_cpu_core_unrealize() for symmetry with spapr_cpu_core_realize().

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/spapr_cpu_core.c |   22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index b03620823adb..c55211214524 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -188,7 +188,6 @@ static void spapr_unrealize_vcpu(PowerPCCPU *cpu, Spapr=
CpuCore *sc)
     }
     spapr_irq_cpu_intc_destroy(SPAPR_MACHINE(qdev_get_machine()), cpu);
     cpu_remove_sync(CPU(cpu));
-    object_unparent(OBJECT(cpu));
 }
=20
 /*
@@ -213,6 +212,15 @@ static void spapr_cpu_core_reset_handler(void *opaque)
     spapr_cpu_core_reset(opaque);
 }
=20
+static void spapr_delete_vcpu(PowerPCCPU *cpu, SpaprCpuCore *sc)
+{
+    SpaprCpuState *spapr_cpu =3D spapr_cpu_state(cpu);
+
+    cpu->machine_data =3D NULL;
+    g_free(spapr_cpu);
+    object_unparent(OBJECT(cpu));
+}
+
 static void spapr_cpu_core_unrealize(DeviceState *dev)
 {
     SpaprCpuCore *sc =3D SPAPR_CPU_CORE(OBJECT(dev));
@@ -224,6 +232,9 @@ static void spapr_cpu_core_unrealize(DeviceState *dev)
     for (i =3D 0; i < cc->nr_threads; i++) {
         spapr_unrealize_vcpu(sc->threads[i], sc);
     }
+    for (i =3D 0; i < cc->nr_threads; i++) {
+        spapr_delete_vcpu(sc->threads[i], sc);
+    }
     g_free(sc->threads);
 }
=20
@@ -294,15 +305,6 @@ err:
     return NULL;
 }
=20
-static void spapr_delete_vcpu(PowerPCCPU *cpu, SpaprCpuCore *sc)
-{
-    SpaprCpuState *spapr_cpu =3D spapr_cpu_state(cpu);
-
-    cpu->machine_data =3D NULL;
-    g_free(spapr_cpu);
-    object_unparent(OBJECT(cpu));
-}
-
 static void spapr_cpu_core_realize(DeviceState *dev, Error **errp)
 {
     /* We don't use SPAPR_MACHINE() in order to exit gracefully if the use=
r



