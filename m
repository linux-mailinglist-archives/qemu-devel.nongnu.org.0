Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A85E72F5C81
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 09:35:54 +0100 (CET)
Received: from localhost ([::1]:35644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzy6j-0003hn-Ok
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 03:35:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kzy4d-00020h-4e
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 03:33:43 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41106
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kzy4a-0001AQ-Qj
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 03:33:42 -0500
Received: from host109-146-177-189.range109-146.btcentralplus.com
 ([109.146.177.189] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kzy4g-00078p-7b; Thu, 14 Jan 2021 08:33:50 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Thu, 14 Jan 2021 08:33:29 +0000
Message-Id: <20210114083329.10494-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.146.177.189
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH] utils/fifo8: change fatal errors from abort() to assert()
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

Developer errors are better represented with assert() rather than abort().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
This was suggested by Peter during a discussion on IRC yesterday.

---
 util/fifo8.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/util/fifo8.c b/util/fifo8.c
index a5dd789ce5..d4d1c135e0 100644
--- a/util/fifo8.c
+++ b/util/fifo8.c
@@ -31,9 +31,7 @@ void fifo8_destroy(Fifo8 *fifo)
 
 void fifo8_push(Fifo8 *fifo, uint8_t data)
 {
-    if (fifo->num == fifo->capacity) {
-        abort();
-    }
+    assert(fifo->num < fifo->capacity);
     fifo->data[(fifo->head + fifo->num) % fifo->capacity] = data;
     fifo->num++;
 }
@@ -42,9 +40,7 @@ void fifo8_push_all(Fifo8 *fifo, const uint8_t *data, uint32_t num)
 {
     uint32_t start, avail;
 
-    if (fifo->num + num > fifo->capacity) {
-        abort();
-    }
+    assert(fifo->num + num <= fifo->capacity);
 
     start = (fifo->head + fifo->num) % fifo->capacity;
 
@@ -63,9 +59,7 @@ uint8_t fifo8_pop(Fifo8 *fifo)
 {
     uint8_t ret;
 
-    if (fifo->num == 0) {
-        abort();
-    }
+    assert(fifo->num > 0);
     ret = fifo->data[fifo->head++];
     fifo->head %= fifo->capacity;
     fifo->num--;
@@ -76,9 +70,7 @@ const uint8_t *fifo8_pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *num)
 {
     uint8_t *ret;
 
-    if (max == 0 || max > fifo->num) {
-        abort();
-    }
+    assert(max > 0 && max <= fifo->num);
     *num = MIN(fifo->capacity - fifo->head, max);
     ret = &fifo->data[fifo->head];
     fifo->head += *num;
-- 
2.20.1


