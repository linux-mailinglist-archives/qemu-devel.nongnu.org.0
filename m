Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBAF702745
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 10:33:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyTdE-0004ZM-UN; Mon, 15 May 2023 04:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pyTc9-0003iD-37
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:31:29 -0400
Received: from mout.kundenserver.de ([212.227.17.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pyTc7-000273-Em
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:31:28 -0400
Received: from quad ([37.169.188.112]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MkHIV-1qQcMq2TDV-00kfkx; Mon, 15
 May 2023 10:31:21 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Daniil Kovalev <dkovalev@compiler-toolchain-for.me>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 8/9] linux-user: Fix mips fp64 executables loading
Date: Mon, 15 May 2023 10:31:12 +0200
Message-Id: <20230515083113.107056-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515083113.107056-1-laurent@vivier.eu>
References: <20230515083113.107056-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:O388fsuUadPcZEXzUE7EUzO0L7fcOqZjMtX2XnK2sZcHfCEWBNU
 gp8hfGVqiWTFcZ157b0wwGT4qHYCQo3NtuCGnCOEh7aHl4OKzMm8rbTcNU2S15050ldhtoI
 7JRs7Hv63opM/MRI6xEvlDnLiyjczznVMm4FAfTvhF2o8/wx3eOFhupDi6Jlkbvcl1i107R
 yE4LJU2DA2b2vZj/7WQuQ==
UI-OutboundReport: notjunk:1;M01:P0:/SiC+BTfWLk=;z3EBb6K80gp40/NbWBR8Jdp4FiZ
 UIsW81DqeTshVz3ywx2/L3Pl9hYzJdzQRqzPLDXXcZAn57uGO3/E4Y0AFEHYiW1F3BvPKawBP
 +LVMgvxV3vG2wMobhVY3bR5W3R9hURE8WBOJ8QrSAbAs4glSXHAA6nm9MKN31BIQmQi7CBkqZ
 PMUyENKzaHt9xkgQ/7qyQlb8PqGUeikXx2FY9qzEGAPRjuzkw1/r5yy1KhbjPFCNLRJ+E+mP4
 FFJk7voyC2izNLQxMd0XZpyGtDHecZGO4DR10uxpXxCOe7ESLtEpUxydA6hFO1ApTaGJDLsjn
 pvxDPqZ05KoG9XM4d2XqnRLuECm1he1cN1TfCCpqLo/KmMp0BXLxUbiXTtlJk3xBh/v4fMDP7
 2+PEmdwifKJZ+xYe7v/I49NIsKL+5kyUYIGXSoQ+q6h8ZrRjOt7f2yUIq6+9Fq+sor7/HIXab
 Qpz7oljM0oskbGV5xpwMLNhhXoa18+ZQL15bgdMfNM9lGMOU5jF6e5Mssyb4QQejnklWyEYEj
 Ldmph4irbo1OR88/MUDM6RQKRGClv2iYl1K19VmORjaEAqASiG604ESs/nxgYyjIaLg+E35Zl
 QrLISsnFd+3mUcEa1KJvyTwiSrLoUnmeRjPncRLsTjoKxEX9LvNlIoQwl/vR9oTC+/F/DakKO
 WqHADrA77dQtApHUfkZlJwz+kN1TPeNLEv9tJemAKQ==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Daniil Kovalev <dkovalev@compiler-toolchain-for.me>

If a program requires fr1, we should set the FR bit of CP0 control status
register and add F64 hardware flag. The corresponding `else if` branch
statement is copied from the linux kernel sources (see `arch_check_elf` function
in linux/arch/mips/kernel/elf.c).

Signed-off-by: Daniil Kovalev <dkovalev@compiler-toolchain-for.me>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <20230404052153.16617-1-dkovalev@compiler-toolchain-for.me>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/mips/cpu_loop.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index d5c1c7941d34..8735e58bada0 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -290,7 +290,10 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
             env->CP0_Status |= (1 << CP0St_FR);
             env->hflags |= MIPS_HFLAG_F64;
         }
-    } else  if (!prog_req.fre && !prog_req.frdefault &&
+    } else if (prog_req.fr1) {
+        env->CP0_Status |= (1 << CP0St_FR);
+        env->hflags |= MIPS_HFLAG_F64;
+    } else if (!prog_req.fre && !prog_req.frdefault &&
           !prog_req.fr1 && !prog_req.single && !prog_req.soft) {
         fprintf(stderr, "qemu: Can't find a matching FPU mode\n");
         exit(1);
-- 
2.40.1


