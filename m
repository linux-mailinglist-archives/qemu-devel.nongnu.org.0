Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F21A5B508D
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 20:21:47 +0200 (CEST)
Received: from localhost ([::1]:47628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXRaT-0008BC-Bz
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 14:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oXRXU-0002RN-GI
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 14:18:41 -0400
Received: from mout.gmx.net ([212.227.15.18]:60903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oXRXR-0002lF-9u
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 14:18:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1662920313;
 bh=/icehtdKOzzoj9/rDZrbGqnt2FX/FH/xuZNyulOUMzM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Nt2VBEgiSpJm2ISsh4brsYk40rDFpGvgA761CKy0+i+zVkT4RNLcNB0AbulCinIe5
 elZ3kIpF9mM3m+wDGqPH8UjNKxn6vJgaU/P7DX8PZvEdhxSK1IGrMXOIw8jxzi+oHc
 Rz7taR+9LxbPLojnLdJaHah2fvQjzAGqYpOWDMv8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.178.88]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7QxL-1pPoEG2qgH-017mWO; Sun, 11
 Sep 2022 20:18:33 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Cc: deller@gmx.de,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 02/12] linux-user: Add missing clock_gettime64() syscall
 strace
Date: Sun, 11 Sep 2022 20:18:20 +0200
Message-Id: <20220911181830.15851-3-deller@gmx.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911181830.15851-1-deller@gmx.de>
References: <20220911181830.15851-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ChpyiuahJdX6XQ6Hre2rDkDQjMU9wrBslDol+uVkI3iqQ7epB6+
 nh7IqvzObfOTKG9lU3GxQO3C7ySSoYiXEtqgQYZSzFs0wRR4TmU/Tzs/Yi3RIP1PRjw23zp
 9udaYCe1tjP5Cq3gopNUG1NuyldC+xXg2Dl+aJJI5ji56GmLCUpAObMudnl6mR46ecs8hJ0
 LcQyCNL0F106gICUt3sFg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+mBgnz7LPE8=:27q2bnCcaDB/hhvh/yC+J2
 09WPVmrv5vX0Cv9TUTDQQjfMwrNl3UJK/y68WKgWIDTJQ9ItdW69A0ACgGr/e1+YmOtZ6yTn/
 7vWDwHIjILJ69Oqmzmh72/K+AMbppWYNRW+iT6pJfDBfktCNCfykbgxmxrVjBBbkgK/W0crVH
 ufY5py91I49YVaymD0OFqIkYvmF4f9ZlwB1PpnoO16w+f9LCNeQwZ/Er+Pq3T9g2BqsDc0hTG
 PRrS0GjfQBozNOen69XvYhX8+3bPMKJakPT3ZjHCgxKB/sI40QwC5KhRKNapSmpFggxCW/NHi
 lGG3DzC/NZaVH2+dmhRbUTpwhI1tuw0ydWomT8f7B9cip6CmtCoLT7tl/euUHCG3OFM2aNwh+
 hOAZmA+dEEPiZDIZyNp1lUJc91fN95xJOsL2FTM5LeWGQomdqa/cxb0Mxh1L7Wn8LjkLxtINc
 qFUDM1NFf6FnJAwjLahMu7EzKi2efNp14wr+Y3A7h0TCF5UzuFFvk1c1haj4K/e6foF7SCk/e
 AfQlAdj9O6vKOvPugOPsiTsxD9/a/XUr2kiPD/eVE+QIb+LVPJgYBWkwywh0xSchv16vMnBki
 QCtUci4PDb1YAAegZH+ETQxJ+dq/WFI+/ukBkVJEs4MQKDOflORK2u0bhlzaVt5T3R/hJ3G8a
 CWslRxxBO9VuNomArXydfhuDmoV91yg9vSATrNkn367KWpv903jKgZ69UVWJzCc2Bdn3jxCQs
 dSLndYdGiqoMctbsBl94qXtIDpDBKuR6Uoi1Kh/wDgwZr21BCyq6zbECpMaHGvFx3IXcV9OPa
 /66REq2qnODj4O+08bfGugSZuQ9az/WXVD8RZtJzFeKlN7ZA/dTI/AZDaqwt0+MxhAwRPTMmn
 /r/bh+Bee74rx5g6XPpy9NTVVxoK5VA2zzMEPVo2fsbxemIOjmeh3V8/LoXrPVAtGNs73dOVO
 zcwoXse/+gp9IAJION73DsxGUCqOszH92bAzhslL2sQog64T0fFoOza7xbuBysqoZUxFtYjZJ
 Aoc3UioedyoqaErUHqoSG0xfHmKikzEwSyppjg8AHhT49zentJMBGX3GDT8jd6NjfEEIb+UGQ
 iELbePm8yOwnkAmp1NYj3W7EXXSLEO6y7t2pcSC+1N4rDysU67HSYF0r3E/wKJ+4DalTM+lDd
 NCTTI5+tyCEiTjzLXoV/kXKK1g
Received-SPF: pass client-ip=212.227.15.18; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow linux-user to strace the clock_gettime64() syscall.
This syscall is used a lot on 32-bit guest architectures which use newer
glibc versions.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/strace.c    | 53 ++++++++++++++++++++++++++++++++++++++++++
 linux-user/strace.list |  4 ++++
 2 files changed, 57 insertions(+)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index a4eeef7ae1..816e679995 100644
=2D-- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -82,6 +82,7 @@ UNUSED static void print_buf(abi_long addr, abi_long len=
, int last);
 UNUSED static void print_raw_param(const char *, abi_long, int);
 UNUSED static void print_timeval(abi_ulong, int);
 UNUSED static void print_timespec(abi_ulong, int);
+UNUSED static void print_timespec64(abi_ulong, int);
 UNUSED static void print_timezone(abi_ulong, int);
 UNUSED static void print_itimerval(abi_ulong, int);
 UNUSED static void print_number(abi_long, int);
@@ -795,6 +796,24 @@ print_syscall_ret_clock_gettime(CPUArchState *cpu_env=
, const struct syscallname
 #define print_syscall_ret_clock_getres     print_syscall_ret_clock_gettim=
e
 #endif

+#if defined(TARGET_NR_clock_gettime64)
+static void
+print_syscall_ret_clock_gettime64(CPUArchState *cpu_env, const struct sys=
callname *name,
+                                abi_long ret, abi_long arg0, abi_long arg=
1,
+                                abi_long arg2, abi_long arg3, abi_long ar=
g4,
+                                abi_long arg5)
+{
+    if (!print_syscall_err(ret)) {
+        qemu_log(TARGET_ABI_FMT_ld, ret);
+        qemu_log(" (");
+        print_timespec64(arg1, 1);
+        qemu_log(")");
+    }
+
+    qemu_log("\n");
+}
+#endif
+
 #ifdef TARGET_NR_gettimeofday
 static void
 print_syscall_ret_gettimeofday(CPUArchState *cpu_env, const struct syscal=
lname *name,
@@ -1652,6 +1671,27 @@ print_timespec(abi_ulong ts_addr, int last)
     }
 }

+static void
+print_timespec64(abi_ulong ts_addr, int last)
+{
+    if (ts_addr) {
+        struct target__kernel_timespec *ts;
+
+        ts =3D lock_user(VERIFY_READ, ts_addr, sizeof(*ts), 1);
+        if (!ts) {
+            print_pointer(ts_addr, last);
+            return;
+        }
+        qemu_log("{tv_sec =3D %lld"
+                 ",tv_nsec =3D %lld}%s",
+                 (long long)tswap64(ts->tv_sec), (long long)tswap64(ts->t=
v_nsec),
+                 get_comma(last));
+        unlock_user(ts, ts_addr, 0);
+    } else {
+        qemu_log("NULL%s", get_comma(last));
+    }
+}
+
 static void
 print_timezone(abi_ulong tz_addr, int last)
 {
@@ -2267,6 +2307,19 @@ print_clock_gettime(CPUArchState *cpu_env, const st=
ruct syscallname *name,
 #define print_clock_getres     print_clock_gettime
 #endif

+#if defined(TARGET_NR_clock_gettime64)
+static void
+print_clock_gettime64(CPUArchState *cpu_env, const struct syscallname *na=
me,
+                    abi_long arg0, abi_long arg1, abi_long arg2,
+                    abi_long arg3, abi_long arg4, abi_long arg5)
+{
+    print_syscall_prologue(name);
+    print_enums(clockids, arg0, 0);
+    print_pointer(arg1, 1);
+    print_syscall_epilogue(name);
+}
+#endif
+
 #ifdef TARGET_NR_clock_settime
 static void
 print_clock_settime(CPUArchState *cpu_env, const struct syscallname *name=
,
diff --git a/linux-user/strace.list b/linux-user/strace.list
index 72e17b1acf..a78cdf3cdf 100644
=2D-- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -1676,3 +1676,7 @@
 #ifdef TARGET_NR_copy_file_range
 { TARGET_NR_copy_file_range, "copy_file_range", "%s(%d,%p,%d,%p,"TARGET_A=
BI_FMT_lu",%u)", NULL, NULL },
 #endif
+#ifdef TARGET_NR_clock_gettime64
+{ TARGET_NR_clock_gettime64, "clock_gettime64" , NULL, print_clock_gettim=
e64,
+                           print_syscall_ret_clock_gettime64 },
+#endif
=2D-
2.37.2


