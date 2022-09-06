Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 482755AE795
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 14:14:12 +0200 (CEST)
Received: from localhost ([::1]:55014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVXT1-0006hb-Cx
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 08:14:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVf5-0003mW-8L
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:31 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:56151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVeq-0005HL-B3
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:31 -0400
Received: by mail-wm1-x331.google.com with SMTP id d5so6603807wms.5
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=5HalDKM2t7tQ28RoBBhE3f7ultMsCTeXd5L6wovkjbQ=;
 b=x3npsYAbpal7gqEMs7qrhcUKdBtoJbGMgEy2g59OKeDBnrr3SPj45ySp/bMF4FrDH5
 E/Ki9WpfmYaq4vjEIzThH8uko4FoxsNw02eO18b5A+s5lP+NFnO+NzTXYDQZduQ6vvhn
 XpdezIsHwWEUeR6AEf8Goj9u+jDbZFYWWQkKwgO6a7VSD0J201kxL/wVRohNoWeOKeQv
 xuUfSEScBprZxFdKXm8F8bTbNayHbnsKLriQBGOec+iq1p2dpz4/2VqJ4qiWZQpyNuXO
 an0CMMiBBvza64FM65Nced/6E0MkNuP5SOBT+w2lQ1GaqTymhWxWhdCC4/bSixHZa5YP
 cO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=5HalDKM2t7tQ28RoBBhE3f7ultMsCTeXd5L6wovkjbQ=;
 b=h6+F5vG63QqFkJZDO98FG/n0z2aGsaYhj59V9pxykl0uFM6uVn/JtdACNUwsqTl1UT
 xN/MGvevjyNS3myZ1Vcp6diwvqKizMVYx9V39IICFsqwVRg2xSNI7KQ3XtaUdgZnoGvQ
 sUpJ4JMue9nF5mun2oDCLtOw0/Zzdhh298AGYGahyGkVmsNswg0Q0KjFyVhrZ4HC9sSq
 Hna1jTdf67yMlhuET4NLhTuHxm5eVQuk+1WUJmTtyUZ0CKcjJId2A94NA7mGyBRePuic
 B5sjfZ/F6N00Q+JKmg+s32mdh4RoTGWdsb1vjcCoysCgNl3oBb0r8RVC+WTqmH2XmOmK
 VnAA==
X-Gm-Message-State: ACgBeo3PE0cqILVKfkpcXx2O/MVx2Kf+HXZm5cKYmc+A6iVIkk7olrxo
 y3JHFww9nFhNIzvMpOsS0Tp3UJNO/DIckoYV
X-Google-Smtp-Source: AA6agR5AmHi2QpUmoJLxt2zELKRwRXuEXXStQgyqsxesx9H0togQ81NM86XqaSqFnNSWdZTggUpPcQ==
X-Received: by 2002:a7b:c34b:0:b0:3a6:8516:a729 with SMTP id
 l11-20020a7bc34b000000b003a68516a729mr13640404wmj.83.1662459490235; 
 Tue, 06 Sep 2022 03:18:10 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c365000b003a62bc1735asm14094361wmq.9.2022.09.06.03.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:18:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH v1 20/26] target/s390x: Split per_breaking_event from
 per_branch_*
Date: Tue,  6 Sep 2022 11:17:41 +0100
Message-Id: <20220906101747.344559-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906101747.344559-1-richard.henderson@linaro.org>
References: <20220906101747.344559-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This allows us to update gbea before other updates to psw_addr,
which will be important for TARGET_TB_PCREL.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 498dc2930d..a2315ac73e 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -353,7 +353,6 @@ static inline bool per_enabled(DisasContext *s)
 static void per_branch_dest(DisasContext *s, TCGv_i64 dest)
 {
 #ifndef CONFIG_USER_ONLY
-    gen_psw_addr_disp(s, gbea, 0);
     if (s->base.tb->flags & FLAG_MASK_PER) {
         gen_helper_per_branch(cpu_env, gbea, dest);
     }
@@ -363,7 +362,6 @@ static void per_branch_dest(DisasContext *s, TCGv_i64 dest)
 static void per_branch_disp(DisasContext *s, int64_t disp)
 {
 #ifndef CONFIG_USER_ONLY
-    gen_psw_addr_disp(s, gbea, 0);
     if (s->base.tb->flags & FLAG_MASK_PER) {
         TCGv_i64 dest = tcg_temp_new_i64();
         gen_psw_addr_disp(s, dest, disp);
@@ -1153,13 +1151,14 @@ struct DisasInsn {
 
 static DisasJumpType help_goto_direct(DisasContext *s, int64_t disp)
 {
+    per_breaking_event(s);
+
     if (disp == s->ilen) {
         per_branch_disp(s, disp);
         return DISAS_NEXT;
     }
     if (use_goto_tb(s, s->base.pc_next + disp)) {
         update_cc_op(s);
-        per_breaking_event(s);
         tcg_gen_goto_tb(0);
         update_psw_addr_disp(s, disp);
         tcg_gen_exit_tb(s->base.tb, 0);
@@ -1173,6 +1172,7 @@ static DisasJumpType help_goto_direct(DisasContext *s, int64_t disp)
 
 static DisasJumpType help_goto_indirect(DisasContext *s, TCGv_i64 dest)
 {
+    per_breaking_event(s);
     tcg_gen_mov_i64(psw_addr, dest);
     per_branch_dest(s, psw_addr);
     return DISAS_PC_UPDATED;
@@ -1233,6 +1233,7 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
     }
 
     /* Branch taken.  */
+    per_breaking_event(s);
     if (is_imm) {
         gen_psw_addr_disp(s, psw_addr, disp);
     }
-- 
2.34.1


