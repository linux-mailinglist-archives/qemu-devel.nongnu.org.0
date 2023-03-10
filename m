Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F78F6B53FA
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:12:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pakvm-0008EL-DV; Fri, 10 Mar 2023 17:09:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvj-0008CD-Gt
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:39 -0500
Received: from mout.kundenserver.de ([217.72.192.73])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvh-00031G-D6
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:39 -0500
Received: from quad ([82.64.211.94]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M5PRT-1pbaPO1Gz7-001TZe; Fri, 10
 Mar 2023 23:09:31 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 04/28] linux-user: Fix unaligned memory access in prlimit64
 syscall
Date: Fri, 10 Mar 2023 23:09:03 +0100
Message-Id: <20230310220927.326606-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310220927.326606-1-laurent@vivier.eu>
References: <20230310220927.326606-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:WYvTP3MN+h/87DYEYmctzb+Y+Wr5Nyg4ZS6k1BcHnU1tEsj+Bs4
 h7dH/CXM2Lxo4T7i55Q7t9d8+Qf9hFsstAGBGnsuyGSNhRDUBqG+ZVONW9RbXO2aEG8oD2R
 DzK4nonefvmHtCEb5v1KNJdxDTEJZu7BJT8HkETJCPWxbzgn+a+Td9a5WEcwn3QOV2Z1BXQ
 4sRhzNEHp4PjIUpp+mbTw==
UI-OutboundReport: notjunk:1;M01:P0:KpfpXM890dk=;7En5hx4hHTw6svSM55F26rzneiZ
 zAzin8kaiPPAQ90cmkQkW6lDvux5dRwJluD5d42M/BdOWMgMtlQZ+GaS1borzPVUKOLrN1oZY
 0e8XQCYbYvWeKO+cKOc3jT8Ow1NhThz42jQ3C/zpEvbsvBZvTxiyz4IoE7z2zETY/vGNEyoWU
 0DK0W279M5/j11TXdgzDVlfofBv/SXBTTyqDT8kW27Ns626B7Stmd3SZbhQ168MlAuvkxKUMP
 ln6OiilJwlMHQDhEUGF4NpVdheaRWjN6oZqf1R5AHblpWsOt5HMxGBbYMIt6RQtgXvZanl4aq
 I9it5iQTJDTPyRneHso7pCTFCKg62W4RG3277zqTgy0HkoN7NQX/3LsRzX9xTLOo/jBo3DIfQ
 xXtAIDYafDChyKx0IQUL0emTV93RdsHErh75D5oBpjfL3hA2/TPWtHBgU1f2fn0/D80ZDyKTK
 zmvpLvzSKqZUAaN2nN3+PRGUsjmWCTCWnHjlpc+n5p/N+2CJdvrClH5fiYLjbdy6LQE6ZZbFB
 RlkqlBe3Q/OSuxOlkDFSH5aISjVbbcWhUX7G66FscKhufW/JQT6inAjPBXSkPi4KD8FwYt478
 p929j6vfG6mxUoaDwncE8rDvSQHZxHorFlxCopxSVF63AJ2YojjWkRZkjXoh4xmMoiueu/t16
 Ea+1a5eS9E8+I+iYRuSlpx2B1mVrQkbLPvhsezrhCQ==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
---
 linux-user/generic/target_resource.h | 4 ++--
 linux-user/syscall.c                 | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux-user/generic/target_resource.h b/linux-user/generic/target_resource.h
index 539d8c46772e..37d3eb09b3b3 100644
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
index 64b71b1ff94b..69cc4b6e4219 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -12876,8 +12876,8 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
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
@@ -12887,8 +12887,8 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
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
2.39.2


