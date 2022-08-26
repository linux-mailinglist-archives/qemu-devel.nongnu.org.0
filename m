Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E98E35A2A2E
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:59:17 +0200 (CEST)
Received: from localhost ([::1]:58306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRanl-0006wU-0a
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:59:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oRaAn-0000cW-Ky
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:19:02 -0400
Received: from mout.gmx.net ([212.227.15.15]:57413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oRaAk-00054w-7g
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:19:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1661523534;
 bh=R2gm0lQxTGcnMIZvJ34PSjuclc+ywl/oXY2R8rzIr+k=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=M209SJRyQMiwuhwwhwkqHJspvAPSdNEOsmXGInFH7zwclZqVpvBx+eWzDZ500t62o
 vECVv5XBxhezvCr+nPJjvvkBjkR1jzfHXSgfBQy71WLzDJRpG4Pxw1VTN8vapGWTQ8
 U3+8S/Rd9gMZPHim8W93tf+I1EGM9KUPNFXy9pbE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.171.190]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQv8n-1opPkf12Dn-00O0BB; Fri, 26
 Aug 2022 16:18:54 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 01/13] linux-user: Add missing signals in strace output
Date: Fri, 26 Aug 2022 16:18:41 +0200
Message-Id: <20220826141853.419564-2-deller@gmx.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220826141853.419564-1-deller@gmx.de>
References: <20220826141853.419564-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uaicq9/Q9QOb+faWero1wg99rm8R4Hcdn7SvHEavuv26ibUrlX8
 TRofYHdyBEGdlu4varVFsV0ZnnLizBA55f+952Vmuav3MB6rzZZBbLXjOkleUPKCMb5f+Gk
 ZzWha3KFXnvLqFkULa1lmdevGAGQw2A66pQqsxn9A3O7p82w9p1uFM+YqgyScMpFXIKCoqv
 V0UYZk7zKjb6FOnwVsbTQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zVgjOc/oPbM=:0juuHsrDb4InimZ763aQYh
 5H+r4kfLGe2JYsjPYurdthHLSOl0VbgtuU83SPFlQAeCwEl54RdT0gxVsQg+HE5BZJ5R2UZly
 sm47HcFBm8bZLyvhajNNi+TdeGG1rQuXI0LuRL/R23uNhM+x8Vv2+4DPNvfGl1mJncAUIjTqb
 xnj5eor28XVF06KskUSf1imcu5lmIKIpnfQuxeaIb5vazoLrOBxTczu+r8TQMF2Led/PTw2X2
 Ffb2qSTXPhtrcSCzvmDGmlvgV7ES7SlQhZmhA9MTyV/hTZ0FPlmJP7SpqMsKxp5W0q592MyXr
 6rrvoTFdaOzSJ+mHO+NfXVLq/gdT+kqC2XvLHdSpSLrp1rXFwjED9zbd6a8F93JVkUdLgXpxh
 4GOcy8GqOV/oSJT+IVxqUC2qdou1AaxaXnsb2Cg6d2GuayCRyuAyGcdKe0hasnwHNThbTxZjI
 euM+svTa+MX9UKeG1afzzOTo5NZZPaDg5amM7TCLKCZnqZho1gQ6Cpv3xG5huZW7hL/utJetg
 qxbRerFrIlchW6ehQ097HnIKkBFrQgAM6YQJpHLZgvKv/jhHkmHEaHb9fNnn4gdUGpIwOwHec
 sAfIl8uoag1AoTeF92R5I+5rf3roIG7luueqaEP+vtW3/GbEB4A2SPflcxyUolgpbJCX2YWfm
 LPImLxqaPNdFLKAFbhTD+Set878NPr/9YgL9vzPIZ/mKxy4SplCklfliurh3VnJeECxSRSTz7
 3aNKeKRCiCOlJLHJ5RmRJdZtU72VVq2Mz9uao3bZUE33OkA4LtMtsy7gib1QOTrS09VifPqE3
 2eNQNj/cOFCg00wKQqvoUKE7xLxX1IW5hO/P+ZHuahCSVEr0K/jUHHSAGdk3B3lSH0R9tHyV9
 Osc8xw824BDm92w2t3xk5QtMEBw5TTGirqDJSxhrQIp6iQmPgORRWbXcVImgW+p27Zd1j/Qyh
 mDVvzUmAxUn49HZ++wMtM5UJBFd1t75K9zENh64uxScQ95aaP17nk5V2EGHmqpFBBrco5t/82
 BhGK8KW69xG1D7PvCSi0+H7H84Djh7htljps0npMH0wYkVfjFaQEhl/zAyDQiTqwVb4+zEWKm
 R1WGrSzHQcmzQBV3dVuw5Euwjq08lihjeri4s8XJk30Mr8JYXOhIIgIhw==
Received-SPF: pass client-ip=212.227.15.15; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
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

Some of the guest signal numbers are currently not converted to
their representative names in the strace output, e.g. SIGVTALRM.

This patch introduces a smart way to generate and keep in sync the
host-to-guest and guest-to-host signal conversion tables for usage in
the qemu signal and strace code. This ensures that any signals
will now show up in both tables.

There is no functional change in this patch - with the exception that yet
missing signal names now show up in the strace code too.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/signal-common.h | 46 ++++++++++++++++++++++++++++++++++++++
 linux-user/signal.c        | 37 +++---------------------------
 linux-user/strace.c        | 31 +++++++++----------------
 3 files changed, 60 insertions(+), 54 deletions(-)

diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
index 6a7e4a93fc..c2549bcd3e 100644
=2D-- a/linux-user/signal-common.h
+++ b/linux-user/signal-common.h
@@ -118,4 +118,50 @@ static inline void finish_sigsuspend_mask(int ret)
     }
 }

+#ifdef SIGSTKFLT
+#define MAKE_SIG_ENTRY_SIGSTKFLT        MAKE_SIG_ENTRY(SIGSTKFLT)
+#else
+#define MAKE_SIG_ENTRY_SIGSTKFLT
+#endif
+
+#ifdef SIGIOT
+#define MAKE_SIG_ENTRY_SIGIOT           MAKE_SIG_ENTRY(SIGIOT)
+#else
+#define MAKE_SIG_ENTRY_SIGIOT
+#endif
+
+#define MAKE_SIGNAL_LIST \
+	MAKE_SIG_ENTRY(SIGHUP) \
+	MAKE_SIG_ENTRY(SIGINT) \
+	MAKE_SIG_ENTRY(SIGQUIT) \
+	MAKE_SIG_ENTRY(SIGILL) \
+	MAKE_SIG_ENTRY(SIGTRAP) \
+	MAKE_SIG_ENTRY(SIGABRT) \
+	MAKE_SIG_ENTRY(SIGBUS) \
+	MAKE_SIG_ENTRY(SIGFPE) \
+	MAKE_SIG_ENTRY(SIGKILL) \
+	MAKE_SIG_ENTRY(SIGUSR1) \
+	MAKE_SIG_ENTRY(SIGSEGV) \
+	MAKE_SIG_ENTRY(SIGUSR2) \
+	MAKE_SIG_ENTRY(SIGPIPE) \
+	MAKE_SIG_ENTRY(SIGALRM) \
+	MAKE_SIG_ENTRY(SIGTERM) \
+	MAKE_SIG_ENTRY(SIGCHLD) \
+	MAKE_SIG_ENTRY(SIGCONT) \
+	MAKE_SIG_ENTRY(SIGSTOP) \
+	MAKE_SIG_ENTRY(SIGTSTP) \
+	MAKE_SIG_ENTRY(SIGTTIN) \
+	MAKE_SIG_ENTRY(SIGTTOU) \
+	MAKE_SIG_ENTRY(SIGURG) \
+	MAKE_SIG_ENTRY(SIGXCPU) \
+	MAKE_SIG_ENTRY(SIGXFSZ) \
+	MAKE_SIG_ENTRY(SIGVTALRM) \
+	MAKE_SIG_ENTRY(SIGPROF) \
+	MAKE_SIG_ENTRY(SIGWINCH) \
+	MAKE_SIG_ENTRY(SIGIO) \
+	MAKE_SIG_ENTRY(SIGPWR) \
+	MAKE_SIG_ENTRY(SIGSYS) \
+	MAKE_SIG_ENTRY_SIGSTKFLT \
+	MAKE_SIG_ENTRY_SIGIOT
+
 #endif
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 8d29bfaa6b..03b4d5e6ee 100644
=2D-- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -53,40 +53,9 @@ abi_ulong default_rt_sigreturn;
 QEMU_BUILD_BUG_ON(__SIGRTMAX + 1 !=3D _NSIG);
 #endif
 static uint8_t host_to_target_signal_table[_NSIG] =3D {
-    [SIGHUP] =3D TARGET_SIGHUP,
-    [SIGINT] =3D TARGET_SIGINT,
-    [SIGQUIT] =3D TARGET_SIGQUIT,
-    [SIGILL] =3D TARGET_SIGILL,
-    [SIGTRAP] =3D TARGET_SIGTRAP,
-    [SIGABRT] =3D TARGET_SIGABRT,
-/*    [SIGIOT] =3D TARGET_SIGIOT,*/
-    [SIGBUS] =3D TARGET_SIGBUS,
-    [SIGFPE] =3D TARGET_SIGFPE,
-    [SIGKILL] =3D TARGET_SIGKILL,
-    [SIGUSR1] =3D TARGET_SIGUSR1,
-    [SIGSEGV] =3D TARGET_SIGSEGV,
-    [SIGUSR2] =3D TARGET_SIGUSR2,
-    [SIGPIPE] =3D TARGET_SIGPIPE,
-    [SIGALRM] =3D TARGET_SIGALRM,
-    [SIGTERM] =3D TARGET_SIGTERM,
-#ifdef SIGSTKFLT
-    [SIGSTKFLT] =3D TARGET_SIGSTKFLT,
-#endif
-    [SIGCHLD] =3D TARGET_SIGCHLD,
-    [SIGCONT] =3D TARGET_SIGCONT,
-    [SIGSTOP] =3D TARGET_SIGSTOP,
-    [SIGTSTP] =3D TARGET_SIGTSTP,
-    [SIGTTIN] =3D TARGET_SIGTTIN,
-    [SIGTTOU] =3D TARGET_SIGTTOU,
-    [SIGURG] =3D TARGET_SIGURG,
-    [SIGXCPU] =3D TARGET_SIGXCPU,
-    [SIGXFSZ] =3D TARGET_SIGXFSZ,
-    [SIGVTALRM] =3D TARGET_SIGVTALRM,
-    [SIGPROF] =3D TARGET_SIGPROF,
-    [SIGWINCH] =3D TARGET_SIGWINCH,
-    [SIGIO] =3D TARGET_SIGIO,
-    [SIGPWR] =3D TARGET_SIGPWR,
-    [SIGSYS] =3D TARGET_SIGSYS,
+#define MAKE_SIG_ENTRY(sig)     [sig] =3D TARGET_##sig,
+	MAKE_SIGNAL_LIST
+#undef MAKE_SIG_ENTRY
     /* next signals stay the same */
 };

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 7d882526da..a217c1025a 100644
=2D-- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -17,6 +17,7 @@
 #include "qemu.h"
 #include "user-internals.h"
 #include "strace.h"
+#include "signal-common.h"

 struct syscallname {
     int nr;
@@ -141,30 +142,20 @@ if( cmd =3D=3D val ) { \
     qemu_log("%d", cmd);
 }

+static const char *target_signal_to_host_signal_table[_NSIG] =3D {
+#define MAKE_SIG_ENTRY(sig)     [TARGET_##sig] =3D #sig,
+        MAKE_SIGNAL_LIST
+#undef MAKE_SIG_ENTRY
+};
+
 static void
 print_signal(abi_ulong arg, int last)
 {
     const char *signal_name =3D NULL;
-    switch(arg) {
-    case TARGET_SIGHUP: signal_name =3D "SIGHUP"; break;
-    case TARGET_SIGINT: signal_name =3D "SIGINT"; break;
-    case TARGET_SIGQUIT: signal_name =3D "SIGQUIT"; break;
-    case TARGET_SIGILL: signal_name =3D "SIGILL"; break;
-    case TARGET_SIGABRT: signal_name =3D "SIGABRT"; break;
-    case TARGET_SIGFPE: signal_name =3D "SIGFPE"; break;
-    case TARGET_SIGKILL: signal_name =3D "SIGKILL"; break;
-    case TARGET_SIGSEGV: signal_name =3D "SIGSEGV"; break;
-    case TARGET_SIGPIPE: signal_name =3D "SIGPIPE"; break;
-    case TARGET_SIGALRM: signal_name =3D "SIGALRM"; break;
-    case TARGET_SIGTERM: signal_name =3D "SIGTERM"; break;
-    case TARGET_SIGUSR1: signal_name =3D "SIGUSR1"; break;
-    case TARGET_SIGUSR2: signal_name =3D "SIGUSR2"; break;
-    case TARGET_SIGCHLD: signal_name =3D "SIGCHLD"; break;
-    case TARGET_SIGCONT: signal_name =3D "SIGCONT"; break;
-    case TARGET_SIGSTOP: signal_name =3D "SIGSTOP"; break;
-    case TARGET_SIGTTIN: signal_name =3D "SIGTTIN"; break;
-    case TARGET_SIGTTOU: signal_name =3D "SIGTTOU"; break;
-    }
+
+    if (arg < _NSIG)
+        signal_name =3D target_signal_to_host_signal_table[arg];
+
     if (signal_name =3D=3D NULL) {
         print_raw_param("%ld", arg, last);
         return;
=2D-
2.37.1


