Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5EF5147EB
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 13:17:31 +0200 (CEST)
Received: from localhost ([::1]:55732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkOcs-0006Yv-Cm
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 07:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <2e7b5ecd7a6d83a538db4e8a22d8fb03e9e0f06e@lizzy.crudebyte.com>)
 id 1nkO61-0006Uq-NW; Fri, 29 Apr 2022 06:43:33 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:47875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <2e7b5ecd7a6d83a538db4e8a22d8fb03e9e0f06e@lizzy.crudebyte.com>)
 id 1nkO5z-000864-SA; Fri, 29 Apr 2022 06:43:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=Qtl7gjR1rluebtvN9uzweNSJYOjoQEx8+nOtMgAJ/RA=; b=cQMVL
 cF0/00Fvaoy61Kow1ohu1/DVO1CuBZXPgD8McsbI3pVVemeSqon8Ojz+w4vQka4onBJsVU/V97dmy
 xPyze4RxBWEeAVrUl6+y1KnCLES69KYoOWIorKCUx76ZdUt+McJwb7FsSoAurgYhAVYs2uqV21w27
 tSGfa9qXOvHkeGF0bVi0v1w+FoAScCm0ABEaoakVyBbYcsFP8kifGKJMSFQIJeFftW4bP4nVHvwTc
 oMJO49EMGqoN3Zz4KiM3yS5sFUQgX67zVOgwyJg44UqZwOnHBY9syenO84nWuSRJKpYjUhBdgvmJW
 SyyOEU38oJADPMIBA4+k+ibEGTE/w==;
Message-Id: <2e7b5ecd7a6d83a538db4e8a22d8fb03e9e0f06e.1651228001.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1651228000.git.qemu_oss@crudebyte.com>
References: <cover.1651228000.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 29 Apr 2022 12:25:11 +0200
Subject: [PATCH v5 2/6] 9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Greg Kurz <groug@kaod.org>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-stable@nongnu.org
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=2e7b5ecd7a6d83a538db4e8a22d8fb03e9e0f06e@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

mknod() on macOS does not support creating sockets, so divert to
call sequence socket(), bind() and fchmodat() respectively if S_IFSOCK
was passed with mode argument.

Link: https://lore.kernel.org/qemu-devel/17933734.zYzKuhC07K@silver/
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p-util-darwin.c | 42 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
index e24d09763a..619c403ba7 100644
--- a/hw/9pfs/9p-util-darwin.c
+++ b/hw/9pfs/9p-util-darwin.c
@@ -74,6 +74,42 @@ int fsetxattrat_nofollow(int dirfd, const char *filename, const char *name,
  */
 #if defined CONFIG_PTHREAD_FCHDIR_NP
 
+static int create_socket_file_at_cwd(const char *filename, mode_t mode) {
+    int fd, err;
+    struct sockaddr_un addr = {
+        .sun_family = AF_UNIX
+    };
+
+    err = snprintf(addr.sun_path, sizeof(addr.sun_path), "./%s", filename);
+    if (err < 0 || err >= sizeof(addr.sun_path)) {
+        errno = ENAMETOOLONG;
+        return -1;
+    }
+    fd = socket(PF_UNIX, SOCK_DGRAM, 0);
+    if (fd == -1) {
+        return fd;
+    }
+    err = bind(fd, (struct sockaddr *) &addr, sizeof(addr));
+    if (err == -1) {
+        goto out;
+    }
+    /*
+     * FIXME: Should rather be using descriptor-based fchmod() on the
+     * socket file descriptor above (preferably before bind() call),
+     * instead of path-based fchmodat(), to prevent concurrent transient
+     * state issues between creating the named FIFO file at bind() and
+     * delayed adjustment of permissions at fchmodat(). However currently
+     * macOS (12.x) does not support such operations on socket file
+     * descriptors yet.
+     *
+     * Filed report with Apple: FB9997731
+     */
+    err = fchmodat(AT_FDCWD, filename, mode, AT_SYMLINK_NOFOLLOW_ANY);
+out:
+    close_preserve_errno(fd);
+    return err;
+}
+
 int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
 {
     int preserved_errno, err;
@@ -93,7 +129,11 @@ int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
     if (pthread_fchdir_np(dirfd) < 0) {
         return -1;
     }
-    err = mknod(filename, mode, dev);
+    if (S_ISSOCK(mode)) {
+        err = create_socket_file_at_cwd(filename, mode);
+    } else {
+        err = mknod(filename, mode, dev);
+    }
     preserved_errno = errno;
     /* Stop using the thread-local cwd */
     pthread_fchdir_np(-1);
-- 
2.32.0 (Apple Git-132)


