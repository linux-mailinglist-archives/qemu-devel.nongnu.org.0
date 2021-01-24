Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B12301950
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 04:08:37 +0100 (CET)
Received: from localhost ([::1]:48442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3VlU-0005DH-Ix
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 22:08:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l3VYe-0000Td-Vd; Sat, 23 Jan 2021 21:55:23 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:54306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l3VYa-0003kG-39; Sat, 23 Jan 2021 21:55:19 -0500
Received: by mail-pj1-x102a.google.com with SMTP id cq1so6220518pjb.4;
 Sat, 23 Jan 2021 18:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=iwWbqZVh/h3mcBCrlvmjw4AKW/qVCosULhSCkOcZ/8c=;
 b=r8MUMjTINTanxDD2peQ2KAThEwwSqaK1TgeT0Z3CaWgIbYGzY9XJMmQ2pI8IwRkU/s
 9tiQaoTB7oMCZhqnRYzasfMwJiFAFoKwYZRWvwvRmK6MK3Z10utqZ0ZzUKgpDuDTtV0L
 UjDjTrnmCNEAHDBJdCQBANnYi/l0AHw29PNneREPGlMbOf+5r6eh38SRUJOyjIm9c/pK
 zLGlBQudUSV8FuIlWFvaX0wpMhDNK5vIfN06E/06N/CTYOsiMmbLpFTIqFur8WpihTlA
 uEJf2P/APQZA/m668rCzK5GaGnxjLxcEtUPWnjADF5pDpB6vhR2v+vP8hyKq67+w3thb
 Ln2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=iwWbqZVh/h3mcBCrlvmjw4AKW/qVCosULhSCkOcZ/8c=;
 b=CzrV1XemomHwM51lxuXenWjiO3fr+xDZj1vmXyQZfzuqljpqcTJG6D8YmXrUKL9ID4
 sKUi78YrMLESdlZQWL87CVoGdQepvSomiqQy/anb8Rc1vx9xhJGGQAcBY9ScNuq1blQu
 moPRqX3yx8hb+efw+25qDh57lrCjiAQsDxYNFn3TuWmwtqQXRUuIQCw5r/eJ3uSGGPP7
 JMyr0Lp3w0bt5X5YbeO0tflCqleViO4TdIfoVWbRTV/AYTt9cdKLepOvVgEfyTcxLTyz
 v6gTHWDuffUznzjljzTSFsC4HuJZ9rOoSYGF6K7vxLqjHcDVGCSE+7dUS2I2wPWJ7yCt
 4mDQ==
X-Gm-Message-State: AOAM5308A75dS5kkwiyZmYjrHA+89/XXw8rO7ybxsgCaUILCIUj5Ry6T
 BNQD4y+E4Z5/A+QHvIaUUNGW7v+xx6i4VA==
X-Google-Smtp-Source: ABdhPJyBUMO6j2+TLHgmpvAUxChpir1Z3h9Cj9biK9ZTkrKrdnKyXRraYebzYNOgoDGj/Y76V09TFw==
X-Received: by 2002:a17:903:22c2:b029:dd:f952:e341 with SMTP id
 y2-20020a17090322c2b02900ddf952e341mr3600211plg.67.1611456914285; 
 Sat, 23 Jan 2021 18:55:14 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id 77sm314842pfx.130.2021.01.23.18.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 18:55:13 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V6 6/6] hw/block/nvme: support for shared namespace in
 subsystem
Date: Sun, 24 Jan 2021 11:54:50 +0900
Message-Id: <20210124025450.11071-7-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210124025450.11071-1-minwoo.im.dev@gmail.com>
References: <20210124025450.11071-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x102a.google.com
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
index e9d61c993c90..641de33e99fc 100644
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
     snprintf((char *)subsys->subnqn, sizeof(subsys->subnqn),
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
index 7138389be4bd..8259dbf48ec0 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -25,7 +25,8 @@
  *              mdts=<N[optional]>,zoned.append_size_limit=<N[optional]>, \
  *              subsys=<subsys_id> \
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


