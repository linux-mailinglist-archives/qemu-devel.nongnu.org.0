Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C042FD4515
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 18:10:26 +0200 (CEST)
Received: from localhost ([::1]:53416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIxUn-0002ie-Fn
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 12:10:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35921)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iIxQW-0005Zn-Rz
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 12:06:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iIxQV-00042O-Sj
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 12:06:00 -0400
Received: from relay.sw.ru ([185.231.240.75]:47806)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iIxQV-000419-L2; Fri, 11 Oct 2019 12:05:59 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iIxQU-0003XG-5T; Fri, 11 Oct 2019 19:05:58 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 007/126] nbd: well form nbd_iter_channel_error errp handler
Date: Fri, 11 Oct 2019 19:03:53 +0300
Message-Id: <20191011160552.22907-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191011160552.22907-1-vsementsov@virtuozzo.com>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, armbru@redhat.com, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make nbd_iter_channel_error errp handler well formed:
rename errp to errp_in, as it is IN-parameter here (which is unusual
for errp).

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 813c40d8f0..c66fdf54b9 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -684,18 +684,18 @@ typedef struct NBDReplyChunkIter {
 } NBDReplyChunkIter;
 
 static void nbd_iter_channel_error(NBDReplyChunkIter *iter,
-                                   int ret, Error **local_err)
+                                   int ret, Error **errp_in)
 {
-    assert(ret < 0);
+    assert(ret < 0 && errp_in && *errp_in);
 
     if (!iter->ret) {
         iter->ret = ret;
-        error_propagate(&iter->err, *local_err);
+        error_propagate(&iter->err, *errp_in);
     } else {
-        error_free(*local_err);
+        error_free(*errp_in);
     }
 
-    *local_err = NULL;
+    *errp_in = NULL;
 }
 
 static void nbd_iter_request_error(NBDReplyChunkIter *iter, int ret)
-- 
2.21.0


