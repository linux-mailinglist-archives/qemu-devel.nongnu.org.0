Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A12462F5459
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 21:56:42 +0100 (CET)
Received: from localhost ([::1]:47100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kznC5-0007eP-Ki
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 15:56:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kzn9f-0005ua-GZ
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 15:54:11 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:38220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kzn9b-0000dA-53
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 15:54:11 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10DKrkh4077279;
 Wed, 13 Jan 2021 20:53:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references : mime-version : content-type : content-transfer-encoding;
 s=corp-2020-01-29; bh=6jA3XQ/tkRrersep6iNVezzmWRdEKZpHeC1Qb+W516c=;
 b=RC9ak+v5C2X06in+Z39YA6UuYftyTV9Bp4vlxqg/dT/BZMhxBsR6GLKLXdj1613Hrg9R
 HIZFpaQeDWcXD9UjTJd9hMHaZ6xtyMmEBcrC3rJWwbJn1LulGKBBOUpSoEUji8x+hocj
 A8pzjEbjM4y45c15rJAnBw07ixDkFcerCs8Lc+QiUOwVEzl1FYLO2rHs9ItbcjonuMqQ
 y5eqcLVkN2zUICGJ+85RHxzhx781whbY49HJQw+eeDdm65lrs6dnViHFRE4PLylzsz4x
 Nf16TibOQYA2DtqXHEGFQrytVfzZNdYOmn2mwFoweN2EU37wcUgvSQvErp+BWdl5exl1 Fg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 360kg1whgd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jan 2021 20:53:58 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10DKjfMJ187209;
 Wed, 13 Jan 2021 20:53:58 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 360ke9192a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jan 2021 20:53:58 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10DKrvGS022131;
 Wed, 13 Jan 2021 20:53:57 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 13 Jan 2021 12:53:57 -0800
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v18 06/20] multi-process: setup a machine object for remote
 device process
Date: Wed, 13 Jan 2021 15:53:25 -0500
Message-Id: <442dd452a6e94c03fb14945b655ced2c58b11600.1610570756.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1610570756.git.jag.raman@oracle.com>
References: <cover.1610570756.git.jag.raman@oracle.com>
In-Reply-To: <cover.1610570756.git.jag.raman@oracle.com>
References: <cover.1610570756.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9863
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101130126
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9863
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101130127
Received-SPF: pass client-ip=141.146.126.79; envelope-from=jag.raman@oracle.com;
 helo=aserp2130.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
 include/hw/remote/machine.h  | 27 +++++++++++++++++
 hw/remote/machine.c          | 70 ++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                  |  2 ++
 hw/meson.build               |  1 +
 hw/remote/meson.build        |  5 ++++
 6 files changed, 106 insertions(+)
 create mode 100644 include/hw/remote/machine.h
 create mode 100644 hw/remote/machine.c
 create mode 100644 hw/remote/meson.build

diff --git a/include/hw/pci-host/remote.h b/include/hw/pci-host/remote.h
index 06b8a83..3dcf6aa 100644
--- a/include/hw/pci-host/remote.h
+++ b/include/hw/pci-host/remote.h
@@ -24,6 +24,7 @@ struct RemotePCIHost {
 
     MemoryRegion *mr_pci_mem;
     MemoryRegion *mr_sys_io;
+    MemoryRegion *mr_sys_mem;
 };
 
 #endif
diff --git a/include/hw/remote/machine.h b/include/hw/remote/machine.h
new file mode 100644
index 0000000..bdfbca4
--- /dev/null
+++ b/include/hw/remote/machine.h
@@ -0,0 +1,27 @@
+/*
+ * Remote machine configuration
+ *
+ * Copyright © 2018, 2021 Oracle and/or its affiliates.
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
+struct RemoteMachineState {
+    MachineState parent_obj;
+
+    RemotePCIHost *host;
+};
+
+#define TYPE_REMOTE_MACHINE "x-remote-machine"
+OBJECT_DECLARE_SIMPLE_TYPE(RemoteMachineState, REMOTE_MACHINE)
+
+#endif
diff --git a/hw/remote/machine.c b/hw/remote/machine.c
new file mode 100644
index 0000000..9519a6c
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
+ * Copyright © 2018, 2021 Oracle and/or its affiliates.
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
index 45b999a..09aea01 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3189,6 +3189,8 @@ F: docs/devel/multi-process.rst
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


