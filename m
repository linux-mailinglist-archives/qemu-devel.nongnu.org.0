Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE05514716F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 20:08:02 +0100 (CET)
Received: from localhost ([::1]:35294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuhph-0000OL-Bf
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 14:08:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41475)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iufeB-0005FK-16
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iufe9-0006gY-Fo
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:47:58 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:24012
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iufe9-0006g6-Cb
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:47:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579798077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pucqjnQfkQgODQBaQLuvW2l9M7uY/arYC5AvJoD6Bd0=;
 b=Su6rzzDB/T8yRcQYyLD+B1tdo7ZXuWo1sYecgazH34vtnhFLJvoRzrrgvQYOPyDXMsQanG
 YMya7jnvoLhmNp0O1hk0F5ciB/2KqHGB6XAXOTBC+qBiXAyTUnz8OmS7CtL0jsU2Ngi9Xu
 bVhYTw/X5VNx9aOL/yg/EstHiU8UEbE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-0Q1Q1o6bO8iJ8iRiIMAMpA-1; Thu, 23 Jan 2020 11:47:55 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5BF5190B2B5
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 16:47:54 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-116-110.ams2.redhat.com
 [10.36.116.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0CD7819C69;
 Thu, 23 Jan 2020 16:47:53 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 055/108] virtiofsd: Drop CAP_FSETID if client asked for it
Date: Thu, 23 Jan 2020 16:45:37 +0000
Message-Id: <20200123164630.91498-56-dgilbert@redhat.com>
In-Reply-To: <20200123164630.91498-1-dgilbert@redhat.com>
References: <20200123164630.91498-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 0Q1Q1o6bO8iJ8iRiIMAMpA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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

From: Vivek Goyal <vgoyal@redhat.com>

If client requested killing setuid/setgid bits on file being written, drop
CAP_FSETID capability so that setuid/setgid bits are cleared upon write
automatically.

pjdfstest chown/12.t needs this.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
  dgilbert: reworked for libcap-ng
Reviewed-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 105 +++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index 97e7c75667..d53cb1e005 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -201,6 +201,91 @@ static int load_capng(void)
     return 0;
 }
=20
+/*
+ * Helpers for dropping and regaining effective capabilities. Returns 0
+ * on success, error otherwise
+ */
+static int drop_effective_cap(const char *cap_name, bool *cap_dropped)
+{
+    int cap, ret;
+
+    cap =3D capng_name_to_capability(cap_name);
+    if (cap < 0) {
+        ret =3D errno;
+        fuse_log(FUSE_LOG_ERR, "capng_name_to_capability(%s) failed:%s\n",
+                 cap_name, strerror(errno));
+        goto out;
+    }
+
+    if (load_capng()) {
+        ret =3D errno;
+        fuse_log(FUSE_LOG_ERR, "load_capng() failed\n");
+        goto out;
+    }
+
+    /* We dont have this capability in effective set already. */
+    if (!capng_have_capability(CAPNG_EFFECTIVE, cap)) {
+        ret =3D 0;
+        goto out;
+    }
+
+    if (capng_update(CAPNG_DROP, CAPNG_EFFECTIVE, cap)) {
+        ret =3D errno;
+        fuse_log(FUSE_LOG_ERR, "capng_update(DROP,) failed\n");
+        goto out;
+    }
+
+    if (capng_apply(CAPNG_SELECT_CAPS)) {
+        ret =3D errno;
+        fuse_log(FUSE_LOG_ERR, "drop:capng_apply() failed\n");
+        goto out;
+    }
+
+    ret =3D 0;
+    if (cap_dropped) {
+        *cap_dropped =3D true;
+    }
+
+out:
+    return ret;
+}
+
+static int gain_effective_cap(const char *cap_name)
+{
+    int cap;
+    int ret =3D 0;
+
+    cap =3D capng_name_to_capability(cap_name);
+    if (cap < 0) {
+        ret =3D errno;
+        fuse_log(FUSE_LOG_ERR, "capng_name_to_capability(%s) failed:%s\n",
+                 cap_name, strerror(errno));
+        goto out;
+    }
+
+    if (load_capng()) {
+        ret =3D errno;
+        fuse_log(FUSE_LOG_ERR, "load_capng() failed\n");
+        goto out;
+    }
+
+    if (capng_update(CAPNG_ADD, CAPNG_EFFECTIVE, cap)) {
+        ret =3D errno;
+        fuse_log(FUSE_LOG_ERR, "capng_update(ADD,) failed\n");
+        goto out;
+    }
+
+    if (capng_apply(CAPNG_SELECT_CAPS)) {
+        ret =3D errno;
+        fuse_log(FUSE_LOG_ERR, "gain:capng_apply() failed\n");
+        goto out;
+    }
+    ret =3D 0;
+
+out:
+    return ret;
+}
+
 static void lo_map_init(struct lo_map *map)
 {
     map->elems =3D NULL;
@@ -1577,6 +1662,7 @@ static void lo_write_buf(fuse_req_t req, fuse_ino_t i=
no,
     (void)ino;
     ssize_t res;
     struct fuse_bufvec out_buf =3D FUSE_BUFVEC_INIT(fuse_buf_size(in_buf))=
;
+    bool cap_fsetid_dropped =3D false;
=20
     out_buf.buf[0].flags =3D FUSE_BUF_IS_FD | FUSE_BUF_FD_SEEK;
     out_buf.buf[0].fd =3D lo_fi_fd(req, fi);
@@ -1588,12 +1674,31 @@ static void lo_write_buf(fuse_req_t req, fuse_ino_t=
 ino,
                  out_buf.buf[0].size, (unsigned long)off);
     }
=20
+    /*
+     * If kill_priv is set, drop CAP_FSETID which should lead to kernel
+     * clearing setuid/setgid on file.
+     */
+    if (fi->kill_priv) {
+        res =3D drop_effective_cap("FSETID", &cap_fsetid_dropped);
+        if (res !=3D 0) {
+            fuse_reply_err(req, res);
+            return;
+        }
+    }
+
     res =3D fuse_buf_copy(&out_buf, in_buf);
     if (res < 0) {
         fuse_reply_err(req, -res);
     } else {
         fuse_reply_write(req, (size_t)res);
     }
+
+    if (cap_fsetid_dropped) {
+        res =3D gain_effective_cap("FSETID");
+        if (res) {
+            fuse_log(FUSE_LOG_ERR, "Failed to gain CAP_FSETID\n");
+        }
+    }
 }
=20
 static void lo_statfs(fuse_req_t req, fuse_ino_t ino)
--=20
2.24.1


