Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D40542D92D7
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 06:32:28 +0100 (CET)
Received: from localhost ([::1]:37576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kogTD-0001i5-Tv
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 00:32:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kogEn-00070r-9p
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 00:17:33 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:40046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kogEj-0007KV-FP
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 00:17:33 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BE5EUYr007145;
 Mon, 14 Dec 2020 05:17:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references : mime-version : content-type : content-transfer-encoding;
 s=corp-2020-01-29; bh=OM0yNjwNy2E+fZaZ1PNHMgpX4OwxMSmfh+FO6mB7aA0=;
 b=in+Z/BJU6lQWXxxvV6pKoTBHcTo28y9D43CUbExxW2tUo0E/hUyMw/69lAPfHA6lLuxt
 4IZUUqOsqJ9awx6ZUPs49gDNghfOd/pSU5ifrAb0wlii7hz7plzKELsyzQedCdd8DFfj
 Ehv50dhWANkBBwfaHuC4rKOQwkS0Dekt9PckCywKpOZDYmMJOxDS8Ca5YXGA9suopTo/
 z9kK0ddms0y+Ay1Cam9F2ZyyvQDbFn/0TGlpPvXP8gTpVofgyUbZiTvKmJYYiNxbSwXs
 DMOOPlDLHm6z/B7P/Bz3Ab7XUa9IrofDgC702CmYKoXGQh3RRWqVnKAbkTMwl6v2J7OR nA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 35cn9r3chw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 14 Dec 2020 05:17:22 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BE5A3ti095209;
 Mon, 14 Dec 2020 05:15:22 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 35d7su0b1f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Dec 2020 05:15:22 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BE5FKgj030609;
 Mon, 14 Dec 2020 05:15:20 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 13 Dec 2020 21:15:18 -0800
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 06/19] multi-process: setup a machine object for remote
 device process
Date: Mon, 14 Dec 2020 00:14:46 -0500
Message-Id: <7e240536496de03cc3fdef9ac341b5aadd4de0da.1607922214.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1607922214.git.jag.raman@oracle.com>
References: <cover.1607922214.git.jag.raman@oracle.com>
In-Reply-To: <cover.1607922214.git.jag.raman@oracle.com>
References: <cover.1607922214.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9834
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012140040
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9834
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012140040
Received-SPF: pass client-ip=156.151.31.86; envelope-from=jag.raman@oracle.com;
 helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

x-remote-machine object sets up various subsystems of the remote
device process. Instantiate PCI host bridge object and initialize RAM, IO &
PCI memory regions.

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/pci-host/remote.h |  1 +
 include/hw/remote/machine.h  | 28 ++++++++++++++++++
 hw/remote/machine.c          | 70 ++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                  |  2 ++
 hw/meson.build               |  1 +
 hw/remote/meson.build        |  5 ++++
 6 files changed, 107 insertions(+)
 create mode 100644 include/hw/remote/machine.h
 create mode 100644 hw/remote/machine.c
 create mode 100644 hw/remote/meson.build

diff --git a/include/hw/pci-host/remote.h b/include/hw/pci-host/remote.h
index 2017422..c130c2e 100644
--- a/include/hw/pci-host/remote.h
+++ b/include/hw/pci-host/remote.h
@@ -25,6 +25,7 @@ typedef struct RemotePCIHost {
 
     MemoryRegion *mr_pci_mem;
     MemoryRegion *mr_sys_io;
+    MemoryRegion *mr_sys_mem;
 } RemotePCIHost;
 
 #endif
diff --git a/include/hw/remote/machine.h b/include/hw/remote/machine.h
new file mode 100644
index 0000000..d312972
--- /dev/null
+++ b/include/hw/remote/machine.h
@@ -0,0 +1,28 @@
+/*
+ * Remote machine configuration
+ *
+ * Copyright © 2018, 2020 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef REMOTE_MACHINE_H
+#define REMOTE_MACHINE_H
+
+#include "qom/object.h"
+#include "hw/boards.h"
+#include "hw/pci-host/remote.h"
+
+typedef struct RemoteMachineState {
+    MachineState parent_obj;
+
+    RemotePCIHost *host;
+} RemoteMachineState;
+
+#define TYPE_REMOTE_MACHINE "x-remote-machine"
+#define REMOTE_MACHINE(obj) \
+    OBJECT_CHECK(RemoteMachineState, (obj), TYPE_REMOTE_MACHINE)
+
+#endif
diff --git a/hw/remote/machine.c b/hw/remote/machine.c
new file mode 100644
index 0000000..17d07ec
--- /dev/null
+++ b/hw/remote/machine.c
@@ -0,0 +1,70 @@
+/*
+ * Machine for remote device
+ *
+ *  This machine type is used by the remote device process in multi-process
+ *  QEMU. QEMU device models depend on parent busses, interrupt controllers,
+ *  memory regions, etc. The remote machine type offers this environment so
+ *  that QEMU device models can be used as remote devices.
+ *
+ * Copyright © 2018, 2020 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+
+#include "hw/remote/machine.h"
+#include "exec/address-spaces.h"
+#include "exec/memory.h"
+#include "qapi/error.h"
+
+static void remote_machine_init(MachineState *machine)
+{
+    MemoryRegion *system_memory, *system_io, *pci_memory;
+    RemoteMachineState *s = REMOTE_MACHINE(machine);
+    RemotePCIHost *rem_host;
+
+    system_memory = get_system_memory();
+    system_io = get_system_io();
+
+    pci_memory = g_new(MemoryRegion, 1);
+    memory_region_init(pci_memory, NULL, "pci", UINT64_MAX);
+
+    rem_host = REMOTE_PCIHOST(qdev_new(TYPE_REMOTE_PCIHOST));
+
+    rem_host->mr_pci_mem = pci_memory;
+    rem_host->mr_sys_mem = system_memory;
+    rem_host->mr_sys_io = system_io;
+
+    s->host = rem_host;
+
+    object_property_add_child(OBJECT(s), "remote-pcihost", OBJECT(rem_host));
+    memory_region_add_subregion_overlap(system_memory, 0x0, pci_memory, -1);
+
+    qdev_realize(DEVICE(rem_host), sysbus_get_default(), &error_fatal);
+}
+
+static void remote_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->init = remote_machine_init;
+    mc->desc = "Experimental remote machine";
+}
+
+static const TypeInfo remote_machine = {
+    .name = TYPE_REMOTE_MACHINE,
+    .parent = TYPE_MACHINE,
+    .instance_size = sizeof(RemoteMachineState),
+    .class_init = remote_machine_class_init,
+};
+
+static void remote_machine_register_types(void)
+{
+    type_register_static(&remote_machine);
+}
+
+type_init(remote_machine_register_types);
diff --git a/MAINTAINERS b/MAINTAINERS
index 2d6ee6c..6ec2c26 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3155,6 +3155,8 @@ F: docs/devel/multi-process.rst
 F: docs/multi-process.rst
 F: hw/pci-host/remote.c
 F: include/hw/pci-host/remote.h
+F: hw/remote/machine.c
+F: include/hw/remote/machine.h
 
 Build and test automation
 -------------------------
diff --git a/hw/meson.build b/hw/meson.build
index 010de72..e615d72 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -56,6 +56,7 @@ subdir('moxie')
 subdir('nios2')
 subdir('openrisc')
 subdir('ppc')
+subdir('remote')
 subdir('riscv')
 subdir('rx')
 subdir('s390x')
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
new file mode 100644
index 0000000..197b038
--- /dev/null
+++ b/hw/remote/meson.build
@@ -0,0 +1,5 @@
+remote_ss = ss.source_set()
+
+remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('machine.c'))
+
+softmmu_ss.add_all(when: 'CONFIG_MULTIPROCESS', if_true: remote_ss)
-- 
1.8.3.1


