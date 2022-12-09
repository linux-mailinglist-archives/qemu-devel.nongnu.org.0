Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD56647BFE
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 03:09:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Slh-0005ti-O0; Thu, 08 Dec 2022 21:05:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Slf-0005tK-Gv
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:39 -0500
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Sld-0001ty-Uv
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:39 -0500
Received: by mail-ot1-x32b.google.com with SMTP id
 db10-20020a0568306b0a00b0066d43e80118so1997471otb.1
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 18:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pil2vyVFKco0OazESrG0YmMd/pBt8GQeFupUzgGbxf4=;
 b=ry5/y++6gLLCnyzf8/9gUl43QqpdeM0/ATSfKq0DHTcAwYYVx8Q6IfTI5N/E9eSJSp
 f7ciP9Xdti+gKiCj3ZrjTSBadrytEAKVz+KwNzWLXOQh89Cru/T9dqg10JGdoucJviUf
 /qWS4cXZY3czHOFoQ0D+NdRYG7XBZszXKgunvnB/7w252IsN3kdpVKcjcVV6LLU/ktGN
 RjPwU3AbL2CeoMLAupGUtvwvhE5D82NfBvA3T9l7PJ3+5eD8dy3fi08fURjov4xTcTrQ
 Qng1rUtKzaLuTLwWA0Uc/hQnp4RlzPw33U6HVLZe+AG2fKrvypa6feGMGBCZ/Ql8SICs
 Ax6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pil2vyVFKco0OazESrG0YmMd/pBt8GQeFupUzgGbxf4=;
 b=fZF9CvImMWLNd1V981Dg5HmqDhYHUwsSRcJRF+isFJg0PXRjiTP4b9nxPC2W3tvAj3
 lgv4Y6cDVgOb+uPVl2b6ZsVJFclxR/blyibf5qPYwXgNedOJqBIdaeXpLSdlg7LgK+gZ
 lN+d5KGK29+oYhd5hY+Ho/uGfb47EBJf9kFJGoqYRRmyGmpD55SKJIN9BNaaEm3Lyzyz
 EVDOLs9B1UV2+AJKiMC/lnHnTQXLTuPy39GZQR8JsoU643dJFnSRjW2xS5n75up+SC2P
 zyV+/pUt22bz5pL2Cn2PjkL4393JqCsjgOorxRakVlIZ+dgXFZ0LSGu0l8DxnUwDMe3I
 no0g==
X-Gm-Message-State: ANoB5pkLLwK5Dd3RQgrXz8lFV4J7yy6j3QSgmE6e1Dt/605omzqu2pbP
 42gXQNdfvqRT2xnY7+mmp/JDslqh+uf7d+mgqN4=
X-Google-Smtp-Source: AA0mqf5GTrIqHe0jT6A90e0t5xk36G6tQXHsiK7WrrQB7oogO8G7lbGevTx0C5lDiZqJ3rPZmZFcCQ==
X-Received: by 2002:a05:6830:26c3:b0:670:6c81:6e55 with SMTP id
 m3-20020a05683026c300b006706c816e55mr2021004otu.3.1670551536709; 
 Thu, 08 Dec 2022 18:05:36 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:d298:de6f:2ed:87a4])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a05683004ce00b0066f7e1188f0sm53531otd.68.2022.12.08.18.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 18:05:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v4 03/27] tcg/s390x: Always set TCG_TARGET_HAS_direct_jump
Date: Thu,  8 Dec 2022 20:05:06 -0600
Message-Id: <20221209020530.396391-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209020530.396391-1-richard.henderson@linaro.org>
References: <20221209020530.396391-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
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


