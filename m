Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6024314724C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 21:04:25 +0100 (CET)
Received: from localhost ([::1]:32882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuiiG-0005B4-CJ
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 15:04:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42408)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iufel-0005yA-Vk
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iufek-0008Da-S9
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:35 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:59037
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iufek-0008CO-P3
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579798114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WzLbAZP9WfpE8TnNXdwCvu1MiJ4/z6YtXfDuOOsI480=;
 b=ZhxitubSyfJWoh3NyyBhdE3QUGMyRiGrji8NnkZa6zntMeTSQ6jTmkP7gR5jNdZPFDdlb6
 m8A5RMJv08gBkWtT4EnxM/ZXVWSq9bK74d8uguKwGCo0yiHsFbQojYwn6/U8M6lVbwMfQ0
 X+rOi5oN2Ld7TSLE/t5uxsomuydNoNM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-BQtUtkXzP12FCtR15Vydig-1; Thu, 23 Jan 2020 11:48:32 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 017C292780
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 16:48:32 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-116-110.ams2.redhat.com
 [10.36.116.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DE4419C69;
 Thu, 23 Jan 2020 16:48:31 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 086/108] virtiofsd: use fuse_lowlevel_is_virtio() in
 fuse_session_destroy()
Date: Thu, 23 Jan 2020 16:46:08 +0000
Message-Id: <20200123164630.91498-87-dgilbert@redhat.com>
In-Reply-To: <20200123164630.91498-1-dgilbert@redhat.com>
References: <20200123164630.91498-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: BQtUtkXzP12FCtR15Vydig-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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

From: Stefan Hajnoczi <stefanha@redhat.com>

vu_socket_path is NULL when --fd=3DFDNUM was used.  Use
fuse_lowlevel_is_virtio() instead.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_lowlevel.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowleve=
l.c
index 70568d22a4..dab6a31e08 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -2537,12 +2537,13 @@ void fuse_session_destroy(struct fuse_session *se)
         close(se->fd);
     }
=20
-    if (se->vu_socket_path) {
+    if (fuse_lowlevel_is_virtio(se)) {
         virtio_session_close(se);
-        free(se->vu_socket_path);
-        se->vu_socket_path =3D NULL;
     }
=20
+    free(se->vu_socket_path);
+    se->vu_socket_path =3D NULL;
+
     free(se);
 }
=20
--=20
2.24.1


