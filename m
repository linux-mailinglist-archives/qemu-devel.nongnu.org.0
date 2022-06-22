Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1541B55459B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 13:07:00 +0200 (CEST)
Received: from localhost ([::1]:40402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3yCJ-0007zp-3m
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 07:06:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3xzt-0004oe-Tf; Wed, 22 Jun 2022 06:54:09 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:37876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3xzs-0005UF-AY; Wed, 22 Jun 2022 06:54:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nGNOWG6fop6xkocURliDQI+5P2GkAVoxMSMGWwzk5Ho=; b=zTe5wfud2UOJrvRkpZnGDnX2by
 o9AwjNzS1XFVxQBAV4deAA93siyOOw3WOHTtMz41/YzFac8EkFJ3px6c/ksrdCXc4BbxP3exfimT5
 VH0PbIjV54AlBmvMGUcCnwpL7fcp0aZu8qatcTBBUrq2/TV6VbkcAuaYFpMPizmxSY7RYZ+yp+SpX
 XdhDM/WWXzupGnfnfJ3vwY8Y4Gr8tYiUHfZ5/r/KN6vNuHYjnS6/98b3mpugqOjfZg+AQNWooQZm3
 HU/ltfxPALKvmhvaNhT2hY2lkS+KJjBfUQUUh+4NQoi8YhfbIIZdUGqOfyIWUeUPxy5ryRNttbPbc
 nKMM8aHOpBusoYJdX0+ZkK42za8CogYD7yywu41DkeO6NXCR4ZYER8WO3/nPYdacAou5Bpjlb2YKd
 a9EKCsbpgDmUExKO4yhAN7TtpI0O3ruYlzGrmNrDiUa5u1azIjOkN+2yAJ54pwBMNzrwrt12GkikF
 cLGGKONE3rEEDBl5mFqET2RJydNY3lF6UORf/wllxt2BARhXzllfPYDqvsr8nu6H2ewPJGCvl/+dt
 MmyezSLhzUJC4//SORqyuLIcaumfFcZ/oqkrg34WyAb2r4b3aIV+IBvt3ChamCDV0kLmKM0nJ5MsG
 8kIUw7jc/bJxElwMTdEpjNg1Z1085fsXevBRcr1sg=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3xyc-000CTX-DE; Wed, 22 Jun 2022 11:52:54 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com, laurent@vivier.eu, fam@euphon.net,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Date: Wed, 22 Jun 2022 11:53:08 +0100
Message-Id: <20220622105314.802852-9-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220622105314.802852-1-mark.cave-ayland@ilande.co.uk>
References: <20220622105314.802852-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 08/14] scsi-disk: add FORMAT UNIT command
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

When initialising a drive ready to install MacOS, Apple HD SC Setup first attempts
to format the drive. Add a simple FORMAT UNIT command which simply returns success
to allow the format to succeed.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/scsi/scsi-disk.c  | 4 ++++
 hw/scsi/trace-events | 1 +
 2 files changed, 5 insertions(+)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index ce915f326e..f09c1acae2 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -2180,6 +2180,9 @@ static int32_t scsi_disk_emulate_command(SCSIRequest *req, uint8_t *buf)
         trace_scsi_disk_emulate_command_WRITE_SAME(
                 req->cmd.buf[0] == WRITE_SAME_10 ? 10 : 16, r->req.cmd.xfer);
         break;
+    case FORMAT_UNIT:
+        trace_scsi_disk_emulate_command_FORMAT_UNIT(r->req.cmd.xfer);
+        break;
     default:
         trace_scsi_disk_emulate_command_UNKNOWN(buf[0],
                                                 scsi_command_name(buf[0]));
@@ -2586,6 +2589,7 @@ static const SCSIReqOps *const scsi_disk_reqops_dispatch[256] = {
     [VERIFY_10]                       = &scsi_disk_emulate_reqops,
     [VERIFY_12]                       = &scsi_disk_emulate_reqops,
     [VERIFY_16]                       = &scsi_disk_emulate_reqops,
+    [FORMAT_UNIT]                     = &scsi_disk_emulate_reqops,
 
     [READ_6]                          = &scsi_disk_dma_reqops,
     [READ_10]                         = &scsi_disk_dma_reqops,
diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
index 20fb0dc162..03b2640934 100644
--- a/hw/scsi/trace-events
+++ b/hw/scsi/trace-events
@@ -334,6 +334,7 @@ scsi_disk_emulate_command_UNMAP(size_t xfer) "Unmap (len %zd)"
 scsi_disk_emulate_command_VERIFY(int bytchk) "Verify (bytchk %d)"
 scsi_disk_emulate_command_WRITE_SAME(int cmd, size_t xfer) "WRITE SAME %d (len %zd)"
 scsi_disk_emulate_command_UNKNOWN(int cmd, const char *name) "Unknown SCSI command (0x%2.2x=%s)"
+scsi_disk_emulate_command_FORMAT_UNIT(size_t xfer) "Format Unit (len %zu)"
 scsi_disk_dma_command_READ(uint64_t lba, uint32_t len) "Read (sector %" PRId64 ", count %u)"
 scsi_disk_dma_command_WRITE(const char *cmd, uint64_t lba, int len) "Write %s(sector %" PRId64 ", count %u)"
 scsi_disk_new_request(uint32_t lun, uint32_t tag, const char *line) "Command: lun=%d tag=0x%x data=%s"
-- 
2.30.2


