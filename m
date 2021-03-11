Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D787336ED2
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 10:27:15 +0100 (CET)
Received: from localhost ([::1]:33638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKHb8-0008Gt-C9
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 04:27:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lKBno-0001LO-El; Wed, 10 Mar 2021 22:15:56 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:42780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lKBnm-0000gF-Cd; Wed, 10 Mar 2021 22:15:56 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 b2-20020a7bc2420000b029010be1081172so11916436wmj.1; 
 Wed, 10 Mar 2021 19:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dXcKVQyGGZNut+nzOHUWn5swypLW9nww9IuGeZxhzJI=;
 b=nITUMZGgzxB9HUbOO9+dyrnyXGQZfYsmmkfwECrpfs+gQdyPX/qyu9AWMGkWd/teQK
 xZPqepcmjMkCRRgBos/F8dLbnKS+VXyLIC03MByPGe+bRe0aVVnNVwqsTH8UKnAHtN49
 7sSfWbYHwdBooZK1+gYPOMqUSwCVItC4BklIqXnVIoYB+SpENz7rxNM6UE/COi9npKM/
 HT2vYCGDa/U0SAESJJc+DCpphrNuOsZgv9rF3g8xuE/doFMppDAC8vM/+ssXNuXyyvFW
 xDTzZ+ZTlPmnk2F9+AMTgLsPx5xnEMBqVyneSg58cHu9lij3FpB5btqCMJOwM0TDAC8f
 lkcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dXcKVQyGGZNut+nzOHUWn5swypLW9nww9IuGeZxhzJI=;
 b=VcEA6pyjqzfOuhogHGTEKTwYpJTwX8znFCiponL8bKzNwgBalMHKB6eni42LMou6bq
 nb2kzLFlZEgZ/ARrK5QFhS3pvLx849vpXFGPft1bzwfefUUSucY/zms3UCtj405oIYiO
 oz0NlDjIQB3qZhOOc00KDobauhHMZUv4FgyC1NBrmQ2d+60BXHXlqfOtk3cDfHa8HN8f
 qu5wn53P4OT9iTVdm3SQMeYgXffIGIoXZ/aHAdFmuSBrgk3be9loqh3m9/ly+hjVwfwl
 BZkjjUzYAaZxdD9vDpv8mooDsO95iLTF6IBoI7IZByUmJZ91ZX/M8NAmeMd45viFqlLy
 6npw==
X-Gm-Message-State: AOAM533qXBZldYTIKWoAVmZNjp7BkeIZn4ddFcNo/ivik36q1WXm9CRh
 9EYXzJwhAK9nwNyHqnhdTOtuAe5uNauK00m95FQ=
X-Google-Smtp-Source: ABdhPJzfB4fpET3tg/Ya7DUh1hqKudfFluxcFhErqZAPV2dKPZLqxVVWjpxindtbisa4QCR1j6M5Tg==
X-Received: by 2002:a1c:9d85:: with SMTP id g127mr6001514wme.161.1615432551868; 
 Wed, 10 Mar 2021 19:15:51 -0800 (PST)
Received: from localhost.localdomain ([197.61.47.225])
 by smtp.googlemail.com with ESMTPSA id o188sm1450416wme.7.2021.03.10.19.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 19:15:51 -0800 (PST)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/9] block: Replaced qemu_mutex_lock calls with QEMU_LOCK_GUARD
Date: Thu, 11 Mar 2021 05:15:31 +0200
Message-Id: <20210311031538.5325-3-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311031538.5325-1-ma.mandourr@gmail.com>
References: <20210311031538.5325-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 11 Mar 2021 04:24:49 -0500
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
Cc: Kevin Wolf <kwolf@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 "open list:CURL" <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replaced various qemu_mutex_lock/qemu_mutex_unlock calls with
lock guard macros (QEMU_LOCK_GUARD() and WITH_QEMU_LOCK_GUARD).
This slightly simplifies the code by eliminating calls to
qemu_mutex_unlock and eliminates goto paths.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 block/curl.c |  13 ++--
 block/nbd.c  | 188 ++++++++++++++++++++++++---------------------------
 2 files changed, 95 insertions(+), 106 deletions(-)

diff --git a/block/curl.c b/block/curl.c
index 4ff895df8f..56a217951a 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -832,12 +832,12 @@ static void curl_setup_preadv(BlockDriverState *bs, CURLAIOCB *acb)
     uint64_t start = acb->offset;
     uint64_t end;
 
-    qemu_mutex_lock(&s->mutex);
+    QEMU_LOCK_GUARD(&s->mutex);
 
     // In case we have the requested data already (e.g. read-ahead),
     // we can just call the callback and be done.
     if (curl_find_buf(s, start, acb->bytes, acb)) {
-        goto out;
+        return;
     }
 
     // No cache found, so let's start a new request
@@ -852,7 +852,7 @@ static void curl_setup_preadv(BlockDriverState *bs, CURLAIOCB *acb)
     if (curl_init_state(s, state) < 0) {
         curl_clean_state(state);
         acb->ret = -EIO;
-        goto out;
+        return;
     }
 
     acb->start = 0;
@@ -867,7 +867,7 @@ static void curl_setup_preadv(BlockDriverState *bs, CURLAIOCB *acb)
     if (state->buf_len && state->orig_buf == NULL) {
         curl_clean_state(state);
         acb->ret = -ENOMEM;
-        goto out;
+        return;
     }
     state->acb[0] = acb;
 
@@ -880,14 +880,11 @@ static void curl_setup_preadv(BlockDriverState *bs, CURLAIOCB *acb)
         acb->ret = -EIO;
 
         curl_clean_state(state);
-        goto out;
+        return;
     }
 
     /* Tell curl it needs to kick things off */
     curl_multi_socket_action(s->multi, CURL_SOCKET_TIMEOUT, 0, &running);
-
-out:
-    qemu_mutex_unlock(&s->mutex);
 }
 
 static int coroutine_fn curl_co_preadv(BlockDriverState *bs,
diff --git a/block/nbd.c b/block/nbd.c
index c26dc5a54f..28ba7aad61 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -407,27 +407,25 @@ static void *connect_thread_func(void *opaque)
         thr->sioc = NULL;
     }
 
-    qemu_mutex_lock(&thr->mutex);
-
-    switch (thr->state) {
-    case CONNECT_THREAD_RUNNING:
-        thr->state = ret < 0 ? CONNECT_THREAD_FAIL : CONNECT_THREAD_SUCCESS;
-        if (thr->bh_ctx) {
-            aio_bh_schedule_oneshot(thr->bh_ctx, thr->bh_func, thr->bh_opaque);
-
-            /* play safe, don't reuse bh_ctx on further connection attempts */
-            thr->bh_ctx = NULL;
+    WITH_QEMU_LOCK_GUARD(&thr->mutex) {
+        switch (thr->state) {
+        case CONNECT_THREAD_RUNNING:
+            thr->state = ret < 0 ? CONNECT_THREAD_FAIL : CONNECT_THREAD_SUCCESS;
+            if (thr->bh_ctx) {
+                aio_bh_schedule_oneshot(thr->bh_ctx, thr->bh_func, thr->bh_opaque);
+
+                /* play safe, don't reuse bh_ctx on further connection attempts */
+                thr->bh_ctx = NULL;
+            }
+            break;
+        case CONNECT_THREAD_RUNNING_DETACHED:
+            do_free = true;
+            break;
+        default:
+            abort();
         }
-        break;
-    case CONNECT_THREAD_RUNNING_DETACHED:
-        do_free = true;
-        break;
-    default:
-        abort();
     }
 
-    qemu_mutex_unlock(&thr->mutex);
-
     if (do_free) {
         nbd_free_connect_thread(thr);
     }
@@ -443,36 +441,33 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
     BDRVNBDState *s = bs->opaque;
     NBDConnectThread *thr = s->connect_thread;
 
-    qemu_mutex_lock(&thr->mutex);
-
-    switch (thr->state) {
-    case CONNECT_THREAD_FAIL:
-    case CONNECT_THREAD_NONE:
-        error_free(thr->err);
-        thr->err = NULL;
-        thr->state = CONNECT_THREAD_RUNNING;
-        qemu_thread_create(&thread, "nbd-connect",
-                           connect_thread_func, thr, QEMU_THREAD_DETACHED);
-        break;
-    case CONNECT_THREAD_SUCCESS:
-        /* Previous attempt finally succeeded in background */
-        thr->state = CONNECT_THREAD_NONE;
-        s->sioc = thr->sioc;
-        thr->sioc = NULL;
-        yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
-                               nbd_yank, bs);
-        qemu_mutex_unlock(&thr->mutex);
-        return 0;
-    case CONNECT_THREAD_RUNNING:
-        /* Already running, will wait */
-        break;
-    default:
-        abort();
-    }
-
-    thr->bh_ctx = qemu_get_current_aio_context();
+    WITH_QEMU_LOCK_GUARD(&thr->mutex) {
+        switch (thr->state) {
+        case CONNECT_THREAD_FAIL:
+        case CONNECT_THREAD_NONE:
+            error_free(thr->err);
+            thr->err = NULL;
+            thr->state = CONNECT_THREAD_RUNNING;
+            qemu_thread_create(&thread, "nbd-connect",
+                               connect_thread_func, thr, QEMU_THREAD_DETACHED);
+            break;
+        case CONNECT_THREAD_SUCCESS:
+            /* Previous attempt finally succeeded in background */
+            thr->state = CONNECT_THREAD_NONE;
+            s->sioc = thr->sioc;
+            thr->sioc = NULL;
+            yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
+                                   nbd_yank, bs);
+            return 0;
+        case CONNECT_THREAD_RUNNING:
+            /* Already running, will wait */
+            break;
+        default:
+            abort();
+        }
 
-    qemu_mutex_unlock(&thr->mutex);
+        thr->bh_ctx = qemu_get_current_aio_context();
+    }
 
 
     /*
@@ -486,46 +481,45 @@ nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
     s->wait_connect = true;
     qemu_coroutine_yield();
 
-    qemu_mutex_lock(&thr->mutex);
 
-    switch (thr->state) {
-    case CONNECT_THREAD_SUCCESS:
-    case CONNECT_THREAD_FAIL:
-        thr->state = CONNECT_THREAD_NONE;
-        error_propagate(errp, thr->err);
-        thr->err = NULL;
-        s->sioc = thr->sioc;
-        thr->sioc = NULL;
-        if (s->sioc) {
-            yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
-                                   nbd_yank, bs);
-        }
-        ret = (s->sioc ? 0 : -1);
-        break;
-    case CONNECT_THREAD_RUNNING:
-    case CONNECT_THREAD_RUNNING_DETACHED:
-        /*
-         * Obviously, drained section wants to start. Report the attempt as
-         * failed. Still connect thread is executing in background, and its
-         * result may be used for next connection attempt.
-         */
-        ret = -1;
-        error_setg(errp, "Connection attempt cancelled by other operation");
-        break;
+    WITH_QEMU_LOCK_GUARD(&thr->mutex) {
+        switch (thr->state) {
+        case CONNECT_THREAD_SUCCESS:
+        case CONNECT_THREAD_FAIL:
+            thr->state = CONNECT_THREAD_NONE;
+            error_propagate(errp, thr->err);
+            thr->err = NULL;
+            s->sioc = thr->sioc;
+            thr->sioc = NULL;
+            if (s->sioc) {
+                yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
+                                       nbd_yank, bs);
+            }
+            ret = (s->sioc ? 0 : -1);
+            break;
+        case CONNECT_THREAD_RUNNING:
+        case CONNECT_THREAD_RUNNING_DETACHED:
+            /*
+             * Obviously, drained section wants to start. Report the attempt as
+             * failed. Still connect thread is executing in background, and its
+             * result may be used for next connection attempt.
+             */
+            ret = -1;
+            error_setg(errp, "Connection attempt cancelled by other operation");
+            break;
 
-    case CONNECT_THREAD_NONE:
-        /*
-         * Impossible. We've seen this thread running. So it should be
-         * running or at least give some results.
-         */
-        abort();
+        case CONNECT_THREAD_NONE:
+            /*
+             * Impossible. We've seen this thread running. So it should be
+             * running or at least give some results.
+             */
+            abort();
 
-    default:
-        abort();
+        default:
+            abort();
+        }
     }
 
-    qemu_mutex_unlock(&thr->mutex);
-
     return ret;
 }
 
@@ -546,25 +540,23 @@ static void nbd_co_establish_connection_cancel(BlockDriverState *bs,
     bool wake = false;
     bool do_free = false;
 
-    qemu_mutex_lock(&thr->mutex);
-
-    if (thr->state == CONNECT_THREAD_RUNNING) {
-        /* We can cancel only in running state, when bh is not yet scheduled */
-        thr->bh_ctx = NULL;
-        if (s->wait_connect) {
-            s->wait_connect = false;
-            wake = true;
-        }
-        if (detach) {
-            thr->state = CONNECT_THREAD_RUNNING_DETACHED;
-            s->connect_thread = NULL;
+    WITH_QEMU_LOCK_GUARD(&thr->mutex) {
+        if (thr->state == CONNECT_THREAD_RUNNING) {
+            /* We can cancel only in running state, when bh is not yet scheduled */
+            thr->bh_ctx = NULL;
+            if (s->wait_connect) {
+                s->wait_connect = false;
+                wake = true;
+            }
+            if (detach) {
+                thr->state = CONNECT_THREAD_RUNNING_DETACHED;
+                s->connect_thread = NULL;
+            }
+        } else if (detach) {
+            do_free = true;
         }
-    } else if (detach) {
-        do_free = true;
     }
 
-    qemu_mutex_unlock(&thr->mutex);
-
     if (do_free) {
         nbd_free_connect_thread(thr);
         s->connect_thread = NULL;
-- 
2.25.1


