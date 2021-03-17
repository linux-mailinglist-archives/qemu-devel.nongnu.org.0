Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A4633FBA3
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 00:05:09 +0100 (CET)
Received: from localhost ([::1]:44044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMfDw-0003O7-Vm
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 19:05:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lMfBX-0002Aq-Ty
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 19:02:39 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35368
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lMfBW-0005Je-Dq
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 19:02:39 -0400
Received: from host86-148-103-84.range86-148.btcentralplus.com
 ([86.148.103.84] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lMfBU-0006Bn-Pg; Wed, 17 Mar 2021 23:02:41 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, alxndr@bu.edu, laurent@vivier.eu,
 pbonzini@redhat.com
Date: Wed, 17 Mar 2021 23:02:18 +0000
Message-Id: <20210317230223.24854-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210317230223.24854-1-mark.cave-ayland@ilande.co.uk>
References: <20210317230223.24854-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.103.84
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 1/6] esp: don't underflow cmdfifo if no message out/command
 data is present
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
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

If a guest sends a TI (Transfer Information) command without previously sending
any message out/command phase data then cmdfifo will underflow triggering an
assert reading the IDENTIFY byte.

Buglink: https://bugs.launchpad.net/qemu/+bug/1919035
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 507ab363bc..5d3f1ccbc8 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -318,18 +318,24 @@ static void do_busid_cmd(ESPState *s, uint8_t busid)
 
 static void do_cmd(ESPState *s)
 {
-    uint8_t busid = fifo8_pop(&s->cmdfifo);
+    uint8_t busid;
     uint32_t n;
 
-    s->cmdfifo_cdb_offset--;
+    if (fifo8_num_used(&s->cmdfifo)) {
+        busid = fifo8_pop(&s->cmdfifo);
 
-    /* Ignore extended messages for now */
-    if (s->cmdfifo_cdb_offset) {
-        fifo8_pop_buf(&s->cmdfifo, s->cmdfifo_cdb_offset, &n);
-        s->cmdfifo_cdb_offset = 0;
-    }
+        if (s->cmdfifo_cdb_offset) {
+            s->cmdfifo_cdb_offset--;
+
+            /* Ignore extended messages for now */
+            if (s->cmdfifo_cdb_offset) {
+                fifo8_pop_buf(&s->cmdfifo, s->cmdfifo_cdb_offset, &n);
+                s->cmdfifo_cdb_offset = 0;
+            }
+        }
 
-    do_busid_cmd(s, busid);
+        do_busid_cmd(s, busid);
+    }
 }
 
 static void satn_pdma_cb(ESPState *s)
-- 
2.20.1


