Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE805789B0
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 20:43:38 +0200 (CEST)
Received: from localhost ([::1]:53514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDViT-00027U-Fi
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 14:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZ7-0007gn-OA
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:33:57 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZ6-0005Vv-94
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:33:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uo1qvslZwditqqn3T+vuSzu0nc4f10NOivC1+SyNwaI=; b=AP9sMlYYn6PFzUUgJV2h9wyoal
 V6q5scKJzscHNz3wztNkgMRLliuxqSfv+wdrJ+b1S+S2lNUjT1XdzrdEprw3MxQ8NJ6BeltGEzZZr
 4qgFCf/VMQ2SkM/xim+0Q5p3kbaTQbeZWj2Esj7SvHM6boYeAcq5xaE+ifBC0u7Iq8av5j78IlRYQ
 T3ja9N/BP2S1VdgI01d9gkU/s4gL62nX6b9M+0j7RttziqbBGzsCJpKpzrunShIVodqOic7K61DL6
 dBY39huou1qrOllr96thOtUale5yWzL2UJ7pKMMhqkNRaZYzloNUWz1lOtNo6QCJW+RuWF9B8Luh6
 MTcIrzbyGXIoSPvNnQx9IfihZL4r94kIxG17nWLZbK7vXcwGPYM0F756bTRIWnI1n5sLhGY8AiMlK
 lZkPm1J0IyBNio/2qwUGMp82rugBx3co7wDQbLp3BhDnjACu0QByfvcCQvl3I1lcUYLTMbtqIjRWE
 gIGyBEqlXnriCIQ9Aindq1bY3qs9JGzYXjNFlrd2MbzL7x+1TbQWLUtro1yUzJTISwxB4S1kIyWCF
 3IcINpJBobR8mDbNmsCKQZxFJkBEc3//Vtd4yG0cEUIfGZZRvE4nBuBUkDWhTEpxQElckZMV8HUgc
 4rMSnPtnqwXSra5Hy9NZZVnISrtG+zVfVTUofTuo0=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVXk-000B51-Ml; Mon, 18 Jul 2022 19:32:36 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 18 Jul 2022 19:33:00 +0100
Message-Id: <20220718183339.124253-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
References: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 01/40] pl050: move PL050State from pl050.c to new pl050.h
 header file
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

This allows the QOM types in pl050.c to be used elsewhere by simply including
pl050.h.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220712215251.7944-2-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/pl050.c         | 16 +---------------
 include/hw/input/pl050.h | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 15 deletions(-)
 create mode 100644 include/hw/input/pl050.h

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index 209cc001cf..c7980b6ed7 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -19,26 +19,12 @@
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "hw/input/ps2.h"
+#include "hw/input/pl050.h"
 #include "hw/irq.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "qom/object.h"
 
-#define TYPE_PL050 "pl050"
-OBJECT_DECLARE_SIMPLE_TYPE(PL050State, PL050)
-
-struct PL050State {
-    SysBusDevice parent_obj;
-
-    MemoryRegion iomem;
-    void *dev;
-    uint32_t cr;
-    uint32_t clk;
-    uint32_t last;
-    int pending;
-    qemu_irq irq;
-    bool is_mouse;
-};
 
 static const VMStateDescription vmstate_pl050 = {
     .name = "pl050",
diff --git a/include/hw/input/pl050.h b/include/hw/input/pl050.h
new file mode 100644
index 0000000000..2bbf7a9d50
--- /dev/null
+++ b/include/hw/input/pl050.h
@@ -0,0 +1,35 @@
+/*
+ * Arm PrimeCell PL050 Keyboard / Mouse Interface
+ *
+ * Copyright (c) 2006-2007 CodeSourcery.
+ * Written by Paul Brook
+ *
+ * This code is licensed under the GPL.
+ */
+
+#ifndef HW_PL050_H
+#define HW_PL050_H
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "migration/vmstate.h"
+#include "hw/input/ps2.h"
+#include "hw/irq.h"
+
+#define TYPE_PL050 "pl050"
+OBJECT_DECLARE_SIMPLE_TYPE(PL050State, PL050)
+
+struct PL050State {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+    void *dev;
+    uint32_t cr;
+    uint32_t clk;
+    uint32_t last;
+    int pending;
+    qemu_irq irq;
+    bool is_mouse;
+};
+
+#endif
-- 
2.30.2


