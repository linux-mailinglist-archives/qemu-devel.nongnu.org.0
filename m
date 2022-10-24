Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5934E60AE42
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 16:54:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxSL-0003FI-N4; Mon, 24 Oct 2022 09:25:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSH-0003Cz-3U
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:25 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSD-0003tv-Rp
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:23 -0400
Received: by mail-pl1-x62b.google.com with SMTP id u6so8408504plq.12
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FZc9mr+Lj/5v+/f/s9nBwTEyh4pQeC09vzywJopn5pg=;
 b=bzq+lTPhnonF8y1A5z0S/iaWskTTjwoelDSoVgOvk3fPddVSF3CfYmDIw0x8n42zDD
 cpPhp/g9MVj3QhOu1qer09JHsh/UhYA7OyaAH/TRUEp6WabOpHa6wtUDFUgQw1/TRS6x
 onF8JlLOUtpUwgDQop95o1jSQeo/Hb2Hln+PgguyENlW6fAXcWy3AWYtB4hYTRuzhnXr
 hbvUb3c/ESvNYTqeLNqzdIGBHTK1JdqW7wYG7sTFKk1Pm2R35HOu/AzfDFcaOs/pffAc
 RZDHokDFS4C6WrIvltN3ZE3D1IHcuH8sgpdzR+0tIWOPoENwHCqhhUxZytc2a+uITmw2
 /RIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FZc9mr+Lj/5v+/f/s9nBwTEyh4pQeC09vzywJopn5pg=;
 b=OhJeM5KqjtrTix+dNVGTESCXShcXRp8rWNBoWVE36679Rr1SYRcYF08sc/rloTqOVi
 wNZDIw4vvPP/fDjTsoIb718k8sJAu7k33oNPlHORZ/oPYPwK/qI9/3uV1VI3RuAIdQtH
 IkiHYgon7KgDJlaJrQCa5YZbBdMKCmcbKxt3HfzABF4ioVUNz6dU5XO90exw/TwzRVZm
 P0iLV/MQKxgRtmgiAmXJQ+SJ9o/z6g/+ZwOApUvibdKAeKfInUm55ReUZv7JemJSdhXs
 RI4p0IDuRALgG9fE2MleNsYVb8IjeCs2Y4GHgh3WNHinIwlXicTv/wkB9nmRolBND7CN
 sUKA==
X-Gm-Message-State: ACrzQf3xrtezeZqxDVEj75SDt/zsGJmgRoOfXs1GiH3sVR5BgmKi5T31
 qI9YO01wWJ15LAtCpco1n8IN0YOkQrqYmw==
X-Google-Smtp-Source: AMsMyM7UXXpnJWqtQuFQ6oahziuwJChv26LNd5kjW+v40ayJWwJmOIl0iPzy+DubL1ZrShT+eHmMTA==
X-Received: by 2002:a17:90b:1e46:b0:20a:f9d8:1ff7 with SMTP id
 pi6-20020a17090b1e4600b0020af9d81ff7mr75993021pjb.34.1666617919406; 
 Mon, 24 Oct 2022 06:25:19 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 b12-20020a1709027e0c00b00178ab008364sm17009216plm.37.2022.10.24.06.25.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:25:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/29] target/arm: Convert to tcg_ops restore_state_to_opc
Date: Mon, 24 Oct 2022 23:24:33 +1000
Message-Id: <20221024132459.3229709-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024132459.3229709-1-richard.henderson@linaro.org>
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
 target/arm/cpu.c       | 26 ++++++++++++++++++++++++++
 target/arm/translate.c | 22 ----------------------
 2 files changed, 26 insertions(+), 22 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0bc5e9b125..0a7bfbf999 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -90,6 +90,31 @@ void arm_cpu_synchronize_from_tb(CPUState *cs,
         }
     }
 }
+
+static void arm_restore_state_to_opc(CPUState *cs,
+                                     const TranslationBlock *tb,
+                                     const uint64_t *data)
+{
+    CPUARMState *env = cs->env_ptr;
+
+    if (is_a64(env)) {
+        if (TARGET_TB_PCREL) {
+            env->pc = (env->pc & TARGET_PAGE_MASK) | data[0];
+        } else {
+            env->pc = data[0];
+        }
+        env->condexec_bits = 0;
+        env->exception.syndrome = data[2] << ARM_INSN_START_WORD2_SHIFT;
+    } else {
+        if (TARGET_TB_PCREL) {
+            env->regs[15] = (env->regs[15] & TARGET_PAGE_MASK) | data[0];
+        } else {
+            env->regs[15] = data[0];
+        }
+        env->condexec_bits = data[1];
+        env->exception.syndrome = data[2] << ARM_INSN_START_WORD2_SHIFT;
+    }
+}
 #endif /* CONFIG_TCG */
 
 static bool arm_cpu_has_work(CPUState *cs)
@@ -2152,6 +2177,7 @@ static const struct TCGCPUOps arm_tcg_ops = {
     .initialize = arm_translate_init,
     .synchronize_from_tb = arm_cpu_synchronize_from_tb,
     .debug_excp_handler = arm_debug_excp_handler,
+    .restore_state_to_opc = arm_restore_state_to_opc,
 
 #ifdef CONFIG_USER_ONLY
     .record_sigsegv = arm_cpu_record_sigsegv,
diff --git a/target/arm/translate.c b/target/arm/translate.c
index d1b868430e..74a903072f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9939,25 +9939,3 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns,
 
     translator_loop(cpu, tb, max_insns, pc, host_pc, ops, &dc.base);
 }
-
-void restore_state_to_opc(CPUARMState *env, TranslationBlock *tb,
-                          target_ulong *data)
-{
-    if (is_a64(env)) {
-        if (TARGET_TB_PCREL) {
-            env->pc = (env->pc & TARGET_PAGE_MASK) | data[0];
-        } else {
-            env->pc = data[0];
-        }
-        env->condexec_bits = 0;
-        env->exception.syndrome = data[2] << ARM_INSN_START_WORD2_SHIFT;
-    } else {
-        if (TARGET_TB_PCREL) {
-            env->regs[15] = (env->regs[15] & TARGET_PAGE_MASK) | data[0];
-        } else {
-            env->regs[15] = data[0];
-        }
-        env->condexec_bits = data[1];
-        env->exception.syndrome = data[2] << ARM_INSN_START_WORD2_SHIFT;
-    }
-}
-- 
2.34.1


