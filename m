Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA785BBF97
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 21:50:06 +0200 (CEST)
Received: from localhost ([::1]:36452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa0Il-0004Ei-0C
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 15:50:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oa0Er-00071O-JW
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 15:46:13 -0400
Received: from mout.gmx.net ([212.227.17.20]:47359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oa0Ep-0007af-No
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 15:46:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663530356;
 bh=4I4lfp6ArUG8vjJS1EZv295BBfahRZlwlhlm+UEhPH0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=lnEwJMbIRvrX98UMIXtmj7ZcFBgCos6NXELRoqWw2l1CHSbW8+obaE2pXC73cIsUe
 5z5J5Zx6QpjTclkLHe4mZ9Cr4EC82reWCdhQy8F8H94rIbJ433d7ZExY0ZyAUuSrkH
 gqC5nJmPM68MnZCpW19oki+v6ttN7dO1IJfN8vi8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.165.224]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mlw3X-1ozgGt2L1X-00iyBQ; Sun, 18
 Sep 2022 21:45:56 +0200
From: Helge Deller <deller@gmx.de>
To: Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: deller@gmx.de
Subject: [PATCH v3 02/12] linux-user: Add missing clock_gettime64() syscall
 strace
Date: Sun, 18 Sep 2022 21:45:45 +0200
Message-Id: <20220918194555.83535-3-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220918194555.83535-1-deller@gmx.de>
References: <20220918194555.83535-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FUgByadoKNCZPc+Hh5Jt6QHlRwc8EcGPnwYlXMzkJpljdyLEeqg
 VSLU3Z6TrIPTu9l7HpBRbFrTHcht2W4PzGbEEa98Eob6gLDbMMeA0rqX9KaEd8A1AbRNlLY
 opRAZGUxwFTiHI/LgBH5TOhFtljosNPNiRWIaYIT1F3iRwhYd81OB+8cBn2LEJXrLCqYHLP
 pd1zPD8jcBhgErxOiaI3Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2ScGXLJ/IwQ=:33WTJf6i5L0YOxcWESw6/e
 CJSFuUTUuGYnl82fFz6iJA+hXwdDlvkNzRXgfUxsT3P/jM+HdGMssr5Qljr4xI1jhpl+oqNkJ
 Irw3KJZG5NX9jKrk7PPp659+7FrRAhZKvZbEI1nH+GwHrI92vzG4M/AGFAJsw2I6R0rQLBK+P
 YhZ5Wcoa+J8Uc0AJXyxfHcGOFFBf0KZ5VottfL9L/bTcWkOjj8YOFaWw7MSWC64HcCoH7in5w
 1JA+pE6TJk3GkIatZQ3k7/wAGTT4ZUb/WMJk2ZCCFEcSNzKFDDXFMkBIKosticBMJetmIUBjt
 GHlMzMamesvgJc1sbUNneS5BxiVNoo57RDP2UhlC2a5Itx5ySkL4xVeZF5h/wAaRSX9+4pGGZ
 Cy4KXwCYNvBAgAx6ClgTxETTuyeWX5oIGNgZg90qRldFb/eZWBWF1C6e2MJEGJeQ9e6pM2ZA/
 w+TbPAhHskqzZkpEN9H8Gg467UPJ9YKdX1+xu2TdOcyR5rn59hff+DRlpxso7vm+2+NZM6er8
 kYd97Uit1boglRplSoa8xLBOnpiaHrUNwUKeiOTbe77tucvdVmYZZ3kzCuizZv9RYJj0r7Ciw
 MbotkpM9vkz2SDr1TONLySDOcUqJnWu02F0oW5nm90yhX7fWROp6iJaxFcCYiOXY5GS5U0tKa
 HtOLR5llWNaKso06FiOvgCaR5DPLjkPEebMC7CzyThWbRtETmlpTMkMHzpaEjv9gSmXDSpd1V
 zlpJs/5buBrCQpEB7DwJ6ZOeVuA/uaj6j6GxMViaxZ9vt18/Tjv2/Tc7CimDgqPzZF0VUwXGX
 GXCj5+i3gpQZwQhlLD54GCfn472VZe1CmhF/Mq++obodV6tOncaVBmFRU5R/h539iHpOLuI1q
 rVglpaQhnQEhHIRQcVlNQM7lsJiTc/cXf20p9IFfGQ+A6ihRIkwpLR+tM7Yzo63L7g+h7+6ze
 u39lQn3rVx5EohWEFIHKDFnRzbz+dXrdmrsYx+FHGk4xFIB8UaFe1LWFY6x5eSLYVXPItSUNp
 1jhrJk9MbwcetjiFk21tcdMBjrGAD0VoWKZzIpZ+So9jcngZu1V5kFMJ+SymOc85suYEoYz5a
 PF7xbcjASacPvRUzf/XHQ9cjXHlYcgN9RXsR+w+x3EPIkdz4BXdc1R7CLS2MsV1d2T9/txTEW
 9fORpYpOpMdWQSdPekNnD4YiiM
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
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


