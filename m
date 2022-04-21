Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A12850A9CA
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 22:11:41 +0200 (CEST)
Received: from localhost ([::1]:49230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhd9Q-00048N-87
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 16:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcXj-00007V-6j
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:32:45 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:33678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcXh-0005ka-Ew
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:32:42 -0400
Received: from [2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcWh-000Caf-Gl; Thu, 21 Apr 2022 20:31:39 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Thu, 21 Apr 2022 20:30:49 +0100
Message-Id: <20220421193100.5098-40-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220421193100.5098-1-mark.cave-ayland@ilande.co.uk>
References: <20220421193100.5098-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 39/50] lasi: use constants for device register offsets
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

Instead of generating the offset based upon the physical address of the
register, add constants for each of the device registers to lasi.h and
update lasi.c to use them.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/hppa/lasi.c | 28 ++++++++++++++--------------
 hw/hppa/lasi.h |  5 +++++
 2 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/hw/hppa/lasi.c b/hw/hppa/lasi.c
index ad50880a13..11ca33fba3 100644
--- a/hw/hppa/lasi.c
+++ b/hw/hppa/lasi.c
@@ -36,10 +36,10 @@ static bool lasi_chip_mem_valid(void *opaque, hwaddr addr,
     case LASI_ICR:
     case LASI_IAR:
 
-    case (LASI_LAN_HPA - LASI_HPA):
-    case (LASI_LPT_HPA - LASI_HPA):
-    case (LASI_UART_HPA - LASI_HPA):
-    case (LASI_RTC_HPA - LASI_HPA):
+    case LASI_LPT:
+    case LASI_UART:
+    case LASI_LAN:
+    case LASI_RTC:
 
     case LASI_PCR ... LASI_AMR:
         ret = true;
@@ -76,12 +76,12 @@ static MemTxResult lasi_chip_read_with_attrs(void *opaque, hwaddr addr,
         val = s->iar;
         break;
 
-    case (LASI_LAN_HPA - LASI_HPA):
-    case (LASI_LPT_HPA - LASI_HPA):
-    case (LASI_UART_HPA - LASI_HPA):
+    case LASI_LPT:
+    case LASI_UART:
+    case LASI_LAN:
         val = 0;
         break;
-    case (LASI_RTC_HPA - LASI_HPA):
+    case LASI_RTC:
         val = time(NULL);
         val += s->rtc_ref;
         break;
@@ -141,16 +141,16 @@ static MemTxResult lasi_chip_write_with_attrs(void *opaque, hwaddr addr,
         s->iar = val;
         break;
 
-    case (LASI_LAN_HPA - LASI_HPA):
-        /* XXX: reset LAN card */
-        break;
-    case (LASI_LPT_HPA - LASI_HPA):
+    case LASI_LPT:
         /* XXX: reset parallel port */
         break;
-    case (LASI_UART_HPA - LASI_HPA):
+    case LASI_UART:
         /* XXX: reset serial port */
         break;
-    case (LASI_RTC_HPA - LASI_HPA):
+    case LASI_LAN:
+        /* XXX: reset LAN card */
+        break;
+    case LASI_RTC:
         s->rtc_ref = val - time(NULL);
         break;
 
diff --git a/hw/hppa/lasi.h b/hw/hppa/lasi.h
index 63a2be3740..11cf7d6b0b 100644
--- a/hw/hppa/lasi.h
+++ b/hw/hppa/lasi.h
@@ -21,6 +21,11 @@ OBJECT_DECLARE_SIMPLE_TYPE(LasiState, LASI_CHIP)
 #define LASI_ICR        0x0c
 #define LASI_IAR        0x10
 
+#define LASI_LPT        0x02000
+#define LASI_UART       0x05000
+#define LASI_LAN        0x07000
+#define LASI_RTC        0x09000
+
 #define LASI_PCR        0x0C000 /* LASI Power Control register */
 #define LASI_ERRLOG     0x0C004 /* LASI Error Logging register */
 #define LASI_VER        0x0C008 /* LASI Version Control register */
-- 
2.20.1


