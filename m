Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E5A3273AA
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 18:33:08 +0100 (CET)
Received: from localhost ([::1]:44912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGPwJ-00016Y-0p
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 12:33:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lGPle-0007pP-Qg; Sun, 28 Feb 2021 12:22:08 -0500
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:40241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lGPlW-00047p-My; Sun, 28 Feb 2021 12:22:05 -0500
Received: by mail-qv1-xf36.google.com with SMTP id x13so1083999qvj.7;
 Sun, 28 Feb 2021 09:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vq7m2qWiz2ZKHd4pw2FvIWA7GNMpRgNfXW9Pd8y/Wng=;
 b=udqT+C0EKRMR4rnXzfcSR/1CFFSnk+w83g9GFb8HkFm5PirYQYvO2AQ2mNrijjK0yp
 /8wDIB3pLRD8f6N0FxEBhcIxqyiz1i6+zt9w/kQbMWlbNqBxUwgTdg+1lYuAKjNI0pkd
 kojrUssmwNdbAqbuMVBOX1Ovha3FNt9Q8rs4xQrOIoQ9UyB5cieHp2IXknsC2/xo1WD7
 myvw+trwc56OxeD6e5ilTwJ9NXJPXqsnWy/69Wbyk5UrXuKoAf5Xjt+ScPP7Pq7vAK+R
 DTOAzdDAogoe6y7+T03beqd6OMjf6o0eZsGtIpbgY8j3DlOmCnMZWUuWYLfFDyo4diKU
 Jd1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vq7m2qWiz2ZKHd4pw2FvIWA7GNMpRgNfXW9Pd8y/Wng=;
 b=VVsGmlu+3VgMAkrMm73TYmCr+ryWZXER+JytYRqTqFuiC0b3A7KERgsORLaVvZLZaV
 X5euBsl+mga12/vgqCohkV4GmkMDBbvdaGWo9DRLm0GFD7/ZA6p2XlGu9jdXqTTu3KzN
 D7RoSDMkm9PBzpdOnAncGfYzXCjIo474e/C3Qpzoyn+NeQrXpHNi8L6OrHeL3x6biEr+
 Ye33CPCfy0wQ9mom64/T31oyjwbpdNB4gA2wv1+ON792MvUzPgOLrACmVvxKZ615YWMt
 QqRXw94S37MH7XobenjyCyqTa6DkONJdiqZ40pEQ19PdcDrpJfi9GHBK4AVQ+DU7P3XN
 hAxA==
X-Gm-Message-State: AOAM530hH834mOed9ZbzZ0TS3mkNKG4V+VV2WrDhICw/LQRUj+bAfJle
 ge5AtyNGfr2q9xeJ9pn+teBcm7sPUm0toQ==
X-Google-Smtp-Source: ABdhPJwAtyiU2RLHxL3mTfGRimBxR/XR8BbPZsQpWcySpVS6Ud4e9WDXE3LyVVWJ9isXTtfWtG1GrA==
X-Received: by 2002:a17:902:207:b029:e4:471d:82a with SMTP id
 7-20020a1709020207b02900e4471d082amr11717124plc.24.1614528670146; 
 Sun, 28 Feb 2021 08:11:10 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id x11sm14389781pja.46.2021.02.28.08.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 08:11:09 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V3 1/8] hw/block/nvme: support namespace detach
Date: Mon,  1 Mar 2021 01:10:53 +0900
Message-Id: <20210228161100.54015-2-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228161100.54015-1-minwoo.im.dev@gmail.com>
References: <20210228161100.54015-1-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-qv1-xf36.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Given that now we have nvme-subsys device supported, we can manage
namespace allocated, but not attached: detached.  This patch introduced
a parameter for nvme-ns device named 'detached'.  This parameter
indicates whether the given namespace device is detached from
a entire NVMe subsystem('subsys' given case, shared namespace) or a
controller('bus' given case, private namespace).

- Allocated namespace

  1) Shared ns in the subsystem 'subsys0':

     -device nvme-ns,id=ns1,drive=blknvme0,nsid=1,subsys=subsys0,detached=true

  2) Private ns for the controller 'nvme0' of the subsystem 'subsys0':

     -device nvme-subsys,id=subsys0
     -device nvme,serial=foo,id=nvme0,subsys=subsys0
     -device nvme-ns,id=ns1,drive=blknvme0,nsid=1,bus=nvme0,detached=true

  3) (Invalid case) Controller 'nvme0' has no subsystem to manage ns:

     -device nvme,serial=foo,id=nvme0
     -device nvme-ns,id=ns1,drive=blknvme0,nsid=1,bus=nvme0,detached=true

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
Tested-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-ns.c     |  1 +
 hw/block/nvme-ns.h     |  1 +
 hw/block/nvme-subsys.h |  1 +
 hw/block/nvme.c        | 41 +++++++++++++++++++++++++++++++++++++++--
 hw/block/nvme.h        | 22 ++++++++++++++++++++++
 5 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 0e8760020483..eda6a0c003a4 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -399,6 +399,7 @@ static Property nvme_ns_props[] = {
     DEFINE_BLOCK_PROPERTIES(NvmeNamespace, blkconf),
     DEFINE_PROP_LINK("subsys", NvmeNamespace, subsys, TYPE_NVME_SUBSYS,
                      NvmeSubsystem *),
+    DEFINE_PROP_BOOL("detached", NvmeNamespace, params.detached, false),
     DEFINE_PROP_UINT32("nsid", NvmeNamespace, params.nsid, 0),
     DEFINE_PROP_UUID("uuid", NvmeNamespace, params.uuid),
     DEFINE_PROP_UINT16("mssrl", NvmeNamespace, params.mssrl, 128),
diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index 7af6884862b5..b0c00e115d81 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -26,6 +26,7 @@ typedef struct NvmeZone {
 } NvmeZone;
 
 typedef struct NvmeNamespaceParams {
+    bool     detached;
     uint32_t nsid;
     QemuUUID uuid;
 
diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
index ccf6a71398d3..890d118117dc 100644
--- a/hw/block/nvme-subsys.h
+++ b/hw/block/nvme-subsys.h
@@ -23,6 +23,7 @@ typedef struct NvmeSubsystem {
     uint8_t     subnqn[256];
 
     NvmeCtrl    *ctrls[NVME_SUBSYS_MAX_CTRLS];
+    /* Allocated namespaces for this subsystem */
     NvmeNamespace *namespaces[NVME_SUBSYS_MAX_NAMESPACES];
 } NvmeSubsystem;
 
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index edd0b85c10ce..f6aeae081840 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -23,7 +23,7 @@
  *              max_ioqpairs=<N[optional]>, \
  *              aerl=<N[optional]>, aer_max_queued=<N[optional]>, \
  *              mdts=<N[optional]>,zoned.append_size_limit=<N[optional]>, \
- *              subsys=<subsys_id> \
+ *              subsys=<subsys_id>,detached=<true|false[optional]>
  *      -device nvme-ns,drive=<drive_id>,bus=<bus_name>,nsid=<nsid>,\
  *              zoned=<true|false[optional]>, \
  *              subsys=<subsys_id>
@@ -82,6 +82,13 @@
  *   controllers in the subsystem. Otherwise, `bus` must be given to attach
  *   this namespace to a specified single controller as a non-shared namespace.
  *
+ * - `detached`
+ *   Not to attach the namespace device to controllers in the NVMe subsystem
+ *   during boot-up. If not given, namespaces are all attahced to all
+ *   controllers in the subsystem by default.
+ *   It's mutual exclusive with 'bus' parameter. It's only valid in case
+ *   `subsys` is provided.
+ *
  * Setting `zoned` to true selects Zoned Command Set at the namespace.
  * In this case, the following namespace properties are available to configure
  * zoned operation:
@@ -4613,6 +4620,20 @@ static void nvme_init_state(NvmeCtrl *n)
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
+
+    return 0;
+}
+
 int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
 {
     uint32_t nsid = nvme_nsid(ns);
@@ -4644,7 +4665,23 @@ int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
 
     trace_pci_nvme_register_namespace(nsid);
 
-    n->namespaces[nsid - 1] = ns;
+    /*
+     * If subsys is not given, namespae is always attached to the controller
+     * because there's no subsystem to manage namespace allocation.
+     */
+    if (!n->subsys) {
+        if (ns->params.detached) {
+            error_setg(errp,
+                       "detached needs nvme-subsys specified nvme or nvme-ns");
+            return -1;
+        }
+
+        return nvme_attach_namespace(n, ns, errp);
+    } else {
+        if (!ns->params.detached) {
+            return nvme_attach_namespace(n, ns, errp);
+        }
+    }
 
     return 0;
 }
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index f45ace0cff5b..51b8739b4d1e 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -174,6 +174,10 @@ typedef struct NvmeCtrl {
     NvmeSubsystem   *subsys;
 
     NvmeNamespace   namespace;
+    /*
+     * Attached namespaces to this controller.  If subsys is not given, all
+     * namespaces in this list will always be attached.
+     */
     NvmeNamespace   *namespaces[NVME_MAX_NAMESPACES];
     NvmeSQueue      **sq;
     NvmeCQueue      **cq;
@@ -192,6 +196,24 @@ static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
     return n->namespaces[nsid - 1];
 }
 
+static inline bool nvme_ns_is_attached(NvmeCtrl *n, NvmeNamespace *ns)
+{
+    int nsid;
+
+    for (nsid = 1; nsid <= n->num_namespaces; nsid++) {
+        if (nvme_ns(n, nsid) == ns) {
+            return true;
+        }
+    }
+
+    return false;
+}
+
+static inline void nvme_ns_attach(NvmeCtrl *n, NvmeNamespace *ns)
+{
+    n->namespaces[nvme_nsid(ns) - 1] = ns;
+}
+
 static inline NvmeCQueue *nvme_cq(NvmeRequest *req)
 {
     NvmeSQueue *sq = req->sq;
-- 
2.25.1


