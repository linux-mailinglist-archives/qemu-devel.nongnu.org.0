Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96226338893
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:26:10 +0100 (CET)
Received: from localhost ([::1]:38174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKe3d-0005z5-HZ
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:26:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lKe0F-00008o-Vt
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:22:39 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:47134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lKe0E-000401-2r
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:22:39 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-PQuxDDBiNhWs1NVmHYjAaw-1; Fri, 12 Mar 2021 04:22:26 -0500
X-MC-Unique: PQuxDDBiNhWs1NVmHYjAaw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D00B683DD61;
 Fri, 12 Mar 2021 09:22:25 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-236.ams2.redhat.com [10.36.113.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EFD16A967;
 Fri, 12 Mar 2021 09:22:24 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/7] vhost-user: Drop misleading EAGAIN checks in
 slave_read()
Date: Fri, 12 Mar 2021 10:22:06 +0100
Message-Id: <20210312092212.782255-2-groug@kaod.org>
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

slave_read() checks EAGAIN when reading or writing to the socket
fails. This gives the impression that the slave channel is in
non-blocking mode, which is certainly not the case with the current
code base. And the rest of the code isn't actually ready to cope
with non-blocking I/O.

Just drop the checks everywhere in this function for the sake of
clarity.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/virtio/vhost-user.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 2fdd5daf74bb..6af9b43a7232 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1420,7 +1420,7 @@ static void slave_read(void *opaque)
=20
     do {
         size =3D recvmsg(u->slave_fd, &msgh, 0);
-    } while (size < 0 && (errno =3D=3D EINTR || errno =3D=3D EAGAIN));
+    } while (size < 0 && errno =3D=3D EINTR);
=20
     if (size !=3D VHOST_USER_HDR_SIZE) {
         error_report("Failed to read from slave.");
@@ -1452,7 +1452,7 @@ static void slave_read(void *opaque)
     /* Read payload */
     do {
         size =3D read(u->slave_fd, &payload, hdr.size);
-    } while (size < 0 && (errno =3D=3D EINTR || errno =3D=3D EAGAIN));
+    } while (size < 0 && errno =3D=3D EINTR);
=20
     if (size !=3D hdr.size) {
         error_report("Failed to read payload from slave.");
@@ -1503,7 +1503,7 @@ static void slave_read(void *opaque)
=20
         do {
             size =3D writev(u->slave_fd, iovec, ARRAY_SIZE(iovec));
-        } while (size < 0 && (errno =3D=3D EINTR || errno =3D=3D EAGAIN));
+        } while (size < 0 && errno =3D=3D EINTR);
=20
         if (size !=3D VHOST_USER_HDR_SIZE + hdr.size) {
             error_report("Failed to send msg reply to slave.");
--=20
2.26.2


