Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C94B433FBA6
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 00:05:26 +0100 (CET)
Received: from localhost ([::1]:45070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMfED-0003ok-S6
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 19:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lMfBk-0002TM-3E
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 19:02:52 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35390
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lMfBi-0005Oy-Bp
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 19:02:51 -0400
Received: from host86-148-103-84.range86-148.btcentralplus.com
 ([86.148.103.84] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lMfBe-0006Bn-Gq; Wed, 17 Mar 2021 23:02:53 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, alxndr@bu.edu, laurent@vivier.eu,
 pbonzini@redhat.com
Date: Wed, 17 Mar 2021 23:02:20 +0000
Message-Id: <20210317230223.24854-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210317230223.24854-1-mark.cave-ayland@ilande.co.uk>
References: <20210317230223.24854-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.103.84
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 3/6] esp: ensure cmdfifo is not empty and current_dev is
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


