Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C44D8DF5
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Oct 2019 12:33:43 +0200 (CEST)
Received: from localhost ([::1]:40664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKgcg-0007R9-0y
	for lists+qemu-devel@lfdr.de; Wed, 16 Oct 2019 06:33:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35980)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <misono.tomohiro@fujitsu.com>) id 1iKga9-0006Ri-0L
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 06:31:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <misono.tomohiro@fujitsu.com>) id 1iKga4-0006GA-4S
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 06:31:04 -0400
Received: from mgwym04.jp.fujitsu.com ([211.128.242.43]:42843)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <misono.tomohiro@fujitsu.com>)
 id 1iKga2-0006Fa-BQ
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 06:31:00 -0400
Received: from yt-mxauth.gw.nic.fujitsu.com (unknown [192.168.229.68]) by
 mgwym04.jp.fujitsu.com with smtp
 id 5cc6_13a4_95c720a2_6587_411c_9454_ce4b7341e6f3;
 Wed, 16 Oct 2019 19:30:51 +0900
Received: from g01jpfmpwkw02.exch.g01.fujitsu.local
 (g01jpfmpwkw02.exch.g01.fujitsu.local [10.0.193.56])
 by yt-mxauth.gw.nic.fujitsu.com (Postfix) with ESMTP id 9841AAC00C6
 for <qemu-devel@nongnu.org>; Wed, 16 Oct 2019 19:30:50 +0900 (JST)
Received: from G01JPEXCHKW17.g01.fujitsu.local
 (G01JPEXCHKW17.g01.fujitsu.local [10.0.194.56])
 by g01jpfmpwkw02.exch.g01.fujitsu.local (Postfix) with ESMTP id 99DE93284C9;
 Wed, 16 Oct 2019 19:30:49 +0900 (JST)
Received: from luna3.soft.fujitsu.com (10.124.196.199) by
 G01JPEXCHKW17.g01.fujitsu.local (10.0.194.56) with Microsoft SMTP Server id
 14.3.439.0; Wed, 16 Oct 2019 19:30:49 +0900
From: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
To: <virtio-fs@redhat.com>
Subject: [PATCH 2/2] virtiofsd: Allow setxattr operation to directry
Date: Wed, 16 Oct 2019 19:37:54 +0900
Message-ID: <20191016103754.2047-3-misono.tomohiro@jp.fujitsu.com>
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
X-Received-From: 211.128.242.43
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

setxattr to directry fails because lo_setxattr (and lo_remove_xattr)
tries to open any file with O_RDWR even if it is a directory.
Since O_RDONLY is enough for the operation, change O_RDWR flag to
O_RDONLY to fix the problem.

Signed-off-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
---
 contrib/virtiofsd/passthrough_ll.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/contrib/virtiofsd/passthrough_ll.c b/contrib/virtiofsd/passthrough_ll.c
index 645324da58..1b439d58ed 100644
--- a/contrib/virtiofsd/passthrough_ll.c
+++ b/contrib/virtiofsd/passthrough_ll.c
@@ -2397,7 +2397,7 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *name,
 	}
 
 	sprintf(procname, "%i", inode->fd);
-	fd = openat(lo->proc_self_fd, procname, O_RDWR|O_NONBLOCK);
+	fd = openat(lo->proc_self_fd, procname, O_RDONLY|O_NONBLOCK);
 	if (fd < 0) {
 		saverr = errno;
 		goto out;
@@ -2446,7 +2446,7 @@ static void lo_removexattr(fuse_req_t req, fuse_ino_t ino, const char *name)
 	}
 
 	sprintf(procname, "%i", inode->fd);
-	fd = openat(lo->proc_self_fd, procname, O_RDWR|O_NONBLOCK);
+	fd = openat(lo->proc_self_fd, procname, O_RDONLY|O_NONBLOCK);
 	if (fd < 0) {
 		saverr = errno;
 		goto out;
-- 
2.21.0


