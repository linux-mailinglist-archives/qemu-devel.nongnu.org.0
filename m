Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3D11471A8
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 20:20:24 +0100 (CET)
Received: from localhost ([::1]:35548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iui1e-0007ES-LC
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 14:20:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41629)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iufeJ-0005Oy-2z
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iufeH-0006sU-ST
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:06 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:57296
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iufeH-0006rX-PO
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579798085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bf+C3T3SpDxLhRxNpY/KwuzIY8CVjxDCL8y6reb/99U=;
 b=Hz322FIviHaLh69SCOCr9jnchPxqTPz48yDELO36exQGvdv+38h0AKVwv47ZoeHVwe3sTf
 7QEK3u6o2EU/taTuNg/NsIHVe378bTwQ66ztxA0V+UG4se7kwz+5TysPMHjYj1apTfjXmz
 qVoaj11f52Q3NPbGOwxK8zpnZv++aLI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-xPrFGE8hNW6T5WPX2VdHCQ-1; Thu, 23 Jan 2020 11:48:03 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B8F3108598C
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 16:48:02 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-116-110.ams2.redhat.com
 [10.36.116.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E817219C69;
 Thu, 23 Jan 2020 16:48:01 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 063/108] virtiofsd: Handle hard reboot
Date: Thu, 23 Jan 2020 16:45:45 +0000
Message-Id: <20200123164630.91498-64-dgilbert@redhat.com>
In-Reply-To: <20200123164630.91498-1-dgilbert@redhat.com>
References: <20200123164630.91498-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: xPrFGE8hNW6T5WPX2VdHCQ-1
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

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Handle a
  mount
  hard reboot (without unmount)
  mount

we get another 'init' which FUSE doesn't normally expect.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_lowlevel.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowleve=
l.c
index 7d742b5a72..65f91dabae 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -2433,7 +2433,21 @@ void fuse_session_process_buf_int(struct fuse_sessio=
n *se,
             goto reply_err;
         }
     } else if (in->opcode =3D=3D FUSE_INIT || in->opcode =3D=3D CUSE_INIT)=
 {
-        goto reply_err;
+        if (fuse_lowlevel_is_virtio(se)) {
+            /*
+             * TODO: This is after a hard reboot typically, we need to do
+             * a destroy, but we can't reply to this request yet so
+             * we can't use do_destroy
+             */
+            fuse_log(FUSE_LOG_DEBUG, "%s: reinit\n", __func__);
+            se->got_destroy =3D 1;
+            se->got_init =3D 0;
+            if (se->op.destroy) {
+                se->op.destroy(se->userdata);
+            }
+        } else {
+            goto reply_err;
+        }
     }
=20
     err =3D EACCES;
--=20
2.24.1


