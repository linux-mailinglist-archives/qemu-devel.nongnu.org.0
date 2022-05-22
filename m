Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFA0530528
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 20:28:43 +0200 (CEST)
Received: from localhost ([::1]:38006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsqJm-0002o8-MX
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 14:28:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAf-0006nS-Ug; Sun, 22 May 2022 14:19:18 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAd-0003X1-AO; Sun, 22 May 2022 14:19:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EeuwzG3aOL0CUSEm17zrFZyfOYglQ0a9gysDOU1lNP8=; b=qYMwUVtI6wcg1616LC+xFRT/Hp
 q1Eb2IG5kS+Mn7r4ZIxU1GfDNrH9Oztcxjy2AUrJTU1f9vlue75UJMTV2J/xHa/jRFbyrj1JhQ0S4
 u0GEJXoiAsHsVhbsOkTEutf6BQiKaa4Ud1nhO0w1HMVMaViShhz33oepPPFK53UrniwCzms7cnC3n
 cZLMihTfhEgww2piI1NSPzswJU0BhUlHdL2+EI3Hl1m3qUq79PCemk/yA8PJiNpbytkZGgqLrvAgU
 HtoCPUJtXgsw9Sq4usDxH4TDRZGPVh5ht8soQeyKz63mQsoydlc8dR5RuOCJM1Np/ie+wRTeqb8rP
 BDxBZwyqIR/dLFn7TwvdyCkIEGQ8e6YrFsU3UbYEMs/jc8PTulPgKSNC9CdQGN208MbG3sBA+FSiV
 sFXq22xmrBmVfEqbclslrmPNsPWbe2iAWKO4/P6GoHa3HJ2FSZwtbEBZTU5CQdGJUEVRAGi47JFwy
 N65oAp1CGohrJBTzmFSFhVYmUq9r/n1uHwAFsfrIYZ5XwcCSfZbjQfKhRULL3MJkEyy1O8dLXhHg0
 XquivYn4j5xmHuT4LBKbRovHk0zpS+5ihXdS0SkP4LevcW/mPb3EC2bMrkkpcczYiZZKTZiCeIwbr
 pZiy3//5CL0jUrpKsexkGADt/DImahOcUBzW9f9RY=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsq9V-0007pH-Rz; Sun, 22 May 2022 19:18:06 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:17:51 +0100
Message-Id: <20220522181836.864-6-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 05/50] ps2: move QOM type definitions from ps2.c to ps2.h
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

Move the QOM type definitions into the ps2.h header file to allow the new QOM
types to be used by other devices.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/ps2.c         | 55 ---------------------------------------
 include/hw/input/ps2.h | 58 +++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 57 insertions(+), 56 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index ee7c36d4f2..f4bad9876a 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -76,11 +76,6 @@
 #define MOUSE_STATUS_ENABLED    0x20
 #define MOUSE_STATUS_SCALE21    0x10
 
-/*
- * PS/2 buffer size. Keep 256 bytes for compatibility with
- * older QEMU versions.
- */
-#define PS2_BUFFER_SIZE     256
 #define PS2_QUEUE_SIZE      16  /* Queue size required by PS/2 protocol */
 #define PS2_QUEUE_HEADROOM  8   /* Queue size for keyboard command replies */
 
@@ -92,56 +87,6 @@
 #define MOD_SHIFT_R (1 << 4)
 #define MOD_ALT_R   (1 << 5)
 
-typedef struct {
-    uint8_t data[PS2_BUFFER_SIZE];
-    int rptr, wptr, cwptr, count;
-} PS2Queue;
-
-struct PS2State {
-    SysBusDevice parent_obj;
-
-    PS2Queue queue;
-    int32_t write_cmd;
-    void (*update_irq)(void *, int);
-    void *update_arg;
-};
-
-#define TYPE_PS2_DEVICE "ps2-device"
-OBJECT_DECLARE_SIMPLE_TYPE(PS2State, PS2_DEVICE)
-
-struct PS2KbdState {
-    PS2State parent_obj;
-
-    int scan_enabled;
-    int translate;
-    int scancode_set; /* 1=XT, 2=AT, 3=PS/2 */
-    int ledstate;
-    bool need_high_bit;
-    unsigned int modifiers; /* bitmask of MOD_* constants above */
-};
-
-#define TYPE_PS2_KBD_DEVICE "ps2-kbd"
-OBJECT_DECLARE_SIMPLE_TYPE(PS2KbdState, PS2_KBD_DEVICE)
-
-struct PS2MouseState {
-    PS2State parent_obj;
-
-    uint8_t mouse_status;
-    uint8_t mouse_resolution;
-    uint8_t mouse_sample_rate;
-    uint8_t mouse_wrap;
-    uint8_t mouse_type; /* 0 = PS2, 3 = IMPS/2, 4 = IMEX */
-    uint8_t mouse_detect_state;
-    int mouse_dx; /* current values, needed for 'poll' mode */
-    int mouse_dy;
-    int mouse_dz;
-    int mouse_dw;
-    uint8_t mouse_buttons;
-};
-
-#define TYPE_PS2_MOUSE_DEVICE "ps2-mouse"
-OBJECT_DECLARE_SIMPLE_TYPE(PS2MouseState, PS2_MOUSE_DEVICE)
-
 static uint8_t translate_table[256] = {
     0xff, 0x43, 0x41, 0x3f, 0x3d, 0x3b, 0x3c, 0x58,
     0x64, 0x44, 0x42, 0x40, 0x3e, 0x0f, 0x29, 0x59,
diff --git a/include/hw/input/ps2.h b/include/hw/input/ps2.h
index 35d983897a..7f2c3f6090 100644
--- a/include/hw/input/ps2.h
+++ b/include/hw/input/ps2.h
@@ -25,13 +25,69 @@
 #ifndef HW_PS2_H
 #define HW_PS2_H
 
+#include "hw/sysbus.h"
+
 #define PS2_MOUSE_BUTTON_LEFT   0x01
 #define PS2_MOUSE_BUTTON_RIGHT  0x02
 #define PS2_MOUSE_BUTTON_MIDDLE 0x04
 #define PS2_MOUSE_BUTTON_SIDE   0x08
 #define PS2_MOUSE_BUTTON_EXTRA  0x10
 
-typedef struct PS2State PS2State;
+/*
+ * PS/2 buffer size. Keep 256 bytes for compatibility with
+ * older QEMU versions.
+ */
+#define PS2_BUFFER_SIZE     256
+
+typedef struct {
+    uint8_t data[PS2_BUFFER_SIZE];
+    int rptr, wptr, cwptr, count;
+} PS2Queue;
+
+struct PS2State {
+    SysBusDevice parent_obj;
+
+    PS2Queue queue;
+    int32_t write_cmd;
+    void (*update_irq)(void *, int);
+    void *update_arg;
+};
+
+#define TYPE_PS2_DEVICE "ps2-device"
+OBJECT_DECLARE_SIMPLE_TYPE(PS2State, PS2_DEVICE)
+
+struct PS2KbdState {
+    PS2State parent_obj;
+
+    int scan_enabled;
+    int translate;
+    int scancode_set; /* 1=XT, 2=AT, 3=PS/2 */
+    int ledstate;
+    bool need_high_bit;
+    unsigned int modifiers; /* bitmask of MOD_* constants above */
+};
+
+#define TYPE_PS2_KBD_DEVICE "ps2-kbd"
+OBJECT_DECLARE_SIMPLE_TYPE(PS2KbdState, PS2_KBD_DEVICE)
+
+struct PS2MouseState {
+    PS2State parent_obj;
+
+    uint8_t mouse_status;
+    uint8_t mouse_resolution;
+    uint8_t mouse_sample_rate;
+    uint8_t mouse_wrap;
+    uint8_t mouse_type; /* 0 = PS2, 3 = IMPS/2, 4 = IMEX */
+    uint8_t mouse_detect_state;
+    int mouse_dx; /* current values, needed for 'poll' mode */
+    int mouse_dy;
+    int mouse_dz;
+    int mouse_dw;
+    uint8_t mouse_buttons;
+};
+
+#define TYPE_PS2_MOUSE_DEVICE "ps2-mouse"
+OBJECT_DECLARE_SIMPLE_TYPE(PS2MouseState, PS2_MOUSE_DEVICE)
 
 /* ps2.c */
 void *ps2_kbd_init(void (*update_irq)(void *, int), void *update_arg);
-- 
2.20.1


