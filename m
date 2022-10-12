Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB905FC938
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 18:27:15 +0200 (CEST)
Received: from localhost ([::1]:43388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oieZf-0003HA-2k
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 12:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1oieU5-0003cP-ES; Wed, 12 Oct 2022 12:21:29 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1oieU2-00089B-UD; Wed, 12 Oct 2022 12:21:29 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29CGGHTK008251;
 Wed, 12 Oct 2022 16:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=cZ52o5YNLFu66sXFoGVHvYhCIAgIE2PL3wN34reigdc=;
 b=IQbLvqs1Tt7CukCWu0hC5tHQpTslrjoD/Ty1Tmdr86w9B6/UOyWcIRs2dpQy1JP2C72L
 Ifz4lLei/QbuhyP3MRNWTOBLNouQsDk19oScwwP90FT+pUsMrqpb1AixrMaY9DwZGxMH
 TzcjuLCncZnIX0hvZyujsy9Iz+OSMeGKg0fE8o4oTuo8NwroiCvgcN+q4lFXkfZ26rNJ
 ci8ElsXo+vzHMi0ZGIQme3bQ2TIlzJhNjns5RemE8CF62+2Q6tI29e83+HfBDeMQg/t7
 DhBvjUg+k0TZOquEfyzW9MIV/O2xL1cqxZzD6CTvY/WECef9j8orFITZofUPT53DUfo9 SQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k5uwqanwu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 16:21:20 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29CD60kG006359;
 Wed, 12 Oct 2022 16:21:19 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k5uwqanva-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 16:21:19 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29CG5kmA009903;
 Wed, 12 Oct 2022 16:21:17 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 3k30u94rh9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 16:21:16 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29CGLDt458655038
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Oct 2022 16:21:13 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98D25A405B;
 Wed, 12 Oct 2022 16:21:13 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1330A4054;
 Wed, 12 Oct 2022 16:21:12 +0000 (GMT)
Received: from li-c6ac47cc-293c-11b2-a85c-d421c8e4747b.ibm.com.com (unknown
 [9.171.34.168])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Oct 2022 16:21:12 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
Subject: [PATCH v10 1/9] s390x/cpu topology: core_id sets s390x CPU topology
Date: Wed, 12 Oct 2022 18:20:59 +0200
Message-Id: <20221012162107.91734-2-pmorel@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221012162107.91734-1-pmorel@linux.ibm.com>
References: <20221012162107.91734-1-pmorel@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9z8ooe_UQu5-O0SioNGgVP5Xxpm0DGyY
X-Proofpoint-GUID: zU5jus5cCIHpzCDKYYP4OYX4eaQ1uMRr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_07,2022-10-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210120106
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

In the S390x CPU topology the core_id specifies the CPU address
and the position of the core withing the topology.

Let's build the topology based on the core_id.
s390x/cpu topology: core_id sets s390x CPU topology

In the S390x CPU topology the core_id specifies the CPU address
and the position of the cpu withing the topology.

Let's build the topology based on the core_id.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
---
 include/hw/s390x/cpu-topology.h |  45 +++++++++++
 hw/s390x/cpu-topology.c         | 132 ++++++++++++++++++++++++++++++++
 hw/s390x/s390-virtio-ccw.c      |  21 +++++
 hw/s390x/meson.build            |   1 +
 4 files changed, 199 insertions(+)
 create mode 100644 include/hw/s390x/cpu-topology.h
 create mode 100644 hw/s390x/cpu-topology.c

diff --git a/include/hw/s390x/cpu-topology.h b/include/hw/s390x/cpu-topology.h
new file mode 100644
index 0000000000..66c171d0bc
--- /dev/null
+++ b/include/hw/s390x/cpu-topology.h
@@ -0,0 +1,45 @@
+/*
+ * CPU Topology
+ *
+ * Copyright 2022 IBM Corp.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or (at
+ * your option) any later version. See the COPYING file in the top-level
+ * directory.
+ */
+#ifndef HW_S390X_CPU_TOPOLOGY_H
+#define HW_S390X_CPU_TOPOLOGY_H
+
+#include "hw/qdev-core.h"
+#include "qom/object.h"
+
+typedef struct S390TopoContainer {
+    int active_count;
+} S390TopoContainer;
+
+#define S390_TOPOLOGY_CPU_IFL 0x03
+#define S390_TOPOLOGY_MAX_ORIGIN ((63 + S390_MAX_CPUS) / 64)
+typedef struct S390TopoTLE {
+    uint64_t mask[S390_TOPOLOGY_MAX_ORIGIN];
+} S390TopoTLE;
+
+struct S390Topology {
+    SysBusDevice parent_obj;
+    int cpus;
+    S390TopoContainer *socket;
+    S390TopoTLE *tle;
+    MachineState *ms;
+};
+
+#define TYPE_S390_CPU_TOPOLOGY "s390-topology"
+OBJECT_DECLARE_SIMPLE_TYPE(S390Topology, S390_CPU_TOPOLOGY)
+
+S390Topology *s390_get_topology(void);
+void s390_topology_new_cpu(int core_id);
+
+static inline bool s390_has_topology(void)
+{
+    return false;
+}
+
+#endif
diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
new file mode 100644
index 0000000000..42b22a1831
--- /dev/null
+++ b/hw/s390x/cpu-topology.c
@@ -0,0 +1,132 @@
+/*
+ * CPU Topology
+ *
+ * Copyright IBM Corp. 2022
+ * Author(s): Pierre Morel <pmorel@linux.ibm.com>
+
+ * This work is licensed under the terms of the GNU GPL, version 2 or (at
+ * your option) any later version. See the COPYING file in the top-level
+ * directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "hw/sysbus.h"
+#include "hw/qdev-properties.h"
+#include "hw/boards.h"
+#include "qemu/typedefs.h"
+#include "target/s390x/cpu.h"
+#include "hw/s390x/s390-virtio-ccw.h"
+#include "hw/s390x/cpu-topology.h"
+
+S390Topology *s390_get_topology(void)
+{
+    static S390Topology *s390Topology;
+
+    if (!s390Topology) {
+        s390Topology = S390_CPU_TOPOLOGY(
+            object_resolve_path(TYPE_S390_CPU_TOPOLOGY, NULL));
+    }
+
+    return s390Topology;
+}
+
+/*
+ * s390_topology_new_cpu:
+ * @core_id: the core ID is machine wide
+ *
+ * The topology returned by s390_get_topology(), gives us the CPU
+ * topology established by the -smp QEMU aruments.
+ * The core-id gives:
+ *  - the Container TLE (Topology List Entry) containing the CPU TLE.
+ *  - in the CPU TLE the origin, or offset of the first bit in the core mask
+ *  - the bit in the CPU TLE core mask
+ */
+void s390_topology_new_cpu(int core_id)
+{
+    S390Topology *topo = s390_get_topology();
+    int socket_id;
+    int bit, origin;
+
+    /* In the case no Topology is used nothing is to be done here */
+    if (!topo) {
+        return;
+    }
+
+    socket_id = core_id / topo->cpus;
+
+    /*
+     * At the core level, each CPU is represented by a bit in a 64bit
+     * unsigned long which represent the presence of a CPU.
+     * The firmware assume that all CPU in a CPU TLE have the same
+     * type, polarization and are all dedicated or shared.
+     * In that case the origin variable represents the offset of the first
+     * CPU in the CPU container.
+     * More than 64 CPUs per socket are represented in several CPU containers
+     * inside the socket container.
+     * The only reason to have several S390TopologyCores inside a socket is
+     * to have more than 64 CPUs.
+     * In that case the origin variable represents the offset of the first CPU
+     * in the CPU container. More than 64 CPUs per socket are represented in
+     * several CPU containers inside the socket container.
+     */
+    bit = core_id;
+    origin = bit / 64;
+    bit %= 64;
+    bit = 63 - bit;
+
+    topo->socket[socket_id].active_count++;
+    set_bit(bit, &topo->tle[socket_id].mask[origin]);
+}
+
+/**
+ * s390_topology_realize:
+ * @dev: the device state
+ * @errp: the error pointer (not used)
+ *
+ * During realize the machine CPU topology is initialized with the
+ * QEMU -smp parameters.
+ * The maximum count of CPU TLE in the all Topology can not be greater
+ * than the maximum CPUs.
+ */
+static void s390_topology_realize(DeviceState *dev, Error **errp)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    S390Topology *topo = S390_CPU_TOPOLOGY(dev);
+
+    topo->cpus = ms->smp.cores * ms->smp.threads;
+
+    topo->socket = g_new0(S390TopoContainer, ms->smp.sockets);
+    topo->tle = g_new0(S390TopoTLE, ms->smp.max_cpus);
+
+    topo->ms = ms;
+}
+
+/**
+ * topology_class_init:
+ * @oc: Object class
+ * @data: (not used)
+ *
+ * A very simple object we will need for reset and migration.
+ */
+static void topology_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = s390_topology_realize;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+}
+
+static const TypeInfo cpu_topology_info = {
+    .name          = TYPE_S390_CPU_TOPOLOGY,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(S390Topology),
+    .class_init    = topology_class_init,
+};
+
+static void topology_register(void)
+{
+    type_register_static(&cpu_topology_info);
+}
+type_init(topology_register);
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 03855c7231..aa99a62e42 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -43,6 +43,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/s390x/pv.h"
 #include "migration/blocker.h"
+#include "hw/s390x/cpu-topology.h"
 
 static Error *pv_mig_blocker;
 
@@ -94,6 +95,18 @@ static void s390_init_cpus(MachineState *machine)
     }
 }
 
+static void s390_init_topology(MachineState *machine)
+{
+    DeviceState *dev;
+
+    if (s390_has_topology()) {
+        dev = qdev_new(TYPE_S390_CPU_TOPOLOGY);
+        object_property_add_child(&machine->parent_obj,
+                                  TYPE_S390_CPU_TOPOLOGY, OBJECT(dev));
+        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    }
+}
+
 static const char *const reset_dev_types[] = {
     TYPE_VIRTUAL_CSS_BRIDGE,
     "s390-sclp-event-facility",
@@ -244,6 +257,9 @@ static void ccw_init(MachineState *machine)
     /* init memory + setup max page size. Required for the CPU model */
     s390_memory_init(machine->ram);
 
+    /* Adding the topology must be done before CPU intialization */
+    s390_init_topology(machine);
+
     /* init CPUs (incl. CPU model) early so s390_has_feature() works */
     s390_init_cpus(machine);
 
@@ -306,6 +322,11 @@ static void s390_cpu_plug(HotplugHandler *hotplug_dev,
     g_assert(!ms->possible_cpus->cpus[cpu->env.core_id].cpu);
     ms->possible_cpus->cpus[cpu->env.core_id].cpu = OBJECT(dev);
 
+    /* Inserting the CPU in the Topology can not fail */
+    if (s390_has_topology()) {
+        s390_topology_new_cpu(cpu->env.core_id);
+    }
+
     if (dev->hotplugged) {
         raise_irq_cpu_hotplug();
     }
diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
index f291016fee..653f6ab488 100644
--- a/hw/s390x/meson.build
+++ b/hw/s390x/meson.build
@@ -2,6 +2,7 @@ s390x_ss = ss.source_set()
 s390x_ss.add(files(
   'ap-bridge.c',
   'ap-device.c',
+  'cpu-topology.c',
   'ccw-device.c',
   'css-bridge.c',
   'css.c',
-- 
2.31.1


