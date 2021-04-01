Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 186573514BE
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 14:16:43 +0200 (CEST)
Received: from localhost ([::1]:47868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRwFe-0001sY-6c
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 08:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lRwCK-0000YK-L7
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:13:16 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:40794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lRwCI-0004PP-Ld
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:13:16 -0400
Received: by mail-pl1-x62b.google.com with SMTP id h8so918333plt.7
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 05:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R7dqDU5k5co2s2wETT/LvVbwqOE2ojRZvo5wYukiZUs=;
 b=q8uHP05Xn4/2tK15u03Rm0MjoBCftldQ771+CE1p8f/6phJUXbZq1nZzFtj6Nwy+q6
 PCG3YvBvcXkgFpuUtPo2zTBGBvIXiO2NPgpBl+NREaqMgOWNSBbvmJBYHDygPmup5oZj
 b6tFpQoH1jZKpmVMkgUVM2BYg49CSZYIxJxOTcH1EqiCtfpf0fxAPByttQDtl8r1ZrPI
 LuXF7TO+XwiLV5rDLaSIAgAv7W3PAN+BktnKnf6ojpsv65uCBNKSSBrcfhwLE+BFqOts
 AL2NBjKNVeLkUkkA9nVGYq30hm2RkkhxSKXuEtIU9qh32cjFocSj+qYn/0HuUnvE/9DA
 8QFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R7dqDU5k5co2s2wETT/LvVbwqOE2ojRZvo5wYukiZUs=;
 b=iu+TqHwbAyfHhBfwW/EupWjGPptxzwuW2DlAWuX33eTeh4p8Ltv0DBDC9OCM299G0V
 JK08IXctKoDdfByW0OsVT1WrAzKVe0lf+XnfWb0LZw9ES8nXsXXkxibziDzGGsd7Yys4
 hSyZCYbGmZKiNQCVfmDh+nQsk68JcQqe8tarebAf+WkRlSbFVRrxUuJxv8NrMKnNrd/x
 Ete94C6ffohKkI7yc3J+veGpVBAs5HMKvxjblqHxyzZVp0lB/iaagNPq6krcnQPwhANy
 frCtcuXozTH+ffcEmpvVeayJGFYSVJwZ97IEp1nDEg1KhOydpK+IkXcsCu+t4MuP1ENv
 sb5g==
X-Gm-Message-State: AOAM5326OGHUFEpwS76aq3wxjYm9w3HaB29jOjha3ut5mYGmabYq0vWJ
 L4Eu+wTXzbM2roVYlJgCzpybs0HESBX8zw==
X-Google-Smtp-Source: ABdhPJyF1GC+ezXKmF7+SUtaaW8vgRy64zKj5gQrGz2q0aESo+J8ICKU6CTfahKHKV+zJRmqyjrCQQ==
X-Received: by 2002:a17:902:ed84:b029:e7:1f2b:1eb4 with SMTP id
 e4-20020a170902ed84b02900e71f2b1eb4mr7861307plj.74.1617279192923; 
 Thu, 01 Apr 2021 05:13:12 -0700 (PDT)
Received: from localhost ([136.185.154.93])
 by smtp.gmail.com with ESMTPSA id b84sm5553113pfb.162.2021.04.01.05.13.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Apr 2021 05:13:12 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org, Viresh Kumar <viresh.kumar@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH V2 3/6] hw/virtio: add vhost-user-i2c-pci boilerplate
Date: Thu,  1 Apr 2021 17:42:32 +0530
Message-Id: <e766b2f786187a3826c90f361bcbc49ae2ea705b.1617278395.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1617278395.git.viresh.kumar@linaro.org>
References: <cover.1617278395.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Jie Deng <jie.deng@intel.com>,
 Bill Mills <bill.mills@linaro.org>, Arnd Bergmann <arnd.bergmann@linaro.com>,
 Mike Holmes <mike.holmes@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows is to instantiate a vhost-user-i2c device as part of a PCI
bus. It is mostly boilerplate which looks pretty similar to the
vhost-user-fs-pci device.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 hw/virtio/meson.build          |  1 +
 hw/virtio/vhost-user-i2c-pci.c | 69 ++++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 hw/virtio/vhost-user-i2c-pci.c

diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 1a0d736a0db5..bc352a600911 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -26,6 +26,7 @@ virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-rng.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-iommu.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem.c'))
 virtio_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true: files('vhost-user-i2c.c'))
+virtio_ss.add(when: ['CONFIG_VIRTIO_PCI', 'CONFIG_VHOST_USER_I2C'], if_true: files('vhost-user-i2c-pci.c'))
 
 virtio_pci_ss = ss.source_set()
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
diff --git a/hw/virtio/vhost-user-i2c-pci.c b/hw/virtio/vhost-user-i2c-pci.c
new file mode 100644
index 000000000000..70b7b65fd970
--- /dev/null
+++ b/hw/virtio/vhost-user-i2c-pci.c
@@ -0,0 +1,69 @@
+/*
+ * Vhost-user i2c virtio device PCI glue
+ *
+ * Copyright (c) 2021 Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/qdev-properties.h"
+#include "hw/virtio/vhost-user-i2c.h"
+#include "virtio-pci.h"
+
+struct VHostUserI2CPCI {
+    VirtIOPCIProxy parent_obj;
+    VHostUserI2C vdev;
+};
+
+typedef struct VHostUserI2CPCI VHostUserI2CPCI;
+
+#define TYPE_VHOST_USER_I2C_PCI "vhost-user-i2c-pci-base"
+
+DECLARE_INSTANCE_CHECKER(VHostUserI2CPCI, VHOST_USER_I2C_PCI,
+                         TYPE_VHOST_USER_I2C_PCI)
+
+static void vhost_user_i2c_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
+{
+    VHostUserI2CPCI *dev = VHOST_USER_I2C_PCI(vpci_dev);
+    DeviceState *vdev = DEVICE(&dev->vdev);
+
+    vpci_dev->nvectors = 1;
+    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
+}
+
+static void vhost_user_i2c_pci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioPCIClass *k = VIRTIO_PCI_CLASS(klass);
+    PCIDeviceClass *pcidev_k = PCI_DEVICE_CLASS(klass);
+    k->realize = vhost_user_i2c_pci_realize;
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
+    pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
+    pcidev_k->device_id = 0; /* Set by virtio-pci based on virtio id */
+    pcidev_k->revision = 0x00;
+    pcidev_k->class_id = PCI_CLASS_COMMUNICATION_OTHER;
+}
+
+static void vhost_user_i2c_pci_instance_init(Object *obj)
+{
+    VHostUserI2CPCI *dev = VHOST_USER_I2C_PCI(obj);
+
+    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
+                                TYPE_VHOST_USER_I2C);
+}
+
+static const VirtioPCIDeviceTypeInfo vhost_user_i2c_pci_info = {
+    .base_name = TYPE_VHOST_USER_I2C_PCI,
+    .non_transitional_name = "vhost-user-i2c-pci",
+    .instance_size = sizeof(VHostUserI2CPCI),
+    .instance_init = vhost_user_i2c_pci_instance_init,
+    .class_init = vhost_user_i2c_pci_class_init,
+};
+
+static void vhost_user_i2c_pci_register(void)
+{
+    virtio_pci_types_register(&vhost_user_i2c_pci_info);
+}
+
+type_init(vhost_user_i2c_pci_register);
-- 
2.25.0.rc1.19.g042ed3e048af


