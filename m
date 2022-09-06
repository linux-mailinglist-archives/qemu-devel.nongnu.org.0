Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 313A55AE754
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 14:12:15 +0200 (CEST)
Received: from localhost ([::1]:47476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVXR7-0004RK-8S
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 08:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVek-0003OK-W7
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:17 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVef-0005BB-D1
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:10 -0400
Received: by mail-wr1-x436.google.com with SMTP id bz13so11279343wrb.2
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=OTnwC3I8LADyA6oY2sKnptmoUlM1a+IpjL6VUPaeMMw=;
 b=rQsaCgSNo9KcTEERbsg8KaFZQJi8nWl3fshcTiP8mBQBEvCGt9pyQJeBXaCra800sV
 ECRXg9ayNk8pMyj/3iyrbyJwrSLSH8jqy6Nh/0qwC5JNIWrD6EeQUVH2bwByBSoNGuac
 Rj1PjAkgP/CfR60gQLkwfbgA970LPpJ6h/T1+a69nUaOwzb76SJ4jvzZlZ3KBDlPWJAP
 AnYS5TISat6sxRCPbZer6h4OlrS/5suv5KpJ13SWIR4j3g+/qFC/lBikM/EF/78XC3+Y
 Sf+1c2i7R8FFoRzjzu7xJf84kXgxdx3H4rZNj2dabxhxZdG9TSHZPSpymEfKbhQP+7lI
 6Sog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=OTnwC3I8LADyA6oY2sKnptmoUlM1a+IpjL6VUPaeMMw=;
 b=AMDXO2VfyjN8p1a6oqY5WZuOqhuc+dc55saxt7TxMNTAmBR9WUohnbo18/yUmVEiyR
 ZHVR8TSNWzxa0/ftHWjPKDvwRP8M4Ocaf3k+xB0s9Ap9cas5JGYxTX91iRqY5DZvzymn
 dSk+V9b2xSvl4V96iAcSQstGWl7XyVlnJnqoN0fLInWsKCM8QLq8Jt5H4ot1QnvJI50E
 BZSiMm5FiILR3bL0C7G6XLtegH6k20gwfcXtcijDakMOwW4gyga5AMRbYPmGZ3d+jPCZ
 p4zLVXa3oh8hbzlx704SatyVExTWfNdNRzhMNNvsda9s3fw1k0GyTS5axVt7uP0H7DTt
 zIAg==
X-Gm-Message-State: ACgBeo0oJUP6EdEJ5S4W8N+ZvObTAxbrY9cW8yA/7QJ4voKg9G743ezE
 x/jalGnuOu38ywDnSFoZLcXU1u9tMgyFH5sS
X-Google-Smtp-Source: AA6agR41lNrEhAcwnnrgp6kP+dV4m/dhE1u1kBiVubb76ePUSN2Zc7MxlSNZdPr2HrK+yCa088TaNw==
X-Received: by 2002:a5d:584b:0:b0:220:7624:5aae with SMTP id
 i11-20020a5d584b000000b0022076245aaemr26596740wrf.119.1662459484473; 
 Tue, 06 Sep 2022 03:18:04 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c365000b003a62bc1735asm14094361wmq.9.2022.09.06.03.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:18:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH v1 15/26] target/s390x: Introduce per_enabled
Date: Tue,  6 Sep 2022 11:17:36 +0100
Message-Id: <20220906101747.344559-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906101747.344559-1-richard.henderson@linaro.org>
References: <20220906101747.344559-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hoist the test of FLAG_MASK_PER to a helper.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 868895b9ae..cd311b4b2a 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -341,12 +341,21 @@ static void update_psw_addr_disp(DisasContext *s, int64_t disp)
     gen_psw_addr_disp(s, psw_addr, disp);
 }
 
+static inline bool per_enabled(DisasContext *s)
+{
+#ifdef CONFIG_USER_ONLY
+    return false;
+#else
+    return unlikely(s->base.tb->flags & FLAG_MASK_PER);
+#endif
+}
+
 static void per_branch(DisasContext *s, bool to_next)
 {
 #ifndef CONFIG_USER_ONLY
     gen_psw_addr_disp(s, gbea, 0);
 
-    if (s->base.tb->flags & FLAG_MASK_PER) {
+    if (per_enabled(s)) {
         if (to_next) {
             TCGv_i64 next_pc = tcg_temp_new_i64();
 
@@ -364,7 +373,7 @@ static void per_branch_cond(DisasContext *s, TCGCond cond,
                             TCGv_i64 arg1, TCGv_i64 arg2)
 {
 #ifndef CONFIG_USER_ONLY
-    if (s->base.tb->flags & FLAG_MASK_PER) {
+    if (per_enabled(s)) {
         TCGLabel *lab = gen_new_label();
         tcg_gen_brcond_i64(tcg_invert_cond(cond), arg1, arg2, lab);
 
@@ -665,7 +674,7 @@ static void gen_op_calc_cc(DisasContext *s)
 
 static bool use_goto_tb(DisasContext *s, uint64_t dest)
 {
-    if (unlikely(s->base.tb->flags & FLAG_MASK_PER)) {
+    if (per_enabled(s)) {
         return false;
     }
     return translator_use_goto_tb(&s->base, dest);
@@ -4491,7 +4500,7 @@ static DisasJumpType op_stura(DisasContext *s, DisasOps *o)
 {
     tcg_gen_qemu_st_tl(o->in1, o->in2, MMU_REAL_IDX, s->insn->data);
 
-    if (s->base.tb->flags & FLAG_MASK_PER) {
+    if (per_enabled(s)) {
         update_psw_addr_disp(s, 0);
         gen_helper_per_store_real(cpu_env);
     }
@@ -6343,7 +6352,7 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
     }
 
 #ifndef CONFIG_USER_ONLY
-    if (s->base.tb->flags & FLAG_MASK_PER) {
+    if (per_enabled(s)) {
         TCGv_i64 addr = tcg_temp_new_i64();
 
         gen_psw_addr_disp(s, addr, 0);
@@ -6466,7 +6475,7 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
     }
 
 #ifndef CONFIG_USER_ONLY
-    if (s->base.tb->flags & FLAG_MASK_PER) {
+    if (per_enabled(s)) {
         /* An exception might be triggered, save PSW if not already done.  */
         if (ret == DISAS_NEXT || ret == DISAS_TOO_MANY) {
             update_psw_addr_disp(s, s->ilen);
@@ -6489,7 +6498,7 @@ static void s390x_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 
     dc->cc_op = CC_OP_DYNAMIC;
     dc->ex_value = dc->base.tb->cs_base;
-    dc->exit_to_mainloop = (dc->base.tb->flags & FLAG_MASK_PER) || dc->ex_value;
+    dc->exit_to_mainloop = per_enabled(dc) || dc->ex_value;
 }
 
 static void s390x_tr_tb_start(DisasContextBase *db, CPUState *cs)
-- 
2.34.1


