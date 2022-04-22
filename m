Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD9F50BE77
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:19:28 +0200 (CEST)
Received: from localhost ([::1]:51954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhwwJ-0003WP-LK
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwX1-0000zQ-7Q
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:19 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:34588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWz-0007H0-GG
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:18 -0400
Received: by mail-pl1-x633.google.com with SMTP id n8so12126451plh.1
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r8f+qzpvdgvny2fiqiDe7wZJGOpE02k47NFtBiJd8Y4=;
 b=Av8EbfbqRsKrPX1IxdtubXHRMnFdR8MK9qIJuOML+V4gDMReizAsag5Nz1nM2bIMkq
 nwSgGRtB5+2sTheuamJMMM7KvTM0zHfCWGvaY1kq2I7uYB9D1esLks3UiuSExPyK8pmb
 GY9vdh9cw0hhvbGn85M1rIttX5OAVSmPa5y9Wqu4bBWj4hRkRxTHYDdGpI16fJvW8FGR
 V6DIIcqanmmNJWpTk+ufvIlGHOHz9PYaGbQPm5n4iEx14Qrq8P3hY6hYCxt4pPEXLPiR
 /vkcuBT9vsUKn835q62MlR/zTRHw69AlnTdwPQTCbrrXAR9y915Y7Gt+3ABLqt5XMhJ4
 Ensg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r8f+qzpvdgvny2fiqiDe7wZJGOpE02k47NFtBiJd8Y4=;
 b=qr0ZxEi0afFeg+ITfpd30Xr4g+sCjMJeQxr8HxtfblECuI0JNGd6/+RNhjshAYROhj
 ss0Zzgr/qyFFxsb7divHgAx/qhRa9PjduvK6pTQ7D0YxKGU/iyXkVp5Q0HZVcN+2Hx1J
 aZGVqZzOZG+kk9TBX8vOWvsi33GdZ5tOrD0lnsF2vVi4Sxm393nWQeBFawm+d4cpXqH+
 /QFEewYNFcWFgw8JgyVXv+OfkRsf+B3BeCXA2u3yjNGnspcM6XxsBM0RCiTNkJ+wtiuj
 FYB7zjYTNxbXbTjsnir0bVrfLVDymB3CFvjl0sQi0Zu5kAc5VvXPkOOXHpak8QFYUl/S
 nDFg==
X-Gm-Message-State: AOAM530HAiY+dLk8mwoqQhm694qFaLkRwZbklWK5hrvR3HJFyrZyBnmT
 GmDJX57OsjvYGqL+MLut9J4BQyCQyUzHsiHn
X-Google-Smtp-Source: ABdhPJyuJHMf6EA0pYgIEF2s7u6Zp93rDQQ/aneb5XdOk9nVmOVfHqjOHVps9SBv77mScCPyXfkIqQ==
X-Received: by 2002:a17:90b:1b03:b0:1d2:a577:d52 with SMTP id
 nu3-20020a17090b1b0300b001d2a5770d52mr6311757pjb.58.1650646394976; 
 Fri, 22 Apr 2022 09:53:14 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 6-20020a17090a030600b001cd4989ff5fsm6835904pje.38.2022.04.22.09.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:53:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 19/68] target/nios2: Do not create TCGv for control
 registers
Date: Fri, 22 Apr 2022 09:51:49 -0700
Message-Id: <20220422165238.1971496-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't need to reference them often, and when we do it
is just as easy to load/store from cpu_env directly.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-20-richard.henderson@linaro.org>
---
 target/nios2/translate.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 3694f2503b..6c739bfa5e 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -103,7 +103,7 @@ typedef struct DisasContext {
     int               mem_idx;
 } DisasContext;
 
-static TCGv cpu_R[NUM_CORE_REGS];
+static TCGv cpu_R[NUM_GP_REGS];
 static TCGv cpu_pc;
 
 typedef struct Nios2Instruction {
@@ -394,7 +394,11 @@ static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
 #ifdef CONFIG_USER_ONLY
     g_assert_not_reached();
 #else
-    gen_helper_eret(cpu_env, cpu_R[CR_ESTATUS], cpu_R[R_EA]);
+    TCGv tmp = tcg_temp_new();
+    tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPUNios2State, regs[CR_ESTATUS]));
+    gen_helper_eret(cpu_env, tmp, cpu_R[R_EA]);
+    tcg_temp_free(tmp);
+
     dc->base.is_jmp = DISAS_NORETURN;
 #endif
 }
@@ -420,7 +424,11 @@ static void bret(DisasContext *dc, uint32_t code, uint32_t flags)
 #ifdef CONFIG_USER_ONLY
     g_assert_not_reached();
 #else
-    gen_helper_eret(cpu_env, cpu_R[CR_BSTATUS], cpu_R[R_BA]);
+    TCGv tmp = tcg_temp_new();
+    tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPUNios2State, regs[CR_BSTATUS]));
+    gen_helper_eret(cpu_env, tmp, cpu_R[R_BA]);
+    tcg_temp_free(tmp);
+
     dc->base.is_jmp = DISAS_NORETURN;
 #endif
 }
@@ -463,6 +471,7 @@ static void callr(DisasContext *dc, uint32_t code, uint32_t flags)
 static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     R_TYPE(instr, code);
+    TCGv t1, t2;
 
     if (!gen_check_supervisor(dc)) {
         return;
@@ -482,10 +491,19 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
          * must perform the AND here, and anywhere else we need the
          * guest value of ipending.
          */
-        tcg_gen_and_tl(cpu_R[instr.c], cpu_R[CR_IPENDING], cpu_R[CR_IENABLE]);
+        t1 = tcg_temp_new();
+        t2 = tcg_temp_new();
+        tcg_gen_ld_tl(t1, cpu_env,
+                      offsetof(CPUNios2State, regs[CR_IPENDING]));
+        tcg_gen_ld_tl(t2, cpu_env,
+                      offsetof(CPUNios2State, regs[CR_IENABLE]));
+        tcg_gen_and_tl(cpu_R[instr.c], t1, t2);
+        tcg_temp_free(t1);
+        tcg_temp_free(t2);
         break;
     default:
-        tcg_gen_mov_tl(cpu_R[instr.c], cpu_R[instr.imm5 + CR_BASE]);
+        tcg_gen_ld_tl(cpu_R[instr.c], cpu_env,
+                      offsetof(CPUNios2State, regs[instr.imm5 + CR_BASE]));
         break;
     }
 }
@@ -522,7 +540,8 @@ static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
         dc->base.is_jmp = DISAS_UPDATE;
         /* fall through */
     default:
-        tcg_gen_mov_tl(cpu_R[instr.imm5 + CR_BASE], v);
+        tcg_gen_st_tl(v, cpu_env,
+                      offsetof(CPUNios2State, regs[instr.imm5 + CR_BASE]));
         break;
     }
 #endif
@@ -910,7 +929,7 @@ void nios2_tcg_init(void)
 {
     int i;
 
-    for (i = 0; i < NUM_CORE_REGS; i++) {
+    for (i = 0; i < NUM_GP_REGS; i++) {
         cpu_R[i] = tcg_global_mem_new(cpu_env,
                                       offsetof(CPUNios2State, regs[i]),
                                       regnames[i]);
-- 
2.34.1


