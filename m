Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C42076B094E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 14:34:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZtsH-0002pL-SD; Wed, 08 Mar 2023 08:30:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtr1-0001k5-Vn
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:18 -0500
Received: from mout.kundenserver.de ([217.72.192.73])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtqw-00065x-G1
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:11 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MvJo7-1qQtwj15ub-00rL8P; Wed, 08
 Mar 2023 14:29:08 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 14/28] linux-user/sparc: Tidy syscall trap
Date: Wed,  8 Mar 2023 14:28:43 +0100
Message-Id: <20230308132857.161793-15-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308132857.161793-1-laurent@vivier.eu>
References: <20230308132857.161793-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:74NF9BUavhkFdIHGsVoV/LB4EEsOrkxuu9jm+0mN+TtQvNYJdO0
 AdDTp4IRSWxakLL15TyfcChNIFxhScQxo9a2sWjGE72hnId3CV+YeBcgQ7me1JwbJV4Wq6E
 RBJ1QeqYKSMsChr3raQX1cAYW8ADhVsF86DYnO0PSYuR6zc0nxjyZ/zoJTZCNmx7JqaW6FE
 fkhlVEkC+JzZp3tzRWkEg==
UI-OutboundReport: notjunk:1;M01:P0:i4ILVZGdys8=;N2XPW5mi+T0BnvbfNue5zrMgars
 642QsEqtcCvy9GanTFazO16beP63+WAqplExChsv1ikGNr/JFdw1jJDCcVyBUpdjtvR4CeW2p
 ofqAc+bmfjJNLxLT6K3pYxI5dNlCspFXyCjYf5b/HCz4nW7noJzVrk3Cxe1+F4SofSuVLFutu
 Otk3aLzD2aWOUEt/PjSR03/lTSQWfnF6ytsCt2qYD+If2qe5eWRklBBYRejsM01VAQ/G9snkI
 2z8xiT3Z+FfS733YDjRfjfpaGmY6PS0lC4+N46+QB12bdNNVCudvDJ/8bFfvWJqL9VhgqerZn
 e02gpaGhyaY1ZBlq2pKLBVllyuZ1OSwd78tvcY8qWAffR10WbjnbTgjkxJROB0uBuIdohHkY9
 /c5xyciPFTF4plLs0GTF/bdo1Q+K+zy+W/ub9tu1szAUmBc6h85HpXSaNs56TyDLxhGkKWyhd
 vzuNnyDPRt9smmMOLNN/xXB9iMGXIO3aQWMTcVsVTi1BoDjMKECoFe07HjWa4lHHe42/J975s
 RYVw2FfZ6kyURZxh2R9aorqEK2fxfykXcAJqlx+wEQb4xXgdo55Zx0ShwGSXsJ0zPhhNYtzEV
 ZtBKsEB8K/oQcvLcbzMFTQSxDBR2mi32l5HzhZ9sK445Ee/cVCJ9l10MmTALvnMMLuoeewJY4
 XD3UXUrw0EcC53c3VppVTAN6la51f4ujc6Sc5eRZUQ==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

Use TT_TRAP.

For sparc32, 0x88 is the "Slowaris" system call, currently BAD_TRAP
in the kernel's ttable_32.S.  For sparc64, 0x110 is tl0_linux32, the
sparc32 trap, now folded into the TARGET_ABI32 case via TT_TRAP.

For sparc64, there does still exist trap 0x111 as tl0_oldlinux64,
which was replaced by 0x16d as tl0_linux64 in 1998.  Since no one
has noticed, don't bother implementing it now.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230216054516.1267305-3-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/cpu_loop.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index c120c422786a..d31ea057dba1 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -149,6 +149,12 @@ static void flush_windows(CPUSPARCState *env)
 #endif
 }
 
+#ifdef TARGET_ABI32
+#define TARGET_TT_SYSCALL  (TT_TRAP + 0x10) /* t_linux */
+#else
+#define TARGET_TT_SYSCALL  (TT_TRAP + 0x6d) /* tl0_linux64 */
+#endif
+
 void cpu_loop (CPUSPARCState *env)
 {
     CPUState *cs = env_cpu(env);
@@ -167,13 +173,7 @@ void cpu_loop (CPUSPARCState *env)
         }
 
         switch (trapnr) {
-#ifndef TARGET_SPARC64
-        case 0x88:
-        case 0x90:
-#else
-        case 0x110:
-        case 0x16d:
-#endif
+        case TARGET_TT_SYSCALL:
             ret = do_syscall (env, env->gregs[1],
                               env->regwptr[0], env->regwptr[1],
                               env->regwptr[2], env->regwptr[3],
-- 
2.39.2


