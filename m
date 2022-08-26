Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B675A2990
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:33:45 +0200 (CEST)
Received: from localhost ([::1]:35010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRaP2-0004IF-AM
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:33:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oRaAl-0000Zr-Ub
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:18:59 -0400
Received: from mout.gmx.net ([212.227.15.15]:45357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oRaAj-00054q-Ru
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:18:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1661523534;
 bh=aJsnrj97Y1sQFl5KVvkfVzLschcSZUtzNhYQejbgZog=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=R8AVgAHEtJrI49GMFwRBMHcXj8X0IdNcVvODU+CNP8fRXxuffl4wSezQdDhcrBs82
 LrV61jTM0TbMZ2IbfGIp0w/ZsR//gfz4FDiAVOi/0etlzfevK9XreU+e+j6Mtv6oYr
 ZYfOWQZV7OhJmt0BMhvDhB90Y6IQov6qQTZYODXU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.171.190]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N79yQ-1pUIHi25GO-017XOo; Fri, 26
 Aug 2022 16:18:54 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 03/13] linux-user: Add faccessat2() syscall
Date: Fri, 26 Aug 2022 16:18:43 +0200
Message-Id: <20220826141853.419564-4-deller@gmx.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220826141853.419564-1-deller@gmx.de>
References: <20220826141853.419564-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SxsNIlt0oBLPDgPJN4GXHui7fMw0Jsgn5Yejy9ta1tAqFgGBdsg
 0uGm1L3edUbdFMgXtzbx+0U7l85qqejR7cQMLtu4F8oTPAv1UGnlw+o14uUfl8j8Ewo1IwZ
 P1/TErofiCycTfzQaAOwR3ezC1Ssauv7Vw4x9ycFQ0AIHsVR0+49SrcFKrcq9EK6kGZKEyU
 84lWoF33iRYHvMmDCNOIQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uPQpqIAp+mg=:LDRgOHdjFlfMjMORNkwVh9
 qitNbPMwRHa2BBQ0bLFjCTGto9tHUdR40VfA6XJPdCSv8BVhaU98W9c83geTI+c1nmbcJKrDy
 WOrNQGmaYQjaYRFtSa8exu3NZ6+rA5zPfmqDySR/W6Buj9ENgWo3O1/hnPsNhmvUx/T5aAO+M
 mv2lM9WfSZdsxC9sGjru7ArgjQ05Us9hznPapTuXZwlMTI8aUAKbHbbU8fs1HVbtPmDEclnQn
 rNMAu25TUsklKsX+PDMFKt/1caRyTi5SiKo9RKC0ISi6TDrMDs7SAMYSAI1cR5M0TL2W9xaBv
 YNwol4E84B0f0jD5NPY6fBOxEgfAoNUgGjmxfl9gRpKKXOjKQ79mW1hq9p1LyKrFn1HtufTM6
 5jPZtv9v5OWw160HIzLqMAvkXisshkxqYuwUu5dPWasEdE630BGcf0TrxqGsYkN3+IiaO5U8R
 LZC9zLWQ3ihj2fMZMyCfi/o612mOb3IM/DQEMxawmHiP66BR1AaKQ0D7wNk/CSu8yuz0F8wcl
 VyzwT0haktUZ3m16V0hC7uJAF+wyUnsaXEpcyZAVkrseVkVJklAp4m5L+kFN9BShi4gA0iQi3
 ek98o1ox6tSMtQeIZ+EphvRx9kMI/X7u8pWM7W5dNI7OrJju79yXUhPYpr3P+To2uHxapVT45
 26VHWylV9x52e75v++6NM8jweW9J97JvwULywaLRorii3Sw1XVD9y6nKbWOtBKT7yLYVtRcd9
 moYB701FcbbfSG6QPb1vMV/MfnyUilJ3YQREeLgxqawNdyQg4VBSgF+7hPFtGIjrOirW4tcXV
 OGZ63m96D0pC9P0c8YkayrBRylqiOkooZfyTy1OtV0U+7/iFbiNEg9GQ1lNPxnTFTgncYHox0
 cfdZSu6vfLRJRtLiuWaRRKW2owvr7Aa+vBk+5eZxFHFxJODtchNWTf7guTze/IDGrYldT0MLt
 MBBNBmwlAn/sIT/K0WasBv/GDUDPjU3Z28K+g/RsLjEyrl2rYk+l+jjmVnNjY3YfDR2pUODI1
 26o536r/qKoO70tY4mf2LSdrM5p8EcrS8UtKIO7IW/eSyNZEcLh8//8kMwwJTuzO+ugV7KApJ
 AC/tNes13TjAYugE8yVlO2XTJDkA9mOwOWfww59eB5jRqHKNE9pMCjmnw==
Received-SPF: pass client-ip=212.227.15.15; envelope-from=deller@gmx.de;
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

Add implementation and strace output for faccessat2().

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/strace.c    |  2 +-
 linux-user/strace.list |  3 +++
 linux-user/syscall.c   | 12 ++++++++++++
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 27309f1106..e8c63aa4c2 100644
=2D-- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -1962,7 +1962,7 @@ print_execv(CPUArchState *cpu_env, const struct sysc=
allname *name,
 }
 #endif

-#ifdef TARGET_NR_faccessat
+#if defined(TARGET_NR_faccessat) || defined(TARGET_NR_faccessat2)
 static void
 print_faccessat(CPUArchState *cpu_env, const struct syscallname *name,
                 abi_long arg0, abi_long arg1, abi_long arg2,
diff --git a/linux-user/strace.list b/linux-user/strace.list
index a78cdf3cdf..6e88da7fad 100644
=2D-- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -177,6 +177,9 @@
 #ifdef TARGET_NR_faccessat
 { TARGET_NR_faccessat, "faccessat" , NULL, print_faccessat, NULL },
 #endif
+#ifdef TARGET_NR_faccessat2
+{ TARGET_NR_faccessat2, "faccessat2" , NULL, print_faccessat, NULL },
+#endif
 #ifdef TARGET_NR_fadvise64
 { TARGET_NR_fadvise64, "fadvise64" , NULL, NULL, NULL },
 #endif
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f409121202..f51c4fbabd 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -399,6 +399,9 @@ _syscall3(int, ioprio_set, int, which, int, who, int, =
ioprio)
 #if defined(TARGET_NR_getrandom) && defined(__NR_getrandom)
 _syscall3(int, getrandom, void *, buf, size_t, buflen, unsigned int, flag=
s)
 #endif
+#if defined(TARGET_NR_faccessat2) && defined(__NR_faccessat2)
+_syscall4(int, faccessat2, int, dirfd, char *, pathname, int, mode, int, =
flags)
+#endif

 #if defined(TARGET_NR_kcmp) && defined(__NR_kcmp)
 _syscall5(int, kcmp, pid_t, pid1, pid_t, pid2, int, type,
@@ -9098,6 +9101,15 @@ static abi_long do_syscall1(CPUArchState *cpu_env, =
int num, abi_long arg1,
         unlock_user(p, arg2, 0);
         return ret;
 #endif
+#if defined(TARGET_NR_faccessat2) && defined(__NR_faccessat2)
+    case TARGET_NR_faccessat2:
+        if (!(p =3D lock_user_string(arg2))) {
+            return -TARGET_EFAULT;
+        }
+        ret =3D get_errno(faccessat2(arg1, p, arg3, arg4));
+        unlock_user(p, arg2, 0);
+        return ret;
+#endif
 #ifdef TARGET_NR_nice /* not on alpha */
     case TARGET_NR_nice:
         return get_errno(nice(arg1));
=2D-
2.37.1


