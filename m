Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C49D2DAED1
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:22:42 +0100 (CET)
Received: from localhost ([::1]:40492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpBDt-0004lN-KG
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:22:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4h-0001bx-CZ
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:13:12 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:53123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4W-0007B6-BR
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:13:07 -0500
Received: by mail-wm1-x32e.google.com with SMTP id a6so17006091wmc.2
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 06:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Wfa/U1kU0UDN9y21zzgk5Zm+h6nZ9h0WDfMI1dRr7eI=;
 b=fjIJJs5ThcijIJ0XAV+wmq7dYLQGKL46ine3rXN5XwfYVyGadWCVYR98+X/lSWRDK1
 HbbdadPF/0/l/B+kVEYEJsuUxgd0ap5oKjAIq+EsOT1UgV74G0nP5pphd0qZheUeILKV
 9D6stSYx8Na/FvNM9E6CG3Gh5KXUE/EZ631zQwkO/9sovf2A3/Fd5y9udx5Kwhc8qo1u
 ocInKjz8N0OTq6RxAhdxQjI1Pepj2O1lZpC1O5woZWICmmEiqIK+OVVGDT0SsL57Fx/q
 qUakJ4D4XH5HgByqeCy+vVRnrP88myMIIFQbbIyn3Hd5ENfY98ILX61Y0u3sxB2dK11n
 OE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wfa/U1kU0UDN9y21zzgk5Zm+h6nZ9h0WDfMI1dRr7eI=;
 b=fzkdOaTXxcYfjKX6hQweFFj8KpJhzYln6EM5i4ElZMhP6fM9toc8m8/4bmxfrVqATu
 45W/DDUYVqAUAZjpSGRamR9mmYb7CN4UCrybQzPIwlGJ6boJSo9g7ONxDIuA8GyqppGb
 0rKl1+R0kDX4SzPjL5we75T0HDdQqavSXtPDq+d9cTl4+aFWic5zkm7SwxDuhiBCP/sv
 EEcGFbVvC1noiEeFD2W/OHskCL64j7BkZ94KMJDJfcri1Yn/8AY//h5+Z7/FcuGWqDiZ
 +Uj3IIhAEyrxea2uH0lUAmOPUmm1fWnmYlY5UCm88GAv80buE6WYwTbImFVHJ3J/XzMs
 lb3g==
X-Gm-Message-State: AOAM531qsgNKKKomQmKDip9uWb2zLHZ95ycldggI31iH8i0LvxH+vjF2
 MjIRuuUzRw19WV274WOYO7i3qnSOfvDNbg==
X-Google-Smtp-Source: ABdhPJwZlZlmJ+JCHZJyPQpuqgiP6IATFsAZQ0ztkNOZSiVlcO9ZqNmWB1rl3TrNX5q6Gi4eaSQogw==
X-Received: by 2002:a1c:3d55:: with SMTP id k82mr32466200wma.57.1608041576038; 
 Tue, 15 Dec 2020 06:12:56 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w21sm19667319wmi.45.2020.12.15.06.12.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 06:12:55 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/20] usb: xlnx-usb-subsystem: Add xilinx usb subsystem
Date: Tue, 15 Dec 2020 14:12:31 +0000
Message-Id: <20201215141237.17868-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201215141237.17868-1-peter.maydell@linaro.org>
References: <20201215141237.17868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>

This model is a top level integration wrapper for hcd-dwc3 and
versal-usb2-ctrl-regs modules, this is used by xilinx versal soc's and
future xilinx usb subsystems would also be part of it.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 1607023357-5096-4-git-send-email-sai.pavan.boddu@xilinx.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/usb/xlnx-usb-subsystem.h | 45 ++++++++++++++
 hw/usb/xlnx-usb-subsystem.c         | 94 +++++++++++++++++++++++++++++
 hw/usb/Kconfig                      |  5 ++
 hw/usb/meson.build                  |  1 +
 4 files changed, 145 insertions(+)
 create mode 100644 include/hw/usb/xlnx-usb-subsystem.h
 create mode 100644 hw/usb/xlnx-usb-subsystem.c

diff --git a/include/hw/usb/xlnx-usb-subsystem.h b/include/hw/usb/xlnx-usb-subsystem.h
new file mode 100644
index 00000000000..739bef7f451
--- /dev/null
+++ b/include/hw/usb/xlnx-usb-subsystem.h
@@ -0,0 +1,45 @@
+/*
+ * QEMU model of the Xilinx usb subsystem
+ *
+ * Copyright (c) 2020 Xilinx Inc. Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef _XLNX_VERSAL_USB_SUBSYSTEM_H_
+#define _XLNX_VERSAL_USB_SUBSYSTEM_H_
+
+#include "hw/usb/xlnx-versal-usb2-ctrl-regs.h"
+#include "hw/usb/hcd-dwc3.h"
+
+#define TYPE_XILINX_VERSAL_USB2 "xlnx.versal-usb2"
+
+#define VERSAL_USB2(obj) \
+     OBJECT_CHECK(VersalUsb2, (obj), TYPE_XILINX_VERSAL_USB2)
+
+typedef struct VersalUsb2 {
+    SysBusDevice parent_obj;
+    MemoryRegion dwc3_mr;
+    MemoryRegion usb2Ctrl_mr;
+
+    VersalUsb2CtrlRegs usb2Ctrl;
+    USBDWC3 dwc3;
+} VersalUsb2;
+
+#endif
diff --git a/hw/usb/xlnx-usb-subsystem.c b/hw/usb/xlnx-usb-subsystem.c
new file mode 100644
index 00000000000..568257370cb
--- /dev/null
+++ b/hw/usb/xlnx-usb-subsystem.c
@@ -0,0 +1,94 @@
+/*
+ * QEMU model of the Xilinx usb subsystem
+ *
+ * Copyright (c) 2020 Xilinx Inc. Sai Pavan Boddu <sai.pava.boddu@xilinx.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/irq.h"
+#include "hw/register.h"
+#include "qemu/bitops.h"
+#include "qemu/log.h"
+#include "qom/object.h"
+#include "qapi/error.h"
+#include "hw/qdev-properties.h"
+#include "hw/usb/xlnx-usb-subsystem.h"
+
+static void versal_usb2_realize(DeviceState *dev, Error **errp)
+{
+    VersalUsb2 *s = VERSAL_USB2(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    Error *err = NULL;
+
+    sysbus_realize(SYS_BUS_DEVICE(&s->dwc3), &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_realize(SYS_BUS_DEVICE(&s->usb2Ctrl), &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_init_mmio(sbd, &s->dwc3_mr);
+    sysbus_init_mmio(sbd, &s->usb2Ctrl_mr);
+    qdev_pass_gpios(DEVICE(&s->dwc3.sysbus_xhci), dev, SYSBUS_DEVICE_GPIO_IRQ);
+}
+
+static void versal_usb2_init(Object *obj)
+{
+    VersalUsb2 *s = VERSAL_USB2(obj);
+
+    object_initialize_child(obj, "versal.dwc3", &s->dwc3,
+                            TYPE_USB_DWC3);
+    object_initialize_child(obj, "versal.usb2-ctrl", &s->usb2Ctrl,
+                            TYPE_XILINX_VERSAL_USB2_CTRL_REGS);
+    memory_region_init_alias(&s->dwc3_mr, obj, "versal.dwc3_alias",
+                             &s->dwc3.iomem, 0, DWC3_SIZE);
+    memory_region_init_alias(&s->usb2Ctrl_mr, obj, "versal.usb2Ctrl_alias",
+                             &s->usb2Ctrl.iomem, 0, USB2_REGS_R_MAX * 4);
+    qdev_alias_all_properties(DEVICE(&s->dwc3), obj);
+    qdev_alias_all_properties(DEVICE(&s->dwc3.sysbus_xhci), obj);
+    object_property_add_alias(obj, "dma", OBJECT(&s->dwc3.sysbus_xhci), "dma");
+}
+
+static void versal_usb2_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = versal_usb2_realize;
+}
+
+static const TypeInfo versal_usb2_info = {
+    .name          = TYPE_XILINX_VERSAL_USB2,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(VersalUsb2),
+    .class_init    = versal_usb2_class_init,
+    .instance_init = versal_usb2_init,
+};
+
+static void versal_usb_types(void)
+{
+    type_register_static(&versal_usb2_info);
+}
+
+type_init(versal_usb_types)
diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
index 56da78a4faf..40093d7ea6b 100644
--- a/hw/usb/Kconfig
+++ b/hw/usb/Kconfig
@@ -117,3 +117,8 @@ config USB_DWC3
     bool
     select USB_XHCI_SYSBUS
     select REGISTER
+
+config XLNX_USB_SUBSYS
+    bool
+    default y if XLNX_VERSAL
+    select USB_DWC3
diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index 433c27e833e..f46c6b66553 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -32,6 +32,7 @@ softmmu_ss.add(when: 'CONFIG_TUSB6010', if_true: files('tusb6010.c'))
 softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('chipidea.c'))
 softmmu_ss.add(when: 'CONFIG_IMX_USBPHY', if_true: files('imx-usb-phy.c'))
 specific_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-usb2-ctrl-regs.c'))
+specific_ss.add(when: 'CONFIG_XLNX_USB_SUBSYS', if_true: files('xlnx-usb-subsystem.c'))
 
 # emulated usb devices
 softmmu_ss.add(when: 'CONFIG_USB', if_true: files('dev-hub.c'))
-- 
2.20.1


