Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B629C315F3E
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 07:13:45 +0100 (CET)
Received: from localhost ([::1]:36004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9iky-0000Xm-Pw
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 01:13:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1l9ijr-00006Y-3n
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 01:12:35 -0500
Received: from mout.gmx.net ([212.227.15.18]:41827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1l9ijo-0005Tv-Vw
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 01:12:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1612937539;
 bh=oGaxMkvd6TgQttdAot/yX9hmRyLVoyyJBBE9lo45dIo=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=Uke9KV2yWJXk2gSi1q3m/YkDAD6W77pGjcRNcbpCAAD6IlLlgnuLpB6HMLGF+edA5
 5MwvECVIV3EEu8WbtDSbO23cjbQm6ckLNTdWBIJjCw2MWKx9ef8Bgjl76w7WBTK8S2
 JbLOW6El2CmVx4bLgor5s2IvaRw0Cj/Jaz2+yKLQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.186.119]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Ma24s-1lNu584BUa-00VxTZ; Wed, 10
 Feb 2021 07:12:19 +0100
Date: Wed, 10 Feb 2021 07:12:14 +0100
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Subject: [PATCH] linux-user: fix O_NONBLOCK in signalfd4() and eventfd2()
 syscalls
Message-ID: <20210210061214.GA221322@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:lT5K7oat5dL+ajZlxxuCTfMWl1KCtM0Oc/jJ9ke5YvYEW0ZHSib
 MbDgyAFGVhDhdYBQQlYGQ45Ku9Y39NoWFTfTetcPwjQJcOAxHsomYKTMj7z00jkj2imfvdM
 4KOL+56alu0mEt/2APAfA7jV7h46NyE4HD8fMklVSVwCxamMO0nRcC4/r1BQ4Z9NnmQmuU7
 5gLiw0kK2aLICiZsSJelA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xGL82bVn1uc=:ojSUZcXQLeIjrj7MoeFKHw
 htdzG+Y6x91SHObePTnpyvciBc+GNWfRHk6RHxvnt5cw/ceua2ti9jAC3IIyp8uG1nrA6V2n0
 qwTLKWx+cn0oSPilE8KinG9WanENCtW1+1RYp47VXiZTfQ0YJB8etiC5opD+LRzdCTtQ5zoQR
 aVUmSZ4Bc1EKpaE8+4mTjZAxW4vLHxsN+dHRL8BDVcx6IYEc6i9lHoJanRfkOaNULqbuxFBhN
 bMIdqjuEt5RCMs+7hXyM60EwMtdKr/e9B5gXhogT0NJG7gGqtmuee5kIBHBVEzryWwzQ8XubD
 U22+SxS+epmFMU8vTgWqxCZusJ431/qg6+nfWrSAFwE4Nu7b3vC+YfhZsIzv+H5CeGQDsm+b4
 c3ZqebsR0axWS3nITp8W0xM/oQqVsHieDZ8NueLJ/3gdaT1UZWRTzFcKE0XFEkuBhqfImN2+d
 XZBUM9gF2m0N1MejxPAtSmshRoDKnjjFiRNiOoqwKBtdShQy82/M433b+2reALlnC/IgJOeSV
 /UoLkQhDyKq9qm1fr0p0xA8msptNqXUX9sBljG/ALzUcTq7T74OmdfEjj6foXcT4K9ZQm8FXf
 eUt9+QQgvAxgX++9tl61s7b9ovcH4kZ8SYIa15kKtbJSV1evy/NxaUsD8+tAuZb0eogSwwHz2
 sJyIL8omrt2cS8HGU+moeY1s6ERGDAwdhcK69dmg2kLm4V7c20sFYBG/d658GoiiO7PDCWKJk
 XPLGod5g4FrcDrbQ4SDgBv50w1a88XZ9ceOPyXCQG/kqM+HkTAhfsFihl2rYVoYSlo+FwJO+4
 c1BJqLBnLQ51swnLYufgeQClscqBQxbozuorTPDLSaFmLglFs2RD9L+Ug/LWLyqLTmk+v7QVh
 Eeyv+9ZcT8XKRs9OjrvQ==
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.227.15.18; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: John David Anglin <dave.anglin@bell.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?iso-8859-15?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On the hppa target userspace binaries may call signalfd4() and
eventfd2() with an old TARGET_O_NONBLOCK value of 000200004 instead of
000200000 for the "mask" syscall parameter, in which case the current
emulation doesn't handle the translation to the native O_NONBLOCK value
correctly.

The 0x04 bit is not masked out before the new O_NONBLOCK bit is set and
as such when calling the native syscall errors out with EINVAL.

Fix this by introducing TARGET_O_NONBLOCK_MASK which is used to mask off
all possible bits. This define defaults to TARGET_O_NONBLOCK when not
defined otherwise, so for all other targets the implementation will
behave as before.

This patch needs to be applied on top of my previous two patches.

Bug was found and patch was verified by using qemu-hppa as debian buildd
server on x86_64.

Signed-off-by: Helge Deller <deller@gmx.de>

=2D--

diff --git a/linux-user/hppa/target_fcntl.h b/linux-user/hppa/target_fcntl=
.h
index 08e3a4fcb0..4eb0ec98e2 100644
=2D-- a/linux-user/hppa/target_fcntl.h
+++ b/linux-user/hppa/target_fcntl.h
@@ -9,6 +9,7 @@
 #define HPPA_TARGET_FCNTL_H

 #define TARGET_O_NONBLOCK    000200000
+#define TARGET_O_NONBLOCK_MASK 000200004 /* includes old HP-UX NDELAY fla=
g */
 #define TARGET_O_APPEND      000000010
 #define TARGET_O_CREAT       000000400 /* not fcntl */
 #define TARGET_O_EXCL        000002000 /* not fcntl */
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 27adee908e..3031aa342f 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -273,6 +273,11 @@ static type name (type1 arg1,type2 arg2,type3 arg3,ty=
pe4 arg4,type5 arg5,	\
 #define TARGET_NR__llseek TARGET_NR_llseek
 #endif

+/* some platforms need to mask more bits than just TARGET_O_NONBLOCK */
+#ifndef TARGET_O_NONBLOCK_MASK
+#define TARGET_O_NONBLOCK_MASK TARGET_O_NONBLOCK
+#endif
+
 #define __NR_sys_gettid __NR_gettid
 _syscall0(int, sys_gettid)

@@ -7719,7 +7724,7 @@ static abi_long do_signalfd4(int fd, abi_long mask, =
int flags)
     sigset_t host_mask;
     abi_long ret;

-    if (flags & ~(TARGET_O_NONBLOCK | TARGET_O_CLOEXEC)) {
+    if (flags & ~(TARGET_O_NONBLOCK_MASK | TARGET_O_CLOEXEC)) {
         return -TARGET_EINVAL;
     }
     if (!lock_user_struct(VERIFY_READ, target_mask, mask, 1)) {
@@ -12508,7 +12513,7 @@ static abi_long do_syscall1(void *cpu_env, int num=
, abi_long arg1,
 #if defined(TARGET_NR_eventfd2)
     case TARGET_NR_eventfd2:
     {
-        int host_flags =3D arg2 & (~(TARGET_O_NONBLOCK | TARGET_O_CLOEXEC=
));
+        int host_flags =3D arg2 & (~(TARGET_O_NONBLOCK_MASK | TARGET_O_CL=
OEXEC));
         if (arg2 & TARGET_O_NONBLOCK) {
             host_flags |=3D O_NONBLOCK;
         }

