Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3C2581095
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 11:59:25 +0200 (CEST)
Received: from localhost ([::1]:56352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGHLY-0002qe-5I
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 05:59:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oGH7U-0004Xa-F8
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 05:44:53 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:42077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oGH7Q-0001Bf-W3
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 05:44:52 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mn2Fb-1nnlvv0Lkl-00kC7M; Tue, 26
 Jul 2022 11:44:44 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 1/3] linux-user/hppa: Fix segfaults on page zero
Date: Tue, 26 Jul 2022 11:44:40 +0200
Message-Id: <20220726094442.4452-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220726094442.4452-1-laurent@vivier.eu>
References: <20220726094442.4452-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:XXxmPxTHhgxbbEDCLBQD6X7qk1FoEnMPD++qcBHz2DayfS8jT2A
 zdiFPhmD2eQF0f4cBYeYG27F9DYshcA44zrf+udcMR+Xb0LfNJihXcaytRyTCUpO61qzoLl
 VThBp5CRm0iFQ+tcMm4lYfGhID4s3j5Ep9RagOneF6lJvNVGDqGod37BeR5Lw7CdXnd1MJV
 se2ha6ZvpENHng7R8LgmA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ypWP8l/fv4I=:rkrgAEIaYa/74erB1yBOoJ
 IK+CgHR3wkR8f25Xpr6wTjwfaxpNCt3YZM9UqohoACSV0S6qesp8ILQzVy8uBmqp0b0U4cDmK
 SIRoSpsJoGYXiB4Oqp5SEBDbVvWfsBle3Y2UjcIgcyE765BVXDUmxuFWFcfiA6GUwcnq07WGU
 FZ+xq3We8L/wiuJeCkAywt2cxHlRfiJh69ddtn2vdc5Phxzq+s9/dyWnIdL5P7SKmU5qBsu54
 vFnN0rLe59So9NxnJ6T3AWUU32pC1daPihbRf00EWWTszc1TJWq3yAEi8VditIB6nCCTbCdRl
 GbnfKknH6BeKKHTTm06mnHQdlOLgpD6ejsEoTXppxxQsrDQ5e979QuTfmurzaPBuSxOueboev
 wmzD4IluCeGXlVpW6ojIdzbSPf7qU0r5s/yy9s+P/yuNgYndpz3IJaA7YmQysqvD196dCi4Mi
 gYDr31rybv0lgjEDwU+j4/HgpDggTO1VpwPzHA5duO9QIPfVbjOs1AlBMS5sX5GgYN97HZnqU
 ApYITWBb5p/TrimZTawcSgt4OI8+QokQTOmlDSy4RHmQTjSbN4hcj0Ttnjk/AhA0+XsZhuSNI
 TCXlyUN/KblvFCYdduk0fqAJEV3yzPdM2xvKFlhewNNfTY/NdjoVVyiASXA9S6Uhw9WiVSQ8o
 +M1BhJcqDg/stLoA9oKEW9qkWa9g+ioOgPKPSpv+HklZ4f1oCMlkoVvyIcrksGKDDWfneF5/x
 eMcEVUTBepFrHMjYWyVjQW6OEWRUuN51m11amA==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Helge Deller <deller@gmx.de>

This program:

    int main(void) { asm("bv %r0(%r0)"); return 0; }

produces on real hppa hardware the expected segfault:

    SIGSEGV {si_signo=SIGSEGV, si_code=SEGV_MAPERR, si_addr=0x3} ---
    killed by SIGSEGV +++
    Segmentation fault

But when run on linux-user you get instead internal qemu errors:

ERROR: linux-user/hppa/cpu_loop.c:172:cpu_loop: code should not be reached
Bail out! ERROR: linux-user/hppa/cpu_loop.c:172:cpu_loop: code should not be reached
ERROR: accel/tcg/cpu-exec.c:933:cpu_exec: assertion failed: (cpu == current_cpu)
Bail out! ERROR: accel/tcg/cpu-exec.c:933:cpu_exec: assertion failed: (cpu == current_cpu)

Fix it by adding the missing case for the EXCP_IMP trap in
cpu_loop() and raise a segfault.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <YtWNC56seiV6VenA@p100>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/hppa/cpu_loop.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index a576d1a249fd..64263c3dc406 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -143,6 +143,9 @@ void cpu_loop(CPUHPPAState *env)
             env->iaoq_f = env->gr[31];
             env->iaoq_b = env->gr[31] + 4;
             break;
+        case EXCP_IMP:
+            force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR, env->iaoq_f);
+            break;
         case EXCP_ILL:
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->iaoq_f);
             break;
-- 
2.37.1


