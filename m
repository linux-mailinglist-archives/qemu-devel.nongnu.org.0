Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD4453793B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 12:42:55 +0200 (CEST)
Received: from localhost ([::1]:48438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvcrO-0005c8-7f
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 06:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1nvcol-0003xw-9B; Mon, 30 May 2022 06:40:11 -0400
Received: from relay.virtuozzo.com ([130.117.225.111]:55740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1nvcoh-0006ek-PK; Mon, 30 May 2022 06:40:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=J7hbg+nqsR8Xgy+DeBq8e3GARkQv1TPFrxkv+/Vn5YI=; b=HRHTJbxIXDmy
 S2INLt/haMiT9NdEXA+41VItS9A4H9jjDXrtwlgrbISUHfEn4nMksexVqDAndICVrqQMXltb2fgAB
 uOufloSer08/nL9SGn2kCixGVIq9YtGavmHsuze33f0GLp7v2cmNuZYjBSyK8ViQJSRNromjurVsV
 dkKg0=;
Received: from [192.168.16.212] (helo=iris.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.94.2)
 (envelope-from <den@openvz.org>)
 id 1nvcmZ-000aVO-PP; Mon, 30 May 2022 12:39:12 +0200
From: "Denis V. Lunev" <den@openvz.org>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Cc: "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 1/1] nbd: trace long NBD operations
Date: Mon, 30 May 2022 12:39:29 +0200
Message-Id: <20220530103929.629328-1-den@openvz.org>
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
 block/nbd.c             | 6 +++++-
 block/trace-events      | 2 ++
 nbd/client-connection.c | 2 ++
 nbd/trace-events        | 3 +++
 4 files changed, 12 insertions(+), 1 deletion(-)

Changes from v1:
- %d -> %u for in_flights
- renamed open trace-point + fixed timeout type
- moved trace_nbd_reconnect_attempt_result above

diff --git a/block/nbd.c b/block/nbd.c
index 512a53bf73..19e773d602 100644
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
@@ -401,7 +404,8 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
     }
 
     qemu_mutex_unlock(&s->requests_lock);
-    nbd_co_do_establish_connection(s->bs, blocking, NULL);
+    ret = nbd_co_do_establish_connection(s->bs, blocking, NULL);
+    trace_nbd_reconnect_attempt_result(ret, s->bs->in_flight);
     qemu_mutex_lock(&s->requests_lock);
 
     /*
diff --git a/block/trace-events b/block/trace-events
index 549090d453..48dbf10c66 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -172,6 +172,8 @@ nbd_read_reply_entry_fail(int ret, const char *err) "ret = %d, err: %s"
 nbd_co_request_fail(uint64_t from, uint32_t len, uint64_t handle, uint16_t flags, uint16_t type, const char *name, int ret, const char *err) "Request failed { .from = %" PRIu64", .len = %" PRIu32 ", .handle = %" PRIu64 ", .flags = 0x%" PRIx16 ", .type = %" PRIu16 " (%s) } ret = %d, err: %s"
 nbd_client_handshake(const char *export_name) "export '%s'"
 nbd_client_handshake_success(const char *export_name) "export '%s'"
+nbd_reconnect_attempt(unsigned in_flight) "in_flight %u"
+nbd_reconnect_attempt_result(int ret, unsigned in_flight) "ret %d in_flight %u"
 
 # ssh.c
 ssh_restart_coroutine(void *co) "co=%p"
diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index 2a632931c3..0c5f917efa 100644
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
+                trace_nbd_connect_thread_sleep(timeout);
                 qemu_mutex_unlock(&conn->mutex);
 
                 sleep(timeout);
diff --git a/nbd/trace-events b/nbd/trace-events
index c4919a2dd5..b7032ca277 100644
--- a/nbd/trace-events
+++ b/nbd/trace-events
@@ -73,3 +73,6 @@ nbd_co_receive_request_decode_type(uint64_t handle, uint16_t type, const char *n
 nbd_co_receive_request_payload_received(uint64_t handle, uint32_t len) "Payload received: handle = %" PRIu64 ", len = %" PRIu32
 nbd_co_receive_align_compliance(const char *op, uint64_t from, uint32_t len, uint32_t align) "client sent non-compliant unaligned %s request: from=0x%" PRIx64 ", len=0x%" PRIx32 ", align=0x%" PRIx32
 nbd_trip(void) "Reading request"
+
+# client-connection.c
+nbd_connect_thread_sleep(uint64_t timeout) "timeout %" PRIu64
-- 
2.32.0


