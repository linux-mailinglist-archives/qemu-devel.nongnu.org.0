Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE2750D3A9
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Apr 2022 18:53:13 +0200 (CEST)
Received: from localhost ([::1]:42084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nifU0-00063B-3T
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 12:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nifR8-0002CR-KT; Sun, 24 Apr 2022 12:50:15 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:36154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nifR7-000140-0g; Sun, 24 Apr 2022 12:50:14 -0400
Received: from [2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nifQ9-000BIt-31; Sun, 24 Apr 2022 17:49:17 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com, laurent@vivier.eu, fam@euphon.net,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Date: Sun, 24 Apr 2022 17:49:31 +0100
Message-Id: <20220424164935.7339-8-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220424164935.7339-1-mark.cave-ayland@ilande.co.uk>
References: <20220424164935.7339-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 07/11] scsi-disk: allow truncated MODE SELECT requests
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

When A/UX configures the CDROM device it sends a truncated MODE SELECT request
for page 1 (MODE_PAGE_R_W_ERROR) which is only 6 bytes in length rather than
10. This seems to be due to bug in Apple's code which calculates the CDB message
length incorrectly.

According to [1] this truncated request is accepted on real hardware whereas in
QEMU it generates an INVALID_PARAM_LEN sense code which causes A/UX to get stuck
in a loop retrying the command in an attempt to succeed.

Alter the mode page request length check so that truncated requests are allowed
as per real hardware, adding a trace event to enable the condition to be detected.

[1] https://68kmla.org/bb/index.php?threads/scsi2sd-project-anyone-interested.29040/page-7#post-316444

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/scsi-disk.c  | 2 +-
 hw/scsi/trace-events | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 71fdf132c1..c657e4f5da 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -1525,7 +1525,7 @@ static int mode_select_pages(SCSIDiskReq *r, uint8_t *p, int len, bool change)
             goto invalid_param;
         }
         if (page_len > len) {
-            goto invalid_param_len;
+            trace_scsi_disk_mode_select_page_truncated(page, page_len, len);
         }
 
         if (!change) {
diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
index e91b55a961..25eae9f307 100644
--- a/hw/scsi/trace-events
+++ b/hw/scsi/trace-events
@@ -339,6 +339,7 @@ scsi_disk_dma_command_READ(uint64_t lba, uint32_t len) "Read (sector %" PRId64 "
 scsi_disk_dma_command_WRITE(const char *cmd, uint64_t lba, int len) "Write %s(sector %" PRId64 ", count %u)"
 scsi_disk_new_request(uint32_t lun, uint32_t tag, const char *line) "Command: lun=%d tag=0x%x data=%s"
 scsi_disk_aio_sgio_command(uint32_t tag, uint8_t cmd, uint64_t lba, int len, uint32_t timeout) "disk aio sgio: tag=0x%x cmd=0x%x (sector %" PRId64 ", count %d) timeout=%u"
+scsi_disk_mode_select_page_truncated(int page, int len, int page_len) "page %d expected length %d but received length %d"
 
 # scsi-generic.c
 scsi_generic_command_complete_noio(void *req, uint32_t tag, int statuc) "Command complete %p tag=0x%x status=%d"
-- 
2.20.1


