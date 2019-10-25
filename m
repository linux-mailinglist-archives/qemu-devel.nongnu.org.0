Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4000AE477F
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 11:39:28 +0200 (CEST)
Received: from localhost ([::1]:58056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNw47-0007Ce-03
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 05:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58357)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <baiyaowei@cmss.chinamobile.com>) id 1iNw1D-0004tk-AJ
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 05:36:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <baiyaowei@cmss.chinamobile.com>) id 1iNw1B-0006oi-Sc
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 05:36:27 -0400
Received: from cmccmta1.chinamobile.com ([221.176.66.79]:2084)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <baiyaowei@cmss.chinamobile.com>)
 id 1iNw17-0006m1-Dp; Fri, 25 Oct 2019 05:36:22 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.11]) by
 rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee35db2c1eec07-5ff1e;
 Fri, 25 Oct 2019 17:35:42 +0800 (CST)
X-RM-TRANSID: 2ee35db2c1eec07-5ff1e
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.novalocal (unknown[112.25.65.41])
 by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee65db2c1ea9b0-be8ce;
 Fri, 25 Oct 2019 17:35:42 +0800 (CST)
X-RM-TRANSID: 2ee65db2c1ea9b0-be8ce
From: Yaowei Bai <baiyaowei@cmss.chinamobile.com>
To: pbonzini@redhat.com, fam@euphon.net, dillaman@redhat.com, kwolf@redhat.com,
 mreitz@redhat.com
Subject: [PATCH 4/4] scsi-disk: add FUA support for COMPARE_AND_WRITE
Date: Fri, 25 Oct 2019 17:36:02 +0800
Message-Id: <1571996163-27688-5-git-send-email-baiyaowei@cmss.chinamobile.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1571996163-27688-1-git-send-email-baiyaowei@cmss.chinamobile.com>
References: <1571996163-27688-1-git-send-email-baiyaowei@cmss.chinamobile.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 221.176.66.79
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
Cc: baiyaowei@cmss.chinamobile.com, yangjun@cmss.chinamobile.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is implemented in the blk_aio_pwritev's callback function in a way
similar to its emulation in scsi_write_do_fua function

Signed-off-by: Yaowei Bai <baiyaowei@cmss.chinamobile.com>
---
 hw/scsi/scsi-disk.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 4bff862..ef9c257 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -228,6 +228,7 @@ static bool scsi_is_cmd_fua(SCSICommand *cmd)
     case WRITE_10:
     case WRITE_12:
     case WRITE_16:
+    case COMPARE_AND_WRITE:
         return (cmd->buf[1] & 8) != 0;
 
     case VERIFY_10:
@@ -1849,10 +1850,17 @@ static void scsi_compare_and_write_complete(void *opaque, int ret)
     }
 
     block_acct_done(blk_get_stats(s->qdev.conf.blk), &r->acct);
+    if (r->need_fua_emulation) {
+        block_acct_start(blk_get_stats(s->qdev.conf.blk), &r->acct, 0,
+                         BLOCK_ACCT_FLUSH);
+        r->req.aiocb = blk_aio_flush(s->qdev.conf.blk, scsi_aio_complete, r);
+        goto free;
+    }
     scsi_req_complete(&r->req, GOOD);
 
 done:
     scsi_req_unref(&r->req);
+free:
     qemu_vfree(data->iov.iov_base);
     g_free(data);
     aio_context_release(blk_get_aio_context(s->qdev.conf.blk));
@@ -1953,6 +1961,7 @@ static int32_t scsi_disk_emulate_command(SCSIRequest *req, uint8_t *buf)
 {
     SCSIDiskReq *r = DO_UPCAST(SCSIDiskReq, req, req);
     SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, req->dev);
+    SCSIDiskClass *sdc = (SCSIDiskClass *) object_get_class(OBJECT(s));
     uint64_t nb_sectors;
     uint8_t *outbuf;
     int buflen;
@@ -2208,6 +2217,7 @@ static int32_t scsi_disk_emulate_command(SCSIRequest *req, uint8_t *buf)
         return 0;
     }
     assert(!r->req.aiocb);
+    r->need_fua_emulation = sdc->need_fua_emulation(&r->req.cmd);
     r->iov.iov_len = MIN(r->buflen, req->cmd.xfer);
     if (r->iov.iov_len == 0) {
         scsi_req_complete(&r->req, GOOD);
-- 
1.8.3.1




