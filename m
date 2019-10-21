Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0962BDEAE8
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 13:28:20 +0200 (CEST)
Received: from localhost ([::1]:38300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMVrG-0000ld-M6
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 07:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46528)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iMVQK-00042l-4z
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 07:00:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iMVQD-0004B6-Va
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 07:00:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27151
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iMVQD-0004Ay-Rp
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 07:00:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571655621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fVDnmzyr1mxATqBl/owX4PKDC7A/ePwXknhkzg/IWOQ=;
 b=HvmTQEalX2gQR1uezCkVSX0NtED6co1gEvQhRdn4XlGLjnAlOaBUs82Lnp6nFKMd6T+/0k
 dK6jJ4x2eDjpWStoU2jC1z8N25qu2wJJGfR1eLb5w5pJD+iOwwgP6HBqqNYXcVk9ng5g3A
 qgBufZoBNcJOdo6KS7Vx4DpXiqHurGM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-4Qz29lzYPBmFCdP3JDK8Qg-1; Mon, 21 Oct 2019 07:00:17 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96557476;
 Mon, 21 Oct 2019 11:00:16 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-232.ams2.redhat.com
 [10.36.117.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 023DE6060D;
 Mon, 21 Oct 2019 11:00:14 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com
Subject: [PATCH 17/30] virtiofsd: Add main virtio loop
Date: Mon, 21 Oct 2019 11:58:19 +0100
Message-Id: <20191021105832.36574-18-dgilbert@redhat.com>
In-Reply-To: <20191021105832.36574-1-dgilbert@redhat.com>
References: <20191021105832.36574-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 4Qz29lzYPBmFCdP3JDK8Qg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: piaojun@huawei.com, eguan@linux.alibaba.com, vgoyal@Redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Processes incoming requests on the vhost-user fd.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 contrib/virtiofsd/fuse_virtio.c | 42 ++++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/contrib/virtiofsd/fuse_virtio.c b/contrib/virtiofsd/fuse_virti=
o.c
index 22f71d260f..9c58f11634 100644
--- a/contrib/virtiofsd/fuse_virtio.c
+++ b/contrib/virtiofsd/fuse_virtio.c
@@ -11,12 +11,14 @@
  * See the file COPYING.LIB
  */
=20
+#include "fuse_virtio.h"
 #include "fuse_i.h"
 #include "fuse_kernel.h"
 #include "fuse_misc.h"
 #include "fuse_opt.h"
-#include "fuse_virtio.h"
=20
+#include <assert.h>
+#include <errno.h>
 #include <stdint.h>
 #include <stdio.h>
 #include <stdlib.h>
@@ -80,15 +82,49 @@ static const VuDevIface fv_iface =3D {
     .queue_is_processed_in_order =3D fv_queue_order,
 };
=20
+/*
+ * Main loop; this mostly deals with events on the vhost-user
+ * socket itself, and not actual fuse data.
+ */
 int virtio_loop(struct fuse_session *se)
 {
     fuse_log(FUSE_LOG_INFO, "%s: Entry\n", __func__);
=20
-    while (1) {
-        /* TODO: Add stuffing */
+    while (!fuse_session_exited(se)) {
+        struct pollfd pf[1];
+        pf[0].fd =3D se->vu_socketfd;
+        pf[0].events =3D POLLIN;
+        pf[0].revents =3D 0;
+
+        fuse_log(FUSE_LOG_DEBUG, "%s: Waiting for VU event\n", __func__);
+        int poll_res =3D ppoll(pf, 1, NULL, NULL);
+
+        if (poll_res =3D=3D -1) {
+            if (errno =3D=3D EINTR) {
+                fuse_log(FUSE_LOG_INFO, "%s: ppoll interrupted, going arou=
nd\n",
+                         __func__);
+                continue;
+            }
+            fuse_log(FUSE_LOG_ERR, "virtio_loop ppoll: %m\n");
+            break;
+        }
+        assert(poll_res =3D=3D 1);
+        if (pf[0].revents & (POLLERR | POLLHUP | POLLNVAL)) {
+            fuse_log(FUSE_LOG_ERR, "%s: Unexpected poll revents %x\n", __f=
unc__,
+                     pf[0].revents);
+            break;
+        }
+        assert(pf[0].revents & POLLIN);
+        fuse_log(FUSE_LOG_DEBUG, "%s: Got VU event\n", __func__);
+        if (!vu_dispatch(&se->virtio_dev->dev)) {
+            fuse_log(FUSE_LOG_ERR, "%s: vu_dispatch failed\n", __func__);
+            break;
+        }
     }
=20
     fuse_log(FUSE_LOG_INFO, "%s: Exit\n", __func__);
+
+    return 0;
 }
=20
 int virtio_session_mount(struct fuse_session *se)
--=20
2.23.0


