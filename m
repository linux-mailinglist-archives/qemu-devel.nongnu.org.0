Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B81472FF7C5
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 23:13:51 +0100 (CET)
Received: from localhost ([::1]:33090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2iD8-00028U-Pq
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 17:13:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2i8p-0006LC-9n; Thu, 21 Jan 2021 17:09:23 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:44640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2i8n-0000Jp-2j; Thu, 21 Jan 2021 17:09:22 -0500
Received: by mail-pl1-x631.google.com with SMTP id r4so2068030pls.11;
 Thu, 21 Jan 2021 14:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HaQZFZep6oCcGyOskVgZxy+gJ6D8yIOkK31HGVOPtvw=;
 b=MgDV1nLiX6tefgc2ql09whLtV/vZkT+yGylfItnJp6Hm5ThFROqYKGAF/Qv8/R/ihv
 idhozmcxGZVZEhdaCA/KtQXHk0NXbH+5GRYoa/38243/3ftpcOOK0cFk4IX1+HVojk28
 oDP9jbZw/M4Lh+dTmS6MkQ+OpnzBHGbdrU5LySB/LkAXt3ixgngL2CUkgS/3mYFRbCSm
 hsIEsRsyn5ZowBPMeLyYVDX30Zc5SWYHE5fIBRLRFtkYUHBX1JlHtHwcZhTNc547yAYz
 HangvsY4iu6pmf/BWN0bRAAvrzR2po8uQuZXxqYvKWFppZDfhVWS6kt98KkJ1Cb0rgGI
 UjWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HaQZFZep6oCcGyOskVgZxy+gJ6D8yIOkK31HGVOPtvw=;
 b=GAgvAnM+lyg+dkMSSXpTvmZTMH3dIjgffWq3gaUiMP2at9sZHHa9RcYkRuR5ZXee2/
 LCyVT81xKCSXDvvpLdZ17MoAK4+vPl/kd6Kmkesuiwk9yg9hlF78FgvItV4U6YNxNbd2
 4kVogR8hJ2dpJHMLnONYODkfZQRGyz7bmaT/h+HZMnIlfMGI4RNnG4N5JF4EsmS4j8rK
 YQKHOMA3CuWiLsMY3HfgN4BgNnIXdLNoWrgmWGcxr3TRFZMORna3DEWFKSpLfwObLw+R
 GrFvZBmSQ1AgzPn0RNBufgNxGHpaJul4ot/iPPd39TT+gY5LTwsGpyxHsmBHmBEuxmbs
 sdfg==
X-Gm-Message-State: AOAM533iLg8nVTSDIQdQM4uHvSJBrICK3aahi8Bk9SwnBoxkF/nKECsZ
 q9Gad849dxd1fKQpKehPKfTqE/qeOQtaxQ==
X-Google-Smtp-Source: ABdhPJwEKHeo3/OUC38naKbYued3dPkme99uNvd03UPWKE5skvHOXoYAVfv85vzfsFo0arBL5EEDfw==
X-Received: by 2002:a17:90a:2ec1:: with SMTP id
 h1mr1741574pjs.18.1611266959109; 
 Thu, 21 Jan 2021 14:09:19 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id c8sm5584308pfo.148.2021.01.21.14.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 14:09:18 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V4 1/6] hw/block/nvme: introduce nvme-subsys device
Date: Fri, 22 Jan 2021 07:09:03 +0900
Message-Id: <20210121220908.14247-2-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210121220908.14247-1-minwoo.im.dev@gmail.com>
References: <20210121220908.14247-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x631.google.com
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
index 21aec90637fa..aabccdf36f4b 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -25,6 +25,7 @@
  *              mdts=<N[optional]>,zoned.append_size_limit=<N[optional]> \
  *      -device nvme-ns,drive=<drive_id>,bus=<bus_name>,nsid=<nsid>,\
  *              zoned=<true|false[optional]>
+ *      -device nvme-subsys,id=<subsys_id>
  *
  * Note cmb_size_mb denotes size of CMB in MB. CMB is assumed to be at
  * offset 0 in BAR2 and supports only WDS, RDS and SQS for now. By default, the
@@ -38,6 +39,8 @@
  *
  * The PMR will use BAR 4/5 exclusively.
  *
+ * To place controller(s) and namespace(s) to a subsystem, then provide
+ * nvme-subsys device as above.
  *
  * nvme device parameters
  * ~~~~~~~~~~~~~~~~~~~~~~
-- 
2.17.1


