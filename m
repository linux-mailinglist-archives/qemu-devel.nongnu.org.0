Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CED3BF821
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 12:11:47 +0200 (CEST)
Received: from localhost ([::1]:55744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1R0V-00038T-0V
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 06:11:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1Qww-0004op-SK
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 06:08:08 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:59689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1Qwr-0001FR-Ns
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 06:08:06 -0400
Received: from quad ([82.142.13.34]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MD9nd-1lswcZ3PSD-009BEo; Thu, 08
 Jul 2021 12:07:58 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/8] linux-user/elfload: Implement ELF_HWCAP for RISC-V
Date: Thu,  8 Jul 2021 12:07:49 +0200
Message-Id: <20210708100756.212085-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708100756.212085-1-laurent@vivier.eu>
References: <20210708100756.212085-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xojmxh8y3vCnVylLJbmikGcQeeUyEaJqhneKH9yxYgO3eD0ncnM
 wGF9J4iG8v7zZ9/yULqacSa3DnjSV85r6sWNrS5fTXbIUyj56wMd4kxLuxExCvU0mRgpOEy
 68/6dIxY1T1PRJ0doDO7WrOh6RjulIm3ojipWGRVD92eJm2fgOVkXC2syAAN/q0PrgFqWPE
 SO0pJ5U9U4KFvXGV6XXRw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QAnrlwy9LN0=:1ulk22bU7oao+o7NPEMino
 VMI4CGk8fkqWQM0Ge3gnrNKyYK8kP8yycAKa809y699x+K/tdzPQb4ldVCVTiu5l1C1RAyfrn
 u4l6o/pPDaPK54eslly1EZjgyaR4FEB+JPTPZGukZs5iRnVnDbwpkr5CqBpBLCVHYvZX5F/Qg
 OF1wuaT/3DfXUGrhyEEUt4FE0AfORig+FTTuz+iNoTy6V9psCW+Oq/dvUoM23xOrrLFzyGWiA
 6lviooxI6dP0vK17f+iVhG7oeEss0QUahoP1nQoPKejH+6LsQVtzhBhEsWafvEtLh+n9ollwj
 tclnych7K7361lH0d/kHUgoUMTcUh+SBkTh9Mbjsa3nX+QTTDW7yLmZpqSiuvko0uGOOFZdjp
 erHInN9yNmdBLHCnuSQCWAiy8yCNBifcy7SxghEiw6XEfzq/mgJHrxbHQhCmLBGGGrJu0uHQY
 QZy08yAx3BtrgShfh+s9kuSQCkZCIsAomqshuApJwXJbVX4CdPtzSC9mB+NrL/EZl/2eaGLsf
 fqfRwmoUcxYrWakGmp7Oy5Xb2GVYsE4IGxPImqbMOi5Mut1EHYbCDZF8yu8aKbS5lkIQxyfbD
 WR0glqoT1pkCy8FFLRBhDlht073bwNBhpy2jZmkBnljtC8ovutk4hPpBUkfLf0ElxfodJeBUq
 g1HBxhHFsHxv09r33tY38ILA4l4A4RMRJwHev1raJrzT/Yc4+oDP2x/CNSFY+RSDB0ZEy28ya
 7uilLS1KV/UlarYVFusXPPXg22PWvq9kDCcX0wn4nONIYmoN83S2hyjmP9tcvHq9xlm9cIcH1
 deVgS32PdiEsUlYyqMWlLqTrwP4PB2AuyRIroNh3cr7BSNsCU8k7X12uosj63Flox+WSSll
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kito Cheng <kito.cheng@sifive.com>

Set I, M, A, F, D and C bit for hwcap if misa is set.

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210706035015.122899-1-kito.cheng@sifive.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/elfload.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 598ab8aa1396..42ef2a114855 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1434,6 +1434,19 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs,
 #define ELF_CLASS ELFCLASS64
 #endif
 
+#define ELF_HWCAP get_elf_hwcap()
+
+static uint32_t get_elf_hwcap(void)
+{
+#define MISA_BIT(EXT) (1 << (EXT - 'A'))
+    RISCVCPU *cpu = RISCV_CPU(thread_cpu);
+    uint32_t mask = MISA_BIT('I') | MISA_BIT('M') | MISA_BIT('A')
+                    | MISA_BIT('F') | MISA_BIT('D') | MISA_BIT('C');
+
+    return cpu->env.misa & mask;
+#undef MISA_BIT
+}
+
 static inline void init_thread(struct target_pt_regs *regs,
                                struct image_info *infop)
 {
-- 
2.31.1


