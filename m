Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B84383CA3
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:46:26 +0200 (CEST)
Received: from localhost ([::1]:49276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiG1-0002T9-NA
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:46:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlf-0006j2-Hd
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:03 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:35847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlS-0004Vt-Tj
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:03 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mq1GE-1l4Mjs3kfa-00n8mB; Mon, 17
 May 2021 20:14:47 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 39/59] linux-user/s390x: Use tswap_sigset in setup_rt_frame
Date: Mon, 17 May 2021 20:14:04 +0200
Message-Id: <20210517181424.8093-40-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:sDr+qBcJOWwJSUCZXGnJ7PntxOhThJtP/1INkQMxcVI61kaqbBN
 zNVl8XkqhtLYtz0TGJLgR8LFbbDiWX1Gx8/J+MDg+RCXSvxqCMmnPT7WNoT2C+pYAyjKmn1
 Y6boePnV4XiLuqz2qrgG/E7FlIbN/AoOTdU7hM7MC9OmRUs7/Pr4GIO1vvwYrPHZAC8Nc2T
 C476RZ5Hnq1LT+ZM3rK8A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QSpmc/rBGx4=:Vzl/XqzUllJ58RV5aFkSvh
 5QyeI1WYUS6U2A5+uDF6UPN84079ZzqQqu5dOu3cbTY9n67x4ydMIz6yRsrnhg5PiqkJXH+Ab
 idTc7eFF3f6MsS6ht/qoQG1L5jdhla+J4Mjli8oY0WX02iJTGVs0XhlQHd74adW2Puzn0sexG
 lYqAmQf7sSeVQKju1UCeBqYAp6U6Vera1iLb2XRiu+nsyf/RvzjYQPWyKbsRL0EuqyiPNvHc4
 NlV3jUQdsW0D2Fxlri1bX9kiXRukBBHWFPjN5akHXRTpT2DPZrQbUKpQmrhFVmeWfi5CGRxO0
 UvYFFnAVtjyQ8MOfav2XWvLBC58cgkb7J11yh/LuG0OxLzjKPLLl8EShkEWQBwcU8G/fzGxwk
 rxvkvhmfXB4U/MeXXpLv8kB3RAYnkYM6euJ22WoU29M3o5I8WVQl1anPjsHRdId7GXm5jPaik
 YdY7z51xxD4Rj76V2ZlUXIQkEee9stGI4KDiiD8A2gkqXnPCRri7ozFkBVXyRQrfD/pSsiXa9
 m1Lg4wUknZpq6I7r/6Z+3Q=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210428193408.233706-8-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/s390x/signal.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index f8515dd3329b..4dde55d4d518 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -182,7 +182,6 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
                     target_siginfo_t *info,
                     target_sigset_t *set, CPUS390XState *env)
 {
-    int i;
     rt_sigframe *frame;
     abi_ulong frame_addr;
 
@@ -199,10 +198,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     __put_user((abi_ulong)0, (abi_ulong *)&frame->uc.tuc_link);
     target_save_altstack(&frame->uc.tuc_stack, env);
     save_sigregs(env, &frame->uc.tuc_mcontext);
-    for (i = 0; i < TARGET_NSIG_WORDS; i++) {
-        __put_user((abi_ulong)set->sig[i],
-                   (abi_ulong *)&frame->uc.tuc_sigmask.sig[i]);
-    }
+    tswap_sigset(&frame->uc.tuc_sigmask, set);
 
     /* Set up to return from userspace.  If provided, use a stub
        already in userspace.  */
-- 
2.31.1


