Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E94D455B371
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 20:17:33 +0200 (CEST)
Received: from localhost ([::1]:37720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5WpA-00081t-WE
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 14:17:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WMu-0004HT-1P
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:48:20 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WMq-0000Cp-LF
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:48:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dj4b93yQlcecz4RK3yXUrii0j6rqBshDKqbsmXi6h5Q=; b=C5kYLhjJdjAnwLrVTRsLTS+MtB
 69odJnEWvXd7+0M3DQ33+d6Qq2vrIFRvEno2OOoc6sOgPJlD6IX1cNYHzvgyqQPUFunEoE113es0M
 HdKvZRNyCkK6wxxvZ5YI1efHyqWOQSz4yp/VGN//SwWlriT32xf4vMcNarWrRzbjpHKYAxcgKRSGY
 b43Q1yel8WbCWuXC7m+i+1Z4d09q9WUHo2xWjqx4Y0Awa1mT+rJCBz3q+A7yRnmBRWg/ERxiDK90I
 AIPYpua9A7NZ0gV8RS7UREwQE/gQA4YQVDN9P9E3e3RNbEQMDPirZrWPggoNanwsoLHjFpY3LdJhy
 vBcSwuv09LST6AB1RTASjPHRKdR5+FRwIxJBD5m+mmCEO4neBsBxon8oPvAGAeWiprn33rjtel0U6
 LQoWMyOD5TQc344SCcNqT7K+fggWLspbaQeEYFhcSOnjCQ/E1evgoo0L+c4AXgGpcjel5vfpgUTWs
 hiA2f9qe3E+seTdGMCWsOn8ORpAVkOjJTS943N7o2X+up1558E7AyNAnj8BcHSn8KySIl/vh9JYAU
 3ChvheeyqXNsAT9K/rIN8Y5fuJUQpdE2aib0Tpx5g9tK30lM3McWMzjHvPWV4KSUWodRD/usM7FrQ
 1hT+yptqycEA94ldubKt14mVvZB0E+WV/f7ilFr50=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WLS-0007KY-JY; Sun, 26 Jun 2022 18:46:54 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 26 Jun 2022 18:45:14 +0100
Message-Id: <20220626174531.969187-39-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
References: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 38/55] lasips2: QOMify LASIPS2State
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

Currently lasip2_init() creates a new LASIPS2State directly which is used by the HPPA
machine. Introduce a new LASIPS2 QOM type that will soon be used to allow the HPPA
machine to be wired up using standard qdev GPIOs.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220624134109.881989-39-mark.cave-ayland@ilande.co.uk>
---
 hw/input/lasips2.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index adfde1684f..db0a791e6c 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -24,6 +24,7 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "hw/qdev-properties.h"
+#include "hw/sysbus.h"
 #include "hw/input/ps2.h"
 #include "hw/input/lasips2.h"
 #include "exec/hwaddr.h"
@@ -31,6 +32,7 @@
 #include "exec/address-spaces.h"
 #include "migration/vmstate.h"
 #include "hw/irq.h"
+#include "qapi/error.h"
 
 
 struct LASIPS2State;
@@ -45,11 +47,16 @@ typedef struct LASIPS2Port {
     bool irq;
 } LASIPS2Port;
 
-typedef struct LASIPS2State {
+struct LASIPS2State {
+    SysBusDevice parent_obj;
+
     LASIPS2Port kbd;
     LASIPS2Port mouse;
     qemu_irq irq;
-} LASIPS2State;
+};
+
+#define TYPE_LASIPS2 "lasips2"
+OBJECT_DECLARE_SIMPLE_TYPE(LASIPS2State, LASIPS2)
 
 static const VMStateDescription vmstate_lasips2 = {
     .name = "lasips2",
@@ -265,8 +272,11 @@ void lasips2_init(MemoryRegion *address_space,
                   hwaddr base, qemu_irq irq)
 {
     LASIPS2State *s;
+    DeviceState *dev;
 
-    s = g_new0(LASIPS2State, 1);
+    dev = qdev_new(TYPE_LASIPS2);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    s = LASIPS2(dev);
 
     s->irq = irq;
     s->mouse.id = 1;
@@ -286,3 +296,16 @@ void lasips2_init(MemoryRegion *address_space,
                           "lasips2-mouse", 0x100);
     memory_region_add_subregion(address_space, base + 0x100, &s->mouse.reg);
 }
+
+static const TypeInfo lasips2_info = {
+    .name          = TYPE_LASIPS2,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(LASIPS2State)
+};
+
+static void lasips2_register_types(void)
+{
+    type_register_static(&lasips2_info);
+}
+
+type_init(lasips2_register_types)
-- 
2.30.2


