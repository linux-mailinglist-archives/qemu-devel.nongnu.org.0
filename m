Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9639C583435
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 22:48:16 +0200 (CEST)
Received: from localhost ([::1]:56318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGnwu-0000gV-HY
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 16:48:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oGnrG-0005fv-D6
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 16:42:20 -0400
Received: from mout.gmx.net ([212.227.15.15]:44485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oGnr3-0002XS-0C
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 16:42:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658954520;
 bh=dCdzq+pCRW4zypzLKTY3jwYmXtP2d/+tZhmPug7nOGo=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=CmJMsa+ZwXSqgMnHR/p66L6YKbNyAYKTGfPbYf4KAzpqD8TKiTOX1eZUHUKAJ33K9
 AOKlUyNYx2Im7eSEqvhEhM+MXn232mx3HYOamsxqpeG5lEFGwqbzdmKxt3JcDX4CJp
 h3Barscqw0bKOOO/lJxBHbWCuuWKmhg8LF7lOKo4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.185.42]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MgNcz-1npTBH1Hl1-00hwVx; Wed, 27
 Jul 2022 22:42:00 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 2/2] linux-user: Add missing clock_gettime64() syscall strace
Date: Wed, 27 Jul 2022 22:41:59 +0200
Message-Id: <20220727204159.106936-3-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220727204159.106936-1-deller@gmx.de>
References: <20220727204159.106936-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Lsbgm9x2zOeNI8b/D9GCGpYT0q6ITrtb98d+oavI/bRh26yfEjr
 G/ZpLVQ4bLrtu5zGlYxYE+lqRAL3a04PcpW93WdPvnHxPZ4vZe7v+C+Mc9Yj8n7uCPMpOWS
 qj/M+SoKEkODXpdLqgm9YibWy3/O26G1j8/LoGok115zF4JuXnJbL2I5JEc7b4/GyaAXn96
 ph2Q6IIXyfsDjbMbjLzjQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Awi3vidbaRs=:vJUpvXeT3qhOAYpoW9cnXA
 w/niGwclSSf66YrF3g/piOV7Pqas3ZoU/X/NJTDYkiUe+va4Xf0WT3aHUid7NREkBJ2QQHMW4
 /s7FJEv6SzxxFw37lvrwipHYBY4L2LOUYQvWEWlSBN9SkmgTXETM0VoG6sb+P6gj9a+eY3jn+
 v7b5HFE1EO9TrgJHz3b2o+bmpqJiG9OKjgJOuhq2OULmWOH85QVtyTfH32PB0YaVpouJ4qbk+
 0cExkUtpVcgyan9iMMOj0vwWYADs0bL3HHbc23HB4NEcchUOPAr3hoM+uf5cL7eT7nygGXFof
 KInqYoSg55FNgZYfxAI3gfRZkxkE8/FhwXkuL33NUG9JaGV757mdLmtQzVJP9holE3dkS1MH6
 Xifq4tZsTEk9N88HwLxQqyQl3ilEpVDFIsl/ulN/b+Wlv59lFuxWgkRRHS19R+fXOe8rqe8A0
 IrBJP9fvFI4hd1YhLXowuZ/oQgeNoJoIGBP0yr2L6a8/Qj9hRwWmjc5SDKsvyYvNdpWjvgv6W
 yL/2FmE7M69kofRC9hM386e83epFRyv8FyjKbD/LgnNaWhoh6DTs5JpXDxI+no7+TJOn0Ewu8
 eLDHFlwA3Kg2ab7Hq82+c8rvBzyOOIljxanp9yakgrvIl8eAnqqSTpxQimqIbHRsjq0ynl4sV
 wSbLBP8VrTMZNUBeolVpciTSCYkASaIEocVJi0QTrD5kclDIIpi3HTo76ysL6FADmgRywNM74
 exkdJN02i2iBJDCStx+31dwOUYeGFoyrwvBSj7IgLbKdwMlnGSUCkZ5LOFn+hVoA3XwbpyczB
 VG+jsE3wdS9dXxRQnheotn9eQbEcWOKP5BwtqJjLd9T7fre7L9nql3wAzGRs1FlPYDgf3Kpl0
 I/FvG8kZbUu1VtjfUFKRWd7CsuPtjyYj3YTiZKJlET6CqTXQZ8C1bIUBo/SvpAItmGUBnipZz
 mOnvHGAc0DOseCiMR1LVyXkeTg9Mp8oHEULfX3rDCYmRZ7xBLkZmFqBNf6wFxIYxU5NoCRRMi
 /MVdR75s1m61700zgnjrRRFfG/vgVmzH/PHz6NfW6ZZU4KftRvm/rRMs/tEb9pw6yD61tsNFo
 i9lDGsg46BFq6P51rc+aK4AJuCa5/dl7RUIxv1vvvWp+5aKFJ0cIfabMA==
Received-SPF: pass client-ip=212.227.15.15; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
index a217c1025a..27309f1106 100644
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
@@ -794,6 +795,24 @@ print_syscall_ret_clock_gettime(CPUArchState *cpu_env=
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
@@ -1651,6 +1670,27 @@ print_timespec(abi_ulong ts_addr, int last)
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
@@ -2266,6 +2306,19 @@ print_clock_gettime(CPUArchState *cpu_env, const st=
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
2.35.3


