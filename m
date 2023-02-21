Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD3069EA0E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 23:24:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUayc-0006NM-Fp; Tue, 21 Feb 2023 17:19:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pUayH-0005yc-Ce
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:18:50 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pUayG-0005no-1X
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:18:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+tnppTd0ieQ5tTrzXiinNQOOLGRYOQzmgd5/Nx9T5Eo=; b=qcK/0FZB8yT38Hxp5tBRDPGcpt
 nIcqm7Gvl3mhv+2GngkSku9kcDySGJki7jzcu6JYzGcpW+aT9i9UtdBb8T9DTXKZrvv9K6fEUc2Vk
 XT+m0imn/L4ixP2TwPJQXluf7PWBLnikO1Zy1799cYe7NNnmVJ9VfGFZrdFPAg/lmi30=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, peter.maydell@linaro.org, mrolnik@gmail.com,
 tsimpson@quicinc.com, gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 edgar.iglesias@gmail.com, philmd@linaro.org, shorne@gmail.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk,
 atar4qemu@gmail.com, kbastian@mail.uni-paderborn.de
Subject: [PATCH v2 15/27] target/sh4: Replace `tb_pc()` with `tb->pc`
Date: Tue, 21 Feb 2023 23:18:06 +0100
Message-Id: <20230221221818.9382-16-anjo@rev.ng>
In-Reply-To: <20230221221818.9382-1-anjo@rev.ng>
References: <20230221221818.9382-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Anton Johansson <anjo@rev.ng>
---
 target/sh4/cpu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index f0934b20fa..61769ffdfa 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -26,6 +26,7 @@
 #include "migration/vmstate.h"
 #include "exec/exec-all.h"
 #include "fpu/softfloat-helpers.h"
+#include "tcg/tcg.h"
 
 static void superh_cpu_set_pc(CPUState *cs, vaddr value)
 {
@@ -46,7 +47,8 @@ static void superh_cpu_synchronize_from_tb(CPUState *cs,
 {
     SuperHCPU *cpu = SUPERH_CPU(cs);
 
-    cpu->env.pc = tb_pc(tb);
+    tcg_debug_assert(!(cs->tcg_cflags & CF_PCREL));
+    cpu->env.pc = tb->pc;
     cpu->env.flags = tb->flags & TB_FLAG_ENVFLAGS_MASK;
 }
 
@@ -73,7 +75,7 @@ static bool superh_io_recompile_replay_branch(CPUState *cs,
     CPUSH4State *env = &cpu->env;
 
     if ((env->flags & (TB_FLAG_DELAY_SLOT | TB_FLAG_DELAY_SLOT_COND))
-        && env->pc != tb_pc(tb)) {
+        && !(cs->tcg_cflags & CF_PCREL) && env->pc != tb->pc) {
         env->pc -= 2;
         env->flags &= ~(TB_FLAG_DELAY_SLOT | TB_FLAG_DELAY_SLOT_COND);
         return true;
-- 
2.39.1


