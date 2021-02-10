Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9EA316ACE
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 17:12:54 +0100 (CET)
Received: from localhost ([::1]:35126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9s6n-00015Y-Cj
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 11:12:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l9s3s-0007fY-Ur; Wed, 10 Feb 2021 11:09:52 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:45459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l9s3r-0000Bk-3f; Wed, 10 Feb 2021 11:09:52 -0500
Received: by mail-pl1-x62c.google.com with SMTP id b8so1439311plh.12;
 Wed, 10 Feb 2021 08:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=S9rN2Kzxfipm4/AIkXB8mqZYbmUbYQoOU2bvhW0ijBI=;
 b=jSmMid/da4g/f/LdEPGkXDwxeKVoRznWN84OcItp+RrQSLcdexAfyJM7CLMel7vHLc
 YkQhZx2FFVQNS5+z7iV7FSYscZg/kSqoYNnqkId1uc94gKrMQNo+0M2T1HXChr7bFF7q
 L08kc9rvleEeG1bGqkZAHdEh24/7El3rx/KCjUsJAMrTRDsqEjnKrOnIId84kaVsSoh3
 fLn5pLpKx4O/88NmGZzOuFqu67S4+57aHjVk/77pYH4M/M+UEfq6UjuxNUlzBLyOz1SO
 l0o16HuORTsLxreAa3S37+q+/0j+coTNQUUBS1nE3ex0TsmH0pZ0+O2s7hF+dM3ZD+RD
 BYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=S9rN2Kzxfipm4/AIkXB8mqZYbmUbYQoOU2bvhW0ijBI=;
 b=IMGYYHcrQVUfRimoZ8olGs9Fmm7mWIL+98gm1TbiBC1RKzr4ewaeyFbj+C65qr88O/
 cdfRANTbOram5hUKtxTULuONxsPyG7Tsbh9aN/YbPZqd3yuiKCvkc2Hrh9y8/DOrL8ZM
 BhdTbv51zGRhjNW9E7uUhxBifGgZO/pCezdyZSGULmpzG12rcdd+goAQ+hnJlTM4lIOc
 glWq/GMM9x6lswcZqz85BVargQ5Mlxkn4KUeiAJYu8S4s0cZ8dkFk9ZUgd0GU1rqz2B5
 +Yw3MY2hq/C9sIEM/Hun1zJ58wnJ6VR3n0ejeI7m6avuwxIqtOxwFN0SKnkFDiDZDIx9
 Qk3Q==
X-Gm-Message-State: AOAM5300TVA5NAToCiYkearCjhlQdZ8fxjw9dnzNlO0HnRhldQy54el/
 XGdnCU1a4eMu3MukwXs3uMR+1JVIIvntyQ==
X-Google-Smtp-Source: ABdhPJyRDJjUyVu2ST7pNu74ybuLRrDjk2jDT9kt6xBkPLbIOBGD3Zzcd/YBpKiKfAue8D17IYvlbg==
X-Received: by 2002:a17:903:31c4:b029:e1:8840:8ab9 with SMTP id
 v4-20020a17090331c4b02900e188408ab9mr3657831ple.70.1612973389036; 
 Wed, 10 Feb 2021 08:09:49 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id 25sm2761195pfj.120.2021.02.10.08.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 08:09:48 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V2 1/7] hw/block/nvme: support namespace detach
Date: Thu, 11 Feb 2021 01:09:31 +0900
Message-Id: <20210210160937.1100-2-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210210160937.1100-1-minwoo.im.dev@gmail.com>
References: <20210210160937.1100-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x62c.google.com
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
---
 hw/block/nvme-ns.c     |  1 +
 hw/block/nvme-ns.h     |  1 +
 hw/block/nvme-subsys.h |  1 +
 hw/block/nvme.c        | 41 +++++++++++++++++++++++++++++++++++++++--
 hw/block/nvme.h        | 22 ++++++++++++++++++++++
 5 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index c3b513b0fc78..cdcb81319fb5 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -393,6 +393,7 @@ static Property nvme_ns_props[] = {
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
index 6b84e34843f5..a1e930f7c8e4 100644
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
@@ -78,6 +78,13 @@
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
@@ -4521,6 +4528,20 @@ static void nvme_init_state(NvmeCtrl *n)
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
@@ -4552,7 +4573,23 @@ int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
 
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
index cb2b5175f1a1..bde0ed7c2679 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -176,6 +176,10 @@ typedef struct NvmeCtrl {
     NvmeSubsystem   *subsys;
 
     NvmeNamespace   namespace;
+    /*
+     * Attached namespaces to this controller.  If subsys is not given, all
+     * namespaces in this list will always be attached.
+     */
     NvmeNamespace   *namespaces[NVME_MAX_NAMESPACES];
     NvmeSQueue      **sq;
     NvmeCQueue      **cq;
@@ -194,6 +198,24 @@ static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
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
2.17.1


