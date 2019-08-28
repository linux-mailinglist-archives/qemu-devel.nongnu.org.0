Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 129E8A09EA
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 20:48:22 +0200 (CEST)
Received: from localhost ([::1]:39814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i32zU-0008Kb-SJ
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 14:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33337)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1i32sI-0002GS-8K
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 14:40:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1i32sH-0003Yj-45
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 14:40:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:19497)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1i32sG-0003XO-Sn
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 14:40:53 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 032595AFDE;
 Wed, 28 Aug 2019 18:40:51 +0000 (UTC)
Received: from localhost (ovpn-116-60.gru2.redhat.com [10.97.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF37A5D717;
 Wed, 28 Aug 2019 18:40:47 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>,
 Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 28 Aug 2019 15:40:20 -0300
Message-Id: <20190828184026.5840-7-ehabkost@redhat.com>
In-Reply-To: <20190828184026.5840-1-ehabkost@redhat.com>
References: <20190828184026.5840-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Wed, 28 Aug 2019 18:40:51 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v6 06/12] numa: Introduce
 MachineClass::auto_enable_numa for implicit NUMA node
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
Cc: Tao Xu <tao3.xu@intel.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tao Xu <tao3.xu@intel.com>

Add MachineClass::auto_enable_numa field. When it is true, a NUMA node
is expected to be created implicitly.

Acked-by: David Gibson <david@gibson.dropbear.id.au>
Suggested-by: Igor Mammedov <imammedo@redhat.com>
Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Tao Xu <tao3.xu@intel.com>
Message-Id: <20190805071302.6260-1-tao3.xu@intel.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/hw/boards.h | 1 +
 hw/core/numa.c      | 9 +++++++--
 hw/ppc/spapr.c      | 9 +--------
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 2289536e48..481e69388e 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -221,6 +221,7 @@ struct MachineClass {
     bool smbus_no_migration_support;
     bool nvdimm_supported;
     bool numa_mem_supported;
+    bool auto_enable_numa;
=20
     HotplugHandler *(*get_hotplug_handler)(MachineState *machine,
                                            DeviceState *dev);
diff --git a/hw/core/numa.c b/hw/core/numa.c
index 4dfec5c95b..1cbaf590af 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -378,9 +378,14 @@ void numa_complete_configuration(MachineState *ms)
      *   guest tries to use it with that drivers.
      *
      * Enable NUMA implicitly by adding a new NUMA node automatically.
+     *
+     * Or if MachineClass::auto_enable_numa is true and no NUMA nodes,
+     * assume there is just one node with whole RAM.
      */
-    if (ms->ram_slots > 0 && ms->numa_state->num_nodes =3D=3D 0 &&
-        mc->auto_enable_numa_with_memhp) {
+    if (ms->numa_state->num_nodes =3D=3D 0 &&
+        ((ms->ram_slots > 0 &&
+        mc->auto_enable_numa_with_memhp) ||
+        mc->auto_enable_numa)) {
             NumaNodeOptions node =3D { };
             parse_numa_node(ms, &node, &error_abort);
     }
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index a9cd350f0d..9e1768a095 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -405,14 +405,6 @@ static int spapr_populate_memory(SpaprMachineState *=
spapr, void *fdt)
     hwaddr mem_start, node_size;
     int i, nb_nodes =3D machine->numa_state->num_nodes;
     NodeInfo *nodes =3D machine->numa_state->nodes;
-    NodeInfo ramnode;
-
-    /* No NUMA nodes, assume there is just one node with whole RAM */
-    if (!nb_nodes) {
-        nb_nodes =3D 1;
-        ramnode.node_mem =3D machine->ram_size;
-        nodes =3D &ramnode;
-    }
=20
     for (i =3D 0, mem_start =3D 0; i < nb_nodes; ++i) {
         if (!nodes[i].node_mem) {
@@ -4457,6 +4449,7 @@ static void spapr_machine_class_init(ObjectClass *o=
c, void *data)
      */
     mc->numa_mem_align_shift =3D 28;
     mc->numa_mem_supported =3D true;
+    mc->auto_enable_numa =3D true;
=20
     smc->default_caps.caps[SPAPR_CAP_HTM] =3D SPAPR_CAP_OFF;
     smc->default_caps.caps[SPAPR_CAP_VSX] =3D SPAPR_CAP_ON;
--=20
2.21.0


