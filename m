Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836D737934F
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 18:01:19 +0200 (CEST)
Received: from localhost ([::1]:51604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg8LO-0008Kn-Gr
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 12:01:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lg8GF-00030a-E4
 for qemu-devel@nongnu.org; Mon, 10 May 2021 11:55:59 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:23192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lg8GD-0000gq-Mu
 for qemu-devel@nongnu.org; Mon, 10 May 2021 11:55:59 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-P45J3x4rN4eaZkSPEhBiJw-1; Mon, 10 May 2021 11:55:53 -0400
X-MC-Unique: P45J3x4rN4eaZkSPEhBiJw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15144803620;
 Mon, 10 May 2021 15:55:52 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-152.ams2.redhat.com [10.36.112.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C10CA19C44;
 Mon, 10 May 2021 15:55:49 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [for-6.1 v3 3/3] virtiofsd: Add support for FUSE_SYNCFS request
Date: Mon, 10 May 2021 17:55:39 +0200
Message-Id: <20210510155539.998747-4-groug@kaod.org>
In-Reply-To: <20210510155539.998747-1-groug@kaod.org>
References: <20210510155539.998747-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 virtio-fs@redhat.com, Miklos Szeredi <miklos@szeredi.hu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Honor the expected behavior of syncfs() to synchronously flush all data
and metadata on linux systems. Simply loop on all known submounts and
call syncfs() on them.

Note that syncfs() might suffer from a time penalty if the submounts
are being hammered by some unrelated workload on the host. The only
solution to avoid that is to avoid shared submounts.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 tools/virtiofsd/fuse_lowlevel.c       | 11 ++++++++
 tools/virtiofsd/fuse_lowlevel.h       | 12 +++++++++
 tools/virtiofsd/passthrough_ll.c      | 38 +++++++++++++++++++++++++++
 tools/virtiofsd/passthrough_seccomp.c |  1 +
 4 files changed, 62 insertions(+)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowleve=
l.c
index 58e32fc96369..3be95ec903c9 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -1870,6 +1870,16 @@ static void do_lseek(fuse_req_t req, fuse_ino_t node=
id,
     }
 }
=20
+static void do_syncfs(fuse_req_t req, fuse_ino_t nodeid,
+                      struct fuse_mbuf_iter *iter)
+{
+    if (req->se->op.syncfs) {
+        req->se->op.syncfs(req);
+    } else {
+        fuse_reply_err(req, ENOSYS);
+    }
+}
+
 static void do_init(fuse_req_t req, fuse_ino_t nodeid,
                     struct fuse_mbuf_iter *iter)
 {
@@ -2267,6 +2277,7 @@ static struct {
     [FUSE_RENAME2] =3D { do_rename2, "RENAME2" },
     [FUSE_COPY_FILE_RANGE] =3D { do_copy_file_range, "COPY_FILE_RANGE" },
     [FUSE_LSEEK] =3D { do_lseek, "LSEEK" },
+    [FUSE_SYNCFS] =3D { do_syncfs, "SYNCFS" },
 };
=20
 #define FUSE_MAXOP (sizeof(fuse_ll_ops) / sizeof(fuse_ll_ops[0]))
diff --git a/tools/virtiofsd/fuse_lowlevel.h b/tools/virtiofsd/fuse_lowleve=
l.h
index 3bf786b03485..890c520b195a 100644
--- a/tools/virtiofsd/fuse_lowlevel.h
+++ b/tools/virtiofsd/fuse_lowlevel.h
@@ -1225,6 +1225,18 @@ struct fuse_lowlevel_ops {
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
+     */
+    void (*syncfs)(fuse_req_t req);
 };
=20
 /**
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index dc940a1d048b..289900c6d274 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -3153,6 +3153,43 @@ static void lo_lseek(fuse_req_t req, fuse_ino_t ino,=
 off_t off, int whence,
     }
 }
=20
+static void lo_syncfs(fuse_req_t req)
+{
+    struct lo_data *lo =3D lo_data(req);
+    GHashTableIter iter;
+    gpointer key, value;
+    int err =3D 0;
+
+    pthread_mutex_lock(&lo->mutex);
+
+    g_hash_table_iter_init(&iter, lo->mnt_inodes);
+    while (g_hash_table_iter_next(&iter, &key, &value)) {
+        struct lo_inode *inode =3D value;
+        int fd;
+
+        fuse_log(FUSE_LOG_DEBUG, "lo_syncfs(ino=3D%" PRIu64 ")\n",
+                 inode->fuse_ino);
+
+        fd =3D lo_inode_open(lo, inode, O_RDONLY);
+        if (fd < 0) {
+            err =3D -fd;
+            break;
+        }
+
+        if (syncfs(fd) < 0) {
+            err =3D errno;
+            close(fd);
+            break;
+        }
+
+        close(fd);
+    }
+
+    pthread_mutex_unlock(&lo->mutex);
+
+    fuse_reply_err(req, err);
+}
+
 static void lo_destroy(void *userdata)
 {
     struct lo_data *lo =3D (struct lo_data *)userdata;
@@ -3214,6 +3251,7 @@ static struct fuse_lowlevel_ops lo_oper =3D {
     .copy_file_range =3D lo_copy_file_range,
 #endif
     .lseek =3D lo_lseek,
+    .syncfs =3D lo_syncfs,
     .destroy =3D lo_destroy,
 };
=20
diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/passth=
rough_seccomp.c
index 62441cfcdb95..343188447901 100644
--- a/tools/virtiofsd/passthrough_seccomp.c
+++ b/tools/virtiofsd/passthrough_seccomp.c
@@ -107,6 +107,7 @@ static const int syscall_allowlist[] =3D {
     SCMP_SYS(set_robust_list),
     SCMP_SYS(setxattr),
     SCMP_SYS(symlinkat),
+    SCMP_SYS(syncfs),
     SCMP_SYS(time), /* Rarely needed, except on static builds */
     SCMP_SYS(tgkill),
     SCMP_SYS(unlinkat),
--=20
2.26.3


