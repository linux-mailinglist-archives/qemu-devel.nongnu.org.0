Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8149B417664
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 15:59:34 +0200 (CEST)
Received: from localhost ([::1]:58464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTljh-0006zD-II
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 09:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTlgr-0002wt-Ua
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 09:56:37 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:46103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTlgq-00058l-A3
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 09:56:37 -0400
Received: from quad ([82.142.21.142]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mna0x-1nAI7R3vBl-00jdR4; Fri, 24
 Sep 2021 15:56:33 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/7] linux-user/aarch64: Set siginfo_t addr field for SIGTRAP
 signals
Date: Fri, 24 Sep 2021 15:56:25 +0200
Message-Id: <20210924135631.2067582-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924135631.2067582-1-laurent@vivier.eu>
References: <20210924135631.2067582-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fPR3/8rh0PhPJq2VfS7RHrsnKVH7dIdhp/GFaBpA1tqK4y3ot+B
 8ST1s+ikw4k1FRiPsf6ktKNj/Y8cyEf0X5e+HiX/E/GW7uZ0AwpOSwaLDnHEGJNMMokI+rk
 K0rLBIFVfHzmayg405cbDJuIzimafC5SIAdOQB1HGYZgFsiMWbQS5xkfGWOZTjVpiJHh3V+
 4K0s0ZhVlAoYjjM7IlNug==
X-UI-Out-Filterresults: notjunk:1;V03:K0:p4A86pW3S8U=:TcCU6kc/qq7AENANt5n4Q7
 o8lHi/dQXumLzwJsAmmY4LcRDSNorcpWARm2oAY12cNprC2N9cW7JNfjEg83wx4uTaBtyQGt6
 lLTjZeDkq/bBZYtGYHa8SXpldWwIhLxmp1z+ewQq6ou9/+HsI9Pfv+2Kup5eGM9q03VO0B2By
 S0G48TPFPrKNIOmDRTzvNdAlHZSriA1X10v0Mq8v0Huo2RnLCrVWWI97bljpRpdLiqn0583Cn
 la3UNAElZbsP32wqQsFxv/ppeBoJkEhmpmdtplKAEKAe2rXHbTyk21iNwcUl6vwb7Yu/CTQQh
 NqEOsWepBzyFE6yRW2znLCvIlzWMjZDd3b3CdhmJmkJ2hoJGs4PhJtREaxksFWf3HPGBYSRa4
 S3U/yiB+fHMWTjYvX+9JSPTjx7EO0G8762Fbjkx5gsfO3T+r8SPqiId2VkcBHX1gjaUHzwpH6
 RQtfe1kSlXvi3iiA+y5Vyw09xUmF1joDhHvwFKubRKL5rCtPPS0bWHJu/CRE8i6RHxZKRPfp8
 qFCqd/xRr/l+W4CwroZtsuZowiqWex/I63FBYvi7E4c+Dlg7Sbkga2jdyDjfugCbD3KxSuZVm
 ySvZZM4CavK75NRDhw8oSXy1Ph8zRGgdL17IDWDQZx6bVZUc833j9tIE1TtpBtFlftDgkGGga
 Plw9NJwAq7sTrxVPPIFnkuPSKoFYNr4TId5rFkKmZhGa612x1xvXGQ3aorF9PjdLUjOJiIgBF
 GJUpmww39vkhykzxOOU+jwH2de8eTOYJQwYnQw==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Peter Maydell <peter.maydell@linaro.org>

When generating a TRAP_BRKPT SIGTRAP, set the siginfo_t addr field
to the PC where the breakpoint/singlestep trap occurred; this is
what the kernel does for this signal for this architecture.

Fixes: Coverity 1459154
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210813131809.28655-2-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/aarch64/cpu_loop.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 5425b85659a9..980e734e54f3 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -150,6 +150,7 @@ void cpu_loop(CPUARMState *env)
             info.si_signo = TARGET_SIGTRAP;
             info.si_errno = 0;
             info.si_code = TARGET_TRAP_BRKPT;
+            info._sifields._sigfault._addr = env->pc;
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
         case EXCP_SEMIHOST:
-- 
2.31.1


