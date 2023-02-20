Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 072F369D2F6
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 19:45:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUB8G-0006Rb-BC; Mon, 20 Feb 2023 13:43:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6a-0004aF-GJ
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:47 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6P-00049U-Ij
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:37 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 qi12-20020a17090b274c00b002341621377cso2189141pjb.2
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 10:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hVAOE5bYdVyLdxBG7UtWUVaMQMKRna4hS5x0eRllW54=;
 b=GnAhD7GXydMvaC3vTO71Fxt3hkdATyKEStLYnS1eY2zKuPQvE7dIYMh1vxgDBcpNlu
 K8sVfRjly7lSdPBhRVcXsuYSc9IMtn7d3HTHfj3w576T0LVuv2rc1zBx3zPJTg2cwKZc
 oLgGIfZoFQ5z/8YdMk73hb+pCRKKHOoxXsWmv+V7cWdIIBxOdLw32KMYQtTK98JgE6yb
 fhayb+gCWbTMRdREwVEFL8ACLm7xCFBjqEnY3DpfysZ4mBEVIxhokq9/C57bhZn3b9ea
 auu4L/5IgftpPD9QrD4GCRTKPqLnE3msTu0V8DVGiAvho8AOdxrI8FpXkdLQTWn9QbMC
 clkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hVAOE5bYdVyLdxBG7UtWUVaMQMKRna4hS5x0eRllW54=;
 b=N+UrA5gg7f8j144nzJjjGLv6KWoGFTPakEBdGLZ7Apt2QPMdplAEao/CyMQjApw6P/
 vM5wZjpytkk7JD6RLM1WUF83onxdf1hKrc7N106P1TOzm5S6rcOL62yu7KWjQV4zgvCc
 b2GcXoPpuzP434gdxtC/i6vaS9BWR7HPbNi719Nt0+BQnRFa/ZMwZ0lHyRAS3LYhdQLt
 ACQeRUCy52/kfqnVKi/CoRmgB6duSlzXIfNqbPHZC4rIB66qqBT4tnL+mmV4fAX6p1Y5
 NwlIHHeMz9rLLk/P50xE63pdyamtc4lndnwPzcfuwTsn1C0etJOmnbg8Y8OTn5p0T89C
 o4YA==
X-Gm-Message-State: AO0yUKWxHSa58Dkh+GwhnAGpRcrJXaM1rEzCtDu6AFYXrO5Rj0nPhQ/N
 10PJDihlfkQKW1y9/bx5AD9Ln1Qz+/poSY4zl3o=
X-Google-Smtp-Source: AK7set95SnEw20Zyern+l8Xmuyhh86CeyzWzFzSSfzUlAstwT9gwD2F8znuvTzoonBJxqIU+aiF8cA==
X-Received: by 2002:a17:902:d488:b0:196:5f75:66f9 with SMTP id
 c8-20020a170902d48800b001965f7566f9mr5228172plg.63.1676918487037; 
 Mon, 20 Feb 2023 10:41:27 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jk20-20020a170903331400b0019258bcf3ffsm1911676plb.56.2023.02.20.10.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 10:41:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 17/27] target/s390x: Introduce per_enabled
Date: Mon, 20 Feb 2023 08:40:42 -1000
Message-Id: <20230220184052.163465-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220184052.163465-1-richard.henderson@linaro.org>
References: <20230220184052.163465-1-richard.henderson@linaro.org>
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

Hoist the test of FLAG_MASK_PER to a helper.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index d8dad71814..433703b4c9 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -353,12 +353,21 @@ static void update_psw_addr_disp(DisasContext *s, int64_t disp)
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
 
@@ -376,7 +385,7 @@ static void per_branch_cond(DisasContext *s, TCGCond cond,
                             TCGv_i64 arg1, TCGv_i64 arg2)
 {
 #ifndef CONFIG_USER_ONLY
-    if (s->base.tb->flags & FLAG_MASK_PER) {
+    if (per_enabled(s)) {
         TCGLabel *lab = gen_new_label();
         tcg_gen_brcond_i64(tcg_invert_cond(cond), arg1, arg2, lab);
 
@@ -680,7 +689,7 @@ static void gen_op_calc_cc(DisasContext *s)
 
 static bool use_goto_tb(DisasContext *s, uint64_t dest)
 {
-    if (unlikely(s->base.tb->flags & FLAG_MASK_PER)) {
+    if (per_enabled(s)) {
         return false;
     }
     return translator_use_goto_tb(&s->base, dest);
@@ -4506,7 +4515,7 @@ static DisasJumpType op_stura(DisasContext *s, DisasOps *o)
 {
     tcg_gen_qemu_st_tl(o->in1, o->in2, MMU_REAL_IDX, s->insn->data);
 
-    if (s->base.tb->flags & FLAG_MASK_PER) {
+    if (per_enabled(s)) {
         update_psw_addr_disp(s, 0);
         gen_helper_per_store_real(cpu_env);
     }
@@ -6413,7 +6422,7 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
     }
 
 #ifndef CONFIG_USER_ONLY
-    if (s->base.tb->flags & FLAG_MASK_PER) {
+    if (per_enabled(s)) {
         TCGv_i64 addr = tcg_temp_new_i64();
 
         gen_psw_addr_disp(s, addr, 0);
@@ -6544,7 +6553,7 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
     }
 
 #ifndef CONFIG_USER_ONLY
-    if (s->base.tb->flags & FLAG_MASK_PER) {
+    if (per_enabled(s)) {
         /* An exception might be triggered, save PSW if not already done.  */
         if (ret == DISAS_NEXT || ret == DISAS_TOO_MANY) {
             update_psw_addr_disp(s, s->ilen);
@@ -6569,7 +6578,7 @@ static void s390x_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 
     dc->cc_op = CC_OP_DYNAMIC;
     dc->ex_value = dc->base.tb->cs_base;
-    dc->exit_to_mainloop = (dc->base.tb->flags & FLAG_MASK_PER) || dc->ex_value;
+    dc->exit_to_mainloop = per_enabled(dc) || dc->ex_value;
 }
 
 static void s390x_tr_tb_start(DisasContextBase *db, CPUState *cs)
-- 
2.34.1


