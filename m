Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CAA6494E1
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 16:34:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4OFm-0006OH-7k; Sun, 11 Dec 2022 10:28:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFi-0006JZ-Vx
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:31 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFf-0007os-PV
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:30 -0500
Received: by mail-oi1-x231.google.com with SMTP id r11so9041432oie.13
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 07:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ORrX5TPBVZIoXMgmIEeKkVB5rHllP4+yQzO9tfkv6A=;
 b=MDtXRg5r6TGGnb0nVHpR5xII7u2F0nqTihmtv+4GaNZMpft8j4Goz6s0VIWKN7zu48
 3PgnKiczriFKajKSSJr4ZjuuoXG2XdFnGIuhjuznUZz9yjDLguklLLl4hjwvM3KD0ohG
 1jFLZwTMNiwrtA5nRgqiYd7wFWNaQDyPbJ4g1jpytNoK0/9OzrFAvjqCphFGU/6wKTDN
 Gpr1AoRfuhRWzrYiNxfz+WKZwUwpAamOOc4WLHfStxgg5gHKWu2/decA+STON2BxvkdG
 3w7g7t+zrM2OmUGlKHgS9Kf2MHizFcms6DUsHoUpj8Y1ThE6kNws0WudWhHazccmJxzm
 UDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ORrX5TPBVZIoXMgmIEeKkVB5rHllP4+yQzO9tfkv6A=;
 b=tuRTrji7VOY++9HEryRF8RZCJGBKgH5pBCycZxOR/bOKkVvRioN2W487R1ph4RDnzB
 EcRZzUIVH+YVoCNhPK8tUiGILDAWoEKykUDhU7CfM1miqHUswmIGY8KYvDniF7L3sMcR
 8+kDYooklIspdYJRUoslpKDMTliNDUmuf3h9TDfIKPMwGaCWUwIzeYihDuSBc+Yiny6d
 I2KzW9EpXudpfvnaAE3b6tH9UNnH3wSw89+936w0b9Pf5YCLyWopek0ztjDoQWJmb0gf
 DS2hebUAPvltKxSl68JYsnhucvNricyUMB0pEwfasOTyj1DujXAtJ1mHIV1KyGOcNvX3
 uvEA==
X-Gm-Message-State: ANoB5pmOGqHxNAk+KNd7UMjuhg9n79GlmQkjNKVBX2QsHO+IM4TQrpEe
 rGQf9z8xKCXmQnV86Gt9U9M68m4svLa0KW6HhDk=
X-Google-Smtp-Source: AA0mqf6N2kfBIj+TGbmiZRkVLAUk8wwg6PItt6Cy0RiU5akMIkjtJyPZcFwMzYSLswjYTkz45I584A==
X-Received: by 2002:aca:1910:0:b0:35e:373e:6015 with SMTP id
 l16-20020aca1910000000b0035e373e6015mr5851238oii.58.1670772504810; 
 Sun, 11 Dec 2022 07:28:24 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:7b4f:f28b:eca6:b583])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a056830233800b006708d2cd8bcsm938140otg.65.2022.12.11.07.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 07:28:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 17/27] target/s390x: Introduce per_enabled
Date: Sun, 11 Dec 2022 09:27:52 -0600
Message-Id: <20221211152802.923900-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211152802.923900-1-richard.henderson@linaro.org>
References: <20221211152802.923900-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
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

Hoist the test of FLAG_MASK_PER to a helper.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 5842a13a97..28c6e0211f 100644
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
@@ -6349,7 +6358,7 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
     }
 
 #ifndef CONFIG_USER_ONLY
-    if (s->base.tb->flags & FLAG_MASK_PER) {
+    if (per_enabled(s)) {
         TCGv_i64 addr = tcg_temp_new_i64();
 
         gen_psw_addr_disp(s, addr, 0);
@@ -6472,7 +6481,7 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
     }
 
 #ifndef CONFIG_USER_ONLY
-    if (s->base.tb->flags & FLAG_MASK_PER) {
+    if (per_enabled(s)) {
         /* An exception might be triggered, save PSW if not already done.  */
         if (ret == DISAS_NEXT || ret == DISAS_TOO_MANY) {
             update_psw_addr_disp(s, s->ilen);
@@ -6497,7 +6506,7 @@ static void s390x_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 
     dc->cc_op = CC_OP_DYNAMIC;
     dc->ex_value = dc->base.tb->cs_base;
-    dc->exit_to_mainloop = (dc->base.tb->flags & FLAG_MASK_PER) || dc->ex_value;
+    dc->exit_to_mainloop = per_enabled(dc) || dc->ex_value;
 }
 
 static void s390x_tr_tb_start(DisasContextBase *db, CPUState *cs)
-- 
2.34.1


