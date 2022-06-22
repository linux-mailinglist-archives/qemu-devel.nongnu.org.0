Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9A55545A1
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 13:11:57 +0200 (CEST)
Received: from localhost ([::1]:53280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3yH6-0000Oq-5G
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 07:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3y03-0005Pe-VH; Wed, 22 Jun 2022 06:54:19 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:37916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3y01-0005VI-B8; Wed, 22 Jun 2022 06:54:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=McmL4ezjk5q8bNEj7Y+7OTinT8/N2LxnDXtwxpHnSWc=; b=dO5qaekcoG1Nxk6fE9DHoPEt3h
 fmw/8ScSxWRnSXIMs/umOPFqJY51uiSWHoHbCYE/cGQiLcCbiX8T2IqNQKQ5rGJ5lYvUfgBMOzq+Y
 VbIK9LNAer6sOchKcvZwqK5pltsprPho0bgF3aHDxl39UPq7L6bVnUD8BQTl8gLcnOG17Q9HAP6a2
 w/64qZSyfBaQSUIRiglUrIdJpSYydU1iiiD8Q/B2lvVJqpGhJ9ryRo2wiKfg7iWaje1VeMD4L9Lbk
 kwVmHucUw7+RXmt2C3QvAmbSKrZW9oQHip50kPxxnp5WACRExaic2W8LLpgcSPBL1Z3xZKSopJWi9
 tokeMe6BQNQuX2e9oFc1yuIskJ9OGe9jarzUzVf8M1dbiTVQc0NfhjMVlvMJGvg0QJ9Eh+Wk5it7X
 iRDDp0DP0ZxDDlB7Yqx2V4M0t0S2sC0Vp9fzqN5itZVDeYfAAg1WL8gRTY4qUJhYeSPNQhTRBxVhB
 qbLRBXitj3iqEnxwHzKxOvIdV03ipwdBJjvPAUZw9N/QY5lvAQVUHZ6CstrbbVzGpDkoVEqRTBsaY
 6fCAXhIu5sCbjcnuQ0XxVTuuqmn4tWMgGCvpQbURn8tY4OSRT+tbZZ+CSDsAozcdnHweNiWjogRdB
 wgYKpZmWMYztaEIw90KTSNSw0XJX9xjXrvDEEqcTo=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3xyp-000CTX-Lm; Wed, 22 Jun 2022 11:53:04 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com, laurent@vivier.eu, fam@euphon.net,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Date: Wed, 22 Jun 2022 11:53:12 +0100
Message-Id: <20220622105314.802852-13-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220622105314.802852-1-mark.cave-ayland@ilande.co.uk>
References: <20220622105314.802852-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 12/14] scsi-disk: allow MODE SELECT block descriptor to set
 the block size
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

The MODE SELECT command can contain an optional block descriptor that can be used
to set the device block size. If the block descriptor is present then update the
block size on the SCSI device accordingly.

This allows CDROMs to be used with A/UX which requires a CDROM drive which is
capable of switching from a 2048 byte sector size to a 512 byte sector size.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/scsi/scsi-disk.c  | 6 ++++++
 hw/scsi/trace-events | 1 +
 2 files changed, 7 insertions(+)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 3659583e13..9c8bad0283 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -1616,6 +1616,12 @@ static void scsi_disk_emulate_mode_select(SCSIDiskReq *r, uint8_t *inbuf)
         goto invalid_param;
     }
 
+    /* Allow changing the block size */
+    if (bd_len && p[6] != (s->qdev.blocksize >> 8)) {
+        s->qdev.blocksize = p[6] << 8;
+        trace_scsi_disk_mode_select_set_blocksize(s->qdev.blocksize);
+    }
+
     len -= bd_len;
     p += bd_len;
 
diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
index 8e927ff62d..ab238293f0 100644
--- a/hw/scsi/trace-events
+++ b/hw/scsi/trace-events
@@ -340,6 +340,7 @@ scsi_disk_dma_command_WRITE(const char *cmd, uint64_t lba, int len) "Write %s(se
 scsi_disk_new_request(uint32_t lun, uint32_t tag, const char *line) "Command: lun=%d tag=0x%x data=%s"
 scsi_disk_aio_sgio_command(uint32_t tag, uint8_t cmd, uint64_t lba, int len, uint32_t timeout) "disk aio sgio: tag=0x%x cmd=0x%x (sector %" PRId64 ", count %d) timeout=%u"
 scsi_disk_mode_select_page_truncated(int page, int len, int page_len) "page %d expected length %d but received length %d"
+scsi_disk_mode_select_set_blocksize(int blocksize) "set block size to %d"
 
 # scsi-generic.c
 scsi_generic_command_complete_noio(void *req, uint32_t tag, int statuc) "Command complete %p tag=0x%x status=%d"
-- 
2.30.2


