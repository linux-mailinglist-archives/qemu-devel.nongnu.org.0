Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB4F15816D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Feb 2020 18:32:15 +0100 (CET)
Received: from localhost ([::1]:36802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1Cus-0002QF-R7
	for lists+qemu-devel@lfdr.de; Mon, 10 Feb 2020 12:32:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36741)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1j1CsG-0001T1-GN
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 12:29:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1j1CsE-0000f6-RF
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 12:29:32 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:20585
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1j1CsE-0000dE-5F
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 12:29:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581355768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GZ6TwZZMWwT/pbGum1z+9IqaBhael+mMqC6c66cR76c=;
 b=i2otBSkIy+DKzzcl5XZM4mrfn/y/UtNa8eiKNBC2+Rm69zRUpcvSiN316fEmCYzNja/RJD
 5qtHZNGAffTM7566MFgYJ4ZaHwO4mjSzZvNKaIvmZSULSNffdJR8Nh9Q7N7ZvulNlklO31
 lhP+0mT2Z3g0LBkGyZfmUqnjRStuaCE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-rqyjJ66JMmK60cHlHdHZSw-1; Mon, 10 Feb 2020 12:29:26 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7834D800D41
 for <qemu-devel@nongnu.org>; Mon, 10 Feb 2020 17:29:25 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-112.ams2.redhat.com
 [10.36.117.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C38F289F2C;
 Mon, 10 Feb 2020 17:29:24 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 2/5] virtiofsd: fv_create_listen_socket error path socket leak
Date: Mon, 10 Feb 2020 17:29:15 +0000
Message-Id: <20200210172918.95874-3-dgilbert@redhat.com>
In-Reply-To: <20200210172918.95874-1-dgilbert@redhat.com>
References: <20200210172918.95874-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: rqyjJ66JMmK60cHlHdHZSw-1
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

If we fail when bringing up the socket we can leak the listen_fd;
in practice the daemon will exit so it's not really a problem.

Fixes: Coverity CID 1413121
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tools/virtiofsd/fuse_virtio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 80a6e929df..dd1c605dbf 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -916,6 +916,7 @@ static int fv_create_listen_socket(struct fuse_session =
*se)
     old_umask =3D umask(0077);
     if (bind(listen_sock, (struct sockaddr *)&un, addr_len) =3D=3D -1) {
         fuse_log(FUSE_LOG_ERR, "vhost socket bind: %m\n");
+        close(listen_sock);
         umask(old_umask);
         return -1;
     }
@@ -923,6 +924,7 @@ static int fv_create_listen_socket(struct fuse_session =
*se)
=20
     if (listen(listen_sock, 1) =3D=3D -1) {
         fuse_log(FUSE_LOG_ERR, "vhost socket listen: %m\n");
+        close(listen_sock);
         return -1;
     }
=20
--=20
2.24.1


