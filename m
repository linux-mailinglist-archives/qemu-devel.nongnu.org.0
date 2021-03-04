Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF34232DCE8
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 23:23:52 +0100 (CET)
Received: from localhost ([::1]:38878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHwNr-0005ta-Uc
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 17:23:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lHwDx-0008IT-Mn
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 17:13:37 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40158
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lHwDw-0006Rd-7k
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 17:13:37 -0500
Received: from host86-148-34-47.range86-148.btcentralplus.com ([86.148.34.47]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lHwDp-0008MJ-UJ; Thu, 04 Mar 2021 22:13:34 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
Date: Thu,  4 Mar 2021 22:10:47 +0000
Message-Id: <20210304221103.6369-27-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210304221103.6369-1-mark.cave-ayland@ilande.co.uk>
References: <20210304221103.6369-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.47
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 26/42] esp: rename get_cmd_cb() to esp_select()
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/scsi/esp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index d5c03f9697..d8d7ede00a 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -199,7 +199,7 @@ static void esp_pdma_write(ESPState *s, uint8_t val)
     esp_set_tc(s, dmalen);
 }
 
-static int get_cmd_cb(ESPState *s)
+static int esp_select(ESPState *s)
 {
     int target;
 
@@ -256,7 +256,7 @@ static uint32_t get_cmd(ESPState *s)
     }
     trace_esp_get_cmd(dmalen, target);
 
-    if (get_cmd_cb(s) < 0) {
+    if (esp_select(s) < 0) {
         return 0;
     }
     return dmalen;
@@ -299,7 +299,7 @@ static void do_cmd(ESPState *s)
 
 static void satn_pdma_cb(ESPState *s)
 {
-    if (get_cmd_cb(s) < 0) {
+    if (esp_select(s) < 0) {
         return;
     }
     s->do_cmd = 0;
@@ -325,7 +325,7 @@ static void handle_satn(ESPState *s)
 
 static void s_without_satn_pdma_cb(ESPState *s)
 {
-    if (get_cmd_cb(s) < 0) {
+    if (esp_select(s) < 0) {
         return;
     }
     s->do_cmd = 0;
@@ -351,7 +351,7 @@ static void handle_s_without_atn(ESPState *s)
 
 static void satn_stop_pdma_cb(ESPState *s)
 {
-    if (get_cmd_cb(s) < 0) {
+    if (esp_select(s) < 0) {
         return;
     }
     s->do_cmd = 0;
-- 
2.20.1


