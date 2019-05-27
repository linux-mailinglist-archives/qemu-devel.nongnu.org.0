Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5A12B5CC
	for <lists+qemu-devel@lfdr.de>; Mon, 27 May 2019 14:54:29 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45503 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVF92-0004av-7U
	for lists+qemu-devel@lfdr.de; Mon, 27 May 2019 08:54:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrey.shinkevich@virtuozzo.com>) id 1hVF6q-0003aI-Le
	for qemu-devel@nongnu.org; Mon, 27 May 2019 08:52:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrey.shinkevich@virtuozzo.com>) id 1hVF6p-0002d1-Oq
	for qemu-devel@nongnu.org; Mon, 27 May 2019 08:52:12 -0400
Received: from relay.sw.ru ([185.231.240.75]:38456)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
	id 1hVF6o-0002bL-Kq; Mon, 27 May 2019 08:52:11 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <andrey.shinkevich@virtuozzo.com>)
	id 1hVF6h-0002Co-I6; Mon, 27 May 2019 15:52:03 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Mon, 27 May 2019 15:52:01 +0300
Message-Id: <1558961521-131620-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH] qcow2-bitmap: initialize bitmap directory
 alignment
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
Cc: kwolf@redhat.com, den@openvz.org, vsementsov@virtuozzo.com,
	andrey.shinkevich@virtuozzo.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Valgrind detects multiple issues in QEMU iotests when the memory is
used without being initialized. Valgrind may dump lots of unnecessary
reports what makes the memory issue analysis harder. Particularly,
that is true for the aligned bitmap directory and can be seen while
running the iotest #169. Padding the aligned space with zeros eases
the pain.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 block/qcow2-bitmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index 8a75366..4941764 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -754,7 +754,7 @@ static int bitmap_list_store(BlockDriverState *bs, Qcow2BitmapList *bm_list,
         dir_offset = *offset;
     }
 
-    dir = g_try_malloc(dir_size);
+    dir = g_try_malloc0(dir_size);
     if (dir == NULL) {
         return -ENOMEM;
     }
-- 
1.8.3.1


