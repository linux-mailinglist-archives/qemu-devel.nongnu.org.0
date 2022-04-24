Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9892850D3A8
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Apr 2022 18:52:47 +0200 (CEST)
Received: from localhost ([::1]:40328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nifTa-0004sW-Ky
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 12:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nifQr-0001yn-J1; Sun, 24 Apr 2022 12:50:00 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:36094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nifQq-0000rD-4U; Sun, 24 Apr 2022 12:49:57 -0400
Received: from [2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nifPq-000BIt-Vw; Sun, 24 Apr 2022 17:48:59 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com, laurent@vivier.eu, fam@euphon.net,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Date: Sun, 24 Apr 2022 17:49:25 +0100
Message-Id: <20220424164935.7339-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220424164935.7339-1-mark.cave-ayland@ilande.co.uk>
References: <20220424164935.7339-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 01/11] scsi-disk: add FORMAT UNIT command
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

When initialising a drive ready to install MacOS, Apple HD SC Setup first attempts
to format the drive. Add a simple FORMAT UNIT command which simply returns success
to allow the format to succeed.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/scsi-disk.c  | 4 ++++
 hw/scsi/trace-events | 1 +
 2 files changed, 5 insertions(+)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 072686ed58..090679f3b5 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -2127,6 +2127,9 @@ static int32_t scsi_disk_emulate_command(SCSIRequest *req, uint8_t *buf)
         trace_scsi_disk_emulate_command_WRITE_SAME(
                 req->cmd.buf[0] == WRITE_SAME_10 ? 10 : 16, r->req.cmd.xfer);
         break;
+    case FORMAT_UNIT:
+        trace_scsi_disk_emulate_command_FORMAT_UNIT(r->req.cmd.xfer);
+        break;
     default:
         trace_scsi_disk_emulate_command_UNKNOWN(buf[0],
                                                 scsi_command_name(buf[0]));
@@ -2533,6 +2536,7 @@ static const SCSIReqOps *const scsi_disk_reqops_dispatch[256] = {
     [VERIFY_10]                       = &scsi_disk_emulate_reqops,
     [VERIFY_12]                       = &scsi_disk_emulate_reqops,
     [VERIFY_16]                       = &scsi_disk_emulate_reqops,
+    [FORMAT_UNIT]                     = &scsi_disk_emulate_reqops,
 
     [READ_6]                          = &scsi_disk_dma_reqops,
     [READ_10]                         = &scsi_disk_dma_reqops,
diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
index 20fb0dc162..e91b55a961 100644
--- a/hw/scsi/trace-events
+++ b/hw/scsi/trace-events
@@ -334,6 +334,7 @@ scsi_disk_emulate_command_UNMAP(size_t xfer) "Unmap (len %zd)"
 scsi_disk_emulate_command_VERIFY(int bytchk) "Verify (bytchk %d)"
 scsi_disk_emulate_command_WRITE_SAME(int cmd, size_t xfer) "WRITE SAME %d (len %zd)"
 scsi_disk_emulate_command_UNKNOWN(int cmd, const char *name) "Unknown SCSI command (0x%2.2x=%s)"
+scsi_disk_emulate_command_FORMAT_UNIT(size_t xfer) "Format Unit (len %zd)"
 scsi_disk_dma_command_READ(uint64_t lba, uint32_t len) "Read (sector %" PRId64 ", count %u)"
 scsi_disk_dma_command_WRITE(const char *cmd, uint64_t lba, int len) "Write %s(sector %" PRId64 ", count %u)"
 scsi_disk_new_request(uint32_t lun, uint32_t tag, const char *line) "Command: lun=%d tag=0x%x data=%s"
-- 
2.20.1


