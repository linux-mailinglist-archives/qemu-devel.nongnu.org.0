Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D915530552
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 20:57:44 +0200 (CEST)
Received: from localhost ([::1]:38682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsqlr-0000wc-Nq
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 14:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBU-0007vY-IP; Sun, 22 May 2022 14:20:09 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBQ-0003az-S0; Sun, 22 May 2022 14:20:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n9qB7O7B3yGEqP/ZSrexd4Prsc3yQr2BuTu7WIeCUAM=; b=JGXvLOzT7UiPYZwRamJU1ZiWeM
 OiO6HJaguZtDN05Mzf8aPibLcmB1bVt2w74xK7tZJF5oxP3RBpIFE2xQkUdZxdgCpO8dhCGYgr9Dq
 L7F9S9KhRchiAUF1tmDntGHKtXFdZqrckdzrzHvlMrQer/uQQtLLf6+loNboyo2ALwgTw8rNS/oUO
 CD+gy/VzoO//qZIcIHXHZj3IyXUuHjv3Zx49aD0cUV3T1E08ta5lWuFOaBheeL152PlZMeA0nWmbr
 fCMgozbewqO3WnMFU7TV9i6iHZtLhwLmxvhLxTWXqbso8lAXPF8LCyuU0mKcv94H0XflAfYXCUcsl
 mcHBByG5fVNH+goEnNPVrTLzk4G57twA0SHvS6GaBSKJldi772my0A3frXTdivvoItdp6kFYBSUXc
 3lrR7kHkWmTM5SAVl1FxEsxuD8rAjwH/Srcm1KVb1qfTp1XjJ3k9hMkNeqIN5CzxV9czxePnmEVHB
 fQMsCVm09lz8RNCskxJXNjYxuMU7wwBpxa2aW+Sl+jY/eMYCMzroFmRc9QlA6k84ffDWm9PWPW9R6
 lF3x202mz3ndbYSZT8ujJHU3vZ8aq0RWO0DlUv/WqzrgHIJS5TsOFEys++u+nFbVNqswkNYN2ok08
 XHbxAsgtqtnxYOzIhMsaU7asoHqQ4g6r1HVYlkDDc=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqA0-0007pH-OU; Sun, 22 May 2022 19:18:38 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:07 +0100
Message-Id: <20220522181836.864-22-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 21/50] pckbd: introduce new I8042_MMIO QOM type
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Currently i8042_mm_init() creates a new KBDState directly which is used by the MIPS
magnum machine. Introduce a new I8042_MMIO QOM type that will soon be used to
allow the MIPS magnum machine to be wired up using standard qdev GPIOs.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/pckbd.c         | 22 +++++++++++++++++++++-
 include/hw/input/i8042.h | 10 ++++++++++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 3a7411f799..bbdd3bc568 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -665,11 +665,23 @@ static const MemoryRegionOps i8042_mmio_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+static void i8042_mmio_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
+}
+
 void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
                    MemoryRegion *region, ram_addr_t size,
                    hwaddr mask)
 {
-    KBDState *s = g_new0(KBDState, 1);
+    DeviceState *dev;
+    KBDState *s;
+
+    dev = qdev_new(TYPE_I8042_MMIO);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    s = &I8042_MMIO(dev)->kbd;
 
     s->irq_kbd = kbd_irq;
     s->irq_mouse = mouse_irq;
@@ -686,6 +698,13 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
     qemu_register_reset(kbd_reset, s);
 }
 
+static const TypeInfo i8042_mmio_info = {
+    .name          = TYPE_I8042_MMIO,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(MMIOKBDState),
+    .class_init    = i8042_mmio_class_init
+};
+
 void i8042_isa_mouse_fake_event(ISAKBDState *isa)
 {
     KBDState *s = &isa->kbd;
@@ -837,6 +856,7 @@ static const TypeInfo i8042_info = {
 static void i8042_register_types(void)
 {
     type_register_static(&i8042_info);
+    type_register_static(&i8042_mmio_info);
 }
 
 type_init(i8042_register_types)
diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
index a246250d1f..b7df9ace6e 100644
--- a/include/hw/input/i8042.h
+++ b/include/hw/input/i8042.h
@@ -9,6 +9,7 @@
 #define HW_INPUT_I8042_H
 
 #include "hw/isa/isa.h"
+#include "hw/sysbus.h"
 #include "qom/object.h"
 
 typedef struct KBDState {
@@ -49,6 +50,15 @@ struct ISAKBDState {
     uint8_t mouse_irq;
 };
 
+#define TYPE_I8042_MMIO "i8042-mmio"
+OBJECT_DECLARE_SIMPLE_TYPE(MMIOKBDState, I8042_MMIO)
+
+struct MMIOKBDState {
+    SysBusDevice parent_obj;
+
+    KBDState kbd;
+};
+
 #define I8042_A20_LINE "a20"
 
 
-- 
2.20.1


