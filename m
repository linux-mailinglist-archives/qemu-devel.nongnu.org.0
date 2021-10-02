Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AB941FB06
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 13:06:00 +0200 (CEST)
Received: from localhost ([::1]:38826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWcq7-00086E-Qa
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 07:05:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mWckv-0004rL-KZ
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 07:00:48 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:33172
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mWckq-0004t6-PU
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 07:00:37 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mWckd-00020j-2R; Sat, 02 Oct 2021 12:00:23 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Sat,  2 Oct 2021 12:00:00 +0100
Message-Id: <20211002110007.30825-6-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211002110007.30825-1-mark.cave-ayland@ilande.co.uk>
References: <20211002110007.30825-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 05/12] macfb: add trace events for reading and writing the
 control registers
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
---
 hw/display/macfb.c      | 8 +++++++-
 hw/display/trace-events | 4 ++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index e86fbbbb64..62c2727a5b 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -20,6 +20,7 @@
 #include "qapi/error.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
+#include "trace.h"
 
 #define VIDEO_BASE 0x00001000
 #define DAFB_BASE  0x00800000
@@ -289,7 +290,10 @@ static uint64_t macfb_ctrl_read(void *opaque,
                                 hwaddr addr,
                                 unsigned int size)
 {
-    return 0;
+    uint64_t val = 0;
+
+    trace_macfb_ctrl_read(addr, val, size);
+    return val;
 }
 
 static void macfb_ctrl_write(void *opaque,
@@ -312,6 +316,8 @@ static void macfb_ctrl_write(void *opaque,
         }
         break;
     }
+
+    trace_macfb_ctrl_write(addr, val, size);
 }
 
 static const MemoryRegionOps macfb_ctrl_ops = {
diff --git a/hw/display/trace-events b/hw/display/trace-events
index f03f6655bc..be1353e8e7 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -167,3 +167,7 @@ sm501_disp_ctrl_read(uint32_t addr, uint32_t val) "addr=0x%x, val=0x%x"
 sm501_disp_ctrl_write(uint32_t addr, uint32_t val) "addr=0x%x, val=0x%x"
 sm501_2d_engine_read(uint32_t addr, uint32_t val) "addr=0x%x, val=0x%x"
 sm501_2d_engine_write(uint32_t addr, uint32_t val) "addr=0x%x, val=0x%x"
+
+# macfb.c
+macfb_ctrl_read(uint64_t addr, uint64_t value, int size) "addr 0x%"PRIx64 " value 0x%"PRIx64 " size %d"
+macfb_ctrl_write(uint64_t addr, uint64_t value, int size) "addr 0x%"PRIx64 " value 0x%"PRIx64 " size %d"
-- 
2.20.1


