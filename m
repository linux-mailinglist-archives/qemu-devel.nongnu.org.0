Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7857232A0F5
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 14:32:55 +0100 (CET)
Received: from localhost ([::1]:42184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH58w-0007Bc-H5
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 08:32:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lH52p-0001eS-G5; Tue, 02 Mar 2021 08:26:35 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:35348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lH52j-0001b4-VT; Tue, 02 Mar 2021 08:26:35 -0500
Received: by mail-pg1-x52c.google.com with SMTP id t25so13822368pga.2;
 Tue, 02 Mar 2021 05:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DKsJrXoeEiw6FlpAO/7urDILp0a+3n8O+3ieiz7ziQg=;
 b=AskehVtGOiCevdmdV0zKBGp+huL+bagbSot97ae1a1OehycCP5S8e7YmFEjIhKY+cU
 FCiphdGmAOjplLMghoD2F/rIFU19/vJwbhm3L/JNt6Oyk6I7ovrOx/Audg37TKFOa/ZJ
 aVZCUvMoOUxipfNP2wjVyIR+Itp6jRuH6/uBTg4DDKq9JeSB78UpzIqsXpZSaalgk6Yz
 RHK/Nb85+9AXiyg/o4FGWVibbeaXeb2AvtninDLqp0EkJf3J36/xeXrVaPFkpuOuhNVJ
 x6/joUIWAYiJb7XvZVFTxDWKvI2GivGnhYAsPZ0YEJbV2nJBIxSdXtSuuDjefdybbb1r
 IVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DKsJrXoeEiw6FlpAO/7urDILp0a+3n8O+3ieiz7ziQg=;
 b=rG0NNqt1DtQoUhBBY9NCwrmzaZFHnuODFCc4k+9K73+uKHfidf/GiKEdHzWNGih71W
 7FwEK5VukInOtuHgWQwIHix1f1HYWqqiBLgKwimDzyDazM3eUSEwXLvq0WIhIwxIZUHU
 XwIWrAHCkap55J7fxV8hf2HabwBOE6sZq1GEV8A+0WLf7lDBfZafVLbRFgkOM12AD0mc
 hdNOO1oW60FebKANk/shpuWgdgYCUnensH3jgmfkM7Gr1Qlp+fjI3eST7pgqGvswrGDw
 0VHxWAD/Y6pig4UIZFllOLrXNgEX1gCT3Nv/OdE2RTFynA44Ku5QOBWlQdiBMCrRkwjQ
 a0jA==
X-Gm-Message-State: AOAM533W4fH2FsoV+jtVtMlzfdQWtwLtxz2G0exhA3buC4ZtEOLw7+3C
 LhCw75kACebcv74StKYT98o3SPeq2Lvo5A==
X-Google-Smtp-Source: ABdhPJwwcTM82JYZsI16XdSb9eDtQwAu7X6BbeEe+rgg0IIzj+P6f9If0ev9zXmcDd8R216mvcgl8Q==
X-Received: by 2002:a63:ce18:: with SMTP id y24mr2354669pgf.246.1614691588000; 
 Tue, 02 Mar 2021 05:26:28 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id u7sm20166956pfh.150.2021.03.02.05.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 05:26:27 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V4 1/8] hw/block/nvme: support namespace detach
Date: Tue,  2 Mar 2021 22:26:10 +0900
Message-Id: <20210302132617.18495-2-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210302132617.18495-1-minwoo.im.dev@gmail.com>
References: <20210302132617.18495-1-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pg1-x52c.google.com
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
2.27.0


