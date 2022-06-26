Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D796655B374
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 20:19:43 +0200 (CEST)
Received: from localhost ([::1]:45958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5WrG-00059a-UQ
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 14:19:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WMx-0004M0-Ut
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:48:23 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WMv-0000Cy-MV
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:48:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w5mQUtXpv4wruk+LCaB0jufzVeLYciUHNK7tvuIMIzo=; b=1MJDnqRDf+NHq9Ec6Y3yqJazic
 NcyA9X9gzB3hmE8HlKONyVTMwhfzm1gPOXyJwPG/sSy7NwUvqlgtFOc7apS11vgD9WjvfJUG4o7+1
 d8W8/3xcqv59WGWPC5vIM7U8QzXGBzoP373ZcRwvypgOjkKYcX0Lpmr5vOoZRabGZ1nf+BGnRvi3y
 4RuJYF137W4tqp4awu07lv3rYGZ6Uvh9rO8LM3gG7iF+R0zUp/+kkUDQzWNiuvMLhK2JSFA544r6Q
 6++ATWJBape8rEKTgkqgkstFdWySM57YU1ug71qcs1LNzdoISnFyGTCz7Th8gBh5QoQCfr36pvc1p
 jtJafmFIWMq3a01fnEHIqGYra9oJ7HtNsPnFH5mrWYnrgXwG0lE54bp5lSxKmIRYTn39bJC5QAfUj
 lgDSOL3kH9af7mL2lFZd2bHX3rmz5p1zjQ3j7Wq2ZXjZ0vZ9cuxlp5tSG7RRf+Jsf8gNfdJMtrnPB
 5pGSAPQE+HANcGfycmipN4Mrg8jVFxvcTwHYgqIiuu6E0XtuOnuAtOzuP1l9fhKRhBYAUcOC869cC
 d8nHZ9u6NQLoSfv9lyeeS1gXBizqCUQIUFjjkgTQm9EShGNJhKBSq3Hupiyhjtfsu0tRHbVnsb88h
 Gp1cj5QUSPBOZvem1HFzxZjA2SDjKLBo3KRb7JCzY=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WLW-0007KY-RD; Sun, 26 Jun 2022 18:46:58 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 26 Jun 2022 18:45:15 +0100
Message-Id: <20220626174531.969187-40-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
References: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 39/55] lasips2: move lasips2 QOM types from lasips2.c to
 lasips2.h
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

This allows the QOM types in lasips2.c to be used elsewhere by simply including
lasips2.h.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220624134109.881989-40-mark.cave-ayland@ilande.co.uk>
---
 hw/input/lasips2.c         | 23 -----------------------
 include/hw/input/lasips2.h | 22 ++++++++++++++++++++++
 2 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index db0a791e6c..2caa80bd3c 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -35,29 +35,6 @@
 #include "qapi/error.h"
 
 
-struct LASIPS2State;
-typedef struct LASIPS2Port {
-    struct LASIPS2State *parent;
-    MemoryRegion reg;
-    void *dev;
-    uint8_t id;
-    uint8_t control;
-    uint8_t buf;
-    bool loopback_rbne;
-    bool irq;
-} LASIPS2Port;
-
-struct LASIPS2State {
-    SysBusDevice parent_obj;
-
-    LASIPS2Port kbd;
-    LASIPS2Port mouse;
-    qemu_irq irq;
-};
-
-#define TYPE_LASIPS2 "lasips2"
-OBJECT_DECLARE_SIMPLE_TYPE(LASIPS2State, LASIPS2)
-
 static const VMStateDescription vmstate_lasips2 = {
     .name = "lasips2",
     .version_id = 0,
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index 0cd7b59064..ddcea74c14 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -8,8 +8,30 @@
 #define HW_INPUT_LASIPS2_H
 
 #include "exec/hwaddr.h"
+#include "hw/sysbus.h"
+
+struct LASIPS2State;
+typedef struct LASIPS2Port {
+    struct LASIPS2State *parent;
+    MemoryRegion reg;
+    void *dev;
+    uint8_t id;
+    uint8_t control;
+    uint8_t buf;
+    bool loopback_rbne;
+    bool irq;
+} LASIPS2Port;
+
+struct LASIPS2State {
+    SysBusDevice parent_obj;
+
+    LASIPS2Port kbd;
+    LASIPS2Port mouse;
+    qemu_irq irq;
+};
 
 #define TYPE_LASIPS2 "lasips2"
+OBJECT_DECLARE_SIMPLE_TYPE(LASIPS2State, LASIPS2)
 
 void lasips2_init(MemoryRegion *address_space, hwaddr base, qemu_irq irq);
 
-- 
2.30.2


