Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F512559711
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 11:56:33 +0200 (CEST)
Received: from localhost ([::1]:42526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4g3E-0001ia-Cs
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 05:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o4fwk-0002sw-7z
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 05:49:50 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:44729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o4fwi-0001af-Ke
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 05:49:49 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MfYHQ-1nT9GM1Yfg-00fxfr; Fri, 24
 Jun 2022 11:49:46 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 3/3] linux-user: Adjust child_tidptr on set_tid_address()
 syscall
Date: Fri, 24 Jun 2022 11:49:43 +0200
Message-Id: <20220624094943.729568-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624094943.729568-1-laurent@vivier.eu>
References: <20220624094943.729568-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Jdy6tD60Ahty6TTV1vrldTjxdWN0gFC2Vs6320oKES/XUHpaXkc
 sfFYy4sTt0lux+94tmlo+qbuldx+vEEe1zzb7+VRf4cD16uz5LSPSq1oSKyZ32d7iplInWv
 6uTLE2NlE0vTzaQ5il/LtqMq0FRUV0olFcDXtIGWz6oA9hIoDKc1Meq1L+yCJ6fM+CzmMpi
 UZnE7Wyn4rNGk4Z315VYw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WlsqVm8ndWY=:XQAKj8MWmWSMHWd/KlGMoN
 Z+TOgBxWZLP8e7vR5fLGh3Wdal4/U2rHu0GgNEPDLiWYjRyJGFiMTdCL9OrSQB5mq7rN3x4bt
 trwfSmoJkPX/5CXSZbMXe7Ks6an6OHTozFVqdl6Ria81zR2gCb0lAV3aPxJ2zS/78Mz2bQANN
 0014zM2v1fyejTdCYwVtl5U77DeRKQYyfKYJTEk/5xHRUte0LtixRAIycsvcIke7HPVBG2OL5
 xmJIUIbDxXta2PQkdrDDx0U0jMu9S/+glQPJq4pllEEJ1w2otaM+DHHjDq2BTb8/eDsDBhvZP
 bCI4tjBLm2U/5kwmSGnn9hI3FtZusDizALcjHver882z6RhU7fOeI7weLXt6SR5jC1pCiwcb6
 A945fUYg/gztPoJYgNlwtsC1EsyfeJNP9k+XjKvgnDP6VHACTTzEBVobiArM4hqyFxqcYg6Qc
 hhMWcqIf9AuRoGel3/1P+QbGk6UmOmJ12Ys+R0/tfKXAWpNuBU9kX/3ArnwLbrDeLCqwjNb0C
 fRpp77Qz4Qz/uGqb70GE/LMiIYyBo5dqO16Q2MDX/cEVqExjhXkebIe7yKp1es2gISdh57ktV
 WvUUGm7rUw/KlRC8RD1uxhOqVsv5Ee9SR6Hkfc7RpC0HAZTAls6Pc/yYMRnp1zEoenIOTxHkB
 FWEczD0H60zQXXzvSs6iCeC7YxR0l/NgM3tw9VXS9SoTsUKJuPAhJNJ/hV+g3nNNZ4FJrPUp6
 XX8PQeBSeeLB0QFOYDTIFlEiOneaXAh4wh5d3Q==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

Keep track of the new child tidptr given by a set_tid_address() syscall.

Do not call the host set_tid_address() syscall because we are emulating
the behaviour of writing to child_tidptr in the exit() path.

Signed-off-by: Helge Deller<deller@gmx.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <YpH+2sw1PCRqx/te@p100>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 8f68f255c0d9..669add74c11a 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -320,9 +320,6 @@ _syscall3(int,sys_syslog,int,type,char*,bufp,int,len)
 #ifdef __NR_exit_group
 _syscall1(int,exit_group,int,error_code)
 #endif
-#if defined(TARGET_NR_set_tid_address) && defined(__NR_set_tid_address)
-_syscall1(int,set_tid_address,int *,tidptr)
-#endif
 #if defined(__NR_futex)
 _syscall6(int,sys_futex,int *,uaddr,int,op,int,val,
           const struct timespec *,timeout,int *,uaddr2,int,val3)
@@ -12196,9 +12193,14 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
     }
 #endif
 
-#if defined(TARGET_NR_set_tid_address) && defined(__NR_set_tid_address)
+#if defined(TARGET_NR_set_tid_address)
     case TARGET_NR_set_tid_address:
-        return get_errno(set_tid_address((int *)g2h(cpu, arg1)));
+    {
+        TaskState *ts = cpu->opaque;
+        ts->child_tidptr = arg1;
+        /* do not call host set_tid_address() syscall, instead return tid() */
+        return get_errno(sys_gettid());
+    }
 #endif
 
     case TARGET_NR_tkill:
-- 
2.36.1


