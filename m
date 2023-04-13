Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 228446E15F9
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 22:37:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn3cY-0003yM-UD; Thu, 13 Apr 2023 16:32:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pn3cS-0003sk-Ci; Thu, 13 Apr 2023 16:32:36 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pn3cG-0003l8-Pt; Thu, 13 Apr 2023 16:32:35 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 96DB84013F;
 Thu, 13 Apr 2023 23:31:57 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 1FB9E95;
 Thu, 13 Apr 2023 23:31:56 +0300 (MSK)
Received: (nullmailer pid 2344363 invoked by uid 1000);
 Thu, 13 Apr 2023 20:31:54 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 16/21] linux-user: Fix unaligned memory access in prlimit64
 syscall
Date: Thu, 13 Apr 2023 23:31:28 +0300
Message-Id: <20230413203143.2344250-16-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230413203051.2344192-1-mjt@tls.msk.ru>
References: <20230413203051.2344192-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

target_rlimit64 contains uint64_t fields, so it's 8-byte aligned on
some hosts, while some guests may align their respective type on a
4-byte boundary. This may lead to an unaligned access, which is an UB.

Fix by defining the fields as abi_ullong. This makes the host alignment
match that of the guest, and lets the compiler know that it should emit
code that can deal with the guest alignment.

While at it, also use __get_user() and __put_user() instead of
tswap64().

Fixes: 163a05a8398b ("linux-user: Implement prlimit64 syscall")
Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20230224003907.263914-2-iii@linux.ibm.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
(cherry picked from commit 9c1da8b5ee7f6e80e6b683e7fb73df1029a7cbbe)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 linux-user/generic/target_resource.h | 4 ++--
 linux-user/syscall.c                 | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux-user/generic/target_resource.h b/linux-user/generic/target_resource.h
index 539d8c4677..37d3eb09b3 100644
--- a/linux-user/generic/target_resource.h
+++ b/linux-user/generic/target_resource.h
@@ -12,8 +12,8 @@ struct target_rlimit {
 };
 
 struct target_rlimit64 {
-    uint64_t rlim_cur;
-    uint64_t rlim_max;
+    abi_ullong rlim_cur;
+    abi_ullong rlim_max;
 };
 
 #define TARGET_RLIM_INFINITY    ((abi_ulong)-1)
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 106d5ed05b..8f8f8cf1db 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -12888,8 +12888,8 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             if (!lock_user_struct(VERIFY_READ, target_rnew, arg3, 1)) {
                 return -TARGET_EFAULT;
             }
-            rnew.rlim_cur = tswap64(target_rnew->rlim_cur);
-            rnew.rlim_max = tswap64(target_rnew->rlim_max);
+            __get_user(rnew.rlim_cur, &target_rnew->rlim_cur);
+            __get_user(rnew.rlim_max, &target_rnew->rlim_max);
             unlock_user_struct(target_rnew, arg3, 0);
             rnewp = &rnew;
         }
@@ -12899,8 +12899,8 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             if (!lock_user_struct(VERIFY_WRITE, target_rold, arg4, 1)) {
                 return -TARGET_EFAULT;
             }
-            target_rold->rlim_cur = tswap64(rold.rlim_cur);
-            target_rold->rlim_max = tswap64(rold.rlim_max);
+            __put_user(rold.rlim_cur, &target_rold->rlim_cur);
+            __put_user(rold.rlim_max, &target_rold->rlim_max);
             unlock_user_struct(target_rold, arg4, 1);
         }
         return ret;
-- 
2.30.2


