Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3655EBEE9
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 11:48:03 +0200 (CEST)
Received: from localhost ([::1]:38838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od7C6-0003Q7-DR
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 05:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1od70C-0005CQ-8W
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:35:44 -0400
Received: from mout.gmx.net ([212.227.15.18]:57697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1od708-0004h8-Ev
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:35:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664271338;
 bh=Cl47C5Qldw93YItIQaWYDU4MT1k4YlYtXwEu8JJ7BoI=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=A+Groq6m+8nkzy1ZfvJ4Zw2lF04ApBdnLNtZRpLkQv+KkM6QQR52KNykUpcJ0NN+7
 WYfRwd0n/UPfXqxmEBFKyMEFzrfXuYsRFjlKedu/qBJC01DByrEEdfDmuLxmeBpVYL
 OZs/sQQHi5F55vgkLMvA8cya/7iJNrvUPNiGy9QQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.138.255]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mj8qd-1p9AR52U4r-00f9wS; Tue, 27
 Sep 2022 11:35:38 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] linux-user: Add close_range() syscall
Date: Tue, 27 Sep 2022 11:35:37 +0200
Message-Id: <20220927093538.8954-1-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XHs4cFJmlchEtq0mQ5n8UyKQ6MeiZ7214m2qCbLMf3XR1ObFwag
 vin9DW3YF1OyWTJrcPhfJS/XvLfEPY/DVilWi5XaCk1VId8bu8Bket+opAZjH7hDTL/j8IQ
 Zs+7N6hq02ppFMWbmc5dYgdXeoVILxMJeHYgHEdZ42pSxENp0xOWJ70dK289I5acbi+qgvX
 XRQ+BYLBRR/O6Y34x50tw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+3ALrpZ08Kg=:Dd5y0gLEgTNDAmVQNVmbi3
 6uCU2aCJGieae1eikZP3Ijdof9QidY1OxBUin9ZZkD0R1MqgJ5ySP+71j+yFObEDacw3UYkHF
 rrQhtIWxyF8C5nsPgPH3gpHyPmlMf9d6SLqhf/GuLf8ajHF2LdTsTCFXqfTzGBK9Qn4gcb36/
 zSxN5AQzLd1vvBqrLBvR6SrXhfV5xri/0CKCH59TJSiVziSIdAI2ngTr0DxWZh64+AbnI5RHb
 wDZ4P36xr1rYiivaye3wZsu+TWPW1FWd8Wwfl5n5lovoFyhytckY/K8qa/0FR/tDAGFPDhWeZ
 jRmJmRbaX9aGmW9/2Rxrrlyw9wlzd/cU5H+dYMhwYOKsXtNY9FStgGyzSiI/LqZBO+uYRsUdx
 VF76zdR1GRrFs/C9C1KcD4n+zkriZF3kUE94VRR0kiOim8y3hfCBhkLrjAt+tnWMeEUtH8kL+
 EubtTxYswhyHdHaeVHTZ79yPc3BH4JXoLteJ5oJY4vK1mCEkawyetvzjJ4uGmopBeB0AH/JRs
 SKckZN06p8U2CJWDJRqOnJAl0DFXNcuZiuJAyq+T4XpLYuORHcndZfq1ZPgF6y9epTwp/dWO+
 3iNVLUi/oJuZzlyILZtFs4jtJXkOtVFkbVwMAS6r/ii5SW06iMZ4qJxGhsw7A6yczMHZgSH/3
 hsBmzT3qorBryjuCa3CbwjsWdVhW96oktk7b4RiGpwMayRJpEJoxm9NEhCG2e+BwkD0tgXCrG
 e9O4sGRp1tTDBEWJdg29tUaOgN78/YVtt5HneMrJaB0PAmumxtiXdmaHS5zJ5I/Ohl1ZD3WhL
 WiM0Vi81C9hrc/2bBZGd46x3MUJd93vi/5mDpHNDKlQsThr08SAGyfh90R3dSR0IVLTJYTZIb
 OcxzZQ/NsOEKcP+e8qlhrHvrseWw8il3eaUltd/N3IcrvXdyUtEa54SmxtbcaherrxxgEMwlS
 216Y3NT/p3X7vMIsXmCp6yjQDASwrubutuABxTWR3gpbJtq4CN9D/QJRy3xGa517WhLS2rKar
 Uok70rZz1/qhdaqt/mC6S0jgjaFdV5haCAaGRfT6lNsYRFtVxpTXiCciHMcrf3KoNnKV1q2Hn
 EYgoNPp2aZTr/Y4/USr7pQbZvHxEVikk7OFaTWS6XUgcNPH29bb/ONAXpD0VjbfXzq/J8dBZk
 qIr0a1iq7OjkiWHHk6xa1S+d8P
Received-SPF: pass client-ip=212.227.15.18; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 linux-user/strace.list |  3 +++
 linux-user/syscall.c   | 19 +++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/linux-user/strace.list b/linux-user/strace.list
index 2fa74b7203..31a2ccd76d 100644
=2D-- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -103,6 +103,9 @@
 #ifdef TARGET_NR_close
 { TARGET_NR_close, "close" , "%s(%d)", NULL, NULL },
 #endif
+#ifdef TARGET_NR_close_range
+{ TARGET_NR_close_range, "close_range" , "%s(%u,%u,%u)", NULL, NULL },
+#endif
 #ifdef TARGET_NR_connect
 { TARGET_NR_connect, "connect" , "%s(%d,%#x,%d)", NULL, NULL },
 #endif
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 6219ef36c9..8e0bdd7a30 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -339,6 +339,13 @@ _syscall3(int,sys_syslog,int,type,char*,bufp,int,len)
 #ifdef __NR_exit_group
 _syscall1(int,exit_group,int,error_code)
 #endif
+#if defined(__NR_close_range) && defined(TARGET_NR_close_range)
+#define __NR_sys_close_range __NR_close_range
+_syscall3(int,sys_close_range,int,first,int,last,int,flags)
+#ifndef CLOSE_RANGE_CLOEXEC
+#define CLOSE_RANGE_CLOEXEC     (1U << 2)
+#endif
+#endif
 #if defined(__NR_futex)
 _syscall6(int,sys_futex,int *,uaddr,int,op,int,val,
           const struct timespec *,timeout,int *,uaddr2,int,val3)
@@ -8756,6 +8763,18 @@ static abi_long do_syscall1(CPUArchState *cpu_env, =
int num, abi_long arg1,
     case TARGET_NR_close:
         fd_trans_unregister(arg1);
         return get_errno(close(arg1));
+#if defined(__NR_close_range) && defined(TARGET_NR_close_range)
+    case TARGET_NR_close_range:
+        if (!(arg3 & CLOSE_RANGE_CLOEXEC)) {
+            abi_long fd;
+            abi_long maxfd =3D (arg2 =3D=3D (abi_long)-1) ? target_fd_max=
 : arg2;
+
+            for (fd =3D arg1; fd <=3D maxfd; fd++) {
+                fd_trans_unregister(fd);
+            }
+        }
+        return get_errno(sys_close_range(arg1, arg2, arg3));
+#endif

     case TARGET_NR_brk:
         return do_brk(arg1);
=2D-
2.37.3


