Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1735F6009
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 06:22:53 +0200 (CEST)
Received: from localhost ([::1]:43782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogIPM-0001pn-LP
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 00:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoV-0004Lh-R9
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:48 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:34598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoP-0003xn-Ns
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:46 -0400
Received: by mail-pg1-x52a.google.com with SMTP id 195so788667pga.1
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=OGKK8ii462fh2FYHuqVoO8HNQ7SQYpLXPO2c0Erkaco=;
 b=FbfBCOT+YwROkWZX1QzJKW/m+qqHGuRkSvtxEaCam2emDcSyD3sXuROsnyJFlCAPF5
 7C6x6H8shJnzjzjUueFRsWQrJA2VNqZ3batdk3QwpKDMiF7Vl9KleOJ9H40KwCN0FWGx
 7zN4g3HYV05YlEWCYopc9a2kt6Bv15rUWTt/Pyb9X5uhCbIQ64EcU2RDOthZ5Vn0SW6v
 o/nM5uU4RqSG9YBdoHhVV1Hq2M9EEdKtSNUXn+4A7uHNQ+Vsl4tqnUBB3/jmdkICavBO
 wKS8XkN8hifFfEAa6Nl/1ssJoguWEx15VgLMSgakvXfn5wgRL2UeNEBJmZ7ZHstyReTI
 ZAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=OGKK8ii462fh2FYHuqVoO8HNQ7SQYpLXPO2c0Erkaco=;
 b=U7YJWD653CapiGNNEpqu0APEt+70UvpZNzhQUnZ+ingF+zC2LMAbZAMgURSxbyWONj
 y8TMQYMQ8lAOjm19nnx0oZgo7QWB3RKCS/JSIqo/BotHKL+BFC4FTxcIDr8Ce/fQgW8g
 ZOYaGCJoLBARPLjnaudEidZjs2+MCNFr0/ppo/+VH6MCuHgxAOx02502442T/BCHHK1Z
 vKR5Z6pia9QXBne6OrUyacwKrKXZouaLkEXnukdbUfH7NoyquHDn5cKW9iDQEn04ZYqa
 mGzGHxX9/WaBsduip1zuV7002Pb0L2mX2/FsTQTr6J0scEdV6ePxFMyA6zJJeIcIVIE3
 5dug==
X-Gm-Message-State: ACrzQf0bDzT68amqGBY95KAjHULvcvRtssMYZH6hXb9LXFw0/Ds5QqME
 lECmvjPV4DofxSyrMPaDBzHDlSW1hZny/g==
X-Google-Smtp-Source: AMsMyM416kO/hgtgBcMFts2ffWjXCrMHbEpBFp6soEVFpho1EYXawXVM2yt0SEHcdjqipazsUyFwyA==
X-Received: by 2002:a65:4689:0:b0:458:764a:221b with SMTP id
 h9-20020a654689000000b00458764a221bmr2727512pgr.296.1665027880383; 
 Wed, 05 Oct 2022 20:44:40 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a17090ad0c600b00205f4f7a3b3sm1905086pjw.21.2022.10.05.20.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:44:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH 18/26] target/s390x: Split per_branch
Date: Wed,  5 Oct 2022 20:44:13 -0700
Message-Id: <20221006034421.1179141-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006034421.1179141-1-richard.henderson@linaro.org>
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split into per_branch_dest and per_branch_disp, which can be
used for direct and indirect.  In preperation for TARGET_TB_PCREL,
call per_branch_* before indirect branches.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 712f6d5795..bd2ee1c96e 100644
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
+    if (s->base.tb->flags & FLAG_MASK_PER) {
+        gen_helper_per_branch(cpu_env, gbea, dest);
+    }
+#endif
+}
 
-    if (per_enabled(s)) {
-        if (to_next) {
-            TCGv_i64 next_pc = tcg_temp_new_i64();
-
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
+    if (s->base.tb->flags & FLAG_MASK_PER) {
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


