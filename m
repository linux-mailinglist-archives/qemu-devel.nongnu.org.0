Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7284FE920
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 21:52:57 +0200 (CEST)
Received: from localhost ([::1]:42706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neMZM-0001zU-3n
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 15:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neMP9-0006U8-GQ
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 15:42:25 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neMP7-0008Jc-5o
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 15:42:23 -0400
Received: by mail-wr1-x436.google.com with SMTP id c10so8096835wrb.1
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 12:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7/SFJJFXJPRt3hK1+q+FC/Cv2LiQu5FpYZItGWc9MAY=;
 b=nylIEcafVSDeAgDu89Qjsg7qLC6sGht3flnvtFldiE7i8InIVxD0KAt4uwHjYFeNhy
 de51VBVsufB+4uEVj+EiskzIypP5gxf0tpmLJCWozKRWVO5kq8ElA5pz9oZwGxd/B3La
 5ITLhckqwfA3HbDYOyieipfcgreEtNmeKrN74BOEKzsiFeeYknscCxH+SM56rRhnZRRG
 BfT7oraoY2GgkC9W/JxIuft0VCqN/CtUWUD5Sh5vaA8b+o1zTSQTpqw5XlDZxJQ38KkV
 RSBowdERpXh1yKZvnwaEqjUaHBsfjlg99KT+nKLPkg2T79caL5TS1nG+GN3c6ZcqaZ7Z
 6lZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7/SFJJFXJPRt3hK1+q+FC/Cv2LiQu5FpYZItGWc9MAY=;
 b=bVI2AgSCzpuv4tUWzdF1oO1HsJjTrTDT77oaT0hxfafQez9xVkHGbmu56GG6QtMRE/
 NC4j4JwkxWGI55lAMdD6Uql+CesSpa5KoQS4TilvmHR4ifzJ0kIvckUihLeL65OmLZ+7
 4+GvBZajDIAKHpJg6E6s/Q8X54Bs793L3F4BU6aLPRBj21rRWqqrrom/c63LOYh7itmm
 gQRfTDCssxDaKt8rOpgMt45pjE/0mL5upjaabQ7Xa6YthUZIHVWd5nq2yxUhwc8txeX1
 HWB7jG+Zu3oT1HWYGq5XmORXavKiXZXZ1AYZr+JXRVy5Szb3MUh+H0rRaPMuXVXuA5Mt
 yUhA==
X-Gm-Message-State: AOAM532XTMtISjNYJHzxfNgrN7nBZtoZ9cWAyK/Ni1FBOxNgKF2LN5rg
 Jyho2GfHXOPCwVooVuzUILJOcYYdyy/hrw==
X-Google-Smtp-Source: ABdhPJxnq8khRI3+ScrmStDYN5liKVoO8U0hCkbzOEgq0RN2+nZz2r5D/sFWwPEfCbxZLDpro85taA==
X-Received: by 2002:a5d:4a81:0:b0:207:9abe:2908 with SMTP id
 o1-20020a5d4a81000000b002079abe2908mr16254643wrq.341.1649792539826; 
 Tue, 12 Apr 2022 12:42:19 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600002a300b00207902922cesm14150978wry.15.2022.04.12.12.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 12:42:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 5/8] nbd: use a QemuMutex to synchronize reconnection
 with coroutines
Date: Tue, 12 Apr 2022 21:42:01 +0200
Message-Id: <20220412194204.350889-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412194204.350889-1-pbonzini@redhat.com>
References: <20220412194204.350889-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
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

The condition for waiting on the s->free_sema queue depends on
both s->in_flight and s->state.  The latter is currently using
atomics, but this is quite dubious and probably wrong.

Because s->state is written in the main thread too, for example by
the reconnect timer callback, it cannot be protected by a CoMutex.
Introduce a separate lock that can be used by nbd_co_send_request();
later on this lock will also be used for s->state.  There will not
be any contention on the lock unless there is a reconnect, so this
is not performance sensitive.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/nbd.c | 46 +++++++++++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 0ff41cb914..c908ea6ae3 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -72,17 +72,22 @@ typedef struct BDRVNBDState {
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
 
@@ -351,7 +356,7 @@ int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
     return 0;
 }
 
-/* called under s->send_mutex */
+/* Called with s->requests_lock taken.  */
 static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 {
     bool blocking = nbd_client_connecting_wait(s);
@@ -383,9 +388,9 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
         s->ioc = NULL;
     }
 
-    qemu_co_mutex_unlock(&s->send_mutex);
+    qemu_mutex_unlock(&s->requests_lock);
     nbd_co_do_establish_connection(s->bs, blocking, NULL);
-    qemu_co_mutex_lock(&s->send_mutex);
+    qemu_mutex_lock(&s->requests_lock);
 
     /*
      * The reconnect attempt is done (maybe successfully, maybe not), so
@@ -468,11 +473,10 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
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
@@ -493,14 +497,14 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
         }
     }
 
-    g_assert(qemu_in_coroutine());
     assert(i < MAX_NBD_REQUESTS);
-
     s->requests[i].coroutine = qemu_coroutine_self();
     s->requests[i].offset = request->from;
     s->requests[i].receiving = false;
     s->requests[i].reply_possible = true;
+    qemu_mutex_unlock(&s->requests_lock);
 
+    qemu_co_mutex_lock(&s->send_mutex);
     request->handle = INDEX_TO_HANDLE(s, i);
 
     assert(s->ioc);
@@ -520,17 +524,19 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
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
 
@@ -1020,12 +1026,11 @@ static bool nbd_reply_chunk_iter_receive(BDRVNBDState *s,
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
@@ -1858,8 +1863,9 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
 
     s->bs = bs;
-    qemu_co_mutex_init(&s->send_mutex);
+    qemu_mutex_init(&s->requests_lock);
     qemu_co_queue_init(&s->free_sema);
+    qemu_co_mutex_init(&s->send_mutex);
     qemu_co_mutex_init(&s->receive_mutex);
 
     if (!yank_register_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name), errp)) {
@@ -2046,9 +2052,11 @@ static void nbd_cancel_in_flight(BlockDriverState *bs)
 
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



