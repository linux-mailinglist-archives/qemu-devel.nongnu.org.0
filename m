Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0669702731
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 10:32:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyTc9-0003hU-8o; Mon, 15 May 2023 04:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pyTc2-0003gv-T8
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:31:23 -0400
Received: from mout.kundenserver.de ([212.227.17.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pyTc1-00022Q-AT
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:31:22 -0400
Received: from quad ([37.169.188.112]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MkHIV-1qQcN23zJp-00kfkx; Mon, 15
 May 2023 10:31:18 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 3/9] linux-user: Add move_mount() syscall
Date: Mon, 15 May 2023 10:31:07 +0200
Message-Id: <20230515083113.107056-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515083113.107056-1-laurent@vivier.eu>
References: <20230515083113.107056-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6sK2ic5cFtsRtJ1n8P8ASPepa91DdOuLM+KVGPuuZjZsj7dPruT
 lOIg9hTVHXf6UTvmdAE7aC+rAAM2tzpnwYTrXDTzC0ITPpCBksy+Ide0VBWcD0BiJjBiPNS
 2cC5G/m8QIz2ev6jT6NCxF6K7hsLZ3jj8i80pCILn+qFd8vS1t5SCG7mNgw1eUq+IPsf35P
 xo1fzIndDDcIEJCj72UNg==
UI-OutboundReport: notjunk:1;M01:P0:sDXTmsjrIvY=;+arb695rojfRhyqMHqRUD0yWWfC
 1mcASJwr+080q8g1W4jiWVLHR6j9Viq5wbkr6EK36dHy/Nt/UOTmIZBEgMjvOUyXX3wj4zCCu
 PK/gwQKX0JKbPQIlV6vv8IJIsNa1m0N0dP4S0JG33X47JgeQ3jsNy/Cq8hUdrBtkPTkTWzkLC
 9Tk8l5FqP0snN3xAc269Yogbkn3BsH0VsQTaYsOuRuS8HhaXTt2jJy3pgyPaqBbourM7Q7rfF
 lSlCmyFT+FEvx2omzloR0jvKCXMg/yLNx1m1Lx/q6hxZMmsjX68F7/ylJbCE/a81w5AhgSz5f
 3gqfWfCfEAEZtZQ2dJpTaqKC5YT/5l0fqTFxSJb2yyTT6pj2W/F324cutpWGzUKQIp5NOp/FE
 E1TcZZBmhfL2Qebo9IDQHdmDivA5k8UjPOTbDewO8F2KXlQuvrdIlbpSFsgOrd0ITAnrQzy+k
 EjTE7zIyJtGl0MPx/3KUqaIll/3BgBfPzK0bFbCLFU4VqI+kea+TMmHG6aLjX8h96A6L7VxTh
 8kyveTvxTn9VVcLSvXtKKMCHFdX6vLX2guWOvvqAEBa5gkwD4HEoymGFslAlxia9OE6i1KNQI
 Pi8mGG9QC8d58C0HYaxHPzyw7KL6s5Y9ysRuTt/r8AUKL6R+5cHcmojJzcqEPYcqFzwK+rbOB
 oRFZxQ4XIAkWXWS/nU8CNd9NfzG0oTHJZSZWwSlQdQ==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Thomas Weißschuh <thomas@t-8ch.de>

Signed-off-by: Thomas Weißschuh <thomas@t-8ch.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
[lv: define syscall]
Message-Id: <20230424153429.276788-1-thomas@t-8ch.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 954ed14df4c0..9a99e4557367 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8776,6 +8776,12 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
 _syscall2(int, pivot_root, const char *, new_root, const char *, put_old)
 #endif
 
+#if defined(TARGET_NR_move_mount) && defined(__NR_move_mount)
+#define __NR_sys_move_mount __NR_move_mount
+_syscall5(int, sys_move_mount, int, __from_dfd, const char *, __from_pathname,
+           int, __to_dfd, const char *, __to_pathname, unsigned int, flag)
+#endif
+
 /* This is an internal helper for do_syscall so that it is easier
  * to have a single return point, so that actions, such as logging
  * of syscall results, can be performed.
@@ -9169,6 +9175,33 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         unlock_user(p, arg1, 0);
         return ret;
 #endif
+#if defined(TARGET_NR_move_mount) && defined(__NR_move_mount)
+    case TARGET_NR_move_mount:
+        {
+            void *p2, *p4;
+
+            if (!arg2 || !arg4) {
+                return -TARGET_EFAULT;
+            }
+
+            p2 = lock_user_string(arg2);
+            if (!p2) {
+                return -TARGET_EFAULT;
+            }
+
+            p4 = lock_user_string(arg4);
+            if (!p4) {
+                unlock_user(p2, arg2, 0);
+                return -TARGET_EFAULT;
+            }
+            ret = get_errno(sys_move_mount(arg1, p2, arg3, p4, arg5));
+
+            unlock_user(p2, arg2, 0);
+            unlock_user(p4, arg4, 0);
+
+            return ret;
+        }
+#endif
 #ifdef TARGET_NR_stime /* not on alpha */
     case TARGET_NR_stime:
         {
-- 
2.40.1


