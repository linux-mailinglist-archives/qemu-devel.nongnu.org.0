Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C08C1501AB1
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 20:01:46 +0200 (CEST)
Received: from localhost ([::1]:41478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf3mr-0007do-UK
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 14:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nf3jU-0004q4-Sy
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 13:58:16 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:42972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nf3jS-0005tI-MJ
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 13:58:16 -0400
Received: by mail-wr1-x42d.google.com with SMTP id r13so7946245wrr.9
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 10:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jup+XP1pUtySZld8xVq3nH/ymKtZ9nvbp33B8oZgGn0=;
 b=aweaT99AWr7QkrXRbgxZlPYM2lWTJxgm+ED3cMXTsGlpQcmz8rbv58swGHjAS9h7l+
 r0Tpj2YaJTfadeiXyueKm3R4KTE8e5uYD9J1qcBEkEfIqMwZ1LvMlcPuor/I0/QzlJZV
 2B5CBU1k/IwFQBK76vMc/p052ggK5xOCBJGaVXg32/YxtlTN1ySs3DUFpcwmQOEAS52c
 I8SgDyI24p354f1sneD+uw66an7GRI/lPRIXluMICJSN5SNeP4aq405y5WQvtzA/wjwf
 WD2GIO+yNnPuKgc3+3scnvVAOruNAWlJbs4AqOgBCXN3b0va8mXNRm0WFtCNQx+wivqI
 Z5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Jup+XP1pUtySZld8xVq3nH/ymKtZ9nvbp33B8oZgGn0=;
 b=Ie0qZvnhDq7N44S347hFoW6dhnYxEzcZm5YUNlKP97tByUMMGZBvWaxYwWqSAvvjxq
 bg5MI6AHR4eaRYV0UUN582F6fC6m7o+L6s811Yu/4gP/5TR8c31mhZO/XNL3Tc7WA9Ap
 rt6cuxPrt0nwNGiqABU49eFWzpsPqSnItJDuhp1s8TtTz+olzu5iptdzamJtb51SsGUn
 F/PtdecKfTY/ehgC6E9g64bqRxuCjI1fC++MjZAaZlqYMAUYYIc8zqglYqGcKiK/HMB8
 o1kAf5YTRvBS2o97JpbQBwxVnofAPn/oP4VwcDEV5UjChbn3iNYrGi36gl/6GViJZ6Z2
 FXvg==
X-Gm-Message-State: AOAM530+Mca5h5IebqBSpgZKanDux8OgQGk63v4NZXtQ9XMP9VvlE3Xu
 zThIsqvuwYehamNmqFqcLIZdkl7OC5uUXQ==
X-Google-Smtp-Source: ABdhPJwpImjl3QVNLPPRb5AEDa8hQrUFveSwmVGJOMFjSez7+7Blox1w3ACG1rQcnFnajaBLNlRvrg==
X-Received: by 2002:a5d:4702:0:b0:206:b8d:3dce with SMTP id
 y2-20020a5d4702000000b002060b8d3dcemr2991619wrq.646.1649959092845; 
 Thu, 14 Apr 2022 10:58:12 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v13-20020adfe28d000000b0020375f27a5asm2451254wri.4.2022.04.14.10.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 10:58:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 for-7.1 4/9] nbd: keep send_mutex/free_sema handling
 outside nbd_co_do_establish_connection
Date: Thu, 14 Apr 2022 19:57:51 +0200
Message-Id: <20220414175756.671165-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414175756.671165-1-pbonzini@redhat.com>
References: <20220414175756.671165-1-pbonzini@redhat.com>
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
Cc: v.sementsov-og@mail.ru, eblake@redhat.com
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
index a30603ce87..62dd338ef3 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -187,9 +187,6 @@ static void reconnect_delay_timer_cb(void *opaque)
     if (qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTING_WAIT) {
         s->state = NBD_CLIENT_CONNECTING_NOWAIT;
         nbd_co_establish_connection_cancel(s->conn);
-        while (qemu_co_enter_next(&s->free_sema, NULL)) {
-            /* Resume all queued requests */
-        }
     }
 
     reconnect_delay_timer_del(s);
@@ -310,11 +307,10 @@ static int nbd_handle_updated_info(BlockDriverState *bs, Error **errp)
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
@@ -350,7 +346,6 @@ int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
 
     /* successfully connected */
     s->state = NBD_CLIENT_CONNECTED;
-    qemu_co_queue_restart_all(&s->free_sema);
 
     return 0;
 }
@@ -358,25 +353,25 @@ int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
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
+         * It's the first reconnect attempt after switching to
+         * NBD_CLIENT_CONNECTING_WAIT
+         */
+        g_assert(s->reconnect_delay);
+        reconnect_delay_timer_init(s,
+            qemu_clock_get_ns(QEMU_CLOCK_REALTIME) +
+            s->reconnect_delay * NANOSECONDS_PER_SECOND);
+    }
 
     /* Finalize previous connection if any */
     if (s->ioc) {
@@ -387,7 +382,9 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
         s->ioc = NULL;
     }
 
-    nbd_co_do_establish_connection(s->bs, NULL);
+    qemu_co_mutex_unlock(&s->send_mutex);
+    nbd_co_do_establish_connection(s->bs, blocking, NULL);
+    qemu_co_mutex_lock(&s->send_mutex);
 
     /*
      * The reconnect attempt is done (maybe successfully, maybe not), so
@@ -472,21 +469,21 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
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
@@ -526,8 +523,8 @@ err:
         nbd_channel_error(s, rc);
         if (i != -1) {
             s->requests[i].coroutine = NULL;
-            s->in_flight--;
         }
+        s->in_flight--;
         qemu_co_queue_next(&s->free_sema);
     }
     qemu_co_mutex_unlock(&s->send_mutex);
@@ -1883,7 +1880,7 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
     }
 
     s->state = NBD_CLIENT_CONNECTING_WAIT;
-    ret = nbd_do_establish_connection(bs, errp);
+    ret = nbd_do_establish_connection(bs, true, errp);
     if (ret < 0) {
         goto fail;
     }
@@ -2049,7 +2046,6 @@ static void nbd_cancel_in_flight(BlockDriverState *bs)
 
     if (s->state == NBD_CLIENT_CONNECTING_WAIT) {
         s->state = NBD_CLIENT_CONNECTING_NOWAIT;
-        qemu_co_queue_restart_all(&s->free_sema);
     }
 
     nbd_co_establish_connection_cancel(s->conn);
-- 
2.35.1



