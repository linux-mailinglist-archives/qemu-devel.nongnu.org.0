Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BB4506412
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 07:56:23 +0200 (CEST)
Received: from localhost ([::1]:34824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nggqc-000465-Uq
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 01:56:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggll-00014G-0r
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:21 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:43718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngglf-0004NC-VS
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:17 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 n40-20020a05600c3ba800b0038ff1939b16so758269wms.2
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t+3LdBJV/rZeTy+qN4yAh7U4LPW5rzRkkDNQUskmZd8=;
 b=CUmuXuzsuQtMVg7gAhaID5sfGi+mF3CWvtKkBZQXeccQV8U8NNxxDNO+lEGqFyX2uo
 olOxyzDdxN4PlcaIoSHxnTqf9CVCgYAYruALaIU5nXrKlznm83JYIZgF2xCeEXjLooMO
 OdeLJ9s2429+ReBn++3z6mEaSvcU9TvBEUZHGKW4XPS5MmvHAHezYLngxQCp7wUZmE4y
 RVPya4WR9DVRxLPS5acNlkHQIYhXgbTzmR1xzg91deWMSxLF1g/SsoMOxjTrwEof67Mq
 T6EySpkp8LuFgXj2mOUWAlt/gs7UGQZQpw47HNDvhjRV9ycqSdW/+u0JWh7q/MuKB5FP
 45gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=t+3LdBJV/rZeTy+qN4yAh7U4LPW5rzRkkDNQUskmZd8=;
 b=sm6lJJDUMDYV9JSbL1j95HC1rzxngx6+gOql4qHLMLNPeV5nLbdjrBBLR+6Fn/kfTZ
 KZ3qRgZPpzlepLYJwikiM1VGGH9OlPNG1vLj/eNTcw3La4qU+q0UcKx/1MZcvN/vwjyO
 WI89eU5I3xP/kMndfCEsTjIl1fWBVHfOkg75Yw6xdFJEhpLDA2TIx2FCIzQXEUpUq6ys
 xVE0gCEP9F1LLuMg1nYR3Xtfov2QkQsHSXqNcPdDiL0dGrkDfpsaezgyd1wPfTtre1D7
 iCPsg7yYxfrwJbYo5JgA9kvoSyy9TCKBeT1De/VHVYuyJ5YtFnuHE+jAcwdo3ID9Ljoc
 oGbA==
X-Gm-Message-State: AOAM532LRNaG4Fsn5PDtkMJiiF42upM0BPLgvl91YUmT0cCWbfxrA6d7
 iG8qbLq0VtPlOqg1ED9d9M5LymXMPcG7gA==
X-Google-Smtp-Source: ABdhPJynoheNT/yq9K3ovgIQ3vFUVB2o5MSQwF84989QNH3qeL+/Ziohfmyi0zw2BJKaoG+YNWFgOw==
X-Received: by 2002:a1c:cc01:0:b0:37b:dcc8:7dfd with SMTP id
 h1-20020a1ccc01000000b0037bdcc87dfdmr14418074wmb.134.1650347474548; 
 Mon, 18 Apr 2022 22:51:14 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/53] Replace qemu_gettimeofday() with g_get_real_time()
Date: Tue, 19 Apr 2022 07:50:20 +0200
Message-Id: <20220419055109.142788-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

GLib g_get_real_time() is an alternative to gettimeofday() which allows
to simplify our code.

For semihosting, a few bits are lost on POSIX host, but this shouldn't
be a big concern.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220307070401.171986-5-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 blockdev.c                 |  8 ++++----
 hw/rtc/m41t80.c            |  6 +++---
 hw/virtio/virtio-balloon.c |  9 +--------
 qapi/qmp-event.c           |  9 +++------
 qemu-img.c                 |  8 ++++----
 target/m68k/m68k-semi.c    | 22 ++++++++++------------
 target/nios2/nios2-semi.c  | 23 ++++++++++-------------
 7 files changed, 35 insertions(+), 50 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index e46e831212..9230888e34 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1258,7 +1258,7 @@ static void internal_snapshot_prepare(BlkActionState *common,
     BlockDriverState *bs;
     QEMUSnapshotInfo old_sn, *sn;
     bool ret;
-    qemu_timeval tv;
+    int64_t rt;
     BlockdevSnapshotInternal *internal;
     InternalSnapshotState *state;
     AioContext *aio_context;
@@ -1328,9 +1328,9 @@ static void internal_snapshot_prepare(BlkActionState *common,
     /* 3. take the snapshot */
     sn = &state->sn;
     pstrcpy(sn->name, sizeof(sn->name), name);
-    qemu_gettimeofday(&tv);
-    sn->date_sec = tv.tv_sec;
-    sn->date_nsec = tv.tv_usec * 1000;
+    rt = g_get_real_time();
+    sn->date_sec = rt / G_USEC_PER_SEC;
+    sn->date_nsec = (rt % G_USEC_PER_SEC) * 1000;
     sn->vm_clock_nsec = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
     if (replay_mode != REPLAY_MODE_NONE) {
         sn->icount = replay_get_current_icount();
diff --git a/hw/rtc/m41t80.c b/hw/rtc/m41t80.c
index a00971a67e..e045c864bb 100644
--- a/hw/rtc/m41t80.c
+++ b/hw/rtc/m41t80.c
@@ -47,7 +47,7 @@ static uint8_t m41t80_recv(I2CSlave *i2c)
 {
     M41t80State *s = M41T80(i2c);
     struct tm now;
-    qemu_timeval tv;
+    int64_t rt;
 
     if (s->addr < 0) {
         s->addr = 0;
@@ -57,8 +57,8 @@ static uint8_t m41t80_recv(I2CSlave *i2c)
     }
     switch (s->addr++) {
     case 0:
-        qemu_gettimeofday(&tv);
-        return to_bcd(tv.tv_usec / 10000);
+        rt = g_get_real_time();
+        return to_bcd((rt % G_USEC_PER_SEC) / 10000);
     case 1:
         return to_bcd(now.tm_sec);
     case 2:
diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 163d244eb4..8f1b38ef5c 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -452,7 +452,6 @@ static void virtio_balloon_receive_stats(VirtIODevice *vdev, VirtQueue *vq)
     VirtQueueElement *elem;
     VirtIOBalloonStat stat;
     size_t offset = 0;
-    qemu_timeval tv;
 
     elem = virtqueue_pop(vq, sizeof(VirtQueueElement));
     if (!elem) {
@@ -484,13 +483,7 @@ static void virtio_balloon_receive_stats(VirtIODevice *vdev, VirtQueue *vq)
             s->stats[tag] = val;
     }
     s->stats_vq_offset = offset;
-
-    if (qemu_gettimeofday(&tv) < 0) {
-        warn_report("%s: failed to get time of day", __func__);
-        goto out;
-    }
-
-    s->stats_last_update = tv.tv_sec;
+    s->stats_last_update = g_get_real_time() / G_USEC_PER_SEC;
 
 out:
     if (balloon_stats_enabled(s)) {
diff --git a/qapi/qmp-event.c b/qapi/qmp-event.c
index 19d3cd0038..0fe0d0a5a6 100644
--- a/qapi/qmp-event.c
+++ b/qapi/qmp-event.c
@@ -20,15 +20,12 @@
 
 static void timestamp_put(QDict *qdict)
 {
-    int err;
     QDict *ts;
-    qemu_timeval tv;
+    int64_t rt = g_get_real_time();
 
-    err = qemu_gettimeofday(&tv);
-    /* Put -1 to indicate failure of getting host time */
     ts = qdict_from_jsonf_nofail("{ 'seconds': %lld, 'microseconds': %lld }",
-                                 err < 0 ? -1LL : (long long)tv.tv_sec,
-                                 err < 0 ? -1LL : (long long)tv.tv_usec);
+                                 (long long)rt / G_USEC_PER_SEC,
+                                 (long long)rt % G_USEC_PER_SEC);
     qdict_put(qdict, "timestamp", ts);
 }
 
diff --git a/qemu-img.c b/qemu-img.c
index 1caddfb23a..cf63db7655 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -3305,11 +3305,11 @@ static int img_snapshot(int argc, char **argv)
     char *filename, *snapshot_name = NULL;
     int c, ret = 0, bdrv_oflags;
     int action = 0;
-    qemu_timeval tv;
     bool quiet = false;
     Error *err = NULL;
     bool image_opts = false;
     bool force_share = false;
+    int64_t rt;
 
     bdrv_oflags = BDRV_O_RDWR;
     /* Parse commandline parameters */
@@ -3406,9 +3406,9 @@ static int img_snapshot(int argc, char **argv)
         memset(&sn, 0, sizeof(sn));
         pstrcpy(sn.name, sizeof(sn.name), snapshot_name);
 
-        qemu_gettimeofday(&tv);
-        sn.date_sec = tv.tv_sec;
-        sn.date_nsec = tv.tv_usec * 1000;
+        rt = g_get_real_time();
+        sn.date_sec = rt / G_USEC_PER_SEC;
+        sn.date_nsec = (rt % G_USEC_PER_SEC) * 1000;
 
         ret = bdrv_snapshot_create(bs, &sn);
         if (ret) {
diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
index c5c164e096..37343d47e2 100644
--- a/target/m68k/m68k-semi.c
+++ b/target/m68k/m68k-semi.c
@@ -378,19 +378,17 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
                            arg0, arg1);
             return;
         } else {
-            qemu_timeval tv;
             struct gdb_timeval *p;
-            result = qemu_gettimeofday(&tv);
-            if (result == 0) {
-                if (!(p = lock_user(VERIFY_WRITE,
-                                    arg0, sizeof(struct gdb_timeval), 0))) {
-                    /* FIXME - check error code? */
-                    result = -1;
-                } else {
-                    p->tv_sec = cpu_to_be32(tv.tv_sec);
-                    p->tv_usec = cpu_to_be64(tv.tv_usec);
-                    unlock_user(p, arg0, sizeof(struct gdb_timeval));
-                }
+            int64_t rt = g_get_real_time();
+            p = lock_user(VERIFY_WRITE, arg0, sizeof(struct gdb_timeval), 0);
+            if (!p) {
+                /* FIXME - check error code? */
+                result = -1;
+            } else {
+                result = 0;
+                p->tv_sec = cpu_to_be32(rt / G_USEC_PER_SEC);
+                p->tv_usec = cpu_to_be64(rt % G_USEC_PER_SEC);
+                unlock_user(p, arg0, sizeof(struct gdb_timeval));
             }
         }
         break;
diff --git a/target/nios2/nios2-semi.c b/target/nios2/nios2-semi.c
index 5a7ad0c710..3decf6924c 100644
--- a/target/nios2/nios2-semi.c
+++ b/target/nios2/nios2-semi.c
@@ -400,20 +400,17 @@ void do_nios2_semihosting(CPUNios2State *env)
                            arg0, 0);
             return;
         } else {
-            qemu_timeval tv;
             struct gdb_timeval *p;
-            result = qemu_gettimeofday(&tv);
-            if (result == 0) {
-                p = lock_user(VERIFY_WRITE, arg0, sizeof(struct gdb_timeval),
-                              0);
-                if (!p) {
-                    result = -1;
-                    errno = EFAULT;
-                } else {
-                    p->tv_sec = cpu_to_be32(tv.tv_sec);
-                    p->tv_usec = cpu_to_be64(tv.tv_usec);
-                    unlock_user(p, arg0, sizeof(struct gdb_timeval));
-                }
+            int64_t rt = g_get_real_time();
+            p = lock_user(VERIFY_WRITE, arg0, sizeof(struct gdb_timeval), 0);
+            if (!p) {
+                result = -1;
+                errno = EFAULT;
+            } else {
+                result = 0;
+                p->tv_sec = cpu_to_be32(rt / G_USEC_PER_SEC);
+                p->tv_usec = cpu_to_be64(rt % G_USEC_PER_SEC);
+                unlock_user(p, arg0, sizeof(struct gdb_timeval));
             }
         }
         break;
-- 
2.35.1



