Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D4C167EBC
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 14:36:00 +0100 (CET)
Received: from localhost ([::1]:57870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j58TH-0007ug-Qk
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 08:35:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32940)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1j58JV-0002qf-E6
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 08:25:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1j58JU-0007Iq-4e
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 08:25:53 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:43132
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1j58JU-0007G2-0H
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 08:25:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582291548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=APsBDV8v6Rdge5cAZAlMpEcC2lgAY5iiZWQDzi9u8nc=;
 b=evWnp0PDFCucCmsZfeI8H60C0P1myf4+bQRnRO3M8euuF2Z3znBZNlu4ksEKCdNnCvJIc3
 i/d1WlAPGdR/NdFqI3w2G+/0CG1HJIu2t90v2XB85TJzCyzhjWdAhNLk9ELYYpyrPjXvef
 pJdy0A1YUDeUOBIObeOLC/t9C6aLQ3k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-5pDVRltmPA2LhNeijndJZA-1; Fri, 21 Feb 2020 08:25:46 -0500
X-MC-Unique: 5pDVRltmPA2LhNeijndJZA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBFB18017DF;
 Fri, 21 Feb 2020 13:25:45 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.1])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3D778B740;
 Fri, 21 Feb 2020 13:25:44 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, philmd@redhat.com, yangx.jy@cn.fujitsu.com,
 mrezanin@redhat.com
Subject: [PULL 4/6] tools/virtiofsd/fuse_lowlevel: Fix fuse_out_header::error
 value
Date: Fri, 21 Feb 2020 13:25:34 +0000
Message-Id: <20200221132536.38364-5-dgilbert@redhat.com>
In-Reply-To: <20200221132536.38364-1-dgilbert@redhat.com>
References: <20200221132536.38364-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Fix warning reported by Clang static code analyzer:

    CC      tools/virtiofsd/fuse_lowlevel.o
  tools/virtiofsd/fuse_lowlevel.c:195:9: warning: Value stored to 'error' i=
s never read
          error =3D -ERANGE;
          ^       ~~~~~~~

Fixes: 3db2876
Reported-by: Clang Static Analyzer
Reviewed-by: J=C3=A1n Tomko <jtomko@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_lowlevel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowleve=
l.c
index 704c0369b2..2dd36ec03b 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -192,7 +192,7 @@ int fuse_send_reply_iov_nofree(fuse_req_t req, int erro=
r, struct iovec *iov,
=20
     if (error <=3D -1000 || error > 0) {
         fuse_log(FUSE_LOG_ERR, "fuse: bad error value: %i\n", error);
-        error =3D -ERANGE;
+        out.error =3D -ERANGE;
     }
=20
     iov[0].iov_base =3D &out;
--=20
2.24.1


