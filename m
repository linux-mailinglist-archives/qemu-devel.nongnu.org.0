Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 851A0535C30
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 10:56:39 +0200 (CEST)
Received: from localhost ([::1]:34556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuVlu-0001XH-1j
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 04:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1nuVZw-0006b9-VG; Fri, 27 May 2022 04:44:17 -0400
Received: from relay.virtuozzo.com ([130.117.225.111]:48228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1nuVZu-0004IJ-8w; Fri, 27 May 2022 04:44:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=A7AfDvEKOzcXe2wjynEzvJOR+qT0yw5l49hGQv099JQ=; b=wxsmhDk9MWA6
 iqOEA1E9gx7K83lGlCpKeEem7q8fJqXhIQLww/hnDueHzd80k0m8so/U8DmsMIQtsxyT3lrhU4Azr
 tCwyGqfTcetMdytokLjIa+ZfLkyI9gds6BZ5eqQ4f6brYFPPxfBK8vMzKOITlC2R083w0XHFIRBMj
 RF9Yk=;
Received: from [192.168.16.194] (helo=iris.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.94.2)
 (envelope-from <den@openvz.org>)
 id 1nuVY5-000C27-Qj; Fri, 27 May 2022 10:43:38 +0200
From: "Denis V. Lunev" <den@openvz.org>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Cc: "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 1/1] nbd: trace long NBD operations
Date: Fri, 27 May 2022 10:43:48 +0200
Message-Id: <20220527084348.68911-1-den@openvz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=130.117.225.111; envelope-from=den@openvz.org;
 helo=relay.virtuozzo.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At the moment there are 2 sources of lengthy operations if configured:
* open connection, which could retry inside and
* reconnect of already opened connection
These operations could be quite lengthy and cumbersome to catch thus
it would be quite natural to add trace points for them.

This patch is based on the original downstream work made by Vladimir.

Signed-off-by: Denis V. Lunev <den@openvz.org>
CC: Eric Blake <eblake@redhat.com>
CC: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
CC: Kevin Wolf <kwolf@redhat.com>
CC: Hanna Reitz <hreitz@redhat.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
---
 block/nbd.c             | 11 ++++++++---
 block/trace-events      |  2 ++
 nbd/client-connection.c |  2 ++
 nbd/trace-events        |  3 +++
 4 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 6085ab1d2c..f1a473d36b 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -371,6 +371,7 @@ static bool nbd_client_connecting(BDRVNBDState *s)
 /* Called with s->requests_lock taken.  */
 static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 {
+    int ret;
     bool blocking = s->state == NBD_CLIENT_CONNECTING_WAIT;
 
     /*
@@ -380,6 +381,8 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
     assert(nbd_client_connecting(s));
     assert(s->in_flight == 1);
 
+    trace_nbd_reconnect_attempt(s->bs->in_flight);
+
     if (blocking && !s->reconnect_delay_timer) {
         /*
          * It's the first reconnect attempt after switching to
@@ -401,7 +404,7 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
     }
 
     qemu_mutex_unlock(&s->requests_lock);
-    nbd_co_do_establish_connection(s->bs, blocking, NULL);
+    ret = nbd_co_do_establish_connection(s->bs, blocking, NULL);
     qemu_mutex_lock(&s->requests_lock);
 
     /*
@@ -410,6 +413,8 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
      * this I/O request (so draining removes all timers).
      */
     reconnect_delay_timer_del(s);
+
+    trace_nbd_reconnect_attempt_result(ret, s->bs->in_flight);
 }
 
 static coroutine_fn int nbd_receive_replies(BDRVNBDState *s, uint64_t handle)
@@ -1856,8 +1861,8 @@ static int nbd_process_options(BlockDriverState *bs, QDict *options,
         goto error;
     }
 
-    s->reconnect_delay = qemu_opt_get_number(opts, "reconnect-delay", 0);
-    s->open_timeout = qemu_opt_get_number(opts, "open-timeout", 0);
+    s->reconnect_delay = qemu_opt_get_number(opts, "reconnect-delay", 300);
+    s->open_timeout = qemu_opt_get_number(opts, "open-timeout", 300);
 
     ret = 0;
 
diff --git a/block/trace-events b/block/trace-events
index 549090d453..caab699c22 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -172,6 +172,8 @@ nbd_read_reply_entry_fail(int ret, const char *err) "ret = %d, err: %s"
 nbd_co_request_fail(uint64_t from, uint32_t len, uint64_t handle, uint16_t flags, uint16_t type, const char *name, int ret, const char *err) "Request failed { .from = %" PRIu64", .len = %" PRIu32 ", .handle = %" PRIu64 ", .flags = 0x%" PRIx16 ", .type = %" PRIu16 " (%s) } ret = %d, err: %s"
 nbd_client_handshake(const char *export_name) "export '%s'"
 nbd_client_handshake_success(const char *export_name) "export '%s'"
+nbd_reconnect_attempt(int in_flight) "in_flight %d"
+nbd_reconnect_attempt_result(int ret, int in_flight) "ret %d in_flight %d"
 
 # ssh.c
 ssh_restart_coroutine(void *co) "co=%p"
diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index 2a632931c3..a5ee82e804 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "trace.h"
 
 #include "block/nbd.h"
 
@@ -210,6 +211,7 @@ static void *connect_thread_func(void *opaque)
             object_unref(OBJECT(conn->sioc));
             conn->sioc = NULL;
             if (conn->do_retry && !conn->detached) {
+                trace_nbd_connect_iteration(timeout);
                 qemu_mutex_unlock(&conn->mutex);
 
                 sleep(timeout);
diff --git a/nbd/trace-events b/nbd/trace-events
index c4919a2dd5..bdadfdc82d 100644
--- a/nbd/trace-events
+++ b/nbd/trace-events
@@ -73,3 +73,6 @@ nbd_co_receive_request_decode_type(uint64_t handle, uint16_t type, const char *n
 nbd_co_receive_request_payload_received(uint64_t handle, uint32_t len) "Payload received: handle = %" PRIu64 ", len = %" PRIu32
 nbd_co_receive_align_compliance(const char *op, uint64_t from, uint32_t len, uint32_t align) "client sent non-compliant unaligned %s request: from=0x%" PRIx64 ", len=0x%" PRIx32 ", align=0x%" PRIx32
 nbd_trip(void) "Reading request"
+
+# client-connection.c
+nbd_connect_iteration(int in_flight) "timeout %d"
-- 
2.32.0


