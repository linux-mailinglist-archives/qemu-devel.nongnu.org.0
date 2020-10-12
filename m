Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3F828BBCF
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 17:26:31 +0200 (CEST)
Received: from localhost ([::1]:45644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRziY-0001Lb-Gv
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 11:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kRzcA-0003Bm-C0
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 11:19:54 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:54060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kRzc8-0005QR-Ps
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 11:19:54 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-64UiFSNoMuO9LqjqmpVQkg-1; Mon, 12 Oct 2020 11:19:49 -0400
X-MC-Unique: 64UiFSNoMuO9LqjqmpVQkg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFC4880F05B;
 Mon, 12 Oct 2020 15:19:48 +0000 (UTC)
Received: from bahia.lan (ovpn-112-78.ams2.redhat.com [10.36.112.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 26C2F10027AA;
 Mon, 12 Oct 2020 15:19:47 +0000 (UTC)
Subject: [PATCH 1/4] spapr: Fix leak of CPU machine specific data
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Mon, 12 Oct 2020 17:19:47 +0200
Message-ID: <160251598735.796881.4119879780830238145.stgit@bahia.lan>
In-Reply-To: <160251562222.796881.8197386060416409319.stgit@bahia.lan>
References: <160251562222.796881.8197386060416409319.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 11:19:51
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
CPU thread object is leaked. Fix this by calling the dedicated helper
we have for that instead of simply unparenting the CPU object.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/spapr_cpu_core.c |   20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index b03620823adb..b6b217876750 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -181,6 +181,15 @@ static const VMStateDescription vmstate_spapr_cpu_stat=
e =3D {
     }
 };
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
 static void spapr_unrealize_vcpu(PowerPCCPU *cpu, SpaprCpuCore *sc)
 {
     if (!sc->pre_3_0_migration) {
@@ -188,7 +197,7 @@ static void spapr_unrealize_vcpu(PowerPCCPU *cpu, Spapr=
CpuCore *sc)
     }
     spapr_irq_cpu_intc_destroy(SPAPR_MACHINE(qdev_get_machine()), cpu);
     cpu_remove_sync(CPU(cpu));
-    object_unparent(OBJECT(cpu));
+    spapr_delete_vcpu(cpu, sc);
 }
=20
 /*
@@ -294,15 +303,6 @@ err:
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



