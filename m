Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A68F4387159
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 07:37:13 +0200 (CEST)
Received: from localhost ([::1]:60778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisPo-0004I2-MV
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 01:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKU-0006mg-5j
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:42 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:58825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKP-0006re-C6
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:41 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MNLVU-1m6Rsz1av4-00Os0h; Tue, 18
 May 2021 07:31:35 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 06/59] linux-user/arm: Simplify accumulating and raising fpa11
 exceptions
Date: Tue, 18 May 2021 07:30:38 +0200
Message-Id: <20210518053131.87212-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hPsgTGe4wD6egtnSMmt+wXOoApQ3tO5BCWo5A7PBwoYdqj+E2TL
 JpsDNYzain8Lk7UX/3LUJ0cFVO4c2g8qK+ADKLwBh9oSspISQjdgesU08WKeIdEYHo7PEzX
 uV/+DxcPj61Fu0NLJje/FQuC+QlTar26kPiu5xjl/Tb2LzZPb3vyhpIC55CSQOmQj5cKYTe
 oZryk2diDDH5zMU1TNb4g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:g0lQq33wMK8=:tr9ja6j6Cbg5Tl0tc05Sn3
 6Cmyun+gra9MPkfaNIVBaaciuUy30dtL9ZUKWEIOH4uEYYuBoJHhpQN7OXFTCIpRjPawJipJp
 Nq/NAxl7KTcbeUfvg8EDdCYGOfntFmYUCN5oxqaGtkzTOKIrIzdpJDyMoQNLPACLi85O7tR+c
 rirj01TzF+mybadITyFpRb5eVB7T7hyZ5Zw61r+dBfAcmEU9UsmDDjHW+hxNy7otuVIds3RUh
 HGpaO1v6roSI7p6n54SGOwlj7HjaUmZUp2J1QxvXlDljzT2MlTh8UBrzN/Snvae2ndhagebLG
 klbTgTdnhEQijB+QPqtEchntbi3jIB4pB9vDY9mD51ruLYKab4BidTasgKhOXhR2RnPtcdVH2
 wNq+YpJyD3w74/evoSwCKX8P28m83AF85Z2u/xl3p00qk+fpMJKWYcMpw6icSskZKeDpIZbj3
 q37lpZkJ3pZGx2djvrzhW5hwT8b57nIG/PSfgZDJflaUM5lTehM3KMJXR6S+4smFhPjpILOaj
 gdHWcS3I+HYHvZSBT4tKAs=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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


