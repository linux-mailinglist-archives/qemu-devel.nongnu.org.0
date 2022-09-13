Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F4E5B7AB6
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 21:22:58 +0200 (CEST)
Received: from localhost ([::1]:59116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYBUn-0003IU-3t
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 15:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oYBLn-0008NC-Sj
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 15:13:39 -0400
Received: from mout.gmx.net ([212.227.17.20]:55455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oYBLf-0007eY-Tz
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 15:13:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663096404;
 bh=/icehtdKOzzoj9/rDZrbGqnt2FX/FH/xuZNyulOUMzM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=MeqdKkAD5MuzuD29qywUIVpsRi1qNSvqJWOGd07AnC4bDr7PM/mS2mXotWIz880bK
 7cwVhsZMgxuun2QQfZfS8ltl4L972oON/xSysT5DCT4DJEoZceC3QcMrxn9PFXQl+G
 uSP2sSlgXzAM9Byo/rjEAMSlFCJo4K1oWac9GY4k=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.190.164]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N17UQ-1pIlQs1Gyg-012Zq7; Tue, 13
 Sep 2022 21:13:24 +0200
From: Helge Deller <deller@gmx.de>
To: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: deller@gmx.de
Subject: [PULL 02/12] linux-user: Add missing clock_gettime64() syscall strace
Date: Tue, 13 Sep 2022 21:13:11 +0200
Message-Id: <20220913191321.96747-3-deller@gmx.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220913191321.96747-1-deller@gmx.de>
References: <20220913191321.96747-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BoAp5IQAqWdGcWD9fJgYkXxpDiexNU80fjmzNQYT6peCncjQ8e7
 MjRbxO4lCfGEur2l7yjOp0ALdu1Oi7tU3kuUjCZtwsV7rcLWzebHNNyVuYzZDbvyteFhSJh
 8Ds8T5sJNoNf1Bcg4VDeqDbv7tm9sy4zPpCZ5pZgZubk5nkgJ2Kuj0pVeZodA719xnQfvv1
 KEIbmWbMObZ2y03RA3wvQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ApB9dIJ5go8=:RO/w0uDN5pHdpzQfivRc0V
 eH9AXXeLZ5KhnDtTP6Lt/yddxDb636RbPL0XYObKowCrVEWdf+aQymGmjmRrnqAo02Is9xbFr
 k5JFCBtPdaC4S/9m96jfUb+vY2AF+lJp1x5JngxQUSs1fKs+q0PcpAMylha+bIzdA04Xpisjp
 G+x6poPUdkeRhsFDfNWeWauMGQ0PBF9tacWPXwYHWHNdRIqp3Cp/HvneA8zgOG6d590qiL9JB
 HOLDuVYeetxKagkfl7m+V1U1yDriPQNUgmwYeeZgh0G7FqrfWv1IfMYo9xmOypj2PwV9h3DIU
 5Jo6kwqrIcmx7qAei7j0kaiRuK69F3KB8AMOGqbMCqgCs4CBXG8t0dQWLmbIwngbho0JHsYiT
 uupDnDsCE50F6KRbeF0mXhL/uFdb74S2SFWD5wZ4UvMpmJa06QUUddeSeUDkJRl8p6N6ynvO2
 cc1qeGgzgXvjkJUH/CuVoSF8NiR2YLDJNznlpB/nCdaI9gicML9ugkC1mKHu3JK+8DnIt33lF
 gG1a2sOhQMFM9Yn92EbVQTpuatHApBnSWZW5ARJxWatH1Fh1FLT84g/nRacc2PBPEQ1k2VdIH
 /PgYdD1ldJ6Uc3sRJvetU5yfbP8NiQ08T0SfDFSDAklaDuXw11oP9XRlRYKlU650CGoFdw8xX
 wKaN5tGtSCTvomombXCxokEpiHbWd5pkVbduxNHWIToLVLiTnmKXcmCzfbihbXR1cZ8RU4I3P
 Mh/S6O2BKCq6/hac9IA4X0xy1RXyawnJgSl1BAdAYDlrNS5sM7ndnuQLX9YodeB7dfugtHAdS
 N0gOPGrmj93GNdb5/t/qdvXsm9ZxQdMeJDeAECALkaRYlFNN1a193KwCg/ENmsD6v7al6LM01
 1Eq1ce1QDUX0L4X3vvHezkDWKcl36YNgwHz8lNMgdkPLGskrQW5gPXoTTFsWwBktC+8UqS8s5
 yqz2B4xLrg965oPGWQAU0UH5ujTfRZH9zl+070YatXoVx0IOjmKozIb5GN8ZFycHWEDCzKs2z
 pNZ4X3S0aUjNAVGTnHewymmQwfpb+5EvYxP9vCfHVKgUYwUj6XT5bgbV8FhuDSc0pdl8h40dr
 2VzggeWRYjmLPeu26CRfzJjlv2xP5NOuL4dhozZq0YuIVj2n8aU0frtSj2Qdy3xmyUzpL3u0q
 qGmk/hkeUq49AIUaG+qjlwr5LO
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
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


