Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7101237A0FA
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 09:40:45 +0200 (CEST)
Received: from localhost ([::1]:35548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgN0W-0002ys-Fz
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 03:40:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1lgMvO-0004XS-SF; Tue, 11 May 2021 03:35:26 -0400
Received: from mx2.suse.de ([195.135.220.15]:45130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1lgMvM-0002d9-I6; Tue, 11 May 2021 03:35:26 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 600F8AED6;
 Tue, 11 May 2021 07:35:21 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Keith Busch <keith.busch@wdc.com>
Subject: [PATCH] hw/block/nvme: re-enable NVMe PCI hotplug
Date: Tue, 11 May 2021 09:35:11 +0200
Message-Id: <20210511073511.32511-1-hare@suse.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=hare@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Minwoo Im <minwoo.im.dev@gmail.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ever since commit e570768566 ("hw/block/nvme: support for shared
namespace in subsystem") NVMe PCI hotplug is broken, as the PCI
hotplug infrastructure will only work for the nvme devices (which
are PCI devices), but not for any attached namespaces.
So when re-adding the NVMe PCI device via 'device_add' the NVMe
controller is added, but all namespaces are missing.
This patch adds device hotplug hooks for NVMe namespaces, such that one
can call 'device_add nvme-ns' to (re-)attach the namespaces after
the PCI NVMe device 'device_add nvme' hotplug call.

Fixes: e570768566 ("hw/block/nvme: support for shared namespace in subsystem")
Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 capstone               |  2 +-
 hw/block/nvme-ns.c     | 31 ++++++++++++++++++++++
 hw/block/nvme-subsys.c | 12 +++++++++
 hw/block/nvme-subsys.h |  1 +
 hw/block/nvme.c        | 60 +++++++++++++++++++++++++++++++-----------
 hw/block/nvme.h        |  1 +
 roms/SLOF              |  2 +-
 roms/openbios          |  2 +-
 roms/u-boot            |  2 +-
 9 files changed, 93 insertions(+), 20 deletions(-)

diff --git a/capstone b/capstone
index f8b1b83301..22ead3e0bf 160000
--- a/capstone
+++ b/capstone
@@ -1 +1 @@
-Subproject commit f8b1b833015a4ae47110ed068e0deb7106ced66d
+Subproject commit 22ead3e0bfdb87516656453336160e0a37b066bf
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 7bb618f182..3a7e01f10f 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -526,6 +526,36 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
     nvme_attach_ns(n, ns);
 }
 
+static void nvme_ns_unrealize(DeviceState *dev)
+{
+    NvmeNamespace *ns = NVME_NS(dev);
+    BusState *s = qdev_get_parent_bus(dev);
+    NvmeCtrl *n = NVME(s->parent);
+    NvmeSubsystem *subsys = n->subsys;
+    uint32_t nsid = ns->params.nsid;
+    int i;
+
+    nvme_ns_drain(ns);
+    nvme_ns_shutdown(ns);
+    nvme_ns_cleanup(ns);
+
+    if (subsys) {
+        subsys->namespaces[nsid] = NULL;
+
+        if (ns->params.shared) {
+            for (i = 0; i < ARRAY_SIZE(subsys->ctrls); i++) {
+                NvmeCtrl *ctrl = subsys->ctrls[i];
+
+                if (ctrl) {
+                    nvme_detach_ns(ctrl, ns);
+                }
+            }
+            return;
+        }
+    }
+    nvme_detach_ns(n, ns);
+}
+
 static Property nvme_ns_props[] = {
     DEFINE_BLOCK_PROPERTIES(NvmeNamespace, blkconf),
     DEFINE_PROP_BOOL("detached", NvmeNamespace, params.detached, false),
@@ -563,6 +593,7 @@ static void nvme_ns_class_init(ObjectClass *oc, void *data)
 
     dc->bus_type = TYPE_NVME_BUS;
     dc->realize = nvme_ns_realize;
+    dc->unrealize = nvme_ns_unrealize;
     device_class_set_props(dc, nvme_ns_props);
     dc->desc = "Virtual NVMe namespace";
 }
diff --git a/hw/block/nvme-subsys.c b/hw/block/nvme-subsys.c
index 9604c19117..1c00508f33 100644
--- a/hw/block/nvme-subsys.c
+++ b/hw/block/nvme-subsys.c
@@ -42,6 +42,18 @@ int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp)
     return cntlid;
 }
 
+void nvme_subsys_unregister_ctrl(NvmeCtrl *n)
+{
+    NvmeSubsystem *subsys = n->subsys;
+    int cntlid = n->cntlid;
+
+    if (!n->subsys)
+        return;
+    assert(cntlid < ARRAY_SIZE(subsys->ctrls));
+    subsys->ctrls[cntlid] = NULL;
+    n->cntlid = -1;
+}
+
 static void nvme_subsys_setup(NvmeSubsystem *subsys)
 {
     const char *nqn = subsys->params.nqn ?
diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
index 7d7ef5f7f1..2d8a146c4f 100644
--- a/hw/block/nvme-subsys.h
+++ b/hw/block/nvme-subsys.h
@@ -32,6 +32,7 @@ typedef struct NvmeSubsystem {
 } NvmeSubsystem;
 
 int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp);
+void nvme_subsys_unregister_ctrl(NvmeCtrl *n);
 
 static inline NvmeCtrl *nvme_subsys_ctrl(NvmeSubsystem *subsys,
         uint32_t cntlid)
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 5fe082ec34..515678b686 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4963,26 +4963,12 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
             }
 
             nvme_attach_ns(ctrl, ns);
-            __nvme_select_ns_iocs(ctrl, ns);
         } else {
             if (!nvme_ns(ctrl, nsid)) {
                 return NVME_NS_NOT_ATTACHED | NVME_DNR;
             }
 
-            ctrl->namespaces[nsid - 1] = NULL;
-            ns->attached--;
-
-            nvme_update_dmrsl(ctrl);
-        }
-
-        /*
-         * Add namespace id to the changed namespace id list for event clearing
-         * via Get Log Page command.
-         */
-        if (!test_and_set_bit(nsid, ctrl->changed_nsids)) {
-            nvme_enqueue_event(ctrl, NVME_AER_TYPE_NOTICE,
-                               NVME_AER_INFO_NOTICE_NS_ATTR_CHANGED,
-                               NVME_LOG_CHANGED_NSLIST);
+            nvme_detach_ns(ctrl, ns);
         }
     }
 
@@ -6166,6 +6152,34 @@ void nvme_attach_ns(NvmeCtrl *n, NvmeNamespace *ns)
 
     n->dmrsl = MIN_NON_ZERO(n->dmrsl,
                             BDRV_REQUEST_MAX_BYTES / nvme_l2b(ns, 1));
+    if (NVME_CC_EN(n->bar.cc)) {
+        /* Ctrl is live */
+        __nvme_select_ns_iocs(n, ns);
+        if (!test_and_set_bit(nsid, n->changed_nsids)) {
+            nvme_enqueue_event(n, NVME_AER_TYPE_NOTICE,
+                               NVME_AER_INFO_NOTICE_NS_ATTR_CHANGED,
+                               NVME_LOG_CHANGED_NSLIST);
+        }
+    }
+}
+
+void nvme_detach_ns(NvmeCtrl *n, NvmeNamespace *ns)
+{
+    uint32_t nsid = ns->params.nsid;
+
+    if (ns->attached) {
+        n->namespaces[nsid - 1] = NULL;
+        ns->attached--;
+    }
+    nvme_update_dmrsl(n);
+    if (NVME_CC_EN(n->bar.cc)) {
+        /* Ctrl is live */
+        if (!test_and_set_bit(nsid, n->changed_nsids)) {
+            nvme_enqueue_event(n, NVME_AER_TYPE_NOTICE,
+                               NVME_AER_INFO_NOTICE_NS_ATTR_CHANGED,
+                               NVME_LOG_CHANGED_NSLIST);
+        }
+    }
 }
 
 static void nvme_realize(PCIDevice *pci_dev, Error **errp)
@@ -6193,7 +6207,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
         return;
     }
     nvme_init_ctrl(n, pci_dev);
-
+    qbus_set_bus_hotplug_handler(BUS(&n->bus));
     /* setup a namespace if the controller drive property was given */
     if (n->namespace.blkconf.blk) {
         ns = &n->namespace;
@@ -6224,6 +6238,8 @@ static void nvme_exit(PCIDevice *pci_dev)
         nvme_ns_cleanup(ns);
     }
 
+    nvme_subsys_unregister_ctrl(n);
+
     g_free(n->cq);
     g_free(n->sq);
     g_free(n->aer_reqs);
@@ -6348,10 +6364,22 @@ static const TypeInfo nvme_info = {
     },
 };
 
+static void nvme_bus_class_init(ObjectClass *klass, void *data)
+{
+    HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(klass);
+
+    hc->unplug = qdev_simple_device_unplug_cb;
+}
+
 static const TypeInfo nvme_bus_info = {
     .name = TYPE_NVME_BUS,
     .parent = TYPE_BUS,
     .instance_size = sizeof(NvmeBus),
+    .class_init = nvme_bus_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_HOTPLUG_HANDLER },
+        { }
+    }
 };
 
 static void nvme_register_types(void)
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 5d05ec368f..4fc06f58a4 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -255,6 +255,7 @@ typedef enum NvmeTxDirection {
 } NvmeTxDirection;
 
 void nvme_attach_ns(NvmeCtrl *n, NvmeNamespace *ns);
+void nvme_detach_ns(NvmeCtrl *n, NvmeNamespace *ns);
 uint16_t nvme_bounce_data(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
                           NvmeTxDirection dir, NvmeRequest *req);
 uint16_t nvme_bounce_mdata(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
diff --git a/roms/SLOF b/roms/SLOF
index 33a7322de1..e18ddad851 160000
--- a/roms/SLOF
+++ b/roms/SLOF
@@ -1 +1 @@
-Subproject commit 33a7322de13e9dca4b38851a345a58d37e7a441d
+Subproject commit e18ddad8516ff2cfe36ec130200318f7251aa78c
diff --git a/roms/openbios b/roms/openbios
index 4a0041107b..7f28286f5c 160000
--- a/roms/openbios
+++ b/roms/openbios
@@ -1 +1 @@
-Subproject commit 4a0041107b8ef77e0e8337bfcb5f8078887261a7
+Subproject commit 7f28286f5cb1ca682e3ba0a8706d8884f12bc49e
diff --git a/roms/u-boot b/roms/u-boot
index b46dd116ce..d3689267f9 160000
--- a/roms/u-boot
+++ b/roms/u-boot
@@ -1 +1 @@
-Subproject commit b46dd116ce03e235f2a7d4843c6278e1da44b5e1
+Subproject commit d3689267f92c5956e09cc7d1baa4700141662bff
-- 
2.26.2


