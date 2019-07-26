Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3614760EB
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jul 2019 10:34:39 +0200 (CEST)
Received: from localhost ([::1]:37378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqvgV-0002wz-0V
	for lists+qemu-devel@lfdr.de; Fri, 26 Jul 2019 04:34:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44414)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@redhat.com>) id 1hqvfa-0008Gy-DF
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 04:33:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1hqvfX-0001nS-By
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 04:33:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52004)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1hqvfX-0001ei-40
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 04:33:39 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 66C1F308A958
 for <qemu-devel@nongnu.org>; Fri, 26 Jul 2019 08:33:37 +0000 (UTC)
Received: from localhost (ovpn-117-212.ams2.redhat.com [10.36.117.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A448101E245;
 Fri, 26 Jul 2019 08:33:32 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Date: Fri, 26 Jul 2019 09:33:21 +0100
Message-Id: <20190726083322.13637-3-stefanha@redhat.com>
In-Reply-To: <20190726083322.13637-1-stefanha@redhat.com>
References: <20190726083322.13637-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Fri, 26 Jul 2019 08:33:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 2/3] virtiofsd: add map_alignment to
 fuse_kernel.h
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

This new FUSE_INIT field communicates the alignment constraint for
FUSE_SETUPMAPPING/FUSE_REMOVEMAPPING.

This feature will be implemented in the next commit.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 contrib/virtiofsd/fuse_kernel.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/contrib/virtiofsd/fuse_kernel.h b/contrib/virtiofsd/fuse_ker=
nel.h
index 7722e0ac23..550fc3cb64 100644
--- a/contrib/virtiofsd/fuse_kernel.h
+++ b/contrib/virtiofsd/fuse_kernel.h
@@ -263,6 +263,9 @@ struct fuse_file_lock {
  * FUSE_MAX_PAGES: init_out.max_pages contains the max number of req pag=
es
  * FUSE_CACHE_SYMLINKS: cache READLINK responses
  * FUSE_NO_OPENDIR_SUPPORT: kernel supports zero-message opendir
+ * FUSE_MAP_ALIGNMENT: init_out.map_alignment contains byte alignment fo=
r
+ *                     foffset and moffset fields in struct
+ *                     fuse_setupmapping_out and fuse_removemapping_one.
  */
 #define FUSE_ASYNC_READ		(1 << 0)
 #define FUSE_POSIX_LOCKS	(1 << 1)
@@ -289,6 +292,7 @@ struct fuse_file_lock {
 #define FUSE_MAX_PAGES		(1 << 22)
 #define FUSE_CACHE_SYMLINKS	(1 << 23)
 #define FUSE_NO_OPENDIR_SUPPORT (1 << 24)
+#define FUSE_MAP_ALIGNMENT      (1 << 25)
=20
 /**
  * CUSE INIT request/reply flags
@@ -637,7 +641,8 @@ struct fuse_init_out {
 	uint32_t	time_gran;
 	uint16_t	max_pages;
 	uint16_t	padding;
-	uint32_t	unused[8];
+	uint32_t	map_alignment;
+	uint32_t	unused[7];
 };
=20
 #define CUSE_INIT_INFO_MAX 4096
--=20
2.21.0


