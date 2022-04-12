Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1394FE917
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 21:49:23 +0200 (CEST)
Received: from localhost ([::1]:36658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neMVu-0006AI-H8
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 15:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neMP6-0006PB-BX
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 15:42:20 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neMP4-0008J3-M5
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 15:42:20 -0400
Received: by mail-wr1-x42d.google.com with SMTP id b19so29164622wrh.11
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 12:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ux7XqTscQMNlkE2/EueeHX7NByOJIZ8OANgsYwqaZFU=;
 b=Vxxge2WKY5R0+F8ipqgOLaio7qkbd9FLsgDtAnVwrzTHEEKOxFrDvZ43XgRaIG7vA4
 CM7xpM1f4bByH862W2oUV4TcgzE2vTfQGaVFMy+rMY03Adf0aW7msqwuyZaxiZ37AMwX
 8bdf2RtpUpMR3qfObey5iqJgEoYNCtizN+gbe0Lhwjnwu+YjfBj5VR1SxhqwhJrS900a
 iyA1mWWLhdeLh/gMKk7qnrl64pW67NtJP0i+A7IMNFYfON2S7ql2TI4ZK4NzIPKzJrGh
 Lr8QofH029r33W55v/vlqVksdxDtyXrIDG+QkIZZeF0045KnlYNdQCt+ELBY/w1JCXwr
 nh4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ux7XqTscQMNlkE2/EueeHX7NByOJIZ8OANgsYwqaZFU=;
 b=VTdQxxCCuYRxOwEfAzUJcczsSWk8hbZdujQ9LrbgTMf2r9M7t1SYnj/uCl73+jZvRF
 Lw3ML/6HRUiQPSRe8LS+nCRjn8X9uQIlUkZ2TuDVyb0Y4P+12hIWkvKLvGK+qoq7N5DK
 BG8l9DEyNV6EJltgv9R7eeZKAkl6/c3AJoV20xP7n2FCFRe2KZ5/x+pgw30B/m8nfAaM
 yasFwrf9CBiPd+KjY2vRrvzM/TZBqvAjCLJhfgYx9I3hHwOtiByRyOgjkQY1Ef3I4NDu
 LzSAO7OcgXE73XIn57O0qYhOYUR4O3UXoq81z7zUJPNmKdoYgxGm3ceGOmrxew48AG3c
 0ftw==
X-Gm-Message-State: AOAM5332FoSv1KoVBHttG4afKopG5g1srDrbKobB7wypX60MwhvvMpyX
 9McpG2bL8AVhg5DEIXnCajmexbYnYli11g==
X-Google-Smtp-Source: ABdhPJyeylA1mVGdLp1l3k54ZtZinGNXawnDQiVgf5aeueoifwkQwmzsiZYVWAe3mRUyNz++CZWZvQ==
X-Received: by 2002:adf:fb4d:0:b0:207:a376:7585 with SMTP id
 c13-20020adffb4d000000b00207a3767585mr11059824wrs.489.1649792537324; 
 Tue, 12 Apr 2022 12:42:17 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600002a300b00207902922cesm14150978wry.15.2022.04.12.12.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 12:42:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 4/8] nbd: keep send_mutex/free_sema handling outside
 nbd_co_do_establish_connection
Date: Tue, 12 Apr 2022 21:42:00 +0200
Message-Id: <20220412194204.350889-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412194204.350889-1-pbonzini@redhat.com>
References: <20220412194204.350889-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42d.google.com
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

Elevate s->in_flight early so that other incoming requests will wait
on the CoQueue in nbd_co_send_request; restart them after getting back
from nbd_reconnect_attempt.  This could be after the reconnect timer or
nbd_cancel_in_flight have cancelled the attempt, so there is no
need anymore to cancel the requests there.

nbd_co_send_request now handles both stopping and restarting pending
requests after a successful connection, and there is no need to
hold send_mutex in nbd_co_do_establish_connection.  The current setup
is confusing because nbd_co_do_establish_connection is called both with
send_mutex taken and without it.  Before the patch it uses free_sema which
(at least in theory...) is protected by send_mutex, after the patch it
does not anymore.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/coroutines.h |  4 +--
 block/nbd.c        | 66 ++++++++++++++++++++++------------------------
 2 files changed, 33 insertions(+), 37 deletions(-)

diff --git a/block/coroutines.h b/block/coroutines.h
index b293e943c8..8f6e438ef3 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -59,7 +59,7 @@ int coroutine_fn bdrv_co_writev_vmstate(BlockDriverState *bs,
                                         QEMUIOVector *qiov, int64_t pos);
 
 int coroutine_fn
-nbd_co_do_establish_connection(BlockDriverState *bs, Error **errp);
+nbd_co_do_establish_connection(BlockDriverState *bs, bool blocking, Error **errp);
 
 
 int coroutine_fn
@@ -109,7 +109,7 @@ bdrv_common_block_status_above(BlockDriverState *bs,
                                BlockDriverState **file,
                                int *depth);
 int generated_co_wrapper
-nbd_do_establish_connection(BlockDriverState *bs, Error **errp);
+nbd_do_establish_connection(BlockDriverState *bs, bool blocking, Error **errp);
 
 int generated_co_wrapper
 blk_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
diff --git a/block/nbd.c b/block/nbd.c
index 02db52a230..0ff41cb914 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -188,9 +188,6 @@ static void reconnect_delay_timer_cb(void *opaque)
     if (qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT) {
         s->state = NBD_CLIENT_CONNECTING_NOWAIT;
         nbd_co_establish_connection_cancel(s->conn);
-        while (qemu_co_enter_next(&s->free_sema, NULL)) {
-            /* Resume all queued requests */
-        }
     }
 
     reconnect_delay_timer_del(s);
@@ -311,11 +308,10 @@ static int nbd_handle_updated_info(BlockDriverState *bs, Error **errp)
 }
 
 int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
-                                                Error **errp)
+                                                bool blocking, Error **errp)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     int ret;
-    bool blocking = nbd_client_connecting_wait(s);
     IO_CODE();
 
     assert(!s->ioc);
@@ -351,7 +347,6 @@ int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
 
     /* successfully connected */
     s->state = NBD_CLIENT_CONNECTED;
-    qemu_co_queue_restart_all(&s->free_sema);
 
     return 0;
 }
@@ -359,25 +354,25 @@ int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
 /* called under s->send_mutex */
 static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 {
-    assert(nbd_client_connecting(s));
-    assert(s->in_flight == 0);
-
-    if (nbd_client_connecting_wait(s) && s->reconnect_delay &&
-        !s->reconnect_delay_timer)
-    {
-        /*
-         * It's first reconnect attempt after switching to
-         * NBD_CLIENT_CONNECTING_WAIT
-         */
-        reconnect_delay_timer_init(s,
-            qemu_clock_get_ns(QEMU_CLOCK_REALTIME) +
-            s->reconnect_delay * NANOSECONDS_PER_SECOND);
-    }
+    bool blocking = nbd_client_connecting_wait(s);
 
     /*
      * Now we are sure that nobody is accessing the channel, and no one will
      * try until we set the state to CONNECTED.
      */
+    assert(nbd_client_connecting(s));
+    assert(s->in_flight == 1);
+
+    if (blocking && !s->reconnect_delay_timer) {
+        /*
+         * It's first reconnect attempt after switching to
+         * NBD_CLIENT_CONNECTING_WAIT
+         */
+        g_assert(s->reconnect_delay);
+        reconnect_delay_timer_init(s,
+            qemu_clock_get_ns(QEMU_CLOCK_REALTIME) +
+            s->reconnect_delay * NANOSECONDS_PER_SECOND);
+    }
 
     /* Finalize previous connection if any */
     if (s->ioc) {
@@ -388,7 +383,9 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
         s->ioc = NULL;
     }
 
-    nbd_co_do_establish_connection(s->bs, NULL);
+    qemu_co_mutex_unlock(&s->send_mutex);
+    nbd_co_do_establish_connection(s->bs, blocking, NULL);
+    qemu_co_mutex_lock(&s->send_mutex);
 
     /*
      * The reconnect attempt is done (maybe successfully, maybe not), so
@@ -474,21 +471,21 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
     qemu_co_mutex_lock(&s->send_mutex);
 
     while (s->in_flight == MAX_NBD_REQUESTS ||
-           (!nbd_client_connected(s) && s->in_flight > 0))
-    {
+           (!nbd_client_connected(s) && s->in_flight > 0)) {
         qemu_co_queue_wait(&s->free_sema, &s->send_mutex);
     }
 
-    if (nbd_client_connecting(s)) {
-        nbd_reconnect_attempt(s);
-    }
-
-    if (!nbd_client_connected(s)) {
-        rc = -EIO;
-        goto err;
-    }
-
     s->in_flight++;
+    if (!nbd_client_connected(s)) {
+        if (nbd_client_connecting(s)) {
+            nbd_reconnect_attempt(s);
+            qemu_co_queue_restart_all(&s->free_sema);
+        }
+        if (!nbd_client_connected(s)) {
+            rc = -EIO;
+            goto err;
+        }
+    }
 
     for (i = 0; i < MAX_NBD_REQUESTS; i++) {
         if (s->requests[i].coroutine == NULL) {
@@ -529,8 +526,8 @@ err:
         nbd_channel_error(s, rc);
         if (i != -1) {
             s->requests[i].coroutine = NULL;
-            s->in_flight--;
         }
+        s->in_flight--;
         qemu_co_queue_next(&s->free_sema);
     }
     qemu_co_mutex_unlock(&s->send_mutex);
@@ -1885,7 +1882,7 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
     }
 
     s->state = NBD_CLIENT_CONNECTING_WAIT;
-    ret = nbd_do_establish_connection(bs, errp);
+    ret = nbd_do_establish_connection(bs, true, errp);
     if (ret < 0) {
         goto fail;
     }
@@ -2051,7 +2048,6 @@ static void nbd_cancel_in_flight(BlockDriverState *bs)
 
     if (s->state == NBD_CLIENT_CONNECTING_WAIT) {
         s->state = NBD_CLIENT_CONNECTING_NOWAIT;
-        qemu_co_queue_restart_all(&s->free_sema);
     }
 
     nbd_co_establish_connection_cancel(s->conn);
-- 
2.35.1



