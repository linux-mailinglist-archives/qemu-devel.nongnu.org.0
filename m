Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2C049B6BC
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 15:49:55 +0100 (CET)
Received: from localhost ([::1]:48612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCN8s-0007Yk-4R
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 09:49:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nCMZ2-0002X0-3U
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 09:12:52 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:48750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nCMZ0-0004ay-Bu
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 09:12:51 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199-9nXbbwY8MAKUeyUgvXp-HA-1; Tue, 25 Jan 2022 09:12:46 -0500
X-MC-Unique: 9nXbbwY8MAKUeyUgvXp-HA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFF99814702;
 Tue, 25 Jan 2022 14:12:45 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.192.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44E9D84A0F;
 Tue, 25 Jan 2022 14:12:37 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/2] virtiofsd: Add support for FUSE_SYNCFS request
Date: Tue, 25 Jan 2022 15:12:12 +0100
Message-Id: <20220125141213.361930-3-groug@kaod.org>
In-Reply-To: <20220125141213.361930-1-groug@kaod.org>
References: <20220125141213.361930-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Sebastian Hasler <sebastian.hasler@stuvus.uni-stuttgart.de>,
 Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Honor the expected behavior of syncfs() to synchronously flush all data
and metadata on linux systems.

If virtiofsd is started with '-o announce_submounts', the client is
expected to send a FUSE_SYNCFS request for each individual submount.
In this case, we just create a new file descriptor on the submount
inode with lo_inode_open(), call syncfs() on it and close it. The
intermediary file is needed because O_PATH descriptors aren't
backed by an actual file and syncfs() would fail with EBADF.

If virtiofsd is started without '-o announce_submounts', the client
only sends a single FUSE_SYNCFS request, for the root inode. In this
case, we need to loop on all known submounts to sync them. We cannot
call syncfs() with the lo->mutex held since it could stall virtiofsd
for an unbounded time : let's generate the list of inodes with the
mutex held, drop the mutex and then loop on the temporary list. A
reference must be taken on each inode to ensure it doesn't go away
when the mutex is dropped.

Note that syncfs() might suffer from a time penalty if the submounts
are being hammered by some unrelated workload on the host. The only
solution to prevent that is to avoid shared mounts.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 tools/virtiofsd/fuse_lowlevel.c       | 11 +++
 tools/virtiofsd/fuse_lowlevel.h       | 13 ++++
 tools/virtiofsd/passthrough_ll.c      | 98 +++++++++++++++++++++++++++
 tools/virtiofsd/passthrough_seccomp.c |  1 +
 4 files changed, 123 insertions(+)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowleve=
l.c
index e4679c73abc2..e02d8b25a5f6 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -1876,6 +1876,16 @@ static void do_lseek(fuse_req_t req, fuse_ino_t node=
id,
     }
 }
=20
+static void do_syncfs(fuse_req_t req, fuse_ino_t nodeid,
+                      struct fuse_mbuf_iter *iter)
+{
+    if (req->se->op.syncfs) {
+        req->se->op.syncfs(req, nodeid);
+    } else {
+        fuse_reply_err(req, ENOSYS);
+    }
+}
+
 static void do_init(fuse_req_t req, fuse_ino_t nodeid,
                     struct fuse_mbuf_iter *iter)
 {
@@ -2280,6 +2290,7 @@ static struct {
     [FUSE_RENAME2] =3D { do_rename2, "RENAME2" },
     [FUSE_COPY_FILE_RANGE] =3D { do_copy_file_range, "COPY_FILE_RANGE" },
     [FUSE_LSEEK] =3D { do_lseek, "LSEEK" },
+    [FUSE_SYNCFS] =3D { do_syncfs, "SYNCFS" },
 };
=20
 #define FUSE_MAXOP (sizeof(fuse_ll_ops) / sizeof(fuse_ll_ops[0]))
diff --git a/tools/virtiofsd/fuse_lowlevel.h b/tools/virtiofsd/fuse_lowleve=
l.h
index c55c0ca2fc1c..b889dae4de0e 100644
--- a/tools/virtiofsd/fuse_lowlevel.h
+++ b/tools/virtiofsd/fuse_lowlevel.h
@@ -1226,6 +1226,19 @@ struct fuse_lowlevel_ops {
      */
     void (*lseek)(fuse_req_t req, fuse_ino_t ino, off_t off, int whence,
                   struct fuse_file_info *fi);
+
+    /**
+     * Synchronize file system content
+     *
+     * If this request is answered with an error code of ENOSYS,
+     * this is treated as success and future calls to syncfs() will
+     * succeed automatically without being sent to the filesystem
+     * process.
+     *
+     * @param req request handle
+     * @param ino the inode number
+     */
+    void (*syncfs)(fuse_req_t req, fuse_ino_t ino);
 };
=20
 /**
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index 7bf31fc129c8..9021eb091a28 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -3362,6 +3362,103 @@ static void lo_lseek(fuse_req_t req, fuse_ino_t ino=
, off_t off, int whence,
     }
 }
=20
+static int do_syncfs(struct lo_data *lo, struct lo_inode *inode)
+{
+    int fd, err =3D 0;
+
+    fuse_log(FUSE_LOG_DEBUG, "lo_syncfs(ino=3D%" PRIu64 ")\n", inode->fuse=
_ino);
+
+    fd =3D lo_inode_open(lo, inode, O_RDONLY);
+    if (fd < 0) {
+        return -fd;
+    }
+
+    if (syncfs(fd) < 0) {
+        err =3D -errno;
+    }
+
+    close(fd);
+    return err;
+}
+
+struct syncfs_func_data {
+    struct lo_data *lo;
+    int err;
+};
+
+static void syncfs_func(gpointer data, gpointer user_data)
+{
+    struct syncfs_func_data *sfdata =3D user_data;
+    struct lo_data *lo =3D sfdata->lo;
+    struct lo_inode *inode =3D data;
+
+    if (!sfdata->err) {
+        sfdata->err =3D do_syncfs(lo, inode);
+    }
+
+    lo_inode_put(lo, &inode);
+}
+
+static int lo_syncfs_all(fuse_req_t req)
+{
+    struct lo_data *lo =3D lo_data(req);
+    GHashTableIter iter;
+    gpointer key, value;
+    GSList *list =3D NULL;
+    struct syncfs_func_data sfdata =3D {
+        .lo =3D lo,
+        .err =3D 0,
+    };
+
+    pthread_mutex_lock(&lo->mutex);
+
+    g_hash_table_iter_init(&iter, lo->mnt_inodes);
+    while (g_hash_table_iter_next(&iter, &key, &value)) {
+        struct lo_inode *inode =3D value;
+
+        /* Reference is put in syncfs_func() */
+        g_atomic_int_inc(&inode->refcount);
+        list =3D g_slist_prepend(list, inode);
+    }
+
+    pthread_mutex_unlock(&lo->mutex);
+
+    g_slist_foreach(list, syncfs_func, &sfdata);
+    g_slist_free(list);
+    return sfdata.err;
+}
+
+static int lo_syncfs_one(fuse_req_t req, fuse_ino_t ino)
+{
+    struct lo_data *lo =3D lo_data(req);
+    struct lo_inode *inode;
+    int err;
+
+    inode =3D lo_inode(req, ino);
+    if (!inode) {
+        return -EBADF;
+    }
+
+    err =3D do_syncfs(lo, inode);
+    lo_inode_put(lo, &inode);
+    return err;
+}
+
+static void lo_syncfs(fuse_req_t req, fuse_ino_t ino)
+{
+    struct lo_data *lo =3D lo_data(req);
+    int err;
+
+    if (lo->announce_submounts) {
+        err =3D lo_syncfs_one(req, ino);
+    } else {
+        err =3D lo_syncfs_all(req);
+    }
+
+    fuse_reply_err(req, err);
+}
+
+
 static void lo_destroy(void *userdata)
 {
     struct lo_data *lo =3D (struct lo_data *)userdata;
@@ -3423,6 +3520,7 @@ static struct fuse_lowlevel_ops lo_oper =3D {
     .copy_file_range =3D lo_copy_file_range,
 #endif
     .lseek =3D lo_lseek,
+    .syncfs =3D lo_syncfs,
     .destroy =3D lo_destroy,
 };
=20
diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/passth=
rough_seccomp.c
index a3ce9f898d2d..3e9d6181dc69 100644
--- a/tools/virtiofsd/passthrough_seccomp.c
+++ b/tools/virtiofsd/passthrough_seccomp.c
@@ -108,6 +108,7 @@ static const int syscall_allowlist[] =3D {
     SCMP_SYS(set_robust_list),
     SCMP_SYS(setxattr),
     SCMP_SYS(symlinkat),
+    SCMP_SYS(syncfs),
     SCMP_SYS(time), /* Rarely needed, except on static builds */
     SCMP_SYS(tgkill),
     SCMP_SYS(unlinkat),
--=20
2.34.1


