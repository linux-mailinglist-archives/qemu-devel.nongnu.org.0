Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2FE2E7A95
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 16:46:22 +0100 (CET)
Received: from localhost ([::1]:59438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kudg5-0000SP-Iu
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 10:46:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudZb-0001VB-Ay
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 10:39:39 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50916
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudZW-0002Gf-5b
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 10:39:39 -0500
Received: from host86-148-34-1.range86-148.btcentralplus.com ([86.148.34.1]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kudZL-00070L-2b; Wed, 30 Dec 2020 15:39:27 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Wed, 30 Dec 2020 15:37:41 +0000
Message-Id: <20201230153745.30241-22-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
References: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 21/25] esp: rename get_cmd_cb() to esp_select()
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

This better describes the purpose of the function.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 33e3cf657b..50bddc7d68 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -199,7 +199,7 @@ static void esp_pdma_write(ESPState *s, uint8_t val)
     esp_set_tc(s, dmalen);
 }
 
-static int get_cmd_cb(ESPState *s)
+static int esp_select(ESPState *s)
 {
     int target;
 
@@ -255,7 +255,7 @@ static uint32_t get_cmd(ESPState *s, uint8_t *buf, uint8_t buflen)
     }
     trace_esp_get_cmd(dmalen, target);
 
-    if (get_cmd_cb(s) < 0) {
+    if (esp_select(s) < 0) {
         return 0;
     }
     return dmalen;
@@ -297,7 +297,7 @@ static void do_cmd(ESPState *s, uint8_t *buf)
 
 static void satn_pdma_cb(ESPState *s)
 {
-    if (get_cmd_cb(s) < 0) {
+    if (esp_select(s) < 0) {
         return;
     }
     s->do_cmd = 0;
@@ -323,7 +323,7 @@ static void handle_satn(ESPState *s)
 
 static void s_without_satn_pdma_cb(ESPState *s)
 {
-    if (get_cmd_cb(s) < 0) {
+    if (esp_select(s) < 0) {
         return;
     }
     s->do_cmd = 0;
@@ -349,7 +349,7 @@ static void handle_s_without_atn(ESPState *s)
 
 static void satn_stop_pdma_cb(ESPState *s)
 {
-    if (get_cmd_cb(s) < 0) {
+    if (esp_select(s) < 0) {
         return;
     }
     s->do_cmd = 0;
-- 
2.20.1


