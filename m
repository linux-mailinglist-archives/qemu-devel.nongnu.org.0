Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0415B50AA
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 20:37:49 +0200 (CEST)
Received: from localhost ([::1]:59478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXRq0-0000oF-Ti
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 14:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oXRXX-0002S5-GW
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 14:18:43 -0400
Received: from mout.gmx.net ([212.227.15.18]:59789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oXRXU-0002lE-8f
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 14:18:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1662920313;
 bh=iZy4oWlz4gLRtGY1piJ1Up9ec0SQer8EDDaNHLcum+s=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=O1YPVof6d32/GuywkQDTxEhGqqbdGM7641MpaO9/suA6GTshzzaKY1fkjp6WBGAMf
 ropBvHeNeklubGsuUE42v9lnORl84UCk/F0t369TP+rW7he6AhTBC+N9xdrVYHID/N
 ZJ0BXt+v/PWl925SxkAGXrUyVoUhggMwkIM84IWI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.178.88]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MsYqv-1pLyks2E6l-00u582; Sun, 11
 Sep 2022 20:18:33 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Cc: deller@gmx.de,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 01/12] linux-user: Add missing signals in strace output
Date: Sun, 11 Sep 2022 20:18:19 +0200
Message-Id: <20220911181830.15851-2-deller@gmx.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911181830.15851-1-deller@gmx.de>
References: <20220911181830.15851-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:l3nioEHCuAtTKG5EkdNb3nJnUQ+yAUj1/s+v9KwrC8amL18zuIF
 rD+N5CwKrXhicykZ7oxtF++zop8Up+1lBC5AH84ID+XIzvd8d+YxDWTAu14kKyOc6POtZGr
 vOES56qY1vcyhMXOAnZX0thjkOQb7EK1mAt3ZfKxe6x3EI8QR5pWwBlOKaqwKXxsSczTXZE
 dYjV7c6gmSTPtptJfQjYQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ccx2wq0TOlY=:OlTSYM4qy+oEXJEib4JWUZ
 wxXugDQrqRoa6bW32hySNM72FQBgRn9ruQcUTD6t8q53C8h09sjcgVhblIjo+rS+7zzi1hMSr
 k0brotP4vq9RGv6+otAX6KCEOYQFMAQ/msANsIGHgvFxmOgtu4Bj8Oj1ctemKyZsqsGxOvXfy
 RCrDt9YVaRVT9XljM1AemL992y5Azsw4/gp88xtQT2YUei2Lqz2wrxFoD4mJOOK81WBY+4a/D
 PUK2gCBnALR6gkzV11kOkkXDOpJSI3zyJBTCTQGM9sAq1TFrW7aAEJ3siYx4EwvHPbO49Vvg7
 +zw5sHBW03u9De9yD+3itirys6NLqm/weGztk7iyzPS4PnmtGki/hf9PfbDe6MwRLQFcQjXkH
 Gws8oahyFlA7kownHKAS6/ZuQQ7UYtwbURkpVNUyFjBpOylPj7+HZqrmgd6PkHqFX7a3RConn
 9my3CQpSAY7AlPqf1TPM3X72/8/RpMUANPHNVRbkjqpm9CWBKOL2X8evOdGLGaeosSwc9EFyy
 KRE7pZwoKyDTKMTcDooTusYVrBhmqDK7nHDkNHV+Ji+uKiZDRyy6RhVOh4oE3u/7/HGV5xUWn
 ukqe/nsINYksCmfZ3KDiIa0vrKaDbekJo5rncYemQs+kVndwngcUdvwpD0rzSq9ZkPMig2XFn
 1b7BWIkCFDPDZ9QaGdWTtWZGK68PiebejXMhF/tL3oe+iUFeycVEcPoDj0dYQsOdePfHHBHvC
 Tw+EOMWT4TTSOsQlZxUBG8AYMqK27749Dz3dZcsIFZFfJzJgASomWtFj1KblxcNwNeR/+esHD
 OjhR8NtEog0zqaXK8Szt/9KGYpPrsYghAoIzN6h7kJMhL2AIpj0fBZ3Fyt222o1nqw8i+CzoW
 9e4BCsaZjHXt50BQruUP5oS3h+GZMWTg8+oiAGKtpzSylnLmomeSH9mFC4r9WMqACc/jtgQr+
 fcBqwcedlkwXOTHHXp75Dvsa5d/H7bRJTPxXMOJy/SGCAhFwnKn3Aytl0KjpGRXCjKaAny3ed
 5FgrnId+qvhEhp3xg+sQ+rBqQaWexUst9xBhUrQb2Oua3WhjmCMS395ZPnfIqj/6AfLzlc+Pt
 r3jXf0VDQKgTlfbFkRAiAz/xrA4/3GfuLmRIMM89OLDiB9Q8ZYSbs4b311M0Rk3ze8rHbdBZp
 KpWI8=
Received-SPF: pass client-ip=212.227.15.18; envelope-from=deller@gmx.de;
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
 linux-user/strace.c        | 30 +++++++++----------------
 3 files changed, 60 insertions(+), 53 deletions(-)

diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
index 6a7e4a93fc..3e2dc604c2 100644
=2D-- a/linux-user/signal-common.h
+++ b/linux-user/signal-common.h
@@ -118,4 +118,50 @@ static inline void finish_sigsuspend_mask(int ret)
     }
 }

+#if defined(SIGSTKFLT) && defined(TARGET_SIGSTKFLT)
+#define MAKE_SIG_ENTRY_SIGSTKFLT        MAKE_SIG_ENTRY(SIGSTKFLT)
+#else
+#define MAKE_SIG_ENTRY_SIGSTKFLT
+#endif
+
+#if defined(SIGIOT) && defined(TARGET_SIGIOT)
+#define MAKE_SIG_ENTRY_SIGIOT           MAKE_SIG_ENTRY(SIGIOT)
+#else
+#define MAKE_SIG_ENTRY_SIGIOT
+#endif
+
+#define MAKE_SIGNAL_LIST \
+        MAKE_SIG_ENTRY(SIGHUP) \
+        MAKE_SIG_ENTRY(SIGINT) \
+        MAKE_SIG_ENTRY(SIGQUIT) \
+        MAKE_SIG_ENTRY(SIGILL) \
+        MAKE_SIG_ENTRY(SIGTRAP) \
+        MAKE_SIG_ENTRY(SIGABRT) \
+        MAKE_SIG_ENTRY(SIGBUS) \
+        MAKE_SIG_ENTRY(SIGFPE) \
+        MAKE_SIG_ENTRY(SIGKILL) \
+        MAKE_SIG_ENTRY(SIGUSR1) \
+        MAKE_SIG_ENTRY(SIGSEGV) \
+        MAKE_SIG_ENTRY(SIGUSR2) \
+        MAKE_SIG_ENTRY(SIGPIPE) \
+        MAKE_SIG_ENTRY(SIGALRM) \
+        MAKE_SIG_ENTRY(SIGTERM) \
+        MAKE_SIG_ENTRY(SIGCHLD) \
+        MAKE_SIG_ENTRY(SIGCONT) \
+        MAKE_SIG_ENTRY(SIGSTOP) \
+        MAKE_SIG_ENTRY(SIGTSTP) \
+        MAKE_SIG_ENTRY(SIGTTIN) \
+        MAKE_SIG_ENTRY(SIGTTOU) \
+        MAKE_SIG_ENTRY(SIGURG) \
+        MAKE_SIG_ENTRY(SIGXCPU) \
+        MAKE_SIG_ENTRY(SIGXFSZ) \
+        MAKE_SIG_ENTRY(SIGVTALRM) \
+        MAKE_SIG_ENTRY(SIGPROF) \
+        MAKE_SIG_ENTRY(SIGWINCH) \
+        MAKE_SIG_ENTRY(SIGIO) \
+        MAKE_SIG_ENTRY(SIGPWR) \
+        MAKE_SIG_ENTRY(SIGSYS) \
+        MAKE_SIG_ENTRY_SIGSTKFLT \
+        MAKE_SIG_ENTRY_SIGIOT
+
 #endif
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 8d29bfaa6b..61c6fa3fcf 100644
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
+        MAKE_SIGNAL_LIST
+#undef MAKE_SIG_ENTRY
     /* next signals stay the same */
 };

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 7d882526da..a4eeef7ae1 100644
=2D-- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -17,6 +17,7 @@
 #include "qemu.h"
 #include "user-internals.h"
 #include "strace.h"
+#include "signal-common.h"

 struct syscallname {
     int nr;
@@ -141,30 +142,21 @@ if( cmd =3D=3D val ) { \
     qemu_log("%d", cmd);
 }

+static const char * const target_signal_name[] =3D {
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
+
+    if (arg < ARRAY_SIZE(target_signal_name)) {
+        signal_name =3D target_signal_name[arg];
     }
+
     if (signal_name =3D=3D NULL) {
         print_raw_param("%ld", arg, last);
         return;
=2D-
2.37.2


