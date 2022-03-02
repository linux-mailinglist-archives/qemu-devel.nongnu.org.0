Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B6A4CB153
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 22:30:56 +0100 (CET)
Received: from localhost ([::1]:59968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPWYg-0003zS-MD
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 16:30:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nPWWH-0001UQ-Jo
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 16:28:25 -0500
Received: from [2001:41c9:1:41f::167] (port=54752
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nPWWG-0002DP-8W
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 16:28:25 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nPWVc-000C4G-E3; Wed, 02 Mar 2022 21:27:44 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu, pbonzini@redhat.com, fam@euphon.net,
 qemu-devel@nongnu.org
Date: Wed,  2 Mar 2022 21:27:45 +0000
Message-Id: <20220302212752.6922-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220302212752.6922-1-mark.cave-ayland@ilande.co.uk>
References: <20220302212752.6922-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 03/10] macfb: increase number of registers saved in
 MacfbState
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The MacOS toolbox ROM accesses a number of addresses between 0x0 and 0x200 during
initialisation and resolution changes. Whilst the function of many of these
registers is unknown, it is worth the minimal cost of saving these extra values as
part of migration to help future-proof the migration stream for the q800 machine
as it starts to stabilise.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/display/macfb.c         | 8 ++++++++
 include/hw/display/macfb.h | 3 ++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index fb54b460c1..dfdae90144 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -537,6 +537,10 @@ static uint64_t macfb_ctrl_read(void *opaque,
     case DAFB_MODE_SENSE:
         val = macfb_sense_read(s);
         break;
+    default:
+        if (addr < MACFB_CTRL_TOPADDR) {
+            val = s->regs[addr >> 2];
+        }
     }
 
     trace_macfb_ctrl_read(addr, val, size);
@@ -592,6 +596,10 @@ static void macfb_ctrl_write(void *opaque,
             macfb_invalidate_display(s);
         }
         break;
+    default:
+        if (addr < MACFB_CTRL_TOPADDR) {
+            s->regs[addr >> 2] = val;
+        }
     }
 
     trace_macfb_ctrl_write(addr, val, size);
diff --git a/include/hw/display/macfb.h b/include/hw/display/macfb.h
index 6d9f0f7869..55a50d3fb0 100644
--- a/include/hw/display/macfb.h
+++ b/include/hw/display/macfb.h
@@ -48,7 +48,8 @@ typedef struct MacFbMode {
     uint32_t offset;
 } MacFbMode;
 
-#define MACFB_NUM_REGS      8
+#define MACFB_CTRL_TOPADDR  0x200
+#define MACFB_NUM_REGS      (MACFB_CTRL_TOPADDR / sizeof(uint32_t))
 
 typedef struct MacfbState {
     MemoryRegion mem_vram;
-- 
2.20.1


