Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8BA53051E
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 20:22:33 +0200 (CEST)
Received: from localhost ([::1]:52678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsqDo-0001ba-2e
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 14:22:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAV-0006gh-Vl; Sun, 22 May 2022 14:19:10 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAT-0003W9-OI; Sun, 22 May 2022 14:19:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2bE7E2vhSGzWMKYL49t2npatEtQ4a6cIVgCbmSPVTSY=; b=PoftS8Xz2m7AGRWR2hCvrT4S+p
 bk3cCqH0lx2zitVt9K6CB4Dl2Cw8teoNE/onp6PIfPPkshege4c6i8s7zk1r7mUmmlND3VsKe2cev
 HajctqYXFI+y00Mfx2tDWf3SHtHMaK4ESugXHNg5wFgbQJzyKmEPESkCkTefi7EN537PmNC3Q/IT6
 c0Da4CwxKdsKgg/fqQLvdAsOHZS4BtrN8mGc6HEMDrS74TL06HYYC+B9QSXj/L/TvqoujEfYGGsUK
 z3f5yV1RFziO7GdZkUNNGMj0b2smXS6V3GGn1bH/wdxGbbkyWrx9mtJ+gKyG/zZpYcRYgoTrSh0/3
 7zX2baqwym4XCytAosoBVnV74T4E6fPLbm0Xy8gAuVO7/b2xo2eN/O26fU9KQjm6uovsqKM4p2ggp
 6y4DQux7arrr88cHZ96qNC7lF2R8CHCpv6NC8XFqb2RUgY1La6tll4NTWM6GO9LI1K5gStOPodHpN
 MtLJypndn2jPRfXbH2v+XpWFqCBJPftOmErASITdY4UjrJ6IaE+AIu3E5iiVEGdpB7n1/zp2Bapvo
 HmKnKw14IZpXxeneSGB34AE0fTzHzgqAEeCuVlXAbIQAGlqqEq1RWGKJbqE+JTcscNC61T4/xvU2Z
 Dp5jt8UaeXD/t3y0USYtWCPC5B8UbHUbrpUKGNW8Y=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsq9I-0007pH-Pg; Sun, 22 May 2022 19:17:56 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:17:48 +0100
Message-Id: <20220522181836.864-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 02/50] ps2: QOMify PS2State
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

Make PS2State a new abstract PS2_DEVICE QOM type to represent the common
functionality shared between PS2 keyboard and mouse devices.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/ps2.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 67dd2eca84..514e55cbb6 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -24,6 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "hw/sysbus.h"
 #include "hw/input/ps2.h"
 #include "migration/vmstate.h"
 #include "ui/console.h"
@@ -96,12 +97,17 @@ typedef struct {
 } PS2Queue;
 
 struct PS2State {
+    SysBusDevice parent_obj;
+
     PS2Queue queue;
     int32_t write_cmd;
     void (*update_irq)(void *, int);
     void *update_arg;
 };
 
+#define TYPE_PS2_DEVICE "ps2-device"
+OBJECT_DECLARE_SIMPLE_TYPE(PS2State, PS2_DEVICE)
+
 typedef struct {
     PS2State common;
     int scan_enabled;
@@ -1277,3 +1283,25 @@ void *ps2_mouse_init(void (*update_irq)(void *, int), void *update_arg)
     qemu_register_reset(ps2_mouse_reset, s);
     return s;
 }
+
+static void ps2_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
+}
+
+static const TypeInfo ps2_info = {
+    .name          = TYPE_PS2_DEVICE,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(PS2State),
+    .class_init    = ps2_class_init,
+    .abstract      = true
+};
+
+static void ps2_register_types(void)
+{
+    type_register_static(&ps2_info);
+}
+
+type_init(ps2_register_types)
-- 
2.20.1


