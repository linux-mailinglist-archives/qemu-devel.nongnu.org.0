Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 656E0209F5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 May 2019 16:41:42 +0200 (CEST)
Received: from localhost ([127.0.0.1]:59254 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRHZl-0005ZK-Hs
	for lists+qemu-devel@lfdr.de; Thu, 16 May 2019 10:41:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anton.nefedov@virtuozzo.com>) id 1hRHRs-00080E-Jr
	for qemu-devel@nongnu.org; Thu, 16 May 2019 10:33:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anton.nefedov@virtuozzo.com>) id 1hRHRr-0004K1-F6
	for qemu-devel@nongnu.org; Thu, 16 May 2019 10:33:32 -0400
Received: from relay.sw.ru ([185.231.240.75]:39684)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <anton.nefedov@virtuozzo.com>)
	id 1hRHRn-0004Dy-BV; Thu, 16 May 2019 10:33:27 -0400
Received: from [172.16.25.154] (helo=xantnef-ws.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <anton.nefedov@virtuozzo.com>)
	id 1hRHRl-0007Lk-SG; Thu, 16 May 2019 17:33:25 +0300
From: Anton Nefedov <anton.nefedov@virtuozzo.com>
To: qemu-block@nongnu.org
Date: Thu, 16 May 2019 17:33:10 +0300
Message-Id: <20190516143314.81302-6-anton.nefedov@virtuozzo.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190516143314.81302-1-anton.nefedov@virtuozzo.com>
References: <20190516143314.81302-1-anton.nefedov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v8 5/9] scsi: store unmap offset and nb_sectors
 in request struct
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

it allows to report it in the error handler

Signed-off-by: Anton Nefedov <anton.nefedov@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 hw/scsi/scsi-disk.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index e7e865ab3b..b43254103c 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -1602,8 +1602,6 @@ static void scsi_unmap_complete_noio(UnmapCBData *data, int ret)
 {
     SCSIDiskReq *r = data->r;
     SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, r->req.dev);
-    uint64_t sector_num;
-    uint32_t nb_sectors;
 
     assert(r->req.aiocb == NULL);
     if (scsi_disk_req_check_error(r, ret, false)) {
@@ -1611,16 +1609,16 @@ static void scsi_unmap_complete_noio(UnmapCBData *data, int ret)
     }
 
     if (data->count > 0) {
-        sector_num = ldq_be_p(&data->inbuf[0]);
-        nb_sectors = ldl_be_p(&data->inbuf[8]) & 0xffffffffULL;
-        if (!check_lba_range(s, sector_num, nb_sectors)) {
+        r->sector = ldq_be_p(&data->inbuf[0]);
+        r->sector_count = ldl_be_p(&data->inbuf[8]) & 0xffffffffULL;
+        if (!check_lba_range(s, r->sector, r->sector_count)) {
             scsi_check_condition(r, SENSE_CODE(LBA_OUT_OF_RANGE));
             goto done;
         }
 
         r->req.aiocb = blk_aio_pdiscard(s->qdev.conf.blk,
-                                        sector_num * s->qdev.blocksize,
-                                        nb_sectors * s->qdev.blocksize,
+                                        r->sector * s->qdev.blocksize,
+                                        r->sector_count * s->qdev.blocksize,
                                         scsi_unmap_complete, data);
         data->count--;
         data->inbuf += 16;
-- 
2.17.1


