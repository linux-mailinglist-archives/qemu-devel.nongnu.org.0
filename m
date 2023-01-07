Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE34660CD4
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 08:52:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pE3zR-0003iZ-Nj; Sat, 07 Jan 2023 02:51:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zE-0003dC-PH
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:29 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zD-0004Aa-08
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:28 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 fz16-20020a17090b025000b002269d6c2d83so7421837pjb.0
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 23:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fzk4NrLtAJi/a77CIcZx5K/WdDcUEvtouOhrn05Qgew=;
 b=qHHQ+piSmWZvePSqf1kTrw7uBO/A8pksd5k1hqqnPIyO9lHk8g2JlM25KdfzLp+UA5
 TRVDJWdIRnP026VA1nQ31dQLhJde9/+/KeCgXLvr+CdhgKGOvMx3KFp8CPQ1rL7xv0zm
 ghpHQ7YOFjB3RkNhDCSNHKROt4gtifuoJRxxUBujzBcJAOfASTFo42TC3Elt3CBVSVEw
 MqXxoiLPnxvsDtSrEfst2pyptKPY9fS4sZbdgXxQHT+QoTWMFm0SXBXl3Oa197lSeC1j
 vuiwE6CBcclfuk7dgCH8uHnI1ZRzw5U6gb4ch3m55tLVXiM9gcSAIZG1/oEF7/3PTcy4
 SSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fzk4NrLtAJi/a77CIcZx5K/WdDcUEvtouOhrn05Qgew=;
 b=SIAaARvBqDs6SOw7EH+rOPjCAY97nhUIfsuWm0sQlD/gfnJ2Jn8FjwZItGix+bykEu
 hfHbnJDHQkIt7w681tTioDdwvrZ5/gO198sQt/k88rVdgzVnPOHmE5fJ/khDkq35FxW6
 pUgH1QbCmhlVERzTw4l3CnB3LDTmK3g4WbtseSDa2ijN2XoF0rXbredM62uYgmTQUyr4
 B2w9yOufYQAe+1KwMtKK842QBeCGXHP/ZJ7wnNq7uExYgnVFuxQ2R+XmQIqxVudebbVt
 vdzjmMlfhQH792ANPk6cbO6rKgrt+yvnZKNcNKw2miOMIkO9k/4LUS3IEv2NlNEBZNN1
 EwjQ==
X-Gm-Message-State: AFqh2krYKhdYryTEjI+4av2yBORwkFO9FQmhOiCim3UIgigU2yfoYIaQ
 nPvXfWlxkDAVpCi2f2A6WZL0JDmpTGpI9chr
X-Google-Smtp-Source: AMrXdXvPnUm+BAvoCTZRRkpPdO2hhvVNRAjXus6/HQJzhobQTun+PUzAw+Qs7vTYfPIi1WEfr2kd3g==
X-Received: by 2002:a17:90a:a594:b0:225:fa96:c744 with SMTP id
 b20-20020a17090aa59400b00225fa96c744mr46274795pjq.37.1673077882644; 
 Fri, 06 Jan 2023 23:51:22 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 bj5-20020a17090b088500b00212e5068e17sm1945119pjb.40.2023.01.06.23.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 23:51:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 03/27] tcg/s390x: Always set TCG_TARGET_HAS_direct_jump
Date: Fri,  6 Jan 2023 23:50:54 -0800
Message-Id: <20230107075118.1814503-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230107075118.1814503-1-richard.henderson@linaro.org>
References: <20230107075118.1814503-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

Since USE_REG_TB is removed, there is no need to load the
target TB address into a register.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.h     |  2 +-
 tcg/s390x/tcg-target.c.inc | 48 +++++++-------------------------------
 2 files changed, 10 insertions(+), 40 deletions(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 22d70d431b..645f522058 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -103,7 +103,7 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_mulsh_i32      0
 #define TCG_TARGET_HAS_extrl_i64_i32  0
 #define TCG_TARGET_HAS_extrh_i64_i32  0
-#define TCG_TARGET_HAS_direct_jump    HAVE_FACILITY(GEN_INST_EXT)
+#define TCG_TARGET_HAS_direct_jump    1
 #define TCG_TARGET_HAS_qemu_st8_i32   0
 
 #define TCG_TARGET_HAS_div2_i64       1
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index ba4bb6a629..2cdd0d7a92 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -996,28 +996,6 @@ static inline bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
     return false;
 }
 
-/* load data from an absolute host address */
-static void tcg_out_ld_abs(TCGContext *s, TCGType type,
-                           TCGReg dest, const void *abs)
-{
-    intptr_t addr = (intptr_t)abs;
-
-    if (HAVE_FACILITY(GEN_INST_EXT) && !(addr & 1)) {
-        ptrdiff_t disp = tcg_pcrel_diff(s, abs) >> 1;
-        if (disp == (int32_t)disp) {
-            if (type == TCG_TYPE_I32) {
-                tcg_out_insn(s, RIL, LRL, dest, disp);
-            } else {
-                tcg_out_insn(s, RIL, LGRL, dest, disp);
-            }
-            return;
-        }
-    }
-
-    tcg_out_movi(s, TCG_TYPE_PTR, dest, addr & ~0xffff);
-    tcg_out_ld(s, type, dest, dest, addr & 0xffff);
-}
-
 static inline void tcg_out_risbg(TCGContext *s, TCGReg dest, TCGReg src,
                                  int msb, int lsb, int ofs, int z)
 {
@@ -2037,24 +2015,16 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_goto_tb:
         a0 = args[0];
-        if (s->tb_jmp_insn_offset) {
-            /*
-             * branch displacement must be aligned for atomic patching;
-             * see if we need to add extra nop before branch
-             */
-            if (!QEMU_PTR_IS_ALIGNED(s->code_ptr + 1, 4)) {
-                tcg_out16(s, NOP);
-            }
-            tcg_out16(s, RIL_BRCL | (S390_CC_ALWAYS << 4));
-            s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
-            s->code_ptr += 2;
-        } else {
-            /* load address stored at s->tb_jmp_target_addr + a0 */
-            tcg_out_ld_abs(s, TCG_TYPE_PTR, TCG_TMP0,
-                           tcg_splitwx_to_rx(s->tb_jmp_target_addr + a0));
-            /* and go there */
-            tcg_out_insn(s, RR, BCR, S390_CC_ALWAYS, TCG_TMP0);
+        /*
+         * branch displacement must be aligned for atomic patching;
+         * see if we need to add extra nop before branch
+         */
+        if (!QEMU_PTR_IS_ALIGNED(s->code_ptr + 1, 4)) {
+            tcg_out16(s, NOP);
         }
+        tcg_out16(s, RIL_BRCL | (S390_CC_ALWAYS << 4));
+        s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
+        s->code_ptr += 2;
         set_jmp_reset_offset(s, a0);
         break;
 
-- 
2.34.1


