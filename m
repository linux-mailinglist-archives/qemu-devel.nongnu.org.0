Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3EA60ABDA
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 15:58:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxSM-0003Ff-Nt; Mon, 24 Oct 2022 09:25:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSE-0003An-PQ
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:22 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSC-0003t2-9G
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:22 -0400
Received: by mail-pg1-x532.google.com with SMTP id r18so8645268pgr.12
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0UCoUPLv3ntqcifgo697/PAVDN0P+KgeFmYU7ktGgGc=;
 b=kH18ber5jNapujDs33qIM90AOMZzxNcHPzhBfNgvan1by2Vf02GTanAZXD9LaS/VXI
 UgoAIAOWRWcLbtQLl4LtmHtewvsIzq3Kyz14cHPT95dMmueYLor7FGU41QXD+7PraSXB
 6IBunH1/j5AR8lmy4pIStq/9bcLA1H1M9s0DWH5fD8IvB+O+45oQTaPZGonJzeyoZ6Cb
 4YCgrL1bnAtYJ7V+EP/wy5JH+9e3K9QVEITwyxdgKZ9643dAVgmg2ViO7RmDrkLJuj0N
 NZPW6g09PxXvUDzzTYhFniRQ/UNa4Z2GJbdGX8P+Yf7HnC/NtsPplWt3ttjRw6jaIAj0
 IHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0UCoUPLv3ntqcifgo697/PAVDN0P+KgeFmYU7ktGgGc=;
 b=nezwHZd/b6/LjGbhJ+nr22epU5SYCv4dJMSVZD768wfKQanFc0tjesfxKqXzqMV3fT
 maHuljy+CUSUUqvr9eo/B5r19J0YOX/st0JK1IQJTgdS679de9BzYrI4xUpWE905g6+e
 e/AD833KwvLueDq3VrKXFuCNj/ye6QWCslfzyjVJn60AFuuV20i9hgSF8XID4wCjICZK
 AhBpsmDuF9upwDnu+5JL5Io9zT56gN57aJd17g4Ehr1HDNiKWSFvZmijmZKKSQ8zZMkp
 81GjGDOJTTu80Ic7qPpuP1DBdyKfNGBoF7wQaLvl/fjRP5FuwRIHDfSM3DNFdKeF38vm
 pb1Q==
X-Gm-Message-State: ACrzQf0N2WzGc23z2hNhw9t4o3jGwjDPiof1uKeLL1R1VSRj4G9vW+CQ
 e2bSyUesNV303ybZiWaAgyJqePhKhGohZw==
X-Google-Smtp-Source: AMsMyM4qscdCXlUIB5tufygm8JuDcGlcLvMlgJCTEjthcqb4H8denSusMMChVcQOugvxgRpMK4HHLw==
X-Received: by 2002:a05:6a00:1707:b0:562:e790:dfc3 with SMTP id
 h7-20020a056a00170700b00562e790dfc3mr33658547pfc.59.1666617916969; 
 Mon, 24 Oct 2022 06:25:16 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 b12-20020a1709027e0c00b00178ab008364sm17009216plm.37.2022.10.24.06.25.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:25:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/29] target/alpha: Convert to tcg_ops restore_state_to_opc
Date: Mon, 24 Oct 2022 23:24:32 +1000
Message-Id: <20221024132459.3229709-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024132459.3229709-1-richard.henderson@linaro.org>
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/cpu.c       | 9 +++++++++
 target/alpha/translate.c | 6 ------
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 979a629d59..270ae787b1 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -40,6 +40,14 @@ static vaddr alpha_cpu_get_pc(CPUState *cs)
     return cpu->env.pc;
 }
 
+static void alpha_restore_state_to_opc(CPUState *cs,
+                                       const TranslationBlock *tb,
+                                       const uint64_t *data)
+{
+    AlphaCPU *cpu = ALPHA_CPU(cs);
+
+    cpu->env.pc = data[0];
+}
 
 static bool alpha_cpu_has_work(CPUState *cs)
 {
@@ -226,6 +234,7 @@ static const struct SysemuCPUOps alpha_sysemu_ops = {
 
 static const struct TCGCPUOps alpha_tcg_ops = {
     .initialize = alpha_translate_init,
+    .restore_state_to_opc = alpha_restore_state_to_opc,
 
 #ifdef CONFIG_USER_ONLY
     .record_sigsegv = alpha_cpu_record_sigsegv,
diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 6766350f56..f9bcdeb717 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -3049,9 +3049,3 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns,
     DisasContext dc;
     translator_loop(cpu, tb, max_insns, pc, host_pc, &alpha_tr_ops, &dc.base);
 }
-
-void restore_state_to_opc(CPUAlphaState *env, TranslationBlock *tb,
-                          target_ulong *data)
-{
-    env->pc = data[0];
-}
-- 
2.34.1


