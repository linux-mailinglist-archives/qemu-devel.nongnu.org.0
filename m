Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A05F710B689
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Nov 2019 20:15:57 +0100 (CET)
Received: from localhost ([::1]:42080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ia2n6-0007mp-Dq
	for lists+qemu-devel@lfdr.de; Wed, 27 Nov 2019 14:15:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60683)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ia2lA-0007L2-Jn
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 14:13:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ia2l8-00023b-TG
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 14:13:55 -0500
Received: from relay.sw.ru ([185.231.240.75]:53078)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ia2gA-0005fi-Ht; Wed, 27 Nov 2019 14:08:46 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1ia2g6-0003cF-4S; Wed, 27 Nov 2019 22:08:42 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6] nbd: well form nbd_iter_channel_error errp handler
Date: Wed, 27 Nov 2019 22:08:40 +0300
Message-Id: <20191127190840.15773-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make nbd_iter_channel_error errp handler well formed:
rename local_err to errp_in, as it is IN-parameter here (which is
unusual for Error**).

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---

v6: fix commit message
    add Eric's r-b

 block/nbd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 5f18f78a94..345bf902e3 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -864,18 +864,18 @@ typedef struct NBDReplyChunkIter {
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


