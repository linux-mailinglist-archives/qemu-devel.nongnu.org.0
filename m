Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC750661C21
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 02:52:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEhBj-0000lD-0b; Sun, 08 Jan 2023 20:42:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBg-0000kI-T9
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:42:56 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBf-0001W3-6k
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:42:56 -0500
Received: by mail-pl1-x633.google.com with SMTP id d3so7940344plr.10
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 17:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Xbt+7EtsDJRuy41qlehYVSoIBF1LmYyXp3uFG/l4kE4=;
 b=qjY15oW4U3FzdamCR1S87cyR/FSaQM2uF4zrcQ+8GwenhbaSOCpVerZjHYdZFZRvjm
 ixqMlD5We4n3RIuYQ2WrD1vNVCordDdLiKhgny0tlMOJRZqqMWfSFbz3ZFms5keNHqy0
 FH/CE4WiHQIvs5z9mFd3oyt9OohbIxJISyHNSFmJDPtxom5UG83XsHcBh50m4fSLE7ho
 NnPa9i/Aeuqe2GxNrLAjLdmA2aDTwsi6uV7JHV01X3lDtJkzMpVlL7HbYkvp3qctpy7j
 wN8Z3Tu9/YDpJu6TtwLzbz8NH+AztfnnfjrvpvlwBqFkY7Wa3Qujm5ylmyquwycwRb1O
 lmkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xbt+7EtsDJRuy41qlehYVSoIBF1LmYyXp3uFG/l4kE4=;
 b=barj1xiIEu4lpRvpF87ZUjRW1y7uginfAHc0lvzbenu6ItaxJV3hUlzgWRfRq9WPFS
 Bxar6yK1wXB/NMkMOMxW3qyAoI1f2rXgtjF4hxdqvRoAc8FTmg2VbpVHPYFPX+EOhIBC
 BCSok1GVXQ6yrbrEniYVQ6dPJyjx7LbOqinxbDSyqOasnNoQeLBqtLyjEBj/+61Xaue0
 uPtygqaVYFMGyFJIYMCj9KeiItGTInwWz+7Dl7thLbxzxNw8ZxswnRwEpdVxOI4h0oh9
 Q3WjAgXohwmoMO8DaaMBh+A7SMXbveb4Q34uJhaOPOynoW0v1qut5yjOXTKYa9Rm0Tmw
 aYww==
X-Gm-Message-State: AFqh2krVS8jquXzAvB/U6qs2eimZ1Yosu0bwPs9fXfbTmv/In5LZbsrH
 chEAmA6q/CyqgeHVPsBeqkC56nXxRmWMg4Zb
X-Google-Smtp-Source: AMrXdXtO+X3+Xz/1I9jADfy3s5rjBYy564k5lWoX25IXO6LrG1qpEIutzQP8XV50auDd+OEJDVS+qw==
X-Received: by 2002:a05:6a20:8f21:b0:af:88d2:33f8 with SMTP id
 b33-20020a056a208f2100b000af88d233f8mr119746231pzk.7.1673228573930; 
 Sun, 08 Jan 2023 17:42:53 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a170902ca0d00b00178b77b7e71sm4743617pld.188.2023.01.08.17.42.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 17:42:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/22] tcg/sparc64: Remove unused goto_tb code for indirect
 jump
Date: Sun,  8 Jan 2023 17:42:30 -0800
Message-Id: <20230109014248.2894281-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109014248.2894281-1-richard.henderson@linaro.org>
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 41 +++++++++++-------------------------
 1 file changed, 12 insertions(+), 29 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index d2d8b46815..26b00d1638 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -537,17 +537,6 @@ static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
     return false;
 }
 
-static void tcg_out_ld_ptr(TCGContext *s, TCGReg ret, const void *arg)
-{
-    intptr_t diff = tcg_tbrel_diff(s, arg);
-    if (USE_REG_TB && check_fit_ptr(diff, 13)) {
-        tcg_out_ld(s, TCG_TYPE_PTR, ret, TCG_REG_TB, diff);
-        return;
-    }
-    tcg_out_movi(s, TCG_TYPE_PTR, ret, (uintptr_t)arg & ~0x3ff);
-    tcg_out_ld(s, TCG_TYPE_PTR, ret, ret, (uintptr_t)arg & 0x3ff);
-}
-
 static void tcg_out_sety(TCGContext *s, TCGReg rs)
 {
     tcg_out32(s, WRY | INSN_RS1(TCG_REG_G0) | INSN_RS2(rs));
@@ -1463,27 +1452,21 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     switch (opc) {
     case INDEX_op_goto_tb:
-        if (s->tb_jmp_insn_offset) {
-            /* direct jump method */
-            if (USE_REG_TB) {
-                /* make sure the patch is 8-byte aligned.  */
-                if ((intptr_t)s->code_ptr & 4) {
-                    tcg_out_nop(s);
-                }
-                s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
-                tcg_out_sethi(s, TCG_REG_T1, 0);
-                tcg_out_arithi(s, TCG_REG_T1, TCG_REG_T1, 0, ARITH_OR);
-                tcg_out_arith(s, TCG_REG_G0, TCG_REG_TB, TCG_REG_T1, JMPL);
-                tcg_out_arith(s, TCG_REG_TB, TCG_REG_TB, TCG_REG_T1, ARITH_ADD);
-            } else {
-                s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
-                tcg_out32(s, CALL);
+        qemu_build_assert(TCG_TARGET_HAS_direct_jump);
+        /* Direct jump. */
+        if (USE_REG_TB) {
+            /* make sure the patch is 8-byte aligned.  */
+            if ((intptr_t)s->code_ptr & 4) {
                 tcg_out_nop(s);
             }
+            s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
+            tcg_out_sethi(s, TCG_REG_T1, 0);
+            tcg_out_arithi(s, TCG_REG_T1, TCG_REG_T1, 0, ARITH_OR);
+            tcg_out_arith(s, TCG_REG_G0, TCG_REG_TB, TCG_REG_T1, JMPL);
+            tcg_out_arith(s, TCG_REG_TB, TCG_REG_TB, TCG_REG_T1, ARITH_ADD);
         } else {
-            /* indirect jump method */
-            tcg_out_ld_ptr(s, TCG_REG_TB, s->tb_jmp_target_addr + a0);
-            tcg_out_arithi(s, TCG_REG_G0, TCG_REG_TB, 0, JMPL);
+            s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
+            tcg_out32(s, CALL);
             tcg_out_nop(s);
         }
         set_jmp_reset_offset(s, a0);
-- 
2.34.1


