Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F18FC60D91C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:15:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVua-0005Ki-9p; Tue, 25 Oct 2022 22:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVuZ-0005Ka-2i
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:55 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVuX-0001I1-GB
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:54 -0400
Received: by mail-pf1-x42c.google.com with SMTP id k22so2219873pfd.3
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sCi48ZqO6AkPMJ+ZyF18T2s297T/4zk3YpQYq8qyJcQ=;
 b=MRRBpFJLTkB1PUXL4scR8hNxrtJjCJfIAmF5CzC95ImTIe2BoE818XksIAjNPMWRy9
 clxQgb/nkMp7AcwdSq6ChaJAI1/Wg1GwmvBTx0g41Wv6FkRKaVCbdeP52QDo7vQrsPbo
 xXY4ivL3Kuc0ng9J2uLsyNLng7eZ41siFWWlAExe46X8LpOOF0e9Pst7uKscyedo6td6
 NH1aC7jNAOfpCCC/T/6YuAeAk9hjAS2ifzaVNgukPg6hDntuIHrFNxWBcb+HYYj7WkOG
 7yB6kzvOAR5zK0cdAA5UbynCI+Rnz/7ryWbInbLTLBIm83PhtI1ZvF+Qdfm/nlsFjtGT
 7D1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sCi48ZqO6AkPMJ+ZyF18T2s297T/4zk3YpQYq8qyJcQ=;
 b=wQ1l5ZqC6rF8qQETLXvpCiy0OWy3tm9srf3/I9LsjfSG4tsnZqZWjNVW0BLcMxXQ6L
 1tW6sm2/iqwzPS79/37lx8dWxqHLz3KIcksZux15eYxhvHf0NPG1uZRsgppsN7qNFC3Q
 PbXabisAYH/26YG5scKmW0eALzFFrz8YQEYsQkQu7UnXjcEKt3/n6JcoUP+dYcjh4J6u
 DJeOGAcGR//dSfb6hmZE4Dqn5A5zdmM2LzK+TQeq3RFHidZVMQi3fak4zdY9ck1yFdKm
 qElTeBt+tfJI3kNyuhAtQY3Qb2+pWkXCJUtVEHTjwBsPJsRZlqMQ0NPBP8nVSg1ju+Ee
 /ATQ==
X-Gm-Message-State: ACrzQf1sByna46VURTxb4Eh1roN3rewxUvHMjuyT1vDmrjhVFtcP3MdS
 uT/vzuQDAdCNLKSyh6kc6BYjNpPfsxqY4bWp
X-Google-Smtp-Source: AMsMyM4UbvjeSkVPAiYmf8DaEvWxhUmYKugvvhfwRdEluffxVY+seVy+Nb1MNDib90OaLG+e62BxkA==
X-Received: by 2002:a63:e74d:0:b0:440:6c50:eab7 with SMTP id
 j13-20020a63e74d000000b004406c50eab7mr34930607pgk.308.1666750372199; 
 Tue, 25 Oct 2022 19:12:52 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:12:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 32/47] target/i386: Convert to tcg_ops restore_state_to_opc
Date: Wed, 26 Oct 2022 12:11:01 +1000
Message-Id: <20221026021116.1988449-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
 target/i386/tcg/tcg-cpu.c   | 19 +++++++++++++++++++
 target/i386/tcg/translate.c | 15 ---------------
 2 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 828244abe2..79ac5908f7 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -56,6 +56,24 @@ static void x86_cpu_synchronize_from_tb(CPUState *cs,
     }
 }
 
+static void x86_restore_state_to_opc(CPUState *cs,
+                                     const TranslationBlock *tb,
+                                     const uint64_t *data)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+    int cc_op = data[1];
+
+    if (TARGET_TB_PCREL) {
+        env->eip = (env->eip & TARGET_PAGE_MASK) | data[0];
+    } else {
+        env->eip = data[0] - tb->cs_base;
+    }
+    if (cc_op != CC_OP_DYNAMIC) {
+        env->cc_op = cc_op;
+    }
+}
+
 #ifndef CONFIG_USER_ONLY
 static bool x86_debug_check_breakpoint(CPUState *cs)
 {
@@ -72,6 +90,7 @@ static bool x86_debug_check_breakpoint(CPUState *cs)
 static const struct TCGCPUOps x86_tcg_ops = {
     .initialize = tcg_x86_init,
     .synchronize_from_tb = x86_cpu_synchronize_from_tb,
+    .restore_state_to_opc = x86_restore_state_to_opc,
     .cpu_exec_enter = x86_cpu_exec_enter,
     .cpu_exec_exit = x86_cpu_exec_exit,
 #ifdef CONFIG_USER_ONLY
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 85be2e58c2..546c427c23 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -7023,18 +7023,3 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns,
 
     translator_loop(cpu, tb, max_insns, pc, host_pc, &i386_tr_ops, &dc.base);
 }
-
-void restore_state_to_opc(CPUX86State *env, TranslationBlock *tb,
-                          target_ulong *data)
-{
-    int cc_op = data[1];
-
-    if (TARGET_TB_PCREL) {
-        env->eip = (env->eip & TARGET_PAGE_MASK) | data[0];
-    } else {
-        env->eip = data[0] - tb->cs_base;
-    }
-    if (cc_op != CC_OP_DYNAMIC) {
-        env->cc_op = cc_op;
-    }
-}
-- 
2.34.1


