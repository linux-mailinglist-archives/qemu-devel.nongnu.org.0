Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6655A665509
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 08:12:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFVHU-0001Xv-AO; Wed, 11 Jan 2023 02:12:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1pFVHR-0001NN-V2
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 02:12:13 -0500
Received: from [183.159.98.38] (helo=liuqiang-OptiPlex-7060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1pFVHQ-0000i7-0e
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 02:12:13 -0500
Received: from localhost (liuqiang-OptiPlex-7060 [local])
 by liuqiang-OptiPlex-7060 (OpenSMTPD) with ESMTPA id 8cea2c1f;
 Wed, 11 Jan 2023 07:05:29 +0000 (UTC)
From: Qiang Liu <cyruscyliu@gmail.com>
To: qemu-devel@nongnu.org
Cc: Qiang Liu <cyruscyliu@gmail.com>,
	Jason Wang <jasowang@redhat.com>
Subject: [PATCH] hw/net/lan9118: log [read|write]b when mode_16bit is enabled
 rather than abort
Date: Wed, 11 Jan 2023 15:05:18 +0800
Message-Id: <20230111070518.994646-1-cyruscyliu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 183.159.98.38 (failed)
Received-SPF: softfail client-ip=183.159.98.38;
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
---
 hw/net/lan9118.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index f1cba55967..7f35715f27 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -1209,7 +1209,8 @@ static void lan9118_16bit_mode_write(void *opaque, hwaddr offset,
         return;
     }
 
-    hw_error("lan9118_write: Bad size 0x%x\n", size);
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "lan9118_16bit_mode_write: Bad size 0x%x\n", size);
 }
 
 static uint64_t lan9118_readl(void *opaque, hwaddr offset,
@@ -1324,7 +1325,8 @@ static uint64_t lan9118_16bit_mode_read(void *opaque, hwaddr offset,
         return lan9118_readl(opaque, offset, size);
     }
 
-    hw_error("lan9118_read: Bad size 0x%x\n", size);
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "lan9118_16bit_mode_read: Bad size 0x%x\n", size);
     return 0;
 }
 
-- 
2.25.1


