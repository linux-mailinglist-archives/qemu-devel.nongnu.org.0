Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B73451223F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 21:14:55 +0200 (CEST)
Received: from localhost ([::1]:47758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njn7k-0005Mm-FH
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 15:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <489275615f29a2efc97cbd6130c98669ed28a24b@lizzy.crudebyte.com>)
 id 1njn4h-0002SZ-C8; Wed, 27 Apr 2022 15:11:43 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:32965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <489275615f29a2efc97cbd6130c98669ed28a24b@lizzy.crudebyte.com>)
 id 1njn4f-0008Pp-Oe; Wed, 27 Apr 2022 15:11:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=556k4ngJS5CyCJoMXwyu7XACdGcph3syQGhlYecwWg4=; b=Qbli6
 Zil54yE9yxi6m+Inhkv2M20omIgd+UaK/Esrcs2iQ63+dZ7WVitEG6yeNwILt++mFAoVT/k5XCRvh
 e4vGoa7PiUprkLBtl5864d2sqoxwKD8NsWZXtuER7B+InjOEck4jttNr/iFRMrBZkrgw/r/lxeBqn
 QRYlXo90apbkycoR/2NUFERoE8UT4bLPbXRvGpH+VrlmOxCIshZxF3vRoss1uKKvqAQ97BMEYO41G
 OkUYcg2xOJzor6U8FZw028Jpv/ooR1+qfTF3TOTXfQe+89wcAr4NIBBgOw6KPzG2lyIQEDzzODmuC
 vlBZbiyF+tE6SsUisrDn27Q87Ncvg==;
Message-Id: <489275615f29a2efc97cbd6130c98669ed28a24b.1651085922.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1651085921.git.qemu_oss@crudebyte.com>
References: <cover.1651085921.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Wed, 27 Apr 2022 20:54:17 +0200
Subject: [PATCH v4 2/6] 9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Greg Kurz <groug@kaod.org>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-stable@nongnu.org
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=489275615f29a2efc97cbd6130c98669ed28a24b@lizzy.crudebyte.com;
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
 hw/9pfs/9p-util-darwin.c | 45 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
index e24d09763a..7d00db47a9 100644
--- a/hw/9pfs/9p-util-darwin.c
+++ b/hw/9pfs/9p-util-darwin.c
@@ -74,6 +74,45 @@ int fsetxattrat_nofollow(int dirfd, const char *filename, const char *name,
  */
 #if defined CONFIG_PTHREAD_FCHDIR_NP
 
+static int create_socket_file_at_cwd(const char *filename, mode_t mode) {
+    int fd, err;
+    struct sockaddr_un addr = {
+        .sun_family = AF_UNIX
+    };
+
+    /*
+     * sun_path is only 104 bytes, explicit filename length check required
+     */
+    if (sizeof(addr.sun_path) - 1 < strlen(filename) + 2) {
+        errno = ENAMETOOLONG;
+        return -1;
+    }
+    fd = socket(PF_UNIX, SOCK_DGRAM, 0);
+    if (fd == -1) {
+        return fd;
+    }
+    snprintf(addr.sun_path, sizeof(addr.sun_path), "./%s", filename);
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
@@ -93,7 +132,11 @@ int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
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


