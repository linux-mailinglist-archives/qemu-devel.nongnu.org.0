Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8588548B7ED
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 21:14:10 +0100 (CET)
Received: from localhost ([::1]:38056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7NWz-0008Qy-KX
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 15:14:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCa-00081o-Lz
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:53:05 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:46071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCY-0008H4-18
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:53:04 -0500
Received: from quad ([82.142.23.158]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M1pk6-1n5BL93pUG-002Ej8; Tue, 11
 Jan 2022 20:53:00 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 22/30] linux-user/sh4: Use force_sig_fault
Date: Tue, 11 Jan 2022 20:52:39 +0100
Message-Id: <20220111195247.1737641-23-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111195247.1737641-1-laurent@vivier.eu>
References: <20220111195247.1737641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VapM+0y8XOb6nNKwDp4IRXK8ffrLcGsOs5a9dkkVDZTlrZ3M1uI
 +uCZ2PPAFxow09ls3HBNCos1EBXyacZKFuECQLhTmq+bySamluY5WyQxqpOQ3N5RGQfZJ5H
 ao5mOku3q/ZRJqsbGhIbhad1vJVp/jlVyGBzp/NyVNCyVwsRgoAriXiscNgBfSmDQMeo2yM
 FEwheZ5p+fmC2h28MWy5w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LaoEkBNytHg=:pgZLbAVsi95vqRCVTQIp5P
 Kh2OVK8LiHXjIy98+0kQ3dvDNtGkZrCIw0yycacgcSlCPnZrKUIbFegO2jDLfKVTUT0zsKdgL
 6zeJYCNCjNKBRK3x2lCyE49n/S5uQIBMlNS2oT8e2cBJ4Sk54IaD0HCmtHmwbD8z4IhuWd2Ub
 RPXM8Ew0A53zfR6wN/Q3gxl5qDBa8FV3+axeQfciCDFH02aBT253wb62pJIKnbwKtJ+Nl7jci
 3j2fygULvUYuz/KqfhOcGsfKBxTD1ZWwCh5NN3HARaA1qTztJSmVgbHbmioSTldgBOe25actq
 QntFHldKWHvYyKhoawFEOxDJyXiYNSvMD+2+9CEkw7sqou6L5eJHt8TP8cJi2QPsAv93rsjkG
 hEDhqtHGyDvYEM3wL7akDXIHxA5Jt3gRHGJfwMP6s3R4fBvfhu40z55WqhS0RJm+KJxesbepR
 2+18JGWfdeAYGGxGRNrOn4QxEzCqMdoEaLDx8IAlNTXHLx4mMm8POiOGvl+IVSsqcO7weewKj
 kVwTzvSFacG8cr+wxLdN/+GlrjuQJUvNo2/3BFc4qV4RbhiMiBvLbAoQK93tmFdADqaJUFSmQ
 3VQF4RR4lPxcJJhIW6vAuC6TeUEWFNLGHoWGd1a+Rb+SBLYN8arFJFPSe+rAkNfmlH0qf72iZ
 QGfkDBUKaSkDCpD7abLjOBVyB13pdnOyxrLsgxTHphIL0usUH5WYbbY8zUd5m930jfA4=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
and calling queue_signal. Fill in the missing PC for SIGTRAP.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220107213243.212806-23-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sh4/cpu_loop.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/linux-user/sh4/cpu_loop.c b/linux-user/sh4/cpu_loop.c
index 3290f6445c5f..1bd313cb19a2 100644
--- a/linux-user/sh4/cpu_loop.c
+++ b/linux-user/sh4/cpu_loop.c
@@ -28,7 +28,6 @@ void cpu_loop(CPUSH4State *env)
 {
     CPUState *cs = env_cpu(env);
     int trapnr, ret;
-    target_siginfo_t info;
 
     while (1) {
         bool arch_interrupt = true;
@@ -60,10 +59,7 @@ void cpu_loop(CPUSH4State *env)
             /* just indicate that signals should be handled asap */
             break;
         case EXCP_DEBUG:
-            info.si_signo = TARGET_SIGTRAP;
-            info.si_errno = 0;
-            info.si_code = TARGET_TRAP_BRKPT;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
             break;
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
-- 
2.33.1


