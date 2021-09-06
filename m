Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D25401C23
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:13:23 +0200 (CEST)
Received: from localhost ([::1]:45962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNER8-0003cl-Iw
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPH-0000hx-OJ
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:31 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPE-0007Wt-EG
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:27 -0400
Received: by mail-wr1-x436.google.com with SMTP id n5so9768314wro.12
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4iMjuoQHF2hMgz9rRlyo7y8BWexeTkanfLhhNNfYVfg=;
 b=VvEBkaWqJZ7aJAK6jbSHXhNne9JlCkMSWgtYgjOJo3GhEjdO361rSHHZ7wwYUzvUbH
 X21B5Q+3qpSMgoa60TJ+N85knHP/EVd0HWEgp7F+xfTc+Ep3sLSCGAvOr5nxMI0KE7OI
 NOPy7QqTDM02ImSIgU/ynOK+6gUA66wAEHzZ0GGhKxhWvKy0rCw0m5Tnher+DmIGdA/x
 Oq+J3izLQYxqVgpvuysfA1IIL97C1Q7qqRjV0OFBJsr2kM3mLXjl1EzBatUA2Ph065BG
 IjxVi5wNpj0VirVk4wP2XSRqrm1611JD6pRV8WxQe5TIYpn0bbdWZ4zjJgJHeNK+e3mT
 vTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4iMjuoQHF2hMgz9rRlyo7y8BWexeTkanfLhhNNfYVfg=;
 b=pb7XfIhZBWZjmbAEWjL0NExluG78IiNjJ4XadiU7x/4GZu5oYUR0JxICu/b8Jxj8yA
 ZS1Xgreo48gOwuNVz72nyvk5w660r3YSTwoIdDiHTOCb9yY1X3nV03A8sbRhW2tdFuvM
 UNL1A+RjHBwZ3OKAyFEXTVePebOvFOJAfZWuHOx7Lflu9hZ9BSbIWQTRcUHPBgPzdbHq
 JcU1vFrwANebgoabVXmRiiN3wY3Izq0BqJrcEGpBYSqAsmqLoI27pzyGZqFYkzmIYjqf
 /q5SjMSRREhWh+9sciw0ai9cAzqcphkg3vHuKdFqmHJ7cnCeanbzN03bdMAVG7avDQ2H
 S4BA==
X-Gm-Message-State: AOAM532B/yl2+6yW3+hBNGXJ1LnSLkxX7aSUt3JyroE2g9fd05Ydqb7w
 Po/8gMtlEv6OvzTqLwFdyggisLznVzo=
X-Google-Smtp-Source: ABdhPJzAqoYmaY8jsSANFapDb4hm6HOLznGK/1iEai17XbhmHBOcQ49dIWxL8qCzjjNXAPyEZpyFeg==
X-Received: by 2002:a5d:4fc7:: with SMTP id h7mr13620735wrw.333.1630933882796; 
 Mon, 06 Sep 2021 06:11:22 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k4sm7992331wrm.74.2021.09.06.06.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:11:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/36] i386: Add 'sgx-epc' device to expose EPC sections to
 guest
Date: Mon,  6 Sep 2021 15:10:35 +0200
Message-Id: <20210906131059.55234-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906131059.55234-1-pbonzini@redhat.com>
References: <20210906131059.55234-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yang Zhong <yang.zhong@intel.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

SGX EPC is enumerated through CPUID, i.e. EPC "devices" need to be
realized prior to realizing the vCPUs themselves, which occurs long
before generic devices are parsed and realized.  Because of this,
do not allow 'sgx-epc' devices to be instantiated after vCPUS have
been created.

The 'sgx-epc' device is essentially a placholder at this time, it will
be fully implemented in a future patch along with a dedicated command
to create 'sgx-epc' devices.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210719112136.57018-5-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/meson.build       |   1 +
 hw/i386/sgx-epc.c         | 161 ++++++++++++++++++++++++++++++++++++++
 include/hw/i386/sgx-epc.h |  44 +++++++++++
 3 files changed, 206 insertions(+)
 create mode 100644 hw/i386/sgx-epc.c
 create mode 100644 include/hw/i386/sgx-epc.h

diff --git a/hw/i386/meson.build b/hw/i386/meson.build
index 80dad29f2b..27476b36bb 100644
--- a/hw/i386/meson.build
+++ b/hw/i386/meson.build
@@ -5,6 +5,7 @@ i386_ss.add(files(
   'e820_memory_layout.c',
   'multiboot.c',
   'x86.c',
+  'sgx-epc.c',
 ))
 
 i386_ss.add(when: 'CONFIG_X86_IOMMU', if_true: files('x86-iommu.c'),
diff --git a/hw/i386/sgx-epc.c b/hw/i386/sgx-epc.c
new file mode 100644
index 0000000000..aa487dea79
--- /dev/null
+++ b/hw/i386/sgx-epc.c
@@ -0,0 +1,161 @@
+/*
+ * SGX EPC device
+ *
+ * Copyright (C) 2019 Intel Corporation
+ *
+ * Authors:
+ *   Sean Christopherson <sean.j.christopherson@intel.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#include "qemu/osdep.h"
+#include "hw/i386/pc.h"
+#include "hw/i386/sgx-epc.h"
+#include "hw/mem/memory-device.h"
+#include "hw/qdev-properties.h"
+#include "monitor/qdev.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "qemu/config-file.h"
+#include "qemu/error-report.h"
+#include "qemu/option.h"
+#include "qemu/units.h"
+#include "target/i386/cpu.h"
+#include "exec/address-spaces.h"
+
+static Property sgx_epc_properties[] = {
+    DEFINE_PROP_UINT64(SGX_EPC_ADDR_PROP, SGXEPCDevice, addr, 0),
+    DEFINE_PROP_LINK(SGX_EPC_MEMDEV_PROP, SGXEPCDevice, hostmem,
+                     TYPE_MEMORY_BACKEND, HostMemoryBackend *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void sgx_epc_get_size(Object *obj, Visitor *v, const char *name,
+                             void *opaque, Error **errp)
+{
+    Error *local_err = NULL;
+    uint64_t value;
+
+    value = memory_device_get_region_size(MEMORY_DEVICE(obj), &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    visit_type_uint64(v, name, &value, errp);
+}
+
+static void sgx_epc_init(Object *obj)
+{
+    object_property_add(obj, SGX_EPC_SIZE_PROP, "uint64", sgx_epc_get_size,
+                        NULL, NULL, NULL);
+}
+
+static void sgx_epc_realize(DeviceState *dev, Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
+    X86MachineState *x86ms = X86_MACHINE(pcms);
+    SGXEPCDevice *epc = SGX_EPC(dev);
+    const char *path;
+
+    if (x86ms->boot_cpus != 0) {
+        error_setg(errp, "'" TYPE_SGX_EPC "' can't be created after vCPUs,"
+                         "e.g. via -device");
+        return;
+    }
+
+    if (!epc->hostmem) {
+        error_setg(errp, "'" SGX_EPC_MEMDEV_PROP "' property is not set");
+        return;
+    } else if (host_memory_backend_is_mapped(epc->hostmem)) {
+        path = object_get_canonical_path_component(OBJECT(epc->hostmem));
+        error_setg(errp, "can't use already busy memdev: %s", path);
+        return;
+    }
+
+    error_setg(errp, "'" TYPE_SGX_EPC "' not supported");
+}
+
+static void sgx_epc_unrealize(DeviceState *dev)
+{
+    SGXEPCDevice *epc = SGX_EPC(dev);
+
+    host_memory_backend_set_mapped(epc->hostmem, false);
+}
+
+static uint64_t sgx_epc_md_get_addr(const MemoryDeviceState *md)
+{
+    const SGXEPCDevice *epc = SGX_EPC(md);
+
+    return epc->addr;
+}
+
+static void sgx_epc_md_set_addr(MemoryDeviceState *md, uint64_t addr,
+                                Error **errp)
+{
+    object_property_set_uint(OBJECT(md), SGX_EPC_ADDR_PROP, addr, errp);
+}
+
+static uint64_t sgx_epc_md_get_plugged_size(const MemoryDeviceState *md,
+                                            Error **errp)
+{
+    return 0;
+}
+
+static MemoryRegion *sgx_epc_md_get_memory_region(MemoryDeviceState *md,
+                                                  Error **errp)
+{
+    SGXEPCDevice *epc = SGX_EPC(md);
+
+    if (!epc->hostmem) {
+        error_setg(errp, "'" SGX_EPC_MEMDEV_PROP "' property must be set");
+        return NULL;
+    }
+
+    return host_memory_backend_get_memory(epc->hostmem);
+}
+
+static void sgx_epc_md_fill_device_info(const MemoryDeviceState *md,
+                                        MemoryDeviceInfo *info)
+{
+    /* TODO */
+}
+
+static void sgx_epc_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    MemoryDeviceClass *mdc = MEMORY_DEVICE_CLASS(oc);
+
+    dc->hotpluggable = false;
+    dc->realize = sgx_epc_realize;
+    dc->unrealize = sgx_epc_unrealize;
+    dc->desc = "SGX EPC section";
+    device_class_set_props(dc, sgx_epc_properties);
+
+    mdc->get_addr = sgx_epc_md_get_addr;
+    mdc->set_addr = sgx_epc_md_set_addr;
+    mdc->get_plugged_size = sgx_epc_md_get_plugged_size;
+    mdc->get_memory_region = sgx_epc_md_get_memory_region;
+    mdc->fill_device_info = sgx_epc_md_fill_device_info;
+}
+
+static TypeInfo sgx_epc_info = {
+    .name          = TYPE_SGX_EPC,
+    .parent        = TYPE_DEVICE,
+    .instance_size = sizeof(SGXEPCDevice),
+    .instance_init = sgx_epc_init,
+    .class_init    = sgx_epc_class_init,
+    .class_size    = sizeof(DeviceClass),
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_MEMORY_DEVICE },
+        { }
+    },
+};
+
+static void sgx_epc_register_types(void)
+{
+    type_register_static(&sgx_epc_info);
+}
+
+type_init(sgx_epc_register_types)
diff --git a/include/hw/i386/sgx-epc.h b/include/hw/i386/sgx-epc.h
new file mode 100644
index 0000000000..5fd9ae2d0c
--- /dev/null
+++ b/include/hw/i386/sgx-epc.h
@@ -0,0 +1,44 @@
+/*
+ * SGX EPC device
+ *
+ * Copyright (C) 2019 Intel Corporation
+ *
+ * Authors:
+ *   Sean Christopherson <sean.j.christopherson@intel.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#ifndef QEMU_SGX_EPC_H
+#define QEMU_SGX_EPC_H
+
+#include "sysemu/hostmem.h"
+
+#define TYPE_SGX_EPC "sgx-epc"
+#define SGX_EPC(obj) \
+    OBJECT_CHECK(SGXEPCDevice, (obj), TYPE_SGX_EPC)
+#define SGX_EPC_CLASS(oc) \
+    OBJECT_CLASS_CHECK(SGXEPCDeviceClass, (oc), TYPE_SGX_EPC)
+#define SGX_EPC_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(SGXEPCDeviceClass, (obj), TYPE_SGX_EPC)
+
+#define SGX_EPC_ADDR_PROP "addr"
+#define SGX_EPC_SIZE_PROP "size"
+#define SGX_EPC_MEMDEV_PROP "memdev"
+
+/**
+ * SGXEPCDevice:
+ * @addr: starting guest physical address, where @SGXEPCDevice is mapped.
+ *         Default value: 0, means that address is auto-allocated.
+ * @hostmem: host memory backend providing memory for @SGXEPCDevice
+ */
+typedef struct SGXEPCDevice {
+    /* private */
+    DeviceState parent_obj;
+
+    /* public */
+    uint64_t addr;
+    HostMemoryBackend *hostmem;
+} SGXEPCDevice;
+
+#endif
-- 
2.31.1



