Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAE114712F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 19:53:15 +0100 (CET)
Received: from localhost ([::1]:35116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuhbO-0000mK-88
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 13:53:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41323)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iufdz-00050e-1B
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:47:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iufdy-0006ZH-2v
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:47:46 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42439
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iufdy-0006Z9-0U
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:47:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579798065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=srgrOmyFieyXx9t0NbqY+EjRMqoi8g4ZeWHCIOGsTbs=;
 b=J+wTER3aXEvUX21OzLqbpDIGVCU50vOCbOoiQ+I37EsR61zVskoOOfku6MEJ2wxVC6xFxB
 q/TlkiPi/TSsIpS/HHHrqm+d6AvzdjPlZkYfzaOK5z3LFCtxg9+iaG7PRA6GOas17OK0cG
 JaD6wvMi+k1jJvJAMrCpLbnYhIzJJgY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-aHQ11TqjMHSWr5KpJkJKmQ-1; Thu, 23 Jan 2020 11:47:44 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 746601034B22
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 16:47:43 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-116-110.ams2.redhat.com
 [10.36.116.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C210B28994;
 Thu, 23 Jan 2020 16:47:42 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 046/108] virtiofsd: prevent ".." escape in lo_do_lookup()
Date: Thu, 23 Jan 2020 16:45:28 +0000
Message-Id: <20200123164630.91498-47-dgilbert@redhat.com>
In-Reply-To: <20200123164630.91498-1-dgilbert@redhat.com>
References: <20200123164630.91498-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: aHQ11TqjMHSWr5KpJkJKmQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index e375406160..79d5966eea 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -624,12 +624,17 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t pa=
rent, const char *name,
     int res;
     int saverr;
     struct lo_data *lo =3D lo_data(req);
-    struct lo_inode *inode;
+    struct lo_inode *inode, *dir =3D lo_inode(req, parent);
=20
     memset(e, 0, sizeof(*e));
     e->attr_timeout =3D lo->timeout;
     e->entry_timeout =3D lo->timeout;
=20
+    /* Do not allow escaping root directory */
+    if (dir =3D=3D &lo->root && strcmp(name, "..") =3D=3D 0) {
+        name =3D ".";
+    }
+
     newfd =3D openat(lo_fd(req, parent), name, O_PATH | O_NOFOLLOW);
     if (newfd =3D=3D -1) {
         goto out_err;
--=20
2.24.1


