Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A97632B502C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 19:50:41 +0100 (CET)
Received: from localhost ([::1]:60932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kejaK-0004NW-MM
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 13:50:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1kejHd-0003Sy-33
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:31:22 -0500
Received: from mx2.suse.de ([195.135.220.15]:34664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>) id 1kejHa-0006BJ-H0
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:31:20 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DC276B06A;
 Mon, 16 Nov 2020 18:31:15 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 3/3] scsi: add tracing for SG_IO commands
Date: Mon, 16 Nov 2020 19:31:14 +0100
Message-Id: <20201116183114.55703-4-hare@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20201116183114.55703-1-hare@suse.de>
References: <20201116183114.55703-1-hare@suse.de>
Received-SPF: pass client-ip=195.135.220.15; envelope-from=hare@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 12:53:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add tracepoints for SG_IO commands to allow for debugging
of SG_IO commands.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 hw/scsi/scsi-disk.c    | 3 ++-
 hw/scsi/scsi-generic.c | 8 +++++++-
 hw/scsi/trace-events   | 4 ++++
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 2959526b52..dd23a38d6a 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -2768,7 +2768,8 @@ static BlockAIOCB *scsi_block_do_sgio(SCSIBlockReq *req,
     io_header->timeout = s->qdev.io_timeout * 1000;
     io_header->usr_ptr = r;
     io_header->flags |= SG_FLAG_DIRECT_IO;
-
+    trace_scsi_disk_aio_sgio_command(r->req.tag, req->cdb[0], lba,
+                                     nb_logical_blocks, io_header->timeout);
     aiocb = blk_aio_ioctl(s->qdev.conf.blk, SG_IO, io_header, cb, opaque);
     assert(aiocb != NULL);
     return aiocb;
diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index e07924b3d7..8687336438 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -128,6 +128,8 @@ static int execute_command(BlockBackend *blk,
     r->io_header.usr_ptr = r;
     r->io_header.flags |= SG_FLAG_DIRECT_IO;
 
+    trace_scsi_generic_aio_sgio_command(r->req.tag, r->req.cmd.buf[0],
+                                        r->io_header.timeout);
     r->req.aiocb = blk_aio_ioctl(blk, SG_IO, &r->io_header, complete, r);
     if (r->req.aiocb == NULL) {
         return -EIO;
@@ -524,8 +526,12 @@ int scsi_SG_IO_FROM_DEV(BlockBackend *blk, uint8_t *cmd, uint8_t cmd_size,
     io_header.sbp = sensebuf;
     io_header.timeout = timeout * 1000;
 
+    trace_scsi_generic_ioctl_sgio_command(cmd[0], io_header.timeout);
     ret = blk_ioctl(blk, SG_IO, &io_header);
-    if (ret < 0 || io_header.driver_status || io_header.host_status) {
+    if (ret < 0 || io_header.status ||
+        io_header.driver_status || io_header.host_status) {
+        trace_scsi_generic_ioctl_sgio_done(cmd[0], ret, io_header.status,
+                                           io_header.host_status);
         return -1;
     }
     return 0;
diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
index 0e0aa9847d..9788661bfd 100644
--- a/hw/scsi/trace-events
+++ b/hw/scsi/trace-events
@@ -331,6 +331,7 @@ scsi_disk_emulate_command_UNKNOWN(int cmd, const char *name) "Unknown SCSI comma
 scsi_disk_dma_command_READ(uint64_t lba, uint32_t len) "Read (sector %" PRId64 ", count %u)"
 scsi_disk_dma_command_WRITE(const char *cmd, uint64_t lba, int len) "Write %s(sector %" PRId64 ", count %u)"
 scsi_disk_new_request(uint32_t lun, uint32_t tag, const char *line) "Command: lun=%d tag=0x%x data=%s"
+scsi_disk_aio_sgio_command(uint32_t tag, uint8_t cmd, uint64_t lba, int len, uint32_t timeout) "disk aio sgio: tag=0x%x cmd=0x%x (sector %" PRId64 ", count %d) timeout=%u"
 
 # scsi-generic.c
 scsi_generic_command_complete_noio(void *req, uint32_t tag, int statuc) "Command complete %p tag=0x%x status=%d"
@@ -342,3 +343,6 @@ scsi_generic_write_data(uint32_t tag) "scsi_write_data tag=0x%x"
 scsi_generic_send_command(const char *line) "Command: data=%s"
 scsi_generic_realize_type(int type) "device type %d"
 scsi_generic_realize_blocksize(int blocksize) "block size %d"
+scsi_generic_aio_sgio_command(uint32_t tag, uint8_t cmd, uint32_t timeout) "generic aio sgio: tag=0x%x cmd=0x%x timeout=%u"
+scsi_generic_ioctl_sgio_command(uint8_t cmd, uint32_t timeout) "generic ioctl sgio: cmd=0x%x timeout=%u"
+scsi_generic_ioctl_sgio_done(uint8_t cmd, int ret, uint8_t status, uint8_t host_status) "generic ioctl sgio: cmd=0x%x ret=%d status=0x%x host_status=0x%x"
-- 
2.16.4


