Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E527501AC1
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 20:04:39 +0200 (CEST)
Received: from localhost ([::1]:49942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf3pe-0004y9-NE
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 14:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nf3jV-0004rU-Mz
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 13:58:21 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:42976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nf3jT-0005ui-UR
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 13:58:17 -0400
Received: by mail-wr1-x431.google.com with SMTP id r13so7946351wrr.9
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 10:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qPiVlhtFX1uAH/GGISul1eoCjcJOFjzCsMQY+NhZ6Bs=;
 b=QI9IbrVeGwnT7x3mfvfGYCO8ytk7fa4F1VUplWWuHaCdJ4/d7fuRrFh0Mj7oc6L41g
 /pTdA4p0Lut3zTc3yqsZK2VtuRkW/czbGoUrZvoPapr+3QA2j389ARLv4MGjchVQGzeK
 3eUfVcMVfNiR+pG4+3S+N0ZKYik+ok8vVu49wi0n4aZ9GZXJnvOYcb/wbMXVEYC/uUqT
 pagjB5kuYiK0Hl7T85pa3iukzoOf3vuS+MBXmgsw70qQ6yzj2rjvMTo4j1dj/6rIUuCG
 nkukrmrCTfF6HeM4t81nIUaU30A7/vjp9L5sL8M2unJ7nPVE36D4vUN0OmLFW+YUAhW+
 oxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qPiVlhtFX1uAH/GGISul1eoCjcJOFjzCsMQY+NhZ6Bs=;
 b=iux2hRjqhTsLaHrljXrPRiY6jetxq+Ttur9gCBAqsLzqcCaaJ/C92qfkPU15NRqczK
 DxAIQGkv6yMHDJUFNcEYhZ5yjkfUIHijSZQcN2zZipInxEQ241tV/ztIS6+G7FNA9mR8
 v64Q890TaTnSuclymt6Wz8jAf+08DWwzF7njFk/K5NXH+0225slXy9KP9UvT+QeZsJmi
 4jGzhI32mlAByF/eHFsdhCZhKvwb8SFVpqp9JlSaaVFDmVZ88gRH7mGwLSkD3QMHePa3
 xloajlBmqe6nYyiuf4HAK5sPWZsGP21IJrUvnaaavgymDO2E0RwzJxWMuXi8g8W6pK0F
 0TFg==
X-Gm-Message-State: AOAM5326x1LMzPV8DEgo12Gg9BhjChyHlaCfHes9ALW/WVuMPuvUsoVG
 zE6t6jsdSnxI5pUx2Uxpio49K37BCntzoQ==
X-Google-Smtp-Source: ABdhPJyxxLVjNVtqxY9yclQby1ifvA91k07t0fRJ47LlyWvXBK2Wetehl6iVcAbqHb7b2qrPGlc/aw==
X-Received: by 2002:a05:6000:18a2:b0:203:d2f5:28a0 with SMTP id
 b2-20020a05600018a200b00203d2f528a0mr3008909wri.355.1649959094515; 
 Thu, 14 Apr 2022 10:58:14 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v13-20020adfe28d000000b0020375f27a5asm2451254wri.4.2022.04.14.10.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 10:58:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 for-7.1 5/9] nbd: use a QemuMutex to synchronize yanking,
 reconnection and coroutines
Date: Thu, 14 Apr 2022 19:57:52 +0200
Message-Id: <20220414175756.671165-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414175756.671165-1-pbonzini@redhat.com>
References: <20220414175756.671165-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x431.google.com
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

The condition for waiting on the s->free_sema queue depends on
both s->in_flight and s->state.  The latter is currently using
atomics, but this is quite dubious and probably wrong.

Because s->state is written in the main thread too, for example by
the yank callback, it cannot be protected by a CoMutex.  Introduce a
separate lock that can be used by nbd_co_send_request(); later on this
lock will also be used for s->state.  There will not be any contention
on the lock unless there is a yank or reconnect, so this is not
performance sensitive.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/nbd.c | 46 +++++++++++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 62dd338ef3..a2414566d1 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -71,17 +71,22 @@ typedef struct BDRVNBDState {
     QIOChannel *ioc; /* The current I/O channel */
     NBDExportInfo info;
 
-    CoMutex send_mutex;
+    /*
+     * Protects free_sema, in_flight, requests[].coroutine,
+     * reconnect_delay_timer.
+     */
+    QemuMutex requests_lock;
     CoQueue free_sema;
-
-    CoMutex receive_mutex;
     int in_flight;
+    NBDClientRequest requests[MAX_NBD_REQUESTS];
+    QEMUTimer *reconnect_delay_timer;
+
+    CoMutex send_mutex;
+    CoMutex receive_mutex;
     NBDClientState state;
 
-    QEMUTimer *reconnect_delay_timer;
     QEMUTimer *open_timer;
 
-    NBDClientRequest requests[MAX_NBD_REQUESTS];
     NBDReply reply;
     BlockDriverState *bs;
 
@@ -350,7 +355,7 @@ int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
     return 0;
 }
 
-/* called under s->send_mutex */
+/* Called with s->requests_lock taken.  */
 static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 {
     bool blocking = nbd_client_connecting_wait(s);
@@ -382,9 +387,9 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
         s->ioc = NULL;
     }
 
-    qemu_co_mutex_unlock(&s->send_mutex);
+    qemu_mutex_unlock(&s->requests_lock);
     nbd_co_do_establish_connection(s->bs, blocking, NULL);
-    qemu_co_mutex_lock(&s->send_mutex);
+    qemu_mutex_lock(&s->requests_lock);
 
     /*
      * The reconnect attempt is done (maybe successfully, maybe not), so
@@ -466,11 +471,10 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     int rc, i = -1;
 
-    qemu_co_mutex_lock(&s->send_mutex);
-
+    qemu_mutex_lock(&s->requests_lock);
     while (s->in_flight == MAX_NBD_REQUESTS ||
            (!nbd_client_connected(s) && s->in_flight > 0)) {
-        qemu_co_queue_wait(&s->free_sema, &s->send_mutex);
+        qemu_co_queue_wait(&s->free_sema, &s->requests_lock);
     }
 
     s->in_flight++;
@@ -491,13 +495,13 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
         }
     }
 
-    g_assert(qemu_in_coroutine());
     assert(i < MAX_NBD_REQUESTS);
-
     s->requests[i].coroutine = qemu_coroutine_self();
     s->requests[i].offset = request->from;
     s->requests[i].receiving = false;
+    qemu_mutex_unlock(&s->requests_lock);
 
+    qemu_co_mutex_lock(&s->send_mutex);
     request->handle = INDEX_TO_HANDLE(s, i);
 
     assert(s->ioc);
@@ -517,17 +521,19 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
     } else {
         rc = nbd_send_request(s->ioc, request);
     }
+    qemu_co_mutex_unlock(&s->send_mutex);
 
-err:
     if (rc < 0) {
+        qemu_mutex_lock(&s->requests_lock);
+err:
         nbd_channel_error(s, rc);
         if (i != -1) {
             s->requests[i].coroutine = NULL;
         }
         s->in_flight--;
         qemu_co_queue_next(&s->free_sema);
+        qemu_mutex_unlock(&s->requests_lock);
     }
-    qemu_co_mutex_unlock(&s->send_mutex);
     return rc;
 }
 
@@ -1017,12 +1023,11 @@ static bool nbd_reply_chunk_iter_receive(BDRVNBDState *s,
     return true;
 
 break_loop:
+    qemu_mutex_lock(&s->requests_lock);
     s->requests[HANDLE_TO_INDEX(s, handle)].coroutine = NULL;
-
-    qemu_co_mutex_lock(&s->send_mutex);
     s->in_flight--;
     qemu_co_queue_next(&s->free_sema);
-    qemu_co_mutex_unlock(&s->send_mutex);
+    qemu_mutex_unlock(&s->requests_lock);
 
     return false;
 }
@@ -1855,8 +1860,9 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
 
     s->bs = bs;
-    qemu_co_mutex_init(&s->send_mutex);
+    qemu_mutex_init(&s->requests_lock);
     qemu_co_queue_init(&s->free_sema);
+    qemu_co_mutex_init(&s->send_mutex);
     qemu_co_mutex_init(&s->receive_mutex);
 
     if (!yank_register_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name), errp)) {
@@ -2044,9 +2050,11 @@ static void nbd_cancel_in_flight(BlockDriverState *bs)
 
     reconnect_delay_timer_del(s);
 
+    qemu_mutex_lock(&s->requests_lock);
     if (s->state == NBD_CLIENT_CONNECTING_WAIT) {
         s->state = NBD_CLIENT_CONNECTING_NOWAIT;
     }
+    qemu_mutex_unlock(&s->requests_lock);
 
     nbd_co_establish_connection_cancel(s->conn);
 }
-- 
2.35.1



