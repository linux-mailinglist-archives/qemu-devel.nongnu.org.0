Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 177ED6AFADF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 01:09:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZhLr-0006rD-MO; Tue, 07 Mar 2023 19:08:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZhLo-0006kf-5H
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 19:08:12 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZhLk-0006MJ-GA
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 19:08:10 -0500
Received: by mail-wm1-x333.google.com with SMTP id az36so8853407wmb.1
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 16:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678234086;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o7UG29aKxfCUB3a3IVPEqYfZ+ICdapBpQUSBVSGAGHY=;
 b=jDJ7IG/o/5Oi7PzM16pQuG2GqUB6PZZoyl/QsM+c5KyEdOAQpqNbH9loc/lkmDyH6o
 Y0fqmgnZqGr+56V6bc0YK37TSTHuYFFVsIPg/fmGhy52z/HxBcXTVEpPtdCw5Z/g1EhL
 gKUEaYl3IblDCJ2dzLFagli24F3+PjxOcr4iRbd4E25YhLmYd71eMLDiTHj0zn916lV8
 pL3MmbPcptaRnkyIV+QnENQ15/m1MaieqEWa/KekF26sz2sM27Z7FKMnkMFm1uz6SVll
 nboTRftAIrPO8KcoHP+1OxobgCLbW+U1GDbR8WehGpX7Wg7UbHeCOYtSL7m0t3wF7NRs
 4weQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678234086;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o7UG29aKxfCUB3a3IVPEqYfZ+ICdapBpQUSBVSGAGHY=;
 b=f3pgF9Bs0/TX9Blbz6KbBtifP1CCUx08Rvj2QDuhQ90VnoFbNPt3LjNfxj9cMV4vuw
 Wa8nZIf72co5mwipNYgNBZx0zHK7lG8h8FSM2MYQDrKjT+ah+24+7C4RCerTSo+PxDDi
 Wcu29QnVsEZ5BoDAn2aGlebKUJcXjawCqe7ThKldogsamnBuTly23/K6PordAB1CkFqZ
 HZE7D2jyyA/zAkbUjnCsXLe2VU7acczSaYa8w8L2X1KGb6GcE5JzfNIJgViUYwKIduiM
 EgGjTgxU2QgVSDlA8y6kKrvZ4kcPIY8yIraQslGJKAETMfCfrQ63XtvJASadeQPbRSJ1
 pYeQ==
X-Gm-Message-State: AO0yUKWErLU5ThDPtNsJY8t8IlW/fmlLjyMLcaEZeW38JqHfyL7RvmY3
 jvVrxokuSv/SUGkrZDCdgVBFh/VBaWyk5JJ0aI0=
X-Google-Smtp-Source: AK7set9wlGmmV96DJEZANJBTOIWbvf3iO9G0qow9wcvwnT5EWHyd+qlqT8kK4H1FdxRj8UYRl++ugQ==
X-Received: by 2002:a05:600c:1d1a:b0:3eb:3e75:5d6e with SMTP id
 l26-20020a05600c1d1a00b003eb3e755d6emr11570669wms.18.1678234086597; 
 Tue, 07 Mar 2023 16:08:06 -0800 (PST)
Received: from localhost.localdomain (57.red-88-29-179.dynamicip.rima-tde.net.
 [88.29.179.57]) by smtp.gmail.com with ESMTPSA id
 v12-20020a05600c12cc00b003de2fc8214esm13834900wmd.20.2023.03.07.16.08.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Mar 2023 16:08:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 3/4] hw/misc: Add MIPS Trickbox device
Date: Wed,  8 Mar 2023 01:07:44 +0100
Message-Id: <20230308000745.56394-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230308000745.56394-1-philmd@linaro.org>
References: <20230308000745.56394-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

MIPS Trickbox is a emulated device present in MIPS's IASIM simulator
for decades. It's capable of managing simulator status, signaling
interrupts, doing DMA and EJTAG signal stimulations.

For now we just use definition of this device and implement power
management related functions.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <20230304223803.55764-2-jiaxun.yang@flygoat.com>
[PMD: Remove pointless mask in mips_trickbox_write(),
      declare QOM macros using OBJECT_DECLARE_SIMPLE_TYPE()]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/misc/Kconfig                 |  3 +
 hw/misc/meson.build             |  1 +
 hw/misc/mips_trickbox.c         | 97 +++++++++++++++++++++++++++++++++
 hw/misc/trace-events            |  4 ++
 include/hw/misc/mips_trickbox.h | 39 +++++++++++++
 5 files changed, 144 insertions(+)
 create mode 100644 hw/misc/mips_trickbox.c
 create mode 100644 include/hw/misc/mips_trickbox.h

diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 2ef5781ef8..9f09da23c1 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -85,6 +85,9 @@ config STM32F4XX_EXTI
 config MIPS_ITU
     bool
 
+config MIPS_TRICKBOX
+    bool
+
 config MPS2_FPGAIO
     bool
     select LED
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index a40245ad44..4b6c50832c 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -136,6 +136,7 @@ specific_ss.add(when: 'CONFIG_MAC_VIA', if_true: files('mac_via.c'))
 
 specific_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_cmgcr.c', 'mips_cpc.c'))
 specific_ss.add(when: 'CONFIG_MIPS_ITU', if_true: files('mips_itu.c'))
+specific_ss.add(when: 'CONFIG_MIPS_TRICKBOX', if_true: files('mips_trickbox.c'))
 
 softmmu_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa_ec.c'))
 
diff --git a/hw/misc/mips_trickbox.c b/hw/misc/mips_trickbox.c
new file mode 100644
index 0000000000..86b00a8c0d
--- /dev/null
+++ b/hw/misc/mips_trickbox.c
@@ -0,0 +1,97 @@
+/*
+ * SPDX-License-Identifier: LGPL-2.0-or-later
+ *
+ * MIPS Trickbox
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "qapi/error.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "trace.h"
+#include "sysemu/runstate.h"
+#include "hw/misc/mips_trickbox.h"
+
+static uint64_t mips_trickbox_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    uint64_t value = 0;
+
+    qemu_log_mask(LOG_UNIMP,
+                    "%s: unimplemented register read 0x%02"HWADDR_PRIx"\n",
+                    __func__, addr);
+    trace_mips_trickbox_read(size, value);
+
+    return 0;
+}
+
+static void mips_trickbox_write(void *opaque, hwaddr addr,
+           uint64_t val64, unsigned int size)
+{
+    trace_mips_trickbox_write(size, val64);
+
+    switch (addr) {
+    case REG_SIM_CMD:
+        switch (val64) {
+        case TRICK_PANIC:
+            qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_PANIC);
+            break;
+        case TRICK_HALT:
+            qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+            break;
+        case TRICK_SUSPEND:
+            qemu_system_suspend_request();
+            break;
+        case TRICK_RESET:
+            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+            break;
+        case TRICK_PASS_MIPS:
+        case TRICK_PASS_NANOMIPS:
+            exit(EXIT_SUCCESS);
+            break;
+        case TRICK_FAIL_MIPS:
+        case TRICK_FAIL_NANOMIPS:
+            exit(EXIT_FAILURE);
+            break;
+        }
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: unimplemented register write 0x%02"HWADDR_PRIx"\n",
+                      __func__, addr);
+        break;
+    }
+}
+
+static const MemoryRegionOps mips_trickbox_ops = {
+    .read = mips_trickbox_read,
+    .write = mips_trickbox_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 2,
+        .max_access_size = 4
+    }
+};
+
+static void mips_trickbox_init(Object *obj)
+{
+    MIPSTrickboxState *s = MIPS_TRICKBOX(obj);
+
+    memory_region_init_io(&s->mmio, obj, &mips_trickbox_ops, s,
+                          TYPE_MIPS_TRICKBOX, 0x100);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
+}
+
+static const TypeInfo mips_trickbox_info = {
+    .name          = TYPE_MIPS_TRICKBOX,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(MIPSTrickboxState),
+    .instance_init = mips_trickbox_init,
+};
+
+static void mips_trickbox_register_types(void)
+{
+    type_register_static(&mips_trickbox_info);
+}
+
+type_init(mips_trickbox_register_types)
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index c47876a902..8603cf0d5a 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -279,3 +279,7 @@ virt_ctrl_instance_init(void *dev) "ctrl: %p"
 lasi_chip_mem_valid(uint64_t addr, uint32_t val) "access to addr 0x%"PRIx64" is %d"
 lasi_chip_read(uint64_t addr, uint32_t val) "addr 0x%"PRIx64" val 0x%08x"
 lasi_chip_write(uint64_t addr, uint32_t val) "addr 0x%"PRIx64" val 0x%08x"
+
+# mips_trickbox.c
+mips_trickbox_read(uint64_t addr, uint32_t val) "addr 0x%"PRIx64" val 0x%08x"
+mips_trickbox_write(uint64_t addr, uint32_t val) "addr 0x%"PRIx64" val 0x%08x"
diff --git a/include/hw/misc/mips_trickbox.h b/include/hw/misc/mips_trickbox.h
new file mode 100644
index 0000000000..bb1093ee6f
--- /dev/null
+++ b/include/hw/misc/mips_trickbox.h
@@ -0,0 +1,39 @@
+/*
+ * SPDX-License-Identifier: LGPL-2.0-or-later
+ *
+ * MIPS Trickbox
+ */
+
+
+#ifndef HW_MIPS_TRICKBOX_H
+#define HW_MIPS_TRICKBOX_H
+
+#include "hw/sysbus.h"
+#include "qom/object.h"
+
+#define TYPE_MIPS_TRICKBOX "mips.trickbox"
+
+OBJECT_DECLARE_SIMPLE_TYPE(MIPSTrickboxState, MIPS_TRICKBOX)
+
+struct MIPSTrickboxState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion mmio;
+};
+
+#define REG_SIM_CMD 0x0
+
+enum {
+    TRICK_PANIC = 1,
+    TRICK_HALT = 2,
+    TRICK_SUSPEND = 3,
+    TRICK_RESET = 4,
+    TRICK_FAIL_MIPS = 0x2c00abc1,
+    TRICK_PASS_MIPS = 0x2c00abc2,
+    TRICK_FAIL_NANOMIPS = 0x80005bc1,
+    TRICK_PASS_NANOMIPS = 0x80005bc2
+};
+
+#endif
-- 
2.38.1


