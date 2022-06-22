Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E11554577
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 12:59:35 +0200 (CEST)
Received: from localhost ([::1]:52890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3y58-0005Cm-KF
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 06:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3xzx-00051k-AJ; Wed, 22 Jun 2022 06:54:13 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:37894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3xzv-0005Ue-Gx; Wed, 22 Jun 2022 06:54:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bhsUdSsraJqovbQCxXheYzofNcvtG8Qou8t2HxOQhCM=; b=HK1IB9r7zM1JN5Qy7Aar3EWGe5
 FuHiZ3MiMGedV8ijidvv/b0KivdtYB41XeVPIQ3Gy6FjLB2Y/lu1Fk0JDCnpGkVB2Y2Fznx1maHeD
 vLiL0U7eGC2ka9Ez6K5PABNmCKIFqoIvjXSQFIhXXkDs5qF3MOAYEMfXZxAAPjDvfBcUvt557B4gh
 nt6K3NuaGJxilgzvelDM20Yatkziuw+orxAsp/L12Ao6MZXCYfv/d/0W1W7uJLtsULYwT3o44LpCm
 70/TSjNnC2x0lM/gG7r9sWIAVt0sWboC6AUcsW2I/ID5hW/vzrCwQt+oDB7x6DaJS1WEpYdebU9Ps
 9nVC3ReIn+onIVvFkSqP3UB6n9t1OSvXkg+RH+xwx43LBCfQwrsccflHpc94WQ22O1idgtPSlb59/
 D6TnkUrfVwk/DXSQDemVsJru9GHsSiLDrVLJcf64CZSWarghYEIvBXhQJKbFX4nhtp14H7RXEOMIq
 tZzzGe3HjMGH205ylWPcWLmNk5h3zFoCzDw208m8h7KkOhERNqQgqupDQss/6kHOVv2xxef3exR78
 DjNz0CT02Dx6yWthHDtBeUSGsIXoUTV6NFvy/2X9Q4p1BsWMwJ4h/Sujhlr8s5CdwEaB11izlWOdL
 qdqNW7D4gHnEjytgldCVo5syYjkGTOgkuoCZGnWB0=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3xyg-000CTX-N8; Wed, 22 Jun 2022 11:52:58 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com, laurent@vivier.eu, fam@euphon.net,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Date: Wed, 22 Jun 2022 11:53:09 +0100
Message-Id: <20220622105314.802852-10-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220622105314.802852-1-mark.cave-ayland@ilande.co.uk>
References: <20220622105314.802852-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 09/14] scsi-disk: add SCSI_DISK_QUIRK_MODE_PAGE_TRUNCATED
 quirk for Macintosh
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

The work at [1] suggests that this truncated request is accepted on real
hardware whereas in QEMU it generates an INVALID_PARAM_LEN sense code which
causes A/UX to get stuck in a loop retrying the command in an attempt to succeed.

Alter the mode page request length check so that truncated requests are allowed
if the SCSI_DISK_QUIRK_MODE_PAGE_TRUNCATED quirk is enabled, whilst also adding a
trace event to enable the condition to be detected.

[1] https://68kmla.org/bb/index.php?threads/scsi2sd-project-anyone-interested.29040/page-7#post-316444

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/scsi-disk.c    | 7 ++++++-
 hw/scsi/trace-events   | 1 +
 include/hw/scsi/scsi.h | 1 +
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index f09c1acae2..b225ec1a4c 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -1552,7 +1552,10 @@ static int mode_select_pages(SCSIDiskReq *r, uint8_t *p, int len, bool change)
             goto invalid_param;
         }
         if (page_len > len) {
-            goto invalid_param_len;
+            if (!(s->quirks & SCSI_DISK_QUIRK_MODE_PAGE_TRUNCATED)) {
+                goto invalid_param_len;
+            }
+            trace_scsi_disk_mode_select_page_truncated(page, page_len, len);
         }
 
         if (!change) {
@@ -3152,6 +3155,8 @@ static Property scsi_cd_properties[] = {
     DEFINE_PROP_BIT("quirk_mode_page_vendor_specific_apple", SCSIDiskState,
                     quirks, SCSI_DISK_QUIRK_MODE_PAGE_VENDOR_SPECIFIC_APPLE,
                     0),
+    DEFINE_PROP_BIT("quirk_mode_page_truncated", SCSIDiskState, quirks,
+                    SCSI_DISK_QUIRK_MODE_PAGE_TRUNCATED, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
index 03b2640934..8e927ff62d 100644
--- a/hw/scsi/trace-events
+++ b/hw/scsi/trace-events
@@ -339,6 +339,7 @@ scsi_disk_dma_command_READ(uint64_t lba, uint32_t len) "Read (sector %" PRId64 "
 scsi_disk_dma_command_WRITE(const char *cmd, uint64_t lba, int len) "Write %s(sector %" PRId64 ", count %u)"
 scsi_disk_new_request(uint32_t lun, uint32_t tag, const char *line) "Command: lun=%d tag=0x%x data=%s"
 scsi_disk_aio_sgio_command(uint32_t tag, uint8_t cmd, uint64_t lba, int len, uint32_t timeout) "disk aio sgio: tag=0x%x cmd=0x%x (sector %" PRId64 ", count %d) timeout=%u"
+scsi_disk_mode_select_page_truncated(int page, int len, int page_len) "page %d expected length %d but received length %d"
 
 # scsi-generic.c
 scsi_generic_command_complete_noio(void *req, uint32_t tag, int statuc) "Command complete %p tag=0x%x status=%d"
diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index 011cb84753..e284e3a4ec 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -230,5 +230,6 @@ extern const SCSIReqOps scsi_generic_req_ops;
 #define SCSI_DISK_QUIRK_MODE_PAGE_APPLE_VENDOR             0
 #define SCSI_DISK_QUIRK_MODE_SENSE_ROM_USE_DBD             1
 #define SCSI_DISK_QUIRK_MODE_PAGE_VENDOR_SPECIFIC_APPLE    2
+#define SCSI_DISK_QUIRK_MODE_PAGE_TRUNCATED                3
 
 #endif
-- 
2.30.2


