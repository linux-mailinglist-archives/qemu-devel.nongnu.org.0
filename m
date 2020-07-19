Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B89225244
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Jul 2020 16:44:19 +0200 (CEST)
Received: from localhost ([::1]:38254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxAY6-0007C1-MG
	for lists+qemu-devel@lfdr.de; Sun, 19 Jul 2020 10:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <abccfcad6764986c8442f2163de618af11232475@lizzy.crudebyte.com>)
 id 1jxAXO-0006lC-77
 for qemu-devel@nongnu.org; Sun, 19 Jul 2020 10:43:34 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:33221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <abccfcad6764986c8442f2163de618af11232475@lizzy.crudebyte.com>)
 id 1jxAXM-0005au-LZ
 for qemu-devel@nongnu.org; Sun, 19 Jul 2020 10:43:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=c2gjWlA9KXE9xMxvVd4GTnin4I8DBwh8bFZ8rcqFpbY=; b=Zaa+7
 mWqz+AGuPgUQ9P3bXZE3jFPNn1Z/EPAMOZWbNGD7ogV+cZTtWZfbaJCJUrkp5hMW9xYwdOvnuJ9DS
 gKFSw8jjHsPlU+nc5ucCtZXBq9AR/UUOwuT3jp75FGy+iOfYDyKiaJn6WeQk4j9MYjKKX4DDq9PAE
 j53uw59aPJ7JblzKEjhgAPy58T6gIVPMtA3f5LwjiKQhkQP71/I/vIDMuqXvBseVOkocT109II6tD
 TgR3ru+LatJVpOpLnyNUc2XFjEfnVNafgH3mAZqNWBzW/xgjpMmd0y1r0ls+ky/1MP6K4BJpQl13n
 GghQLcR1Calqj911PZI0ixbmODDFg==;
Message-Id: <abccfcad6764986c8442f2163de618af11232475.1595166227.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1595166227.git.qemu_oss@crudebyte.com>
References: <cover.1595166227.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Sun, 19 Jul 2020 15:20:11 +0200
Subject: [PATCH v7 5/6] 9pfs: differentiate readdir lock between 9P2000.u vs.
 9P2000.L
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=abccfcad6764986c8442f2163de618af11232475@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/19 10:12:15
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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

Previous patch suggests that it might make sense to use a different mutex
type now while handling readdir requests, depending on the precise
protocol variant, as v9fs_do_readdir_with_stat() (used by 9P2000.u) uses
a CoMutex to avoid deadlocks that might happen with QemuMutex otherwise,
whereas do_readdir_many() (used by 9P2000.L) should better use a
QemuMutex, as the precise behaviour of a failed CoMutex lock on fs driver
side would not be clear.

This patch is just intended as transitional measure, as currently 9P2000.u
vs. 9P2000.L implementations currently differ where the main logic of
fetching directory entries is located at (9P2000.u still being more top
half focused, while 9P2000.L already being bottom half focused in regards
to fetching directory entries that is).

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p.c |  4 ++--
 hw/9pfs/9p.h | 27 ++++++++++++++++++++++-----
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index cc4094b971..a0881ddc88 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -314,8 +314,8 @@ static V9fsFidState *alloc_fid(V9fsState *s, int32_t fid)
     f->next = s->fid_list;
     s->fid_list = f;
 
-    v9fs_readdir_init(&f->fs.dir);
-    v9fs_readdir_init(&f->fs_reclaim.dir);
+    v9fs_readdir_init(s->proto_version, &f->fs.dir);
+    v9fs_readdir_init(s->proto_version, &f->fs_reclaim.dir);
 
     return f;
 }
diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
index 93b7030edf..3dd1b50b1a 100644
--- a/hw/9pfs/9p.h
+++ b/hw/9pfs/9p.h
@@ -197,22 +197,39 @@ typedef struct V9fsXattr
 
 typedef struct V9fsDir {
     DIR *stream;
-    CoMutex readdir_mutex;
+    P9ProtoVersion proto_version;
+    /* readdir mutex type used for 9P2000.u protocol variant */
+    CoMutex readdir_mutex_u;
+    /* readdir mutex type used for 9P2000.L protocol variant */
+    QemuMutex readdir_mutex_L;
 } V9fsDir;
 
 static inline void v9fs_readdir_lock(V9fsDir *dir)
 {
-    qemu_co_mutex_lock(&dir->readdir_mutex);
+    if (dir->proto_version == V9FS_PROTO_2000U) {
+        qemu_co_mutex_lock(&dir->readdir_mutex_u);
+    } else {
+        qemu_mutex_lock(&dir->readdir_mutex_L);
+    }
 }
 
 static inline void v9fs_readdir_unlock(V9fsDir *dir)
 {
-    qemu_co_mutex_unlock(&dir->readdir_mutex);
+    if (dir->proto_version == V9FS_PROTO_2000U) {
+        qemu_co_mutex_unlock(&dir->readdir_mutex_u);
+    } else {
+        qemu_mutex_unlock(&dir->readdir_mutex_L);
+    }
 }
 
-static inline void v9fs_readdir_init(V9fsDir *dir)
+static inline void v9fs_readdir_init(P9ProtoVersion proto_version, V9fsDir *dir)
 {
-    qemu_co_mutex_init(&dir->readdir_mutex);
+    dir->proto_version = proto_version;
+    if (proto_version == V9FS_PROTO_2000U) {
+        qemu_co_mutex_init(&dir->readdir_mutex_u);
+    } else {
+        qemu_mutex_init(&dir->readdir_mutex_L);
+    }
 }
 
 /**
-- 
2.20.1


