Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E9455B362
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 20:09:36 +0200 (CEST)
Received: from localhost ([::1]:40320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5WhT-0007dG-Or
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 14:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WLw-0003No-Uc
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:47:21 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WLu-0008TV-7G
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:47:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=auHlZ+wkV6v3/EEN8/cki5WMOS9NxMTa97s3q/YR2hU=; b=SiJq2xpfoc2r4IiBo7/6tNM9gr
 uNJCFrFFh9hsbILEcLc2H3b+SWxuxn7Sb235I0w6haWqDWeKusI4090jCy8FQITFi/fYVxybbVwG8
 GIwzSp6LYynuG7zxCptGbIgfIx2/WVpK7USoeWsMljWQK6mxG3WV7AhhGBA28HOPjctx7gyNk4UJ6
 rd1HSypaUz1sHMKPngi60xfzhZjS9SYz6mRue9lnMDGT+lN2D6cAy2ooTF2B77cGyLQaAahe+N+oy
 XryCWbSsQZGxf6Qi3CP1g1ma3B2wzH7EFPekwg3isQEAeDlgsd2jhVzBiyHCw4oDrzwrrJy4IQn43
 ghhQnAMRyygMA3UcR0ScqWFi0kXnW8Sd0JSRoQuKUGa+tQLKAWUyqRA2zmX4KucamCCFM21KMTCHo
 /SouZyK5mSjO+3ooiI9ILnUu+222TP52mbIuEGpURvGQzISCxYchdbdvBOe56t8dTBYUXv22VS7o0
 q172Vl5rRzRWR7w3RYR5euDvFuzR4PYWwjQbQx6pqbNtDLBvhSbkIK6nkdkcUcwCN7j8PDv62T7lw
 wwIeopNqiKJfKmsNG2r8tNmnO3npYHK7X9iS998YBZkc5g7t8GvPEwYl8i5IrcOBUOsj1n3ts/kcW
 mB6wenX6n6/Pxn+fH951VclgBJSq7uWlK3gpmAiTM=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WKP-0007KY-C0; Sun, 26 Jun 2022 18:45:49 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 26 Jun 2022 18:44:57 +0100
Message-Id: <20220626174531.969187-22-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
References: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 21/55] pckbd: introduce new I8042_MMIO QOM type
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
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220624134109.881989-22-mark.cave-ayland@ilande.co.uk>
---
 hw/input/pckbd.c         | 22 +++++++++++++++++++++-
 include/hw/input/i8042.h | 10 ++++++++++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index f99e10cfcf..89a41ed566 100644
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
@@ -841,6 +860,7 @@ static const TypeInfo i8042_info = {
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
2.30.2


