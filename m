Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5281D559B2F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 16:16:27 +0200 (CEST)
Received: from localhost ([::1]:42556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4k6j-0007lU-EU
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 10:16:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jbM-0003PM-6s; Fri, 24 Jun 2022 09:44:00 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jbK-0005MA-NV; Fri, 24 Jun 2022 09:43:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=So3b8ugD9000B6KIzOxsUi39XCaCnOF33+YE+QwSWns=; b=tR1LX5CYds9GgzRrFX63iMf+U6
 vaUW9lWzzl/6u7j1aTCHK39leuVMD/0HD5kniTi0YI2EVcDs9+jdyH0BEe8qwNsLgfhdAxdP2jP2d
 U5gu6HxOAH3m/IClp3uPmFW9R0FONMj27BvtIX9lHptR5hVmwbW9wNCqG1Bx+qfsKhOYFskTMqCoh
 eYNoU6Y43ArIWgClq/TKbixFJu9EWYgN7Qg6SNKdfOZ61KYfOPrkf2+yIQtLaTaOrmMX6K8Fw2P0D
 Z0SvrnqoIy4AU8txWE2gWJ5wV/GjWVTrl116gr2d3jFEbTdwvZ93fUt3Mj3Z94YjzCbBCgCDpkR1X
 onWmRT70oth3wcKeK0PZex2ifLOFINqOHbmO1Kk65FK8Y5YZ47Fd1ATqI7FIZAEhWLrJTcwD5Z/6f
 r0WWoK1yMDKAdJ7svK0HPR6LfmqPnpsSKE03QJYSxXffdeLSmG82WvY83IA1o5Q/uQ5uFBi0o7LcI
 mShEHnBlcSpe/HBMGgbX8/Y+YeiFbCIqagf1ml2aPFp/w49KeC1kN+agG844GcRB78R8taD9MlxBi
 NZXeZTDiwqBtIW3Cd2iSK9dPdUaCnteURlTSOTp58EnFIBiqncKpSlqRR7bvneBYbQsqBAH1zZ7Zy
 PJXHJMKT6qn9tlsmVUZ2H8Jr3pe10Zq+5kknK5Av4=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZi-00037t-DP; Fri, 24 Jun 2022 14:42:21 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:53 +0100
Message-Id: <20220624134109.881989-39-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 38/54] lasips2: QOMify LASIPS2State
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


