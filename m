Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7F469A91B
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 11:32:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSy25-00029u-GG; Fri, 17 Feb 2023 05:32:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pSy1r-00028a-LE; Fri, 17 Feb 2023 05:31:47 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pSy1p-0002D2-NA; Fri, 17 Feb 2023 05:31:47 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 20E8C47762;
 Fri, 17 Feb 2023 11:31:39 +0100 (CET)
From: Fiona Ebner <f.ebner@proxmox.com>
To: qemu-devel@nongnu.org
Cc: jsnow@redhat.com,
	qemu-block@nongnu.org
Subject: [PATCH] hw/ide/ahci: trace ncq write command as write instead of read
Date: Fri, 17 Feb 2023 11:31:30 +0100
Message-Id: <20230217103130.42077-1-f.ebner@proxmox.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fixes: e4baa9f00b ("AHCI: Replace DPRINTF with trace-events")
Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
---

Or should it be sorted alphabetically below execute_ncq_command_unsup?
I felt read and write belong close together and this reflects the
positions in the code.

 hw/ide/ahci.c       | 4 ++--
 hw/ide/trace-events | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 7ce001cacd..595a96203f 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1085,8 +1085,8 @@ static void execute_ncq_command(NCQTransferState *ncq_tfs)
                                       ncq_cb, ncq_tfs);
         break;
     case WRITE_FPDMA_QUEUED:
-        trace_execute_ncq_command_read(ad->hba, port, ncq_tfs->tag,
-                                       ncq_tfs->sector_count, ncq_tfs->lba);
+        trace_execute_ncq_command_write(ad->hba, port, ncq_tfs->tag,
+                                        ncq_tfs->sector_count, ncq_tfs->lba);
         dma_acct_start(ide_state->blk, &ncq_tfs->acct,
                        &ncq_tfs->sglist, BLOCK_ACCT_WRITE);
         ncq_tfs->aiocb = dma_blk_write(ide_state->blk, &ncq_tfs->sglist,
diff --git a/hw/ide/trace-events b/hw/ide/trace-events
index 15d7921f15..5ef344ae73 100644
--- a/hw/ide/trace-events
+++ b/hw/ide/trace-events
@@ -91,6 +91,7 @@ ahci_populate_sglist_short_map(void *s, int port) "ahci(%p)[%d]: mapped less tha
 ahci_populate_sglist_bad_offset(void *s, int port, int off_idx, int64_t off_pos) "ahci(%p)[%d]: Incorrect offset! off_idx: %d, off_pos: %"PRId64
 ncq_finish(void *s, int port, uint8_t tag) "ahci(%p)[%d][tag:%d]: NCQ transfer finished"
 execute_ncq_command_read(void *s, int port, uint8_t tag, int count, int64_t lba) "ahci(%p)[%d][tag:%d]: NCQ reading %d sectors from LBA %"PRId64
+execute_ncq_command_write(void *s, int port, uint8_t tag, int count, int64_t lba) "ahci(%p)[%d][tag:%d]: NCQ writing %d sectors to LBA %"PRId64
 execute_ncq_command_unsup(void *s, int port, uint8_t tag, uint8_t cmd) "ahci(%p)[%d][tag:%d]: error: unsupported NCQ command (0x%02x) received"
 process_ncq_command_mismatch(void *s, int port, uint8_t tag, uint8_t slot) "ahci(%p)[%d][tag:%d]: Warning: NCQ slot (%d) did not match the given tag"
 process_ncq_command_aux(void *s, int port, uint8_t tag) "ahci(%p)[%d][tag:%d]: Warn: Attempt to use NCQ auxiliary fields"
-- 
2.30.2



