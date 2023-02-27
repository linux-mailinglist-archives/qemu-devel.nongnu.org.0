Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C842F6A3CDC
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:28:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWW88-0004MK-Gs; Mon, 27 Feb 2023 00:32:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6Y-0006j2-Q0
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:31:18 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6W-0000xl-U6
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:31:18 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so8898796pjb.1
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FDr/G0N/cf+m+hkGWa1ktDxEpYaGWUpfy88lZunNdyw=;
 b=Wq397ahEu0zx/lALFZbph690aHd0waUNwZIu80MsXgUqMEhT071R+/t+P7KBlw5tFk
 uqAgVfqEdGtiFQu0i2GzPm4dKtLuycFYj4xJ6wUiciNTxLxPiV/65OW2uHH4Jgw7ZZGT
 RW3iGt5LU7jHKZxTM2+NsCOnLkKnkXCdhxNwyClhQ4cMDCWDsPKTK4SqtZgnHpyXiVUX
 UZ+TneoTUztHB3NuIBHMIL0STtWquvaWQgTU5p/QhsmdHJ2ww07lVvhDoku5z4YfcQ3X
 44GCniwdGQ7KtQt3GiV1zcdRknkFIAkfLgO5BZuGxJ/l4xJky/d3ru1SNxDJ+saNdUOS
 P/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FDr/G0N/cf+m+hkGWa1ktDxEpYaGWUpfy88lZunNdyw=;
 b=3bZnfl4ckAG7ZlnM7/tue9npGYlYIdZxacNU07t0wHYpW6SluQGO5w95gs6HhXhoV2
 SiRNPQMLYAytgOE5BGSdD7GiX7hTei/CWYspTBs12TuELz8QKWyQarZQxOUQgb9gOh+x
 2a5crP2EwXXa57Buk5X8Rf2S5vX8bKWuW+/8MM7OFh9yF0x4nywrjoEBfB1ePXm1ZFNN
 scaDGy7yxwVsSsIgAtmTu2vv1d+A6h2fwQWHnUkPOdrahpW5oeVln7TPvDY8D2Q1OGYf
 /SRMa/3waGntVgsZoqUEZv0IRe1c3c54vTqCaUaBrlU0VIaUZUXLrv00iPTuNmvgqx7L
 rnCw==
X-Gm-Message-State: AO0yUKXh89zkk0/Hfz89f7AwcMqb1LzQyO8WqD6QDIVxUaXaCQlMTNO6
 cAdfp5rr7Lnrsvpj0bHTzJEqVzxUheWe80llACQ=
X-Google-Smtp-Source: AK7set+2AYcvaDaYBbJMsQQsTRDIh6wjQqitOTI2wGFmjhd3GI72jKoLotJXOEXegsM3xFkg19IggA==
X-Received: by 2002:a17:90b:3906:b0:234:7ccf:3c7c with SMTP id
 ob6-20020a17090b390600b002347ccf3c7cmr8319993pjb.9.1677475875327; 
 Sun, 26 Feb 2023 21:31:15 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:31:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 66/76] target/sparc: Drop get_temp_i32
Date: Sun, 26 Feb 2023 19:24:55 -1000
Message-Id: <20230227052505.352889-67-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Translators are no longer required to free tcg temporaries,
therefore there's no need to record temps for later freeing.
Replace the few uses with tcg_temp_new_i32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/translate.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 2b4af692f6..bdf464f802 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -84,8 +84,6 @@ typedef struct DisasContext {
 
     uint32_t cc_op;  /* current CC operation */
     sparc_def_t *def;
-    TCGv_i32 t32[3];
-    int n_t32;
 #ifdef TARGET_SPARC64
     int fprs_dirty;
     int asi;
@@ -129,14 +127,6 @@ static int sign_extend(int x, int len)
 
 #define IS_IMM (insn & (1<<13))
 
-static inline TCGv_i32 get_temp_i32(DisasContext *dc)
-{
-    TCGv_i32 t;
-    assert(dc->n_t32 < ARRAY_SIZE(dc->t32));
-    dc->t32[dc->n_t32++] = t = tcg_temp_new_i32();
-    return t;
-}
-
 static inline void gen_update_fprs_dirty(DisasContext *dc, int rd)
 {
 #if defined(TARGET_SPARC64)
@@ -153,7 +143,7 @@ static inline void gen_update_fprs_dirty(DisasContext *dc, int rd)
 /* floating point registers moves */
 static TCGv_i32 gen_load_fpr_F(DisasContext *dc, unsigned int src)
 {
-    TCGv_i32 ret = get_temp_i32(dc);
+    TCGv_i32 ret = tcg_temp_new_i32();
     if (src & 1) {
         tcg_gen_extrl_i64_i32(ret, cpu_fpr[src / 2]);
     } else {
@@ -175,7 +165,7 @@ static void gen_store_fpr_F(DisasContext *dc, unsigned int dst, TCGv_i32 v)
 
 static TCGv_i32 gen_dest_fpr_F(DisasContext *dc)
 {
-    return get_temp_i32(dc);
+    return tcg_temp_new_i32();
 }
 
 static TCGv_i64 gen_load_fpr_D(DisasContext *dc, unsigned int src)
@@ -5516,7 +5506,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                         break;
                     }
 #endif
-                    cpu_dst_32 = get_temp_i32(dc);
+                    cpu_dst_32 = tcg_temp_new_i32();
                     tcg_gen_qemu_ld_i32(cpu_dst_32, cpu_addr,
                                         dc->mem_idx, MO_TEUL);
                     gen_helper_ldfsr(cpu_fsr, cpu_env, cpu_fsr, cpu_dst_32);
@@ -5762,14 +5752,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
     gen_exception(dc, TT_NCP_INSN);
     goto egress;
 #endif
- egress:
-    if (dc->n_t32 != 0) {
-        int i;
-        for (i = dc->n_t32 - 1; i >= 0; --i) {
-            tcg_temp_free_i32(dc->t32[i]);
-        }
-        dc->n_t32 = 0;
-    }
+ egress:;
 }
 
 static void sparc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
-- 
2.34.1


