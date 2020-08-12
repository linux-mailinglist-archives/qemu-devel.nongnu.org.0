Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C54E242991
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Aug 2020 14:44:18 +0200 (CEST)
Received: from localhost ([::1]:49024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5q77-0004qL-41
	for lists+qemu-devel@lfdr.de; Wed, 12 Aug 2020 08:44:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <2149675b195f2d9a1a4e3b966d45aba234def69b@lizzy.crudebyte.com>)
 id 1k5q5l-0003dd-2r
 for qemu-devel@nongnu.org; Wed, 12 Aug 2020 08:42:53 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:56371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <2149675b195f2d9a1a4e3b966d45aba234def69b@lizzy.crudebyte.com>)
 id 1k5q5j-0005LK-3Z
 for qemu-devel@nongnu.org; Wed, 12 Aug 2020 08:42:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=unQfnj6mpPoLDVHn4tXX/N0gZw0MtjfRUKRtvJv8mDw=; b=csLEt
 7qdw3ERfh9ujByDILLeJdsoCFwAmf6NAaYUbkhj5Jip3DIv5zm3sgkC1EUleCemVV5WH8xk4bG4F3
 +G1xr56XnQUs2R4iEPe9/Tcmpm8AEwj2+AijnM+iUOPyHotaq7oLGlKys9ciFY/3KHN9j1NRWyGmz
 I+qS6zXTFWlVG7ke/uKftk6wTCt/vaUEsmxVaRE+WvNrPVqXB57oqWjo+Ym8is9AgUidtBtiWyplf
 84PWigJuGmwbyslE8SzF5YkkoYy4wRZmD0lCK9aeI2078YVffsbNVYxJ9N9UHzNmXi+rBKwasF+d7
 JUO7sp3oj5MQY4J1vky2k8Lb2egPQ==;
Message-Id: <2149675b195f2d9a1a4e3b966d45aba234def69b.1597226797.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1597226797.git.qemu_oss@crudebyte.com>
References: <cover.1597226797.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Wed, 29 Jul 2020 10:12:33 +0200
Subject: [PULL 4/7] 9pfs: add new function v9fs_co_readdir_many()
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=2149675b195f2d9a1a4e3b966d45aba234def69b@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/12 08:16:56
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The newly added function v9fs_co_readdir_many() retrieves multiple
directory entries with a single fs driver request. It is intended to
replace uses of v9fs_co_readdir(), the latter only retrieves a
single directory entry per fs driver request instead.

The reason for this planned replacement is that for every fs driver
request the coroutine is dispatched from main I/O thread to a
background I/O thread and eventually dispatched back to main I/O
thread. Hopping between threads adds latency. So if a 9pfs Treaddir
request reads a large amount of directory entries, this currently
sums up to huge latencies of several hundred ms or even more. So
using v9fs_co_readdir_many() instead of v9fs_co_readdir() will
provide significant performance improvements.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Message-Id: <73dc827a12ef577ae7e644dcf34a5c0e443ab42f.1596012787.git.qemu_oss@crudebyte.com>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p.h    |  22 +++++++
 hw/9pfs/codir.c | 171 ++++++++++++++++++++++++++++++++++++++++++++++++
 hw/9pfs/coth.h  |   3 +
 3 files changed, 196 insertions(+)

diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
index 561774e843..93b7030edf 100644
--- a/hw/9pfs/9p.h
+++ b/hw/9pfs/9p.h
@@ -215,6 +215,28 @@ static inline void v9fs_readdir_init(V9fsDir *dir)
     qemu_co_mutex_init(&dir->readdir_mutex);
 }
 
+/**
+ * Type for 9p fs drivers' (a.k.a. 9p backends) result of readdir requests,
+ * which is a chained list of directory entries.
+ */
+typedef struct V9fsDirEnt {
+    /* mandatory (must not be NULL) information for all readdir requests */
+    struct dirent *dent;
+    /*
+     * optional (may be NULL): A full stat of each directory entry is just
+     * done if explicitly told to fs driver.
+     */
+    struct stat *st;
+    /*
+     * instead of an array, directory entries are always returned as
+     * chained list, that's because the amount of entries retrieved by fs
+     * drivers is dependent on the individual entries' name (since response
+     * messages are size limited), so the final amount cannot be estimated
+     * before hand
+     */
+    struct V9fsDirEnt *next;
+} V9fsDirEnt;
+
 /*
  * Filled by fs driver on open and other
  * calls.
diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
index 24e1955ab2..1f70a58df5 100644
--- a/hw/9pfs/codir.c
+++ b/hw/9pfs/codir.c
@@ -39,6 +39,10 @@ static int do_readdir(V9fsPDU *pdu, V9fsFidState *fidp, struct dirent **dent)
     return err;
 }
 
+/*
+ * TODO: This will be removed for performance reasons.
+ * Use v9fs_co_readdir_many() instead.
+ */
 int coroutine_fn v9fs_co_readdir(V9fsPDU *pdu, V9fsFidState *fidp,
                                  struct dirent **dent)
 {
@@ -53,6 +57,173 @@ int coroutine_fn v9fs_co_readdir(V9fsPDU *pdu, V9fsFidState *fidp,
     return err;
 }
 
+/*
+ * This is solely executed on a background IO thread.
+ *
+ * See v9fs_co_readdir_many() (as its only user) below for details.
+ */
+static int do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
+                           struct V9fsDirEnt **entries, off_t offset,
+                           int32_t maxsize, bool dostat)
+{
+    V9fsState *s = pdu->s;
+    V9fsString name;
+    int len, err = 0;
+    int32_t size = 0;
+    off_t saved_dir_pos;
+    struct dirent *dent;
+    struct V9fsDirEnt *e = NULL;
+    V9fsPath path;
+    struct stat stbuf;
+
+    *entries = NULL;
+    v9fs_path_init(&path);
+
+    /*
+     * TODO: Here should be a warn_report_once() if lock failed.
+     *
+     * With a good 9p client we should not get into concurrency here,
+     * because a good client would not use the same fid for concurrent
+     * requests. We do the lock here for safety reasons though. However
+     * the client would then suffer performance issues, so better log that
+     * issue here.
+     */
+    v9fs_readdir_lock(&fidp->fs.dir);
+
+    /* seek directory to requested initial position */
+    if (offset == 0) {
+        s->ops->rewinddir(&s->ctx, &fidp->fs);
+    } else {
+        s->ops->seekdir(&s->ctx, &fidp->fs, offset);
+    }
+
+    /* save the directory position */
+    saved_dir_pos = s->ops->telldir(&s->ctx, &fidp->fs);
+    if (saved_dir_pos < 0) {
+        err = saved_dir_pos;
+        goto out;
+    }
+
+    while (true) {
+        /* interrupt loop if request was cancelled by a Tflush request */
+        if (v9fs_request_cancelled(pdu)) {
+            err = -EINTR;
+            break;
+        }
+
+        /* get directory entry from fs driver */
+        err = do_readdir(pdu, fidp, &dent);
+        if (err || !dent) {
+            break;
+        }
+
+        /*
+         * stop this loop as soon as it would exceed the allowed maximum
+         * response message size for the directory entries collected so far,
+         * because anything beyond that size would need to be discarded by
+         * 9p controller (main thread / top half) anyway
+         */
+        v9fs_string_init(&name);
+        v9fs_string_sprintf(&name, "%s", dent->d_name);
+        len = v9fs_readdir_response_size(&name);
+        v9fs_string_free(&name);
+        if (size + len > maxsize) {
+            /* this is not an error case actually */
+            break;
+        }
+
+        /* append next node to result chain */
+        if (!e) {
+            *entries = e = g_malloc0(sizeof(V9fsDirEnt));
+        } else {
+            e = e->next = g_malloc0(sizeof(V9fsDirEnt));
+        }
+        e->dent = g_malloc0(sizeof(struct dirent));
+        memcpy(e->dent, dent, sizeof(struct dirent));
+
+        /* perform a full stat() for directory entry if requested by caller */
+        if (dostat) {
+            err = s->ops->name_to_path(
+                &s->ctx, &fidp->path, dent->d_name, &path
+            );
+            if (err < 0) {
+                err = -errno;
+                break;
+            }
+
+            err = s->ops->lstat(&s->ctx, &path, &stbuf);
+            if (err < 0) {
+                err = -errno;
+                break;
+            }
+
+            e->st = g_malloc0(sizeof(struct stat));
+            memcpy(e->st, &stbuf, sizeof(struct stat));
+        }
+
+        size += len;
+        saved_dir_pos = dent->d_off;
+    }
+
+    /* restore (last) saved position */
+    s->ops->seekdir(&s->ctx, &fidp->fs, saved_dir_pos);
+
+out:
+    v9fs_readdir_unlock(&fidp->fs.dir);
+    v9fs_path_free(&path);
+    if (err < 0) {
+        return err;
+    }
+    return size;
+}
+
+/**
+ * @brief Reads multiple directory entries in one rush.
+ *
+ * Retrieves the requested (max. amount of) directory entries from the fs
+ * driver. This function must only be called by the main IO thread (top half).
+ * Internally this function call will be dispatched to a background IO thread
+ * (bottom half) where it is eventually executed by the fs driver.
+ *
+ * @discussion Acquiring multiple directory entries in one rush from the fs
+ * driver, instead of retrieving each directory entry individually, is very
+ * beneficial from performance point of view. Because for every fs driver
+ * request latency is added, which in practice could lead to overall
+ * latencies of several hundred ms for reading all entries (of just a single
+ * directory) if every directory entry was individually requested from fs
+ * driver.
+ *
+ * @note You must @b ALWAYS call @c v9fs_free_dirents(entries) after calling
+ * v9fs_co_readdir_many(), both on success and on error cases of this
+ * function, to avoid memory leaks once @p entries are no longer needed.
+ *
+ * @param pdu - the causing 9p (T_readdir) client request
+ * @param fidp - already opened directory where readdir shall be performed on
+ * @param entries - output for directory entries (must not be NULL)
+ * @param offset - initial position inside the directory the function shall
+ *                 seek to before retrieving the directory entries
+ * @param maxsize - maximum result message body size (in bytes)
+ * @param dostat - whether a stat() should be performed and returned for
+ *                 each directory entry
+ * @returns resulting response message body size (in bytes) on success,
+ *          negative error code otherwise
+ */
+int coroutine_fn v9fs_co_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
+                                      struct V9fsDirEnt **entries,
+                                      off_t offset, int32_t maxsize,
+                                      bool dostat)
+{
+    int err = 0;
+
+    if (v9fs_request_cancelled(pdu)) {
+        return -EINTR;
+    }
+    v9fs_co_run_in_worker({
+        err = do_readdir_many(pdu, fidp, entries, offset, maxsize, dostat);
+    });
+    return err;
+}
+
 off_t v9fs_co_telldir(V9fsPDU *pdu, V9fsFidState *fidp)
 {
     off_t err;
diff --git a/hw/9pfs/coth.h b/hw/9pfs/coth.h
index c2cdc7a9ea..fd4a45bc7c 100644
--- a/hw/9pfs/coth.h
+++ b/hw/9pfs/coth.h
@@ -49,6 +49,9 @@
 void co_run_in_worker_bh(void *);
 int coroutine_fn v9fs_co_readlink(V9fsPDU *, V9fsPath *, V9fsString *);
 int coroutine_fn v9fs_co_readdir(V9fsPDU *, V9fsFidState *, struct dirent **);
+int coroutine_fn v9fs_co_readdir_many(V9fsPDU *, V9fsFidState *,
+                                      struct V9fsDirEnt **, off_t, int32_t,
+                                      bool);
 off_t coroutine_fn v9fs_co_telldir(V9fsPDU *, V9fsFidState *);
 void coroutine_fn v9fs_co_seekdir(V9fsPDU *, V9fsFidState *, off_t);
 void coroutine_fn v9fs_co_rewinddir(V9fsPDU *, V9fsFidState *);
-- 
2.20.1


