Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B7736B5AD
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 17:24:11 +0200 (CEST)
Received: from localhost ([::1]:40626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb35m-0005jt-36
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 11:24:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lb33p-0004tI-Mk
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 11:22:09 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:60849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lb33m-0008EE-1L
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 11:22:09 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-2mVyFOAVMySf86iv8WIIpw-1; Mon, 26 Apr 2021 11:21:54 -0400
X-MC-Unique: 2mVyFOAVMySf86iv8WIIpw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACC766D24D;
 Mon, 26 Apr 2021 15:21:53 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-148.ams2.redhat.com [10.36.113.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 767F860C5F;
 Mon, 26 Apr 2021 15:21:51 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [for-6.1 v2 2/2] virtiofsd: Add support for FUSE_SYNCFS request
Date: Mon, 26 Apr 2021 17:21:35 +0200
Message-Id: <20210426152135.842037-3-groug@kaod.org>
In-Reply-To: <20210426152135.842037-1-groug@kaod.org>
References: <20210426152135.842037-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: kvm@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 virtio-fs@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Honor the expected behavior of syncfs() to synchronously flush all
data and metadata on linux systems.

Flushing is done with syncfs(). This is suboptimal as it will also
flush writes performed by any other process on the same file system,
and thus add an unbounded time penalty to syncfs(). This may be
optimized in the future, but enforce correctness first.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 tools/virtiofsd/fuse_lowlevel.c       | 19 ++++++++++++++++++
 tools/virtiofsd/fuse_lowlevel.h       | 13 ++++++++++++
 tools/virtiofsd/passthrough_ll.c      | 29 +++++++++++++++++++++++++++
 tools/virtiofsd/passthrough_seccomp.c |  1 +
 4 files changed, 62 insertions(+)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowleve=
l.c
index 58e32fc96369..918ab11f54c2 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -1870,6 +1870,24 @@ static void do_lseek(fuse_req_t req, fuse_ino_t node=
id,
     }
 }
=20
+static void do_syncfs(fuse_req_t req, fuse_ino_t nodeid,
+                      struct fuse_mbuf_iter *iter)
+{
+    struct fuse_syncfs_in *arg;
+
+    arg =3D fuse_mbuf_iter_advance(iter, sizeof(*arg));
+    if (!arg) {
+        fuse_reply_err(req, EINVAL);
+        return;
+    }
+
+    if (req->se->op.syncfs) {
+        req->se->op.syncfs(req, arg->flags);
+    } else {
+        fuse_reply_err(req, ENOSYS);
+    }
+}
+
 static void do_init(fuse_req_t req, fuse_ino_t nodeid,
                     struct fuse_mbuf_iter *iter)
 {
@@ -2267,6 +2285,7 @@ static struct {
     [FUSE_RENAME2] =3D { do_rename2, "RENAME2" },
     [FUSE_COPY_FILE_RANGE] =3D { do_copy_file_range, "COPY_FILE_RANGE" },
     [FUSE_LSEEK] =3D { do_lseek, "LSEEK" },
+    [FUSE_SYNCFS] =3D { do_syncfs, "SYNCFS" },
 };
=20
 #define FUSE_MAXOP (sizeof(fuse_ll_ops) / sizeof(fuse_ll_ops[0]))
diff --git a/tools/virtiofsd/fuse_lowlevel.h b/tools/virtiofsd/fuse_lowleve=
l.h
index 3bf786b03485..220bb3db4898 100644
--- a/tools/virtiofsd/fuse_lowlevel.h
+++ b/tools/virtiofsd/fuse_lowlevel.h
@@ -1225,6 +1225,19 @@ struct fuse_lowlevel_ops {
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
+     * @param flags not used yet
+     */
+    void (*syncfs)(fuse_req_t req, uint64_t flags);
 };
=20
 /**
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index 1553d2ef454f..6790a2f6fe10 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -3124,6 +3124,34 @@ static void lo_lseek(fuse_req_t req, fuse_ino_t ino,=
 off_t off, int whence,
     }
 }
=20
+static void lo_syncfs(fuse_req_t req, uint64_t flags)
+{
+    struct lo_data *lo =3D lo_data(req);
+    int fd, ret;
+
+    /* No flags supported yet */
+    if (flags) {
+        fuse_reply_err(req, EINVAL);
+        return;
+    }
+
+    fd =3D lo_inode_open(lo, &lo->root, O_RDONLY);
+    if (fd < 0) {
+        fuse_reply_err(req, errno);
+        return;
+    }
+
+    /*
+     * FIXME: this is suboptimal because it will also flush unrelated
+     *        writes not coming from the client. This can dramatically
+     *        increase the time spent in syncfs() if some process is
+     *        writing lots of data on the same filesystem as virtiofsd.
+     */
+    ret =3D syncfs(fd);
+    fuse_reply_err(req, ret < 0 ? errno : 0);
+    close(fd);
+}
+
 static void lo_destroy(void *userdata)
 {
     struct lo_data *lo =3D (struct lo_data *)userdata;
@@ -3184,6 +3212,7 @@ static struct fuse_lowlevel_ops lo_oper =3D {
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


