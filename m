Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A802F9325
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 16:01:03 +0100 (CET)
Received: from localhost ([::1]:39598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l19Y6-0002e1-Ke
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 10:01:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l19RT-0004WS-UL; Sun, 17 Jan 2021 09:54:13 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:45654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l19RO-00045e-CU; Sun, 17 Jan 2021 09:54:11 -0500
Received: by mail-pg1-x530.google.com with SMTP id v19so9288582pgj.12;
 Sun, 17 Jan 2021 06:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=irCLzdheyHgAvUXH0lTbNeucJOlBrP6V6dPKx7Uh3NU=;
 b=OTjwrwjdDyOYgE2McBQPJRnEqascMifoPWbbGa56DNx/QgZicj/iQZ0G8acquoP+Vf
 /oeD11RPq8w7hHAPLdgi7MBnuEVOT661fThNcpIkOiPgHfnjC53jczcN3km7fyAYuTL3
 VLysQoc1cYJHQNvlBMAXFClyQ0p3VsJ3vDq30hi0PtMKpIEONkH3agCnYSwvaAGfRJKK
 jxKJEvDHchrHUjQuPK8x1pCx9NIE+Q0QnVLDxnXLlr7ujIxZqm7EoTYU9Dy/WKhftx+2
 PQ+2NeTU5R9JttCL3aJg32xFHcBMOwkwrZOR0xDCNDjZuRCbchaKq6nrs0O8oAiSXfmk
 u5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=irCLzdheyHgAvUXH0lTbNeucJOlBrP6V6dPKx7Uh3NU=;
 b=oi8T7oAsA0bL0lETJLzX2tbl7Mu10i96NRu0G65E3JZt5pTWWWAJ1DIVO+mcJYCDqE
 pMZalRhvZ0SDz7TDZalkJ38APCtC3G1Cr0hmqbd0KYVewwMv4amLsQFWN8Vew3IxLE4X
 WsoAmWugMgJ68o8XS3XQu6SYCNy5Bx5cPJCAVgdY6hCFONoKGm2uSsZqz/axOxgJBxID
 FeTVF3Tf1LpLKE4Cb8u/MB9V93flmKy8BhJmKHXhPHyVw36V5HeWBFRhGjiPcdTMhCJv
 je5xD4u+6hhCGjftImfRogk79BpAyX0l+9u4a3inp4rJZYnVfoYXkk/+J9ZGe7dwBUmq
 tYTQ==
X-Gm-Message-State: AOAM531aQnaV7Nyi1b0nFpYl0i5BXO+TVf/pnzClAMdwkkMNrTik3lXb
 rYIUZWAKTbF9StrwSNfvjt2WnAtQSWWu+g==
X-Google-Smtp-Source: ABdhPJxZugfc2E3cj36iMn3tNQkh1AbZ1xyzofQeEtK8JE4u5O5bCXG2j4gjABuAxJ96NuyNGHEIzQ==
X-Received: by 2002:a63:5a08:: with SMTP id o8mr22094843pgb.118.1610895244434; 
 Sun, 17 Jan 2021 06:54:04 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id x127sm13143583pfb.74.2021.01.17.06.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 06:54:04 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [RFC PATCH V2 06/11] hw/block/nvme: introduce nvme-subsys device
Date: Sun, 17 Jan 2021 23:53:36 +0900
Message-Id: <20210117145341.23310-7-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210117145341.23310-1-minwoo.im.dev@gmail.com>
References: <20210117145341.23310-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pg1-x530.google.com
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

To support multi-path in QEMU NVMe device model, We need to have NVMe
subsystem hierarchy to map controllers and namespaces to a NVMe
subsystem.

This patch introduced a simple nvme-subsys device model.  The subsystem
will be prepared with subsystem NQN with <subsys_id> provided in
nvme-subsys device:

  ex) -device nvme-subsys,id=subsys0: nqn.2019-08.org.qemu:subsys0

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/meson.build   |  2 +-
 hw/block/nvme-subsys.c | 63 ++++++++++++++++++++++++++++++++++++++++++
 hw/block/nvme-subsys.h | 25 +++++++++++++++++
 hw/block/nvme.c        |  3 ++
 4 files changed, 92 insertions(+), 1 deletion(-)
 create mode 100644 hw/block/nvme-subsys.c
 create mode 100644 hw/block/nvme-subsys.h

diff --git a/hw/block/meson.build b/hw/block/meson.build
index 602ca6c8541d..83ea2d37978d 100644
--- a/hw/block/meson.build
+++ b/hw/block/meson.build
@@ -13,7 +13,7 @@ softmmu_ss.add(when: 'CONFIG_SSI_M25P80', if_true: files('m25p80.c'))
 softmmu_ss.add(when: 'CONFIG_SWIM', if_true: files('swim.c'))
 softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen-block.c'))
 softmmu_ss.add(when: 'CONFIG_SH4', if_true: files('tc58128.c'))
-softmmu_ss.add(when: 'CONFIG_NVME_PCI', if_true: files('nvme.c', 'nvme-ns.c'))
+softmmu_ss.add(when: 'CONFIG_NVME_PCI', if_true: files('nvme.c', 'nvme-ns.c', 'nvme-subsys.c'))
 
 specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c'))
 specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk.c'))
diff --git a/hw/block/nvme-subsys.c b/hw/block/nvme-subsys.c
new file mode 100644
index 000000000000..f1dc71d588d9
--- /dev/null
+++ b/hw/block/nvme-subsys.c
@@ -0,0 +1,63 @@
+/*
+ * QEMU NVM Express Subsystem: nvme-subsys
+ *
+ * Copyright (c) 2021 Minwoo Im <minwoo.im.dev@gmail.com>
+ *
+ * This code is licensed under the GNU GPL v2.  Refer COPYING.
+ */
+
+#include "qemu/units.h"
+#include "qemu/osdep.h"
+#include "qemu/uuid.h"
+#include "qemu/iov.h"
+#include "qemu/cutils.h"
+#include "qapi/error.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-core.h"
+#include "hw/block/block.h"
+#include "block/aio.h"
+#include "block/accounting.h"
+#include "sysemu/sysemu.h"
+#include "hw/pci/pci.h"
+#include "nvme.h"
+#include "nvme-subsys.h"
+
+static void nvme_subsys_setup(NvmeSubsystem *subsys)
+{
+    char *subnqn;
+
+    subnqn = g_strdup_printf("nqn.2019-08.org.qemu:%s", subsys->parent_obj.id);
+    strpadcpy((char *)subsys->subnqn, sizeof(subsys->subnqn), subnqn, '\0');
+    g_free(subnqn);
+}
+
+static void nvme_subsys_realize(DeviceState *dev, Error **errp)
+{
+    NvmeSubsystem *subsys = NVME_SUBSYS(dev);
+
+    nvme_subsys_setup(subsys);
+}
+
+static void nvme_subsys_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
+
+    dc->realize = nvme_subsys_realize;
+    dc->desc = "Virtual NVMe subsystem";
+}
+
+static const TypeInfo nvme_subsys_info = {
+    .name = TYPE_NVME_SUBSYS,
+    .parent = TYPE_DEVICE,
+    .class_init = nvme_subsys_class_init,
+    .instance_size = sizeof(NvmeSubsystem),
+};
+
+static void nvme_subsys_register_types(void)
+{
+    type_register_static(&nvme_subsys_info);
+}
+
+type_init(nvme_subsys_register_types)
diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
new file mode 100644
index 000000000000..40f06a4c7db0
--- /dev/null
+++ b/hw/block/nvme-subsys.h
@@ -0,0 +1,25 @@
+/*
+ * QEMU NVM Express Subsystem: nvme-subsys
+ *
+ * Copyright (c) 2021 Minwoo Im <minwoo.im.dev@gmail.com>
+ *
+ * This code is licensed under the GNU GPL v2.  Refer COPYING.
+ */
+
+#ifndef NVME_SUBSYS_H
+#define NVME_SUBSYS_H
+
+#define TYPE_NVME_SUBSYS "nvme-subsys"
+#define NVME_SUBSYS(obj) \
+    OBJECT_CHECK(NvmeSubsystem, (obj), TYPE_NVME_SUBSYS)
+
+#define NVME_SUBSYS_MAX_CTRLS   32
+
+typedef struct NvmeCtrl NvmeCtrl;
+typedef struct NvmeNamespace NvmeNamespace;
+typedef struct NvmeSubsystem {
+    DeviceState parent_obj;
+    uint8_t     subnqn[256];
+} NvmeSubsystem;
+
+#endif /* NVME_SUBSYS_H */
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 9e890ce84f5e..dde83aafc33d 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -25,6 +25,7 @@
  *              mdts=<N[optional]>,zoned.append_size_limit=<N[optional]> \
  *      -device nvme-ns,drive=<drive_id>,bus=<bus_name>,nsid=<nsid>,\
  *              zoned=<true|false[optional]>
+ *      -device nvme-subsys,id=<subsys_id>
  *
  * Note cmb_size_mb denotes size of CMB in MB. CMB is assumed to be at
  * offset 0 in BAR2 and supports only WDS, RDS and SQS for now.
@@ -37,6 +38,8 @@
  * -object memory-backend-file,id=<mem_id>,share=on,mem-path=<file_path>, \
  *  size=<size> .... -device nvme,...,pmrdev=<mem_id>
  *
+ * To place controller(s) and namespace(s) to a subsystem, then provide
+ * nvme-subsys device as above.
  *
  * nvme device parameters
  * ~~~~~~~~~~~~~~~~~~~~~~
-- 
2.17.1


