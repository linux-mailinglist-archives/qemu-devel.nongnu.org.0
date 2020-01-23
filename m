Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F07F11471D9
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 20:38:33 +0100 (CET)
Received: from localhost ([::1]:60268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuiJE-0000n1-UW
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 14:38:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42238)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iufeZ-0005jC-Pt
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iufeY-0007fm-MT
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:23 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31567
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iufeY-0007ec-JV
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579798102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wUAG2fbKAm1QXX7BuOCGgK1HShg22nIR5T+Nv/E/82U=;
 b=gI26VTsLL2DSq8V3ZrSoLJSafqhnqnM/T5XKG2ZsL17YETWAv6tQIBwhfdEfILp3rmbl20
 M3l8oCg6UMOFvxztOJrre28Y2xhC80UvJuzlclPRAgQ2FQvlTTp9ZR3h1AFOq+Svdh63jl
 5THPbS6mZVGhOitOdaUuXeg2UkS8JuI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-zu8HciKAMMON4skj2BsM_w-1; Thu, 23 Jan 2020 11:48:20 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE87B100551C
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 16:48:19 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-116-110.ams2.redhat.com
 [10.36.116.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3803B19C69;
 Thu, 23 Jan 2020 16:48:19 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 078/108] virtiofsd: cleanup allocated resource in se
Date: Thu, 23 Jan 2020 16:46:00 +0000
Message-Id: <20200123164630.91498-79-dgilbert@redhat.com>
In-Reply-To: <20200123164630.91498-1-dgilbert@redhat.com>
References: <20200123164630.91498-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: zu8HciKAMMON4skj2BsM_w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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

From: Liu Bo <bo.liu@linux.alibaba.com>

This cleans up unfreed resources in se on quiting, including
se->virtio_dev, se->vu_socket_path, se->vu_socketfd.

Signed-off-by: Liu Bo <bo.liu@linux.alibaba.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_lowlevel.c | 7 +++++++
 tools/virtiofsd/fuse_virtio.c   | 7 +++++++
 tools/virtiofsd/fuse_virtio.h   | 2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowleve=
l.c
index 65f91dabae..440508a6ec 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -2532,6 +2532,13 @@ void fuse_session_destroy(struct fuse_session *se)
     if (se->fd !=3D -1) {
         close(se->fd);
     }
+
+    if (se->vu_socket_path) {
+        virtio_session_close(se);
+        free(se->vu_socket_path);
+        se->vu_socket_path =3D NULL;
+    }
+
     free(se);
 }
=20
diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 7a8774a3ee..e7bd772805 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -833,3 +833,10 @@ int virtio_session_mount(struct fuse_session *se)
=20
     return 0;
 }
+
+void virtio_session_close(struct fuse_session *se)
+{
+    close(se->vu_socketfd);
+    free(se->virtio_dev);
+    se->virtio_dev =3D NULL;
+}
diff --git a/tools/virtiofsd/fuse_virtio.h b/tools/virtiofsd/fuse_virtio.h
index cc676b9193..111684032c 100644
--- a/tools/virtiofsd/fuse_virtio.h
+++ b/tools/virtiofsd/fuse_virtio.h
@@ -19,7 +19,7 @@
 struct fuse_session;
=20
 int virtio_session_mount(struct fuse_session *se);
-
+void virtio_session_close(struct fuse_session *se);
 int virtio_loop(struct fuse_session *se);
=20
=20
--=20
2.24.1


