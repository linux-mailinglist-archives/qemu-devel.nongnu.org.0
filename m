Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6B36B5402
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:13:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pakvs-0008IE-FS; Fri, 10 Mar 2023 17:09:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvj-0008CE-KX
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:39 -0500
Received: from mout.kundenserver.de ([217.72.192.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvh-000319-DN
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:39 -0500
Received: from quad ([82.64.211.94]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MlO5j-1qHCcq1aXd-00lpx8; Fri, 10
 Mar 2023 23:09:33 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Helge Deller <deller@gmx.de>
Subject: [PULL 09/28] linux-user: Add strace for prlimit64() syscall
Date: Fri, 10 Mar 2023 23:09:08 +0100
Message-Id: <20230310220927.326606-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310220927.326606-1-laurent@vivier.eu>
References: <20230310220927.326606-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:KXbMiml4WG1RJOmDDrU29IxOZZNm+sbE5x2P6nPS6k4nL6XVUJP
 RaYAXub2jTWHrGyOyVGpGr7C5RIMQy3mHUCTg2Sq4T5C6Tarmjg2BxtjYyRKUzNcBzQraGm
 rEcgNhm/kfhJGV/uJU458/3/8Sg10Db/cb8UJrU3gerv5I4yzmz1RU6qOc0aGuaSLluq+x3
 SwLxP4A5GtdVGsdGMlGRA==
UI-OutboundReport: notjunk:1;M01:P0:7ehI6Yq6nEI=;SyAQ5vmlTWtNYiks/pjdhyTTvRC
 qX/os3zb2o/lqzRHcQZv1cwDaGgTy9ynwZolWIqLUOo0Uj+m8VZpOZLTUMLrG8Tm56p6AqkIS
 vf/ElvdRcsWug1Owg9IGU0jJSfhWlxErrBDICpmkQVqdpGOinBvlXJGeh/A2lpZUkBit/uHxU
 MObi0s5CUl/At39KTFttHmTcmt+MBpTQOBNFSGSwvbLwyOKRRGY58enDXflW7ikSFLu4JDqCj
 iFblu5XF3Llxle3Hkm+c9ZYj1RSiBdXpDTsoZwVaEcfEDcIrOcATJ7upDjoaRJ90CWHWijjyf
 5U7Ka2K+snQyBx171zAR6NtMtG0ji6TIqjBUlZpNQjteoid+zENYLpLySpBBhuuFFVgILPodT
 BIvCYmVUCoT/OPHlKjH8mfhjBbA/7+jY00a181vW5vXlnPir6Oe43MgdZtpmtvNJJnPF8H2uk
 eWlqD0EVumVNH0o5nhEXQLBDIfg/nSYblK3sWC3idm3NYETQQIWw+fuOu89zeucnqP33dbfiW
 r3XiSo71WcFeyJAnCmn1xON6sAdAvYlZACntLL7JCbcc064a4bCFFAWL8yA1nV4VJ02odqYdm
 MDaNEAEw9KsVdeO3g+RvnXZonrMhrDQqb0tnZPP11vgf/QcGL/LIRe3Cf9ERLyyE9aO1eUq0C
 pzOqQWq9gwDpJT55H1REtH9+D9QHBD1vlCAU4A2Xqw==
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
index 5218e3fc33ac..e08bd53afb48 100644
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


