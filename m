Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11055383C1C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:18:53 +0200 (CEST)
Received: from localhost ([::1]:56438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lihpM-0000eP-3a
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:18:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlF-0005ua-Q1
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:37 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:60007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihl9-0004Kp-Ed
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:37 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MhlXE-1lDkf63wBM-00dr7n; Mon, 17
 May 2021 20:14:29 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 06/59] linux-user/arm: Simplify accumulating and raising fpa11
 exceptions
Date: Mon, 17 May 2021 20:13:31 +0200
Message-Id: <20210517181424.8093-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0YAoTbXnbC6iGb9edyFhAr5Hobsf0tJgXBmf2naxTYBYYwtM0CS
 JATKoO2dDef5GGuf/MBZrxOQf9ZK3UEefuUXJwCfjRFPaQfIbUrMn5lqWoee/TUkQ8uXj4E
 ABzJJZEMiqffNtmFEies1eJUgrN6ZkuCjZeIO0lX8kjtdqjQDGZyC9pssxyHXDAZwgBCTaH
 yvDsbUy8V20d97uHydn1g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6eAcCOPt7PA=:y9JF4kPYGHTljrQvgNRABp
 zoUNNfZPoJDQP7xO4Cj2mHF5KyVfoCsHhnTQMYsUNC3t7izGGFaGZ2Ox7RN/7EynUFP8c2HdT
 mI+g0DTVbgt/c+IEQneAqN8Tya8C9JZf/ZY4CwuHrX0IcHIQUtfnGD2YpbTkdvSUXP9gNEmeM
 w5vm9cTNMLVlt6vzsZGqJZ2Q958av34RqihseY3F8rPIYxWlDCINLlONWs7/ype0WVvHvWTRc
 YUyI/jPQvWdoQZSi5hpt9HYX/7SkTzlevVM3puEI/Inhp6hSAl4O5f0XIUIaJ9NgAyH4nH1Xb
 AKzqAmVs6N2Gk+SbnvVQIgTiOxKQaLMs/nMI+205fOXa4XMxGsJa4bb64e2kFUXzNKZ8HbJeR
 pnWDkJYOIyiei7egHGwy3UmrbNszVJAX+p/GrfXcPu4A2w8jgZkv0FdcHOPLWA3W1jvggO62q
 dSkI0SI6cFCkXX6UjiCcZykYLQbMTYJkfaJYJ7qdBgAxJeUYrYlYam2FIVxShAqv8vzZh9TmK
 AylcTIQ7JSULpW1LRmYotM=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Use bit masking instead of an if tree.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210423165413.338259-5-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/arm/cpu_loop.c | 50 ++++++++++++++-------------------------
 1 file changed, 18 insertions(+), 32 deletions(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 5f61d25717c3..69632d15be18 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -228,6 +228,7 @@ static bool emulate_arm_fpa11(CPUARMState *env, uint32_t opcode)
 {
     TaskState *ts = env_cpu(env)->opaque;
     int rc = EmulateAll(opcode, &ts->fpa, env);
+    int raise, enabled;
 
     if (rc == 0) {
         /* Illegal instruction */
@@ -240,28 +241,31 @@ static bool emulate_arm_fpa11(CPUARMState *env, uint32_t opcode)
     }
 
     /* FP exception */
-    int arm_fpe = 0;
+    rc = -rc;
+    raise = 0;
 
     /* Translate softfloat flags to FPSR flags */
-    if (-rc & float_flag_invalid) {
-        arm_fpe |= BIT_IOC;
+    if (rc & float_flag_invalid) {
+        raise |= BIT_IOC;
     }
-    if (-rc & float_flag_divbyzero) {
-        arm_fpe |= BIT_DZC;
+    if (rc & float_flag_divbyzero) {
+        raise |= BIT_DZC;
     }
-    if (-rc & float_flag_overflow) {
-        arm_fpe |= BIT_OFC;
+    if (rc & float_flag_overflow) {
+        raise |= BIT_OFC;
     }
-    if (-rc & float_flag_underflow) {
-        arm_fpe |= BIT_UFC;
+    if (rc & float_flag_underflow) {
+        raise |= BIT_UFC;
     }
-    if (-rc & float_flag_inexact) {
-        arm_fpe |= BIT_IXC;
+    if (rc & float_flag_inexact) {
+        raise |= BIT_IXC;
     }
 
-    /* Exception enabled? */
-    FPSR fpsr = ts->fpa.fpsr;
-    if (fpsr & (arm_fpe << 16)) {
+    /* Accumulate unenabled exceptions */
+    enabled = ts->fpa.fpsr >> 16;
+    ts->fpa.fpsr |= raise & ~enabled;
+
+    if (raise & enabled) {
         target_siginfo_t info = { };
 
         /*
@@ -275,24 +279,6 @@ static bool emulate_arm_fpa11(CPUARMState *env, uint32_t opcode)
     } else {
         env->regs[15] += 4;
     }
-
-    /* Accumulate unenabled exceptions */
-    if ((!(fpsr & BIT_IXE)) && (arm_fpe & BIT_IXC)) {
-        fpsr |= BIT_IXC;
-    }
-    if ((!(fpsr & BIT_UFE)) && (arm_fpe & BIT_UFC)) {
-        fpsr |= BIT_UFC;
-    }
-    if ((!(fpsr & BIT_OFE)) && (arm_fpe & BIT_OFC)) {
-        fpsr |= BIT_OFC;
-    }
-    if ((!(fpsr & BIT_DZE)) && (arm_fpe & BIT_DZC)) {
-        fpsr |= BIT_DZC;
-    }
-    if ((!(fpsr & BIT_IOE)) && (arm_fpe & BIT_IOC)) {
-        fpsr |= BIT_IOC;
-    }
-    ts->fpa.fpsr = fpsr;
     return true;
 }
 
-- 
2.31.1


