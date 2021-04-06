Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1863D355627
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 16:13:04 +0200 (CEST)
Received: from localhost ([::1]:43106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTmRy-0000xW-Lw
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 10:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkysel@tachyum.com>)
 id 1lTmQV-0000UW-U4
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 10:11:31 -0400
Received: from mx1.tachyum.com ([66.160.133.170]:9282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkysel@tachyum.com>)
 id 1lTmQU-0001Nq-CW
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 10:11:31 -0400
Received: by mx1.tachyum.com (Postfix, from userid 1000)
 id B2F7110056EF; Tue,  6 Apr 2021 07:11:27 -0700 (PDT)
Received: from tsk-dev-sw-mkysel.tachyum.sk (tsk-fw1.tachyum.sk [93.184.71.90])
 by mx1.tachyum.com (Postfix) with ESMTP id BC0FB1005684;
 Tue,  6 Apr 2021 07:11:25 -0700 (PDT)
From: Matus Kysel <mkysel@tachyum.com>
To: 
Subject: [PATCH] linux-user: strace now handles unshare syscall args correctly
Date: Tue,  6 Apr 2021 14:11:13 +0000
Message-Id: <20210406141113.922634-1-mkysel@tachyum.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.160.133.170; envelope-from=mkysel@tachyum.com;
 helo=mx1.tachyum.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, Matus Kysel <mkysel@tachyum.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Syscall unshare did not have custom print function for strace, but it's argument is same as flags in clone syscall, so it can be easily implemented.

Signed-off-by: Matus Kysel <mkysel@tachyum.com>
---
 linux-user/strace.c    | 12 ++++++++++++
 linux-user/strace.list |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index e969121b6c..d48df8c1a9 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -3467,6 +3467,18 @@ print_unlinkat(void *cpu_env, const struct syscallname *name,
 }
 #endif

+#ifdef TARGET_NR_unshare
+static void
+print_unshare(void *cpu_env, const struct syscallname *name,
+              abi_long arg0, abi_long arg1, abi_long arg2,
+              abi_long arg3, abi_long arg4, abi_long arg5)
+{
+    print_syscall_prologue(name);
+    print_flags(clone_flags, arg0, 1);
+    print_syscall_epilogue(name);
+}
+#endif
+
 #ifdef TARGET_NR_utime
 static void
 print_utime(void *cpu_env, const struct syscallname *name,
diff --git a/linux-user/strace.list b/linux-user/strace.list
index 084048ab96..3b7c15578c 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -1573,7 +1573,7 @@
 { TARGET_NR_unlinkat, "unlinkat" , NULL, print_unlinkat, NULL },
 #endif
 #ifdef TARGET_NR_unshare
-{ TARGET_NR_unshare, "unshare" , NULL, NULL, NULL },
+{ TARGET_NR_unshare, "unshare" , NULL, print_unshare, NULL },
 #endif
 #ifdef TARGET_NR_userfaultfd
 { TARGET_NR_userfaultfd, "userfaultfd" , NULL, NULL, NULL },
--
2.25.1


