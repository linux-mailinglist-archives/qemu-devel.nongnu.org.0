Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C764CD8E27
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Oct 2019 12:41:00 +0200 (CEST)
Received: from localhost ([::1]:40732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKgjj-0004H8-Sb
	for lists+qemu-devel@lfdr.de; Wed, 16 Oct 2019 06:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35979)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <misono.tomohiro@fujitsu.com>) id 1iKga8-0006Rh-VM
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 06:31:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <misono.tomohiro@fujitsu.com>) id 1iKga4-0006G4-3h
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 06:31:04 -0400
Received: from mgwkm02.jp.fujitsu.com ([202.219.69.169]:46960)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <misono.tomohiro@fujitsu.com>)
 id 1iKga2-0006FM-Aj
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 06:30:59 -0400
Received: from kw-mxauth.gw.nic.fujitsu.com (unknown [192.168.231.132]) by
 mgwkm02.jp.fujitsu.com with smtp
 id 3866_5ffe_eb1f6e5b_66f1_425e_b0c7_02822bc8ecff;
 Wed, 16 Oct 2019 19:30:50 +0900
Received: from g01jpfmpwkw01.exch.g01.fujitsu.local
 (g01jpfmpwkw01.exch.g01.fujitsu.local [10.0.193.38])
 by kw-mxauth.gw.nic.fujitsu.com (Postfix) with ESMTP id 28D09AC00D2
 for <qemu-devel@nongnu.org>; Wed, 16 Oct 2019 19:30:49 +0900 (JST)
Received: from G01JPEXCHKW17.g01.fujitsu.local
 (G01JPEXCHKW17.g01.fujitsu.local [10.0.194.56])
 by g01jpfmpwkw01.exch.g01.fujitsu.local (Postfix) with ESMTP id 3692E6925C7;
 Wed, 16 Oct 2019 19:30:48 +0900 (JST)
Received: from luna3.soft.fujitsu.com (10.124.196.199) by
 G01JPEXCHKW17.g01.fujitsu.local (10.0.194.56) with Microsoft SMTP Server id
 14.3.439.0; Wed, 16 Oct 2019 19:30:48 +0900
From: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
To: <virtio-fs@redhat.com>
Subject: [PATCH 1/2] virtiofsd: Avoid process hang when doing xattr operation
 to FIFO
Date: Wed, 16 Oct 2019 19:37:53 +0900
Message-ID: <20191016103754.2047-2-misono.tomohiro@jp.fujitsu.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191016103754.2047-1-misono.tomohiro@jp.fujitsu.com>
References: <20191016103754.2047-1-misono.tomohiro@jp.fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-GCONF: 00
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 202.219.69.169
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
Cc: qemu-devel@nongnu.org, misono.tomohiro@jp.fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I see xfstest generic/062 causes process hang because of xattr operation to
FIFO created by mknod. The problem is that virtiofsd opens any files
with only O_RDWR or O_RDONLY flags for xattr operation, and therefore
if a file is FIFO, open may not return.

Since O_NONBLOCK flag has no effect to regular files, add it to
open flags to fix the problem.

Signed-off-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
---
 contrib/virtiofsd/passthrough_ll.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/contrib/virtiofsd/passthrough_ll.c b/contrib/virtiofsd/passthrough_ll.c
index 84b60d85bd..645324da58 100644
--- a/contrib/virtiofsd/passthrough_ll.c
+++ b/contrib/virtiofsd/passthrough_ll.c
@@ -2251,7 +2251,7 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *name,
 	}
 
 	sprintf(procname, "%i", inode->fd);
-	fd = openat(lo->proc_self_fd, procname, O_RDONLY);
+	fd = openat(lo->proc_self_fd, procname, O_RDONLY|O_NONBLOCK);
 	if (fd < 0) {
 		goto out_err;
 	}
@@ -2323,7 +2323,7 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
 	}
 
 	sprintf(procname, "%i", inode->fd);
-	fd = openat(lo->proc_self_fd, procname, O_RDONLY);
+	fd = openat(lo->proc_self_fd, procname, O_RDONLY|O_NONBLOCK);
 	if (fd < 0) {
 		goto out_err;
 	}
@@ -2397,7 +2397,7 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *name,
 	}
 
 	sprintf(procname, "%i", inode->fd);
-	fd = openat(lo->proc_self_fd, procname, O_RDWR);
+	fd = openat(lo->proc_self_fd, procname, O_RDWR|O_NONBLOCK);
 	if (fd < 0) {
 		saverr = errno;
 		goto out;
@@ -2446,7 +2446,7 @@ static void lo_removexattr(fuse_req_t req, fuse_ino_t ino, const char *name)
 	}
 
 	sprintf(procname, "%i", inode->fd);
-	fd = openat(lo->proc_self_fd, procname, O_RDWR);
+	fd = openat(lo->proc_self_fd, procname, O_RDWR|O_NONBLOCK);
 	if (fd < 0) {
 		saverr = errno;
 		goto out;
-- 
2.21.0


