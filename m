Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DD960ADF6
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 16:42:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxSd-0003MB-UJ; Mon, 24 Oct 2022 09:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSW-0003I3-KL
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:41 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSU-00040G-9f
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:39 -0400
Received: by mail-pl1-x631.google.com with SMTP id p6so8427309plr.7
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DjUS+tQaX/U5U5rcl8RyljhouuNX2K7mx9ij2CFhI3s=;
 b=wLo+IZiHcupTAxZy7izbaHOT8SpjbHOupkwvcbsJP+w+8dI15gOqpN8rBq3KmQCHFT
 OARmniC4eDu+uTI35k+8Zvl3lf2uKh+/MhfcWjSInnt3XQ0fgXy1lKO92fsHVSCaTCGT
 x1af5nhDX5gG/0xVUtIdkURvyI3tRZ4tHETVlzplch67c1xSZrS4NpLwaxG6W6YGQ+Sw
 3VTbni3OBBF/7OWFvwWUZQj4RrIX0pqe6hByx7HT7Q3cIe+3zDA6HrxeVOPM+19AC6ER
 nJ/NY9q+7pFrpON5g0kw2rZRZEKRUnV9+U+11jXhMOLSMBQFfBBU44+7dBFXyclhhXR7
 7gng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DjUS+tQaX/U5U5rcl8RyljhouuNX2K7mx9ij2CFhI3s=;
 b=mqtUZQiGJKKt7dZFU/zXaN2d8kPC2fzhhrZOUZTiFTUc+BeD2w5LucTenVTYVdxZdX
 Pjzxw4wTUe6CcHHCCXpQMurFAD+u16tTkmS7GtTbAhJjayjnf6BYhlKNrI5BYXmIzLYj
 favw8HXImeLPG19CS9oisbMpVY3fYQ73isIAs6ZAftiEwa23w/W5kKMCtFveCG3MNwtH
 EYwVFQ64hxcQgUZ2fh2AZ9qWwcgOD1LGI/KA0DXUrRssVmrDzKjJxx9+Z9YeOVb5ujCH
 rNV12YUjiFyqWG39f1XQbRbwAbowYMLEN/XO9HkZlRlXFuPunhyN+bbFMZLI0+17Nvh0
 1Mig==
X-Gm-Message-State: ACrzQf2Olj5q97MlSlHvLC3HEIuQjYtwbmi7uHJLPPKaSlhmHio66oPd
 Ku4xXpnnFjxGH2iujz5sgAa8pzNz/82orA==
X-Google-Smtp-Source: AMsMyM5OkpazQwZLIdiJ3/sTLthp+YoemZo5XJcD9Ki7ru7nXWs7hX1hesbuFYLWgqrWxKZyvaSzlw==
X-Received: by 2002:a17:902:6bcc:b0:182:df88:e6c8 with SMTP id
 m12-20020a1709026bcc00b00182df88e6c8mr33739025plt.117.1666617936758; 
 Mon, 24 Oct 2022 06:25:36 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 b12-20020a1709027e0c00b00178ab008364sm17009216plm.37.2022.10.24.06.25.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:25:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/29] target/m68k: Convert to tcg_ops restore_state_to_opc
Date: Mon, 24 Oct 2022 23:24:40 +1000
Message-Id: <20221024132459.3229709-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024132459.3229709-1-richard.henderson@linaro.org>
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
 target/m68k/cpu.c       | 14 ++++++++++++++
 target/m68k/translate.c | 10 ----------
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 1e902e1ef0..b67ddea2ae 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -38,6 +38,19 @@ static vaddr m68k_cpu_get_pc(CPUState *cs)
     return cpu->env.pc;
 }
 
+static void m68k_restore_state_to_opc(CPUState *cs,
+                                      const TranslationBlock *tb,
+                                      const uint64_t *data)
+{
+    M68kCPU *cpu = M68K_CPU(cs);
+    int cc_op = data[1];
+
+    cpu->env.pc = data[0];
+    if (cc_op != CC_OP_DYNAMIC) {
+        cpu->env.cc_op = cc_op;
+    }
+}
+
 static bool m68k_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & CPU_INTERRUPT_HARD;
@@ -524,6 +537,7 @@ static const struct SysemuCPUOps m68k_sysemu_ops = {
 
 static const struct TCGCPUOps m68k_tcg_ops = {
     .initialize = m68k_tcg_init,
+    .restore_state_to_opc = m68k_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = m68k_cpu_tlb_fill,
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 9df17aa4b2..5cbde4be34 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -6479,13 +6479,3 @@ void m68k_cpu_dump_state(CPUState *cs, FILE *f, int flags)
                  env->mmu.mmusr, env->mmu.ar);
 #endif
 }
-
-void restore_state_to_opc(CPUM68KState *env, TranslationBlock *tb,
-                          target_ulong *data)
-{
-    int cc_op = data[1];
-    env->pc = data[0];
-    if (cc_op != CC_OP_DYNAMIC) {
-        env->cc_op = cc_op;
-    }
-}
-- 
2.34.1


