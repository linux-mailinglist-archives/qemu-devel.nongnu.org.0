Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4361B5399
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Apr 2020 06:25:43 +0200 (CEST)
Received: from localhost ([::1]:35578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRTQk-0000ki-CN
	for lists+qemu-devel@lfdr.de; Thu, 23 Apr 2020 00:25:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49644)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <elena.ufimtseva@oracle.com>) id 1jRTGh-0000li-B4
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 00:15:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <elena.ufimtseva@oracle.com>) id 1jRTGf-0007jb-R8
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 00:15:19 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:39090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1jRTGf-0007f9-7K
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 00:15:17 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03N4D9td052362;
 Thu, 23 Apr 2020 04:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=8m8Du4JKiRrhY6hyc/MwtkrzutpRu31J7jJ2rjhfk6Y=;
 b=tb1wXmd9oyEUocYNsIxNYFempeDuRORxuEVR7uKM6xAZlGz3dCmGHAdU3O86nR8UTTFc
 4WCdXXukUMo/NheI5YQk0vvfrY+jx7J8VVEf+1PfLgyk9zux+ciO4znWuidyajzVqLi3
 RVqU1cnQb/Ra4kiwMxOe9E8LYUTpC4NN7egc2mzrTwWGlN3A1IGzvyaJHsHe/4qgAaW9
 +w9ileHkKmvfzmT2QHm5PF9nTZJS64JinnzKO+9T6/4RI+kjMCLFkV/2rxlYoQqf3Vy8
 AwzYa7iQ9Ne3UeeVsKowqBNPfLM6cLpYp+HOe7uwif2bVy6CNn9VPI2gZNlVfULFfpzV nw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 30jhyc5437-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Apr 2020 04:15:08 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03N4CZ8M156877;
 Thu, 23 Apr 2020 04:15:08 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 30gbbjty99-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Apr 2020 04:15:08 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 03N4F7Bc026652;
 Thu, 23 Apr 2020 04:15:07 GMT
Received: from flaka.hsd1.ca.comcast.net (/67.180.143.163)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 22 Apr 2020 21:15:06 -0700
From: elena.ufimtseva@oracle.com
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND v6 23/36] multi-process: create IOHUB object to handle
 irq
Date: Wed, 22 Apr 2020 21:13:58 -0700
Message-Id: <fc698970e58de0c205a736261e1ac9cc6f37acba.1587614626.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.GIT
In-Reply-To: <cover.1587614626.git.elena.ufimtseva@oracle.com>
References: <cover.1587614626.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9599
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0
 suspectscore=1 mlxlogscore=999 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004230027
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9599
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0 mlxscore=0
 clxscore=1015 suspectscore=1 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004230027
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=elena.ufimtseva@oracle.com; helo=userp2120.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/23 00:14:40
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Received-From: 156.151.31.85
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
 liran.alon@oracle.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 rth@twiddle.net, kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jagannathan Raman <jag.raman@oracle.com>

IOHUB object is added to manage PCI IRQs. It uses KVM_IRQFD
ioctl to create irqfd to injecting PCI interrupts to the guest.
IOHUB object forwards the irqfd to the remote process. Remote process
uses this fd to directly send interrupts to the guest, bypassing QEMU.

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
---
 MAINTAINERS                   |   2 +
 Makefile.target               |   1 +
 hw/Makefile.objs              |   2 -
 hw/proxy/Makefile.objs        |   1 -
 hw/proxy/qemu-proxy.c         |  52 ++++++++++++
 include/hw/pci/pci_ids.h      |   3 +
 include/hw/proxy/qemu-proxy.h |   8 ++
 include/io/mpqemu-link.h      |   8 ++
 include/remote/iohub.h        |  50 ++++++++++++
 include/remote/machine.h      |   2 +
 io/mpqemu-link.c              |   1 +
 remote/Makefile.objs          |   1 +
 remote/iohub.c                | 148 ++++++++++++++++++++++++++++++++++
 remote/machine.c              |  15 ++++
 remote/remote-main.c          |   4 +
 15 files changed, 295 insertions(+), 3 deletions(-)
 delete mode 100644 hw/proxy/Makefile.objs
 create mode 100644 include/remote/iohub.h
 create mode 100644 remote/iohub.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 9ebb46722a..198c9f69bc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2871,6 +2871,8 @@ F: hw/proxy/qemu-proxy.c
 F: include/hw/proxy/qemu-proxy.h
 F: include/hw/proxy/memory-sync.h
 F: hw/proxy/memory-sync.c
+F: include/remote/iohub.h
+F: remote/iohub.c
 
 Build and test automation
 -------------------------
diff --git a/Makefile.target b/Makefile.target
index c64d860895..b956ab24f6 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -129,6 +129,7 @@ obj-y += disas.o
 obj-$(call notempty,$(TARGET_XML_FILES)) += gdbstub-xml.o
 ifeq ($(TARGET_NAME)-$(CONFIG_MPQEMU)-$(CONFIG_USER_ONLY), x86_64-y-)
 obj-$(CONFIG_MPQEMU) += hw/proxy/memory-sync.o
+obj-$(CONFIG_MPQEMU) += hw/proxy/qemu-proxy.o
 endif
 LIBS := $(libs_cpu) $(LIBS)
 
diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index 7b489b12a5..af9235b6f2 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -45,8 +45,6 @@ endif
 common-obj-y += $(devices-dirs-y)
 obj-y += $(devices-dirs-y)
 
-common-obj-$(CONFIG_MPQEMU) += proxy/
-
 remote-pci-obj-$(CONFIG_MPQEMU) += core/
 remote-pci-obj-$(CONFIG_MPQEMU) += block/
 remote-pci-obj-$(CONFIG_MPQEMU) += pci/
diff --git a/hw/proxy/Makefile.objs b/hw/proxy/Makefile.objs
deleted file mode 100644
index eb81624cf8..0000000000
--- a/hw/proxy/Makefile.objs
+++ /dev/null
@@ -1 +0,0 @@
-common-obj-$(CONFIG_MPQEMU) += qemu-proxy.o
diff --git a/hw/proxy/qemu-proxy.c b/hw/proxy/qemu-proxy.c
index 2ac4c1528a..a78694736b 100644
--- a/hw/proxy/qemu-proxy.c
+++ b/hw/proxy/qemu-proxy.c
@@ -15,6 +15,9 @@
 #include "hw/pci/pci.h"
 #include "hw/proxy/memory-sync.h"
 #include "qom/object.h"
+#include "qemu/event_notifier.h"
+#include "sysemu/kvm.h"
+#include "util/event_notifier-posix.c"
 
 static int config_op_send(PCIProxyDev *dev, uint32_t addr, uint32_t *val, int l,
                           unsigned int op)
@@ -75,6 +78,53 @@ static void pci_proxy_write_config(PCIDevice *d, uint32_t addr, uint32_t val,
     config_op_send(PCI_PROXY_DEV(d), addr, &val, l, PCI_CONFIG_WRITE);
 }
 
+static void proxy_intx_update(PCIDevice *pci_dev)
+{
+    PCIProxyDev *dev = PCI_PROXY_DEV(pci_dev);
+    PCIINTxRoute route;
+    int pin = pci_get_byte(pci_dev->config + PCI_INTERRUPT_PIN) - 1;
+
+    if (dev->irqfd.fd) {
+        dev->irqfd.flags = KVM_IRQFD_FLAG_DEASSIGN;
+        (void) kvm_vm_ioctl(kvm_state, KVM_IRQFD, &dev->irqfd);
+        memset(&dev->irqfd, 0, sizeof(struct kvm_irqfd));
+    }
+
+    route = pci_device_route_intx_to_irq(pci_dev, pin);
+
+    dev->irqfd.fd = event_notifier_get_fd(&dev->intr);
+    dev->irqfd.resamplefd = event_notifier_get_fd(&dev->resample);
+    dev->irqfd.gsi = route.irq;
+    dev->irqfd.flags |= KVM_IRQFD_FLAG_RESAMPLE;
+    (void) kvm_vm_ioctl(kvm_state, KVM_IRQFD, &dev->irqfd);
+}
+
+static void setup_irqfd(PCIProxyDev *dev)
+{
+    PCIDevice *pci_dev = PCI_DEVICE(dev);
+    MPQemuMsg msg;
+
+    event_notifier_init(&dev->intr, 0);
+    event_notifier_init(&dev->resample, 0);
+
+    memset(&msg, 0, sizeof(MPQemuMsg));
+    msg.cmd = SET_IRQFD;
+    msg.num_fds = 2;
+    msg.fds[0] = event_notifier_get_fd(&dev->intr);
+    msg.fds[1] = event_notifier_get_fd(&dev->resample);
+    msg.data1.set_irqfd.intx =
+        pci_get_byte(pci_dev->config + PCI_INTERRUPT_PIN) - 1;
+    msg.size = sizeof(msg.data1);
+
+    mpqemu_msg_send(&msg, dev->mpqemu_link->dev);
+
+    memset(&dev->irqfd, 0, sizeof(struct kvm_irqfd));
+
+    proxy_intx_update(pci_dev);
+
+    pci_device_set_intx_routing_notifier(pci_dev, proxy_intx_update);
+}
+
 static void proxy_set_socket(Object *obj, const char *str, Error **errp)
 {
     PCIProxyDev *pdev = PCI_PROXY_DEV(obj);
@@ -144,6 +194,8 @@ static void pci_proxy_dev_realize(PCIDevice *device, Error **errp)
     dev->sync = REMOTE_MEM_SYNC(object_new(TYPE_MEMORY_LISTENER));
 
     configure_memory_sync(dev->sync, dev->mpqemu_link);
+
+    setup_irqfd(dev);
 }
 
 static void pci_proxy_dev_class_init(ObjectClass *klass, void *data)
diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
index 11f8ab7149..bd0c17dc78 100644
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
 
diff --git a/include/hw/proxy/qemu-proxy.h b/include/hw/proxy/qemu-proxy.h
index 6d14876ba9..0d8ec6d686 100644
--- a/include/hw/proxy/qemu-proxy.h
+++ b/include/hw/proxy/qemu-proxy.h
@@ -12,9 +12,12 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 
+#include <linux/kvm.h>
+
 #include "io/mpqemu-link.h"
 #include "hw/pci/pci.h"
 #include "hw/proxy/memory-sync.h"
+#include "qemu/event_notifier.h"
 
 #define TYPE_PCI_PROXY_DEV "pci-proxy-dev"
 
@@ -47,6 +50,11 @@ struct PCIProxyDev {
 
     RemoteMemSync *sync;
 
+    struct kvm_irqfd irqfd;
+
+    EventNotifier intr;
+    EventNotifier resample;
+
     int socket;
 
     ProxyMemoryRegion region[PCI_NUM_REGIONS];
diff --git a/include/io/mpqemu-link.h b/include/io/mpqemu-link.h
index 41cf092f9e..14e4be2bd0 100644
--- a/include/io/mpqemu-link.h
+++ b/include/io/mpqemu-link.h
@@ -33,6 +33,8 @@
  * SYNC_SYSMEM      Shares QEMU's RAM with remote device's RAM
  * BAR_WRITE        Writes to PCI BAR region
  * BAR_READ         Reads from PCI BAR region
+ * SET_IRQFD        Sets the IRQFD to be used to raise interrupts directly
+ *                  from remote device
  *
  * proc_cmd_t enum type to specify the command to be executed on the remote
  * device.
@@ -45,6 +47,7 @@ typedef enum {
     PCI_CONFIG_READ,
     BAR_WRITE,
     BAR_READ,
+    SET_IRQFD,
     MAX,
 } mpqemu_cmd_t;
 
@@ -81,6 +84,10 @@ typedef struct {
  *
  */
 
+typedef struct {
+    int intx;
+} set_irqfd_msg_t;
+
 typedef struct {
     mpqemu_cmd_t cmd;
     int bytestream;
@@ -90,6 +97,7 @@ typedef struct {
         uint64_t u64;
         sync_sysmem_msg_t sync_sysmem;
         bar_access_msg_t bar_access;
+        set_irqfd_msg_t set_irqfd;
     } data1;
 
     int fds[REMOTE_MAX_FDS];
diff --git a/include/remote/iohub.h b/include/remote/iohub.h
new file mode 100644
index 0000000000..7a488a8c38
--- /dev/null
+++ b/include/remote/iohub.h
@@ -0,0 +1,50 @@
+/*
+ * IO Hub for remote device
+ *
+ * Copyright © 2018, 2020 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef REMOTE_IOHUB_H
+#define REMOTE_IOHUB_H
+
+#include <sys/types.h>
+
+#include "qemu/osdep.h"
+#include "hw/pci/pci.h"
+#include "qemu/event_notifier.h"
+#include "qemu/thread-posix.h"
+#include "io/mpqemu-link.h"
+
+#define REMOTE_IOHUB_NB_PIRQS    8
+
+#define REMOTE_IOHUB_DEV         31
+#define REMOTE_IOHUB_FUNC        0
+
+#define TYPE_REMOTE_IOHUB_DEVICE "remote-iohub"
+#define REMOTE_IOHUB_DEVICE(obj) \
+    OBJECT_CHECK(RemoteIOHubState, (obj), TYPE_REMOTE_IOHUB_DEVICE)
+
+typedef struct ResampleToken {
+    void *iohub;
+    int pirq;
+} ResampleToken;
+
+typedef struct RemoteIOHubState {
+    PCIDevice d;
+    uint8_t irq_num[PCI_SLOT_MAX][PCI_NUM_PINS];
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
+#endif
diff --git a/include/remote/machine.h b/include/remote/machine.h
index 7e9bdbe28e..300394a546 100644
--- a/include/remote/machine.h
+++ b/include/remote/machine.h
@@ -16,11 +16,13 @@
 #include "hw/boards.h"
 #include "remote/pcihost.h"
 #include "qemu/notify.h"
+#include "remote/iohub.h"
 
 typedef struct RemMachineState {
     MachineState parent_obj;
 
     RemPCIHost *host;
+    RemoteIOHubState *iohub;
 } RemMachineState;
 
 #define TYPE_REMOTE_MACHINE "remote-machine"
diff --git a/io/mpqemu-link.c b/io/mpqemu-link.c
index 5cb93fc47b..ea519a980e 100644
--- a/io/mpqemu-link.c
+++ b/io/mpqemu-link.c
@@ -389,6 +389,7 @@ bool mpqemu_msg_valid(MPQemuMsg *msg)
         break;
     case BAR_WRITE:
     case BAR_READ:
+    case SET_IRQFD:
         if (msg->size != sizeof(msg->data1)) {
             return false;
         }
diff --git a/remote/Makefile.objs b/remote/Makefile.objs
index 55f405d048..ed3e5bd8c4 100644
--- a/remote/Makefile.objs
+++ b/remote/Makefile.objs
@@ -2,3 +2,4 @@ remote-pci-obj-$(CONFIG_MPQEMU) += remote-main.o
 remote-pci-obj-$(CONFIG_MPQEMU) += pcihost.o
 remote-pci-obj-$(CONFIG_MPQEMU) += machine.o
 remote-pci-obj-$(CONFIG_MPQEMU) += ../util/machine-notify.o
+remote-pci-obj-$(CONFIG_MPQEMU) += iohub.o
diff --git a/remote/iohub.c b/remote/iohub.c
new file mode 100644
index 0000000000..a991a4e112
--- /dev/null
+++ b/remote/iohub.c
@@ -0,0 +1,148 @@
+/*
+ * Remote IO Hub
+ *
+ * Copyright © 2018, 2020 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include <sys/types.h>
+
+#include "qemu/osdep.h"
+#include "hw/pci/pci.h"
+#include "hw/pci/pci_ids.h"
+#include "hw/pci/pci_bus.h"
+#include "remote/iohub.h"
+#include "qemu/thread.h"
+#include "hw/boards.h"
+#include "remote/machine.h"
+#include "qemu/main-loop.h"
+
+static void remote_iohub_initfn(Object *obj)
+{
+    RemoteIOHubState *iohub = REMOTE_IOHUB_DEVICE(obj);
+    int slot, intx, pirq;
+
+    memset(&iohub->irqfds, 0, sizeof(iohub->irqfds));
+    memset(&iohub->resamplefds, 0, sizeof(iohub->resamplefds));
+
+    for (slot = 0; slot < PCI_SLOT_MAX; slot++) {
+        for (intx = 0; intx < PCI_NUM_PINS; intx++) {
+            iohub->irq_num[slot][intx] = (slot + intx) % 4 + 4;
+        }
+    }
+
+    for (pirq = 0; pirq < REMOTE_IOHUB_NB_PIRQS; pirq++) {
+        qemu_mutex_init(&iohub->irq_level_lock[pirq]);
+        iohub->irq_level[pirq] = 0;
+    }
+}
+
+static void remote_iohub_class_init(ObjectClass *klass, void *data)
+{
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+    k->vendor_id = PCI_VENDOR_ID_ORACLE;
+    k->device_id = PCI_DEVICE_ID_REMOTE_IOHUB;
+}
+
+static const TypeInfo remote_iohub_info = {
+    .name       = TYPE_REMOTE_IOHUB_DEVICE,
+    .parent     = TYPE_PCI_DEVICE,
+    .instance_size = sizeof(RemoteIOHubState),
+    .instance_init = remote_iohub_initfn,
+    .class_init  = remote_iohub_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { }
+    }
+};
+
+static void remote_iohub_register(void)
+{
+    type_register_static(&remote_iohub_info);
+}
+
+type_init(remote_iohub_register);
+
+int remote_iohub_map_irq(PCIDevice *pci_dev, int intx)
+{
+    BusState *bus = qdev_get_parent_bus(&pci_dev->qdev);
+    PCIBus *pci_bus = PCI_BUS(bus);
+    PCIDevice *pci_iohub =
+        pci_bus->devices[PCI_DEVFN(REMOTE_IOHUB_DEV, REMOTE_IOHUB_FUNC)];
+    RemoteIOHubState *iohub = REMOTE_IOHUB_DEVICE(pci_iohub);
+
+    return iohub->irq_num[PCI_SLOT(pci_dev->devfn)][intx];
+}
+
+/*
+ * TODO: Using lock to set the interrupt level could become a
+ *       performance bottleneck. Check if atomic arithmetic
+ *       is possible.
+ */
+void remote_iohub_set_irq(void *opaque, int pirq, int level)
+{
+    RemoteIOHubState *iohub = opaque;
+
+    assert(pirq >= 0);
+    assert(pirq < REMOTE_IOHUB_NB_PIRQS);
+
+    qemu_mutex_lock(&iohub->irq_level_lock[pirq]);
+
+    if (level) {
+        if (++iohub->irq_level[pirq] == 1) {
+            event_notifier_set(&iohub->irqfds[pirq]);
+        }
+    } else if (iohub->irq_level[pirq] > 0) {
+        iohub->irq_level[pirq]--;
+    }
+
+    qemu_mutex_unlock(&iohub->irq_level_lock[pirq]);
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
+    qemu_mutex_lock(&iohub->irq_level_lock[pirq]);
+
+    if (iohub->irq_level[pirq]) {
+        event_notifier_set(&iohub->irqfds[pirq]);
+    }
+
+    qemu_mutex_unlock(&iohub->irq_level_lock[pirq]);
+}
+
+void process_set_irqfd_msg(PCIDevice *pci_dev, MPQemuMsg *msg)
+{
+    RemMachineState *machine = REMOTE_MACHINE(current_machine);
+    RemoteIOHubState *iohub = machine->iohub;
+    int pirq = remote_iohub_map_irq(pci_dev, msg->data1.set_irqfd.intx);
+
+    assert(msg->num_fds == 2);
+
+    if (event_notifier_get_fd(&iohub->irqfds[pirq]) != -1) {
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
diff --git a/remote/machine.c b/remote/machine.c
index 97e4f194ea..d529f68660 100644
--- a/remote/machine.c
+++ b/remote/machine.c
@@ -25,12 +25,16 @@
 #include "qemu-common.h"
 #include "sysemu/sysemu.h"
 #include "qemu/notify.h"
+#include "hw/pci/pci_host.h"
+#include "remote/iohub.h"
 
 static void remote_machine_init(Object *obj)
 {
     RemMachineState *s = REMOTE_MACHINE(obj);
     RemPCIHost *rem_host;
     MemoryRegion *system_memory, *system_io, *pci_memory;
+    PCIHostState *pci_host;
+    PCIDevice *pci_dev;
 
     Error *error_abort = NULL;
 
@@ -67,6 +71,17 @@ static void remote_machine_init(Object *obj)
     qemu_mutex_unlock_iothread();
 
     qdev_init_nofail(DEVICE(rem_host));
+
+    pci_host = PCI_HOST_BRIDGE(rem_host);
+    pci_dev = pci_create_simple_multifunction(pci_host->bus,
+                                              PCI_DEVFN(REMOTE_IOHUB_DEV,
+                                                        REMOTE_IOHUB_FUNC),
+                                              true, TYPE_REMOTE_IOHUB_DEVICE);
+
+    s->iohub = REMOTE_IOHUB_DEVICE(pci_dev);
+
+    pci_bus_irqs(pci_host->bus, remote_iohub_set_irq, remote_iohub_map_irq,
+                 s->iohub, REMOTE_IOHUB_NB_PIRQS);
 }
 
 static const TypeInfo remote_machine = {
diff --git a/remote/remote-main.c b/remote/remote-main.c
index 90f241064f..7cc1a60c3d 100644
--- a/remote/remote-main.c
+++ b/remote/remote-main.c
@@ -36,6 +36,7 @@
 #include "remote/remote-common.h"
 #include "exec/memattrs.h"
 #include "exec/address-spaces.h"
+#include "remote/iohub.h"
 
 static void process_msg(GIOCondition cond, MPQemuLinkState *link,
                         MPQemuChannel *chan);
@@ -242,6 +243,9 @@ static void process_msg(GIOCondition cond, MPQemuLinkState *link,
             goto finalize_loop;
         }
         break;
+    case SET_IRQFD:
+        process_set_irqfd_msg(LINK_TO_DEV(link), msg);
+        break;
     default:
         error_setg(&err, "Unknown command in %s", print_pid_exec(pid_exec));
         goto finalize_loop;
-- 
2.25.GIT


