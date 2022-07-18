Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7BE578A5A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 21:12:31 +0200 (CEST)
Received: from localhost ([::1]:44862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDWAQ-0007J2-Vq
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 15:12:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVbP-0001nd-Og
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:36:19 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVbO-00060E-7K
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:36:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ePn4fzXW7OKYhatFQ0UMrstwQ+5o/G6uaBddIYnCM88=; b=JqlY+ZWU8DGj8kQ1VWfqHlg9xT
 gdeDDt5G9hNZSCk1RWB235EvBP9KDRghL4WnP+wT2C/J2WVPgwLnrCBq6aCrlNQiCsuJ/XU6NV9Qn
 ugu5wwWW9YiiWVzBVj5wMiOZl8eYfvwob7f20eohyPo0H04QX2qMT/vcsmrqjMOGQsRH7JqykpmMx
 oEktMH0p0sZkzInpkJdDrYKWdQbgb8Td1RhHjpBqsUfo7a7wnSyWBXiAsmyHusypKk6UBQs/SfIPh
 Ivv6c6orZYeSHLe4D+LUvzKb8dsIWNQ0ITdOBnx2jZEYusRuV1zYalJzROKD8MiMBLKL7+EGL05ow
 RV/So4Wh1xX1xbUI8FEMENVYeGwpkewuCX1Ry+jTn0Ss0QXV6ZebLZKj9OvpbmCTC6ES/Ax1t8ssL
 E6Uc5r91lwnfgz5fivn066jvMCxqyltv3CE/nJ1Ds39Ng+Ha1uTsGjSbkzJODKkIaF+ETKkUy4lMD
 J4DpT1omxIVJ3tpCbaYiyZva9YrXoNW7qML1b2lTKl2YUjhJJwsI0mQK/RCT0E8j38RJyIVFWxawI
 5qS1UlzarqHyErMeCVEXSiWKdFortpgPdf0TxqgPbnxbOAnh6ZEi4CBlaituUWxY2LNNs2TVqqkck
 nIuaOTbFrgx9o4bXebpaQ99msFaYSFt9WEPajI/FQ=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZs-000B51-Ci; Mon, 18 Jul 2022 19:34:48 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 18 Jul 2022 19:33:33 +0100
Message-Id: <20220718183339.124253-35-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
References: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 34/40] lasips2: update VMStateDescription for LASIPS2 device
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
as separate VMSTATE_STRUCT instances representing each LASIPS2Port. Once this
is done, the migration stream can be updated to include buf and loopback_rbne
for each port (which is necessary since the values are accessed across separate
IO accesses), and drop the port id as this is hardcoded for each port type.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Message-Id: <20220712215251.7944-35-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


