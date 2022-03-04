Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 216C54CD831
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:44:05 +0100 (CET)
Received: from localhost ([::1]:39334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQA68-0008SX-6W
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:44:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nQ9ra-00060s-Di
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:29:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nQ9rY-00056e-3b
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:29:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646407739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jt+POAXQSSXabPGYImyGXTJurtqjiS1J9CivSI696j0=;
 b=WYDXIYTIrvFYfk5KfBp26LeQISA45Ditj1WqgDGcsH9yUZWlFW7huSQkrkB6UQyJ6bdNxw
 DCPZehcEXJdL7F+lWT6BVhS4aEfNSYetG35cjY4W9tG3WOTDrB7BxFP1O9njVLngBYaven
 ivKkggxz8G8n51EQnIh6TtDCw6FWKPc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-548-vyCpHsT1N3i8MGnCbleyUQ-1; Fri, 04 Mar 2022 10:28:56 -0500
X-MC-Unique: vyCpHsT1N3i8MGnCbleyUQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85156501E0;
 Fri,  4 Mar 2022 15:28:54 +0000 (UTC)
Received: from localhost (unknown [10.39.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F4B1303DF;
 Fri,  4 Mar 2022 15:28:15 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] Replace qemu_gettimeofday() with g_get_real_time()
Date: Fri,  4 Mar 2022 19:27:03 +0400
Message-Id: <20220304152704.3466036-4-marcandre.lureau@redhat.com>
In-Reply-To: <20220304152704.3466036-1-marcandre.lureau@redhat.com>
References: <20220304152704.3466036-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Marek Vasut <marex@denx.de>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

GLib g_get_real_time() is an alternative to gettimeofday().

For semihosting, a few bits are lost on POSIX host, but this shouldn't
be a big concern.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 blockdev.c                 |  8 ++++----
 hw/rtc/m41t80.c            |  6 +++---
 hw/virtio/virtio-balloon.c |  9 +--------
 qapi/qmp-event.c           | 12 +++++-------
 qemu-img.c                 |  8 ++++----
 qga/commands-posix.c       | 11 +----------
 target/m68k/m68k-semi.c    | 22 ++++++++++------------
 target/nios2/nios2-semi.c  | 24 +++++++++++-------------
 8 files changed, 39 insertions(+), 61 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 42e098b458b1..4b07dbfbdefc 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1235,7 +1235,7 @@ static void internal_snapshot_prepare(BlkActionState *common,
     BlockDriverState *bs;
     QEMUSnapshotInfo old_sn, *sn;
     bool ret;
-    qemu_timeval tv;
+    int64_t rt;
     BlockdevSnapshotInternal *internal;
     InternalSnapshotState *state;
     AioContext *aio_context;
@@ -1305,9 +1305,9 @@ static void internal_snapshot_prepare(BlkActionState *common,
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
index a00971a67e1c..e045c864bb44 100644
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
index e6c1b0aa46fe..b1bada84cecc 100644
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
index 19d3cd003833..025716b3ec37 100644
--- a/qapi/qmp-event.c
+++ b/qapi/qmp-event.c
@@ -20,15 +20,13 @@
 
 static void timestamp_put(QDict *qdict)
 {
-    int err;
     QDict *ts;
-    qemu_timeval tv;
+    int64_t rt = g_get_real_time();
 
-    err = qemu_gettimeofday(&tv);
-    /* Put -1 to indicate failure of getting host time */
-    ts = qdict_from_jsonf_nofail("{ 'seconds': %lld, 'microseconds': %lld }",
-                                 err < 0 ? -1LL : (long long)tv.tv_sec,
-                                 err < 0 ? -1LL : (long long)tv.tv_usec);
+    ts = qdict_from_jsonf_nofail("{ 'seconds': %" G_GINT64_FORMAT
+                                 ", 'microseconds': %" G_GINT64_FORMAT "}",
+                                 rt / G_USEC_PER_SEC,
+                                 rt % G_USEC_PER_SEC);
     qdict_put(qdict, "timestamp", ts);
 }
 
diff --git a/qemu-img.c b/qemu-img.c
index 6fe2466032f9..e26773909684 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -3304,11 +3304,11 @@ static int img_snapshot(int argc, char **argv)
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
@@ -3405,9 +3405,9 @@ static int img_snapshot(int argc, char **argv)
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
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 75dbaab68ea9..3311a4ca0167 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -138,16 +138,7 @@ void qmp_guest_shutdown(bool has_mode, const char *mode, Error **errp)
 
 int64_t qmp_guest_get_time(Error **errp)
 {
-   int ret;
-   qemu_timeval tq;
-
-   ret = qemu_gettimeofday(&tq);
-   if (ret < 0) {
-       error_setg_errno(errp, errno, "Failed to get time");
-       return -1;
-   }
-
-   return tq.tv_sec * 1000000000LL + tq.tv_usec * 1000;
+    return g_get_real_time();
 }
 
 void qmp_guest_set_time(bool has_time, int64_t time_ns, Error **errp)
diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
index c5c164e096c8..54f735743165 100644
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
+            if (!(p = lock_user(VERIFY_WRITE,
+                                arg0, sizeof(struct gdb_timeval), 0))) {
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
index 5a7ad0c7108d..4600bf0a39d9 100644
--- a/target/nios2/nios2-semi.c
+++ b/target/nios2/nios2-semi.c
@@ -400,20 +400,18 @@ void do_nios2_semihosting(CPUNios2State *env)
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
+            p = lock_user(VERIFY_WRITE, arg0, sizeof(struct gdb_timeval),
+                          0);
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
2.35.1.273.ge6ebfd0e8cbb


