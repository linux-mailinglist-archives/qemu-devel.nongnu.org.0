Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16134388B91
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 12:20:18 +0200 (CEST)
Received: from localhost ([::1]:49970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljJJJ-0005RE-5b
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 06:20:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljJ7k-0002dV-4C
 for qemu-devel@nongnu.org; Wed, 19 May 2021 06:08:20 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:37260
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljJ7h-0003Hu-5Z
 for qemu-devel@nongnu.org; Wed, 19 May 2021 06:08:19 -0400
Received: from host217-39-58-213.range217-39.btcentralplus.com
 ([217.39.58.213] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljJ7e-0001Gv-Td; Wed, 19 May 2021 11:08:15 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu, hpoussin@reactos.org
Date: Wed, 19 May 2021 11:08:02 +0100
Message-Id: <20210519100803.10293-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210519100803.10293-1-mark.cave-ayland@ilande.co.uk>
References: <20210519100803.10293-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 217.39.58.213
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 4/5] esp: revert 75ef849696 "esp: correctly fill bus id with
 requested lun"
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

This commit from nearly 10 years ago no longer appears to be required and in its
current form prevents the MacOS CDROM driver from detecting the CDROM drive. The
error is caused by the MacOS CDROM driver sending this CDB without DMA:

    0x12 0x00 0x00 0x00 0x05 0x00 (INQUIRY)

This is a valid INQUIRY command, however with this logic present the 3rd byte
(0x0) is copied over the 1st byte (0x12) which silently converts the INQUIRY
command to a TEST UNIT READY command before passing it to the QEMU SCSI layer.
Since the TEST UNIT READY command has a zero length response the MacOS CDROM
driver never receives a response and assumes the CDROM is not present.

Resolve the issue by reverting the original commit which I'm fairly sure is now
obsolete so that the original MacOS CDB is passed unaltered to the QEMU SCSI
layer.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/esp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index afb4a7f9f1..a6f7c6c1bf 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -260,9 +260,6 @@ static uint32_t get_cmd(ESPState *s, uint32_t maxlen)
             return 0;
         }
         n = esp_fifo_pop_buf(&s->fifo, buf, dmalen);
-        if (n >= 3) {
-            buf[0] = buf[2] >> 5;
-        }
         n = MIN(fifo8_num_free(&s->cmdfifo), n);
         fifo8_push_all(&s->cmdfifo, buf, n);
     }
-- 
2.20.1


