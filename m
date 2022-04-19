Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D984506C6E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 14:27:56 +0200 (CEST)
Received: from localhost ([::1]:48274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngmxX-00034k-NC
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 08:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <2e88acab7b3f998ceff7232b5e3d6a8a6d2a6f8b@lizzy.crudebyte.com>)
 id 1ngmqU-0002sp-DO; Tue, 19 Apr 2022 08:20:38 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:34977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <2e88acab7b3f998ceff7232b5e3d6a8a6d2a6f8b@lizzy.crudebyte.com>)
 id 1ngmqS-0004if-Pt; Tue, 19 Apr 2022 08:20:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=WQCfwkHY+6/tMntcSzJekfy666I4hevqfvOOEDczNNs=; b=N1klY
 pnh5WXrScbpxb9SMNpPUf0ZGPjPOvLki8OZe0IuXQXp09KevdKKIDzJeM0bnxDWCOepVcm34DkBB/
 +VqpLS/N1HHneyT5UQJfxetRf4XM83KVsgFzHSeSVrX8BWNfzZx8VVaUz/PRS7qpwJngRu+t1tOcj
 3C2HB6MuNUD0XBGsMnckEao8rQNn0PjXQdTqrGdv7ts/QO4O0ct5oKjG/IXarr4p6fnCJ54ctQ29c
 DxXSVp+/x4g1K1XOAG1CB22sr29wNrh6FDeqtO/q55cPJE5bgUR0VkWJGqagKB1IDv8jqgPZCbX7Z
 YTNHIyWM3y2Eajk5O7gQqM6YvaL5A==;
Message-Id: <2e88acab7b3f998ceff7232b5e3d6a8a6d2a6f8b.1650370026.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1650370026.git.qemu_oss@crudebyte.com>
References: <cover.1650370026.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 19 Apr 2022 13:41:03 +0200
Subject: [PATCH 2/5] 9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Greg Kurz <groug@kaod.org>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-stable@nongnu.org
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=2e88acab7b3f998ceff7232b5e3d6a8a6d2a6f8b@lizzy.crudebyte.com;
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
call sequence socket(), bind() and chmod() respectively if S_IFSOCK
was passed with mode argument.

Link: https://lore.kernel.org/qemu-devel/17933734.zYzKuhC07K@silver/
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p-util-darwin.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
index 53e0625501..252a6fc5dd 100644
--- a/hw/9pfs/9p-util-darwin.c
+++ b/hw/9pfs/9p-util-darwin.c
@@ -74,6 +74,24 @@ int fsetxattrat_nofollow(int dirfd, const char *filename, const char *name,
  */
 #if defined CONFIG_PTHREAD_FCHDIR_NP
 
+static int create_socket_file_at_cwd(const char *filename, mode_t mode) {
+    int fd, err;
+    struct sockaddr_un addr = {
+        .sun_family = AF_UNIX
+    };
+
+    fd = socket(PF_UNIX, SOCK_DGRAM, 0);
+    if (fd < 0) {
+        return fd;
+    }
+    snprintf(addr.sun_path, sizeof(addr.sun_path), "./%s", filename);
+    err = bind(fd, (struct sockaddr *) &addr, sizeof(addr));
+    if (err < 0) {
+        return err;
+    }
+    return chmod(addr.sun_path, mode);
+}
+
 int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
 {
     int preserved_errno, err;
@@ -88,7 +106,11 @@ int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
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


