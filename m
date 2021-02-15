Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D801B31B9C9
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:52:30 +0100 (CET)
Received: from localhost ([::1]:33448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBdMb-0001hm-S4
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:52:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lBdFr-00041p-Ao
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:45:31 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:41773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lBdFo-0000ft-Ip
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:45:31 -0500
Received: from localhost.localdomain ([82.252.134.158]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MxUjv-1m4ytw3ERl-00xtWD; Mon, 15 Feb 2021 13:45:25 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 06/13] linux-user: fix O_NONBLOCK in signalfd4() and eventfd2()
 syscalls
Date: Mon, 15 Feb 2021 13:45:12 +0100
Message-Id: <20210215124519.720265-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215124519.720265-1-laurent@vivier.eu>
References: <20210215124519.720265-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:R8W9g1c7SMwiFb4bOtiGk8DvV5+1OoW1LchfPEqW66n9LoNhatI
 sh91SDECtrQAcExHxheAkOTaLqYaif0jY4niywwrSwo2s3ydM4wspMfIY70HMYk/Wsq4G/T
 Fvv8GhJzsTCsZRXxLwWfTt2kqylT+CFPg7bfSrhOnI6dQWyL+XHsyU4kL1WiT/QXzdig4HZ
 7Z16H9Eku92sjYse8RkoQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Egw1e/QQ/YQ=:q6p1mLgiaQmxu+SwAbNFET
 yyLsAY1q3sCNjvgG4BAVQTKc7qzq7yiO1IpVk57W17OrxG3eZ87tK5wrLpBASCaAjIOMJUj0i
 PmYYPmT1DhejOQAl5nEih1xAQBWwcQudxBcV6MSbJchsJcoZsdySUW/qcqN2xYMN7d6fkdPFY
 XgzUmteB9KNsOa6zvVI2twFcbMjdgucKj1J3eOhLnTKZwkarGUhuFyrpN/rmOuY2ZC0FIVpl4
 M8QbN8uisYlrEeiAIStkPpIW8BY9h09kYwiJDOtqi9AQ9VBaeEy/1EQdGjUdSKHmE7uuLEhHi
 G7GaJCPgB6RKbjBKhlqY5f3O08rNonh375+Xyh4KyRY4wn56Wcj2zwzuOwxZacN8UkApGA1b2
 Aj3SPh2k8mHDViC7QSMrLPiYVLtkTuO4o9H9Eg+Ng30kimjLv2FBmWdOTVuGm
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Helge Deller <deller@gmx.de>

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
Reviewed-by: Laurent Vivier <laurent@vivier.eu>

Message-Id: <20210210061214.GA221322@ls3530.fritz.box>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/hppa/target_fcntl.h | 1 +
 linux-user/syscall.c           | 9 +++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/linux-user/hppa/target_fcntl.h b/linux-user/hppa/target_fcntl.h
index 08e3a4fcb0b7..4eb0ec98e259 100644
--- a/linux-user/hppa/target_fcntl.h
+++ b/linux-user/hppa/target_fcntl.h
@@ -9,6 +9,7 @@
 #define HPPA_TARGET_FCNTL_H
 
 #define TARGET_O_NONBLOCK    000200000
+#define TARGET_O_NONBLOCK_MASK 000200004 /* includes old HP-UX NDELAY flag */
 #define TARGET_O_APPEND      000000010
 #define TARGET_O_CREAT       000000400 /* not fcntl */
 #define TARGET_O_EXCL        000002000 /* not fcntl */
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 34760779c8ec..dcb4009e2f17 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -277,6 +277,11 @@ static type name (type1 arg1,type2 arg2,type3 arg3,type4 arg4,type5 arg5,	\
 #define TARGET_NR__llseek TARGET_NR_llseek
 #endif
 
+/* some platforms need to mask more bits than just TARGET_O_NONBLOCK */
+#ifndef TARGET_O_NONBLOCK_MASK
+#define TARGET_O_NONBLOCK_MASK TARGET_O_NONBLOCK
+#endif
+
 #define __NR_sys_gettid __NR_gettid
 _syscall0(int, sys_gettid)
 
@@ -7777,7 +7782,7 @@ static abi_long do_signalfd4(int fd, abi_long mask, int flags)
     sigset_t host_mask;
     abi_long ret;
 
-    if (flags & ~(TARGET_O_NONBLOCK | TARGET_O_CLOEXEC)) {
+    if (flags & ~(TARGET_O_NONBLOCK_MASK | TARGET_O_CLOEXEC)) {
         return -TARGET_EINVAL;
     }
     if (!lock_user_struct(VERIFY_READ, target_mask, mask, 1)) {
@@ -12566,7 +12571,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
 #if defined(TARGET_NR_eventfd2)
     case TARGET_NR_eventfd2:
     {
-        int host_flags = arg2 & (~(TARGET_O_NONBLOCK | TARGET_O_CLOEXEC));
+        int host_flags = arg2 & (~(TARGET_O_NONBLOCK_MASK | TARGET_O_CLOEXEC));
         if (arg2 & TARGET_O_NONBLOCK) {
             host_flags |= O_NONBLOCK;
         }
-- 
2.29.2


