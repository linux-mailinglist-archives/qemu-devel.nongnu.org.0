Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E284F3AE0BA
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 23:36:19 +0200 (CEST)
Received: from localhost ([::1]:45926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv574-0002Yt-UU
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 17:36:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv53v-0002Sf-FA
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 17:33:03 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:42612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv53q-0008Ve-7A
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 17:33:03 -0400
Received: by mail-pl1-x636.google.com with SMTP id v13so7448243ple.9
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 14:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EMPtI6EgvV/WiXI17jvBtKPkWXlx76mMDamBhdAr7N4=;
 b=NFskWdxC2hSl5DAKKXzUV6VjYI6M0308P+6QbjeNfODbA0ZWPyX8nRXSNXb8kW+I0+
 VBLkarpPrG4dzhbd+QRPYS846r6h1ZBefVTQzroS9gOOr8gHl7nNHCP2ueUJIQl6bC/u
 /TMwkBLCZ6KSqWhOrj/sOiMmN4HhdHtiDoIilxct9KZZ6ltrejeVvf0LQ3p5/FZqXE0a
 pZQ13G5SyKrmSi09mg8ySSKONxLVCRoz8MUiId3VRroa3VoCbR8M6UErIQbJ1s3KjXKP
 +GSONPUkbFQb7ux2z/xubVJJcGhDVB9gF4UWDrGvu7JBD2zGsDNak7w6g+QC91dzELbQ
 rLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EMPtI6EgvV/WiXI17jvBtKPkWXlx76mMDamBhdAr7N4=;
 b=XujEp9hxXNtPq7U+O09EbZz32IoaJhwITsUYiKH7UjKmSxr1AmGP/SKFWL/uh0rRC4
 4P688x9iSJIt7tuRVLXoI0CAuKtZChUOI6BgLdPwcIaycd1UUFmpEAwwUjfaVUO5QqxK
 92BFDS5t+TSqU8E0Pz4eRlBk29IG1Ro7MsOxOe/dGRiL0iZtkhBhshdvu0Laxoa0V+Vy
 m4HhNdm9oq4+eyYUJGYneZCDSRNkyoKbAubsYyUT4K+EOa8YiZiP/OQP0com9GuPeHXU
 G7gW/KXT7LTfB57cjJJRXdwOqeFVaRaG9+W7NadB6V1RAbenfe4nQzYxGS7Ua4hNAq+Z
 hFXQ==
X-Gm-Message-State: AOAM533SJaMBfqhtyxHGGkq0Yn7HJcH7YeELmKnJpDciXYadYaTLVpsC
 Q2yMWGLT+sLDBDOUwwP+Ax5+j5EkgaisdA==
X-Google-Smtp-Source: ABdhPJxnYgqASLY1xR59KgnAgxTuseNkqF1Fe9RbDKVZ1sSFeb7zynhmN/N8nFkP8WuzA6NGupwc1Q==
X-Received: by 2002:a17:90a:fb51:: with SMTP id
 iq17mr23259567pjb.26.1624224776081; 
 Sun, 20 Jun 2021 14:32:56 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id w21sm13608329pfq.143.2021.06.20.14.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 14:32:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/11] target/cris: Improve JMP_INDIRECT
Date: Sun, 20 Jun 2021 14:32:49 -0700
Message-Id: <20210620213249.1494274-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210620213249.1494274-1-richard.henderson@linaro.org>
References: <20210620213249.1494274-1-richard.henderson@linaro.org>
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use movcond instead of brcond to set env_pc.
Discard the btarget and btaken variables to improve
register allocation and avoid unnecessary writeback.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index c33324b988..3200819f32 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -515,17 +515,6 @@ static void t_gen_swapr(TCGv d, TCGv s)
     tcg_temp_free(org_s);
 }
 
-static void t_gen_cc_jmp(TCGv pc_true, TCGv pc_false)
-{
-    TCGLabel *l1 = gen_new_label();
-
-    /* Conditional jmp.  */
-    tcg_gen_mov_tl(env_pc, pc_false);
-    tcg_gen_brcondi_tl(TCG_COND_EQ, env_btaken, 0, l1);
-    tcg_gen_mov_tl(env_pc, pc_true);
-    gen_set_label(l1);
-}
-
 static bool use_goto_tb(DisasContext *dc, target_ulong dest)
 {
     return ((dest ^ dc->base.pc_first) & TARGET_PAGE_MASK) == 0;
@@ -3302,8 +3291,17 @@ static void cris_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             /* fall through */
 
         case JMP_INDIRECT:
-            t_gen_cc_jmp(env_btarget, tcg_constant_tl(npc));
+            tcg_gen_movcond_tl(TCG_COND_NE, env_pc,
+                               env_btaken, tcg_constant_tl(0),
+                               env_btarget, tcg_constant_tl(npc));
             is_jmp = DISAS_JUMP;
+
+            /*
+             * We have consumed btaken and btarget.  Hint to the
+             * tcg compiler that the writeback to env may be dropped.
+             */
+            tcg_gen_discard_tl(env_btaken);
+            tcg_gen_discard_tl(env_btarget);
             break;
 
         default:
-- 
2.25.1


