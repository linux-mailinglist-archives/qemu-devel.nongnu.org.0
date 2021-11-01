Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C9F442114
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 20:50:38 +0100 (CET)
Received: from localhost ([::1]:45764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhdKF-0003Il-4s
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 15:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mhc9x-0004wL-AH
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:35:53 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43248
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mhc9u-0007K2-3i
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:35:53 -0400
Received: from [2a00:23c4:8b9d:f500:9396:df17:737c:b32c] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mhc9L-0002So-Vr; Mon, 01 Nov 2021 18:35:20 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com, fam@euphon.net, thuth@redhat.com, lvivier@redhat.com,
 qemu-devel@nongnu.org
Date: Mon,  1 Nov 2021 18:35:15 +0000
Message-Id: <20211101183516.8455-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211101183516.8455-1-mark.cave-ayland@ilande.co.uk>
References: <20211101183516.8455-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:f500:9396:df17:737c:b32c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 1/2] esp: ensure in-flight SCSI requests are always cancelled
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

There is currently a check in esp_select() to cancel any in-flight SCSI requests
to ensure that issuing multiple select commands without continuing through the
rest of the ESP state machine ignores all but the last SCSI request. This is
also enforced through the addition of assert()s in esp_transfer_data() and
scsi_read_data().

The get_cmd() function does not call esp_select() when TC == 0 which means it is
possible for a fuzzer to trigger these assert()s by sending a select command when
TC == 0 immediately after a valid SCSI CDB has been submitted.

Since esp_select() is only called from get_cmd(), hoist the check to cancel
in-flight SCSI requests from esp_select() into get_cmd() to ensure it is always
called when executing a select command to initiate a new SCSI request.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Closes: https://gitlab.com/qemu-project/qemu/-/issues/662
Closes: https://gitlab.com/qemu-project/qemu/-/issues/663
---
 hw/scsi/esp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 8454ed1773..84f935b549 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -204,11 +204,6 @@ static int esp_select(ESPState *s)
     s->ti_size = 0;
     fifo8_reset(&s->fifo);
 
-    if (s->current_req) {
-        /* Started a new command before the old one finished.  Cancel it.  */
-        scsi_req_cancel(s->current_req);
-    }
-
     s->current_dev = scsi_device_find(&s->bus, 0, target, 0);
     if (!s->current_dev) {
         /* No such drive */
@@ -235,6 +230,11 @@ static uint32_t get_cmd(ESPState *s, uint32_t maxlen)
     uint32_t dmalen, n;
     int target;
 
+    if (s->current_req) {
+        /* Started a new command before the old one finished.  Cancel it.  */
+        scsi_req_cancel(s->current_req);
+    }
+
     target = s->wregs[ESP_WBUSID] & BUSID_DID;
     if (s->dma) {
         dmalen = MIN(esp_get_tc(s), maxlen);
-- 
2.20.1


