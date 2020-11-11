Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 452C12AFAA7
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 22:42:42 +0100 (CET)
Received: from localhost ([::1]:38368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcxt1-0002SK-Q6
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 16:42:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kcxrC-0000sc-K9
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 16:40:46 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:52581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kcxr8-00069R-3E
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 16:40:45 -0500
Received: from localhost.localdomain ([82.252.148.166]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N8nnU-1kGVKC0TdG-015o5L; Wed, 11 Nov 2020 22:40:38 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] linux-user: Prevent crash in epoll_ctl
Date: Wed, 11 Nov 2020 22:40:33 +0100
Message-Id: <20201111214033.432676-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111214033.432676-1-laurent@vivier.eu>
References: <20201111214033.432676-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jglzoGbgvW1Letey5uAHnyjWsE/7vIJCxP5BpAxta2OY4hzK/zV
 09W7XhnH94dZC4mHy0qxWcljzxuKMSFqbxvPRQsM8R1mI1+r+AFVNckRUyiS85rpYAUtB3L
 AHdNm6CPnCLvMUo6LklwEFWsmfj7Gr/mx21JhaJgpAPLfg8qc/CwCSEe0K+CX+7d0s611bA
 /Xj0avqnInA9nIpL75ENw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:998k9TTgBHI=:iiT6eq+gEJw7b/B7rUKSBp
 vGBCRslTPta62rP6WZzoHJJQsG5PRcatK7nc4B+XAazEZIy+0uA3wPe+mIoAMaq4OJxGf31l1
 rjSpgf3AVXY3jayv+ljv+ncTTW9wrZToo6uIyhZIy+PBJusMcH4wmlU25jjj1sJEUd7ifFEUj
 hzTZxNoYghu0UopURJcHKR3MKpUA6GmQWIriv2S16Tun20aJ3Ry/welkKLCHXZE+FG0qWfISy
 ryjkHT1bP1uYhjObjOYeLZWbXYQS5PXq8n4cYgRkuaTTtb5bxMBjbW0qit+KSf4Zg8Zmq/ecu
 3a8tSCnWATF6eSyyIfJ8yFoQJpeRX2Xu5nR2gHL+DyUBZxV/Ry7XEi8W+bPphb0F2me5vFHyF
 GywXw2HHSSGdEbiY1f/mn9Jhf4spTHF/mPXB6CbhAQAEsyvEhSZxeogMM2ab5oSvrkHfdmO4/
 7zpUe40JSA==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 16:40:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: LemonBoy <thatlemon@gmail.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: LemonBoy <thatlemon@gmail.com>

From 894bb5172705e46a3a04c93b4962c0f0cafee814 Mon Sep 17 00:00:00 2001
From: Giuseppe Musacchio <thatlemon@gmail.com>
Date: Fri, 17 Apr 2020 17:25:07 +0200
Subject: [PATCH] linux-user: Prevent crash in epoll_ctl

The `event` parameter is ignored by the kernel if `op` is EPOLL_CTL_DEL,
do the same and avoid returning EFAULT if garbage is passed instead of a
valid pointer.

Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <a244fa67-dace-abdb-995a-3198bd80fee8@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 3160a9ba06bd..27adee908ebc 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -12590,17 +12590,25 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         struct epoll_event ep;
         struct epoll_event *epp = 0;
         if (arg4) {
-            struct target_epoll_event *target_ep;
-            if (!lock_user_struct(VERIFY_READ, target_ep, arg4, 1)) {
-                return -TARGET_EFAULT;
+            if (arg2 != EPOLL_CTL_DEL) {
+                struct target_epoll_event *target_ep;
+                if (!lock_user_struct(VERIFY_READ, target_ep, arg4, 1)) {
+                    return -TARGET_EFAULT;
+                }
+                ep.events = tswap32(target_ep->events);
+                /*
+                 * The epoll_data_t union is just opaque data to the kernel,
+                 * so we transfer all 64 bits across and need not worry what
+                 * actual data type it is.
+                 */
+                ep.data.u64 = tswap64(target_ep->data.u64);
+                unlock_user_struct(target_ep, arg4, 0);
             }
-            ep.events = tswap32(target_ep->events);
-            /* The epoll_data_t union is just opaque data to the kernel,
-             * so we transfer all 64 bits across and need not worry what
-             * actual data type it is.
+            /*
+             * before kernel 2.6.9, EPOLL_CTL_DEL operation required a
+             * non-null pointer, even though this argument is ignored.
+             *
              */
-            ep.data.u64 = tswap64(target_ep->data.u64);
-            unlock_user_struct(target_ep, arg4, 0);
             epp = &ep;
         }
         return get_errno(epoll_ctl(arg1, arg2, arg3, epp));
-- 
2.28.0


