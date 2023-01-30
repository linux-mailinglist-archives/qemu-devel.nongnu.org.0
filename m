Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B63681C15
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:02:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMbGR-0000RQ-Ae; Mon, 30 Jan 2023 16:00:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbGD-0008Ux-GM
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:00:18 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbG9-0005GP-9z
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:00:15 -0500
Received: by mail-pg1-x530.google.com with SMTP id 7so3671951pgh.7
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 13:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bSXSMaC/L9LQ4Mcvjt9A88GO6mbsN618bFXkABaOrpQ=;
 b=R4NzMTireX9aWHiVRYwGxJti/lkb/JdEXgyam9Y+gbSTUUQbRHR3n7FUOWN6o9oFUQ
 HZCmoT5/5JJ6Ex1Rr3CRJnU0LIxfxHjSUi9YGTh1H87qweLt4IWMuOHUNozIsODKCcMN
 MUpjgflbFBLtr0lgaQm7A/YTb7q34M3QsGmO2ZDMrlcdI5NcWrLnvTEdv9q8PfTO7iYD
 lRQpciLNd3R/jwtvO1C3sJZ+UfLBelVYsqCAxF96NHjNp4Yv+kNKOAr7P74aKyvi6mCP
 tIk/4vzcG4spLnUuS1Fh/q8/rOJcZjFD2s5WHMlarrQqJgVAs6Pn/K/xW09/R/bEwFsB
 x69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bSXSMaC/L9LQ4Mcvjt9A88GO6mbsN618bFXkABaOrpQ=;
 b=mKWNvDjjntXCJbBxKO39rzpp/TuA1xSwpj3SkyxLQ+caEj6IpMOCoofLHVhczpgIGD
 W5DKck5ReQ1emi3FA2V4vSw7UxA3s5DWhW3DUd3/hs7xDU4b4DlQXFHesrt4Olr85N1H
 /zC8n4AmJJZHSC+yTLNMgRPXccNRdzG9cJo3JLSYMX5X41/6DK2wXjH4s/uxkUcgsRXg
 1hbBvhpaWBW4gQuRfNzCNwxcneG0FuZbpBwjRlESXCZAXZNjkEp32VuT8O84xD6dt3Qv
 Np450lE8Ko5mcyrPOlDjJSdo8RRpLTu9Urn1AuXvjMeWpACTwVSYH583xYtLJ0MmX8mv
 Iewg==
X-Gm-Message-State: AO0yUKXUrze8qR+jKztUfnS0XZ+s4/ajky/xTGn+786QiX4HUNsl/OFO
 s40KCzzU9oN7LSnHxQHs0IKMuTYsUTdhea8n
X-Google-Smtp-Source: AK7set9Ef+/to+jR1bXQG9LCoVrc36mbGsCET3EmMb8rOiINbfAwNmVhIc/gYsl6UnhJRuQdbgfhEg==
X-Received: by 2002:aa7:9479:0:b0:591:6436:12d9 with SMTP id
 t25-20020aa79479000000b00591643612d9mr8947880pfq.2.1675112409630; 
 Mon, 30 Jan 2023 13:00:09 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 x10-20020aa79a4a000000b00593eb3a5e44sm102933pfj.37.2023.01.30.13.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 13:00:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	cota@braap.org
Subject: [PATCH 18/27] target/cris: Don't use tcg_temp_local_new
Date: Mon, 30 Jan 2023 10:59:26 -1000
Message-Id: <20230130205935.1157347-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130205935.1157347-1-richard.henderson@linaro.org>
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

Since tcg_temp_new is now identical, use that.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c         |  6 +++---
 target/cris/translate_v10.c.inc | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 905d01288e..a959b27373 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -1621,7 +1621,7 @@ static int dec_bound_r(CPUCRISState *env, DisasContext *dc)
     LOG_DIS("bound.%c $r%u, $r%u\n",
             memsize_char(size), dc->op1, dc->op2);
     cris_cc_mask(dc, CC_MASK_NZ);
-    l0 = tcg_temp_local_new();
+    l0 = tcg_temp_new();
     dec_prep_move_r(dc, dc->op1, dc->op2, size, 0, l0);
     cris_alu(dc, CC_OP_BOUND, cpu_R[dc->op2], cpu_R[dc->op2], l0, 4);
     tcg_temp_free(l0);
@@ -2404,8 +2404,8 @@ static int dec_bound_m(CPUCRISState *env, DisasContext *dc)
             dc->op1, dc->postinc ? "+]" : "]",
             dc->op2);
 
-    l[0] = tcg_temp_local_new();
-    l[1] = tcg_temp_local_new();
+    l[0] = tcg_temp_new();
+    l[1] = tcg_temp_new();
         insn_len = dec_prep_alu_m(env, dc, 0, memsize, l[0], l[1]);
     cris_cc_mask(dc, CC_MASK_NZ);
     cris_alu(dc, CC_OP_BOUND, cpu_R[dc->op2], l[0], l[1], 4);
diff --git a/target/cris/translate_v10.c.inc b/target/cris/translate_v10.c.inc
index f500e93447..9660f28584 100644
--- a/target/cris/translate_v10.c.inc
+++ b/target/cris/translate_v10.c.inc
@@ -68,9 +68,9 @@ static void gen_store_v10_conditional(DisasContext *dc, TCGv addr, TCGv val,
                        unsigned int size, int mem_index)
 {
     TCGLabel *l1 = gen_new_label();
-    TCGv taddr = tcg_temp_local_new();
-    TCGv tval = tcg_temp_local_new();
-    TCGv t1 = tcg_temp_local_new();
+    TCGv taddr = tcg_temp_new();
+    TCGv tval = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
     dc->postinc = 0;
     cris_evaluate_flags(dc);
 
@@ -434,7 +434,7 @@ static void dec10_reg_bound(DisasContext *dc, int size)
 {
     TCGv t;
 
-    t = tcg_temp_local_new();
+    t = tcg_temp_new();
     t_gen_zext(t, cpu_R[dc->src], size);
     cris_alu(dc, CC_OP_BOUND, cpu_R[dc->dst], cpu_R[dc->dst], t, 4);
     tcg_temp_free(t);
@@ -935,7 +935,7 @@ static int dec10_ind_bound(CPUCRISState *env, DisasContext *dc,
     int rd = dc->dst;
     TCGv t;
 
-    t = tcg_temp_local_new();
+    t = tcg_temp_new();
     insn_len += dec10_prep_move_m(env, dc, 0, size, t);
     cris_alu(dc, CC_OP_BOUND, cpu_R[dc->dst], cpu_R[rd], t, 4);
     if (dc->dst == 15) {
-- 
2.34.1


