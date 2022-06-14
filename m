Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B28CB54AEA5
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 12:43:02 +0200 (CEST)
Received: from localhost ([::1]:39304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o140i-0003Si-1d
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 06:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o13o2-0001NW-0v; Tue, 14 Jun 2022 06:29:54 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:52080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o13nk-0000l8-G0; Tue, 14 Jun 2022 06:29:53 -0400
Received: from sas1-3cba3404b018.qloud-c.yandex.net
 (sas1-3cba3404b018.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd26:0:640:3cba:3404])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 7714E2E0F6E;
 Tue, 14 Jun 2022 13:29:28 +0300 (MSK)
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net [2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by sas1-3cba3404b018.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 dyF29OQL9a-TRM8cbrp; Tue, 14 Jun 2022 13:29:28 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1655202568; bh=UXeoFw76J/GSlcqWEH/nKd2lGyIpRcTmVJjdSqhK+oI=;
 h=Message-Id:References:Date:Subject:In-Reply-To:Cc:To:From;
 b=LwqIU4Sg50cBYzep/Y4RQm323uVtJn5qpt1OaqaVArkXAOZrkSwMafDnNJ5hMNfJM
 dUGPXBPVBm1fvn/fLGI2Jg67eqnpX4CoaJvuOCWMy2q4xd/MhwAfqtmXFde5pTN7Xi
 Kr0d5wCY28cGs8CCG6ElYYCe8+Rb1JEpIPOIlj+Y=
Authentication-Results: sas1-3cba3404b018.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:a427::1:2e])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 15x97ivcvu-TRMmsLkt; Tue, 14 Jun 2022 13:29:27 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@yandex-team.ru, peter.maydell@linaro.org,
 "Denis V. Lunev" <den@openvz.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 08/10] nbd: trace long NBD operations
Date: Tue, 14 Jun 2022 13:29:08 +0300
Message-Id: <20220614102910.1431380-9-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614102910.1431380-1-vsementsov@yandex-team.ru>
References: <20220614102910.1431380-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: "Denis V. Lunev" <den@openvz.org>

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
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block/nbd.c             | 6 +++++-
 block/trace-events      | 2 ++
 nbd/client-connection.c | 2 ++
 nbd/trace-events        | 3 +++
 4 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/block/nbd.c b/block/nbd.c
index 6085ab1d2c..bc8f128087 100644
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
2.25.1


