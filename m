Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3A71C740
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 12:53:28 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45374 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQV3o-0005yp-0y
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 06:53:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36078)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1hQUsg-0005wH-6e
	for qemu-devel@nongnu.org; Tue, 14 May 2019 06:41:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1hQUsf-0001JN-AV
	for qemu-devel@nongnu.org; Tue, 14 May 2019 06:41:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34534)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1hQUsf-0001Hs-50
	for qemu-devel@nongnu.org; Tue, 14 May 2019 06:41:57 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7FA53811D8
	for <qemu-devel@nongnu.org>; Tue, 14 May 2019 10:41:56 +0000 (UTC)
Received: from localhost (unknown [10.36.112.10])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5D02B60BCF;
	Tue, 14 May 2019 10:41:48 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 14 May 2019 12:41:25 +0200
Message-Id: <20190514104126.6294-3-marcandre.lureau@redhat.com>
In-Reply-To: <20190514104126.6294-1-marcandre.lureau@redhat.com>
References: <20190514104126.6294-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 14 May 2019 10:41:56 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 2/3] libvhost-user: fix -Werror=format= on
 ppc64
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

That should fix the following warning:

/home/pm215/qemu/contrib/libvhost-user/libvhost-user.c: In function
=E2=80=98vu_set_mem_table_exec_postcopy=E2=80=99:
/home/pm215/qemu/contrib/libvhost-user/libvhost-user.c:666:9: error:
format =E2=80=98%llx=E2=80=99 expects argument of type =E2=80=98long long=
 unsigned int=E2=80=99, but
argument 5 has type =E2=80=98__u64=E2=80=99 [-Werror=3Dformat=3D]
         DPRINT("%s: region %d: Registered userfault for %llx + %llx\n",
         ^
/home/pm215/qemu/contrib/libvhost-user/libvhost-user.c:666:9: error:
format =E2=80=98%llx=E2=80=99 expects argument of type =E2=80=98long long=
 unsigned int=E2=80=99, but
argument 6 has type =E2=80=98__u64=E2=80=99 [-Werror=3Dformat=3D]
cc1: all warnings being treated as errors

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 contrib/libvhost-user/libvhost-user.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/contrib/libvhost-user/libvhost-user.c b/contrib/libvhost-use=
r/libvhost-user.c
index 40443a3daa..ab85166b15 100644
--- a/contrib/libvhost-user/libvhost-user.c
+++ b/contrib/libvhost-user/libvhost-user.c
@@ -663,8 +663,10 @@ vu_set_mem_table_exec_postcopy(VuDev *dev, VhostUser=
Msg *vmsg)
                      __func__, i);
             return false;
         }
-        DPRINT("%s: region %d: Registered userfault for %llx + %llx\n",
-                __func__, i, reg_struct.range.start, reg_struct.range.le=
n);
+        DPRINT("%s: region %d: Registered userfault for %"
+               PRIu64 " + %" PRIu64 "\n", __func__, i,
+               (uint64_t)reg_struct.range.start,
+               (uint64_t)reg_struct.range.len);
         /* Now it's registered we can let the client at it */
         if (mprotect((void *)(uintptr_t)dev_region->mmap_addr,
                      dev_region->size + dev_region->mmap_offset,
--=20
2.21.0.777.g83232e3864


