Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A10032E8E52
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 22:12:40 +0100 (CET)
Received: from localhost ([::1]:41198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwAg3-00033X-MK
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 16:12:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwALk-0003WE-DA
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:51:40 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:40443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwALi-000627-4s
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:51:40 -0500
Received: by mail-wm1-x32d.google.com with SMTP id r4so16633353wmh.5
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vk9ef97QDUNpHBStg8pmVYzoNEbvcbdNF0ytCvsbRxg=;
 b=E2/8zhP0cYsgiOYb8EDZ1E81JJMVM7FJp4m1nH4rzcLcGI1U1X5sX1NAxYcWXByOUN
 KIL8ZCOmivkSAITgsIFwzlIVBO16KXIpmLr+cj72UI9k6lsOX7TVPM7r9J3Mv3UqKNdi
 c1Em4wnrNtYjgluzdP7/rQHuj3Pqpexv+bYcgmFX+3tYwDNCZHGr4OIANz0950/YRUT3
 yGP+lf/27oiQ9O9tUIHltuXbG1t5/dRVk8CeVKoXTL4bAYwZ+m10fKkV6Is8dosrune+
 vEoQ7TPMEb7mw8O5sLIdRU5Yf8DpBOfS28WbxXJcSYPypq+Xb2UA9kdXuAWO2pnNc7rt
 aUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vk9ef97QDUNpHBStg8pmVYzoNEbvcbdNF0ytCvsbRxg=;
 b=ONtdDBNpNv72nhqifFAAsap1fpJL+CbWh41xGhQi7MEZTIHPifPS3LycFcQAA5cBgl
 K2wz64MZLxSwSw4x3g0NsmhjMZ5hOW6tNnJUhBZ8QL5ybOPXZCJqkjt2/SpD/+foh4EC
 Yd5e+FpQi4uFUTin/dBjwpKgOQiDDdPvurUZM7b/vkOKrLJAo0FDwpNJAQBwe9Nu2OTI
 6Z/3OwUvbJQ8GDF0o0dpFHkCGtngzFzzhSS1RIST0pXq1M8y6vDsUMh2EApYByFkwolU
 nw6O90+zZBhoJ1clmoi9Woz9duiHEs3JFzL0IhOj61WhDCPekW/FSM3AfIMK2zOVglP7
 ZhgQ==
X-Gm-Message-State: AOAM5305Q9GrX2ILb21cRk9Kn1zCG8uimGCwlhQ7IoFszmjMMdQhk3r3
 sEfd2PbF/+2TRJuYiKiPt7rP1HP7/l8=
X-Google-Smtp-Source: ABdhPJxvUyyvSW5JYy9Dbo8laOLIJYKpbwRyG8hHKBgAXkCfKVGn7FIffzfOJZhrhvTr23nxSMEvmw==
X-Received: by 2002:a7b:c35a:: with SMTP id l26mr23514489wmj.182.1609707096081; 
 Sun, 03 Jan 2021 12:51:36 -0800 (PST)
Received: from localhost.localdomain
 (194.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id u10sm28588693wmd.43.2021.01.03.12.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 12:51:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/35] vt82c686: Convert debug printf to trace points
Date: Sun,  3 Jan 2021 21:50:01 +0100
Message-Id: <20210103205021.2837760-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103205021.2837760-1-f4bug@amsat.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Drop DPRINTF and use trace functions instead. Two debug messages about
unimplemented registers could be converted to qemu_log_mask() but in
reality all registers are currently unimplemented (we just store and
return values of writable regs but do nothing with them). As we
already trace register access there's no need for additional debug
messages so these are just removed and a comment is added as a reminder.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <785854022a37035f66d89e70cb6ca1bc0e0d0163.1609584216.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c   | 51 +++++++++++++--------------------------------
 hw/isa/trace-events |  6 ++++++
 2 files changed, 21 insertions(+), 36 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index cd87ec01039..d7ce15bf9f3 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -27,14 +27,7 @@
 #include "qemu/timer.h"
 #include "exec/address-spaces.h"
 #include "qom/object.h"
-
-/* #define DEBUG_VT82C686B */
-
-#ifdef DEBUG_VT82C686B
-#define DPRINTF(fmt, ...) fprintf(stderr, "%s: " fmt, __func__, ##__VA_ARGS__)
-#else
-#define DPRINTF(fmt, ...)
-#endif
+#include "trace.h"
 
 typedef struct SuperIOConfig {
     uint8_t config[0x100];
@@ -55,12 +48,12 @@ static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
 {
     SuperIOConfig *superio_conf = opaque;
 
-    DPRINTF("superio_ioport_writeb  address 0x%x  val 0x%x\n", addr, data);
-    if (addr == 0x3f0) {
+    if (addr == 0x3f0) { /* config index register */
         superio_conf->index = data & 0xff;
     } else {
         bool can_write = true;
-        /* 0x3f1 */
+        /* 0x3f1, config data register */
+        trace_via_superio_write(superio_conf->index, data & 0xff);
         switch (superio_conf->index) {
         case 0x00 ... 0xdf:
         case 0xe4:
@@ -73,18 +66,7 @@ static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
         case 0xfd ... 0xff:
             can_write = false;
             break;
-        case 0xe7:
-            if ((data & 0xff) != 0xfe) {
-                DPRINTF("change uart 1 base. unsupported yet\n");
-                can_write = false;
-            }
-            break;
-        case 0xe8:
-            if ((data & 0xff) != 0xbe) {
-                DPRINTF("change uart 2 base. unsupported yet\n");
-                can_write = false;
-            }
-            break;
+        /* case 0xe6 ... 0xe8: Should set base port of parallel and serial */
         default:
             break;
 
@@ -98,9 +80,10 @@ static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
 static uint64_t superio_ioport_readb(void *opaque, hwaddr addr, unsigned size)
 {
     SuperIOConfig *superio_conf = opaque;
+    uint8_t val = superio_conf->config[superio_conf->index];
 
-    DPRINTF("superio_ioport_readb  address 0x%x\n", addr);
-    return superio_conf->config[superio_conf->index];
+    trace_via_superio_read(superio_conf->index, val);
+    return val;
 }
 
 static const MemoryRegionOps superio_ops = {
@@ -141,16 +124,14 @@ static void vt82c686b_isa_reset(DeviceState *dev)
 }
 
 /* write config pci function0 registers. PCI-ISA bridge */
-static void vt82c686b_write_config(PCIDevice *d, uint32_t address,
+static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
                                    uint32_t val, int len)
 {
     VT82C686BISAState *vt686 = VT82C686B_ISA(d);
 
-    DPRINTF("vt82c686b_write_config  address 0x%x  val 0x%x len 0x%x\n",
-           address, val, len);
-
-    pci_default_write_config(d, address, val, len);
-    if (address == 0x85) {  /* enable or disable super IO configure */
+    trace_via_isa_write(addr, val, len);
+    pci_default_write_config(d, addr, val, len);
+    if (addr == 0x85) {  /* enable or disable super IO configure */
         memory_region_set_enabled(&vt686->superio, val & 0x2);
     }
 }
@@ -203,12 +184,10 @@ static void pm_io_space_update(VT686PMState *s)
     memory_region_transaction_commit();
 }
 
-static void pm_write_config(PCIDevice *d,
-                            uint32_t address, uint32_t val, int len)
+static void pm_write_config(PCIDevice *d, uint32_t addr, uint32_t val, int len)
 {
-    DPRINTF("pm_write_config  address 0x%x  val 0x%x len 0x%x\n",
-           address, val, len);
-    pci_default_write_config(d, address, val, len);
+    trace_via_pm_write(addr, val, len);
+    pci_default_write_config(d, addr, val, len);
 }
 
 static int vmstate_acpi_post_load(void *opaque, int version_id)
diff --git a/hw/isa/trace-events b/hw/isa/trace-events
index 3544c6213c3..d267d3e6524 100644
--- a/hw/isa/trace-events
+++ b/hw/isa/trace-events
@@ -13,3 +13,9 @@ pc87312_io_write(uint32_t addr, uint32_t val) "write addr=0x%x val=0x%x"
 # apm.c
 apm_io_read(uint8_t addr, uint8_t val) "read addr=0x%x val=0x%02x"
 apm_io_write(uint8_t addr, uint8_t val) "write addr=0x%x val=0x%02x"
+
+# vt82c686.c
+via_isa_write(uint32_t addr, uint32_t val, int len) "addr 0x%x val 0x%x len 0x%x"
+via_pm_write(uint32_t addr, uint32_t val, int len) "addr 0x%x val 0x%x len 0x%x"
+via_superio_read(uint8_t addr, uint8_t val) "addr 0x%x val 0x%x"
+via_superio_write(uint8_t addr, uint32_t val) "addr 0x%x val 0x%x"
-- 
2.26.2


