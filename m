Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BB811D492
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 18:52:36 +0100 (CET)
Received: from localhost ([::1]:34966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifSde-0007L9-J8
	for lists+qemu-devel@lfdr.de; Thu, 12 Dec 2019 12:52:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34817)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1ifRWr-0007US-84
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 11:41:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1ifRWq-0004RL-6T
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 11:41:29 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45457
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1ifRWq-0004QT-2X
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 11:41:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576168887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dVK/Cd7GL5Sino0BgL5kDJS5DLTJ6RzlC9NmY+mMTtk=;
 b=QIQ0dUVPyvEPwPJgUX/mShE3FiOyMRniPRzMt7XbA7KwaBTrKWC1p10VfBLQ9qIfSr6cqE
 sVXW5/BW0BfeSPcyIzItYZpGofKycBHoR0WNcQYX5hee0qo0fICEWnMgu7FgVInMOK0UDI
 MY/fiOWIK4tFFEOHx9xM8E90bxkLgag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-mOOufpjyPwyX5pI7jLGvog-1; Thu, 12 Dec 2019 11:41:26 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83BE6DC54
 for <qemu-devel@nongnu.org>; Thu, 12 Dec 2019 16:41:25 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-116-226.ams2.redhat.com
 [10.36.116.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AAC4860BE1;
 Thu, 12 Dec 2019 16:41:24 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com,
	vgoyal@redhat.com
Subject: [PATCH 086/104] virtiofsd: use fuse_lowlevel_is_virtio() in
 fuse_session_destroy()
Date: Thu, 12 Dec 2019 16:38:46 +0000
Message-Id: <20191212163904.159893-87-dgilbert@redhat.com>
In-Reply-To: <20191212163904.159893-1-dgilbert@redhat.com>
References: <20191212163904.159893-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: mOOufpjyPwyX5pI7jLGvog-1
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

vu_socket_path is NULL when --fd=3DFDNUM was used.  Use
fuse_lowlevel_is_virtio() instead.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
  pull request 10
---
 tools/virtiofsd/fuse_lowlevel.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowleve=
l.c
index 4b5fe1d7a1..10f478b00c 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -2544,12 +2544,13 @@ void fuse_session_destroy(struct fuse_session *se)
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
2.23.0


