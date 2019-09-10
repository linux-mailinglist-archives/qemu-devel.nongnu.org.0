Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1123EAE824
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 12:31:14 +0200 (CEST)
Received: from localhost ([::1]:37588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7dQW-00063D-FU
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 06:31:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56599)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1i7dJK-0000S8-Hj
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 06:23:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1i7dJI-0001uY-9D
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 06:23:45 -0400
Received: from relay.sw.ru ([185.231.240.75]:60050)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1i7dJB-0001oI-Ed; Tue, 10 Sep 2019 06:23:38 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1i7dJ7-0007it-VG; Tue, 10 Sep 2019 13:23:34 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Date: Tue, 10 Sep 2019 13:23:29 +0300
Message-Id: <20190910102332.20560-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190910102332.20560-1-vsementsov@virtuozzo.com>
References: <20190910102332.20560-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v11 11/14] block/io: refactor
 wait_serialising_requests
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 wencongyang2@huawei.com, xiechanglong.d@gmail.com, qemu-devel@nongnu.org,
 armbru@redhat.com, jsnow@redhat.com, stefanha@redhat.com, den@openvz.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split out do_wait_serialising_requests with additional possibility to
not actually wait but just check, that there is something to wait for.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/io.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/block/io.c b/block/io.c
index 0fa10831ed..e909736349 100644
--- a/block/io.c
+++ b/block/io.c
@@ -786,12 +786,13 @@ void bdrv_dec_in_flight(BlockDriverState *bs)
     bdrv_wakeup(bs);
 }
 
-static bool coroutine_fn wait_serialising_requests(BdrvTrackedRequest *self)
+static bool coroutine_fn do_wait_serialising_requests(BdrvTrackedRequest *self,
+                                                      bool wait)
 {
     BlockDriverState *bs = self->bs;
     BdrvTrackedRequest *req;
     bool retry;
-    bool waited = false;
+    bool found = false;
 
     if (!atomic_read(&bs->serialising_in_flight)) {
         return false;
@@ -817,11 +818,13 @@ static bool coroutine_fn wait_serialising_requests(BdrvTrackedRequest *self)
                  * will wait for us as soon as it wakes up, then just go on
                  * (instead of producing a deadlock in the former case). */
                 if (!req->waiting_for) {
-                    self->waiting_for = req;
-                    qemu_co_queue_wait(&req->wait_queue, &bs->reqs_lock);
-                    self->waiting_for = NULL;
-                    retry = true;
-                    waited = true;
+                    found = true;
+                    if (wait) {
+                        self->waiting_for = req;
+                        qemu_co_queue_wait(&req->wait_queue, &bs->reqs_lock);
+                        self->waiting_for = NULL;
+                        retry = true;
+                    }
                     break;
                 }
             }
@@ -829,7 +832,12 @@ static bool coroutine_fn wait_serialising_requests(BdrvTrackedRequest *self)
         qemu_co_mutex_unlock(&bs->reqs_lock);
     } while (retry);
 
-    return waited;
+    return found;
+}
+
+static bool coroutine_fn wait_serialising_requests(BdrvTrackedRequest *self)
+{
+    return do_wait_serialising_requests(self, true);
 }
 
 static int bdrv_check_byte_request(BlockDriverState *bs, int64_t offset,
-- 
2.18.0


