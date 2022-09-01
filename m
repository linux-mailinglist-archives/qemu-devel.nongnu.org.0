Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F190E5A9AE5
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 16:53:02 +0200 (CEST)
Received: from localhost ([::1]:48032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTlZ0-0007d3-2I
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 10:53:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1oTlTD-0001Bt-Dt
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 10:47:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1oTlGH-0006w5-Pl
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 10:33:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662042819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EItwtgzK73sR40MjoSlHF54DssM+VaeY49YDpn+1pto=;
 b=f3NekxpqECMqDw36R+wJ/yCoE3wp6jL9r8OEgr7GWI0sxO2pQX4QlBcsYWl5hFKuGxIprQ
 BVeCI1i3hNqfOTG+n8YZwu5AdfvbG+RDcdAK7YzQd0vZ23IuPl5tKyMdBqZAXjpUW+IUW6
 3obvePU8BQTncvZvdxvz8tQU5WCW080=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-k5W7oY7ZNeaZBtxRyK6o9A-1; Thu, 01 Sep 2022 10:32:31 -0400
X-MC-Unique: k5W7oY7ZNeaZBtxRyK6o9A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DEA8F3C10230;
 Thu,  1 Sep 2022 14:32:30 +0000 (UTC)
Received: from loop.redhat.com (unknown [10.35.206.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98823492C3B;
 Thu,  1 Sep 2022 14:32:29 +0000 (UTC)
From: Nir Soffer <nsoffer@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Nir Soffer <nsoffer@redhat.com>
Subject: [PATCH 3/3] qemu-img: Speed up checksum
Date: Thu,  1 Sep 2022 17:32:23 +0300
Message-Id: <20220901143223.201295-4-nsoffer@redhat.com>
In-Reply-To: <20220901143223.201295-1-nsoffer@redhat.com>
References: <20220901143223.201295-1-nsoffer@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add coroutine based loop inspired by `qemu-img convert` design.

Changes compared to `qemu-img convert`:

- State for the entire image is kept in ImgChecksumState

- State for single worker coroutine is kept in ImgChecksumworker.

- "Writes" are always in-order, ensured using a queue.

- Calling block status once per image extent, when the current extent is
  consumed by the workers.

- Using 1m buffer size - testings shows that this gives best read
  performance both with buffered and direct I/O.

- Number of coroutines is not configurable. Testing does not show
  improvement when using more than 8 coroutines.

- Progress include entire image, not only the allocated state.

Comparing to the simple read loop shows that this version is up to 4.67
times faster when computing a checksum for an image full of zeroes. For
real images it is 1.59 times faster with direct I/O, and with buffered
I/O there is no difference.

Test results on Dell PowerEdge R640 in a CentOS Stream 9 container:

| image    | size | i/o       | before         | after          | change |
|----------|------|-----------|----------------|----------------|--------|
| zero [1] |   6g | buffered  | 1.600s ±0.014s | 0.342s ±0.016s |  x4.67 |
| zero     |   6g | direct    | 4.684s ±0.093s | 2.211s ±0.009s |  x2.12 |
| real [2] |   6g | buffered  | 1.841s ±0.075s | 1.806s ±0.036s |  x1.02 |
| real     |   6g | direct    | 3.094s ±0.079s | 1.947s ±0.017s |  x1.59 |
| nbd  [3] |   6g | buffered  | 2.455s ±0.183s | 1.808s ±0.016s |  x1.36 |
| nbd      |   6g | direct    | 3.540s ±0.020s | 1.749s ±0.018s |  x2.02 |

[1] raw image full of zeroes
[2] raw fedora 35 image with additional random data, 50% full
[3] image [2] exported by qemu-nbd via unix socket

Signed-off-by: Nir Soffer <nsoffer@redhat.com>
---
 qemu-img.c | 343 +++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 270 insertions(+), 73 deletions(-)

diff --git a/qemu-img.c b/qemu-img.c
index 7edcfe4bc8..bfa8e2862f 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -1613,48 +1613,288 @@ out:
     qemu_vfree(buf2);
     blk_unref(blk2);
 out2:
     blk_unref(blk1);
 out3:
     qemu_progress_end();
     return ret;
 }
 
 #ifdef CONFIG_BLKHASH
+
+#define CHECKSUM_COROUTINES 8
+#define CHECKSUM_BUF_SIZE (1 * MiB)
+#define CHECKSUM_ZERO_SIZE MIN(16 * GiB, SIZE_MAX)
+
+typedef struct ImgChecksumState ImgChecksumState;
+
+typedef struct ImgChecksumWorker {
+    QTAILQ_ENTRY(ImgChecksumWorker) entry;
+    ImgChecksumState *state;
+    Coroutine *co;
+    uint8_t *buf;
+
+    /* The current chunk. */
+    int64_t offset;
+    int64_t length;
+    bool zero;
+
+    /* Always true for zero extent, false for data extent. Set to true
+     * when reading the chunk completes. */
+    bool ready;
+} ImgChecksumWorker;
+
+struct ImgChecksumState {
+    const char *filename;
+    BlockBackend *blk;
+    BlockDriverState *bs;
+    int64_t total_size;
+
+    /* Current extent, modified in checksum_co_next. */
+    int64_t offset;
+    int64_t length;
+    bool zero;
+
+    int running_coroutines;
+    CoMutex lock;
+    ImgChecksumWorker workers[CHECKSUM_COROUTINES];
+
+    /* Ensure in-order updates. Update are scheduled at the tail of the
+     * queue and processed from the head of the queue when a worker is
+     * ready. */
+    QTAILQ_HEAD(, ImgChecksumWorker) update_queue;
+
+    struct blkhash *hash;
+    int ret;
+};
+
+static int checksum_block_status(ImgChecksumState *s)
+{
+    int64_t length;
+    int status;
+
+    /* Must be called when current extent is consumed. */
+    assert(s->length == 0);
+
+    status = bdrv_block_status_above(s->bs, NULL, s->offset,
+                                     s->total_size - s->offset, &length, NULL,
+                                     NULL);
+    if (status < 0) {
+        error_report("Error checking status at offset %" PRId64 " for %s",
+                     s->offset, s->filename);
+        s->ret = status;
+        return -1;
+    }
+
+    assert(length > 0);
+
+    s->length = length;
+    s->zero = !!(status & BDRV_BLOCK_ZERO);
+
+    return 0;
+}
+
+/**
+ * Grab the next chunk from the current extent, getting the next extent if
+ * needed, and schecule the next update at the end fo the update queue.
+ *
+ * Retrun true if the worker has work to do, false if the worker has
+ * finished or there was an error getting the next extent.
+ */
+static coroutine_fn bool checksum_co_next(ImgChecksumWorker *w)
+{
+    ImgChecksumState *s = w->state;
+
+    qemu_co_mutex_lock(&s->lock);
+
+    if (s->offset == s->total_size || s->ret != -EINPROGRESS) {
+        qemu_co_mutex_unlock(&s->lock);
+        return false;
+    }
+
+    if (s->length == 0 && checksum_block_status(s)) {
+        qemu_co_mutex_unlock(&s->lock);
+        return false;
+    }
+
+    /* Grab one chunk from current extent. */
+    w->offset = s->offset;
+    w->length = MIN(s->length,
+                    s->zero ?  CHECKSUM_ZERO_SIZE : CHECKSUM_BUF_SIZE);
+    w->zero = s->zero;
+    w->ready = s->zero;
+
+    /* Advance state to the next chunk. */
+    s->offset += w->length;
+    s->length -= w->length;
+
+    /* Schedule this chunk update. */
+    QTAILQ_INSERT_TAIL(&s->update_queue, w, entry);
+
+    qemu_co_mutex_unlock(&s->lock);
+
+    return true;
+}
+
+/* Wait until this chunk is in the head of the update queue. */
+static void coroutine_fn checksum_co_wait_for_update(ImgChecksumWorker *w)
+{
+    ImgChecksumState *s = w->state;
+
+    /* Must be called only when we are ready to update the hash. */
+    assert(w->ready);
+
+    while (QTAILQ_FIRST(&s->update_queue) != w) {
+        qemu_coroutine_yield();
+    }
+
+    QTAILQ_REMOVE(&s->update_queue, w, entry);
+}
+
+/* Enter the next worker coroutine if the worker is ready. */
+static void coroutine_fn checksum_co_enter_next(ImgChecksumWorker *w)
+{
+    ImgChecksumState *s = w->state;
+    ImgChecksumWorker *next;
+
+    if (!QTAILQ_EMPTY(&s->update_queue)) {
+        next = QTAILQ_FIRST(&s->update_queue);
+        if (next->ready)
+            qemu_coroutine_enter(next->co);
+    }
+}
+
+static int coroutine_fn checksum_co_read(ImgChecksumWorker *w)
+{
+    ImgChecksumState *s = w->state;
+    int err;
+
+    err = blk_co_pread(s->blk, w->offset, w->length, w->buf, 0);
+    if (err < 0) {
+        error_report("Error reading at offset %" PRId64 " of %s: %s",
+                     w->offset, s->filename, strerror(-err));
+        /* Unschedule this chunk. */
+        QTAILQ_REMOVE(&s->update_queue, w, entry);
+        s->ret = err;
+        return -1;
+    }
+
+    w->ready = true;
+
+    return 0;
+}
+
+static int checksum_update_hash(ImgChecksumWorker *w)
+{
+    ImgChecksumState *s = w->state;
+    int err;
+
+    if (w->zero) {
+        err = blkhash_zero(s->hash, w->length);
+        if (err) {
+            error_report("Error zeroing hash at offset %" PRId64 " of %s: %s",
+                         w->offset, s->filename, strerror(err));
+            s->ret = -err;
+            return -1;
+        }
+    } else {
+        err = blkhash_update(s->hash, w->buf, w->length);
+        if (err) {
+            error_report("Error updating hash at offset %" PRId64 " of %s: %s",
+                         w->offset, s->filename, strerror(err));
+            s->ret = -err;
+            return -1;
+        }
+    }
+
+    return 0;
+}
+
+static void coroutine_fn checksum_co_loop(void *opaque)
+{
+    ImgChecksumWorker *w = opaque;
+    ImgChecksumState *s = w->state;
+
+    s->running_coroutines++;
+    w->buf = blk_blockalign(s->blk, CHECKSUM_BUF_SIZE);
+
+    while (checksum_co_next(w)) {
+        if (!w->zero && checksum_co_read(w)) {
+            break;
+        }
+        checksum_co_wait_for_update(w);
+        if (s->ret == -EINPROGRESS) {
+            if (checksum_update_hash(w)) {
+                break;
+            }
+            qemu_progress_print(((float) w->length / s->total_size) * 100, 100);
+        }
+        checksum_co_enter_next(w);
+    }
+
+    qemu_vfree(w->buf);
+    w->co = NULL;
+    s->running_coroutines--;
+
+    if (s->running_coroutines == 0 && s->ret == -EINPROGRESS) {
+        /* the checksum job finished successfully */
+        s->ret = 0;
+    }
+}
+
+static int checksum_loop(ImgChecksumState *s)
+{
+    int i;
+
+    s->ret = -EINPROGRESS;
+
+    qemu_co_mutex_init(&s->lock);
+    QTAILQ_INIT(&s->update_queue);
+
+    for (i = 0; i < CHECKSUM_COROUTINES; i++) {
+        ImgChecksumWorker *w = &s->workers[i];
+        w->state = s;
+        w->co = qemu_coroutine_create(checksum_co_loop, w);
+        qemu_coroutine_enter(w->co);
+    }
+
+    while (s->running_coroutines) {
+        main_loop_wait(false);
+    }
+
+    return s->ret;
+}
+
 /*
  * Compute image checksum.
  */
 static int img_checksum(int argc, char **argv)
 {
     const char *digest_name = "sha256";
     const size_t block_size = 64 * KiB;
 
     const char *format = NULL;
     const char *cache = BDRV_DEFAULT_CACHE;
-    const char *filename;
-    BlockBackend *blk;
-    BlockDriverState *bs;
-    uint8_t *buf = NULL;
-    int64_t pnum;
     bool progress = false;
+    bool image_opts = false;
+
     int flags = 0;
-    bool writethrough;
-    int64_t total_size;
-    int64_t offset = 0;
+    bool writethrough = false;
     int c;
-    bool image_opts = false;
-    struct blkhash *h = NULL;
-    unsigned char digest[64];
-    unsigned int digest_len;
+
     int ret = 1;
     int err;
 
+    ImgChecksumState s = {0};
+    unsigned char digest[64];
+    unsigned int digest_len;
+
     for (;;) {
         static const struct option long_options[] = {
             {"help", no_argument, 0, 'h'},
             {"object", required_argument, 0, OPTION_OBJECT},
             {"image-opts", no_argument, 0, OPTION_IMAGE_OPTS},
             {0, 0, 0, 0}
         };
         c = getopt_long(argc, argv, ":hf:T:p",
                         long_options, NULL);
         if (c == -1) {
@@ -1697,119 +1937,76 @@ static int img_checksum(int argc, char **argv)
         case OPTION_IMAGE_OPTS:
             image_opts = true;
             break;
         }
     }
 
     if (optind != argc - 1) {
         error_exit("Expecting image file name");
     }
 
-    filename = argv[optind++];
+    s.filename = argv[optind++];
 
     err = bdrv_parse_cache_mode(cache, &flags, &writethrough);
     if (err < 0) {
         error_report("Invalid source cache option: %s", cache);
         return ret;
     }
 
-    blk = img_open(image_opts, filename, format, flags, writethrough, false,
-                   false);
-    if (!blk) {
+    s.blk = img_open(image_opts, s.filename, format, flags, writethrough,
+                     false, false);
+    if (!s.blk) {
         return ret;
     }
 
     /* Initialize before using goto out. */
     qemu_progress_init(progress, 2.0);
 
-    bs = blk_bs(blk);
-    buf = blk_blockalign(blk, IO_BUF_SIZE);
+    s.bs = blk_bs(s.blk);
 
-    total_size = blk_getlength(blk);
-    if (total_size < 0) {
+    s.total_size = blk_getlength(s.blk);
+    if (s.total_size < 0) {
         error_report("Can't get size of %s: %s",
-                     filename, strerror(-total_size));
+                     s.filename, strerror(-s.total_size));
         goto out;
     }
 
-    h = blkhash_new(block_size, digest_name);
-    if (!h) {
+    s.hash = blkhash_new(block_size, digest_name);
+    if (!s.hash) {
         error_report("Can't create blkhash: %s", strerror(errno));
         goto out;
     }
 
     qemu_progress_print(0, 100);
 
-    while (offset < total_size) {
-        int status;
-        int64_t chunk;
-
-        status = bdrv_block_status_above(bs, NULL, offset,
-                                         total_size - offset, &pnum, NULL,
-                                         NULL);
-        if (status < 0) {
-            error_report("Error checking status at offset %" PRId64 " for %s",
-                         offset, filename);
-            goto out;
-        }
-
-        assert(pnum);
-        chunk = pnum;
-
-        if (status & BDRV_BLOCK_ZERO) {
-            chunk = MIN(chunk, SIZE_MAX);
-            err = blkhash_zero(h, chunk);
-            if (err) {
-                error_report("Error zeroing hash at offset %" PRId64
-                             " of %s: %s",
-                             offset, filename, strerror(err));
-                goto out;
-            }
-        } else {
-            chunk = MIN(chunk, IO_BUF_SIZE);
-            err = blk_pread(blk, offset, chunk, buf, 0);
-            if (err < 0) {
-                error_report("Error reading at offset %" PRId64 " of %s: %s",
-                             offset, filename, strerror(-err));
-                goto out;
-            }
-            err = blkhash_update(h, buf, chunk);
-            if (err) {
-                error_report("Error updating hash at offset %" PRId64
-                             " of %s: %s",
-                             offset, filename, strerror(err));
-                goto out;
-            }
-        }
-
-        offset += chunk;
-        qemu_progress_print(((float) chunk / total_size) * 100, 100);
+    err = checksum_loop(&s);
+    if (err) {
+        goto out;
     }
 
-    err = blkhash_final(h, digest, &digest_len);
+    err = blkhash_final(s.hash, digest, &digest_len);
     if (err) {
         error_report("Error finalizing hash of %s: %s",
-                     filename, strerror(err));
+                     s.filename, strerror(err));
         goto out;
     }
 
     for (unsigned i = 0; i < digest_len; i++) {
         printf("%02x", digest[i]);
     }
-    printf("  %s%s", filename, progress ? "" : "\n");
+    printf("  %s%s", s.filename, progress ? "" : "\n");
 
     ret = 0;
 
 out:
-    blkhash_free(h);
-    qemu_vfree(buf);
-    blk_unref(blk);
+    blkhash_free(s.hash);
+    blk_unref(s.blk);
     qemu_progress_end();
 
     return ret;
 }
 #endif /* CONFIG_BLKHASH */
 
 /* Convenience wrapper around qmp_block_dirty_bitmap_merge */
 static void do_dirty_bitmap_merge(const char *dst_node, const char *dst_name,
                                   const char *src_node, const char *src_name,
                                   Error **errp)
-- 
2.37.2


