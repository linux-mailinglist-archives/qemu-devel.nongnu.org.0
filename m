Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2B8146ADB
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 15:08:21 +0100 (CET)
Received: from localhost ([::1]:57678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iud9g-00031S-55
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 09:08:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41133)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iubA2-0003it-L1
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 07:00:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iubA1-0005xd-Mr
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 07:00:34 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31686
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iubA1-0005x9-J9
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 07:00:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579780833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6/webhrA3NyhtD+TSxxpducONMsWWVLp783Gd1+BMWg=;
 b=F6EBsiR0yx/4CKZ2iKIz98e2noVvhdDNbu8uNT5UO5MWwISH+H+QEZIpbXThm38y+i8u6c
 hTNRfoHL9dmOK0GqYYpg8IEXfr1UjziZnfaNT2yit5okgUdUGFAiixsObH5t1NMAZmrFBs
 0IjL3lUWOMcMqtjBgXEsIz5mKwB3eBI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-agtwF3cAPZuPNv-qD2Wpxw-1; Thu, 23 Jan 2020 07:00:29 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F17C8018AC
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 12:00:28 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A661F8575D;
 Thu, 23 Jan 2020 12:00:27 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 069/111] virtiofsd: passthrough_ll: add renameat2 support
Date: Thu, 23 Jan 2020 11:57:59 +0000
Message-Id: <20200123115841.138849-70-dgilbert@redhat.com>
In-Reply-To: <20200123115841.138849-1-dgilbert@redhat.com>
References: <20200123115841.138849-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: agtwF3cAPZuPNv-qD2Wpxw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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

From: Miklos Szeredi <mszeredi@redhat.com>

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index 98114a3f4a..18d69abcbc 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -1099,7 +1099,17 @@ static void lo_rename(fuse_req_t req, fuse_ino_t par=
ent, const char *name,
     }
=20
     if (flags) {
+#ifndef SYS_renameat2
         fuse_reply_err(req, EINVAL);
+#else
+        res =3D syscall(SYS_renameat2, lo_fd(req, parent), name,
+                       lo_fd(req, newparent), newname, flags);
+        if (res =3D=3D -1 && errno =3D=3D ENOSYS) {
+            fuse_reply_err(req, EINVAL);
+        } else {
+            fuse_reply_err(req, res =3D=3D -1 ? errno : 0);
+        }
+#endif
         return;
     }
=20
--=20
2.24.1


