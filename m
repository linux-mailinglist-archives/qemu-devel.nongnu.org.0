Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23253501ACA
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 20:07:24 +0200 (CEST)
Received: from localhost ([::1]:57078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf3sJ-0001R0-6E
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 14:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nf3jZ-0004sT-KM
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 13:58:21 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:37552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nf3jW-0005v3-Ao
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 13:58:20 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 m15-20020a7bca4f000000b0038fdc1394b1so2941781wml.2
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 10:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wZty6AQ7KKf23gAmGW0itmYi2QEVi2hNhiDWTR9fWh0=;
 b=Y2qf1oH/NhMNQ+3+bP946o1OBUtqcCXEB9rPKeAS6kWov4cJMClmR03h3SWX2ocM2x
 xRdzU+xIK4jtKQ7gBtgvs+7Mw0jrnco+I7i3ngF3L9f1+2+y3f/kCipCHCZcaiVdUIat
 EtsdlMKoINKRskNC2lblB4YPBIpBoPpiJ9KGEXUW3bX/HEL0/jEka4Ov0cye0mHoxKnH
 QmSuR88ZMg2RA2x8W0LX3248GGr3CRV7Ojgpe6BDDic5NIpO3qpnbbOuFqGP/tu+ym5+
 hJ93AJNzm9J9uyLpiQMrpE3TvzFW7PGIFj6dWOSnh7DGjKeW1UVAWMlLNgZmOXU3NReH
 jJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wZty6AQ7KKf23gAmGW0itmYi2QEVi2hNhiDWTR9fWh0=;
 b=NtrQrpTjOUQv+Jc1uq4GlVWviaKXNFX2/rNayLvT1VWsDSXV6h9yr0vrtZfVOctkT8
 8M8aqSQ56vJkjlWbqF1Nczyoss9O1BseVmDDyirz8/r6mDjSF1SQG64G3Ylj4afBbrHx
 zh4cWjyNx7/cbq1JaTCEzWbxhBmimmRcdsBW4mb0sDbsUr1znK7dCJ7VFHrsfL35rirK
 Wf4BUYa77x9gGXVj+A1WuOq0e6NnG8IuCruxxc2RvFBDbN8bhHzdUtSshNypcf1WMJTl
 ajgNARZofoW0iGUvWYtR5JDP7aW8DyQy1V6ckVs0pWRcNc+VhmW2LbFr4qXPnIBh/W8J
 esCQ==
X-Gm-Message-State: AOAM532dUkjDED62Q5dty3nZff+9kvs3gY6sYEmycdsdi3ILzfikT8Y7
 O1dcoWBZKcV7dDMYgIW4nBqvx1cAcZkCKw==
X-Google-Smtp-Source: ABdhPJw5pmXyln55buSyY5u+6SOhuiQXxhlLURcO4XBq5Gj9wpO5Vb/rh5jTjtwDtK8sl7n0ZP8ELg==
X-Received: by 2002:a05:600c:3c9b:b0:38e:4c59:68b9 with SMTP id
 bg27-20020a05600c3c9b00b0038e4c5968b9mr4633174wmb.105.1649959096947; 
 Thu, 14 Apr 2022 10:58:16 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v13-20020adfe28d000000b0020375f27a5asm2451254wri.4.2022.04.14.10.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 10:58:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 for-7.1 7/9] nbd: move s->state under requests_lock
Date: Thu, 14 Apr 2022 19:57:54 +0200
Message-Id: <20220414175756.671165-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414175756.671165-1-pbonzini@redhat.com>
References: <20220414175756.671165-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: v.sementsov-og@mail.ru, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the confusing, and most likely wrong, atomics.  The only function
that used to be somewhat in a hot path was nbd_client_connected(),
but it is not anymore after the previous patches.

The same logic is used both to check if a request had to be reissued
and also in nbd_reconnecting_attempt().  The former cases are outside
requests_lock, while nbd_reconnecting_attempt() does have the lock,
therefore the two have been separated in the previous commit.
nbd_client_will_reconnect() can simply take s->requests_lock, while
nbd_reconnecting_attempt() can inline the access now that no
complicated atomics are involved.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/nbd.c | 78 ++++++++++++++++++++++++++++-------------------------
 1 file changed, 41 insertions(+), 37 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 37d466e435..b5aac2548c 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -35,7 +35,6 @@
 #include "qemu/option.h"
 #include "qemu/cutils.h"
 #include "qemu/main-loop.h"
-#include "qemu/atomic.h"
 
 #include "qapi/qapi-visit-sockets.h"
 #include "qapi/qmp/qstring.h"
@@ -72,10 +71,11 @@ typedef struct BDRVNBDState {
     NBDExportInfo info;
 
     /*
-     * Protects free_sema, in_flight, requests[].coroutine,
+     * Protects state, free_sema, in_flight, requests[].coroutine,
      * reconnect_delay_timer.
      */
     QemuMutex requests_lock;
+    NBDClientState state;
     CoQueue free_sema;
     int in_flight;
     NBDClientRequest requests[MAX_NBD_REQUESTS];
@@ -83,7 +83,6 @@ typedef struct BDRVNBDState {
 
     CoMutex send_mutex;
     CoMutex receive_mutex;
-    NBDClientState state;
 
     QEMUTimer *open_timer;
 
@@ -132,11 +131,6 @@ static void nbd_clear_bdrvstate(BlockDriverState *bs)
     s->x_dirty_bitmap = NULL;
 }
 
-static bool nbd_client_connected(BDRVNBDState *s)
-{
-    return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTED;
-}
-
 static bool coroutine_fn nbd_recv_coroutine_wake_one(NBDClientRequest *req)
 {
     if (req->receiving) {
@@ -159,14 +153,15 @@ static void coroutine_fn nbd_recv_coroutines_wake(BDRVNBDState *s, bool all)
     }
 }
 
-static void coroutine_fn nbd_channel_error(BDRVNBDState *s, int ret)
+/* Called with s->requests_lock held.  */
+static void coroutine_fn nbd_channel_error_locked(BDRVNBDState *s, int ret)
 {
-    if (nbd_client_connected(s)) {
+    if (s->state == NBD_CLIENT_CONNECTED) {
         qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
     }
 
     if (ret == -EIO) {
-        if (nbd_client_connected(s)) {
+        if (s->state == NBD_CLIENT_CONNECTED) {
             s->state = s->reconnect_delay ? NBD_CLIENT_CONNECTING_WAIT :
                                             NBD_CLIENT_CONNECTING_NOWAIT;
         }
@@ -177,6 +172,12 @@ static void coroutine_fn nbd_channel_error(BDRVNBDState *s, int ret)
     nbd_recv_coroutines_wake(s, true);
 }
 
+static void coroutine_fn nbd_channel_error(BDRVNBDState *s, int ret)
+{
+    QEMU_LOCK_GUARD(&s->requests_lock);
+    nbd_channel_error_locked(s, ret);
+}
+
 static void reconnect_delay_timer_del(BDRVNBDState *s)
 {
     if (s->reconnect_delay_timer) {
@@ -189,20 +190,18 @@ static void reconnect_delay_timer_cb(void *opaque)
 {
     BDRVNBDState *s = opaque;
 
-    if (qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT) {
-        s->state = NBD_CLIENT_CONNECTING_NOWAIT;
-        nbd_co_establish_connection_cancel(s->conn);
-    }
-
     reconnect_delay_timer_del(s);
+    WITH_QEMU_LOCK_GUARD(&s->requests_lock) {
+        if (s->state != NBD_CLIENT_CONNECTING_WAIT) {
+            return;
+        }
+        s->state = NBD_CLIENT_CONNECTING_NOWAIT;
+    }
+    nbd_co_establish_connection_cancel(s->conn);
 }
 
 static void reconnect_delay_timer_init(BDRVNBDState *s, uint64_t expire_time_ns)
 {
-    if (qatomic_load_acquire(&s->state) != NBD_CLIENT_CONNECTING_WAIT) {
-        return;
-    }
-
     assert(!s->reconnect_delay_timer);
     s->reconnect_delay_timer = aio_timer_new(bdrv_get_aio_context(s->bs),
                                              QEMU_CLOCK_REALTIME,
@@ -225,7 +224,9 @@ static void nbd_teardown_connection(BlockDriverState *bs)
         s->ioc = NULL;
     }
 
-    s->state = NBD_CLIENT_QUIT;
+    WITH_QEMU_LOCK_GUARD(&s->requests_lock) {
+        s->state = NBD_CLIENT_QUIT;
+    }
 }
 
 static void open_timer_del(BDRVNBDState *s)
@@ -254,15 +255,15 @@ static void open_timer_init(BDRVNBDState *s, uint64_t expire_time_ns)
     timer_mod(s->open_timer, expire_time_ns);
 }
 
-static bool nbd_client_connecting_wait(BDRVNBDState *s)
-{
-    return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT;
-}
-
 static bool nbd_client_will_reconnect(BDRVNBDState *s)
 {
-    return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT;
+    /*
+     * Called only after a socket error, so this is not performance sensitive.
+     */
+    QEMU_LOCK_GUARD(&s->requests_lock);
+    return s->state == NBD_CLIENT_CONNECTING_WAIT;
 }
+
 /*
  * Update @bs with information learned during a completed negotiation process.
  * Return failure if the server's advertised options are incompatible with the
@@ -347,22 +348,24 @@ int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
     qio_channel_attach_aio_context(s->ioc, bdrv_get_aio_context(bs));
 
     /* successfully connected */
-    s->state = NBD_CLIENT_CONNECTED;
+    WITH_QEMU_LOCK_GUARD(&s->requests_lock) {
+        s->state = NBD_CLIENT_CONNECTED;
+    }
 
     return 0;
 }
 
+/* Called with s->requests_lock held.  */
 static bool nbd_client_connecting(BDRVNBDState *s)
 {
-    NBDClientState state = qatomic_load_acquire(&s->state);
-    return state == NBD_CLIENT_CONNECTING_WAIT ||
-        state == NBD_CLIENT_CONNECTING_NOWAIT;
+    return s->state == NBD_CLIENT_CONNECTING_WAIT ||
+        s->state == NBD_CLIENT_CONNECTING_NOWAIT;
 }
 
 /* Called with s->requests_lock taken.  */
 static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 {
-    bool blocking = nbd_client_connecting_wait(s);
+    bool blocking = s->state == NBD_CLIENT_CONNECTING_WAIT;
 
     /*
      * Now we are sure that nobody is accessing the channel, and no one will
@@ -477,17 +480,17 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
 
     qemu_mutex_lock(&s->requests_lock);
     while (s->in_flight == MAX_NBD_REQUESTS ||
-           (!nbd_client_connected(s) && s->in_flight > 0)) {
+           (s->state != NBD_CLIENT_CONNECTED && s->in_flight > 0)) {
         qemu_co_queue_wait(&s->free_sema, &s->requests_lock);
     }
 
     s->in_flight++;
-    if (!nbd_client_connected(s)) {
+    if (s->state != NBD_CLIENT_CONNECTED) {
         if (nbd_client_connecting(s)) {
             nbd_reconnect_attempt(s);
             qemu_co_queue_restart_all(&s->free_sema);
         }
-        if (!nbd_client_connected(s)) {
+        if (s->state != NBD_CLIENT_CONNECTED) {
             rc = -EIO;
             goto err;
         }
@@ -530,7 +533,7 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
     if (rc < 0) {
         qemu_mutex_lock(&s->requests_lock);
 err:
-        nbd_channel_error(s, rc);
+        nbd_channel_error_locked(s, rc);
         if (i != -1) {
             s->requests[i].coroutine = NULL;
         }
@@ -1443,8 +1446,9 @@ static void nbd_yank(void *opaque)
     BlockDriverState *bs = opaque;
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
 
-    qatomic_store_release(&s->state, NBD_CLIENT_QUIT);
+    QEMU_LOCK_GUARD(&s->requests_lock);
     qio_channel_shutdown(QIO_CHANNEL(s->ioc), QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
+    s->state = NBD_CLIENT_QUIT;
 }
 
 static void nbd_client_close(BlockDriverState *bs)
-- 
2.35.1



