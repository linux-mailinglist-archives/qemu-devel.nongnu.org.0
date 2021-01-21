Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8678F2FF7CC
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 23:16:38 +0100 (CET)
Received: from localhost ([::1]:38162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2iFp-0004LA-GQ
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 17:16:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2i9I-0006Z1-9V; Thu, 21 Jan 2021 17:09:52 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:44987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2i92-0000P0-Az; Thu, 21 Jan 2021 17:09:51 -0500
Received: by mail-pf1-x436.google.com with SMTP id t29so2358980pfg.11;
 Thu, 21 Jan 2021 14:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JbVJ4+kCoc1Erwra/B00tFfbMGvCyS9dKtS/awLbHi8=;
 b=qHUPYCkvbjYCOQlfYYMiCwPMTGu6O+RqA5lrM314IcFcbftOkIyq8SNd1EC9IqUJ2o
 uEBtYj5rpOPArOxm+ELQ2xWpeRFG89aqJZPAThJej2e3dN+zwc+uq2yq1SoOOdn1fcx3
 JBTNH1bA1t8h27O2Se20aVYSj+CVkxMnxpZHONaJlDFR16h3yL13PJfhb0GVzJyYbdku
 2kL1JDnUlv4y8SNGpBOSYMmOuMPsnWMdO5ZZDY9PjqKodw67MSYJoDnAFGhk8k3vCNEh
 +HA0bKQHETztZdg4pXoHmGs44tfIWS/ImIi/IUtnx+ddiD/Ig6qtvDENTieMXixw0Vt/
 qQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JbVJ4+kCoc1Erwra/B00tFfbMGvCyS9dKtS/awLbHi8=;
 b=CyDpdqIsgwdhmqrBCMLG6I2MVZusScPqr36tNe83JQE8ObCDI+ugEvQBWuvGSBioso
 NOAolYB0ekS3YJAfo5p7pLtGWVFh3Zuyn9n3W6dXn9B8x1RLN3u9bx015VdgK9jSf30i
 brrwWbv2RODpaFzTUht0zO84vfL/DPw6EdQiA0GD6Fe9C3CZgC8iCLCKaqGnlYcPuWnp
 cBj5y02c2hXIQvD06NXi062sKO7+9KmyKVH4cIve9UbmHTVSHiLafGmLYdBj5vcdyubu
 cAJY0R8rUphX5deel54Jocb1CtCOnufQxJ8E468pdZy1IzTibtgwOGx78ER44n41Ozvy
 JZKg==
X-Gm-Message-State: AOAM5327w40iRrOaWLnY5zd9AkvqbAEgU3yPw4iet6oLsAH0rdvRsLeo
 7bWeMZ5U+XHsmkEceVhseiUEs/ApX0sTxA==
X-Google-Smtp-Source: ABdhPJwq+shvBqqGN8NPQbNPpKzD95bHiKpGGQKg2QoiclpA9CGrwMLgwCFvxD0v7awoqNNLw39wng==
X-Received: by 2002:a62:7e15:0:b029:1b9:c871:8873 with SMTP id
 z21-20020a627e150000b02901b9c8718873mr1471670pfc.55.1611266970968; 
 Thu, 21 Jan 2021 14:09:30 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id c8sm5584308pfo.148.2021.01.21.14.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 14:09:30 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V4 6/6] hw/block/nvme: support for shared namespace in
 subsystem
Date: Fri, 22 Jan 2021 07:09:08 +0900
Message-Id: <20210121220908.14247-7-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210121220908.14247-1-minwoo.im.dev@gmail.com>
References: <20210121220908.14247-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x436.google.com
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

nvme-ns device is registered to a nvme controller device during the
initialization in nvme_register_namespace() in case that 'bus' property
is given which means it's mapped to a single controller.

This patch introduced a new property 'subsys' just like the controller
device instance did to map a namespace to a NVMe subsystem.

If 'subsys' property is given to the nvme-ns device, it will belong to
the specified subsystem and will be attached to all controllers in that
subsystem by enabling shared namespace capability in NMIC(Namespace
Multi-path I/O and Namespace Capabilities) in Identify Namespace.

Usage:

  -device nvme-subsys,id=subsys0
  -device nvme,serial=foo,id=nvme0,subsys=subsys0
  -device nvme,serial=bar,id=nvme1,subsys=subsys0
  -device nvme,serial=baz,id=nvme2,subsys=subsys0
  -device nvme-ns,id=ns1,drive=<drv>,nsid=1,subsys=subsys0  # Shared
  -device nvme-ns,id=ns2,drive=<drv>,nsid=2,bus=nvme2       # Non-shared

  In the above example, 'ns1' will be shared to 'nvme0' and 'nvme1' in
  the same subsystem.  On the other hand, 'ns2' will be attached to the
  'nvme2' only as a private namespace in that subsystem.

All the namespace with 'subsys' parameter will attach all controllers in
the subsystem to the namespace by default.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme-ns.c     | 23 ++++++++++++++++++-----
 hw/block/nvme-ns.h     |  7 +++++++
 hw/block/nvme-subsys.c | 25 +++++++++++++++++++++++++
 hw/block/nvme-subsys.h |  3 +++
 hw/block/nvme.c        | 10 +++++++++-
 5 files changed, 62 insertions(+), 6 deletions(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 62b25cf69bfa..9b493f2ead03 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -63,6 +63,10 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
 
     id_ns->npda = id_ns->npdg = npdg - 1;
 
+    if (nvme_ns_shared(ns)) {
+        id_ns->nmic |= NVME_NMIC_NS_SHARED;
+    }
+
     return 0;
 }
 
@@ -365,16 +369,25 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    if (nvme_register_namespace(n, ns, errp)) {
-        error_propagate_prepend(errp, local_err,
-                                "could not register namespace: ");
-        return;
+    if (ns->subsys) {
+        if (nvme_subsys_register_ns(ns, errp)) {
+            error_propagate_prepend(errp, local_err,
+                                    "could not setup namespace to subsys: ");
+            return;
+        }
+    } else {
+        if (nvme_register_namespace(n, ns, errp)) {
+            error_propagate_prepend(errp, local_err,
+                                    "could not register namespace: ");
+            return;
+        }
     }
-
 }
 
 static Property nvme_ns_props[] = {
     DEFINE_BLOCK_PROPERTIES(NvmeNamespace, blkconf),
+    DEFINE_PROP_LINK("subsys", NvmeNamespace, subsys, TYPE_NVME_SUBSYS,
+                     NvmeSubsystem *),
     DEFINE_PROP_UINT32("nsid", NvmeNamespace, params.nsid, 0),
     DEFINE_PROP_UUID("uuid", NvmeNamespace, params.uuid),
     DEFINE_PROP_BOOL("zoned", NvmeNamespace, params.zoned, false),
diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index 293ac990e3f6..929e78861903 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -47,6 +47,8 @@ typedef struct NvmeNamespace {
     const uint32_t *iocs;
     uint8_t      csi;
 
+    NvmeSubsystem   *subsys;
+
     NvmeIdNsZoned   *id_ns_zoned;
     NvmeZone        *zone_array;
     QTAILQ_HEAD(, NvmeZone) exp_open_zones;
@@ -77,6 +79,11 @@ static inline uint32_t nvme_nsid(NvmeNamespace *ns)
     return -1;
 }
 
+static inline bool nvme_ns_shared(NvmeNamespace *ns)
+{
+    return !!ns->subsys;
+}
+
 static inline NvmeLBAF *nvme_ns_lbaf(NvmeNamespace *ns)
 {
     NvmeIdNs *id_ns = &ns->id_ns;
diff --git a/hw/block/nvme-subsys.c b/hw/block/nvme-subsys.c
index a01003136b12..e7efdcae7d0d 100644
--- a/hw/block/nvme-subsys.c
+++ b/hw/block/nvme-subsys.c
@@ -43,6 +43,31 @@ int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp)
     return cntlid;
 }
 
+int nvme_subsys_register_ns(NvmeNamespace *ns, Error **errp)
+{
+    NvmeSubsystem *subsys = ns->subsys;
+    NvmeCtrl *n;
+    int i;
+
+    if (subsys->namespaces[nvme_nsid(ns)]) {
+        error_setg(errp, "namespace %d already registerd to subsy %s",
+                   nvme_nsid(ns), subsys->parent_obj.id);
+        return -1;
+    }
+
+    subsys->namespaces[nvme_nsid(ns)] = ns;
+
+    for (i = 0; i < ARRAY_SIZE(subsys->ctrls); i++) {
+        n = subsys->ctrls[i];
+
+        if (n && nvme_register_namespace(n, ns, errp)) {
+            return -1;
+        }
+    }
+
+    return 0;
+}
+
 static void nvme_subsys_setup(NvmeSubsystem *subsys)
 {
     char *subnqn;
diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
index 4eba50d96a1d..ccf6a71398d3 100644
--- a/hw/block/nvme-subsys.h
+++ b/hw/block/nvme-subsys.h
@@ -14,6 +14,7 @@
     OBJECT_CHECK(NvmeSubsystem, (obj), TYPE_NVME_SUBSYS)
 
 #define NVME_SUBSYS_MAX_CTRLS   32
+#define NVME_SUBSYS_MAX_NAMESPACES  32
 
 typedef struct NvmeCtrl NvmeCtrl;
 typedef struct NvmeNamespace NvmeNamespace;
@@ -22,8 +23,10 @@ typedef struct NvmeSubsystem {
     uint8_t     subnqn[256];
 
     NvmeCtrl    *ctrls[NVME_SUBSYS_MAX_CTRLS];
+    NvmeNamespace *namespaces[NVME_SUBSYS_MAX_NAMESPACES];
 } NvmeSubsystem;
 
 int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp);
+int nvme_subsys_register_ns(NvmeNamespace *ns, Error **errp);
 
 #endif /* NVME_SUBSYS_H */
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 225f0d3f3a27..b123514c6262 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -25,7 +25,8 @@
  *              mdts=<N[optional]>,zoned.append_size_limit=<N[optional]> \
  *              ,subsys=<subsys_id> \
  *      -device nvme-ns,drive=<drive_id>,bus=<bus_name>,nsid=<nsid>,\
- *              zoned=<true|false[optional]>
+ *              zoned=<true|false[optional]>, \
+ *              subsys=<subsys_id>
  *      -device nvme-subsys,id=<subsys_id>
  *
  * Note cmb_size_mb denotes size of CMB in MB. CMB is assumed to be at
@@ -70,6 +71,13 @@
  *   data size being in effect. By setting this property to 0, users can make
  *   ZASL to be equal to MDTS. This property only affects zoned namespaces.
  *
+ * nvme namespace device parameters
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * - `subsys`
+ *   NVM Subsystem device.  If given, this namespace will be attached to all
+ *   controllers in the subsystem. Otherwise, `bus` must be given to attach
+ *   this namespace to a specified single controller as a non-shared namespace.
+ *
  * Setting `zoned` to true selects Zoned Command Set at the namespace.
  * In this case, the following namespace properties are available to configure
  * zoned operation:
-- 
2.17.1


