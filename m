Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43791143DD8
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 14:20:29 +0100 (CET)
Received: from localhost ([::1]:53688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ittSF-0003VV-NZ
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 08:20:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52675)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1itshI-00033p-6y
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:32:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1itshC-0004fv-VW
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:31:54 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:39130
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1itshC-0004fi-Rf
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:31:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579609910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HWiIByAcjp7SlbbMio8NBcVI+4+Q6CDcEjnDWRXJptw=;
 b=jPACUvyjW86gi28imDqkGFwxesgeO0LVEMjtOs5TvhdjZ+6F0lgzbV1B0vpw/GoMWvYG8r
 SzJpjFanK1lpd/L234X3R00r0sIyURMKeg5PNTZ/0MK1vF5+adpc2tb8UCPGoJ7RlRGXG8
 tevRGq3nlHlk7Lon3uj+Gh1tuP35wsI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-aUDmpkW7NbK2R7TH4E7liQ-1; Tue, 21 Jan 2020 07:31:49 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D14BF8C7A46;
 Tue, 21 Jan 2020 12:31:47 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ECAE160BE0;
 Tue, 21 Jan 2020 12:31:45 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 berrange@redhat.com, slp@redhat.com, philmd@redhat.com
Subject: [PATCH v2 087/109] virtiofsd: use fuse_lowlevel_is_virtio() in
 fuse_session_destroy()
Date: Tue, 21 Jan 2020 12:24:11 +0000
Message-Id: <20200121122433.50803-88-dgilbert@redhat.com>
In-Reply-To: <20200121122433.50803-1-dgilbert@redhat.com>
References: <20200121122433.50803-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: aUDmpkW7NbK2R7TH4E7liQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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

vu_socket_path is NULL when --fd=3DFDNUM was used.  Use
fuse_lowlevel_is_virtio() instead.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 tools/virtiofsd/fuse_lowlevel.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowleve=
l.c
index 6e8c30fd9b..fe332bcb90 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -2541,12 +2541,13 @@ void fuse_session_destroy(struct fuse_session *se)
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


