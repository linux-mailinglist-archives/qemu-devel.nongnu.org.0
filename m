Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A433388A3
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:28:42 +0100 (CET)
Received: from localhost ([::1]:46162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKe65-00018n-JX
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:28:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lKe0I-0000D9-5v
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:22:42 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:37117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lKe0G-00040x-Lh
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:22:41 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-FLQnaogKNeiJB6VeiKC1ug-1; Fri, 12 Mar 2021 04:22:31 -0500
X-MC-Unique: FLQnaogKNeiJB6VeiKC1ug-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFB4083DE6B;
 Fri, 12 Mar 2021 09:22:29 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-236.ams2.redhat.com [10.36.113.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C2126A046;
 Fri, 12 Mar 2021 09:22:28 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/7] vhost-user: Factor out duplicated slave_fd teardown
 code
Date: Fri, 12 Mar 2021 10:22:08 +0100
Message-Id: <20210312092212.782255-4-groug@kaod.org>
In-Reply-To: <20210312092212.782255-1-groug@kaod.org>
References: <20210312092212.782255-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/virtio/vhost-user.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index acde1d293684..cb0c98f30a8d 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1392,6 +1392,13 @@ static int vhost_user_slave_handle_vring_host_notifi=
er(struct vhost_dev *dev,
     return 0;
 }
=20
+static void close_slave_channel(struct vhost_user *u)
+{
+    qemu_set_fd_handler(u->slave_fd, NULL, NULL, NULL);
+    close(u->slave_fd);
+    u->slave_fd =3D -1;
+}
+
 static void slave_read(void *opaque)
 {
     struct vhost_dev *dev =3D opaque;
@@ -1507,9 +1514,7 @@ static void slave_read(void *opaque)
     goto fdcleanup;
=20
 err:
-    qemu_set_fd_handler(u->slave_fd, NULL, NULL, NULL);
-    close(u->slave_fd);
-    u->slave_fd =3D -1;
+    close_slave_channel(u);
=20
 fdcleanup:
     for (i =3D 0; i < fdsize; i++) {
@@ -1560,9 +1565,7 @@ static int vhost_setup_slave_channel(struct vhost_dev=
 *dev)
 out:
     close(sv[1]);
     if (ret) {
-        qemu_set_fd_handler(u->slave_fd, NULL, NULL, NULL);
-        close(u->slave_fd);
-        u->slave_fd =3D -1;
+        close_slave_channel(u);
     }
=20
     return ret;
@@ -1915,9 +1918,7 @@ static int vhost_user_backend_cleanup(struct vhost_de=
v *dev)
         u->postcopy_fd.handler =3D NULL;
     }
     if (u->slave_fd >=3D 0) {
-        qemu_set_fd_handler(u->slave_fd, NULL, NULL, NULL);
-        close(u->slave_fd);
-        u->slave_fd =3D -1;
+        close_slave_channel(u);
     }
     g_free(u->region_rb);
     u->region_rb =3D NULL;
--=20
2.26.2


