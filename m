Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C86E48B7B8
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 20:58:45 +0100 (CET)
Received: from localhost ([::1]:59494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7NI4-0000bz-8z
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 14:58:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCR-0007jD-FJ
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:52:55 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:54271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCP-0008E4-QJ
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:52:55 -0500
Received: from quad ([82.142.23.158]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MTRdK-1mvBTr0Zem-00Tpib; Tue, 11
 Jan 2022 20:52:51 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 06/30] linux-user/hppa: Use the proper si_code for PRIV_OPR,
 PRIV_REG, OVERFLOW
Date: Tue, 11 Jan 2022 20:52:23 +0100
Message-Id: <20220111195247.1737641-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111195247.1737641-1-laurent@vivier.eu>
References: <20220111195247.1737641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:u0WrcylP1/3whVatcKJAX2vATVMRXngcKPezLgaoa/TmWG1WMWe
 MjbNqA213OMublTus17b8qrScsfMJ6GoWZ4YwnJ7Bh3lrTiWph//uPvu43uawB/QeqlhqjM
 7ZZ74B0kuJxv7j3qmuiDh9O0WeEwDBSF/EMqiVnQZa1ZEn0q0rO+gev1s4yehLxURdnYAjz
 FjCbyDefuC8eh7SERAEwQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fh3/HSnzhQQ=:cUCEDfsW+Z8oLRl/E2TPkq
 sGqptmqLC54VO4wO0KieRqGKD1xeSuImJkSbQUbw6FpBwTeYz2jbtG2Ap1UzY67de7i6KoSba
 1jz6aexZjzrCwHQtfXbPb89SlJtyh3JgNugrV6fS6S1S0onvMSsZwy46w+AIF8MxciHJWx57K
 /yU0CwNwMWqlUjCx/XWTCl0VPrKsIz/0mg9MOc+OQ7td/eGhPS15ZFnj4V++fPJL/7+aNfymB
 rNob2t9V8i7PS9xVpKKt/ab6HrURTNRX6/gieDPmatVPES8k49UfxKh6ECBOxRTkDI9klOBLJ
 qxPTC6m4gpsbr4nCy9CFAgyBIH1nnmlEqIU+tk+kGa8dcKTsZv0Nb/Fh7DnJZDcbVne4G4bE+
 RbCb7OL2YL9qXSIfCr17TCiRXonIga/5Up5IrbSpdLMo0Drd1Tb13s5vyfz3+rtaQdZgt3emz
 QBYEZZ4jo5uV3EhPahL97cUqA0yzOCL8n/k7nSD6JphTsEQS+t9OGpX0WZJOuC8A73cJJ5c3c
 T6wej9r8AL3WwT4uy3oMa1ahZd2nU4o4h02ACQNn8os/oc0o5Wn6dYvOX7R8J6N15D56TTNbQ
 1DeZfgUh2uQKYhyKUIboFK+XfnvuZrWfYmee65OLLBVHSTPuBqn9JEBStXwoSyrglQmygEjLH
 qlVmFsdnmnMomDoRUhE9T/RxjSyWZQkHs6bzFpiHtZBjkOlMhhlScJE0nxwJ80IX9XN4=
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

These si_codes have been properly set by the kernel since the beginning.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220107213243.212806-7-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/hppa/cpu_loop.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index 4740da1b7a30..a65e1571a0cf 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -144,11 +144,17 @@ void cpu_loop(CPUHPPAState *env)
             env->iaoq_b = env->gr[31] + 4;
             break;
         case EXCP_ILL:
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->iaoq_f);
+            break;
         case EXCP_PRIV_OPR:
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->iaoq_f);
+            break;
         case EXCP_PRIV_REG:
-            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->iaoq_f);
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVREG, env->iaoq_f);
             break;
         case EXCP_OVERFLOW:
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTOVF, env->iaoq_f);
+            break;
         case EXCP_COND:
         case EXCP_ASSIST:
             force_sig_fault(TARGET_SIGFPE, 0, env->iaoq_f);
-- 
2.33.1


