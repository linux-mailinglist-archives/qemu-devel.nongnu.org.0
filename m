Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B12583439
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 22:49:26 +0200 (CEST)
Received: from localhost ([::1]:57120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGny8-0001IC-T3
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 16:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oGnrI-0005gA-DC
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 16:42:20 -0400
Received: from mout.gmx.net ([212.227.15.18]:51359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oGnr3-0002XR-0D
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 16:42:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658954520;
 bh=1vPBDZ9ToQbqY9kmDi499U7WZLBXM9nAgxIW7CSnZE8=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=M2HAWSB0IQY4XABnwys0WM6wlhGoxI4H9obqjudE4XQLVkrjJENtFP3GskG8MIaSJ
 YBaKZAe306cg4eYOnELilUUVXzlPQHtShmh4TKX3u/4OBvbX+/Ri5q5ldMbwMc/S8D
 4jeFa7y7ZdVDhf9zzoNUNicnCRSgpFG8jVlg9Rt8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.185.42]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9FjR-1oMb0h0nt1-006Opx; Wed, 27
 Jul 2022 22:42:00 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 1/2] linux-user: Add missing signals in strace output
Date: Wed, 27 Jul 2022 22:41:58 +0200
Message-Id: <20220727204159.106936-2-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220727204159.106936-1-deller@gmx.de>
References: <20220727204159.106936-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1/jcjQdP6/+57/Spo0oB/YX05jm5QjlJuPgfOFCc5Vsbb6pBTY9
 DqspnhS5JjlOVrs/CfuxPHfYhdC/AI/0sNXCvYKomCMIlJhVCbCG6y2UwlPglrqzvKby+cT
 xeSFZ3xYmUcGCrggpj1G9ZkWRzpmo1FidVvnag8HKMXeCRxFtowcGwmtvhBU1Zcaki+iR+l
 VEB5dl65LTjvDieFS62Qg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ktpM4goEMlo=:HCEDHKz0y47oeD+69IDcQJ
 nAKvqIg7lu1bPOLRgbhhS8+TqTOBlN4Z4KwO0uaPaGz8CNXcJzT5fzBbgFZDNKLEEXtSlSWcD
 5q9a+YzHI2CaYfF31NZJ/ojBRouf7ChKTXuCvYbq8HCRSi/f9N6ZRp/2qpB3OC8c7DT5b4ac8
 SwntT3mVPWlDo6xvmZIwSCpLs1S5eUQFLNbleqtfg3tFw6sbYTPDfDmabHSm4w23XuikxIMIo
 Mw+unuB85DHqDUIsSuXLcq3+G4CDr2X9bewdvPZyILShsKJqqRr0tuc8gBFFGMb8JLJNVyIpp
 g2tFDF36RMDOsJwDyCck8+q4LVGpQ/Ir1EeX8JqWzs8TrF1ljPLXy6ammKU1vnRm2qfkh+uOE
 ucGPi5ZqjYqa6aR0HS/b54vCXXnVZnz68zOyDxmJ4C4CHZc0mGjMi2716R9buI8HH0UiK+cBU
 B3LTEY93R+8S8NJJOUz/akWtdwSzqKUdjxRy14LE/HQ5uiL9GKn2J4LwBge641aDMCY6cBh4t
 yruS8gbd/biJ3SyG1J2TheoEIzs+BUTGp0CPBMvGXkKqQrfINYYUwHGW5tH9ui/8SDLAiKYUD
 l2gSf3a1iy82oZ1Y0PwdOybJe9DbkSUqRCLS0WGbkerfyPIfqH2ZDAee5Aj+gBKEmkhJ9ikOl
 SC9IUwycUt3bML+s5FMQ42fBdOHokVKo2gbnSHD5AvUUsKpmxnq18Dicrl8vbmHV2PWpf8D2r
 M5NH7smrALPFhe1h3470riQa+o0aM1y05/V3uvHpvInAVt8pgAq80TWLlh4hf6d4Td1cSpqYa
 hq5VFS4yP4cEYjXFCEEVk3RHSrZT+UCp88WJ/qbn3BHs6Yb8SuC7K5Ox8ntu4/vMGzCArE+AA
 x3IAYV5WhTuO/UyIcr0eTsa1UCKMsdWFXUWN9Dpp4tO2WSTFIkAMCPD1wUnxsD7GWiL9G95HO
 qTR6MNK2a4rb1/9WhLnTqoijun7p/uzPJHKov1GrNtU1lgt5X1lQFZIeNZRGnpfeFo2ZFKjeI
 Vs/bOFBa+fwDTUviCFTmsCmzoziZLTVezpc32oMfhGkHbQ3rTJ7xYxXMaON4tfmDgiOZ39BLe
 owg11sWL4nSg7b0IIpqhIow0jZ5yQnYKLk9DNPeNqQcPqeZbAud3eDz/g==
Received-SPF: pass client-ip=212.227.15.18; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
2.35.3


