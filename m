Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8DE560194
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 15:43:03 +0200 (CEST)
Received: from localhost ([::1]:39128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Xy8-0007xp-Q3
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 09:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1T-0001Kd-Ic; Wed, 29 Jun 2022 08:42:23 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1O-0004x7-7L; Wed, 29 Jun 2022 08:42:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IVK5K8+qvTOJcmRDJ+1YSTORZYSgnuabYS7m3S1Ddt0=; b=JCxIZWckRxLc7yBJNGXPm9fFVt
 NdYTSiYWXymUAMLztKcgOZxGUmmNou4Kj4Csd1CDs3sPaZ4IVrdso8i1Yst1g2ymNFw1rz7WmHoSH
 Vo32VwHxtiDp+5EyQC6WliSMhmDXN5aI/JlTYqOMKJ9nPiMd2lCc5aMoQ4EbjpPP66+Sxxi72mz7X
 wEBoYelbAAi1718VUit4fgUWfr3ewMXgutAxxI4dag03XqxvkmhMNtrcIz32bQRPKIZpGAuBxvYjf
 IwMNZi/6zRfLHqoeXM4GeZTkKso0yp6zPSd8o5fgRwZwJIMJBcOIdOVlENYBMpL8Uh0jDaVs8t4C1
 TDFwkxUmYNNiW2Jeed4PPQLwlrPE+dyYivoSirjbcesgz6HRxHzxoC89OvEdXqqx37xJJJeWF33Ay
 IyxKqaJpzMIuVVlTeQF8WZp8KgYw8WbZVPzO0C0MsfkSUug/K3KMzyChOcKDiSRIAahQHl9GJhwfI
 +5G14EIi5zsLv7FE+E//T8KzKvUDoelD3JJOwP6R3m6UtZHrmjVU+je4XDyIKv4jhU74clVpa+X/2
 6SF2epZNjRbi5SDarL1MWUC30///N4KrOamI9dR3alEbLMmVjQIgo5ZSxbsMHYvL/Rz8GWUSOzU3H
 RGRILsRJ5+0zfRh9Jhw0rHu1rCYIX9WNbq/a/mseM=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6Wzn-0002tZ-ER; Wed, 29 Jun 2022 13:40:39 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:40:20 +0100
Message-Id: <20220629124026.1077021-35-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 34/40] lasips2: update VMStateDescription for LASIPS2 device
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

Since this series has already introduced a migration break for the HPPA B160L
machine, we can use this opportunity to improve the VMStateDescription for
the LASIPS2 device.

Add the new int_status field to the VMStateDescription and remodel the ports
as separate VMSTATE_STRUCT instances.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/lasips2.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index e602e3c986..ea7c07a2ba 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -35,15 +35,28 @@
 #include "qapi/error.h"
 
 
+static const VMStateDescription vmstate_lasips2_port = {
+    .name = "lasips2-port",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8(control, LASIPS2Port),
+        VMSTATE_UINT8(buf, LASIPS2Port),
+        VMSTATE_BOOL(loopback_rbne, LASIPS2Port),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_lasips2 = {
     .name = "lasips2",
-    .version_id = 0,
-    .minimum_version_id = 0,
+    .version_id = 1,
+    .minimum_version_id = 1,
     .fields = (VMStateField[]) {
-        VMSTATE_UINT8(kbd_port.parent_obj.control, LASIPS2State),
-        VMSTATE_UINT8(kbd_port.parent_obj.id, LASIPS2State),
-        VMSTATE_UINT8(mouse_port.parent_obj.control, LASIPS2State),
-        VMSTATE_UINT8(mouse_port.parent_obj.id, LASIPS2State),
+        VMSTATE_UINT8(int_status, LASIPS2State),
+        VMSTATE_STRUCT(kbd_port.parent_obj, LASIPS2State, 1,
+                       vmstate_lasips2_port, LASIPS2Port),
+        VMSTATE_STRUCT(mouse_port.parent_obj, LASIPS2State, 1,
+                       vmstate_lasips2_port, LASIPS2Port),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.30.2


