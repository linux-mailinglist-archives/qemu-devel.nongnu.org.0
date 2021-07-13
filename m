Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E00073C71E6
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 16:12:06 +0200 (CEST)
Received: from localhost ([::1]:42926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3J8n-0002pP-VR
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 10:12:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m3Ifk-0000CE-TY
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:42:05 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:52511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m3Ifi-00066W-SE
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:42:04 -0400
Received: from quad ([82.142.17.146]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Miqzy-1lXFi733m0-00euyL; Tue, 13
 Jul 2021 15:41:59 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 09/12] fd-trans: Fix race condition on reallocation of the
 translation table.
Date: Tue, 13 Jul 2021 15:41:49 +0200
Message-Id: <20210713134152.288423-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210713134152.288423-1-laurent@vivier.eu>
References: <20210713134152.288423-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rQUx2TeaU63sRiprdz7nfJf3PMXktjWGKkp7ymBTmBTI+vgQson
 yWrE3iuZy9W3DHi3UMKWz/MlBvr0KhE+zIypZdzhd9lqF4oWtPeeAVKJ4LA+FRILiB8ZC0d
 NxFLMc4Tm/K/maTN3yDS45bIuhvK3SojRg4sPqtFfvGOmIxUJCzTMZRYCofjm+KsNA4z0/G
 3CRvnrY2gsp6W+snMCYhg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:588x8dZ/+j8=:GIFqVy0R+Byu7NpWSB3mDx
 uLS3A8mpmsWbX5gKEtMTW7i1CeHgvyF7fI9PtPy7U1yuYXYBWgiX098+kXUtV5oP02jEYbhXk
 2B9NsA8A2S6koMDQkfD5XFUlQmZiQGxR6eb7XS10XXJIil3EipqZIB/SPTtl4hqJwu0SP46Ag
 57PQ0Iq9fAmEFluJKTGLkTZYQj8IGsbHvxfxA7vtW8VF/81QQ9Ped/p1Qb6MVJB08FcY09f+I
 bqzSBNktfM7DMjMKN9/Y85L+bqnqDAN8ekMkTGlMKcg5BBtMpUc2Ch87XprldsmyiuAVD05aK
 iB12vLoFrMVT6QgMDP0zYxWIZEqkZ4ZxjISp4D1N5KJp/9sWpubEPyZufoogt5t0jzyqWl3AU
 POGY2lMeYNhPxH5x/2duJO9aZTOYDTqJZYvYNyx+ecmUO6/Bcke3K8rh2WaEsEWMfX3QToxe/
 xN7ggM3kxKw106gyJCfyWYdjilCPOa7IVTHUwDCJuCIeS+htPrs3Nj8HKGPXOIlMa2pKlOiXD
 Fu82PcZrY02LSi/g0gL7EFaAisPq0Tacb5oWr4YU3ubus89QGIVczJxMHStWbAzPAH7Z81M3k
 DlbQ+KJVyMiv3XzfT+zrbDm7M3DfwHZJwfyyDmFiOFAG4PZAdCueCgdJM0Pdr/dWKdP5TQlq7
 ElVl1AsyNwE+0T/C7W8+PrIx5owFUruyXnEcVA5uHryqGDaF+NfbDQYtpqh8sirerXEvtMb+T
 iWI1J8pisLrIp0pfkzua3zluwW1NrQvxGyCj+xqM62MsR46+uhzoxKIEIzsCUF+opOBaLK46V
 rRaOHSu+PxJLJdr5kxwzQD6TYNNu82oQJPziz2zTPYtX40IuYNki9woog9bmJL2x6Lroq6J
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Owen Anderson <oanderso@google.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Owen Anderson <oanderso@google.com>

The mapping from file-descriptors to translator functions is not guarded
on realloc which may cause invalid function pointers to be read from a
previously deallocated mapping.

Signed-off-by: Owen Anderson <oanderso@google.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210701221255.107976-1-oanderso@google.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/fd-trans.c |  1 +
 linux-user/fd-trans.h | 55 +++++++++++++++++++++++++++++++++++++------
 linux-user/main.c     |  3 +++
 3 files changed, 52 insertions(+), 7 deletions(-)

diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
index 23adaca83639..86b6f484d30b 100644
--- a/linux-user/fd-trans.c
+++ b/linux-user/fd-trans.c
@@ -267,6 +267,7 @@ enum {
 };
 
 TargetFdTrans **target_fd_trans;
+QemuMutex target_fd_trans_lock;
 unsigned int target_fd_max;
 
 static void tswap_nlmsghdr(struct nlmsghdr *nlh)
diff --git a/linux-user/fd-trans.h b/linux-user/fd-trans.h
index a3fcdaabc758..1b9fa2041c06 100644
--- a/linux-user/fd-trans.h
+++ b/linux-user/fd-trans.h
@@ -16,6 +16,8 @@
 #ifndef FD_TRANS_H
 #define FD_TRANS_H
 
+#include "qemu/lockable.h"
+
 typedef abi_long (*TargetFdDataFunc)(void *, size_t);
 typedef abi_long (*TargetFdAddrFunc)(void *, abi_ulong, socklen_t);
 typedef struct TargetFdTrans {
@@ -25,12 +27,23 @@ typedef struct TargetFdTrans {
 } TargetFdTrans;
 
 extern TargetFdTrans **target_fd_trans;
+extern QemuMutex target_fd_trans_lock;
 
 extern unsigned int target_fd_max;
 
+static inline void fd_trans_init(void)
+{
+    qemu_mutex_init(&target_fd_trans_lock);
+}
+
 static inline TargetFdDataFunc fd_trans_target_to_host_data(int fd)
 {
-    if (fd >= 0 && fd < target_fd_max && target_fd_trans[fd]) {
+    if (fd < 0) {
+        return NULL;
+    }
+
+    QEMU_LOCK_GUARD(&target_fd_trans_lock);
+    if (fd < target_fd_max && target_fd_trans[fd]) {
         return target_fd_trans[fd]->target_to_host_data;
     }
     return NULL;
@@ -38,7 +51,12 @@ static inline TargetFdDataFunc fd_trans_target_to_host_data(int fd)
 
 static inline TargetFdDataFunc fd_trans_host_to_target_data(int fd)
 {
-    if (fd >= 0 && fd < target_fd_max && target_fd_trans[fd]) {
+    if (fd < 0) {
+        return NULL;
+    }
+
+    QEMU_LOCK_GUARD(&target_fd_trans_lock);
+    if (fd < target_fd_max && target_fd_trans[fd]) {
         return target_fd_trans[fd]->host_to_target_data;
     }
     return NULL;
@@ -46,13 +64,19 @@ static inline TargetFdDataFunc fd_trans_host_to_target_data(int fd)
 
 static inline TargetFdAddrFunc fd_trans_target_to_host_addr(int fd)
 {
-    if (fd >= 0 && fd < target_fd_max && target_fd_trans[fd]) {
+    if (fd < 0) {
+        return NULL;
+    }
+
+    QEMU_LOCK_GUARD(&target_fd_trans_lock);
+    if (fd < target_fd_max && target_fd_trans[fd]) {
         return target_fd_trans[fd]->target_to_host_addr;
     }
     return NULL;
 }
 
-static inline void fd_trans_register(int fd, TargetFdTrans *trans)
+static inline void internal_fd_trans_register_unsafe(int fd,
+                                                     TargetFdTrans *trans)
 {
     unsigned int oldmax;
 
@@ -67,18 +91,35 @@ static inline void fd_trans_register(int fd, TargetFdTrans *trans)
     target_fd_trans[fd] = trans;
 }
 
-static inline void fd_trans_unregister(int fd)
+static inline void fd_trans_register(int fd, TargetFdTrans *trans)
+{
+    QEMU_LOCK_GUARD(&target_fd_trans_lock);
+    internal_fd_trans_register_unsafe(fd, trans);
+}
+
+static inline void internal_fd_trans_unregister_unsafe(int fd)
 {
     if (fd >= 0 && fd < target_fd_max) {
         target_fd_trans[fd] = NULL;
     }
 }
 
+static inline void fd_trans_unregister(int fd)
+{
+    if (fd < 0) {
+        return;
+    }
+
+    QEMU_LOCK_GUARD(&target_fd_trans_lock);
+    internal_fd_trans_unregister_unsafe(fd);
+}
+
 static inline void fd_trans_dup(int oldfd, int newfd)
 {
-    fd_trans_unregister(newfd);
+    QEMU_LOCK_GUARD(&target_fd_trans_lock);
+    internal_fd_trans_unregister_unsafe(newfd);
     if (oldfd < target_fd_max && target_fd_trans[oldfd]) {
-        fd_trans_register(newfd, target_fd_trans[oldfd]);
+        internal_fd_trans_register_unsafe(newfd, target_fd_trans[oldfd]);
     }
 }
 
diff --git a/linux-user/main.c b/linux-user/main.c
index 2fb3a366a699..37ed50d98e2e 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -48,6 +48,7 @@
 #include "target_elf.h"
 #include "cpu_loop-common.h"
 #include "crypto/init.h"
+#include "fd-trans.h"
 
 #ifndef AT_FLAGS_PRESERVE_ARGV0
 #define AT_FLAGS_PRESERVE_ARGV0_BIT 0
@@ -829,6 +830,8 @@ int main(int argc, char **argv, char **envp)
     cpu->opaque = ts;
     task_settid(ts);
 
+    fd_trans_init();
+
     ret = loader_exec(execfd, exec_path, target_argv, target_environ, regs,
         info, &bprm);
     if (ret != 0) {
-- 
2.31.1


