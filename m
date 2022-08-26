Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 400305A2A54
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 17:07:10 +0200 (CEST)
Received: from localhost ([::1]:43752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRavN-0006Rl-Aa
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 11:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oRaAq-0000ey-5G
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:19:04 -0400
Received: from mout.gmx.net ([212.227.15.19]:57737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oRaAm-00054p-PL
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:19:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1661523534;
 bh=lGtuTq6IJ/giMaYIDVQ+83fjvCGaPohajB0Sqj+QRLE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=kfWB8QyjDjpBaJS5LGWviMKJymPENxpZMm81WrWFqzj8VK2uopi5nxRZdv1wINsfd
 6bIoezMiMa1Vo5/BhBHH9QBHhwPC/7/nw+IP/D97ocqMSiN1Ugr7MnXlc4SxPjCJE8
 8RY0AVH/0j/+pN33c7zXf9d3Tyhjy84sLELIIOLM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.171.190]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MiaY9-1p6wfZ1Y4V-00ffWP; Fri, 26
 Aug 2022 16:18:54 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 02/13] linux-user: Add missing clock_gettime64() syscall strace
Date: Fri, 26 Aug 2022 16:18:42 +0200
Message-Id: <20220826141853.419564-3-deller@gmx.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220826141853.419564-1-deller@gmx.de>
References: <20220826141853.419564-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LMMHpx8lJ0pTTnHBT3ZFkWep0qLD6ulu7fY1JmQBdgcDiSe5rWY
 NeQrTJSgJwBSSssnknNuMtfbcVE8UEfV1bu4BaBQejLCJjkuePhdZMTL6o8CYywIUCcLj6I
 cunQnzWzBUW9HJ3cya1sOHl/bSf5Saz9640MEhhppTZX1fHbtpJb5cT+8cNMUTtnpISgXdP
 W4+jfez75+xEXlyjoLx7g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:G4Xr/3BGkJU=:4Hf99Jz+IPu+jdEcaxcaGF
 nfHMbs52ggqfL8jfWRhQU7XNR/zNVTrfyO2lSm2eh7GVvHQ+3x1Qu5wKHTFEsi3BMju4cecZn
 NaUoDR+kDH6sRRi2GLIypDdo3S/6P54cZvghZkF7ODxoZ9yYLPZI6ZKeIkg1ZejgKnArVFrFI
 7+Ky1ESlrWCr01vgZgK98F7nFOTaQNvKc/dgQaJjIln1yIz48VIBkDep9BaJBrC/RVVPuAm1D
 APUgEIvQZy1Em2S8XxpwfCv198FN60MXIa1gR1f6m6FxaVnNmKJsloSH4juFcBWQSLVs0tuVJ
 LDsONLCLyN2Cx1CHAmRLnizcFa5ZNmHI0TVxeXyX42LvytzLqtWE0VvNCxKr5vBvwX7zP1ZAr
 KMFw8rPlMwdHacKpnNVNzaiMqRkM0LngAndJldzqkD5nQikTfbtXEb9ueDjRFLQSnjdSThaKt
 FAxZ5CPbDvtmMWDU4UvUqraOmtotvd1fEX8xRDC0pM2U5h3A7G2TwYmITGF7xPaefVYOaibmn
 UVaIeISHsHrrDYpnCB3UGyr86c5BZnbxShByKHlL2DvLm/urP6QOd5n/lJI4E384BRKQV22NH
 6zk79Ck6WWFk6xyu41z0nLz/jwzECJdbfIiADowNup74n83Jn0PYM/en/zHmKtHsCkiekFyN7
 qbG3LTPE5Ji4aBfk0c6ijIf8C4gC6lKHf4mPlUyXb0/NECKXF1X2jfG+jRnjIVsezyat9VzwB
 s49u53qJEVuujmJ1h3LIXRWt+/6c6HV72jHjPxNCW+yQPiIHgSD7tVARR3I/AjgXDWqWq5EGD
 BvVt+IzLvT/KRkyLKCxhkpqSeOEIBkT1/VTAAhm4oucRmz8s8Mkrsz5+bGW4Kq2tJFrFgJ6nP
 Okzbj65r0bDS5lp1zq1zg9Z6ih5ldL1hnwfX4IELCdm4jIA3V+dlAtQblxaJQ+seREb0+fo8k
 REcEt9DqLDwjcmjyp12Sg9Abkj72a3IP0Wyatnrxx0zW/STImN/Or2/GjelOlAZHE0ExT/yIy
 Lk+44gSqHp3aqMRFhpTYJNwTQ6Q/xmtR+FRqImD66Z+pfxif9hcr0jnJzyk8d//vkwOULVJZo
 kAWSQMRaCJd5us7HQiW+3r72xYWVzvUlI8GtK0dCutv7ochX7S0/tBJvQ==
Received-SPF: pass client-ip=212.227.15.19; envelope-from=deller@gmx.de;
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
2.37.1


