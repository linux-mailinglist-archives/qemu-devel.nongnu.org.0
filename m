Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D4148B7D4
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 21:06:12 +0100 (CET)
Received: from localhost ([::1]:48250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7NPH-0004QO-En
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 15:06:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCU-0007pD-AP
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:52:59 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:51337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCS-0008Fd-JE
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:52:58 -0500
Received: from quad ([82.142.23.158]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MtOX2-1mDdW41yes-00usjL; Tue, 11
 Jan 2022 20:52:54 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 13/30] linux-user/microblaze: Fix SIGFPE si_codes
Date: Tue, 11 Jan 2022 20:52:30 +0100
Message-Id: <20220111195247.1737641-14-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111195247.1737641-1-laurent@vivier.eu>
References: <20220111195247.1737641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:aGpXwnUqRvLP5gupcRgBj1eE94Ekx9mEuy9zl3e9R+2JYTcxSDp
 BWsdezaV0+HZPy0ON6h5ZEB0/5HLqUAiiELg3FR4zK2RXCGFi5P65BhiNo2w4UhglGLHZCx
 5WoPPW089yPj502KnpdkTTDSY6C4zttSiYXCjyHMoghGW51/uqKhPFhOQ6HuaFS6g0svGVf
 mTZ7MEg8FBnCfHcFD9HAw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EdHWT6PYSCo=:Bsnr/ZRmVDDwfTSGQ04otB
 n52hEhvGfi2cicQY3lMJr1+CygPSRRQ2fEQfdrkMfAKv/wVXSBRECCkTgBUg/D/4iBb9t3cK8
 mfgtD3GC7oyXJynKKB34EA8rZ2/tn2D1r19xF6k41MWZWZl4nrv04N4TMSgxxdINYjIpRL/2R
 Y+iXyz9DUVSyqm3vGuTxbcSn3X7eMMxd2rtxB4E9jQ7n8S3a0SzhmnyUMJ5D1RYrddaHDHOI4
 zajUDbNodzRIbMQiec/uz9hv68gTviogb4O/TzYEz5LKfTTlAXqqi6R0yB5fQlEyQaSzraCUz
 prAmHiysL9+j3vJW8pXThhd/i1PFrBatmj5coXYhJ/mpOtAc1Cdbg1rUnxqmpKjp+V0QFOOig
 GkbZynzUyhK5x3VoQmqUlaA9mKnETKXiSx0NN+IJ1REhMBt1m2txpvaJYeNz47SFVXXvNAiA+
 Glb8tZRhJWSmFMAa2Fm+EwbFznsr3MIkQyX3b07LPmbA0nPrSFTbjzXZzVHhdxmgmo1kXTEYu
 JcVHqhX/MODvRApHvnK/wjcuHH/DwKfF+1g53f5llUN7beBRZRj3xWOKrtwfK0xg63jDOyVKs
 Nhy6gcpSiStFi91SwsDvEu9U47F/PYEhb9FExnbQApl/MoVh6yef1jzjkeDn7+Q7O2pL8aFZP
 XBgUyC+XeFpFuAT56H0TGPs8TZJ/nJXYWYoI+jN/qk9kGOYfqPJUK6HSprhqNhnkmVFI=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Fix a typo for ESR_EC_DIVZERO, which is integral not floating-point.
Fix the if ladder for decoding floating-point exceptions.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220107213243.212806-14-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/microblaze/cpu_loop.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_loop.c
index 08620d4e6899..1a2556be2c5f 100644
--- a/linux-user/microblaze/cpu_loop.c
+++ b/linux-user/microblaze/cpu_loop.c
@@ -77,15 +77,25 @@ void cpu_loop(CPUMBState *env)
             env->iflags &= ~(IMM_FLAG | D_FLAG);
             switch (env->esr & 31) {
             case ESR_EC_DIVZERO:
-                si_code = TARGET_FPE_FLTDIV;
+                si_code = TARGET_FPE_INTDIV;
                 break;
             case ESR_EC_FPU:
-                si_code = 0;
-                if (env->fsr & FSR_IO) {
+                /*
+                 * Note that the kernel passes along fsr as si_code
+                 * if there's no recognized bit set.  Possibly this
+                 * implies that si_code is 0, but follow the structure.
+                 */
+                si_code = env->fsr;
+                if (si_code & FSR_IO) {
                     si_code = TARGET_FPE_FLTINV;
-                }
-                if (env->fsr & FSR_DZ) {
+                } else if (si_code & FSR_OF) {
+                    si_code = TARGET_FPE_FLTOVF;
+                } else if (si_code & FSR_UF) {
+                    si_code = TARGET_FPE_FLTUND;
+                } else if (si_code & FSR_DZ) {
                     si_code = TARGET_FPE_FLTDIV;
+                } else if (si_code & FSR_DO) {
+                    si_code = TARGET_FPE_FLTRES;
                 }
                 break;
             default:
-- 
2.33.1


