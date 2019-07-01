Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E560F209DA
	for <lists+qemu-devel@lfdr.de>; Thu, 16 May 2019 16:36:50 +0200 (CEST)
Received: from localhost ([127.0.0.1]:59165 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRHV4-0001LD-3V
	for lists+qemu-devel@lfdr.de; Thu, 16 May 2019 10:36:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55324)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anton.nefedov@virtuozzo.com>) id 1hRHRs-000806-HH
	for qemu-devel@nongnu.org; Thu, 16 May 2019 10:33:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anton.nefedov@virtuozzo.com>) id 1hRHRr-0004KH-H6
	for qemu-devel@nongnu.org; Thu, 16 May 2019 10:33:32 -0400
Received: from relay.sw.ru ([185.231.240.75]:39674)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <anton.nefedov@virtuozzo.com>)
	id 1hRHRm-0004DZ-VL; Thu, 16 May 2019 10:33:27 -0400
Received: from [172.16.25.154] (helo=xantnef-ws.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <anton.nefedov@virtuozzo.com>)
	id 1hRHRl-0007Lk-M2; Thu, 16 May 2019 17:33:25 +0300
From: Anton Nefedov <anton.nefedov@virtuozzo.com>
To: qemu-block@nongnu.org
Date: Thu, 16 May 2019 17:33:09 +0300
Message-Id: <20190516143314.81302-5-anton.nefedov@virtuozzo.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190516143314.81302-1-anton.nefedov@virtuozzo.com>
References: <20190516143314.81302-1-anton.nefedov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v8 4/9] ide: account UNMAP (TRIM) operations
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
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
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 hw/ide/core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index 6afadf894f..3a7ac93777 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -441,6 +441,14 @@ static void ide_issue_trim_cb(void *opaque, int ret)
     TrimAIOCB *iocb = opaque;
     IDEState *s = iocb->s;
 
+    if (iocb->i >= 0) {
+        if (ret >= 0) {
+            block_acct_done(blk_get_stats(s->blk), &s->acct);
+        } else {
+            block_acct_failed(blk_get_stats(s->blk), &s->acct);
+        }
+    }
+
     if (ret >= 0) {
         while (iocb->j < iocb->qiov->niov) {
             int j = iocb->j;
@@ -458,10 +466,14 @@ static void ide_issue_trim_cb(void *opaque, int ret)
                 }
 
                 if (!ide_sect_range_ok(s, sector, count)) {
+                    block_acct_invalid(blk_get_stats(s->blk), BLOCK_ACCT_UNMAP);
                     iocb->ret = -EINVAL;
                     goto done;
                 }
 
+                block_acct_start(blk_get_stats(s->blk), &s->acct,
+                                 count << BDRV_SECTOR_BITS, BLOCK_ACCT_UNMAP);
+
                 /* Got an entry! Submit and exit.  */
                 iocb->aiocb = blk_aio_pdiscard(s->blk,
                                                sector << BDRV_SECTOR_BITS,
-- 
2.17.1


