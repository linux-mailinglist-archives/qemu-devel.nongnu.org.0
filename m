Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3411471AF
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 20:23:24 +0100 (CET)
Received: from localhost ([::1]:35604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iui4Z-0002m3-9t
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 14:23:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41961)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iufeQ-0005YH-GG
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iufeP-0007Ab-ES
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:14 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35510
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iufeP-0007A3-Bj
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579798093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GByAOh4y3vztwD2dXHo8CECh7/Ep0gpiugasTR+/taQ=;
 b=HBEPW6m/5fmsEULPpSJSwYKdcBHuWP7xZYwfaMoX/uC8OjvCv2RYe3pNpbJc6NkRuhs5zU
 0smHAfH3KjaoHOjDiIvJxIvsyhASfLq1HKoyXhOvYBLDWEUmHqF8Y1pdvQkGmNuF1tcsK4
 ji/RngcniceHVQNYji8sxh277d3eNC0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-4sfMQGYaPHCZHAkVWfRTaw-1; Thu, 23 Jan 2020 11:48:08 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9646F7A0D2
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 16:48:07 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-116-110.ams2.redhat.com
 [10.36.116.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E03DA38F;
 Thu, 23 Jan 2020 16:48:06 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 068/108] virtiofsd: passthrough_ll: disable readdirplus on
 cache=never
Date: Thu, 23 Jan 2020 16:45:50 +0000
Message-Id: <20200123164630.91498-69-dgilbert@redhat.com>
In-Reply-To: <20200123164630.91498-1-dgilbert@redhat.com>
References: <20200123164630.91498-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 4sfMQGYaPHCZHAkVWfRTaw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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

From: Miklos Szeredi <mszeredi@redhat.com>

...because the attributes sent in the READDIRPLUS reply would be discarded
anyway.

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index 18d69abcbc..6480c517dc 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -478,6 +478,10 @@ static void lo_init(void *userdata, struct fuse_conn_i=
nfo *conn)
         fuse_log(FUSE_LOG_DEBUG, "lo_init: activating flock locks\n");
         conn->want |=3D FUSE_CAP_FLOCK_LOCKS;
     }
+    if (lo->cache =3D=3D CACHE_NEVER) {
+        fuse_log(FUSE_LOG_DEBUG, "lo_init: disabling readdirplus\n");
+        conn->want &=3D ~FUSE_CAP_READDIRPLUS;
+    }
 }
=20
 static void lo_getattr(fuse_req_t req, fuse_ino_t ino,
--=20
2.24.1


