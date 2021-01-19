Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A272FBDDF
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 18:40:03 +0100 (CET)
Received: from localhost ([::1]:49736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1uz4-0006N0-Hn
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 12:40:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1uOX-0008TI-Ci; Tue, 19 Jan 2021 12:02:17 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:54398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1uOV-0003Ir-7m; Tue, 19 Jan 2021 12:02:17 -0500
Received: by mail-pj1-x1029.google.com with SMTP id cq1so270529pjb.4;
 Tue, 19 Jan 2021 09:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6DvNcxLwyV72Qw2+H4MIVE4F1vzn+6JFmrIhrlqE/IY=;
 b=N2hpvIU1eCDhOu16FxqI3UQrPVMLSdYHeT5DYzRouHlnGiSV+BuTwkFTAqMW3G4QS6
 zVlHuv38Qv5a/+6+lzhplGwcHp7JycMiVsv2Avrnfz15RjnvO6Sil4KbvEN+cUFQ+3PH
 pcdND7oXk7B3MluiBtzYMFuhdXCI7MEZvDj3PLUbRa6jgFH1ODtkucpWi/nCoxsIolhD
 PR2R+Xmq5ZnVzOL5lgIWpSMAfr0SXkqQq266nuXmq7t8Rk5GCNNaUNytd/4l8+xkZ6+n
 K+jw+JIXQJPWy45Qvj63CZkT0zUCMkZfKYVZtB0VStURmQ2AzmQkN/pdEQ4QA+sb+zTD
 +jgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6DvNcxLwyV72Qw2+H4MIVE4F1vzn+6JFmrIhrlqE/IY=;
 b=ovEtBobZ2jf520QNYvZM/B1ZlwcUBZXocwxizEitvMQRXTpllbOYdsyWRgvMrKYPjq
 16z50+MkG2uj1UPR3fWyzxy6aela4KYMJhaNacQ6NLX00wvRlrImfKvvgqg3Mvlh8fXg
 V1FJCU3lgzesavkSax2CyXrS/uopqMg8StmzC4IJQZv5tcUjt0VUycU2rCmSLtNP8pPh
 YqZP9abHr7jb5NiK3nc7Xsdv5ROQVwCcmdpzHYIkJwJ88AlZWPfWpQCJtoiYKaGKgSAt
 Ov3j03oLRbSKVcWO2ZIBPhybGdEecfMD5GF6Cqwa/p7FXzvzvE4vW/v3SVO1ITzp3Rlp
 ez1A==
X-Gm-Message-State: AOAM533Z6EPD2TNbW2+DBKRtx86GMsijD5YAv2T3f/pQ5DsAdvFDt7Ju
 Y/KOb9QaOdkFdqBeWtx029vMQli6FbOPPg==
X-Google-Smtp-Source: ABdhPJyxWEVrO8dhinJ+YPElT84U8ejwdtriRMkUC8ObM95Xrb4UIvmN/6goHXHITwHh51tbfF0rnw==
X-Received: by 2002:a17:902:7fc8:b029:de:74be:9238 with SMTP id
 t8-20020a1709027fc8b02900de74be9238mr5624195plb.21.1611075733353; 
 Tue, 19 Jan 2021 09:02:13 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id m4sm19396001pgv.16.2021.01.19.09.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 09:02:12 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [RFC PATCH V3 7/8] hw/block/nvme: add 'detached' param not to attach
 namespace
Date: Wed, 20 Jan 2021 02:01:46 +0900
Message-Id: <20210119170147.19657-8-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210119170147.19657-1-minwoo.im.dev@gmail.com>
References: <20210119170147.19657-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduced 'detached' parameter to nvme-ns device.  If given, the
namespace will not be attached to controller(s) in the subsystem.  If
'subsys' is not given with this option, it should be provided with 'bus'
which is for private namespace.

This patch also introduced 'ctrls_bitmap' in NvmeNamespace instance to
represent which controler id(cntlid) is attached to this namespace
device.  A namespace can be attached to multiple controllers in a
subsystem so that this bitmap maps those two relationships.

The ctrls_bitmap bitmap should not be accessed directly, but through the
helpers introduced in this patch: nvme_ns_is_attached(),
nvme_ns_attach(), nvme_ns_detach().

Note that this patch made identify namespace list data not hold
non-attached namespace ID in nvme_identify_nslist.  Currently, this
command handler is for CNS 0x2(Active) and 0x10(Allocated) both.  The
next patch will introduce a handler for later on.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme-ns.c     |  9 +++++++++
 hw/block/nvme-ns.h     |  6 ++++++
 hw/block/nvme-subsys.c |  2 ++
 hw/block/nvme.c        | 31 ++++++++++++++++++++++++++++++-
 hw/block/nvme.h        | 15 +++++++++++++++
 5 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 073f65e49cac..70d42c24065c 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -17,6 +17,7 @@
 #include "qemu/cutils.h"
 #include "qemu/log.h"
 #include "qemu/error-report.h"
+#include "qemu/hbitmap.h"
 #include "hw/block/block.h"
 #include "hw/pci/pci.h"
 #include "sysemu/sysemu.h"
@@ -304,6 +305,11 @@ static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
     return 0;
 }
 
+static void nvme_ns_init_state(NvmeNamespace *ns)
+{
+    ns->ctrls_bitmap = hbitmap_alloc(NVME_SUBSYS_MAX_CTRLS, 0);
+}
+
 int nvme_ns_setup(NvmeNamespace *ns, Error **errp)
 {
     if (nvme_ns_check_constraints(ns, errp)) {
@@ -314,6 +320,8 @@ int nvme_ns_setup(NvmeNamespace *ns, Error **errp)
         return -1;
     }
 
+    nvme_ns_init_state(ns);
+
     if (nvme_ns_init(ns, errp)) {
         return -1;
     }
@@ -381,6 +389,7 @@ static Property nvme_ns_props[] = {
     DEFINE_BLOCK_PROPERTIES(NvmeNamespace, blkconf),
     DEFINE_PROP_LINK("subsys", NvmeNamespace, subsys, TYPE_NVME_SUBSYS,
                      NvmeSubsystem *),
+    DEFINE_PROP_BOOL("detached", NvmeNamespace, params.detached, false),
     DEFINE_PROP_UINT32("nsid", NvmeNamespace, params.nsid, 0),
     DEFINE_PROP_UUID("uuid", NvmeNamespace, params.uuid),
     DEFINE_PROP_BOOL("zoned", NvmeNamespace, params.zoned, false),
diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index 929e78861903..ad2f55931d1b 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -26,6 +26,7 @@ typedef struct NvmeZone {
 } NvmeZone;
 
 typedef struct NvmeNamespaceParams {
+    bool     detached;
     uint32_t nsid;
     QemuUUID uuid;
 
@@ -48,6 +49,11 @@ typedef struct NvmeNamespace {
     uint8_t      csi;
 
     NvmeSubsystem   *subsys;
+    /*
+     * Whether this namespace is attached to a controller or not.  This bitmap
+     * is based on controller id.  This is valid only in case 'subsys' != NULL.
+     */
+    HBitmap         *ctrls_bitmap;
 
     NvmeIdNsZoned   *id_ns_zoned;
     NvmeZone        *zone_array;
diff --git a/hw/block/nvme-subsys.c b/hw/block/nvme-subsys.c
index e7efdcae7d0d..32ad8ef2825a 100644
--- a/hw/block/nvme-subsys.c
+++ b/hw/block/nvme-subsys.c
@@ -11,6 +11,7 @@
 #include "qemu/uuid.h"
 #include "qemu/iov.h"
 #include "qemu/cutils.h"
+#include "qemu/hbitmap.h"
 #include "qapi/error.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-core.h"
@@ -20,6 +21,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/pci/pci.h"
 #include "nvme.h"
+#include "nvme-ns.h"
 #include "nvme-subsys.h"
 
 int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp)
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 06bccf1b9e9e..2b2c07b36c2b 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -26,7 +26,7 @@
  *              ,subsys=<subsys_id> \
  *      -device nvme-ns,drive=<drive_id>,bus=<bus_name>,nsid=<nsid>,\
  *              zoned=<true|false[optional]>, \
- *              subsys=<subsys_id>
+ *              subsys=<subsys_id>,detached=<true|false[optional]
  *      -device nvme-subsys,id=<subsys_id>
  *
  * Note cmb_size_mb denotes size of CMB in MB. CMB is assumed to be at
@@ -77,6 +77,13 @@
  *   controllers in the subsystem. Otherwise, `bus` must be given to attach
  *   this namespace to a specified single controller as a non-shared namespace.
  *
+ * - `detached`
+ *   Not to attach the namespace device to controllers in the NVMe subsystem
+ *   during boot-up.  If not given, namespaces are all attached to all
+ *   controllers in the subsystem by default.
+ *   It's mutual exclusive with 'bus' paraemter.  It's only valid in case
+ *   'subsys' is provided.
+ *
  * Setting `zoned` to true selects Zoned Command Set at the namespace.
  * In this case, the following namespace properties are available to configure
  * zoned operation:
@@ -2906,6 +2913,11 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req)
         if (ns->params.nsid <= min_nsid) {
             continue;
         }
+
+        if (!nvme_ns_is_attached(n, ns)) {
+            continue;
+        }
+
         list_ptr[j++] = cpu_to_le32(ns->params.nsid);
         if (j == data_len / sizeof(uint32_t)) {
             break;
@@ -4146,6 +4158,19 @@ static void nvme_init_state(NvmeCtrl *n)
     n->aer_reqs = g_new0(NvmeRequest *, n->params.aerl + 1);
 }
 
+static int nvme_attach_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
+{
+    if (nvme_ns_is_attached(n, ns)) {
+        error_setg(errp,
+                   "namespace %d is already attached to controller %d",
+                   nvme_nsid(ns), n->cntlid);
+        return -1;
+    }
+
+    nvme_ns_attach(n, ns);
+    return 0;
+}
+
 int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
 {
     uint32_t nsid = nvme_nsid(ns);
@@ -4179,6 +4204,10 @@ int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
 
     n->namespaces[nsid - 1] = ns;
 
+    if (!ns->params.detached) {
+        return nvme_attach_namespace(n, ns, errp);
+    }
+
     return 0;
 }
 
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index c158cc873b59..582e6d4e8c40 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -181,6 +181,21 @@ static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
     return n->namespaces[nsid - 1];
 }
 
+static inline bool nvme_ns_is_attached(NvmeCtrl *n, NvmeNamespace *ns)
+{
+    return hbitmap_get(ns->ctrls_bitmap, n->cntlid);
+}
+
+static inline void nvme_ns_attach(NvmeCtrl *n, NvmeNamespace *ns)
+{
+    hbitmap_set(ns->ctrls_bitmap, n->cntlid, 1);
+}
+
+static inline void nvme_ns_detach(NvmeCtrl *n, NvmeNamespace *ns)
+{
+    hbitmap_reset(ns->ctrls_bitmap, n->cntlid, 1);
+}
+
 static inline NvmeCQueue *nvme_cq(NvmeRequest *req)
 {
     NvmeSQueue *sq = req->sq;
-- 
2.17.1


