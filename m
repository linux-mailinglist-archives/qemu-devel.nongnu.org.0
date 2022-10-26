Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5127C60D947
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:28:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVug-0005Lb-Bw; Tue, 25 Oct 2022 22:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVue-0005LP-Ly
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:13:00 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVud-0001Id-1Z
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:13:00 -0400
Received: by mail-pf1-x42b.google.com with SMTP id w189so12451577pfw.4
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0+3o4CPyuPVVmOjPMArLfsmwt3aY6U6qlMjvebtFZz8=;
 b=esPd9jbFujhkaxobtQp6bEVZVR6dAVCcyykvRMl9S/Gpj0rVWgoJ/D2Hjmby3GfmNV
 g9LiXVhmp/++yK+cpZrLKZaQBtkGTtvSipM2mpbbmiPo0DYQ43USe3U9ZOFlEKDbUQ4i
 4Z+NhuSYlmK7Nj0Dz8aAqHXWWuOjToPpRkmCUQ0xkM0oBawYah83eXZuuT/zZmzhZapd
 RVfTCqkD4zlIbPklc8w/pxmLH1KxTqp7RyraVtgszSxs+YNjgvGiX7tQs2+43LuQRKuy
 EiRFvX4nXacr7YXVbmB6qgcY9aWjHSJ3yWfkCmfw1YT/FpxV3huO1ts/habd7a9yU2D2
 fSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0+3o4CPyuPVVmOjPMArLfsmwt3aY6U6qlMjvebtFZz8=;
 b=iwavg3tImtw7By3oluRwzdlXabU3is2xATukxi0hk6fiNB+XPvCsJ8GyiRwEw5ns3C
 IVzYoNroaRubrXxcihHlH8/03S4HzWq3TwPySeDALnV8IdUjPUMz/5q5BR6K94nWvVbV
 opjJdg86hfyT2JUeedzT9D4M4QTPF6iOzcEl5d9L8v1Y3qKIregrFupk1Q8dvrMkVWV5
 9wcbMxPtTJsr0nnmuoHpwYbo1E0nUS8EVes7tcrIj4lH+4uIXRG03Z87O7E2hMFyzN2t
 riIitKmUnmR2PcWeLvC1W0GYgOcFbETcN4iey8u+CKuQLnOphR2dnVe93R4cAknSwsWt
 u+mQ==
X-Gm-Message-State: ACrzQf3hcMRbXN9SkV6BlvjgpDM8FNwoWDNjfC1KDV+E+N6dFpqmE32/
 lajh8K0bIMF6iFoOWjtg43bghm5RgJGrAPRN
X-Google-Smtp-Source: AMsMyM4h34VWEF1jCmlat9CeR0zXZBCoPB3iLLCSHXZr/stm+06LgATltFbNbo8w0f4EjqB9FS10EQ==
X-Received: by 2002:a63:2ac9:0:b0:457:24a2:6fa7 with SMTP id
 q192-20020a632ac9000000b0045724a26fa7mr34535424pgq.484.1666750377623; 
 Tue, 25 Oct 2022 19:12:57 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:12:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 34/47] target/m68k: Convert to tcg_ops restore_state_to_opc
Date: Wed, 26 Oct 2022 12:11:03 +1000
Message-Id: <20221026021116.1988449-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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


