Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 889E9519C86
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 12:06:16 +0200 (CEST)
Received: from localhost ([::1]:51606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmBtf-0004po-M5
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 06:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBIM-0008OV-UZ
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:27:43 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBIK-00045e-3s
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:27:42 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBHA-0002VG-IJ; Wed, 04 May 2022 10:26:32 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Wed,  4 May 2022 10:25:36 +0100
Message-Id: <20220504092600.10048-27-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 26/50] lasi: move initialisation of iar and rtc to new
 lasi_reset() function
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
---
 hw/hppa/lasi.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/hw/hppa/lasi.c b/hw/hppa/lasi.c
index 08ebe7c6d9..242713c7bd 100644
--- a/hw/hppa/lasi.c
+++ b/hw/hppa/lasi.c
@@ -303,7 +303,6 @@ DeviceState *lasi_initfn(MemoryRegion *address_space)
 
     dev = qdev_new(TYPE_LASI_CHIP);
     s = LASI_CHIP(dev);
-    s->iar = CPU_HPA + 3;
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     /* LAN */
@@ -319,11 +318,6 @@ DeviceState *lasi_initfn(MemoryRegion *address_space)
     parallel_mm_init(address_space, LASI_LPT_HPA + 0x800, 0,
                      lpt_irq, parallel_hds[0]);
 
-    /* Real time clock (RTC), it's only one 32-bit counter @9000 */
-
-    s->rtc = time(NULL);
-    s->rtc_ref = 0;
-
     if (serial_hd(1)) {
         /* Serial port */
         qemu_irq serial_irq = qemu_allocate_irq(lasi_set_irq, s,
@@ -341,6 +335,17 @@ DeviceState *lasi_initfn(MemoryRegion *address_space)
     return dev;
 }
 
+static void lasi_reset(DeviceState *dev)
+{
+    LasiState *s = LASI_CHIP(dev);
+
+    s->iar = CPU_HPA + 3;
+
+    /* Real time clock (RTC), it's only one 32-bit counter @9000 */
+    s->rtc = time(NULL);
+    s->rtc_ref = 0;
+}
+
 static void lasi_init(Object *obj)
 {
     LasiState *s = LASI_CHIP(obj);
@@ -356,6 +361,7 @@ static void lasi_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    dc->reset = lasi_reset;
     dc->vmsd = &vmstate_lasi;
 }
 
-- 
2.20.1


