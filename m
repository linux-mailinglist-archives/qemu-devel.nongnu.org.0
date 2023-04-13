Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1188A6E15FA
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 22:37:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn3cv-00042t-Ol; Thu, 13 Apr 2023 16:33:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pn3cg-00041h-5s; Thu, 13 Apr 2023 16:32:50 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pn3cG-0003lA-Ob; Thu, 13 Apr 2023 16:32:47 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id B9D1640141;
 Thu, 13 Apr 2023 23:31:57 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 4474F21B;
 Thu, 13 Apr 2023 23:31:56 +0300 (MSK)
Received: (nullmailer pid 2344365 invoked by uid 1000);
 Thu, 13 Apr 2023 20:31:54 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Mathis Marion <mathis.marion@silabs.com>,
 Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 17/21] linux-user: fix timerfd read endianness conversion
Date: Thu, 13 Apr 2023 23:31:29 +0300
Message-Id: <20230413203143.2344250-17-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230413203051.2344192-1-mjt@tls.msk.ru>
References: <20230413203051.2344192-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Mathis Marion <mathis.marion@silabs.com>

When reading the expiration count from a timerfd, the endianness of the
64bit value read is the one of the host, just as for eventfds.

Signed-off-by: Mathis Marion <mathis.marion@silabs.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20230220085822.626798-2-Mathis.Marion@silabs.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
(cherry picked from commit d759a62b122dcdf76d6ea10c56c5dff1d04d731d)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 linux-user/fd-trans.c | 10 +++++++---
 linux-user/fd-trans.h |  1 +
 linux-user/syscall.c  |  8 ++++++--
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
index 7b25468d02..146aaaafaa 100644
--- a/linux-user/fd-trans.c
+++ b/linux-user/fd-trans.c
@@ -1622,7 +1622,7 @@ TargetFdTrans target_signalfd_trans = {
     .host_to_target_data = host_to_target_data_signalfd,
 };
 
-static abi_long swap_data_eventfd(void *buf, size_t len)
+static abi_long swap_data_u64(void *buf, size_t len)
 {
     uint64_t *counter = buf;
     int i;
@@ -1640,8 +1640,12 @@ static abi_long swap_data_eventfd(void *buf, size_t len)
 }
 
 TargetFdTrans target_eventfd_trans = {
-    .host_to_target_data = swap_data_eventfd,
-    .target_to_host_data = swap_data_eventfd,
+    .host_to_target_data = swap_data_u64,
+    .target_to_host_data = swap_data_u64,
+};
+
+TargetFdTrans target_timerfd_trans = {
+    .host_to_target_data = swap_data_u64,
 };
 
 #if defined(CONFIG_INOTIFY) && (defined(TARGET_NR_inotify_init) || \
diff --git a/linux-user/fd-trans.h b/linux-user/fd-trans.h
index 1b9fa2041c..910faaf237 100644
--- a/linux-user/fd-trans.h
+++ b/linux-user/fd-trans.h
@@ -130,6 +130,7 @@ extern TargetFdTrans target_netlink_route_trans;
 extern TargetFdTrans target_netlink_audit_trans;
 extern TargetFdTrans target_signalfd_trans;
 extern TargetFdTrans target_eventfd_trans;
+extern TargetFdTrans target_timerfd_trans;
 #if (defined(TARGET_NR_inotify_init) && defined(__NR_inotify_init)) || \
     (defined(CONFIG_INOTIFY1) && defined(TARGET_NR_inotify_init1) && \
      defined(__NR_inotify_init1))
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 8f8f8cf1db..9ca30149d4 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -13120,8 +13120,12 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
 
 #if defined(TARGET_NR_timerfd_create) && defined(CONFIG_TIMERFD)
     case TARGET_NR_timerfd_create:
-        return get_errno(timerfd_create(arg1,
-                          target_to_host_bitmask(arg2, fcntl_flags_tbl)));
+        ret = get_errno(timerfd_create(arg1,
+                        target_to_host_bitmask(arg2, fcntl_flags_tbl)));
+        if (ret >= 0) {
+            fd_trans_register(ret, &target_timerfd_trans);
+        }
+        return ret;
 #endif
 
 #if defined(TARGET_NR_timerfd_gettime) && defined(CONFIG_TIMERFD)
-- 
2.30.2


