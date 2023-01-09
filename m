Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D28AD663178
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:26:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEyRu-0003KX-MW; Mon, 09 Jan 2023 15:08:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRq-0003D0-Ft
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:46 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRo-0007NH-RS
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:46 -0500
Received: by mail-pl1-x636.google.com with SMTP id jn22so10737032plb.13
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y50Lp3m9kvjNtC3mDiVU9iejxX6y2luF3bPL5MUhbdU=;
 b=ltRRooQv5yEuV+slonl/WThJ6As1kH+qXAG8GW8nrGo/8fQOab3HSPslZjBnUR1Ajg
 3dE7zeGj+ZX/uF7UmMVmx+1tVT+VLQas/6pSd7YuvjtkUVYUk5f3PJzvUrMB5STXOBlU
 /QXuc1N46LSiRPeirNz/u3HpJlD7hjI7o6HXFfZ8RV3HHfTXG1gjWp467MskjwSMRDmo
 I5XZ5AsYIcLQk/MDJT2b6Zu+WOmo0/gaN6Ip8uXrTFaZLL2F11y0VVpCOOpTr6TqZD92
 JxrxLHT916q8sin7Zq8lGb+r3mSNgIMU8B0AMI75/U8l93u6QvN9NtdnWNmKb/EuXHYb
 5ZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y50Lp3m9kvjNtC3mDiVU9iejxX6y2luF3bPL5MUhbdU=;
 b=dr0k746v9gm+5gaRiGDhdqk7Kdq3O3nAe7zwJYp+ghTiWGaFrNAHkJIhLRLPxKppTw
 2CYczDp/qzHh4UkBgGa3tDVBR7HVak9BrdcCkilM2QwkU2bfPNVj5IQbnPZBE/zlhQ24
 lUfNI/VN27qx/sbJgzzX7stq9TjKDSQc23WqEIz+0rqCYf0/lmr/i+dwOpU4CqSA+La8
 nNf48G0FH0geRaLmWKPX7Grr4BiT/eIcU958yEzmOlE9Bm49BI9QjqiPdI2uBKvg0GoV
 oqXGVqGbVQ6pCczEyQ+Y9wMKjNiLC/QLSLtyvKAtpCWMK1zjiQ8H8N3duaYiC8WrmYL0
 IgSA==
X-Gm-Message-State: AFqh2koeia7yBTgE3bkeu1pFAoofH03gDZzMaPIJs5HpzhuBDv5LzF8F
 3uGXrjWYjTMyDvOL/6v7O3a02UPvOwEe/SgL
X-Google-Smtp-Source: AMrXdXvd12USsB7Px4ZJdfxfDR3aGZjM95T9+UuThJgiDrziPT8wqaC7yXaQJYAJ47hlVUy4gDAUEQ==
X-Received: by 2002:a17:90a:fe89:b0:226:e59a:f869 with SMTP id
 co9-20020a17090afe8900b00226e59af869mr12647703pjb.43.1673294923928; 
 Mon, 09 Jan 2023 12:08:43 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:158e:facf:7a46:ba9f])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a17090a384200b0022727d4af8dsm577574pjf.48.2023.01.09.12.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:08:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 20/27] target/s390x: Split per_branch
Date: Mon,  9 Jan 2023 12:08:12 -0800
Message-Id: <20230109200819.3916395-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109200819.3916395-1-richard.henderson@linaro.org>
References: <20230109200819.3916395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Split into per_branch_dest and per_branch_disp, which can be
used for direct and indirect.  In preperation for TARGET_TB_PCREL,
call per_branch_* before indirect branches.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index dd3bd9531b..e3855f6e09 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -350,21 +350,25 @@ static inline bool per_enabled(DisasContext *s)
 #endif
 }
 
-static void per_branch(DisasContext *s, bool to_next)
+static void per_branch_dest(DisasContext *s, TCGv_i64 dest)
 {
 #ifndef CONFIG_USER_ONLY
     gen_psw_addr_disp(s, gbea, 0);
-
     if (per_enabled(s)) {
-        if (to_next) {
-            TCGv_i64 next_pc = tcg_temp_new_i64();
+        gen_helper_per_branch(cpu_env, gbea, dest);
+    }
+#endif
+}
 
-            gen_psw_addr_disp(s, next_pc, s->ilen);
-            gen_helper_per_branch(cpu_env, gbea, next_pc);
-            tcg_temp_free_i64(next_pc);
-        } else {
-            gen_helper_per_branch(cpu_env, gbea, psw_addr);
-        }
+static void per_branch_disp(DisasContext *s, int64_t disp)
+{
+#ifndef CONFIG_USER_ONLY
+    gen_psw_addr_disp(s, gbea, 0);
+    if (per_enabled(s)) {
+        TCGv_i64 dest = tcg_temp_new_i64();
+        gen_psw_addr_disp(s, dest, disp);
+        gen_helper_per_branch(cpu_env, gbea, dest);
+        tcg_temp_free_i64(dest);
     }
 #endif
 }
@@ -1172,7 +1176,7 @@ struct DisasInsn {
 static DisasJumpType help_goto_direct(DisasContext *s, int64_t disp)
 {
     if (disp == s->ilen) {
-        per_branch(s, true);
+        per_branch_disp(s, disp);
         return DISAS_NEXT;
     }
     if (use_goto_tb(s, s->base.pc_next + disp)) {
@@ -1184,7 +1188,7 @@ static DisasJumpType help_goto_direct(DisasContext *s, int64_t disp)
         return DISAS_NORETURN;
     } else {
         update_psw_addr_disp(s, disp);
-        per_branch(s, false);
+        per_branch_dest(s, psw_addr);
         return DISAS_PC_UPDATED;
     }
 }
@@ -1192,7 +1196,7 @@ static DisasJumpType help_goto_direct(DisasContext *s, int64_t disp)
 static DisasJumpType help_goto_indirect(DisasContext *s, TCGv_i64 dest)
 {
     tcg_gen_mov_i64(psw_addr, dest);
-    per_branch(s, false);
+    per_branch_dest(s, psw_addr);
     return DISAS_PC_UPDATED;
 }
 
-- 
2.34.1


