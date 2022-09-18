Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C205BBF98
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 21:50:26 +0200 (CEST)
Received: from localhost ([::1]:33268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa0J7-0004OK-H1
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 15:50:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oa0Ew-00071f-Gw
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 15:46:13 -0400
Received: from mout.gmx.net ([212.227.17.22]:50815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oa0Es-0007bR-TP
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 15:46:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663530357;
 bh=cs05Q1ht9PiLq7agrRMMSzOgL2oo2VY1N/Ee55XqK88=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=MvarkniHp/JSqXTm1vD36rGbFSfvLyvEeUcifIYdsisDLp/YuuRL9JqbyF813p0gB
 4BaEqEaLzNWF05MvZw+2Syx1wTdmKLzkHZlPzgx8dXKI5lraxemiQPGeVO4CtBfk2O
 jGSBJiOAT7h+SRDgkT6+9mbqnnZEF3sUTLd3+6f8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.165.224]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXp9Y-1ooBYn3Mc8-00YBlD; Sun, 18
 Sep 2022 21:45:57 +0200
From: Helge Deller <deller@gmx.de>
To: Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: deller@gmx.de
Subject: [PATCH v3 09/12] linux-user: Add strace for clock_nanosleep()
Date: Sun, 18 Sep 2022 21:45:52 +0200
Message-Id: <20220918194555.83535-10-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220918194555.83535-1-deller@gmx.de>
References: <20220918194555.83535-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NbrCc9/Jqrsfm9GdvMnIS2c/t2cOsivm1a48RlYxp3uBTpv0OA/
 pZHZznkQb2R9SPGo3Es5C8tgdRZufcGEAMv+YGCqkjX9QDKGtc/Zq6WU8mzkUFB5zO1KZ4C
 ldvXc+oV1TdL4LimyLBMidCUiRHCq7sh0DK2gqQxWCyOT2+6nw9jOkbGTxesxNgwh30PEhr
 8XOX1iTBF1YnhGa5hntRA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nsIRp/DUyCg=:Wf9n62eWLOjzCzzEoXqhjj
 YMHprTkDNX62iOz25SRu+5BZvuOnmNhhlyDQXqo6bvLp3CpkD8yhReAeMtGrVnHt8t+VhdgL0
 xTeOm9M9t0ypyIUrWih/Fu74vA2e6x8jlu7TlDauG2jgvY1F+MXdocXtDbs9rQLsPI/TJzVSA
 Lu+6igoiaagS7g3a2qNRK6+RCgoShLO0/1rg/Y73zBwMqiZBWUUASKJmffNILRUiKmllL3Z0d
 ZrMdyn8zfDRIWiTlfw+CHkVvFJonaG/RaK2HRD6kN/qKop3HdP8wDEinvzrdxJ2Civw3KbD27
 pKva+fAropUEaDtTKfyTya0NSlzvko1uLo4pnZvVZRVKYtHlQ0PP64vYyFYml+p+WM22ndovY
 5scNxmj7N9Q8hMLU+gwRQLz80jfAThJn/iBdzudw4S/diDuSYXAxKOL3bPTkF3qPZrQh5FMh9
 cfHI1lFzMLcmHU9Ig90shOpwxQ5uDubSeg/ZKz6UYaYEfM5s9/LUjk4by98uGN9bzZRzc/4/y
 PWhGYPnMJfjSwhwBEtELrgsnljC3N5IbYBju06RFBM/UHH8qfpBwRwxmpZUY1MQ/FaKQmvye3
 gPPOr3j4l91c4MAJa0h5SBdfzQUeqtbKDdHYc1FIU6ZIc5nK+OykjqPSguF3MbxooVp+qXe6u
 cPETSaemjTyOUtOBALccU/twGYqTTWRR+qDv3j1vpboOGKgfdOxfZA5K0LRaKNA7L6D/MLkUK
 EecyZjJcMTL9wfDnlG0eF/Bey/JNMi4M7akOfYIY4MWJFHR/SDlAv5P79uwAFZdZF6Kffmh8N
 SNT0zIEmV4PfoQGdQostC8Nir3bM+29EoWq+C9a2OCO/kyvPFlbF5bY07DgM1Vvbb6ZKoHfQt
 1uXVgzskoVcXxhFDLPRto0F/h5IuRX1Okvd7UIK4V5lcESce7tuKRp+HTLAA/kEaAwIF10lg+
 N3NJisI4zHQDbe9DWO9TLQ3WoTJleq47pGIrTZYnSivSGJnllcHC0JTcwxb6MTxD7nq7tHSmA
 gZmnl/65Ha0EXKqBguAf+hE+LFHC+15qBEyZ4iLicgBRiSvFn94hTStxL39wwE19G370HnvzE
 5WpEIzlQzD3cfqoASsbi4duyxh1thLmgis0DAAlfBMpkqhwaS2iMddKFVi3W8laD+WpHxP1P3
 wbBs1i7U1qqzNuFut+pRJ9Dn29
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
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

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/strace.c    | 15 +++++++++++++++
 linux-user/strace.list |  3 ++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 2f539845bb..6f818212d5 100644
=2D-- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -3567,6 +3567,21 @@ print_unshare(CPUArchState *cpu_env, const struct s=
yscallname *name,
 }
 #endif

+#ifdef TARGET_NR_clock_nanosleep
+static void
+print_clock_nanosleep(CPUArchState *cpu_env, const struct syscallname *na=
me,
+                abi_long arg0, abi_long arg1, abi_long arg2,
+                abi_long arg3, abi_long arg4, abi_long arg5)
+{
+    print_syscall_prologue(name);
+    print_enums(clockids, arg0, 0);
+    print_raw_param("%d", arg1, 0);
+    print_timespec(arg2, 0);
+    print_timespec(arg3, 1);
+    print_syscall_epilogue(name);
+}
+#endif
+
 #ifdef TARGET_NR_utime
 static void
 print_utime(CPUArchState *cpu_env, const struct syscallname *name,
diff --git a/linux-user/strace.list b/linux-user/strace.list
index 4d8b7f6a5e..215d971b2a 100644
=2D-- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -91,7 +91,8 @@
                            print_syscall_ret_clock_gettime },
 #endif
 #ifdef TARGET_NR_clock_nanosleep
-{ TARGET_NR_clock_nanosleep, "clock_nanosleep" , NULL, NULL, NULL },
+{ TARGET_NR_clock_nanosleep, "clock_nanosleep" , NULL, print_clock_nanosl=
eep,
+                            NULL },
 #endif
 #ifdef TARGET_NR_clock_settime
 { TARGET_NR_clock_settime, "clock_settime" , NULL, print_clock_settime, N=
ULL },
=2D-
2.37.3


