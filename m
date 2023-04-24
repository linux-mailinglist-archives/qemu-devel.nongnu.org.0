Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB496ED175
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 17:35:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqyDI-0004kG-Av; Mon, 24 Apr 2023 11:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thomas@t-8ch.de>) id 1pqyDG-0004jy-3i
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:34:46 -0400
Received: from todd.t-8ch.de ([159.69.126.157])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thomas@t-8ch.de>) id 1pqyDD-00009d-Ar
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:34:45 -0400
From: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
 t=1682350478; bh=cMfNkG/xZ+/U1P2s9T1eD3uIOtLBWv6YQeRKMgI6iXA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ksq5tNvrEjkkHsGkz7T7FGQoZnYPrID8zqaZmBbLLHnejzk2Y2vXrhkJfAoU2OU4h
 a6YAhZNSOXM7rHRM/xykXFxFebWMtv9n2q+af/2SMz8GLs14dn8VbGuSXzkR4AmrlS
 4lyBjYRxRj/TqHYwmPWkHcK1rmdHNSWZ+VgMtfbQ=
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 "Laurent Vivier" <laurent@vivier.eu>
Subject: [PATCH 2/2] linux-user: Add open_tree() syscall
Date: Mon, 24 Apr 2023 17:34:29 +0200
Message-Id: <20230424153429.276788-2-thomas@t-8ch.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230424153429.276788-1-thomas@t-8ch.de>
References: <20230424153429.276788-1-thomas@t-8ch.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=159.69.126.157; envelope-from=thomas@t-8ch.de;
 helo=todd.t-8ch.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Thomas Weißschuh <thomas@t-8ch.de>
---
 linux-user/syscall.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 95e370130cee..140bd2c36e0f 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9166,6 +9166,32 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             return ret;
         }
 #endif
+#ifdef TARGET_NR_open_tree
+    case TARGET_NR_open_tree:
+        {
+            void *p2;
+
+            if (!arg2) {
+                return -TARGET_EFAULT;
+            }
+
+            p2 = lock_user_string(arg2);
+            if (!p2) {
+                return -TARGET_EFAULT;
+            }
+
+            int host_flags = arg3 & ~TARGET_O_CLOEXEC;
+            if (arg3 & TARGET_O_CLOEXEC) {
+                host_flags |= O_CLOEXEC;
+            }
+
+            ret = get_errno(open_tree(arg1, p2, host_flags));
+
+            unlock_user(p2, arg2, 0);
+
+            return ret;
+        }
+#endif
 #ifdef TARGET_NR_stime /* not on alpha */
     case TARGET_NR_stime:
         {
-- 
2.40.0


