Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B4EABD76
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Sep 2019 18:15:38 +0200 (CEST)
Received: from localhost ([::1]:58168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i6Gtd-0007pE-U5
	for lists+qemu-devel@lfdr.de; Fri, 06 Sep 2019 12:15:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51483)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <anton.nefedov@virtuozzo.com>) id 1i6GgJ-0002SW-A7
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 12:01:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <anton.nefedov@virtuozzo.com>) id 1i6GgH-0005AX-Qy
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 12:01:50 -0400
Received: from relay.sw.ru ([185.231.240.75]:37916)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <anton.nefedov@virtuozzo.com>)
 id 1i6GgE-00054c-Qa; Fri, 06 Sep 2019 12:01:47 -0400
Received: from [172.16.25.154] (helo=xantnef-ws.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <anton.nefedov@virtuozzo.com>)
 id 1i6GgD-0005vz-Hp; Fri, 06 Sep 2019 19:01:45 +0300
From: Anton Nefedov <anton.nefedov@virtuozzo.com>
To: qemu-block@nongnu.org
Date: Fri,  6 Sep 2019 19:01:18 +0300
Message-Id: <20190906160120.70239-8-anton.nefedov@virtuozzo.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190906160120.70239-1-anton.nefedov@virtuozzo.com>
References: <20190906160120.70239-1-anton.nefedov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v9 7/9] scsi: account unmap operations
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 den@virtuozzo.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 Anton Nefedov <anton.nefedov@virtuozzo.com>, pbonzini@redhat.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Anton Nefedov <anton.nefedov@virtuozzo.com>
---
 hw/scsi/scsi-disk.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index a002fdabe8..68b1675fd9 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -1617,10 +1617,16 @@ static void scsi_unmap_complete_noio(UnmapCBData *data, int ret)
         r->sector_count = (ldl_be_p(&data->inbuf[8]) & 0xffffffffULL)
             * (s->qdev.blocksize / BDRV_SECTOR_SIZE);
         if (!check_lba_range(s, r->sector, r->sector_count)) {
+            block_acct_invalid(blk_get_stats(s->qdev.conf.blk),
+                               BLOCK_ACCT_UNMAP);
             scsi_check_condition(r, SENSE_CODE(LBA_OUT_OF_RANGE));
             goto done;
         }
 
+        block_acct_start(blk_get_stats(s->qdev.conf.blk), &r->acct,
+                         r->sector_count * BDRV_SECTOR_SIZE,
+                         BLOCK_ACCT_UNMAP);
+
         r->req.aiocb = blk_aio_pdiscard(s->qdev.conf.blk,
                                         r->sector * BDRV_SECTOR_SIZE,
                                         r->sector_count * BDRV_SECTOR_SIZE,
@@ -1647,10 +1653,11 @@ static void scsi_unmap_complete(void *opaque, int ret)
     r->req.aiocb = NULL;
 
     aio_context_acquire(blk_get_aio_context(s->qdev.conf.blk));
-    if (scsi_disk_req_check_error(r, ret, false)) {
+    if (scsi_disk_req_check_error(r, ret, true)) {
         scsi_req_unref(&r->req);
         g_free(data);
     } else {
+        block_acct_done(blk_get_stats(s->qdev.conf.blk), &r->acct);
         scsi_unmap_complete_noio(data, ret);
     }
     aio_context_release(blk_get_aio_context(s->qdev.conf.blk));
@@ -1682,6 +1689,7 @@ static void scsi_disk_emulate_unmap(SCSIDiskReq *r, uint8_t *inbuf)
     }
 
     if (blk_is_read_only(s->qdev.conf.blk)) {
+        block_acct_invalid(blk_get_stats(s->qdev.conf.blk), BLOCK_ACCT_UNMAP);
         scsi_check_condition(r, SENSE_CODE(WRITE_PROTECTED));
         return;
     }
@@ -1697,10 +1705,12 @@ static void scsi_disk_emulate_unmap(SCSIDiskReq *r, uint8_t *inbuf)
     return;
 
 invalid_param_len:
+    block_acct_invalid(blk_get_stats(s->qdev.conf.blk), BLOCK_ACCT_UNMAP);
     scsi_check_condition(r, SENSE_CODE(INVALID_PARAM_LEN));
     return;
 
 invalid_field:
+    block_acct_invalid(blk_get_stats(s->qdev.conf.blk), BLOCK_ACCT_UNMAP);
     scsi_check_condition(r, SENSE_CODE(INVALID_FIELD));
 }
 
-- 
2.17.1


