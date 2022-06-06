Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAF653F2A6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 01:38:31 +0200 (CEST)
Received: from localhost ([::1]:45264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyMIo-0000NW-1P
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 19:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLzV-0000Tj-Bz
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:18:33 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:43757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLzT-0004NX-Op
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:18:33 -0400
Received: by mail-pl1-x62f.google.com with SMTP id b5so13322889plx.10
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 16:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8VWxIbgIWtKhvuM65y86UvIUmUsFnOFX5fQVBZHjKso=;
 b=XhzJ486jm6M07wrYWYqFPyv3Rm1qhoV0l0c4XqG3OnHEVkd5pkv9VmMNaLgH0dVz0I
 mYs85rwGzsEiq6DzlDdNmurHzCUdtV/qoROTtrR9qfDSx7vhnJ53kF10b8LSpMBpfi+d
 MylgptyaBU5CxTgD52C/gG2DpMKcuJSudcTIBMyYXyC4i/Jmcaawu7KHjqNZlro0bffX
 vEz/oCpVpW6D42hnoQ/ZKZNaVi8MFuVfiazBmMt+T9i6MvU+2BiVysMdRZDO5ED2tTWf
 OQQB5lv48QpiDEw0HNYum1Ry2QNOxFOB2sRbrsUVvoTv7bqszMO86xG9xpAwos5hNzPJ
 ebcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8VWxIbgIWtKhvuM65y86UvIUmUsFnOFX5fQVBZHjKso=;
 b=Pba9ddV0MbHNw92WJg/7qQzo8Mz+HQcqBEhFW/AzO9eBctgEmx1rysRRL7IZjEj0bo
 qVzxo/eI+ruNWnlEQEGZlYUJiXwPaSoUw5yOWUJH0qcGG+8ZG+R6jBSB2QEsJq54Tr7a
 T43aQ+AG3EaidRPJiUGFCzvbEc524MrAwEFZSyszMmo8ywJ3bMnq0e3wX4mmfvwct28A
 bK4ug6Rcph0Euf7weH3/b1u+Lxx2tfTlvTZ9hRjN89l6pr2biNzgdFlmkUmkdtly0pQQ
 TeKKPBDqlRGKV7iJCL/ceRlG5uUa1PY78P7I+ktTZ4nT5TQ4l8q8WQbry/wVnBxLg1YF
 3hLw==
X-Gm-Message-State: AOAM532xD8LKkZ/hG9QbnyXOl0Yy+GjhCEoxLme6kJnV5YTVwmpGl7Dy
 jAbLMTRFIrKAFvSBMTqtoTfZZwmkXPh7tA==
X-Google-Smtp-Source: ABdhPJzTTyNppuqP5ujv2cs0iuIfkKs+jzL7/xRQip8oZrHDNO2ilmju1xxbs5SFHDO+7L2ZcxNmyg==
X-Received: by 2002:a17:903:120a:b0:15f:99f:95bc with SMTP id
 l10-20020a170903120a00b0015f099f95bcmr26252044plh.48.1654557510078; 
 Mon, 06 Jun 2022 16:18:30 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a17090a170e00b001df239bab14sm10667754pjd.46.2022.06.06.16.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:18:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 Song Gao <gaosong@loongson.cn>
Subject: [PULL 40/43] hw/loongarch: Add LoongArch virt power manager support.
Date: Mon,  6 Jun 2022 16:14:47 -0700
Message-Id: <20220606231450.448443-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606231450.448443-1-richard.henderson@linaro.org>
References: <20220606231450.448443-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

This is a placeholder for missing ACPI, and will eventually be replaced.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220606124333.2060567-41-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/loongarch/loongson3.c | 49 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index 3c8fcb828c..bd20ebbb78 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -31,6 +31,48 @@
 
 #include "target/loongarch/cpu.h"
 
+#define PM_BASE 0x10080000
+#define PM_SIZE 0x100
+#define PM_CTRL 0x10
+
+/*
+ * This is a placeholder for missing ACPI,
+ * and will eventually be replaced.
+ */
+static uint64_t loongarch_virt_pm_read(void *opaque, hwaddr addr, unsigned size)
+{
+    return 0;
+}
+
+static void loongarch_virt_pm_write(void *opaque, hwaddr addr,
+                               uint64_t val, unsigned size)
+{
+    if (addr != PM_CTRL) {
+        return;
+    }
+
+    switch (val) {
+    case 0x00:
+        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+        return;
+    case 0xff:
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+        return;
+    default:
+        return;
+    }
+}
+
+static const MemoryRegionOps loongarch_virt_pm_ops = {
+    .read  = loongarch_virt_pm_read,
+    .write = loongarch_virt_pm_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 1
+    }
+};
+
 static struct _loaderparams {
     uint64_t ram_size;
     const char *kernel_filename;
@@ -67,7 +109,7 @@ static void loongarch_devices_init(DeviceState *pch_pic)
     SysBusDevice *d;
     PCIBus *pci_bus;
     MemoryRegion *ecam_alias, *ecam_reg, *pio_alias, *pio_reg;
-    MemoryRegion *mmio_alias, *mmio_reg;
+    MemoryRegion *mmio_alias, *mmio_reg, *pm_mem;
     int i;
 
     gpex_dev = qdev_new(TYPE_GPEX_HOST);
@@ -132,6 +174,11 @@ static void loongarch_devices_init(DeviceState *pch_pic)
     sysbus_create_simple("ls7a_rtc", LS7A_RTC_REG_BASE,
                          qdev_get_gpio_in(pch_pic,
                          LS7A_RTC_IRQ - PCH_PIC_IRQ_OFFSET));
+
+    pm_mem = g_new(MemoryRegion, 1);
+    memory_region_init_io(pm_mem, NULL, &loongarch_virt_pm_ops,
+                          NULL, "loongarch_virt_pm", PM_SIZE);
+    memory_region_add_subregion(get_system_memory(), PM_BASE, pm_mem);
 }
 
 static void loongarch_irq_init(LoongArchMachineState *lams)
-- 
2.34.1


