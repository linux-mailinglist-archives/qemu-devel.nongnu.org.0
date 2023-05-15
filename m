Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16245702733
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 10:32:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyTcI-0003j8-Ui; Mon, 15 May 2023 04:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pyTc3-0003hD-PY
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:31:23 -0400
Received: from mout.kundenserver.de ([212.227.17.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pyTc1-00022h-BK
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:31:23 -0400
Received: from quad ([37.169.188.112]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N4i7l-1q8PGD2TId-011mfd; Mon, 15
 May 2023 10:31:18 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 4/9] linux-user: Add open_tree() syscall
Date: Mon, 15 May 2023 10:31:08 +0200
Message-Id: <20230515083113.107056-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515083113.107056-1-laurent@vivier.eu>
References: <20230515083113.107056-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HMWxUQMrN3TGnZXR2lb9FHGGuEygjbSs+QQzVrwNNdFK3MU7nPd
 DTA/IMnRlYLJ5b3szPZ730ZSH0enM8JsGzYs87HyNzj5HI8JH+TBHweqnwAvKWQM8t/wxo3
 JvCyc6s235MZoC2+chJ4TgPrgrmeqbNw5a/c6F79u+DFM8WgsKE0ufi45iMW1CZ6j46S9T4
 7iwisHF066OP6eIeQAuRg==
UI-OutboundReport: notjunk:1;M01:P0:jctf2yDBmms=;JJDiEugPoxSFR5vbAn4fh0h02cJ
 kV+vnJWm1QhcNkqgJzvUnsGGtf6zxwzzuV46ExkYXcDjC2FnSuq72Vz0N3Q2KkiBnrLunzAMG
 40iv/FzHxvBTQAxqRYWXuISWiZOB7Y92tf7VRA7U/zMzua4CfeC+eNZsToq0XPsKFzOI8ztc4
 pW3AZ0RjIvk3BWs2XnRNYxIRqRvbIsBuyFJMXUZmcRo7p/JCYnsnIKTnrc8x4A/rkyemLbvZ1
 gq+ASThOct9BoV+4A+oyN+iHmkfR6eoVuE0hS6ndWaC4Lamt2TdfLBuDwcgJLgSUBw2DI/Cb8
 KLMftBaHnmUnR0GmAb5FCnlZEyd7Ot6aqIbiuYPIExnBN1LBlrQUvyRMhIcQDkPBJmBEns0KK
 Wz3wlL1WEEYXpmjQEXQnA4qytPDTVckZ09SsZxRk1tcSQ4U24eY3F7zVqLORKVFVXxCV7V5+c
 vGg+/7KPyJlJHCTNDz8fJzmvgI7BJqKDF42cG6IQzlikvSH7KN7dG6WNF7nZKdqieOhIcZaL7
 StPruHWjMf4ojqHgx9W8ghiLwIL+bSzxnDwhzFqZEb9WUxwIotq38RS6NAZ4Bw4C38ZTMzBIr
 btbwjvPAACu9juwrLa5GFxEbqLFLdau9WCzIJpitBzGPSsQTbJLKJmPvB7giQe2Va/cC42g9/
 jRMTWSL7ZhoSj+Hh2XF5Vf4+Yjx8NtNkYfJVkP0kXw==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
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
Message-Id: <20230424153429.276788-2-thomas@t-8ch.de>
[lv: move declaration at the beginning of the block,
     define syscall]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 9a99e4557367..00a779797efb 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8776,6 +8776,12 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
 _syscall2(int, pivot_root, const char *, new_root, const char *, put_old)
 #endif
 
+#if defined(TARGET_NR_open_tree) && defined(__NR_open_tree)
+#define __NR_sys_open_tree __NR_open_tree
+_syscall3(int, sys_open_tree, int, __dfd, const char *, __filename,
+          unsigned int, __flags)
+#endif
+
 #if defined(TARGET_NR_move_mount) && defined(__NR_move_mount)
 #define __NR_sys_move_mount __NR_move_mount
 _syscall5(int, sys_move_mount, int, __from_dfd, const char *, __from_pathname,
@@ -9202,6 +9208,33 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             return ret;
         }
 #endif
+#if defined(TARGET_NR_open_tree) && defined(__NR_open_tree)
+    case TARGET_NR_open_tree:
+        {
+            void *p2;
+            int host_flags;
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
+            host_flags = arg3 & ~TARGET_O_CLOEXEC;
+            if (arg3 & TARGET_O_CLOEXEC) {
+                host_flags |= O_CLOEXEC;
+            }
+
+            ret = get_errno(sys_open_tree(arg1, p2, host_flags));
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
2.40.1


