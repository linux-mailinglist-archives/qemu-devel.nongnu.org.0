Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B32A4FE918
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 21:49:25 +0200 (CEST)
Received: from localhost ([::1]:36804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neMVw-0006GI-Gt
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 15:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neMP9-0006UA-U6
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 15:42:25 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:53232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neMP8-0008Jr-11
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 15:42:23 -0400
Received: by mail-wm1-x329.google.com with SMTP id r7so12577998wmq.2
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 12:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4+OnE+t66W2T2w92/xQgcGwiFkM/yVaI4DCoj9VarlU=;
 b=gVUv3cWrlNV9fyvnQ2HD58MjeKWhryo9PAYR0sZhKmF+H2yN1VWAjDOKQEA/u4lCZE
 NmWtYp58aWZwpale1tW29xqbHrNG2MhgY1TLMvJTFCEs7k8ifHRezi0aK38NLS6EqOGc
 f3AWD/vVkxuZe+Krws6r+/sDcoeC2D/2mZGaQWcOe2+7UGk5E4QTivOFx0kLK99AnD2q
 ScDe6G68xGZ6E+21kdfKO0jJj4oHGwJDJhAysXbti4LqtbZynHc1XqHJXhPsNt2s/8/D
 xUDgYm1GfuiDeQ++hk2NbvfDFX3oiptPkThRWq7KwOVv1x89r1V6ZPBTdcreUW5RZr5p
 rlCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4+OnE+t66W2T2w92/xQgcGwiFkM/yVaI4DCoj9VarlU=;
 b=SMBpFrSFe7g064wz3dEHS6JYy8OK16tfMU8tCsuO9DJaqbr9H8NMrnhI5HeWTeqWpb
 yzofLt2CEZbrteAh5/d9j/k7xag9l1w/5W3AfKpl3edLH5ivhvUUmsP9q6el8eYUaJma
 g3HrTnvAp72EHZ1Ar/SNJVYyduxQXTTVRginGd1XTehLUjvEfdpd3uerV2SWL/eWzR/V
 zTCljujHQJrnV/Iy8ErVK6WYDFooIfF+6q81Y8OCs7iwg58CEz1rbG4eOMCCGUVcxyk6
 auMDwTQUlaqLmEDBE0c5yvJdg6G4T4jtxrWjQ4PzNXuC/DdMnAIS2Mq9XNGO+OlGdooE
 DXEg==
X-Gm-Message-State: AOAM531JUdCGhvrGA94eUveG3RuN70NuXIAPziboj14iz3S/alU9JrTa
 yxWurD/rwgutIb3vfFdPUCnMM4YJaE+zmw==
X-Google-Smtp-Source: ABdhPJz149LUbpudIQPND0z9iNRS3cSH3rQs5Ky0I7Jo37mcURYdHN5siIFN8RuxTzwMNnju3b8UTA==
X-Received: by 2002:a1c:f005:0:b0:38c:b6d5:5c2a with SMTP id
 a5-20020a1cf005000000b0038cb6d55c2amr5584889wmb.89.1649792540586; 
 Tue, 12 Apr 2022 12:42:20 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600002a300b00207902922cesm14150978wry.15.2022.04.12.12.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 12:42:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 6/8] nbd: move s->state under requests_lock
Date: Tue, 12 Apr 2022 21:42:02 +0200
Message-Id: <20220412194204.350889-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412194204.350889-1-pbonzini@redhat.com>
References: <20220412194204.350889-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x329.google.com
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
Cc: eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the confusing, and most likely wrong, atomics.  The only function
that used to be somewhat in a hot path was nbd_client_connected(),
but it is not anymore after the previous patches.

The function nbd_client_connecting_wait() was used mostly to check if
a request had to be reissued (outside requests_lock), but also
under requests_lock in nbd_client_connecting_wait().  The two uses have to
be separated; for the former we rename it to nbd_client_will_reconnect()
and make it take s->requests_lock; for the latter the access can simply
be inlined.  The new name is clearer, and ensures that a missing
conversion is caught by the compiler.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/nbd.c | 88 +++++++++++++++++++++++++++++------------------------
 1 file changed, 48 insertions(+), 40 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index c908ea6ae3..6d80bd59e2 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -35,7 +35,6 @@
 #include "qemu/option.h"
 #include "qemu/cutils.h"
 #include "qemu/main-loop.h"
-#include "qemu/atomic.h"
 
 #include "qapi/qapi-visit-sockets.h"
 #include "qapi/qmp/qstring.h"
@@ -73,10 +72,11 @@ typedef struct BDRVNBDState {
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
@@ -84,7 +84,6 @@ typedef struct BDRVNBDState {
 
     CoMutex send_mutex;
     CoMutex receive_mutex;
-    NBDClientState state;
 
     QEMUTimer *open_timer;
 
@@ -133,11 +132,6 @@ static void nbd_clear_bdrvstate(BlockDriverState *bs)
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
@@ -160,14 +154,15 @@ static void coroutine_fn nbd_recv_coroutines_wake(BDRVNBDState *s, bool all)
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
@@ -178,6 +173,12 @@ static void coroutine_fn nbd_channel_error(BDRVNBDState *s, int ret)
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
@@ -190,20 +191,18 @@ static void reconnect_delay_timer_cb(void *opaque)
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
@@ -226,7 +225,9 @@ static void nbd_teardown_connection(BlockDriverState *bs)
         s->ioc = NULL;
     }
 
-    s->state = NBD_CLIENT_QUIT;
+    WITH_QEMU_LOCK_GUARD(&s->requests_lock) {
+        s->state = NBD_CLIENT_QUIT;
+    }
 }
 
 static void open_timer_del(BDRVNBDState *s)
@@ -255,16 +256,13 @@ static void open_timer_init(BDRVNBDState *s, uint64_t expire_time_ns)
     timer_mod(s->open_timer, expire_time_ns);
 }
 
-static bool nbd_client_connecting(BDRVNBDState *s)
+static bool nbd_client_will_reconnect(BDRVNBDState *s)
 {
-    NBDClientState state = qatomic_load_acquire(&s->state);
-    return state == NBD_CLIENT_CONNECTING_WAIT ||
-        state == NBD_CLIENT_CONNECTING_NOWAIT;
-}
-
-static bool nbd_client_connecting_wait(BDRVNBDState *s)
-{
-    return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT;
+    /*
+     * Called only after a socket error, so this is not performance sensitive.
+     */
+    QEMU_LOCK_GUARD(&s->requests_lock);
+    return s->state == NBD_CLIENT_CONNECTING_WAIT;
 }
 
 /*
@@ -351,15 +349,24 @@ int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
     qio_channel_attach_aio_context(s->ioc, bdrv_get_aio_context(bs));
 
     /* successfully connected */
-    s->state = NBD_CLIENT_CONNECTED;
+    WITH_QEMU_LOCK_GUARD(&s->requests_lock) {
+        s->state = NBD_CLIENT_CONNECTED;
+    }
 
     return 0;
 }
 
+/* Called with s->requests_lock held.  */
+static bool nbd_client_connecting(BDRVNBDState *s)
+{
+    return s->state == NBD_CLIENT_CONNECTING_WAIT ||
+        s->state == NBD_CLIENT_CONNECTING_NOWAIT;
+}
+
 /* Called with s->requests_lock taken.  */
 static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 {
-    bool blocking = nbd_client_connecting_wait(s);
+    bool blocking = s->state == NBD_CLIENT_CONNECTING_WAIT;
 
     /*
      * Now we are sure that nobody is accessing the channel, and no one will
@@ -475,17 +482,17 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
 
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
@@ -529,7 +536,7 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
     if (rc < 0) {
         qemu_mutex_lock(&s->requests_lock);
 err:
-        nbd_channel_error(s, rc);
+        nbd_channel_error_locked(s, rc);
         if (i != -1) {
             s->requests[i].coroutine = NULL;
         }
@@ -1193,7 +1200,7 @@ static int coroutine_fn nbd_co_request(BlockDriverState *bs, NBDRequest *request
             error_free(local_err);
             local_err = NULL;
         }
-    } while (ret < 0 && nbd_client_connecting_wait(s));
+    } while (ret < 0 && nbd_client_will_reconnect(s));
 
     return ret ? ret : request_ret;
 }
@@ -1252,7 +1259,7 @@ static int coroutine_fn nbd_client_co_preadv(BlockDriverState *bs, int64_t offse
             error_free(local_err);
             local_err = NULL;
         }
-    } while (ret < 0 && nbd_client_connecting_wait(s));
+    } while (ret < 0 && nbd_client_will_reconnect(s));
 
     return ret ? ret : request_ret;
 }
@@ -1410,7 +1417,7 @@ static int coroutine_fn nbd_client_co_block_status(
             error_free(local_err);
             local_err = NULL;
         }
-    } while (ret < 0 && nbd_client_connecting_wait(s));
+    } while (ret < 0 && nbd_client_will_reconnect(s));
 
     if (ret < 0 || request_ret < 0) {
         return ret ? ret : request_ret;
@@ -1442,8 +1449,9 @@ static void nbd_yank(void *opaque)
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



