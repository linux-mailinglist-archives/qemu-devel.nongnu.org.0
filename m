Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 368F314DDC1
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 16:26:29 +0100 (CET)
Received: from localhost ([::1]:34176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixBi8-00032J-AL
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 10:26:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54425)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ixBeU-0007Fb-0I
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 10:22:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ixBeS-0007TD-SZ
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 10:22:41 -0500
Received: from relay.sw.ru ([185.231.240.75]:47748)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ixBeQ-0007Ic-8j; Thu, 30 Jan 2020 10:22:38 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1ixBeK-0008C5-G4; Thu, 30 Jan 2020 18:22:32 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/3] block/file-posix: add raw_getlength_fd
Date: Thu, 30 Jan 2020 18:22:16 +0300
Message-Id: <20200130152218.7600-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200130152218.7600-1-vsementsov@virtuozzo.com>
References: <20200130152218.7600-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: kwolf@redhat.com, den@openvz.org, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add function which can handle separate fd, to be called from
raw_probe_alignment in the following commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/file-posix.c | 44 +++++++++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 1b805bd938..7f366046c2 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -178,7 +178,21 @@ typedef struct BDRVRawReopenState {
 } BDRVRawReopenState;
 
 static int fd_open(BlockDriverState *bs);
-static int64_t raw_getlength(BlockDriverState *bs);
+static int64_t raw_getlength_fd(BlockDriverState *bs, int fd);
+
+static int64_t raw_getlength(BlockDriverState *bs)
+{
+    BDRVRawState *s = bs->opaque;
+    int ret;
+
+    ret = fd_open(bs);
+    if (ret < 0) {
+        return ret;
+    }
+
+    return raw_getlength_fd(bs, s->fd);
+}
+
 
 typedef struct RawPosixAIOData {
     BlockDriverState *bs;
@@ -2063,10 +2077,8 @@ static int coroutine_fn raw_co_truncate(BlockDriverState *bs, int64_t offset,
 }
 
 #ifdef __OpenBSD__
-static int64_t raw_getlength(BlockDriverState *bs)
+static int64_t raw_getlength_fd(BlockDriverState *bs, int fd)
 {
-    BDRVRawState *s = bs->opaque;
-    int fd = s->fd;
     struct stat st;
 
     if (fstat(fd, &st))
@@ -2082,10 +2094,8 @@ static int64_t raw_getlength(BlockDriverState *bs)
         return st.st_size;
 }
 #elif defined(__NetBSD__)
-static int64_t raw_getlength(BlockDriverState *bs)
+static int64_t raw_getlength_fd(BlockDriverState *bs, int fd)
 {
-    BDRVRawState *s = bs->opaque;
-    int fd = s->fd;
     struct stat st;
 
     if (fstat(fd, &st))
@@ -2107,22 +2117,16 @@ static int64_t raw_getlength(BlockDriverState *bs)
         return st.st_size;
 }
 #elif defined(__sun__)
-static int64_t raw_getlength(BlockDriverState *bs)
+static int64_t raw_getlength_fd(BlockDriverState *bs, int fd)
 {
-    BDRVRawState *s = bs->opaque;
     struct dk_minfo minfo;
     int ret;
     int64_t size;
 
-    ret = fd_open(bs);
-    if (ret < 0) {
-        return ret;
-    }
-
     /*
      * Use the DKIOCGMEDIAINFO ioctl to read the size.
      */
-    ret = ioctl(s->fd, DKIOCGMEDIAINFO, &minfo);
+    ret = ioctl(fd, DKIOCGMEDIAINFO, &minfo);
     if (ret != -1) {
         return minfo.dki_lbsize * minfo.dki_capacity;
     }
@@ -2131,17 +2135,16 @@ static int64_t raw_getlength(BlockDriverState *bs)
      * There are reports that lseek on some devices fails, but
      * irc discussion said that contingency on contingency was overkill.
      */
-    size = lseek(s->fd, 0, SEEK_END);
+    size = lseek(fd, 0, SEEK_END);
     if (size < 0) {
         return -errno;
     }
     return size;
 }
 #elif defined(CONFIG_BSD)
-static int64_t raw_getlength(BlockDriverState *bs)
+static int64_t raw_getlength_fd(BlockDriverState *bs, int fd)
 {
     BDRVRawState *s = bs->opaque;
-    int fd = s->fd;
     int64_t size;
     struct stat sb;
 #if defined (__FreeBSD__) || defined(__FreeBSD_kernel__)
@@ -2212,9 +2215,8 @@ again:
     return size;
 }
 #else
-static int64_t raw_getlength(BlockDriverState *bs)
+static int64_t raw_getlength_fd(BlockDriverState *bs, int fd)
 {
-    BDRVRawState *s = bs->opaque;
     int ret;
     int64_t size;
 
@@ -2223,7 +2225,7 @@ static int64_t raw_getlength(BlockDriverState *bs)
         return ret;
     }
 
-    size = lseek(s->fd, 0, SEEK_END);
+    size = lseek(fd, 0, SEEK_END);
     if (size < 0) {
         return -errno;
     }
-- 
2.21.0


