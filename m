Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90ABC4E465
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 11:43:26 +0200 (CEST)
Received: from localhost ([::1]:57468 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heG4r-0005sh-Ju
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 05:43:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49454)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@redhat.com>) id 1heG23-0004d8-IY
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 05:40:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1heG20-0002MG-GX
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 05:40:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51446)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1heG20-0002LQ-C8
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 05:40:28 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5D67A3082E21;
 Fri, 21 Jun 2019 09:40:27 +0000 (UTC)
Received: from localhost (ovpn-117-248.ams2.redhat.com [10.36.117.248])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F3145C22B;
 Fri, 21 Jun 2019 09:40:17 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 21 Jun 2019 10:40:02 +0100
Message-Id: <20190621094005.4134-2-stefanha@redhat.com>
In-Reply-To: <20190621094005.4134-1-stefanha@redhat.com>
References: <20190621094005.4134-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Fri, 21 Jun 2019 09:40:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 1/4] libvhost-user: add vmsg_set_reply_u64()
 helper
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The VhostUserMsg request is reused as the reply by message processing
functions.  This is risky since request fields may corrupt the reply if
the vhost-user message handler function forgets to re-initialize them.

Changing this practice would be very invasive but we can introduce a
helper function to make u64 payload replies safe.  This also eliminates
code duplication in message processing functions.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 contrib/libvhost-user/libvhost-user.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/contrib/libvhost-user/libvhost-user.c b/contrib/libvhost-use=
r/libvhost-user.c
index 443b7e08c3..a8657c7af2 100644
--- a/contrib/libvhost-user/libvhost-user.c
+++ b/contrib/libvhost-user/libvhost-user.c
@@ -216,6 +216,15 @@ vmsg_close_fds(VhostUserMsg *vmsg)
     }
 }
=20
+/* Set reply payload.u64 and clear request flags and fd_num */
+static void vmsg_set_reply_u64(VhostUserMsg *vmsg, uint64_t val)
+{
+    vmsg->flags =3D 0; /* defaults will be set by vu_send_reply() */
+    vmsg->size =3D sizeof(vmsg->payload.u64);
+    vmsg->payload.u64 =3D val;
+    vmsg->fd_num =3D 0;
+}
+
 /* A test to see if we have userfault available */
 static bool
 have_userfault(void)
@@ -1168,10 +1177,7 @@ vu_get_protocol_features_exec(VuDev *dev, VhostUse=
rMsg *vmsg)
         features |=3D dev->iface->get_protocol_features(dev);
     }
=20
-    vmsg->payload.u64 =3D features;
-    vmsg->size =3D sizeof(vmsg->payload.u64);
-    vmsg->fd_num =3D 0;
-
+    vmsg_set_reply_u64(vmsg, features);
     return true;
 }
=20
@@ -1307,17 +1313,14 @@ out:
 static bool
 vu_set_postcopy_listen(VuDev *dev, VhostUserMsg *vmsg)
 {
-    vmsg->payload.u64 =3D -1;
-    vmsg->size =3D sizeof(vmsg->payload.u64);
-
     if (dev->nregions) {
         vu_panic(dev, "Regions already registered at postcopy-listen");
+        vmsg_set_reply_u64(vmsg, -1);
         return true;
     }
     dev->postcopy_listening =3D true;
=20
-    vmsg->flags =3D VHOST_USER_VERSION |  VHOST_USER_REPLY_MASK;
-    vmsg->payload.u64 =3D 0; /* Success */
+    vmsg_set_reply_u64(vmsg, 0);
     return true;
 }
=20
@@ -1332,10 +1335,7 @@ vu_set_postcopy_end(VuDev *dev, VhostUserMsg *vmsg=
)
         DPRINT("%s: Done close\n", __func__);
     }
=20
-    vmsg->fd_num =3D 0;
-    vmsg->payload.u64 =3D 0;
-    vmsg->size =3D sizeof(vmsg->payload.u64);
-    vmsg->flags =3D VHOST_USER_VERSION |  VHOST_USER_REPLY_MASK;
+    vmsg_set_reply_u64(vmsg, 0);
     DPRINT("%s: exit\n", __func__);
     return true;
 }
--=20
2.21.0


