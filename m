Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 737F430194A
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 04:03:05 +0100 (CET)
Received: from localhost ([::1]:34706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3Vg8-0007og-HD
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 22:03:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l3VYQ-0000Fm-Dq; Sat, 23 Jan 2021 21:55:06 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:53442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l3VYO-0003fz-FL; Sat, 23 Jan 2021 21:55:06 -0500
Received: by mail-pj1-x102f.google.com with SMTP id p15so6230372pjv.3;
 Sat, 23 Jan 2021 18:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=sJy8j7so+eEZG2Um9lFCjm7LQCU9N8yZbI2MukMkgVs=;
 b=P+CEUH6LiphsA9n+aismd2rSYkiHahj3PjXx9Kv/u0kAJ4W3fcB50rLHJxGMJ6JEG4
 7PmUkw5ji3zujsp5QrGnWntsb3NKZ/yYUGC/vnPgzLnJ6oSRBkifUtXR3jWmAMzPx3VL
 gJsCtekgyQsp9fL8EabikA9W/t1fAINJeBNnUmY0WyqMu5DFRVIKPAA/HE+jqomjh/On
 gKq/EQIoNYBuQa/7xbaojWQ0KuHoXsks5aIfSWsx87LTUahEiI65kRf8/WQ7/hSLxKAU
 f/8eW7Wt7y8R9dVpJZhBDG47gEYbfXgKM3T2JPVLMxEiaaiYdNbnfouJ0HEcVcnDHtDf
 fcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=sJy8j7so+eEZG2Um9lFCjm7LQCU9N8yZbI2MukMkgVs=;
 b=mdeOnoYWmqklp1v8BgmhFIY0ffxGinQBv9iSaLXjH8rhPjhVTsXjjLp5Zya8zVpE07
 aZgEOR0CUBpwbdSpkUrQLRiXo4odVRZuzxrYhlJoQkkEYGomQ5mx0Bwh5tCO5itDA2TB
 3bBZ7Q7DFaYJh46cEhEuJ2FR8ZAYGP1bJh8T54IikELDBR4kGvB6WSjHv7byBsR/4lL8
 i+lbrNv68KXSNumEAlgGyYRCq5wFdbLdCUuxddj9AT2G/zIJdoZPObehwMIWrEniV1V9
 j8ghv70JVDg7U3acckWjtWp8cKL2ujo7PppL45OxtZcQu3cY/jnvy6sQkOykJv5z/Vnm
 yvAQ==
X-Gm-Message-State: AOAM532l2RrcU2B2AV+PbHP4Hcc+Vc9/qPyYXq+0QWc6/rFu1E8gqMZQ
 4MXK0GF3K3ZHeFy+RtP5pAvh877Mff5XWg==
X-Google-Smtp-Source: ABdhPJy/RPXwn9outj4TngUVAj0z15G57R2Eh9BOt3bXYjjfrv6Ca1tlwbeloqgRcqg6NeUNZWq3uA==
X-Received: by 2002:a17:90a:ad01:: with SMTP id
 r1mr14775873pjq.197.1611456902688; 
 Sat, 23 Jan 2021 18:55:02 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id 77sm314842pfx.130.2021.01.23.18.55.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 18:55:02 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V6 1/6] hw/block/nvme: introduce nvme-subsys device
Date: Sun, 24 Jan 2021 11:54:45 +0900
Message-Id: <20210124025450.11071-2-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210124025450.11071-1-minwoo.im.dev@gmail.com>
References: <20210124025450.11071-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x102f.google.com
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
 hw/block/nvme-subsys.c | 60 ++++++++++++++++++++++++++++++++++++++++++
 hw/block/nvme-subsys.h | 25 ++++++++++++++++++
 hw/block/nvme.c        |  3 +++
 4 files changed, 89 insertions(+), 1 deletion(-)
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
index 000000000000..aa82911b951c
--- /dev/null
+++ b/hw/block/nvme-subsys.c
@@ -0,0 +1,60 @@
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
+    snprintf((char *)subsys->subnqn, sizeof(subsys->subnqn),
+             "nqn.2019-08.org.qemu:%s", subsys->parent_obj.id);
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


