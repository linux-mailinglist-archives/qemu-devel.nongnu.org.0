Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D79B633E23B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 00:36:49 +0100 (CET)
Received: from localhost ([::1]:35062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMJF2-0000R4-Tu
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 19:36:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lMJ9e-0002aM-Rw
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:31:15 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:33382
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lMJ9d-0007Ic-0j
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:31:14 -0400
Received: from host109-156-104-46.range109-156.btcentralplus.com
 ([109.156.104.46] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lMJ9a-0006Mg-SC; Tue, 16 Mar 2021 23:31:16 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	alxndr@bu.edu
Date: Tue, 16 Mar 2021 23:30:23 +0000
Message-Id: <20210316233024.13560-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210316233024.13560-1-mark.cave-ayland@ilande.co.uk>
References: <20210316233024.13560-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.156.104.46
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 3/4] esp: ensure cmdfifo is not empty and current_dev is
 non-NULL
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

When about to execute a SCSI command, ensure that cmdfifo is not empty and
current_dev is non-NULL. This can happen if the guest tries to execute a TI
(Transfer Information) command without issuing one of the select commands
first.

Buglink: https://bugs.launchpad.net/qemu/+bug/1910723
Buglink: https://bugs.launchpad.net/qemu/+bug/1909247
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index bbcbfa4a91..ae362c9dfb 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -286,6 +286,9 @@ static void do_busid_cmd(ESPState *s, uint8_t busid)
     trace_esp_do_busid_cmd(busid);
     lun = busid & 7;
     cmdlen = fifo8_num_used(&s->cmdfifo);
+    if (!cmdlen || !s->current_dev) {
+        return;
+    }
     buf = (uint8_t *)fifo8_pop_buf(&s->cmdfifo, cmdlen, &n);
 
     current_lun = scsi_device_find(&s->bus, 0, s->current_dev->id, lun);
-- 
2.20.1


