Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3795460D92F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:20:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVuT-0005Jb-F5; Tue, 25 Oct 2022 22:12:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVuR-0005JJ-Ca
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:47 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVuP-0001H5-OD
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:47 -0400
Received: by mail-pf1-x42f.google.com with SMTP id b29so9472464pfp.13
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4pnG9nOOACtBusrxYRYQuNOIosZyxdgNQde/unc31MM=;
 b=brrLRU6SxVkIXxiMhygDlEsebZ26z5l0UDjLL8oKrsqmJVQA61YjQ4v85bj+YoGOh2
 NlFVp2XdvmFk9ZDivGQBx46ocNeFvGR92rjW2inUdOl0WpxoFRcBiKYcIXUmS/h68Nlx
 lNuGTuwHFDEJAJ8mFd4eejuPKE1WgHs9R90lXWeuWjjIx3cL04Zc7qzyBk1ltM7CIsbn
 kf/a1qcK5A3wlHroZVXapnRftjT7RBxF5VJXQk8MLKR7oiXLk8JZoSs/N6DFgnwaerrF
 r+wJP2pFf04E6hxZ5ZxF0Y3NjpdCdD4JYpys65JHXPZXr/NuDWyYPoR35uIuzqUp2wiV
 8icg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4pnG9nOOACtBusrxYRYQuNOIosZyxdgNQde/unc31MM=;
 b=gqYXPmjspUUGFGdrnK9ZzI5PkEiMduSlKYwJQUOzuQ2p18Qjou0akWMgujUwAMqOt6
 wRgpWvfXfJWjwyn+dHOJljlUiqxRH6eJuu/pSYpZJA07KmEBqrMWEUQ95CBJRf3ksuaL
 Ll/qlLC9Alp99+8DZuNRy9qAHD4K5YtryJNw+9c0f4IFmAwXvUMuHP4tEFkhRNA/shpJ
 rEVV2V8paZT4LRq/TlrIpj4Q13KBvG8wH1m6cWP5SBSyq4lEXqb069yJDBTlErpt/R74
 u1JXDpwCL2wf40IL//943Q5pm+/oJGnGpBR7m3mVz1F0vTAw5TbfBbzvt1TdJjdFDeTg
 Ie2Q==
X-Gm-Message-State: ACrzQf1smYIFUgQdR6kXZAfxoezcyJNgmnrGkZV3oTnFmI7Orf0st4XI
 fwm4IIA0N2olf+CLZdaqxjiZuDFYXqSY6ssF
X-Google-Smtp-Source: AMsMyM6Br16z3++YfR6wL12kQMxxI9SSH3dAOxbwuC6hxjrBdmICfkHcNVAAc+bgy9l62j/LJtfE+w==
X-Received: by 2002:a65:6849:0:b0:461:8779:2452 with SMTP id
 q9-20020a656849000000b0046187792452mr34181323pgt.383.1666750364356; 
 Tue, 25 Oct 2022 19:12:44 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:12:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 29/47] target/cris: Convert to tcg_ops restore_state_to_opc
Date: Wed, 26 Oct 2022 12:10:58 +1000
Message-Id: <20221026021116.1988449-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/cpu.c       | 11 +++++++++++
 target/cris/translate.c |  6 ------
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index 22f5c70f39..fb05dc6f9a 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -42,6 +42,15 @@ static vaddr cris_cpu_get_pc(CPUState *cs)
     return cpu->env.pc;
 }
 
+static void cris_restore_state_to_opc(CPUState *cs,
+                                      const TranslationBlock *tb,
+                                      const uint64_t *data)
+{
+    CRISCPU *cpu = CRIS_CPU(cs);
+
+    cpu->env.pc = data[0];
+}
+
 static bool cris_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
@@ -212,6 +221,7 @@ static const struct SysemuCPUOps cris_sysemu_ops = {
 
 static const struct TCGCPUOps crisv10_tcg_ops = {
     .initialize = cris_initialize_crisv10_tcg,
+    .restore_state_to_opc = cris_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = cris_cpu_tlb_fill,
@@ -222,6 +232,7 @@ static const struct TCGCPUOps crisv10_tcg_ops = {
 
 static const struct TCGCPUOps crisv32_tcg_ops = {
     .initialize = cris_initialize_tcg,
+    .restore_state_to_opc = cris_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = cris_cpu_tlb_fill,
diff --git a/target/cris/translate.c b/target/cris/translate.c
index 73385b0b3c..fbc3fd5865 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -3392,9 +3392,3 @@ void cris_initialize_tcg(void)
                                        pregnames_v32[i]);
     }
 }
-
-void restore_state_to_opc(CPUCRISState *env, TranslationBlock *tb,
-                          target_ulong *data)
-{
-    env->pc = data[0];
-}
-- 
2.34.1


