Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F8A433008
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 09:47:08 +0200 (CEST)
Received: from localhost ([::1]:33748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcjpy-0004V7-AP
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 03:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mcjfC-0001nM-ED
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:35:59 -0400
Received: from mail.loongson.cn ([114.242.206.163]:35008 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mcjf9-0004YK-OV
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:35:58 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP2s1dW5h3HwcAA--.43474S14; 
 Tue, 19 Oct 2021 15:35:37 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/31] target/loongarch: Add timer related instructions
 support.
Date: Tue, 19 Oct 2021 15:34:58 +0800
Message-Id: <1634628917-10031-13-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9DxP2s1dW5h3HwcAA--.43474S14
X-Coremail-Antispam: 1UD129KBjvJXoWxGryUAryxWryxAr4UXrW7twb_yoW5KFWrpF
 42krWUGrWUKrZ3XayfJws0grn8Xa18Kw4Iqa9ayw4rCF47XwnFvF10q3sIkFy5Jw1kWrya
 vFs5A34DGF47X3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 mst@redhat.com, philmd@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, maobibo@loongson.cn,
 gaosong@loongson.cn, pbonzini@redhat.com, mark.cave-ayland@ilande.co.uk,
 bmeng.cn@gmail.com, alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This includes:
-RDTIME{L/H}.W
-RDTIME.D

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/helper.h                 |  2 ++
 target/loongarch/insn_trans/trans_core.c  | 23 +++++++++++++++++++++
 target/loongarch/insn_trans/trans_extra.c |  2 ++
 target/loongarch/op_helper.c              | 25 +++++++++++++++++++++++
 4 files changed, 52 insertions(+)

diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 8544771790..b4ed62896f 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -116,4 +116,6 @@ DEF_HELPER_4(lddir, tl, env, tl, tl, i32)
 DEF_HELPER_4(ldpte, void, env, tl, tl, i32)
 DEF_HELPER_1(ertn, void, env)
 DEF_HELPER_1(idle, void, env)
+DEF_HELPER_4(rdtime_w, void, env, tl, tl, i64)
+DEF_HELPER_3(rdtime_d, void, env, tl, tl)
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/loongarch/insn_trans/trans_core.c b/target/loongarch/insn_trans/trans_core.c
index 7fa13e65b9..24eb12b97a 100644
--- a/target/loongarch/insn_trans/trans_core.c
+++ b/target/loongarch/insn_trans/trans_core.c
@@ -276,4 +276,27 @@ static bool trans_idle(DisasContext *ctx, arg_idle *a)
     return true;
 }
 
+static bool trans_rdtimel_w(DisasContext *ctx, arg_rdtimel_w *a)
+{
+    TCGv t0 = tcg_constant_tl(a->rd);
+    TCGv t1 = tcg_constant_tl(a->rj);
+    gen_helper_rdtime_w(cpu_env, t0, t1, tcg_constant_tl(0));
+    return true;
+}
+
+static bool trans_rdtimeh_w(DisasContext *ctx, arg_rdtimeh_w *a)
+{
+    TCGv t0 = tcg_constant_tl(a->rd);
+    TCGv t1 = tcg_constant_tl(a->rj);
+    gen_helper_rdtime_w(cpu_env, t0, t1, tcg_constant_tl(1));
+    return true;
+}
+
+static bool trans_rdtime_d(DisasContext *ctx, arg_rdtime_d *a)
+{
+    TCGv t0 = tcg_constant_tl(a->rd);
+    TCGv t1 = tcg_constant_tl(a->rj);
+    gen_helper_rdtime_d(cpu_env, t0, t1);
+    return true;
+}
 #endif
diff --git a/target/loongarch/insn_trans/trans_extra.c b/target/loongarch/insn_trans/trans_extra.c
index 8da3b404f3..426b67f154 100644
--- a/target/loongarch/insn_trans/trans_extra.c
+++ b/target/loongarch/insn_trans/trans_extra.c
@@ -36,6 +36,7 @@ static bool trans_asrtgt_d(DisasContext *ctx, arg_asrtgt_d * a)
     return true;
 }
 
+#ifdef CONFIG_USER_ONLY
 static bool trans_rdtimel_w(DisasContext *ctx, arg_rdtimel_w *a)
 {
     tcg_gen_movi_tl(cpu_gpr[a->rd], 0);
@@ -53,6 +54,7 @@ static bool trans_rdtime_d(DisasContext *ctx, arg_rdtime_d *a)
     tcg_gen_movi_tl(cpu_gpr[a->rd], 0);
     return true;
 }
+#endif
 
 static bool trans_cpucfg(DisasContext *ctx, arg_cpucfg *a)
 {
diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
index 4547880c8f..41b1ec2f1b 100644
--- a/target/loongarch/op_helper.c
+++ b/target/loongarch/op_helper.c
@@ -130,4 +130,29 @@ void helper_idle(CPULoongArchState *env)
     do_raise_exception(env, EXCP_HLT, 0);
 }
 
+void helper_rdtime_w(CPULoongArchState *env, target_ulong rd,
+                     target_ulong rj, target_ulong high)
+{
+    if (rd) {
+        if (high) {
+            env->gpr[rd] = cpu_loongarch_get_stable_counter(env) >> 32;
+        } else {
+            env->gpr[rd] = cpu_loongarch_get_stable_counter(env) & 0xffffffff;
+        }
+    }
+    if (rj) {
+        env->gpr[rj] = env->CSR_TMID;
+    }
+}
+
+void helper_rdtime_d(CPULoongArchState *env, target_ulong rd, target_ulong rj)
+{
+    if (rd) {
+        env->gpr[rd] = cpu_loongarch_get_stable_counter(env);
+    }
+    if (rj) {
+        env->gpr[rj] = env->CSR_TMID;
+    }
+}
+
 #endif /* !CONFIG_USER_ONLY */
-- 
2.27.0


