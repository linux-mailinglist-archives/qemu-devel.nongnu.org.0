Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7448B6B091C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 14:32:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZtrY-0001sS-Mu; Wed, 08 Mar 2023 08:29:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtqv-0001gE-OE
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:09 -0500
Received: from mout.kundenserver.de ([217.72.192.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtqt-00064t-Oc
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:09 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MiIhU-1qF1ZH3r3W-00fQuo; Wed, 08
 Mar 2023 14:29:06 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 09/28] linux-user: Add strace for prlimit64() syscall
Date: Wed,  8 Mar 2023 14:28:38 +0100
Message-Id: <20230308132857.161793-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308132857.161793-1-laurent@vivier.eu>
References: <20230308132857.161793-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6M5hVxpwRSnHBokNSUPrMKj6YJ0n90k3+RXU9cz0flvJVIc78tA
 yDpardP0hJOx9Lo6MVMcQRV+jicNxSYUU2dmREoYEEfPdK7oZmHS7NKGMW/j6ZQcEuqx7w+
 48yas+589J/SIf3syAqMwIX6KPvANYC/nQAavaOnYxX7WUryNm5f5Tx2TziOqlQFqUNU/wm
 oQp1ZdXbcdTOGIEFFJ96Q==
UI-OutboundReport: notjunk:1;M01:P0:LDalLGHIaek=;0tOSvA2Si+/ET+g+YQnizkcByct
 flMenRVnYOcCcbnVe3KcJnb8BFHjrb5QaGR+zLxoDEBXIVCvEW+VY4kCWULw7ZS7P80wmY5Sv
 JQlsJ055enb40zgvNCG4LOdf0fwv2COJbRDFbBlpk6TryY0KjB0RCOnDQ24wz98Ki5SQ/9CPY
 4TVjzlIEJQZ2Mm16WlgjL+QGVSauPmK9iUbmyHbbJVkRfJ3/F2+gw/WJEe7mhMiEzBeEYIrFS
 2rPvBwDE6vBWSqm0NW9wNpBz9suZxmA8icMhGdmnIYctavwjOPYrx6JdCuopNHq2Ls/meFHAe
 eLkebMvZl35JeTnd3me96tu6f6MgjT6qcXVLOO/gFChhqACdlYFt3M5gpLn1S2p+GWpn7Q1hg
 WezGrwXceoeIFuSWn60s8Os93poFEer/UoTo7e7FqsEkflubxRJVoHQKh8l6UhmaJm/fyRCSf
 QxgFHRjeQ9wdrBDhsYpVQRAJ9mRGW/bX9LQQldQdwTCTl2BQnHKJVSKaSCXqZK8mHFFS+duQ+
 UXD+hwGhdZ1VuxA/mrkqNnjoMxcOBlW6NQYpqHm3nzT+/3/RHBOExrFrTVAADTjiJ6bsPC1PG
 lcoj0KLSwnN7+Fv9f4XXvZeh2ZATKvawzMebrvqThTYhzcC+uMh8HTgzUoj53WxIsPJotZA2q
 OLSKkciXx8w8IIdjJdMNvN5y1ddzMDHRXnXTdAP9/A==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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

From: Helge Deller <deller@gmx.de>

Add proper prlimit64() strace output.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20221222190639.124078-1-deller@gmx.de>
[lvivier: use print_raw_param64()]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c    | 88 ++++++++++++++++++++++++++++++++++++++++++
 linux-user/strace.list |  3 +-
 2 files changed, 90 insertions(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 2cea93aec46e..e9757ed9adee 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -3866,6 +3866,94 @@ print_futex(CPUArchState *cpu_env, const struct syscallname *name,
 }
 #endif
 
+#ifdef TARGET_NR_prlimit64
+static const char *target_ressource_string(abi_ulong r)
+{
+    #define RET_RES_ENTRY(res) case TARGET_##res:  return #res;
+    switch (r) {
+    RET_RES_ENTRY(RLIMIT_AS);
+    RET_RES_ENTRY(RLIMIT_CORE);
+    RET_RES_ENTRY(RLIMIT_CPU);
+    RET_RES_ENTRY(RLIMIT_DATA);
+    RET_RES_ENTRY(RLIMIT_FSIZE);
+    RET_RES_ENTRY(RLIMIT_LOCKS);
+    RET_RES_ENTRY(RLIMIT_MEMLOCK);
+    RET_RES_ENTRY(RLIMIT_MSGQUEUE);
+    RET_RES_ENTRY(RLIMIT_NICE);
+    RET_RES_ENTRY(RLIMIT_NOFILE);
+    RET_RES_ENTRY(RLIMIT_NPROC);
+    RET_RES_ENTRY(RLIMIT_RSS);
+    RET_RES_ENTRY(RLIMIT_RTPRIO);
+#ifdef RLIMIT_RTTIME
+    RET_RES_ENTRY(RLIMIT_RTTIME);
+#endif
+    RET_RES_ENTRY(RLIMIT_SIGPENDING);
+    RET_RES_ENTRY(RLIMIT_STACK);
+    default:
+        return NULL;
+    }
+    #undef RET_RES_ENTRY
+}
+
+static void
+print_rlimit64(abi_ulong rlim_addr, int last)
+{
+    if (rlim_addr) {
+        struct target_rlimit64 *rl;
+
+        rl = lock_user(VERIFY_READ, rlim_addr, sizeof(*rl), 1);
+        if (!rl) {
+            print_pointer(rlim_addr, last);
+            return;
+        }
+        print_raw_param64("{rlim_cur=%" PRId64, tswap64(rl->rlim_cur), 0);
+        print_raw_param64("rlim_max=%" PRId64 "}", tswap64(rl->rlim_max),
+                            last);
+        unlock_user(rl, rlim_addr, 0);
+    } else {
+        qemu_log("NULL%s", get_comma(last));
+    }
+}
+
+static void
+print_prlimit64(CPUArchState *cpu_env, const struct syscallname *name,
+           abi_long arg0, abi_long arg1, abi_long arg2,
+           abi_long arg3, abi_long arg4, abi_long arg5)
+{
+    const char *rlim_name;
+
+    print_syscall_prologue(name);
+    print_raw_param("%d", arg0, 0);
+    rlim_name = target_ressource_string(arg1);
+    if (rlim_name) {
+        qemu_log("%s,", rlim_name);
+    } else {
+        print_raw_param("%d", arg1, 0);
+    }
+    print_rlimit64(arg2, 0);
+    print_pointer(arg3, 1);
+    print_syscall_epilogue(name);
+}
+
+static void
+print_syscall_ret_prlimit64(CPUArchState *cpu_env,
+                       const struct syscallname *name,
+                       abi_long ret, abi_long arg0, abi_long arg1,
+                       abi_long arg2, abi_long arg3, abi_long arg4,
+                       abi_long arg5)
+{
+    if (!print_syscall_err(ret)) {
+        qemu_log(TARGET_ABI_FMT_ld, ret);
+        if (arg3) {
+            qemu_log(" (");
+            print_rlimit64(arg3, 1);
+            qemu_log(")");
+        }
+    }
+    qemu_log("\n");
+}
+#endif
+
 #ifdef TARGET_NR_kill
 static void
 print_kill(CPUArchState *cpu_env, const struct syscallname *name,
diff --git a/linux-user/strace.list b/linux-user/strace.list
index d8acbeec6093..f776c73fa04c 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -1074,7 +1074,8 @@
 { TARGET_NR_preadv, "preadv" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_prlimit64
-{ TARGET_NR_prlimit64, "prlimit64" , NULL, NULL, NULL },
+{ TARGET_NR_prlimit64, "prlimit64" , NULL, print_prlimit64,
+                    print_syscall_ret_prlimit64 },
 #endif
 #ifdef TARGET_NR_process_vm_readv
 { TARGET_NR_process_vm_readv, "process_vm_readv" , NULL, NULL, NULL },
-- 
2.39.2


