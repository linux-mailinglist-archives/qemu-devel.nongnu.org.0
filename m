Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C155BF08B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:52:38 +0200 (CEST)
Received: from localhost ([::1]:59852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oam6X-0005tx-W0
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:52:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oah6G-00042D-Eo
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:32:00 -0400
Received: from mout.gmx.net ([212.227.17.21]:44659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oah6D-0003I5-CI
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:31:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663695113;
 bh=4I4lfp6ArUG8vjJS1EZv295BBfahRZlwlhlm+UEhPH0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ION3CJ9k7l6ajtFxKPGQuCZ6KN1RV79oVne1LblzImfi+W6gzQdtD/6a5DnDZSY/Q
 E+g3VwkV2GfiSvUI/BP5lyQjJ96M1jJ8o7bVXNujhDD2rfzveI14cq12MTZQe3iS2o
 5qkHGyjIzJ0yueC+y+RNmQBJn858WaPCjd9Kpowo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.174.94]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M7b6b-1odhEy1ORx-0081fs; Tue, 20
 Sep 2022 19:31:53 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>
Cc: deller@gmx.de
Subject: [PULL 02/12] linux-user: Add missing clock_gettime64() syscall strace
Date: Tue, 20 Sep 2022 19:31:42 +0200
Message-Id: <20220920173152.199359-3-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920173152.199359-1-deller@gmx.de>
References: <20220920173152.199359-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VhMro8PgHH3XWX89sloZPiehOBLaXBbWniiQHAXXNMaQwqZsikv
 mvwX7GHmExB93cID4eowBUAdgWNDu5eHT4d0d1bawHmM/+uWAGamF9PTlxnyNuCt5fgbnWO
 xXVlpHd+a+Zwvwjv0HMCQf0AUVRzYKJNKXCWsMz3FyNMzjh4wSaBW/7nG4r0UZH2BmeJnxa
 aJ6b9gnfYdkaoTny3G0vA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cW3uBlKmc74=:xM0CaVd9LWtrHGl72LhL9W
 cWDkV3yHdvdzNk1SxkTMK3YRfNmP9zdlqBGJrzH+VhYpIM0lt5rjrCQIOv/doK3sVzqjxkWeS
 gvdymMvvSrSUuxXA5zkfEE+a1EV/5r7otbmm6LqpbbjAbzY7GlRyjrFVM1bVhCmbFEG13POtd
 TIy/GLyvAbugB55WUSev3CHGpH0aYWbDAwULKO+kl56Jhxqvzd5GVdAeLAk3ahgQiD4okLYAQ
 tSUgxj7GayKIF113N256cQVNSssS7YRyee6DYofn5QEaKai8d13RvK2OhGIuW4fA46fBx56d2
 yTt7/Ln6gBv5EKZnP5xD/705ZVX3P3o7qZuP/ilzRDsVAGZ9qBcZVGaO8/Ap5M2bLngczEyFW
 MHGVPtWXR9agdz6Fl7iRiooU12L6/7rIpmE1gITDcBug6i9/kqhZ7Q6fIEAGfqKBoOtZH23DD
 AYfzgX46zNpNVoT1pM+6ArcM7jVXBanhTxLRQmcTVbktQnXEed5jYR/YDlAYifGpyWLr1RXUh
 5U7gtwpNKEZTf5hWHBj4ckT/NhIgNFJvCnwRo+Hw8i7I4dDrg2c+CuNeFuDNLZm6BCJcDU79L
 Q7UL/p1rp0mU6ZLeRJqcGRDNK2Fw4mUxUUAccdUQD6VVUJVTCqOOJUn8cHmYaiyWXF/Au7rI6
 7g1cwqkjYRdD4vyqwfCRaeIUtPDnaupPJRLd62iSqNKJeII3cqwKJlmOoytN9ruf9HRsePGNE
 u62v+Q5ofiCqJRv1jbgbeP2iBJxI3HJq9VyKlpak2CiT2Wf+bQSBbvn3pTuScMeMduJ1BlGwr
 S3zWtD9HGmK1rS9I91DUlDDXVEOQ7T/0p376igbFGdpr/G542lpzoHuUxLVD1ytSOuHVahGgs
 LXXUop6eQnZuUFFOi/9KMphoT6lDfZfHyjkcPTZ1v/z9FBxEgYQ/xSLkHOUmM4kTgHEd9EqPb
 IOLEs01q7dJ9f48qC4bfWBGqIXjnC1grL0Z1qMvCFL0ACyTAnbHHdL3dF90S2MznI5Q2D1jsb
 +fXx7kAJ15ZPsNhCJv6AgIq3QRxyZA4idDns+o+4Ex/deHuoBANVVjCZjwXq4/Fzcl206CW0A
 Tg9z0aju8QnEDE4Bj51gjy7b94cR0RUzug8Eei5mSF/Kzrg2Kp7lNXFzn5KLaCxys1g+glchI
 V+jLw=
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
2.37.3


