Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EC6425FCE
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 00:23:23 +0200 (CEST)
Received: from localhost ([::1]:44416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYbnO-0001I7-Dx
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 18:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mYbdp-0003RO-C5
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 18:13:33 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41902
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mYbdn-000772-UX
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 18:13:29 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mYbdY-0003uC-5u; Thu, 07 Oct 2021 23:13:16 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Thu,  7 Oct 2021 23:12:46 +0100
Message-Id: <20211007221253.29024-7-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211007221253.29024-1-mark.cave-ayland@ilande.co.uk>
References: <20211007221253.29024-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v4 06/13] macfb: add trace events for reading and writing the
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/display/macfb.c      | 8 +++++++-
 hw/display/trace-events | 4 ++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index f88f5a6523..1128a51c98 100644
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
@@ -311,6 +315,8 @@ static void macfb_ctrl_write(void *opaque,
         }
         break;
     }
+
+    trace_macfb_ctrl_write(addr, val, size);
 }
 
 static const MemoryRegionOps macfb_ctrl_ops = {
diff --git a/hw/display/trace-events b/hw/display/trace-events
index f03f6655bc..f227de1bb9 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -167,3 +167,7 @@ sm501_disp_ctrl_read(uint32_t addr, uint32_t val) "addr=0x%x, val=0x%x"
 sm501_disp_ctrl_write(uint32_t addr, uint32_t val) "addr=0x%x, val=0x%x"
 sm501_2d_engine_read(uint32_t addr, uint32_t val) "addr=0x%x, val=0x%x"
 sm501_2d_engine_write(uint32_t addr, uint32_t val) "addr=0x%x, val=0x%x"
+
+# macfb.c
+macfb_ctrl_read(uint64_t addr, uint64_t value, unsigned int size) "addr 0x%"PRIx64 " value 0x%"PRIx64 " size %u"
+macfb_ctrl_write(uint64_t addr, uint64_t value, unsigned int size) "addr 0x%"PRIx64 " value 0x%"PRIx64 " size %u"
-- 
2.20.1


