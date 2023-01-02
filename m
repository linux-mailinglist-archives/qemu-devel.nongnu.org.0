Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B407065B702
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 20:56:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCQuG-0005Cv-JE; Mon, 02 Jan 2023 14:55:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.derrick@linux.dev>)
 id 1pCQu0-000527-53
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 14:55:20 -0500
Received: from resqmta-h1p-028592.sys.comcast.net ([2001:558:fd02:2446::5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.derrick@linux.dev>)
 id 1pCQtv-0007g1-Mo
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 14:55:19 -0500
Received: from resomta-h1p-027919.sys.comcast.net ([96.102.179.208])
 by resqmta-h1p-028592.sys.comcast.net with ESMTP
 id CMnupB6sxGwAVCQtqp12RN; Mon, 02 Jan 2023 19:55:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=comcastmailservice.net; s=20211018a; t=1672689310;
 bh=RdOBA5DYYdMruHREGKhUjSzTLb2Irj4Oj7CAwbp6CoY=;
 h=Received:Received:From:To:Subject:Date:Message-Id:MIME-Version:
 Xfinity-Spam-Result;
 b=n2oDPQOAItpi4KkuUNUvo+9GeBAluuOUGNEEUuFdag537qOrsweL+vbVukdToUmJ0
 OWbBSCk9NpNIkxcTLZT5KV/rdvJfno/MNEBn2M5mxxvF4zCDsKmWSoGEaF/6X2qTH5
 S7OUaHRfea5pDWZbZLkZ+hf1XnjEtIU+FQkVmTk650gCiZblRrl0zCU6ne9lftg5kp
 I3pp5uft8b4y3LNz9uO+dJyx2OcqmOn/gEaHuQuXkpFSzFgpyadfGPmn941Gzpan9Y
 b1EVvPXmpWmHKkETf/JvZdQdD5J4+3j+8/3sNPQRc8kYd6oogm+RXPvSggwXamih8M
 JXdiXOCYR2Zrg==
Received: from localhost.localdomain ([71.205.181.50])
 by resomta-h1p-027919.sys.comcast.net with ESMTPA
 id CQtMpowOQrMVsCQtWpVN6C; Mon, 02 Jan 2023 19:54:51 +0000
X-Xfinity-VAAS: gggruggvucftvghtrhhoucdtuddrgedvhedrjedvgddufedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuvehomhgtrghsthdqtfgvshhipdfqfgfvpdfpqffurfetoffkrfenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheplfhonhgrthhhrghnucffvghrrhhitghkuceojhhonhgrthhhrghnrdguvghrrhhitghksehlihhnuhigrdguvghvqeenucggtffrrghtthgvrhhnpedtteeljeffgfffveehhfetveefuedvheevffffhedtjeeuvdevgfeftddtheeftdenucfkphepjedurddvtdehrddukedurdehtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhinhgvthepjedurddvtdehrddukedurdehtddpmhgrihhlfhhrohhmpehjohhnrghthhgrnhdruggvrhhrihgtkheslhhinhhugidruggvvhdpnhgspghrtghpthhtohepjedprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhrtghpthhtohepmhhitghhrggvlhdrkhhrohhprggtiigvkhesshholhhiughighhmrdgtohhmpdhrtghpthhtohepqhgvmhhuqdgslhhotghksehnohhnghhnuhdrohhrghdprhgtphhtthhopehksghushgthheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhtshesihhrrhgvlhgvvhgrnhhtrdgukhdprhgtphhtthhopehkfiholhhfsehrvgguhhgrthdrtghomhdprhgtphhtthhopehhrhgvihhtiiesrhgvughhrghtrdgtohhm
X-Xfinity-VMeta: sc=-100.00;st=legit
From: Jonathan Derrick <jonathan.derrick@linux.dev>
To: qemu-devel@nongnu.org
Cc: Michael Kropaczek <michael.kropaczek@solidigm.com>, qemu-block@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v5 2/2] hw/nvme: Support for Namespaces Management from guest
 OS - delete-ns
Date: Mon,  2 Jan 2023 12:54:03 -0700
Message-Id: <20230102195403.461-3-jonathan.derrick@linux.dev>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230102195403.461-1-jonathan.derrick@linux.dev>
References: <20230102195403.461-1-jonathan.derrick@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2001:558:fd02:2446::5;
 envelope-from=jonathan.derrick@linux.dev;
 helo=resqmta-h1p-028592.sys.comcast.net
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Michael Kropaczek <michael.kropaczek@solidigm.com>

Added support for NVMEe NameSpaces Mangement allowing the guest OS to
delete namespaces by issuing nvme delete-ns command.
It is an extension to currently implemented Qemu nvme virtual device.
Virtual devices representing namespaces will be created and/or deleted
during Qemu's running session, at anytime.

Signed-off-by: Michael Kropaczek <michael.kropaczek@solidigm.com>
---
 docs/system/devices/nvme.rst |  9 ++--
 hw/nvme/ctrl.c               | 82 ++++++++++++++++++++++++++++++++----
 hw/nvme/ns-backend.c         |  5 +++
 hw/nvme/ns.c                 | 71 +++++++++++++++++++++++++++++++
 hw/nvme/nvme.h               |  2 +
 hw/nvme/trace-events         |  1 +
 include/block/nvme.h         |  1 +
 7 files changed, 159 insertions(+), 12 deletions(-)

diff --git a/docs/system/devices/nvme.rst b/docs/system/devices/nvme.rst
index 6b3bee5e5d..f19072f1bc 100644
--- a/docs/system/devices/nvme.rst
+++ b/docs/system/devices/nvme.rst
@@ -103,12 +103,12 @@ Parameters:
 
 ``auto-ns-path=<path to nvme storage location>``
   If specified indicates a support for dynamic management of nvme namespaces
-  by means of nvme create-ns command. This path points
+  by means of nvme create-ns and nvme delete-ns commands. This path points
   to the storage area for backend images must exist. Additionally it requires
   that parameter `ns-subsys` must be specified whereas parameter `drive`
   must not. The legacy namespace backend is disabled, instead, a pair of
   files 'nvme_<ctrl SN>_ns_<NS-ID>.cfg' and 'nvme_<ctrl SN>_ns_<NS-ID>.img'
-  will refer to respective namespaces. The create-ns, attach-ns
+  will refer to respective namespaces. The create-ns, delete-ns, attach-ns
   and detach-ns commands, issued at the guest side, will make changes to
   those files accordingly.
   For each namespace exists an image file in raw format and a config file
@@ -140,8 +140,9 @@ Please note that ``nvme-ns`` device is not required to support of dynamic
 namespaces management feature. It is not prohibited to assign a such device to
 ``nvme`` device specified to support dynamic namespace management if one has
 an use case to do so, however, it will only coexist and be out of the scope of
-Namespaces Management. NsIds will be consistently managed, creation (create-ns)
-of a namespace will not allocate the NsId already being taken. If ``nvme-ns``
+Namespaces Management. Deletion (delete-ns) will render an error for this
+namespace. NsIds will be consistently managed, creation (create-ns) of
+a namespace will not allocate the NsId already being taken. If ``nvme-ns``
 device conflicts with previously created one by create-ns (the same NsId),
 it will break QEMU's start up.
 More than one of NVMe controllers associated with NVMe subsystem are supported.
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 5ed35d7cf4..e0fac3c151 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -144,12 +144,12 @@
  *
  * - `auto-ns-path`
  *   If specified indicates a support for dynamic management of nvme namespaces
- *   by means of nvme create-ns command. This path pointing
+ *   by means of nvme create-ns and nvme delete-ns commands. This path pointing
  *   to a storage area for backend images must exist. Additionally it requires
  *   that parameter `ns-subsys` must be specified whereas parameter `drive`
  *   must not. The legacy namespace backend is disabled, instead, a pair of
  *   files 'nvme_<ctrl SN>_ns_<NS-ID>.cfg' and 'nvme_<ctrl SN>_ns_<NS-ID>.img'
- *   will refer to respective namespaces. The create-ns, attach-ns
+ *   will refer to respective namespaces. The create-ns, delete-ns, attach-ns
  *   and detach-ns commands, issued at the guest side, will make changes to
  *   those files accordingly.
  *   For each namespace exists an image file in raw format and a config file
@@ -5702,17 +5702,13 @@ static uint16_t nvme_ns_mgmt_create(NvmeCtrl *n, NvmeRequest *req, uint32_t nsid
     }
 
     if (nvme_cfg_update(n, ns->size, NVME_NS_ALLOC_CHK)) {
-        /* place for delete-ns */
-        error_setg(&local_err, "Insufficient capacity, an orphaned ns[%"PRIu32"] will be left behind", nsid);
-        error_report_err(local_err);
+        nvme_ns_delete(n, nsid, NULL);
         return NVME_NS_INSUFFICIENT_CAPAC | NVME_DNR;
     }
     (void)nvme_cfg_update(n, ns->size, NVME_NS_ALLOC);
     if (nvme_cfg_save(n)) {
         (void)nvme_cfg_update(n, ns->size, NVME_NS_DEALLOC);
-        /* place for delete-ns */
-        error_setg(&local_err, "Cannot save conf file, an orphaned ns[%"PRIu32"] will be left behind", nsid);
-        error_report_err(local_err);
+        nvme_ns_delete(n, nsid, NULL);
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
@@ -5726,6 +5722,66 @@ fail:
     return NVME_SUCCESS;
 }
 
+static uint16_t nvme_ns_mgmt_delete(NvmeCtrl *n, uint32_t nsid)
+{
+    NvmeNamespace *ns = NULL;
+    uint16_t first = nsid;
+    uint16_t last = nsid;
+    uint16_t i;
+    uint64_t image_size;
+    Error *local_err = NULL;
+
+    if (!nsid) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    if (!n->params.ns_directory) {
+        error_setg(&local_err, "delete-ns not supported if 'auto-ns-path' is not specified");
+        goto fail;
+    } else if (n->namespace.blkconf.blk) {
+        error_setg(&local_err, "delete-ns not supported if 'drive' is specified");
+        goto fail;
+    }
+
+    if (nsid == NVME_NSID_BROADCAST) {
+        first = 1;
+        last = NVME_MAX_NAMESPACES;
+    }
+
+    for (i = first; i <= last; i++) {
+        ns = nvme_subsys_ns(n->subsys, (uint32_t)i);
+        if (n->params.ns_directory && ns && ns_auto_check(n, ns, (uint32_t)i)) {
+            error_setg(&local_err, "ns[%"PRIu32"] cannot be deleted, configured via '-device nvme-ns...'", i);
+            error_report_err(local_err);
+            if (first != last) {
+                local_err = NULL;       /* we are skipping */
+            }
+        } else if (ns) {
+            image_size = ns->size;
+            nvme_ns_delete(n, (uint16_t)i, &local_err);
+            if (local_err) {
+                goto fail;
+            }
+            (void)nvme_cfg_update(n, image_size, NVME_NS_DEALLOC);
+            if (nvme_cfg_save(n)) {
+                error_setg(&local_err, "Could not save nvme-cfg");
+                goto fail;
+            }
+        } else if (first == last) {
+            return NVME_INVALID_FIELD | NVME_DNR;
+        }
+    }
+
+fail:
+    if (local_err) {
+        error_report_err(local_err);
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    nvme_update_dmrsl(n);
+    return NVME_SUCCESS;
+}
+
 static uint16_t nvme_ns_mgmt(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeIdCtrl *id = &n->id_ctrl;
@@ -5760,6 +5816,16 @@ static uint16_t nvme_ns_mgmt(NvmeCtrl *n, NvmeRequest *req)
             return NVME_INVALID_FIELD | NVME_DNR;
         }
         break;
+    case NVME_NS_MANAGEMENT_DELETE:
+        switch (csi) {
+        case NVME_CSI_NVM:
+            return nvme_ns_mgmt_delete(n, nsid);
+        case NVME_CSI_ZONED:
+            /* fall through for now */
+        default:
+            return NVME_INVALID_FIELD | NVME_DNR;
+        }
+        break;
     default:
         return NVME_INVALID_FIELD | NVME_DNR;
     }
diff --git a/hw/nvme/ns-backend.c b/hw/nvme/ns-backend.c
index 06de8f262c..57d0b695fa 100644
--- a/hw/nvme/ns-backend.c
+++ b/hw/nvme/ns-backend.c
@@ -71,6 +71,11 @@ void ns_blockdev_activate(BlockBackend *blk,  uint64_t image_size, Error **errp)
                        errp);
 }
 
+void ns_blockdev_deactivate(BlockBackend *blk, Error **errp)
+{
+    ns_blockdev_activate(blk, 0, errp);
+}
+
 int ns_storage_path_check(NvmeCtrl *n, Error **errp)
 {
     return storage_path_check(n->params.ns_directory,  n->params.serial, errp);
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 06cc6c8c71..653d136eae 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -610,6 +610,77 @@ fail:
     return NULL;
 }
 
+static void nvme_ns_unrealize(DeviceState *dev);
+void nvme_ns_delete(NvmeCtrl *n, uint32_t nsid, Error **errp)
+{
+    NvmeNamespace *ns = NULL;
+    NvmeSubsystem *subsys = n->subsys;
+    int i;
+    int ret = 0;
+    Error *local_err = NULL;
+
+    trace_pci_nvme_ns_delete(nsid);
+
+    if (n->cntlid > 0 && !n->subsys) {
+        error_setg(&local_err, "Secondary controller without subsystem ");
+        return;
+    }
+
+    if (subsys) {
+        ns = nvme_subsys_ns(subsys, (uint32_t)nsid);
+        if (ns) {
+            if (ns->params.shared) {
+                for (i = 0; i < ARRAY_SIZE(subsys->ctrls); i++) {
+                    NvmeCtrl *ctrl = subsys->ctrls[i];
+
+                    if (ctrl && ctrl->namespaces[nsid]) {
+                        ctrl->namespaces[nsid] = NULL;
+                        ns->attached--;
+                    }
+                }
+            }
+            subsys->namespaces[nsid] = NULL;
+        }
+    }
+
+    if (!ns) {
+        ns = nvme_ns(n, (uint32_t)nsid);
+        if (ns) {
+            n->namespaces[nsid] = NULL;
+            ns->attached--;
+        } else {
+            error_setg(errp, "Namespace %d does not exist", nsid);
+            return;
+        }
+    }
+
+    if (ns->attached > 0) {
+        error_setg(errp, "Could not detach all ns references for ns[%d], still %d left", nsid, ns->attached);
+        return;
+    }
+
+    /* here is actual deletion */
+    nvme_ns_unrealize(&ns->parent_obj);
+    qdev_unrealize(&ns->parent_obj);
+    ns_blockdev_deactivate(ns->blkconf.blk, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    ns_cfg_clear(ns);
+    ret = ns_cfg_save(n, ns, nsid);
+    if (ret == -1) {
+        error_setg(errp, "Unable to save ns-cnf");
+        return;
+    } else if (ret == 1) {  /* should not occur here, check and error message prior to call to nvme_ns_delete() */
+        return;
+    }
+
+    /* disassociating refernces to the back-end and keeping it as preloaded */
+    ns->blkconf.blk = NULL;
+}
+
 int nvme_ns_setup(NvmeNamespace *ns, Error **errp)
 {
     if (nvme_ns_check_constraints(ns, errp)) {
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 4df57096ef..c7a782d7d1 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -280,6 +280,7 @@ void nvme_ns_shutdown(NvmeNamespace *ns);
 void nvme_ns_cleanup(NvmeNamespace *ns);
 void nvme_validate_flbas(uint8_t flbas,  Error **errp);
 NvmeNamespace *nvme_ns_create(NvmeCtrl *n, uint32_t nsid, NvmeIdNsMgmt *id_ns, Error **errp);
+void nvme_ns_delete(NvmeCtrl *n, uint32_t nsid, Error **errp);
 
 typedef struct NvmeAsyncEvent {
     QTAILQ_ENTRY(NvmeAsyncEvent) entry;
@@ -581,6 +582,7 @@ static inline NvmeSecCtrlEntry *nvme_sctrl_for_cntlid(NvmeCtrl *n,
 
 BlockBackend *ns_blockdev_init(const char *file, Error **errp);
 void ns_blockdev_activate(BlockBackend *blk,  uint64_t image_size, Error **errp);
+void ns_blockdev_deactivate(BlockBackend *blk, Error **errp);
 int nvme_ns_backend_setup(NvmeCtrl *n, Error **errp);
 void nvme_attach_ns(NvmeCtrl *n, NvmeNamespace *ns);
 uint16_t nvme_bounce_data(NvmeCtrl *n, void *ptr, uint32_t len,
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index 28b025ac42..0dd0c23208 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -79,6 +79,7 @@ pci_nvme_aer_masked(uint8_t type, uint8_t mask) "type 0x%"PRIx8" mask 0x%"PRIx8"
 pci_nvme_aer_post_cqe(uint8_t typ, uint8_t info, uint8_t log_page) "type 0x%"PRIx8" info 0x%"PRIx8" lid 0x%"PRIx8""
 pci_nvme_ns_mgmt(uint16_t cid, uint32_t nsid, uint8_t sel, uint8_t csi, uint8_t psdt) "cid %"PRIu16", nsid=%"PRIu32", sel=0x%"PRIx8", csi=0x%"PRIx8", psdt=0x%"PRIx8""
 pci_nvme_ns_create(uint16_t nsid, uint64_t nsze, uint64_t ncap, uint8_t flbas) "nsid %"PRIu16", nsze=%"PRIu64", ncap=%"PRIu64", flbas=%"PRIu8""
+pci_nvme_ns_delete(uint16_t nsid) "nsid %"PRIu16""
 pci_nvme_ns_attachment(uint16_t cid, uint8_t sel) "cid %"PRIu16", sel=0x%"PRIx8""
 pci_nvme_ns_attachment_attach(uint16_t cntlid, uint32_t nsid) "cntlid=0x%"PRIx16", nsid=0x%"PRIx32""
 pci_nvme_enqueue_event(uint8_t typ, uint8_t info, uint8_t log_page) "type 0x%"PRIx8" info 0x%"PRIx8" lid 0x%"PRIx8""
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 9d2e121f1a..0fe7fe9bb1 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1191,6 +1191,7 @@ enum NvmeIdCtrlCmic {
 
 enum NvmeNsManagementOperation {
     NVME_NS_MANAGEMENT_CREATE = 0x0,
+    NVME_NS_MANAGEMENT_DELETE = 0x1,
 };
 
 enum NvmeNsAttachmentOperation {
-- 
2.37.3


