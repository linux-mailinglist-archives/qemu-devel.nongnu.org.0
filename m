Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB66D3C8932
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 18:59:22 +0200 (CEST)
Received: from localhost ([::1]:48228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3iED-0002I7-QQ
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 12:59:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m3i8a-0007RT-AY; Wed, 14 Jul 2021 12:53:32 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:64234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m3i8X-00010m-8y; Wed, 14 Jul 2021 12:53:32 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16EGYIJX140000; Wed, 14 Jul 2021 12:53:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=Wn962Wg1tDJDC1jGrtIY9oAReCq9CHe1iqX4M0Ltw/g=;
 b=JPh4+AAAOMI8mfhawH9wrtYBk/zquQUACeAbOwQsecpJ4oSwsrbxfCJFEsreopdbRPOc
 QkCLP0c/juA8yt3F8LfnO5LsHH30SnN20YU1WdMnE+BM39oMmaw0YBm6X//mlMgKt/2+
 Ap/XLWIt6IfHENeduLjYmV1TgXb54T0aFb8kCATSSJkp1NnLi3h7GYd4AGpGefqcsxkU
 8o1f9bzO5V6PUACEwwZ0Yh/naqxBH3TNELzeswlUWy3oR1QAn/dVN5nI17fdxV6EipnQ
 7q+Ej0pjkhXp6m1eVxAlbw191PU9bpx9aQvZ4cFDp0T+eyQi0opWtAvg7s5zW+oo+Z4J 4A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39sph3f4tu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jul 2021 12:53:27 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16EGaNAI146699;
 Wed, 14 Jul 2021 12:53:26 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39sph3f4t0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jul 2021 12:53:26 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16EGrOOD032148;
 Wed, 14 Jul 2021 16:53:24 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 39q368904r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jul 2021 16:53:23 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16EGpCg233685960
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jul 2021 16:51:12 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 58532A405F;
 Wed, 14 Jul 2021 16:53:20 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD1ECA405C;
 Wed, 14 Jul 2021 16:53:19 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.181.132])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 14 Jul 2021 16:53:19 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH v1 3/9] s390x: cpu topology: CPU topology objects and
 structures
Date: Wed, 14 Jul 2021 18:53:10 +0200
Message-Id: <1626281596-31061-4-git-send-email-pmorel@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
References: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QaPgl4FzveaM5w6rigpg2LxkfwK4C4d7
X-Proofpoint-ORIG-GUID: 4Pa1wKKHlIdBKqRa5qmCrco_KVFDDISw
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-14_10:2021-07-14,
 2021-07-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 spamscore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2107140099
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, ehabkost@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, armbru@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, pbonzini@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We use new objects to have a dynamic administration of the CPU topology.
The highier level object is the S390 Node. In a first implementation
we will have only a single S390 node.
The node is built as a SYSBUS bridge during the CPU initialisation.

Every object under this single node will be build dynamically
immediately after a CPU has be realized if it is needed.
The CPU will fill the sockets once after the other, according to the
number of core per socket defined during the smp parsing, socket will fill
each book according to the book per sockect value and book each drawer,
always starting from the lowest ID to the greatest one.

Each CPU inside a socket will be represented by a bit in a 64bit
unsigned long. Set on plug and clear on unplug of a CPU.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
---
 hw/s390x/cpu-topology.c         | 576 ++++++++++++++++++++++++++++++++
 hw/s390x/meson.build            |   1 +
 hw/s390x/s390-virtio-ccw.c      |   4 +
 include/hw/s390x/cpu-topology.h |  91 +++++
 4 files changed, 672 insertions(+)
 create mode 100644 hw/s390x/cpu-topology.c
 create mode 100644 include/hw/s390x/cpu-topology.h

diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
new file mode 100644
index 0000000000..1224137f56
--- /dev/null
+++ b/hw/s390x/cpu-topology.c
@@ -0,0 +1,576 @@
+/*
+ * CPU Topology
+ *
+ * Copyright 2021 IBM Corp.
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
+#include "hw/s390x/cpu-topology.h"
+#include "hw/qdev-properties.h"
+#include "hw/boards.h"
+#include "qemu/typedefs.h"
+#include "hw/s390x/s390-virtio-ccw.h"
+
+static S390TopologyCores *s390_create_cores(S390TopologySocket *socket,
+                                            int origin)
+{
+    DeviceState *dev;
+    S390TopologyCores *cores;
+    const MachineState *ms = MACHINE(qdev_get_machine());
+
+    if (socket->bus->num_children >= ms->smp.cores) {
+        return NULL;
+    }
+
+    dev = qdev_new(TYPE_S390_TOPOLOGY_CORES);
+    qdev_realize_and_unref(dev, socket->bus, &error_fatal);
+
+    cores = S390_TOPOLOGY_CORES(dev);
+    cores->origin = origin;
+    socket->cnt += 1;
+
+    return cores;
+}
+
+static S390TopologySocket *s390_create_socket(S390TopologyBook *book, int id)
+{
+    DeviceState *dev;
+    S390TopologySocket *socket;
+    const MachineState *ms = MACHINE(qdev_get_machine());
+
+    if (book->bus->num_children >= ms->smp.sockets) {
+        return NULL;
+    }
+
+    dev = qdev_new(TYPE_S390_TOPOLOGY_SOCKET);
+    qdev_realize_and_unref(dev, book->bus, &error_fatal);
+
+    socket = S390_TOPOLOGY_SOCKET(dev);
+    socket->socket_id = id;
+    book->cnt++;
+
+    return socket;
+}
+
+static S390TopologyBook *s390_create_book(S390TopologyDrawer *drawer, int id)
+{
+    S390TopologyBook *book;
+    DeviceState *dev;
+    const MachineState *ms = MACHINE(qdev_get_machine());
+    S390CcwMachineState *s390ms = S390_CCW_MACHINE(ms);
+
+    if (drawer->bus->num_children >= s390ms->books) {
+        return NULL;
+    }
+
+    dev = qdev_new(TYPE_S390_TOPOLOGY_BOOK);
+    qdev_realize_and_unref(dev, drawer->bus, &error_fatal);
+
+    book = S390_TOPOLOGY_BOOK(dev);
+    book->book_id = id;
+    drawer->cnt++;
+
+    return book;
+}
+
+static S390TopologyDrawer *s390_create_drawer(S390TopologyNode *node, int id)
+{
+    S390TopologyDrawer *drawer;
+    DeviceState *dev;
+    const MachineState *ms = MACHINE(qdev_get_machine());
+    S390CcwMachineState *s390ms = S390_CCW_MACHINE(ms);
+
+    if (node->bus->num_children >= s390ms->drawers) {
+        return NULL;
+    }
+
+    dev = qdev_new(TYPE_S390_TOPOLOGY_DRAWER);
+    qdev_realize_and_unref(dev, node->bus, &error_fatal);
+
+    drawer = S390_TOPOLOGY_DRAWER(dev);
+    drawer->drawer_id = id;
+    node->cnt++;
+
+    return drawer;
+}
+
+static S390TopologyCores *s390_get_cores(S390TopologySocket *socket, int origin)
+{
+    S390TopologyCores *cores;
+    BusChild *kid;
+
+    QTAILQ_FOREACH(kid, &socket->bus->children, sibling) {
+        cores = S390_TOPOLOGY_CORES(kid->child);
+        if (cores->origin == origin) {
+            return cores;
+        }
+    }
+    return s390_create_cores(socket, origin);
+}
+
+static S390TopologySocket *s390_get_socket(S390TopologyBook *book,
+                                           int socket_id)
+{
+    S390TopologySocket *socket;
+    BusChild *kid;
+
+    QTAILQ_FOREACH(kid, &book->bus->children, sibling) {
+        socket = S390_TOPOLOGY_SOCKET(kid->child);
+        if (socket->socket_id == socket_id) {
+            return socket;
+        }
+    }
+    return s390_create_socket(book, socket_id);
+}
+
+static S390TopologyBook *s390_get_book(S390TopologyDrawer *drawer, int book_id)
+{
+    S390TopologyBook *book;
+    BusChild *kid;
+
+    QTAILQ_FOREACH(kid, &drawer->bus->children, sibling) {
+        book = S390_TOPOLOGY_BOOK(kid->child);
+        if (book->book_id == book_id) {
+            return book;
+        }
+    }
+    return s390_create_book(drawer, book_id);
+}
+
+static S390TopologyDrawer *s390_get_drawer(S390TopologyNode *node,
+                                           int drawer_id)
+{
+    S390TopologyDrawer *drawer;
+    BusChild *kid;
+
+    QTAILQ_FOREACH(kid, &node->bus->children, sibling) {
+        drawer = S390_TOPOLOGY_DRAWER(kid->child);
+        if (drawer->drawer_id == drawer_id) {
+            return drawer;
+        }
+    }
+    return s390_create_drawer(node, drawer_id);
+}
+
+/*
+ * s390_topology_new_cpu:
+ * @core_id: the core ID is machine wide
+ *
+ * We have a single node returned by s390_get_topology(),
+ * then we build the hierarchy on demand.
+ * Note that we do not destroy the hierarchy on error creating
+ * an entry in the topology, we just keept it empty.
+ * We do not need to worry about not finding a topology level
+ * entry this would have been catched during smp parsing.
+ */
+void s390_topology_new_cpu(int core_id)
+{
+    const MachineState *ms = MACHINE(qdev_get_machine());
+    S390CcwMachineState *s390ms = S390_CCW_MACHINE(ms);
+    S390TopologyDrawer *drawer;
+    S390TopologyBook *book;
+    S390TopologySocket *socket;
+    S390TopologyCores *cores;
+    S390TopologyNode *node;
+    int cores_per_drawer, cores_per_book;
+    int drawer_idx, book_idx, sock_idx;
+    int origin, bit;
+
+    cores_per_drawer = ms->smp.max_cpus / s390ms->drawers;
+    cores_per_book = cores_per_drawer / s390ms->books;
+
+    node = s390_get_topology();
+
+    drawer_idx = core_id / cores_per_drawer;
+    drawer = s390_get_drawer(node, drawer_idx);
+
+    book_idx = (core_id % cores_per_drawer) / cores_per_book;
+    book = s390_get_book(drawer, book_idx);
+
+    sock_idx = (core_id % cores_per_book) / ms->smp.cores;
+    socket = s390_get_socket(book, sock_idx);
+
+    /*
+     * We assert that all CPU are identical IFL, shared and
+     * horizontal topology, the only reason to have several
+     * S390TopologyCores is to have more than 64 CPUs.
+     */
+    origin = 64 * (core_id / 64);
+
+    cores = s390_get_cores(socket, origin);
+
+    bit = 63 - (core_id - origin);
+    set_bit(bit, &cores->mask);
+    cores->origin = origin;
+}
+
+/*
+ * Setting the first topology: 1 node, 1 drawer, 1 book, 1 socket
+ * This is enough for 64 cores if the topology is flat (single socket)
+ */
+void s390_topology_setup(MachineState *ms)
+{
+    DeviceState *dev;
+
+    /* Create NODE bridge device */
+    dev = qdev_new(TYPE_S390_TOPOLOGY_NODE);
+    object_property_add_child(qdev_get_machine(),
+                              TYPE_S390_TOPOLOGY_NODE, OBJECT(dev));
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+}
+
+S390TopologyNode *s390_get_topology(void)
+{
+    static S390TopologyNode *node;
+
+    if (!node) {
+        node = S390_TOPOLOGY_NODE(
+            object_resolve_path(TYPE_S390_TOPOLOGY_NODE, NULL));
+        assert(node != NULL);
+    }
+
+    return node;
+}
+
+/* --- CORES Definitions --- */
+
+static Property s390_topology_cores_properties[] = {
+    DEFINE_PROP_BOOL("dedicated", S390TopologyCores, dedicated, false),
+    DEFINE_PROP_UINT8("polarity", S390TopologyCores, polarity,
+                      S390_TOPOLOGY_POLARITY_H),
+    DEFINE_PROP_UINT8("cputype", S390TopologyCores, cputype,
+                      S390_TOPOLOGY_CPU_TYPE),
+    DEFINE_PROP_UINT16("origin", S390TopologyCores, origin, 0),
+    DEFINE_PROP_UINT64("mask", S390TopologyCores, mask, 0),
+    DEFINE_PROP_UINT8("id", S390TopologyCores, id, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void cpu_cores_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
+
+    device_class_set_props(dc, s390_topology_cores_properties);
+    hc->unplug = qdev_simple_device_unplug_cb;
+    dc->bus_type = TYPE_S390_TOPOLOGY_SOCKET_BUS;
+    dc->desc = "topology cpu entry";
+}
+
+static const TypeInfo cpu_cores_info = {
+    .name          = TYPE_S390_TOPOLOGY_CORES,
+    .parent        = TYPE_DEVICE,
+    .instance_size = sizeof(S390TopologyCores),
+    .class_init    = cpu_cores_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_HOTPLUG_HANDLER },
+        { }
+    }
+};
+
+/* --- SOCKETS Definitions --- */
+static Property s390_topology_socket_properties[] = {
+    DEFINE_PROP_UINT8("socket_id", S390TopologySocket, socket_id, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static char *socket_bus_get_dev_path(DeviceState *dev)
+{
+    S390TopologySocket *socket = S390_TOPOLOGY_SOCKET(dev);
+    DeviceState *book = dev->parent_bus->parent;
+    char *id = qdev_get_dev_path(book);
+    char *ret;
+
+    if (id) {
+        ret = g_strdup_printf("%s:%02d", id, socket->socket_id);
+        g_free(id);
+    } else {
+        ret = g_malloc(6);
+        snprintf(ret, 6, "_:%02d", socket->socket_id);
+    }
+
+    return ret;
+}
+
+static void socket_bus_class_init(ObjectClass *oc, void *data)
+{
+    BusClass *k = BUS_CLASS(oc);
+
+    k->get_dev_path = socket_bus_get_dev_path;
+    k->max_dev = S390_MAX_SOCKETS;
+}
+
+static const TypeInfo socket_bus_info = {
+    .name = TYPE_S390_TOPOLOGY_SOCKET_BUS,
+    .parent = TYPE_BUS,
+    .instance_size = 0,
+    .class_init = socket_bus_class_init,
+};
+
+static void s390_socket_device_realize(DeviceState *dev, Error **errp)
+{
+    S390TopologySocket *socket = S390_TOPOLOGY_SOCKET(dev);
+    BusState *bus;
+
+    bus = qbus_create(TYPE_S390_TOPOLOGY_SOCKET_BUS, dev,
+                      TYPE_S390_TOPOLOGY_SOCKET_BUS);
+    qbus_set_hotplug_handler(bus, OBJECT(dev));
+    socket->bus = bus;
+}
+
+static void socket_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
+
+    hc->unplug = qdev_simple_device_unplug_cb;
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
+    dc->bus_type = TYPE_S390_TOPOLOGY_BOOK_BUS;
+    dc->realize = s390_socket_device_realize;
+    device_class_set_props(dc, s390_topology_socket_properties);
+    dc->desc = "topology socket";
+}
+
+static const TypeInfo socket_info = {
+    .name          = TYPE_S390_TOPOLOGY_SOCKET,
+    .parent        = TYPE_DEVICE,
+    .instance_size = sizeof(S390TopologySocket),
+    .class_init    = socket_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_HOTPLUG_HANDLER },
+        { }
+    }
+};
+
+/* --- BOOKS Definitions --- */
+static Property s390_topology_book_properties[] = {
+    DEFINE_PROP_UINT8("book_id", S390TopologyBook, book_id, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static char *book_bus_get_dev_path(DeviceState *dev)
+{
+    S390TopologyBook *book = S390_TOPOLOGY_BOOK(dev);
+    DeviceState *drawer = dev->parent_bus->parent;
+    char *id = qdev_get_dev_path(drawer);
+    char *ret;
+
+    if (id) {
+        ret = g_strdup_printf("%s:%02d", id, book->book_id);
+        g_free(id);
+    } else {
+        ret = g_malloc(6);
+        snprintf(ret, 6, "_:%02d", book->book_id);
+    }
+
+    return ret;
+}
+
+static void book_bus_class_init(ObjectClass *oc, void *data)
+{
+    BusClass *k = BUS_CLASS(oc);
+
+    k->get_dev_path = book_bus_get_dev_path;
+    k->max_dev = S390_MAX_BOOKS;
+}
+
+static const TypeInfo book_bus_info = {
+    .name = TYPE_S390_TOPOLOGY_BOOK_BUS,
+    .parent = TYPE_BUS,
+    .instance_size = 0,
+    .class_init = book_bus_class_init,
+};
+
+static void s390_book_device_realize(DeviceState *dev, Error **errp)
+{
+    S390TopologyBook *book = S390_TOPOLOGY_BOOK(dev);
+    BusState *bus;
+
+    bus = qbus_create(TYPE_S390_TOPOLOGY_BOOK_BUS, dev,
+                      TYPE_S390_TOPOLOGY_BOOK_BUS);
+    qbus_set_hotplug_handler(bus, OBJECT(dev));
+    book->bus = bus;
+}
+
+static void book_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
+
+    hc->unplug = qdev_simple_device_unplug_cb;
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
+    dc->bus_type = TYPE_S390_TOPOLOGY_DRAWER_BUS;
+    dc->realize = s390_book_device_realize;
+    device_class_set_props(dc, s390_topology_book_properties);
+    dc->desc = "topology book";
+}
+
+static const TypeInfo book_info = {
+    .name          = TYPE_S390_TOPOLOGY_BOOK,
+    .parent        = TYPE_DEVICE,
+    .instance_size = sizeof(S390TopologyBook),
+    .class_init    = book_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_HOTPLUG_HANDLER },
+        { }
+    }
+};
+
+/* --- DRAWER Definitions --- */
+static Property s390_topology_drawer_properties[] = {
+    DEFINE_PROP_UINT8("drawer_id", S390TopologyDrawer, drawer_id, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static char *drawer_bus_get_dev_path(DeviceState *dev)
+{
+    S390TopologyDrawer *drawer = S390_TOPOLOGY_DRAWER(dev);
+    DeviceState *node = dev->parent_bus->parent;
+    char *id = qdev_get_dev_path(node);
+    char *ret;
+
+    if (id) {
+        ret = g_strdup_printf("%s:%02d", id, drawer->drawer_id);
+        g_free(id);
+    } else {
+        ret = g_malloc(6);
+        snprintf(ret, 6, "_:%02d", drawer->drawer_id);
+    }
+
+    return ret;
+}
+
+static void drawer_bus_class_init(ObjectClass *oc, void *data)
+{
+    BusClass *k = BUS_CLASS(oc);
+
+    k->get_dev_path = drawer_bus_get_dev_path;
+    k->max_dev = S390_MAX_DRAWERS;
+}
+
+static const TypeInfo drawer_bus_info = {
+    .name = TYPE_S390_TOPOLOGY_DRAWER_BUS,
+    .parent = TYPE_BUS,
+    .instance_size = 0,
+    .class_init = drawer_bus_class_init,
+};
+
+static void s390_drawer_device_realize(DeviceState *dev, Error **errp)
+{
+    S390TopologyDrawer *drawer = S390_TOPOLOGY_DRAWER(dev);
+    BusState *bus;
+
+    bus = qbus_create(TYPE_S390_TOPOLOGY_DRAWER_BUS, dev,
+                      TYPE_S390_TOPOLOGY_DRAWER_BUS);
+    qbus_set_hotplug_handler(bus, OBJECT(dev));
+    drawer->bus = bus;
+}
+
+static void drawer_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
+
+    hc->unplug = qdev_simple_device_unplug_cb;
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
+    dc->bus_type = TYPE_S390_TOPOLOGY_NODE_BUS;
+    dc->realize = s390_drawer_device_realize;
+    device_class_set_props(dc, s390_topology_drawer_properties);
+    dc->desc = "topology drawer";
+}
+
+static const TypeInfo drawer_info = {
+    .name          = TYPE_S390_TOPOLOGY_DRAWER,
+    .parent        = TYPE_DEVICE,
+    .instance_size = sizeof(S390TopologyDrawer),
+    .class_init    = drawer_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_HOTPLUG_HANDLER },
+        { }
+    }
+};
+
+/* --- NODE Definitions --- */
+
+/*
+ * Nodes are the first level of CPU topology we support
+ * only one NODE for the moment.
+ */
+static char *node_bus_get_dev_path(DeviceState *dev)
+{
+    return g_strdup_printf("00");
+}
+
+static void node_bus_class_init(ObjectClass *oc, void *data)
+{
+    BusClass *k = BUS_CLASS(oc);
+
+    k->get_dev_path = node_bus_get_dev_path;
+    k->max_dev = S390_MAX_NODES;
+}
+
+static const TypeInfo node_bus_info = {
+    .name = TYPE_S390_TOPOLOGY_NODE_BUS,
+    .parent = TYPE_BUS,
+    .instance_size = 0,
+    .class_init = node_bus_class_init,
+};
+
+static void s390_node_device_realize(DeviceState *dev, Error **errp)
+{
+    S390TopologyNode *node = S390_TOPOLOGY_NODE(dev);
+    BusState *bus;
+
+    /* Create NODE bus on NODE bridge device */
+    bus = qbus_create(TYPE_S390_TOPOLOGY_NODE_BUS, dev,
+                      TYPE_S390_TOPOLOGY_NODE_BUS);
+    node->bus = bus;
+
+    /* Enable hotplugging */
+    qbus_set_hotplug_handler(bus, OBJECT(dev));
+}
+
+static void node_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
+
+    hc->unplug = qdev_simple_device_unplug_cb;
+    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
+    dc->realize = s390_node_device_realize;
+    dc->desc = "topology node";
+}
+
+static const TypeInfo node_info = {
+    .name          = TYPE_S390_TOPOLOGY_NODE,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(S390TopologyNode),
+    .class_init    = node_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_HOTPLUG_HANDLER },
+        { }
+    }
+};
+
+static void topology_register(void)
+{
+    type_register_static(&cpu_cores_info);
+    type_register_static(&socket_bus_info);
+    type_register_static(&socket_info);
+    type_register_static(&book_bus_info);
+    type_register_static(&book_info);
+    type_register_static(&drawer_bus_info);
+    type_register_static(&drawer_info);
+    type_register_static(&node_bus_info);
+    type_register_static(&node_info);
+}
+
+type_init(topology_register);
diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
index 28484256ec..74678861cf 100644
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
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 42d9be7333..3708ad3c46 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -42,6 +42,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/s390x/pv.h"
 #include "migration/blocker.h"
+#include "hw/s390x/cpu-topology.h"
 
 static Error *pv_mig_blocker;
 
@@ -88,6 +89,7 @@ static void s390_init_cpus(MachineState *machine)
     /* initialize possible_cpus */
     mc->possible_cpu_arch_ids(machine);
 
+    s390_topology_setup(machine);
     for (i = 0; i < machine->smp.cpus; i++) {
         s390x_new_cpu(machine->cpu_type, i, &error_fatal);
     }
@@ -305,6 +307,8 @@ static void s390_cpu_plug(HotplugHandler *hotplug_dev,
     g_assert(!ms->possible_cpus->cpus[cpu->env.core_id].cpu);
     ms->possible_cpus->cpus[cpu->env.core_id].cpu = OBJECT(dev);
 
+    s390_topology_new_cpu(cpu->env.core_id);
+
     if (dev->hotplugged) {
         raise_irq_cpu_hotplug();
     }
diff --git a/include/hw/s390x/cpu-topology.h b/include/hw/s390x/cpu-topology.h
new file mode 100644
index 0000000000..64424cb457
--- /dev/null
+++ b/include/hw/s390x/cpu-topology.h
@@ -0,0 +1,91 @@
+/*
+ * CPU Topology
+ *
+ * Copyright 2021 IBM Corp.
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
+#define S390_TOPOLOGY_CPU_TYPE    0x03
+
+#define S390_TOPOLOGY_POLARITY_H  0x00
+#define S390_TOPOLOGY_POLARITY_VL 0x01
+#define S390_TOPOLOGY_POLARITY_VM 0x02
+#define S390_TOPOLOGY_POLARITY_VH 0x03
+
+#define TYPE_S390_TOPOLOGY_CORES "topology cores"
+struct S390TopologyCores {
+    DeviceState parent_obj;
+    uint8_t id;
+    bool dedicated;
+    uint8_t polarity;
+    uint8_t cputype;
+    uint16_t origin;
+    uint64_t mask;
+    int cnt;
+};
+typedef struct S390TopologyCores S390TopologyCores;
+OBJECT_DECLARE_SIMPLE_TYPE(S390TopologyCores, S390_TOPOLOGY_CORES)
+
+#define TYPE_S390_TOPOLOGY_SOCKET "topology socket"
+#define TYPE_S390_TOPOLOGY_SOCKET_BUS "socket-bus"
+struct S390TopologySocket {
+    DeviceState parent_obj;
+    BusState *bus;
+    uint8_t socket_id;
+    int cnt;
+};
+typedef struct S390TopologySocket S390TopologySocket;
+OBJECT_DECLARE_SIMPLE_TYPE(S390TopologySocket, S390_TOPOLOGY_SOCKET)
+#define S390_MAX_SOCKETS 8
+
+#define TYPE_S390_TOPOLOGY_BOOK "topology book"
+#define TYPE_S390_TOPOLOGY_BOOK_BUS "book-bus"
+struct S390TopologyBook {
+    DeviceState parent_obj;
+    BusState *bus;
+    uint8_t book_id;
+    int cnt;
+};
+typedef struct S390TopologyBook S390TopologyBook;
+OBJECT_DECLARE_SIMPLE_TYPE(S390TopologyBook, S390_TOPOLOGY_BOOK)
+#define S390_MAX_BOOKS 8
+
+#define TYPE_S390_TOPOLOGY_DRAWER "topology drawer"
+#define TYPE_S390_TOPOLOGY_DRAWER_BUS "drawer-bus"
+struct S390TopologyDrawer {
+    DeviceState parent_obj;
+    BusState *bus;
+    uint8_t drawer_id;
+    int cnt;
+};
+typedef struct S390TopologyDrawer S390TopologyDrawer;
+OBJECT_DECLARE_SIMPLE_TYPE(S390TopologyDrawer, S390_TOPOLOGY_DRAWER)
+#define S390_MAX_DRAWERS 5
+
+#define TYPE_S390_TOPOLOGY_NODE "topology node"
+#define TYPE_S390_TOPOLOGY_NODE_BUS "node-bus"
+struct S390TopologyNode {
+    SysBusDevice parent_obj;
+    BusState *bus;
+    uint8_t node_id;
+    int cnt;
+};
+typedef struct S390TopologyNode S390TopologyNode;
+OBJECT_DECLARE_SIMPLE_TYPE(S390TopologyNode, S390_TOPOLOGY_NODE)
+#define S390_MAX_NODES 1
+
+S390TopologyNode *s390_init_topology(void);
+
+S390TopologyNode *s390_get_topology(void);
+void s390_topology_setup(MachineState *ms);
+void s390_topology_new_cpu(int core_id);
+
+#endif
-- 
2.25.1


