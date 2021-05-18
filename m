Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA8F3871B0
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 08:16:24 +0200 (CEST)
Received: from localhost ([::1]:36480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lit1j-00067K-SH
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 02:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKr-0007lq-9s
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:05 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:46687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKn-0007A0-1E
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:32:05 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MFsAJ-1lgyvu1Kf9-00HNgn; Tue, 18
 May 2021 07:31:53 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 39/59] linux-user/s390x: Use tswap_sigset in setup_rt_frame
Date: Tue, 18 May 2021 07:31:11 +0200
Message-Id: <20210518053131.87212-40-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zpPewPl+HBqydJb4GvfK6LiPAO4n5oGHGO1VTIeuRreQfx2m6ez
 ILg8fhUrHNhobN2itW5TC3euW0f19tKet4s7R5ZkNg6hLuGtCTHqwSQh0PP37rO4PvLCuYQ
 rEVr6jlqiHn4igMF7OrAyluoH8ot5mi9ZIhZ7C+RBCNNOrkHxFhKbWcXYtmE7Q65gfsBFHc
 c7CgED8RQqZFzC2IbADCQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:r8mDENy0fIM=:gHse5YwmJcatcmGwmlJYRm
 hXBbOENqlHeKorRgZCDDyrlpn4AcIdSTus8vokhLSMy2HME130UAShNFY1iAVOxQ2Lk5IGJkN
 khJytdrpTCutX34kPZnBKIZRm2+D+KphhOhePnuce87mXlsix4DkKqAuOWejWo6GH0Yo2YQMo
 KeruxfR4iLpWhLrgtzfW7r6OefMQhAeivf9Q5s4gu6oAVAFQHOXKgDHMuHcxZAWbKzdm/ewT2
 90YpMSmsvCB+NmFE29XTjNlfmbRttD8UnMQ8IzKgJt4qVOMR21is8ddC0H7Of/IY2evSN2cED
 MQ/CPVAWkN2foyaL5TU9txOAUHIJlErv56YD6+E0RR5rbz5lnl01sO5/c+ZpOFZrgt5CX4FIu
 EbIfKYPQbThvnU+Kr9qgcFxwTCvK+6vUE5g3j++Sd6PlaxN4OllSgYYa5eomJQIl8GAzCxrqn
 0ZgcBbdodW7AnZxTKqdwVN7OJxrL3bgUtcjR+OFoR+ZAbu6FqHBhIdnTbdIIw4tWhv1r9jCA1
 zJObgi+GR53GZTG4yDZbo0=
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


