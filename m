Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB686A436C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 14:55:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWdvz-0007Af-5Z; Mon, 27 Feb 2023 08:52:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pWdvj-0006fO-Ib
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:52:41 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pWdvh-0005bx-Gi
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:52:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hX9/YKsQ4j6T1JjXyBlpYPGSwqE1znAM6AzbbheVXwc=; b=h7OVsqOjgTs651K20+YLvD7Z3s
 TNvuWPsPl/rMjp4DPoDAGIO7XaHoUL3SSOsWJpuYeb6FOrdC7Ari3opGCo81Tjy45jgJOkffTzJBI
 iYb8yVGBO5AsERhHjY98UW20bEuDDu/ZSz3VgxTBI4xn3XVi7v1rL8NVGmsacFGZImyc=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, peter.maydell@linaro.org, mrolnik@gmail.com,
 tsimpson@quicinc.com, gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 edgar.iglesias@gmail.com, philmd@linaro.org, shorne@gmail.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk,
 atar4qemu@gmail.com, kbastian@mail.uni-paderborn.de
Subject: [PATCH v3 19/27] target/mips: Replace `tb_pc()` with `tb->pc`
Date: Mon, 27 Feb 2023 14:51:54 +0100
Message-Id: <20230227135202.9710-20-anjo@rev.ng>
In-Reply-To: <20230227135202.9710-1-anjo@rev.ng>
References: <20230227135202.9710-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/mips/tcg/exception.c             | 3 ++-
 target/mips/tcg/sysemu/special_helper.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/mips/tcg/exception.c b/target/mips/tcg/exception.c
index 96e61170e6..da49a93912 100644
--- a/target/mips/tcg/exception.c
+++ b/target/mips/tcg/exception.c
@@ -82,7 +82,8 @@ void mips_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb)
     MIPSCPU *cpu = MIPS_CPU(cs);
     CPUMIPSState *env = &cpu->env;
 
-    env->active_tc.PC = tb_pc(tb);
+    tcg_debug_assert(!(cs->tcg_cflags & CF_PCREL));
+    env->active_tc.PC = tb->pc;
     env->hflags &= ~MIPS_HFLAG_BMASK;
     env->hflags |= tb->flags & MIPS_HFLAG_BMASK;
 }
diff --git a/target/mips/tcg/sysemu/special_helper.c b/target/mips/tcg/sysemu/special_helper.c
index 3c5f35c759..93276f789d 100644
--- a/target/mips/tcg/sysemu/special_helper.c
+++ b/target/mips/tcg/sysemu/special_helper.c
@@ -94,7 +94,7 @@ bool mips_io_recompile_replay_branch(CPUState *cs, const TranslationBlock *tb)
     CPUMIPSState *env = &cpu->env;
 
     if ((env->hflags & MIPS_HFLAG_BMASK) != 0
-        && env->active_tc.PC != tb_pc(tb)) {
+        && !(cs->tcg_cflags & CF_PCREL) && env->active_tc.PC != tb->pc) {
         env->active_tc.PC -= (env->hflags & MIPS_HFLAG_B16 ? 2 : 4);
         env->hflags &= ~MIPS_HFLAG_BMASK;
         return true;
-- 
2.39.1


