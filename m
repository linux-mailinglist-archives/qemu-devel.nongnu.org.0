Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05067143DFE
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 14:27:17 +0100 (CET)
Received: from localhost ([::1]:53798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ittYp-00040F-Jw
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 08:27:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51755)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1itsdm-0008OL-W8
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:28:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1itsdj-00035X-68
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:28:18 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:41595
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1itsdi-00034t-7a
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:28:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579609693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3jSLD5ehJ3ai/ntqwK99Tybgj4IiLz06GbpfP3AIgaQ=;
 b=O0d8/aWUwm1EhO5AQXGDEMAQCGgrEUUpJk3C1yfkBxOLWIRnnrt8Mojskg6ThUdVn816iN
 sX072RKbPgzdodfS3emP+EbxtXDIJjfyWeIXqFK4sSQy0qmAViMpfDU2UJ1VOMc1/T7juC
 GfIClUMTpy16euGS9GAPg4UJmm8jWUQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-ubGcTgg8MpStm20SVW_UKQ-1; Tue, 21 Jan 2020 07:28:12 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66FD21005510;
 Tue, 21 Jan 2020 12:28:11 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E5B860BE0;
 Tue, 21 Jan 2020 12:28:07 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 berrange@redhat.com, slp@redhat.com, philmd@redhat.com
Subject: [PATCH v2 043/109] virtiofsd: validate input buffer sizes in
 do_write_buf()
Date: Tue, 21 Jan 2020 12:23:27 +0000
Message-Id: <20200121122433.50803-44-dgilbert@redhat.com>
In-Reply-To: <20200121122433.50803-1-dgilbert@redhat.com>
References: <20200121122433.50803-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: ubGcTgg8MpStm20SVW_UKQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: m.mizuma@jp.fujitsu.com, misono.tomohiro@jp.fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

There is a small change in behavior: if fuse_write_in->size doesn't
match the input buffer size then the request is failed.  Previously
write requests with 1 fuse_buf element would truncate to
fuse_write_in->size.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
---
 tools/virtiofsd/fuse_lowlevel.c | 49 ++++++++++++++++++++-------------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowleve=
l.c
index 84a9d5f993..5ae94cf56b 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -1004,8 +1004,8 @@ static void do_write(fuse_req_t req, fuse_ino_t nodei=
d, const void *inarg)
     }
 }
=20
-static void do_write_buf(fuse_req_t req, fuse_ino_t nodeid, const void *in=
arg,
-                         struct fuse_bufvec *ibufv)
+static void do_write_buf(fuse_req_t req, fuse_ino_t nodeid,
+                         struct fuse_mbuf_iter *iter, struct fuse_bufvec *=
ibufv)
 {
     struct fuse_session *se =3D req->se;
     struct fuse_bufvec *pbufv =3D ibufv;
@@ -1013,28 +1013,27 @@ static void do_write_buf(fuse_req_t req, fuse_ino_t=
 nodeid, const void *inarg,
         .buf[0] =3D ibufv->buf[0],
         .count =3D 1,
     };
-    struct fuse_write_in *arg =3D (struct fuse_write_in *)inarg;
+    struct fuse_write_in *arg;
+    size_t arg_size =3D sizeof(*arg);
     struct fuse_file_info fi;
=20
     memset(&fi, 0, sizeof(fi));
+
+    arg =3D fuse_mbuf_iter_advance(iter, arg_size);
+    if (!arg) {
+        fuse_reply_err(req, EINVAL);
+        return;
+    }
+
+    fi.lock_owner =3D arg->lock_owner;
+    fi.flags =3D arg->flags;
     fi.fh =3D arg->fh;
     fi.writepage =3D arg->write_flags & FUSE_WRITE_CACHE;
=20
     if (ibufv->count =3D=3D 1) {
-        fi.lock_owner =3D arg->lock_owner;
-        fi.flags =3D arg->flags;
-        if (!(tmpbufv.buf[0].flags & FUSE_BUF_IS_FD)) {
-            tmpbufv.buf[0].mem =3D PARAM(arg);
-        }
-        tmpbufv.buf[0].size -=3D
-            sizeof(struct fuse_in_header) + sizeof(struct fuse_write_in);
-        if (tmpbufv.buf[0].size < arg->size) {
-            fuse_log(FUSE_LOG_ERR,
-                     "fuse: do_write_buf: buffer size too small\n");
-            fuse_reply_err(req, EIO);
-            return;
-        }
-        tmpbufv.buf[0].size =3D arg->size;
+        assert(!(tmpbufv.buf[0].flags & FUSE_BUF_IS_FD));
+        tmpbufv.buf[0].mem =3D ((char *)arg) + arg_size;
+        tmpbufv.buf[0].size -=3D sizeof(struct fuse_in_header) + arg_size;
         pbufv =3D &tmpbufv;
     } else {
         /*
@@ -1044,6 +1043,13 @@ static void do_write_buf(fuse_req_t req, fuse_ino_t =
nodeid, const void *inarg,
         ibufv->buf[0].size =3D 0;
     }
=20
+    if (fuse_buf_size(pbufv) !=3D arg->size) {
+        fuse_log(FUSE_LOG_ERR,
+                 "fuse: do_write_buf: buffer size doesn't match arg->size\=
n");
+        fuse_reply_err(req, EIO);
+        return;
+    }
+
     se->op.write_buf(req, nodeid, pbufv, arg->offset, &fi);
 }
=20
@@ -2054,12 +2060,17 @@ void fuse_session_process_buf_int(struct fuse_sessi=
on *se,
                                   struct fuse_chan *ch)
 {
     const struct fuse_buf *buf =3D bufv->buf;
+    struct fuse_mbuf_iter iter =3D FUSE_MBUF_ITER_INIT(buf);
     struct fuse_in_header *in;
     const void *inarg;
     struct fuse_req *req;
     int err;
=20
-    in =3D buf->mem;
+    /* The first buffer must be a memory buffer */
+    assert(!(buf->flags & FUSE_BUF_IS_FD));
+
+    in =3D fuse_mbuf_iter_advance(&iter, sizeof(*in));
+    assert(in); /* caller guarantees the input buffer is large enough */
=20
     if (se->debug) {
         fuse_log(FUSE_LOG_DEBUG,
@@ -2131,7 +2142,7 @@ void fuse_session_process_buf_int(struct fuse_session=
 *se,
=20
     inarg =3D (void *)&in[1];
     if (in->opcode =3D=3D FUSE_WRITE && se->op.write_buf) {
-        do_write_buf(req, in->nodeid, inarg, bufv);
+        do_write_buf(req, in->nodeid, &iter, bufv);
     } else {
         fuse_ll_ops[in->opcode].func(req, in->nodeid, inarg);
     }
--=20
2.24.1


