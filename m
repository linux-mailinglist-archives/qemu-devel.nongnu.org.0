Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1160A5F5FEE
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 06:11:11 +0200 (CEST)
Received: from localhost ([::1]:53578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogIE2-00080g-4q
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 00:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoP-0004Ka-MU
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:45 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:54066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoN-0003wr-0P
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:41 -0400
Received: by mail-pj1-x102f.google.com with SMTP id fw14so656515pjb.3
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=OTnwC3I8LADyA6oY2sKnptmoUlM1a+IpjL6VUPaeMMw=;
 b=r4FmGQeJ4/3xPmXM1JJfD3wKanJu5zMtHLIR5x7sxDrKxxxonMLokYsaab8Bn6XWJh
 2i/V8UtMsfNOSsHvB+1krMhD3nNauWvta6aaQQ+wl9mt5dBv6s0uKuFc0kYwXSsxrSOV
 3R8MhYSTD7NtGNKWaKEJt4NIrSoH4rPNXbK9zuRNMrteyLJq1VoymN1ryz2ErW4GJZEo
 GQTUNvMebMElW/4/C6xgriiU0g/VEJL1FBa57rFaJa2PvfqkV5aHq3tz30gNhNs4LNXU
 oqoO9s90lQu4LPlQ6vgBE4ATv22Q+cIoOAciBCMyp9QTFrdgN6+HGhMaWzzcUHY+3xi5
 w6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=OTnwC3I8LADyA6oY2sKnptmoUlM1a+IpjL6VUPaeMMw=;
 b=HCi2Jgqj1AaelKyMhb362Y6Oiku3pWggdeBLRft6ZVUWlALbFijboh0hplBqn5l1DM
 DPhl9Zqqc2hORVwNc+srYy5ZNrFGiu/tHdK34Do4SiX4+Cz1QJcQTaED92JgCbz2XMxu
 1J40VYH0XCDaeDGIJAMg77HWBdBy7hZeK7vGipiZSv+mJnk0EeJ3mOduvUAi752JE8nU
 AkM3eYQQ0LizxEcVi0Wxixiw9739Tkgpl6iicryNGyKtAyEG5qDXGIAyuvLS7IelpZV3
 2X+V90qmLDzYUSi4yAmA76o3Xtl5IKYzfZzSQxg8rVzc4WwVq6EaJ4TgSdkHB/K1/GWV
 6QoQ==
X-Gm-Message-State: ACrzQf3xw8gZ/HL4GFp7DmokoxG1tQ6Uu6/FWcR06n0WA2Kxd7633m3B
 8bWVcZRjY3d1WkVTERxkTmV80YN1E4NCMw==
X-Google-Smtp-Source: AMsMyM5GbImDVZfeYszyV1DpvN7yMcrlmGQhGcwOnGUBQbNVXyQzQzvsccWcYvtk6aVOsmkPRqRszA==
X-Received: by 2002:a17:902:9a07:b0:178:8024:1393 with SMTP id
 v7-20020a1709029a0700b0017880241393mr2631649plp.128.1665027877439; 
 Wed, 05 Oct 2022 20:44:37 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a17090ad0c600b00205f4f7a3b3sm1905086pjw.21.2022.10.05.20.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:44:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH 15/26] target/s390x: Introduce per_enabled
Date: Wed,  5 Oct 2022 20:44:10 -0700
Message-Id: <20221006034421.1179141-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006034421.1179141-1-richard.henderson@linaro.org>
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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


