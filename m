Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE2828129
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 17:28:05 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38852 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTpdU-00069k-3n
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 11:28:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44203)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hTpYe-0002VP-3e
	for qemu-devel@nongnu.org; Thu, 23 May 2019 11:23:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hTpYd-0006LY-6n
	for qemu-devel@nongnu.org; Thu, 23 May 2019 11:23:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46262)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>)
	id 1hTpYZ-0006HX-TW; Thu, 23 May 2019 11:23:00 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C4D3C916CA;
	Thu, 23 May 2019 15:22:58 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-222.ams2.redhat.com
	[10.36.117.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E1A1C64027;
	Thu, 23 May 2019 15:22:56 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 23 May 2019 17:22:49 +0200
Message-Id: <20190523152250.106717-3-sgarzare@redhat.com>
In-Reply-To: <20190523152250.106717-1-sgarzare@redhat.com>
References: <20190523152250.106717-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 23 May 2019 15:22:58 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 2/3] block/file-posix: update .help of
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


