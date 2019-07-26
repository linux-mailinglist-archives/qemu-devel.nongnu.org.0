Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B99E6760EA
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jul 2019 10:34:32 +0200 (CEST)
Received: from localhost ([::1]:37376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqvgN-0002JP-M3
	for lists+qemu-devel@lfdr.de; Fri, 26 Jul 2019 04:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45231)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@redhat.com>) id 1hqvfl-0000Rh-0H
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 04:33:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1hqvfh-0002Xr-Js
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 04:33:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45480)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1hqvfh-0002Tl-DY
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 04:33:49 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B011030C583B
 for <qemu-devel@nongnu.org>; Fri, 26 Jul 2019 08:33:48 +0000 (UTC)
Received: from localhost (ovpn-117-212.ams2.redhat.com [10.36.117.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FC8A5D719;
 Fri, 26 Jul 2019 08:33:38 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Date: Fri, 26 Jul 2019 09:33:22 +0100
Message-Id: <20190726083322.13637-4-stefanha@redhat.com>
In-Reply-To: <20190726083322.13637-1-stefanha@redhat.com>
References: <20190726083322.13637-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Fri, 26 Jul 2019 08:33:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 3/3] virtiofsd: implement FUSE_INIT
 map_alignment field
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Communicate the host page size to the FUSE client so that
FUSE_SETUPMAPPING/FUSE_REMOVEMAPPING requests are aware of our alignment
constraints.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 contrib/virtiofsd/fuse_lowlevel.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/contrib/virtiofsd/fuse_lowlevel.c b/contrib/virtiofsd/fuse_l=
owlevel.c
index dbbfda78bf..452dd6b2b0 100644
--- a/contrib/virtiofsd/fuse_lowlevel.c
+++ b/contrib/virtiofsd/fuse_lowlevel.c
@@ -2131,6 +2131,12 @@ static void do_init(fuse_req_t req, fuse_ino_t nod=
eid,
 	}
 	if (se->conn.proto_minor >=3D 23)
 		outarg.time_gran =3D se->conn.time_gran;
+	if (arg->flags & FUSE_MAP_ALIGNMENT) {
+		outarg.flags |=3D FUSE_MAP_ALIGNMENT;
+
+		/* This constraint comes from mmap(2) and munmap(2) */
+		outarg.map_alignment =3D sysconf(_SC_PAGE_SIZE);
+	}
=20
 	if (se->debug) {
 		fuse_debug("   INIT: %u.%u\n", outarg.major, outarg.minor);
@@ -2144,6 +2150,8 @@ static void do_init(fuse_req_t req, fuse_ino_t node=
id,
 			   outarg.congestion_threshold);
 		fuse_debug("   time_gran=3D%u\n",
 			   outarg.time_gran);
+		fuse_debug("   map_alignment=3D%u\n",
+			   outarg.map_alignment);
 	}
 	if (arg->minor < 5)
 		outargsize =3D FUSE_COMPAT_INIT_OUT_SIZE;
--=20
2.21.0


