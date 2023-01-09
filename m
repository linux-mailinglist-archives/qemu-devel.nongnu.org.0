Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DED1663135
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:17:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEyRq-0003Bi-D3; Mon, 09 Jan 2023 15:08:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRn-00036l-Il
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:43 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRm-0007OD-1J
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:43 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 fz16-20020a17090b025000b002269d6c2d83so12049851pjb.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pQ4eU68d6z+rZoABNFvXkHrbyWgsMN7s71IQ0UJs6N0=;
 b=wLW+rxir/D7rTySQYb6fSnngxAqvxxbqzNKy6X7/WJlOhXZlSJSHFNCo8zOS1HNznB
 Ey9PcgAkA3GwkP6iXqCVdJXc0NW0fhsgou1FDvcl2B+D6nmPzEPQhQ4pI7J/+ZH/UO4M
 flpR9CKsk82L6KJvYgbbtOiaLJVbYUwXmXxLcpSo5mQKnZNteHoIIDJU1Gic6/Z6UkB2
 GT45tgq9dKlmvMjl1MPNG3CH+ohuHD9Jxe9LBQNi1x9/uhgnOiXHraGW6vs6QQyQVth3
 kpXdO3Jky/7mAgpCdy0Lx3zHXpH+n7Y3/InjLB4xPb+T3KlAfpPlgHCCwNd8LvneY2MU
 vWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pQ4eU68d6z+rZoABNFvXkHrbyWgsMN7s71IQ0UJs6N0=;
 b=czVn2Dbq9QjMDOfSE1GXXIF1O5zVTkMKIZhP+HEQU5NlhBjHWUOeqabjRmXvfq1V4s
 zPwHXsg2A5Ch9a4Y3SGmvu1jrajpFLto3hugvCJNnP6wDpccEpUEHAOdyCMeBySF5jmf
 RaVltr8Y/5Y3D69Fo3Lfr5ByU4JDuUqngPtELKU5pR1J5ojzly0xuyTzqdoQobrp1nHG
 6Cm7DATPKKIxJU8Lv5flsdJ3YnSIaJ250ZyCR4nl93A43wdw4mJs2hqbiyPxdpuHK0Nj
 cBcMSf+5xzsqAciJ1wGHoTF50B9dGK6W3+kRiN2IL27AKohXkY7QseVLfR/9PDK5Vacu
 Lt1Q==
X-Gm-Message-State: AFqh2ko57ahdchafq2ZGdyO7/oe5VZrHHribibOdD9HGvSZyPmtjUmzL
 tR9wIJUPrMj+oVoBjNca1OPKWMZcoupt/d/s
X-Google-Smtp-Source: AMrXdXsAnT1QsDw8Wvilx+YXr2YVYQOb+s4FNKkGbykzZCv6qnApD25Iju8XIhV7vJUgPNNfMGjLCg==
X-Received: by 2002:a17:90a:b011:b0:226:8fc5:b55 with SMTP id
 x17-20020a17090ab01100b002268fc50b55mr24062859pjq.33.1673294920745; 
 Mon, 09 Jan 2023 12:08:40 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:158e:facf:7a46:ba9f])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a17090a384200b0022727d4af8dsm577574pjf.48.2023.01.09.12.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:08:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 17/27] target/s390x: Introduce per_enabled
Date: Mon,  9 Jan 2023 12:08:09 -0800
Message-Id: <20230109200819.3916395-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109200819.3916395-1-richard.henderson@linaro.org>
References: <20230109200819.3916395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
index b84b0062ca..b02b76dfad 100644
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
@@ -4493,7 +4502,7 @@ static DisasJumpType op_stura(DisasContext *s, DisasOps *o)
 {
     tcg_gen_qemu_st_tl(o->in1, o->in2, MMU_REAL_IDX, s->insn->data);
 
-    if (s->base.tb->flags & FLAG_MASK_PER) {
+    if (per_enabled(s)) {
         update_psw_addr_disp(s, 0);
         gen_helper_per_store_real(cpu_env);
     }
@@ -6351,7 +6360,7 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
     }
 
 #ifndef CONFIG_USER_ONLY
-    if (s->base.tb->flags & FLAG_MASK_PER) {
+    if (per_enabled(s)) {
         TCGv_i64 addr = tcg_temp_new_i64();
 
         gen_psw_addr_disp(s, addr, 0);
@@ -6474,7 +6483,7 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
     }
 
 #ifndef CONFIG_USER_ONLY
-    if (s->base.tb->flags & FLAG_MASK_PER) {
+    if (per_enabled(s)) {
         /* An exception might be triggered, save PSW if not already done.  */
         if (ret == DISAS_NEXT || ret == DISAS_TOO_MANY) {
             update_psw_addr_disp(s, s->ilen);
@@ -6499,7 +6508,7 @@ static void s390x_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 
     dc->cc_op = CC_OP_DYNAMIC;
     dc->ex_value = dc->base.tb->cs_base;
-    dc->exit_to_mainloop = (dc->base.tb->flags & FLAG_MASK_PER) || dc->ex_value;
+    dc->exit_to_mainloop = per_enabled(dc) || dc->ex_value;
 }
 
 static void s390x_tr_tb_start(DisasContextBase *db, CPUState *cs)
-- 
2.34.1


