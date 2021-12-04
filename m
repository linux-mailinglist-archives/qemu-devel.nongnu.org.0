Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A604684B2
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 13:15:04 +0100 (CET)
Received: from localhost ([::1]:44606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtTwV-0007Wq-K7
	for lists+qemu-devel@lfdr.de; Sat, 04 Dec 2021 07:15:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mtTpX-0007Ty-Uj
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 07:07:52 -0500
Received: from mail.loongson.cn ([114.242.206.163]:58092 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mtTpV-0003GT-OZ
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 07:07:51 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axysj9Wath8+ECAA--.6122S14; 
 Sat, 04 Dec 2021 20:07:36 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 12/27] target/loongarch: Add timer related instructions
 support.
Date: Sat,  4 Dec 2021 20:07:10 +0800
Message-Id: <1638619645-11283-13-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9Axysj9Wath8+ECAA--.6122S14
X-Coremail-Antispam: 1UD129KBjvJXoWxGry8KFyUArW5Zr13tFyDAwb_yoW5Xw47pa
 1Ikr45KFW8tFWfXayfJ3WYgr98X3WxKrW2qa9av395CF43Jw4DZr10g3sIkFy5Xa4DXrW2
 vF4kAw17uF4UX3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 philmd@redhat.com, i.qemu@xen0n.name, mark.cave-ayland@ilande.co.uk,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, maobibo@loongson.cn,
 pbonzini@redhat.com, richard.henderson@linaro.org, alex.bennee@linaro.org,
 gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This includes:
-RDTIME{L/H}.W
-RDTIME.D

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/helper.h                     |  1 +
 target/loongarch/insn_trans/trans_extra.c.inc | 32 +++++++++++++++++++
 target/loongarch/translate.c                  |  2 ++
 3 files changed, 35 insertions(+)

diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index c916f2650b..035bd141ed 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -116,4 +116,5 @@ DEF_HELPER_4(lddir, tl, env, tl, tl, i32)
 DEF_HELPER_4(ldpte, void, env, tl, tl, i32)
 DEF_HELPER_1(ertn, void, env)
 DEF_HELPER_1(idle, void, env)
+DEF_HELPER_1(rdtime_d, i64, env)
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/loongarch/insn_trans/trans_extra.c.inc b/target/loongarch/insn_trans/trans_extra.c.inc
index 2ce95d3382..8d3425ba61 100644
--- a/target/loongarch/insn_trans/trans_extra.c.inc
+++ b/target/loongarch/insn_trans/trans_extra.c.inc
@@ -33,22 +33,54 @@ static bool trans_asrtgt_d(DisasContext *ctx, arg_asrtgt_d * a)
     return true;
 }
 
+#ifndef CONFIG_USER_ONLY
+static bool gen_rdtime(DisasContext *ctx, arg_rr *a,
+                       bool word, bool high)
+{
+    TCGv dst1 = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv dst2 = gpr_dst(ctx, a->rj, EXT_NONE);
+
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_rdtime_d(dst1, cpu_env);
+    if (word) {
+        tcg_gen_sextract_tl(dst1, dst1, high ? 32 : 0, 32);
+    }
+    tcg_gen_ld_i64(dst2, cpu_env, offsetof(CPULoongArchState, CSR_TID));
+
+    return true;
+}
+#endif
+
 static bool trans_rdtimel_w(DisasContext *ctx, arg_rdtimel_w *a)
 {
+#ifdef CONFIG_USER_ONLY
     tcg_gen_movi_tl(cpu_gpr[a->rd], 0);
     return true;
+#else
+    return gen_rdtime(ctx, a, 1, 0);
+#endif
 }
 
 static bool trans_rdtimeh_w(DisasContext *ctx, arg_rdtimeh_w *a)
 {
+#ifdef CONFIG_USER_ONLY
     tcg_gen_movi_tl(cpu_gpr[a->rd], 0);
     return true;
+#else
+    return gen_rdtime(ctx, a, 1, 1);
+#endif
 }
 
 static bool trans_rdtime_d(DisasContext *ctx, arg_rdtime_d *a)
 {
+#ifdef CONFIG_USER_ONLY
     tcg_gen_movi_tl(cpu_gpr[a->rd], 0);
     return true;
+#else
+    return gen_rdtime(ctx, a, 0, 0);
+#endif
 }
 
 static bool trans_cpucfg(DisasContext *ctx, arg_cpucfg *a)
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index ddb97661fa..53a5ef3aa9 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -25,6 +25,8 @@ static TCGv cpu_lladdr, cpu_llval;
 TCGv_i32 cpu_fcsr0;
 TCGv_i64 cpu_fpr[32];
 
+#include "exec/gen-icount.h"
+
 #define DISAS_STOP       DISAS_TARGET_0
 #define DISAS_EXIT       DISAS_TARGET_1
 
-- 
2.27.0


