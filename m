Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 091FB3B7871
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:15:17 +0200 (CEST)
Received: from localhost ([::1]:59060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJCW-000218-3d
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItE-00088x-Ha
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:20 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:41818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItA-0000to-26
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:20 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 cx9-20020a17090afd89b0290170a3e085edso3117314pjb.0
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kqh2og0wEwr/ALN9/Tn9edLBUCiuTurWoZvmUbX68qE=;
 b=Uirq0MEO+S57FBVOSqsnn2dIQ6e9YWmQqobQyxfk0HGH0WGHbdEuOKYDowVwk6xCyX
 Mqka5vHs2OahvM9XdpzsJAMx4lAG4ZgNMloYhloh5M91h1W6TsuAojA8hP4wlOAysQL5
 +edBKPUsgUZSYQpSzilio9ecALPexu6LrWALGMc+Vx6lh690NnrpV/3tK5SaBVZMkUn2
 MU9iUY9M/txGVg9GdOievZ6KyEML49lZvmtZ3Cjjh9bu/RuZETkT3CqQNa/c/qUTjSqx
 Yj9kp8aXgB0IJr6478FtF44u7jbM8C6r6IW0xp4RCOdhmuPrNaiNgcgp/p6V4GzBZ5tc
 EsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kqh2og0wEwr/ALN9/Tn9edLBUCiuTurWoZvmUbX68qE=;
 b=SwYx0t6bi5pU9q2lq69588XM7U0yfGC/mjPrTcHoKlAnWjvLwUubnM2Y7dEIJ3qPul
 T4fzMlAX7y5eoG62ADPpEXJo+5AeOz3k9Pro8A3j2Qx7+IKvG129q/mVvJGU8OUT9Wp5
 o2y7FR6k4BMs3DEbrZ4aut7x/DT2GWH5hY8DXf6+m+u4r7WhsLH6kbhR4IWBuuAHmPHP
 h1vTfgHoaob4YSftqyAPCPzC1psrPz00pSfExAtaLbiUhFaFNQ8dnxSRj+cfaVwdrGIO
 UDPeYvuIoZTbGDcjlycA1ncLluyl19KkEwZwQ1X0apYCcXvKJTlGRmeOzA1o6YeUcVvQ
 0JCw==
X-Gm-Message-State: AOAM532db4ImyRC16HothEsROqkR15YVWLLAMOegDJAz3dAT6TqTG/gg
 3Q8LiS0fphtx/ju/4BRwbsszoVsn5lA0ew==
X-Google-Smtp-Source: ABdhPJypk1H/KbBpor9VaUzL7UF2IbcF+wzLD5xKXvYB9qkTP8k2zLWs5WU22f1kKh7/eCZoJ6/hdQ==
X-Received: by 2002:a17:902:8e88:b029:11c:51bc:def8 with SMTP id
 bg8-20020a1709028e88b029011c51bcdef8mr28537709plb.57.1624992909166; 
 Tue, 29 Jun 2021 11:55:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:55:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/63] target/cris: Add DISAS_UPDATE_NEXT
Date: Tue, 29 Jun 2021 11:54:15 -0700
Message-Id: <20210629185455.3131172-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move this pc update into tb_stop.
We will be able to re-use this code shortly.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index df92b90d4e..a2124ffcd5 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -52,9 +52,15 @@
 #define BUG() (gen_BUG(dc, __FILE__, __LINE__))
 #define BUG_ON(x) ({if (x) BUG();})
 
-/* is_jmp field values */
-#define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
-#define DISAS_UPDATE  DISAS_TARGET_1 /* cpu state was modified dynamically */
+/*
+ * Target-specific is_jmp field values
+ */
+/* Only pc was modified dynamically */
+#define DISAS_JUMP          DISAS_TARGET_0
+/* Cpu state was modified dynamically, including pc */
+#define DISAS_UPDATE        DISAS_TARGET_1
+/* Cpu state was modified dynamically, excluding pc -- use npc */
+#define DISAS_UPDATE_NEXT   DISAS_TARGET_2
 
 /* Used by the decoder.  */
 #define EXTRACT_FIELD(src, start, end) \
@@ -3268,8 +3274,8 @@ static void cris_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 
     /* Force an update if the per-tb cpu state has changed.  */
     if (dc->base.is_jmp == DISAS_NEXT && dc->cpustate_changed) {
-        dc->base.is_jmp = DISAS_UPDATE;
-        tcg_gen_movi_tl(env_pc, dc->pc);
+        dc->base.is_jmp = DISAS_UPDATE_NEXT;
+        return;
     }
 
     /*
@@ -3311,6 +3317,7 @@ static void cris_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
     if (unlikely(dc->base.singlestep_enabled)) {
         switch (is_jmp) {
         case DISAS_TOO_MANY:
+        case DISAS_UPDATE_NEXT:
             tcg_gen_movi_tl(env_pc, npc);
             /* fall through */
         case DISAS_JUMP:
@@ -3327,6 +3334,9 @@ static void cris_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
     case DISAS_TOO_MANY:
         gen_goto_tb(dc, 0, npc);
         break;
+    case DISAS_UPDATE_NEXT:
+        tcg_gen_movi_tl(env_pc, npc);
+        /* fall through */
     case DISAS_JUMP:
     case DISAS_UPDATE:
         /* Indicate that interupts must be re-evaluated before the next TB. */
-- 
2.25.1


