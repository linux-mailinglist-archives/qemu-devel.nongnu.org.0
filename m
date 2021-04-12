Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2537A35D346
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 00:42:03 +0200 (CEST)
Received: from localhost ([::1]:42500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lW5Fq-0007Gz-6g
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 18:42:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lW4wW-0003IZ-By
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 18:22:04 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:44112
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lW4wU-0003CM-2m
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 18:22:04 -0400
Received: from host86-148-103-9.range86-148.btcentralplus.com ([86.148.103.9]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lW4we-0004Dc-VW; Mon, 12 Apr 2021 23:22:17 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 12 Apr 2021 23:20:47 +0100
Message-Id: <20210412222048.22818-13-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210412222048.22818-1-mark.cave-ayland@ilande.co.uk>
References: <20210412222048.22818-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.103.9
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 12/13] esp: ensure that do_cmd is set to zero before submitting
 an ESP select command
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

When a CDB has been received and is about to be submitted to the SCSI layer
via one of the ESP select commands, ensure that do_cmd is set to zero before
executing the command.

Otherwise a guest executing 2 valid CDBs in quick sequence can invoke the SCSI
.transfer_data callback again before do_cmd is set to zero by the callback
function triggering an assert at the start of esp_transfer_data().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210407195801.685-12-mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 0037197bdb..b668acef82 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -357,6 +357,7 @@ static void handle_satn(ESPState *s)
     cmdlen = get_cmd(s, ESP_CMDFIFO_SZ);
     if (cmdlen > 0) {
         s->cmdfifo_cdb_offset = 1;
+        s->do_cmd = 0;
         do_cmd(s);
     } else if (cmdlen == 0) {
         s->do_cmd = 1;
@@ -390,6 +391,7 @@ static void handle_s_without_atn(ESPState *s)
     cmdlen = get_cmd(s, ESP_CMDFIFO_SZ);
     if (cmdlen > 0) {
         s->cmdfifo_cdb_offset = 0;
+        s->do_cmd = 0;
         do_busid_cmd(s, 0);
     } else if (cmdlen == 0) {
         s->do_cmd = 1;
-- 
2.20.1


