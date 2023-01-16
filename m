Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1FC66B5E9
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 04:15:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHFxK-0005hH-UT; Sun, 15 Jan 2023 22:14:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1pHFxJ-0005h8-T2
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 22:14:41 -0500
Received: from [122.235.246.20] (helo=liuqiang-OptiPlex-7060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1pHFxI-0003mL-2m
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 22:14:41 -0500
Received: from localhost (liuqiang-OptiPlex-7060 [local])
 by liuqiang-OptiPlex-7060 (OpenSMTPD) with ESMTPA id 33375e94;
 Mon, 16 Jan 2023 03:14:36 +0000 (UTC)
From: Qiang Liu <cyruscyliu@gmail.com>
To: qemu-devel@nongnu.org
Cc: Qiang Liu <cyruscyliu@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH v2] hw/net/lan9118: log [read|write]b when mode_16bit is
 enabled rather than abort
Date: Mon, 16 Jan 2023 11:14:31 +0800
Message-Id: <20230116031431.1378346-1-cyruscyliu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 122.235.246.20 (failed)
Received-SPF: softfail client-ip=122.235.246.20;
 envelope-from=cyruscyliu@gmail.com; helo=liuqiang-OptiPlex-7060
X-Spam_score_int: 48
X-Spam_score: 4.8
X-Spam_bar: ++++
X-Spam_report: (4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FROM=0.001, FSL_HELO_NON_FQDN_1=0.001,
 HELO_NO_DOMAIN=0.001, NML_ADSP_CUSTOM_MED=0.9, RCVD_IN_PBL=3.335,
 RDNS_NONE=0.793, SPF_SOFTFAIL=0.665, SPOOFED_FREEMAIL=0.001,
 SPOOFED_FREEMAIL_NO_RDNS=0.001, SPOOF_GMAIL_MID=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch replaces hw_error to guest error log for [read|write]b
accesses when mode_16bit is enabled. This avoids aborting qemu.

Fixes: 1248f8d4cbc3 ("hw/lan9118: Add basic 16-bit mode support.")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1433
Reported-by: Qiang Liu <cyruscyliu@gmail.com>
Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
v2 removes BADF() macro and the "hw/hw.h" inclusion
---
 hw/net/lan9118.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index f1cba55967..e5c4af182d 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -15,7 +15,6 @@
 #include "migration/vmstate.h"
 #include "net/net.h"
 #include "net/eth.h"
-#include "hw/hw.h"
 #include "hw/irq.h"
 #include "hw/net/lan9118.h"
 #include "hw/ptimer.h"
@@ -32,12 +31,8 @@
 #ifdef DEBUG_LAN9118
 #define DPRINTF(fmt, ...) \
 do { printf("lan9118: " fmt , ## __VA_ARGS__); } while (0)
-#define BADF(fmt, ...) \
-do { hw_error("lan9118: error: " fmt , ## __VA_ARGS__);} while (0)
 #else
 #define DPRINTF(fmt, ...) do {} while(0)
-#define BADF(fmt, ...) \
-do { fprintf(stderr, "lan9118: error: " fmt , ## __VA_ARGS__);} while (0)
 #endif
 
 /* The tx and rx fifo ports are a range of aliased 32-bit registers */
@@ -848,7 +843,8 @@ static uint32_t do_phy_read(lan9118_state *s, int reg)
     case 30: /* Interrupt mask */
         return s->phy_int_mask;
     default:
-        BADF("PHY read reg %d\n", reg);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "do_phy_read: PHY read reg %d\n", reg);
         return 0;
     }
 }
@@ -876,7 +872,8 @@ static void do_phy_write(lan9118_state *s, int reg, uint32_t val)
         phy_update_irq(s);
         break;
     default:
-        BADF("PHY write reg %d = 0x%04x\n", reg, val);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "do_phy_write: PHY write reg %d = 0x%04x\n", reg, val);
     }
 }
 
@@ -1209,7 +1206,8 @@ static void lan9118_16bit_mode_write(void *opaque, hwaddr offset,
         return;
     }
 
-    hw_error("lan9118_write: Bad size 0x%x\n", size);
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "lan9118_16bit_mode_write: Bad size 0x%x\n", size);
 }
 
 static uint64_t lan9118_readl(void *opaque, hwaddr offset,
@@ -1324,7 +1322,8 @@ static uint64_t lan9118_16bit_mode_read(void *opaque, hwaddr offset,
         return lan9118_readl(opaque, offset, size);
     }
 
-    hw_error("lan9118_read: Bad size 0x%x\n", size);
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "lan9118_16bit_mode_read: Bad size 0x%x\n", size);
     return 0;
 }
 
-- 
2.25.1


