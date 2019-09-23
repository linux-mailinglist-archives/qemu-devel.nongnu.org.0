Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73193BB39B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 14:23:17 +0200 (CEST)
Received: from localhost ([::1]:55850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCNN5-0001Bb-IA
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 08:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48170)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <anton.nefedov@virtuozzo.com>) id 1iCNIF-0006tf-SG
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 08:18:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <anton.nefedov@virtuozzo.com>) id 1iCNID-0001nb-DN
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 08:18:15 -0400
Received: from relay.sw.ru ([185.231.240.75]:59148)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <anton.nefedov@virtuozzo.com>)
 id 1iCNI7-0001hr-EX; Mon, 23 Sep 2019 08:18:07 -0400
Received: from [172.16.25.154] (helo=xantnef-ws.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <anton.nefedov@virtuozzo.com>)
 id 1iCNI5-0007xx-0t; Mon, 23 Sep 2019 15:18:05 +0300
From: Anton Nefedov <anton.nefedov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v10 6/9] scsi: move unmap error checking to the complete
 callback
Date: Mon, 23 Sep 2019 15:17:34 +0300
Message-Id: <20190923121737.83281-7-anton.nefedov@virtuozzo.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190923121737.83281-1-anton.nefedov@virtuozzo.com>
References: <20190923121737.83281-1-anton.nefedov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
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

This will help to account the operation in the following commit.

The difference is that we don't call scsi_disk_req_check_error() before
the 1st discard iteration anymore. That function also checks if
the request is cancelled, however it shouldn't get canceled until it
yields in blk_aio() functions anyway.
Same approach is already used for emulate_write_same.

Signed-off-by: Anton Nefedov <anton.nefedov@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 hw/scsi/scsi-disk.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index b3dd21800d..a002fdabe8 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -1610,9 +1610,6 @@ static void scsi_unmap_complete_noio(UnmapCBData *data, int ret)
     SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, r->req.dev);
 
     assert(r->req.aiocb == NULL);
-    if (scsi_disk_req_check_error(r, ret, false)) {
-        goto done;
-    }
 
     if (data->count > 0) {
         r->sector = ldq_be_p(&data->inbuf[0])
@@ -1650,7 +1647,12 @@ static void scsi_unmap_complete(void *opaque, int ret)
     r->req.aiocb = NULL;
 
     aio_context_acquire(blk_get_aio_context(s->qdev.conf.blk));
-    scsi_unmap_complete_noio(data, ret);
+    if (scsi_disk_req_check_error(r, ret, false)) {
+        scsi_req_unref(&r->req);
+        g_free(data);
+    } else {
+        scsi_unmap_complete_noio(data, ret);
+    }
     aio_context_release(blk_get_aio_context(s->qdev.conf.blk));
 }
 
-- 
2.17.1


