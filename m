Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2432F0C36
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 06:18:03 +0100 (CET)
Received: from localhost ([::1]:38040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kypac-0008JV-Qh
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 00:18:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kypRn-00051a-Vy
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 00:08:56 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:60656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kypRl-00078W-3p
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 00:08:55 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10B55VC4104712;
 Mon, 11 Jan 2021 05:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references : mime-version : content-type : content-transfer-encoding;
 s=corp-2020-01-29; bh=eK3Hv6KCDxIyCyOosTJfKgHbFIjfB3Y93xTV5eB+d6g=;
 b=RBkJoVcuL0MX4PnG041ua8E96DwT7QSRfiK0fkp8N9tm9xfx+jUkns7oUIS07KB69hCV
 cRJds38j0DLZfeTchfmVj/JRCsRQ21XDD+8mxIA2i/RW6RYqmjWKlpPj+sabVOGg3XOU
 wW1KsjAw+/aWuU9/xI0fmEG+XP6sDHH/dNUKnRrRe9E+muZ9e6WbcMf4MKGbgjnNRUFK
 /DKpq4ASjKb0OSM+7kVxObF50AmRfvWgPEnpM4n9yjNmhMB/gcX0lzNBCIitM6Gx1WxE
 odRfrvTTJq2HvAJdzuuQz53kWrd9G4Ef7l6Og/eXx4zo3J4599JK50rXSKN9PoAodCEo 8g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 35y4ekk5vm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 11 Jan 2021 05:08:47 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10B50eJh089875;
 Mon, 11 Jan 2021 05:06:46 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 35yp8pp78d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jan 2021 05:06:46 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10B56i01005392;
 Mon, 11 Jan 2021 05:06:44 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 10 Jan 2021 21:06:44 -0800
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 18/20] multi-process: create IOHUB object to handle irq
Date: Mon, 11 Jan 2021 00:06:03 -0500
Message-Id: <455ccf20199f92e750d3e4087c10422c62277b12.1610339529.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1610339529.git.jag.raman@oracle.com>
References: <cover.1610339529.git.jag.raman@oracle.com>
In-Reply-To: <cover.1610339529.git.jag.raman@oracle.com>
References: <cover.1610339529.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9860
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 suspectscore=0
 mlxscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101110030
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9860
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101110030
Received-SPF: pass client-ip=141.146.126.78; envelope-from=jag.raman@oracle.com;
 helo=aserp2120.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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

IOHUB object is added to manage PCI IRQs. It uses KVM_IRQFD
ioctl to create irqfd to injecting PCI interrupts to the guest.
IOHUB object forwards the irqfd to the remote process. Remote process
uses this fd to directly send interrupts to the guest, bypassing QEMU.

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/pci/pci_ids.h        |   3 +
 include/hw/remote/iohub.h       |  42 ++++++++++++++
 include/hw/remote/machine.h     |   2 +
 include/hw/remote/mpqemu-link.h |   1 +
 include/hw/remote/proxy.h       |   4 ++
 hw/remote/iohub.c               | 119 ++++++++++++++++++++++++++++++++++++++++
 hw/remote/machine.c             |  10 ++++
 hw/remote/message.c             |   4 ++
 hw/remote/mpqemu-link.c         |   5 ++
 hw/remote/proxy.c               |  56 +++++++++++++++++++
 MAINTAINERS                     |   2 +
 hw/remote/meson.build           |   1 +
 12 files changed, 249 insertions(+)
 create mode 100644 include/hw/remote/iohub.h
 create mode 100644 hw/remote/iohub.c

diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
index 11f8ab7..bd0c17d 100644
--- a/include/hw/pci/pci_ids.h
+++ b/include/hw/pci/pci_ids.h
@@ -192,6 +192,9 @@
 #define PCI_DEVICE_ID_SUN_SIMBA          0x5000
 #define PCI_DEVICE_ID_SUN_SABRE          0xa000
 
+#define PCI_VENDOR_ID_ORACLE             0x108e
+#define PCI_DEVICE_ID_REMOTE_IOHUB       0xb000
+
 #define PCI_VENDOR_ID_CMD                0x1095
 #define PCI_DEVICE_ID_CMD_646            0x0646
 
diff --git a/include/hw/remote/iohub.h b/include/hw/remote/iohub.h
new file mode 100644
index 0000000..0bf98e0
--- /dev/null
+++ b/include/hw/remote/iohub.h
@@ -0,0 +1,42 @@
+/*
+ * IO Hub for remote device
+ *
+ * Copyright © 2018, 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef REMOTE_IOHUB_H
+#define REMOTE_IOHUB_H
+
+#include "hw/pci/pci.h"
+#include "qemu/event_notifier.h"
+#include "qemu/thread-posix.h"
+#include "hw/remote/mpqemu-link.h"
+
+#define REMOTE_IOHUB_NB_PIRQS    PCI_DEVFN_MAX
+
+typedef struct ResampleToken {
+    void *iohub;
+    int pirq;
+} ResampleToken;
+
+typedef struct RemoteIOHubState {
+    PCIDevice d;
+    EventNotifier irqfds[REMOTE_IOHUB_NB_PIRQS];
+    EventNotifier resamplefds[REMOTE_IOHUB_NB_PIRQS];
+    unsigned int irq_level[REMOTE_IOHUB_NB_PIRQS];
+    ResampleToken token[REMOTE_IOHUB_NB_PIRQS];
+    QemuMutex irq_level_lock[REMOTE_IOHUB_NB_PIRQS];
+} RemoteIOHubState;
+
+int remote_iohub_map_irq(PCIDevice *pci_dev, int intx);
+void remote_iohub_set_irq(void *opaque, int pirq, int level);
+void process_set_irqfd_msg(PCIDevice *pci_dev, MPQemuMsg *msg);
+
+void remote_iohub_init(RemoteIOHubState *iohub);
+void remote_iohub_finalize(RemoteIOHubState *iohub);
+
+#endif
diff --git a/include/hw/remote/machine.h b/include/hw/remote/machine.h
index b92b2ce..2a2a33c 100644
--- a/include/hw/remote/machine.h
+++ b/include/hw/remote/machine.h
@@ -15,11 +15,13 @@
 #include "hw/boards.h"
 #include "hw/pci-host/remote.h"
 #include "io/channel.h"
+#include "hw/remote/iohub.h"
 
 struct RemoteMachineState {
     MachineState parent_obj;
 
     RemotePCIHost *host;
+    RemoteIOHubState iohub;
 };
 
 /* Used to pass to co-routine device and ioc. */
diff --git a/include/hw/remote/mpqemu-link.h b/include/hw/remote/mpqemu-link.h
index 6303e62..71d206f 100644
--- a/include/hw/remote/mpqemu-link.h
+++ b/include/hw/remote/mpqemu-link.h
@@ -39,6 +39,7 @@ typedef enum {
     MPQEMU_CMD_PCI_CFGREAD,
     MPQEMU_CMD_BAR_WRITE,
     MPQEMU_CMD_BAR_READ,
+    MPQEMU_CMD_SET_IRQFD,
     MPQEMU_CMD_MAX,
 } MPQemuCmd;
 
diff --git a/include/hw/remote/proxy.h b/include/hw/remote/proxy.h
index 12888b4..741def7 100644
--- a/include/hw/remote/proxy.h
+++ b/include/hw/remote/proxy.h
@@ -12,6 +12,7 @@
 #include "hw/pci/pci.h"
 #include "io/channel.h"
 #include "hw/remote/proxy-memory-listener.h"
+#include "qemu/event_notifier.h"
 
 #define TYPE_PCI_PROXY_DEV "x-pci-proxy-dev"
 OBJECT_DECLARE_SIMPLE_TYPE(PCIProxyDev, PCI_PROXY_DEV)
@@ -38,6 +39,9 @@ struct PCIProxyDev {
     QIOChannel *ioc;
     Error *migration_blocker;
     ProxyMemoryListener proxy_listener;
+    int virq;
+    EventNotifier intr;
+    EventNotifier resample;
     ProxyMemoryRegion region[PCI_NUM_REGIONS];
 };
 
diff --git a/hw/remote/iohub.c b/hw/remote/iohub.c
new file mode 100644
index 0000000..e4ff131
--- /dev/null
+++ b/hw/remote/iohub.c
@@ -0,0 +1,119 @@
+/*
+ * Remote IO Hub
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
+#include "hw/pci/pci.h"
+#include "hw/pci/pci_ids.h"
+#include "hw/pci/pci_bus.h"
+#include "qemu/thread.h"
+#include "hw/boards.h"
+#include "hw/remote/machine.h"
+#include "hw/remote/iohub.h"
+#include "qemu/main-loop.h"
+
+void remote_iohub_init(RemoteIOHubState *iohub)
+{
+    int pirq;
+
+    memset(&iohub->irqfds, 0, sizeof(iohub->irqfds));
+    memset(&iohub->resamplefds, 0, sizeof(iohub->resamplefds));
+
+    for (pirq = 0; pirq < REMOTE_IOHUB_NB_PIRQS; pirq++) {
+        qemu_mutex_init(&iohub->irq_level_lock[pirq]);
+        iohub->irq_level[pirq] = 0;
+        event_notifier_init_fd(&iohub->irqfds[pirq], -1);
+        event_notifier_init_fd(&iohub->resamplefds[pirq], -1);
+    }
+}
+
+void remote_iohub_finalize(RemoteIOHubState *iohub)
+{
+    int pirq;
+
+    for (pirq = 0; pirq < REMOTE_IOHUB_NB_PIRQS; pirq++) {
+        qemu_set_fd_handler(event_notifier_get_fd(&iohub->resamplefds[pirq]),
+                            NULL, NULL, NULL);
+        event_notifier_cleanup(&iohub->irqfds[pirq]);
+        event_notifier_cleanup(&iohub->resamplefds[pirq]);
+        qemu_mutex_destroy(&iohub->irq_level_lock[pirq]);
+    }
+}
+
+int remote_iohub_map_irq(PCIDevice *pci_dev, int intx)
+{
+    return pci_dev->devfn;
+}
+
+void remote_iohub_set_irq(void *opaque, int pirq, int level)
+{
+    RemoteIOHubState *iohub = opaque;
+
+    assert(pirq >= 0);
+    assert(pirq < PCI_DEVFN_MAX);
+
+    QEMU_LOCK_GUARD(&iohub->irq_level_lock[pirq]);
+
+    if (level) {
+        if (++iohub->irq_level[pirq] == 1) {
+            event_notifier_set(&iohub->irqfds[pirq]);
+        }
+    } else if (iohub->irq_level[pirq] > 0) {
+        iohub->irq_level[pirq]--;
+    }
+}
+
+static void intr_resample_handler(void *opaque)
+{
+    ResampleToken *token = opaque;
+    RemoteIOHubState *iohub = token->iohub;
+    int pirq, s;
+
+    pirq = token->pirq;
+
+    s = event_notifier_test_and_clear(&iohub->resamplefds[pirq]);
+
+    assert(s >= 0);
+
+    QEMU_LOCK_GUARD(&iohub->irq_level_lock[pirq]);
+
+    if (iohub->irq_level[pirq]) {
+        event_notifier_set(&iohub->irqfds[pirq]);
+    }
+}
+
+void process_set_irqfd_msg(PCIDevice *pci_dev, MPQemuMsg *msg)
+{
+    RemoteMachineState *machine = REMOTE_MACHINE(current_machine);
+    RemoteIOHubState *iohub = &machine->iohub;
+    int pirq, intx;
+
+    intx = pci_get_byte(pci_dev->config + PCI_INTERRUPT_PIN) - 1;
+
+    pirq = remote_iohub_map_irq(pci_dev, intx);
+
+    if (event_notifier_get_fd(&iohub->irqfds[pirq]) != -1) {
+        qemu_set_fd_handler(event_notifier_get_fd(&iohub->resamplefds[pirq]),
+                            NULL, NULL, NULL);
+        event_notifier_cleanup(&iohub->irqfds[pirq]);
+        event_notifier_cleanup(&iohub->resamplefds[pirq]);
+        memset(&iohub->token[pirq], 0, sizeof(ResampleToken));
+    }
+
+    event_notifier_init_fd(&iohub->irqfds[pirq], msg->fds[0]);
+    event_notifier_init_fd(&iohub->resamplefds[pirq], msg->fds[1]);
+
+    iohub->token[pirq].iohub = iohub;
+    iohub->token[pirq].pirq = pirq;
+
+    qemu_set_fd_handler(msg->fds[1], intr_resample_handler, NULL,
+                        &iohub->token[pirq]);
+}
diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index 9519a6c..c0ab4f5 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -20,12 +20,15 @@
 #include "exec/address-spaces.h"
 #include "exec/memory.h"
 #include "qapi/error.h"
+#include "hw/pci/pci_host.h"
+#include "hw/remote/iohub.h"
 
 static void remote_machine_init(MachineState *machine)
 {
     MemoryRegion *system_memory, *system_io, *pci_memory;
     RemoteMachineState *s = REMOTE_MACHINE(machine);
     RemotePCIHost *rem_host;
+    PCIHostState *pci_host;
 
     system_memory = get_system_memory();
     system_io = get_system_io();
@@ -45,6 +48,13 @@ static void remote_machine_init(MachineState *machine)
     memory_region_add_subregion_overlap(system_memory, 0x0, pci_memory, -1);
 
     qdev_realize(DEVICE(rem_host), sysbus_get_default(), &error_fatal);
+
+    pci_host = PCI_HOST_BRIDGE(rem_host);
+
+    remote_iohub_init(&s->iohub);
+
+    pci_bus_irqs(pci_host->bus, remote_iohub_set_irq, remote_iohub_map_irq,
+                 &s->iohub, REMOTE_IOHUB_NB_PIRQS);
 }
 
 static void remote_machine_class_init(ObjectClass *oc, void *data)
diff --git a/hw/remote/message.c b/hw/remote/message.c
index 25341d8..adab040 100644
--- a/hw/remote/message.c
+++ b/hw/remote/message.c
@@ -18,6 +18,7 @@
 #include "hw/pci/pci.h"
 #include "exec/memattrs.h"
 #include "hw/remote/memory.h"
+#include "hw/remote/iohub.h"
 
 static void process_config_write(QIOChannel *ioc, PCIDevice *dev,
                                  MPQemuMsg *msg, Error **errp);
@@ -65,6 +66,9 @@ void coroutine_fn mpqemu_remote_msg_loop_co(void *data)
         case MPQEMU_CMD_SYNC_SYSMEM:
             remote_sysmem_reconfig(&msg, &local_err);
             break;
+        case MPQEMU_CMD_SET_IRQFD:
+            process_set_irqfd_msg(pci_dev, &msg);
+            break;
         default:
             error_setg(&local_err,
                        "Unknown command (%d) received for device %s"
diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
index bcb32e0..4342245 100644
--- a/hw/remote/mpqemu-link.c
+++ b/hw/remote/mpqemu-link.c
@@ -254,6 +254,11 @@ bool mpqemu_msg_valid(MPQemuMsg *msg)
             return false;
         }
         break;
+    case MPQEMU_CMD_SET_IRQFD:
+        if (msg->size || (msg->num_fds != 2)) {
+            return false;
+        }
+        break;
     default:
         break;
     }
diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
index 472b2df..555b310 100644
--- a/hw/remote/proxy.c
+++ b/hw/remote/proxy.c
@@ -21,6 +21,57 @@
 #include "qemu/error-report.h"
 #include "hw/remote/proxy-memory-listener.h"
 #include "qom/object.h"
+#include "qemu/event_notifier.h"
+#include "sysemu/kvm.h"
+#include "util/event_notifier-posix.c"
+
+static void proxy_intx_update(PCIDevice *pci_dev)
+{
+    PCIProxyDev *dev = PCI_PROXY_DEV(pci_dev);
+    PCIINTxRoute route;
+    int pin = pci_get_byte(pci_dev->config + PCI_INTERRUPT_PIN) - 1;
+
+    if (dev->virq != -1) {
+        kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state, &dev->intr, dev->virq);
+        dev->virq = -1;
+    }
+
+    route = pci_device_route_intx_to_irq(pci_dev, pin);
+
+    dev->virq = route.irq;
+
+    if (dev->virq != -1) {
+        kvm_irqchip_add_irqfd_notifier_gsi(kvm_state, &dev->intr,
+                                           &dev->resample, dev->virq);
+    }
+}
+
+static void setup_irqfd(PCIProxyDev *dev)
+{
+    PCIDevice *pci_dev = PCI_DEVICE(dev);
+    MPQemuMsg msg;
+    Error *local_err = NULL;
+
+    event_notifier_init(&dev->intr, 0);
+    event_notifier_init(&dev->resample, 0);
+
+    memset(&msg, 0, sizeof(MPQemuMsg));
+    msg.cmd = MPQEMU_CMD_SET_IRQFD;
+    msg.num_fds = 2;
+    msg.fds[0] = event_notifier_get_fd(&dev->intr);
+    msg.fds[1] = event_notifier_get_fd(&dev->resample);
+    msg.size = 0;
+
+    if (!mpqemu_msg_send(&msg, dev->ioc, &local_err)) {
+        error_report_err(local_err);
+    }
+
+    dev->virq = -1;
+
+    proxy_intx_update(pci_dev);
+
+    pci_device_set_intx_routing_notifier(pci_dev, proxy_intx_update);
+}
 
 static void pci_proxy_dev_realize(PCIDevice *device, Error **errp)
 {
@@ -56,6 +107,8 @@ static void pci_proxy_dev_realize(PCIDevice *device, Error **errp)
     qio_channel_set_blocking(dev->ioc, true, NULL);
 
     proxy_memory_listener_configure(&dev->proxy_listener, dev->ioc);
+
+    setup_irqfd(dev);
 }
 
 static void pci_proxy_dev_exit(PCIDevice *pdev)
@@ -71,6 +124,9 @@ static void pci_proxy_dev_exit(PCIDevice *pdev)
     error_free(dev->migration_blocker);
 
     proxy_memory_listener_deconfigure(&dev->proxy_listener);
+
+    event_notifier_cleanup(&dev->intr);
+    event_notifier_cleanup(&dev->resample);
 }
 
 static void config_op_send(PCIProxyDev *pdev, uint32_t addr, uint32_t *val,
diff --git a/MAINTAINERS b/MAINTAINERS
index e2327e3..1f32a97 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3194,6 +3194,8 @@ F: hw/remote/proxy.c
 F: include/hw/remote/proxy.h
 F: hw/remote/proxy-memory-listener.c
 F: include/hw/remote/proxy-memory-listener.h
+F: hw/remote/iohub.c
+F: include/hw/remote/iohub.h
 
 Build and test automation
 -------------------------
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index 7f11be4..e6a5574 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -5,6 +5,7 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('mpqemu-link.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
+remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
 
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('memory.c'))
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy-memory-listener.c'))
-- 
1.8.3.1


