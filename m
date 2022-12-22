Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7793E654660
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 20:08:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8QuZ-0006IZ-Lp; Thu, 22 Dec 2022 14:07:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p8QuX-0006I8-V1
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 14:07:21 -0500
Received: from mout.gmx.net ([212.227.15.15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p8QuU-0004lj-VI
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 14:07:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1671736035; bh=2IqwgqZRJ3MH1Tz0ZSzmkKGXM/wD9cK7ufmyjFQgjCU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=uFunK9JlolBbV8DGnZ1F6EggYqOC4YjEk4h9PAoPGGGJFFBm7qSfgn1RaWSga/lvL
 fFLfDzvBWyPDJTfK9AgU8dFsUMN/AgskezS0kuSKfBphNMaeeFHe/CwKg0PNMu2wF6
 j3QAzknohI9krgDdtcfReFdHzyaSQsrxtRj0o0KpJB0zuG04ftRrD55kZBxTEl/dcN
 OOZT8Q4fSXntzCyHYR2MH0vCrTiU1C2eNUiLsGyHoA0jKDNdMD/PuXo4rbRwt9C7CZ
 94snb6/cgyoz1r1Y6nz5neTk9j1AXs389K2wr8y7YMFb2crJSi8VwHQdKCH54Xdp0v
 m3Rsm8j83KmLg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([92.116.142.238]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mnps0-1oXQ412nCU-00pPfL; Thu, 22
 Dec 2022 20:07:15 +0100
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH] linux-user: Add strace for prlimit64() syscall
Date: Thu, 22 Dec 2022 20:06:39 +0100
Message-Id: <20221222190639.124078-1-deller@gmx.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CxpGHemehYFYfeDJGhqOYz+WJdAEzGy3kGrlMgMmt6ZuKnRy01W
 k4ucOW+x5ed3IIGxD8ncInfz38HzDp6zgMiAfXD2q2IxlBKG2drQHs0hcINNqeBejvYSITw
 4h3w4NLaXGG1rzejwyIIPEK+D9y5s8p/K1Qh1kgmB+1xGpuo0XGIh2FweD5qNCrHIL6E2Am
 ZtRuRIM+fyJfviy/ElKWA==
UI-OutboundReport: notjunk:1;M01:P0:0weTCvnUvEI=;9eB2+O8o/0mg8AguauyeBXLyA3f
 e/JMfytWPRUBRMDbT+mS2LquOzyoLaKgZeUdogMItTJuiyYepr1Pbl+GmSTCKagT0006M37DY
 suidHe9Gy0l3Yh3Bc/fFCe8wh0+A1eLI+MCrEMB/WI4lsYjjy0LobXBOiimdx19mXuJREDYgc
 tR3cxbLeAHwHO19jP5rOCpdpgPy8mJlCW3sCP1TseV12duvaVF7C4DeKOrQ3Vpv+vcaYwZuZt
 vtdjepb7bd6yBzDbnRgFeoUp/K1a0S2Okm30UkqZVqNSQj1Gm+ISMnYubE9t/jzEKuQwQ0Wsm
 lNyZGdzGiW8L3axWLmhzELGmjjh/ANdIK2LrbKCkG0UgnAUiJujxVbtKY1hA5rxiv2X530IRs
 oFg+4xSZEFNRl0LwKRfpZBTZMepLNn2OYfYfP9dITc+OiQmVf9+amNkHkhFisACVy4DKkatT/
 Z6LdYBy7tZHjkFsSCZPQ3t+i0nE6NmAoe6fT4Hx708SyryaDHRO8evSLxNMijp2s+n8qAmSUY
 rIXCMUkH+rgUY/Nm2sKQ6dXPn9YDJr15vA2knnEFdSanSI+cDuik6qsEgYLHty3wHOyHgdipG
 PW/pwHG9yOj4EzV4dhrKtqOFleLMcRzVCSs1xmDfbOARVoXyWybCFwGwdmpgX8Wcdc9e6eeEO
 RrLNVvtVU0BboIInsexlYZ/Biw7Ytk6MlXfu/Zf9LirzkokE71ffMjkk236x7IY4V045vZfJ/
 aJ50mhBmDnWIEEZqtvSSYzeqoAy+7vBxXP+JCWHKuothEUm4/DsAxuCBQ3vwLp4f7ROp4w05D
 LszIY1mbe8pJiNcD/stM0HrUKWjDOX12w7gR08+jnT4TT6SzrpXfhuhWmADS1WxyRt5Qua7JV
 vE+UjliasoNnJlZ4UyMPUI44NlHNsigXAS9kYIOl9WATQh3qVHdG3e+l+EChv8L89PSAorKvg
 zTZKhjKAUeSemubHatxV2hSmLoQ=
Received-SPF: pass client-ip=212.227.15.15; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Add proper prlimit64() strace output.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/strace.c    | 89 ++++++++++++++++++++++++++++++++++++++++++
 linux-user/strace.list |  3 +-
 2 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 3ea91084fb..82dc1a1e20 100644
=2D-- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -3774,6 +3774,95 @@ print_futex(CPUArchState *cpu_env, const struct sys=
callname *name,
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
+        rl =3D lock_user(VERIFY_READ, rlim_addr, sizeof(*rl), 1);
+        if (!rl) {
+            print_pointer(rlim_addr, last);
+            return;
+        }
+        qemu_log("{rlim_cur =3D %lld, rlim_max =3D %lld}%s",
+                 (long long)tswap64(rl->rlim_cur),
+                 (long long)tswap64(rl->rlim_max),
+                 get_comma(last));
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
+    rlim_name =3D target_ressource_string(arg1);
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
index ac8f872371..f9254725a1 100644
=2D-- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -1067,7 +1067,8 @@
 { TARGET_NR_preadv, "preadv" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_prlimit64
-{ TARGET_NR_prlimit64, "prlimit64" , NULL, NULL, NULL },
+{ TARGET_NR_prlimit64, "prlimit64" , NULL, print_prlimit64,
+                    print_syscall_ret_prlimit64 },
 #endif
 #ifdef TARGET_NR_process_vm_readv
 { TARGET_NR_process_vm_readv, "process_vm_readv" , NULL, NULL, NULL },
=2D-
2.38.1


