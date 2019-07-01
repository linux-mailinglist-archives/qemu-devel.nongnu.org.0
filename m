Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1012529251
	for <lists+qemu-devel@lfdr.de>; Fri, 24 May 2019 10:02:15 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50698 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hU59a-0005OB-3O
	for lists+qemu-devel@lfdr.de; Fri, 24 May 2019 04:02:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33379)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hU56k-000439-97
	for qemu-devel@nongnu.org; Fri, 24 May 2019 03:59:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hU56j-0003tq-B1
	for qemu-devel@nongnu.org; Fri, 24 May 2019 03:59:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33968)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>)
	id 1hU56d-0003Zl-St; Fri, 24 May 2019 03:59:12 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DCCF7308795E;
	Fri, 24 May 2019 07:59:01 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-118.ams2.redhat.com
	[10.36.117.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 07E2D1001F5B;
	Fri, 24 May 2019 07:58:59 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 24 May 2019 09:58:47 +0200
Message-Id: <20190524075848.23781-3-sgarzare@redhat.com>
In-Reply-To: <20190524075848.23781-1-sgarzare@redhat.com>
References: <20190524075848.23781-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Fri, 24 May 2019 07:59:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 2/3] block/file-posix: update .help of
 BLOCK_OPT_PREALLOC option
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, integration@gluster.org,
	qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Show 'falloc' among the allowed values of 'preallocation'
option, only when it is supported (if defined CONFIG_POSIX_FALLOCATE)

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 block/file-posix.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index d018429672..9632e3a87b 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2751,7 +2751,11 @@ static QemuOptsList raw_create_opts =3D {
         {
             .name =3D BLOCK_OPT_PREALLOC,
             .type =3D QEMU_OPT_STRING,
-            .help =3D "Preallocation mode (allowed values: off, falloc, =
full)"
+            .help =3D "Preallocation mode (allowed values: off"
+#ifdef CONFIG_POSIX_FALLOCATE
+                    ", falloc"
+#endif
+                    ", full)"
         },
         { /* end of list */ }
     }
--=20
2.20.1


