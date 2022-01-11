Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0E848B7AA
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 20:55:18 +0100 (CET)
Received: from localhost ([::1]:50938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7NEk-00029g-0F
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 14:55:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCR-0007jF-F9
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:52:55 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:48207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCP-0008E3-Pt
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:52:55 -0500
Received: from quad ([82.142.23.158]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N1xdf-1mMffv2noP-012L7k; Tue, 11
 Jan 2022 20:52:50 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 05/30] linux-user/hppa: Use force_sig_fault
Date: Tue, 11 Jan 2022 20:52:22 +0100
Message-Id: <20220111195247.1737641-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111195247.1737641-1-laurent@vivier.eu>
References: <20220111195247.1737641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3kPrw6jGUBZX7Pqy65rpSbTfKHtuPre6FL1MwIL1X7i8llxXhJo
 tRQ6bnIJu53VCnOGMHxbshXm/u6ULR9S/n718tcPLiG46J8cQKJaHrLdhuYwgff9O6ykH0k
 UZjnezIvEh+QdRGoe0ZufCrRLt8soFB6vYyhRmgGBp9jqZlUVz/DjfLxH81ItkjBRiXMuut
 q/RPAftlLyY/VrrLYtd1w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BJRSUo+Vq3Q=:768JbQJibgtHcq28R7Ukre
 bTW9aDNPf4dWXZhyGaehwK7uh6ZzUWXpvgLarJgSf3/5LAhBkvzWyHo1j0e+v28rsszQoZMwA
 4UlI60oQqCisTFAo7YLk4tmonPm7d76vlbn4CUGe5GpgkkErGKmYGdh+7rZgQr/m4drixDIhA
 jiDkLRfNkVlrIdGj8yWnSWqJuiFT8fiJHGt7M8v7RrnNxi/ax0OmZtG9q/Cr4q6t/22Ar5KEv
 eg4l0VREry45V/OPzhqoN+2Ijt9FcTsxyHbRLNvGDV2fTTy4YB0ZupJPATJrooJxgV9CeqTfm
 eP/iNDm+lo2owEpnLdhlWGnu32HoZPMUK/FaOPsuG1D8ITihrRg2xLoCww2NMEadpjAqjYb2e
 ePzR0tKyOT1Mvlb+KkGnYfD/asVnzrtA1F890J4BXsJPS5XRbzxwfA4QzN7G1B7zN0WPgYtIV
 h5a9My5IEufeUS1raGFbGg0fFk9izCE3HrAXJ1XdzQhwr+SdYsm1ZFiqnaKPuaM+EQ/bzx31j
 dpw3UECIgKRJud3bufLKmGov5kbgVFLhlzy2oLDZc+9YGhZLoeUL/sdjOmdOgJCJ2aQKaT0T5
 4Oa2POk3SSALJEQQf26cTP6L5VYvqua/GpJRFr/nnHUfYtiE23cpLfEjcrdPJM8KKYnK+2zkP
 fWaybhpclrs2yHW6cHwbwtySBQHW7+PpAcx0KxnKLbUBg4mWiAxHKdgZZ0SOcRdqwWno=
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

Use the new function instead of setting up a target_siginfo_t
and calling queue_signal.  Fill in the missing PC for SIGTRAP
and missing si_code for SIGBUS.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220107213243.212806-6-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/hppa/cpu_loop.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index a47a63176b26..4740da1b7a30 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -110,7 +110,6 @@ static abi_ulong hppa_lws(CPUHPPAState *env)
 void cpu_loop(CPUHPPAState *env)
 {
     CPUState *cs = env_cpu(env);
-    target_siginfo_t info;
     abi_ulong ret;
     int trapnr;
 
@@ -147,26 +146,15 @@ void cpu_loop(CPUHPPAState *env)
         case EXCP_ILL:
         case EXCP_PRIV_OPR:
         case EXCP_PRIV_REG:
-            info.si_signo = TARGET_SIGILL;
-            info.si_errno = 0;
-            info.si_code = TARGET_ILL_ILLOPN;
-            info._sifields._sigfault._addr = env->iaoq_f;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->iaoq_f);
             break;
         case EXCP_OVERFLOW:
         case EXCP_COND:
         case EXCP_ASSIST:
-            info.si_signo = TARGET_SIGFPE;
-            info.si_errno = 0;
-            info.si_code = 0;
-            info._sifields._sigfault._addr = env->iaoq_f;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGFPE, 0, env->iaoq_f);
             break;
         case EXCP_DEBUG:
-            info.si_signo = TARGET_SIGTRAP;
-            info.si_errno = 0;
-            info.si_code = TARGET_TRAP_BRKPT;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->iaoq_f);
             break;
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
-- 
2.33.1


