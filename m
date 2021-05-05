Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BF9373FC7
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 18:28:14 +0200 (CEST)
Received: from localhost ([::1]:57728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leKNh-0003nE-DV
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 12:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK3B-0005o8-JH
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:07:01 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:33561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK38-0002RY-Ie
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:07:01 -0400
Received: by mail-pl1-x62e.google.com with SMTP id b21so1377784plz.0
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 09:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wePUkznvqDAplSu8QKzHNZAMfJiYsvqTtqdR4ZV7jAU=;
 b=AYWEzld04tyNvjG6tMxM7psqWmSzUortEGUmvYHhhBlDuGbDNcPptVBE5QxGB/1Xns
 C7WovMYaoUUifFxsTVj5fO74WgpL79H+0WXoTvKgrM3xs1jFMGuafDP3YXxUGQ/qFAkm
 e54UC/8pvVm6I7uN6i5NLaaSiFfnkiCnz3hwUUwcKg//9KzyTb1h+HcIYArS9p1Ehprm
 gcOJnQgJ2mp165l3mMyHE/zvqcyOj9FXv01dh+Q3Euj2mbKummZ96OPWaZOojtLl/Tlq
 5tPuSD3n+iBJD4GNAYZJFGSgvMIe0YM+iRFkpqAqBmbny+tOXXR6E7QJ7CM46yNmZpqe
 ruKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=wePUkznvqDAplSu8QKzHNZAMfJiYsvqTtqdR4ZV7jAU=;
 b=gbm8aSaH/dOWe91t3zls3LnQg4DzvEMDI93RBeicGPMgJJgXVNAuuxQhReHCFis7Vj
 DsQ2kw8M8bVDABUfGmln3YGcVUmOvsTBVN/YyLCvSKE3Xwp07rGaI6BJzWUTWW8wqwyy
 +WyuioSTUPgyqJFtCoyMtHOO4kxtjarVjQx6kwryb+Rj0xbZMCe4qftXcqcXJpxbeRrK
 FyMZVlQ2H13UM+7e+MuAWFK8ARiRd4EkbF5Zd+/9viijZiByopnOZ9vLSqxe2kRQV8DR
 de4DSk17Zq9zTMcOpWkcm/WleFRKhFsoNmmMUjWJEnyGEU5mW6TnKavrLTMGx7b/w+//
 5DLg==
X-Gm-Message-State: AOAM530IlBsEi+T0NBRhNBd2lh1IChfo84+GidUFTylo2mvzkl2BzEzq
 FRMwPfTKpQkOBRvP3q/z8xKIsRHovZqn594C
X-Google-Smtp-Source: ABdhPJzYyTXvCYKC7Ifd9bjf8JxliudtfCeknQWWwviT977eb43TdeVq1J1hLggCtbMNPc0+m7cX0Q==
X-Received: by 2002:a17:90a:b78d:: with SMTP id
 m13mr12701606pjr.47.1620230815933; 
 Wed, 05 May 2021 09:06:55 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id js6sm35877977pjb.0.2021.05.05.09.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 09:06:55 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 08/17] target/riscv: add gen_shifti() and gen_shiftiw()
 helper functions
Date: Thu,  6 May 2021 00:06:09 +0800
Message-Id: <20210505160620.15723-9-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210505160620.15723-1-frank.chang@sifive.com>
References: <20210505160620.15723-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Add gen_shifti() and gen_shiftiw() helper functions to reuse the same
interfaces for immediate shift instructions.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 54 ++-----------------------
 target/riscv/translate.c                | 39 ++++++++++++++++++
 2 files changed, 43 insertions(+), 50 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index bd93f634cf0..6e736c9d0d1 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -268,54 +268,17 @@ static bool trans_andi(DisasContext *ctx, arg_andi *a)
 }
 static bool trans_slli(DisasContext *ctx, arg_slli *a)
 {
-    if (a->shamt >= TARGET_LONG_BITS) {
-        return false;
-    }
-
-    if (a->rd != 0) {
-        TCGv t = tcg_temp_new();
-        gen_get_gpr(t, a->rs1);
-
-        tcg_gen_shli_tl(t, t, a->shamt);
-
-        gen_set_gpr(a->rd, t);
-        tcg_temp_free(t);
-    } /* NOP otherwise */
-    return true;
+    return gen_shifti(ctx, a, tcg_gen_shl_tl);
 }
 
 static bool trans_srli(DisasContext *ctx, arg_srli *a)
 {
-    if (a->shamt >= TARGET_LONG_BITS) {
-        return false;
-    }
-
-    if (a->rd != 0) {
-        TCGv t = tcg_temp_new();
-        gen_get_gpr(t, a->rs1);
-
-        tcg_gen_shri_tl(t, t, a->shamt);
-        gen_set_gpr(a->rd, t);
-        tcg_temp_free(t);
-    } /* NOP otherwise */
-    return true;
+    return gen_shifti(ctx, a, tcg_gen_shr_tl);
 }
 
 static bool trans_srai(DisasContext *ctx, arg_srai *a)
 {
-    if (a->shamt >= TARGET_LONG_BITS) {
-        return false;
-    }
-
-    if (a->rd != 0) {
-        TCGv t = tcg_temp_new();
-        gen_get_gpr(t, a->rs1);
-
-        tcg_gen_sari_tl(t, t, a->shamt);
-        gen_set_gpr(a->rd, t);
-        tcg_temp_free(t);
-    } /* NOP otherwise */
-    return true;
+    return gen_shifti(ctx, a, tcg_gen_sar_tl);
 }
 
 static bool trans_add(DisasContext *ctx, arg_add *a)
@@ -377,16 +340,7 @@ static bool trans_addiw(DisasContext *ctx, arg_addiw *a)
 static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
 {
     REQUIRE_64BIT(ctx);
-    TCGv source1;
-    source1 = tcg_temp_new();
-    gen_get_gpr(source1, a->rs1);
-
-    tcg_gen_shli_tl(source1, source1, a->shamt);
-    tcg_gen_ext32s_tl(source1, source1);
-    gen_set_gpr(a->rd, source1);
-
-    tcg_temp_free(source1);
-    return true;
+    return gen_shiftiw(ctx, a, tcg_gen_shl_tl);
 }
 
 static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 5f1a3c694fe..292cf09932d 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -652,6 +652,45 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
     return cpu_ldl_code(env, pc);
 }
 
+static bool gen_shifti(DisasContext *ctx, arg_shift *a,
+                       void(*func)(TCGv, TCGv, TCGv))
+{
+    if (a->shamt >= TARGET_LONG_BITS) {
+        return false;
+    }
+
+    TCGv source1 = tcg_temp_new();
+    TCGv source2 = tcg_temp_new();
+
+    gen_get_gpr(source1, a->rs1);
+
+    tcg_gen_movi_tl(source2, a->shamt);
+    (*func)(source1, source1, source2);
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    tcg_temp_free(source2);
+    return true;
+}
+
+static bool gen_shiftiw(DisasContext *ctx, arg_shift *a,
+                        void(*func)(TCGv, TCGv, TCGv))
+{
+    TCGv source1 = tcg_temp_new();
+    TCGv source2 = tcg_temp_new();
+
+    gen_get_gpr(source1, a->rs1);
+    tcg_gen_movi_tl(source2, a->shamt);
+
+    (*func)(source1, source1, source2);
+    tcg_gen_ext32s_tl(source1, source1);
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    tcg_temp_free(source2);
+    return true;
+}
+
 static void gen_ctz(TCGv ret, TCGv arg1)
 {
     tcg_gen_ctzi_tl(ret, arg1, TARGET_LONG_BITS);
-- 
2.17.1


