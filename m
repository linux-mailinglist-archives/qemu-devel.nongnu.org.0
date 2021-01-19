Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C8B2FBD8B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 18:27:28 +0100 (CET)
Received: from localhost ([::1]:59646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1umt-00060S-BV
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 12:27:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1uOI-0007wQ-Ck; Tue, 19 Jan 2021 12:02:02 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:36404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1uOG-0003FN-CE; Tue, 19 Jan 2021 12:02:02 -0500
Received: by mail-pj1-x102e.google.com with SMTP id l23so270972pjg.1;
 Tue, 19 Jan 2021 09:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0m1jGuGz0yvQKHqdKo33hE6rgLKvgF6GneF5gBBFRpE=;
 b=EGLLD2wjRFEWq6n0uMlG2mDKx/03sQrRQYFtSoHY4YRu8c9KmWgo/9APURbmwRH7KE
 NiCp3HiPf934Ecn7y0KFQnJYdYRLvsFYTCN1jdywbp4NX8ahRK9OFuUGbuKppd2A+emn
 yynHZdWWfhbdG3xm18APovylwB9qppYGm6NHyJtIYBVnG5mCix8tn8pqpQJuwtCmiJ2G
 h13twhCEfcXgnVw0/bmSQLzBBd9PSDg7MRsByK9qVbPKWWSgcpLonirfOtbqav8S7IEf
 rHWuvuuesywhlg9N58OtGb2SHBevi6jL86BmDrmLVg6nX5U8VZi+olUDQ6Ti9ImMJk+Z
 xw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0m1jGuGz0yvQKHqdKo33hE6rgLKvgF6GneF5gBBFRpE=;
 b=rJkmpHIz39J34qwJ7qm7T4TzxlE25VWGFMwOaSxR4SIUfp93ixAnDlg5lnEbkTuAtt
 mU77mLHKI9sqyOqsbMjlnPkfttxkY1mDOpaF/DR0VtVXuVCCa0FuYPI5uMY53886AsYE
 NxTUZqDU69JhN0xheywFgcFCjBbts/j7TzIXaHhrz9Nrz8yPBSsH/sPd6sNiu0fhyG0R
 YvqLITfxhV4hZlpfuz85GIRkIOoLHErnL/N4cD0DI2qo9gWGKzVN+8mhrtsPDxvYyRVM
 NgOGi2TF7utuzpY+scF7Z8pmUC2b4lr3fLjKqfJhDTVc0aI+lq82RlLTMkuZuwBICcR7
 XobA==
X-Gm-Message-State: AOAM532XqnA8+S1VC+A665kmTXm5rzNkr5nJZNLaJAuKFBC7iMJKqGzA
 46VF7lAFLzSzA/I9i5Gv4pr4IRF9AhDICw==
X-Google-Smtp-Source: ABdhPJyn3f55V9uFR4RvuGp+Z3O13qPtm1xCzzGZNT4+Y+FlcJSF0lc/8ShoEhJYbeVY6MjZzOdkYg==
X-Received: by 2002:a17:902:6b84:b029:dc:3423:a24a with SMTP id
 p4-20020a1709026b84b02900dc3423a24amr5483729plk.31.1611075718034; 
 Tue, 19 Jan 2021 09:01:58 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id m4sm19396001pgv.16.2021.01.19.09.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 09:01:57 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [RFC PATCH V3 1/8] hw/block/nvme: introduce nvme-subsys device
Date: Wed, 20 Jan 2021 02:01:40 +0900
Message-Id: <20210119170147.19657-2-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210119170147.19657-1-minwoo.im.dev@gmail.com>
References: <20210119170147.19657-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x102e.google.com
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
index 309c26db8ff7..4644937a5c50 100644
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


