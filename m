Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBD750A671
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:59:49 +0200 (CEST)
Received: from localhost ([::1]:41068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nha9k-0008Qh-UC
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <f6d632fc82d4750b73c83a2f1d1b9972cf3e26bb@lizzy.crudebyte.com>)
 id 1nhYkk-0005Wu-Pe; Thu, 21 Apr 2022 11:29:57 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:50367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <f6d632fc82d4750b73c83a2f1d1b9972cf3e26bb@lizzy.crudebyte.com>)
 id 1nhYkj-00085O-5Q; Thu, 21 Apr 2022 11:29:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=xaJMYu8ijuVhk/JsP36ZEe1Z4+ATS0IlyohaCmDR4rM=; b=AQJEP
 dEf4oMEXTaHEAHUGsCcUcJ5Pd/QSz59ik2ijEg0nwtQQOhsVnbzkUhLIejQ9yb4EzHStkHVN6P0ri
 12PT2NEwQAS5YpQcESxakowzyci6Rhg9z2DzvFwmsXJP1i0NCPPrHgITJfObsqqprq3p/fasNP8MY
 8sDhSo/RCknDR6COIacy6C5zVK37dIpOCQYydU+qR4sgB5/0XIK9iIsUH9Usg9e/w6RFlkWGoUwNC
 sCwxZFSDzUh6BHAGe/oG9y4CQGCFH2yolz8TpPhBgyNEJsHsbiHaeHResbkj5o7Er6DbiORvtIhUG
 xohYm784by+397MTrgSD32vzuWbDg==;
Message-Id: <f6d632fc82d4750b73c83a2f1d1b9972cf3e26bb.1650553693.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1650553693.git.qemu_oss@crudebyte.com>
References: <cover.1650553693.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 21 Apr 2022 17:07:43 +0200
Subject: [PATCH v2 2/5] 9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Greg Kurz <groug@kaod.org>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-stable@nongnu.org
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=f6d632fc82d4750b73c83a2f1d1b9972cf3e26bb@lizzy.crudebyte.com;
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
Reviewed-by: Will Cohen <wwcohen@gmail.com>
---
 hw/9pfs/9p-util-darwin.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
index e24d09763a..39308f2a45 100644
--- a/hw/9pfs/9p-util-darwin.c
+++ b/hw/9pfs/9p-util-darwin.c
@@ -74,6 +74,27 @@ int fsetxattrat_nofollow(int dirfd, const char *filename, const char *name,
  */
 #if defined CONFIG_PTHREAD_FCHDIR_NP
 
+static int create_socket_file_at_cwd(const char *filename, mode_t mode) {
+    int fd, err;
+    struct sockaddr_un addr = {
+        .sun_family = AF_UNIX
+    };
+
+    fd = socket(PF_UNIX, SOCK_DGRAM, 0);
+    if (fd == -1) {
+        return fd;
+    }
+    snprintf(addr.sun_path, sizeof(addr.sun_path), "./%s", filename);
+    err = bind(fd, (struct sockaddr *) &addr, sizeof(addr));
+    if (err == -1) {
+        goto out;
+    }
+    err = chmod(addr.sun_path, mode);
+out:
+    close(fd);
+    return err;
+}
+
 int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
 {
     int preserved_errno, err;
@@ -93,7 +114,11 @@ int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
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


