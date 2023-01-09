Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A411166315E
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:22:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEyRv-0003LJ-G7; Mon, 09 Jan 2023 15:08:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRt-0003Jg-DM
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:49 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRr-0007dI-RK
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:49 -0500
Received: by mail-pl1-x634.google.com with SMTP id d15so10764904pls.6
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+SI0XUmUuaGz6hJl5x1dC7kSwvxrktFEO3C5LNkUTlA=;
 b=dRdUGTRlCxPXUAuczo3KgTRzA0OgMnJN9v+fJd06wlnnSCdPeH3IAPFVaDuuHDt5VU
 R2MYADF2Uh09fLWreHR6ZKalBSIC3sxK2XHt/eB/ns2xcibsscoTAb1kPW3drgWAs9PI
 fpzFlAV4ghQ6pW3IRBEUA2XEwLCd2JEUKtewB7oYin57k6+WVvfkiQOKeErCBG8fS2el
 VL5Jr/HOqvzvwLu38LqIULrTHJ8m3hYK4Ljw2Rp/Gn+ADwLIxDPldo2zm+MEkad+8U9r
 xHHA7RcRXAhA1K5sy0TuiodrIpxhyUxPfiX4t5/yCNnkPfJ1dWWKy0/9Ll1B9B81O212
 bbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+SI0XUmUuaGz6hJl5x1dC7kSwvxrktFEO3C5LNkUTlA=;
 b=g3lJ3HCSYjOFIk/nJ9RDYlNYmJ9rX93pGMUjDBqkVrOFmAEOIAn8Y4TcnSbhO/Cjip
 lhZtCcwB3Pjy3YVaJlHLoOzvRez/QlMG+rje5s6mRYyHYCmOfiSepV2M05ZpFw9VDbVG
 IxR0L6vHBZsIZx+T3fOA4fGmvkIBjlnu7arO+vyjwFbcAZVJDEyWqQosLxLk+CIckIn1
 qi2BhIoAhTP3jbIiyV8Gbzu5B7tjVvBtIxRG/RPUxd8I4WunHqIape3bxo4wHkk1pfX1
 3SUqElnko5WlwN34RCQKYnTtR3A+GYITiSQt1U1hlhSLHAM3F2InIASfueHcQ61Cs0L+
 Gurg==
X-Gm-Message-State: AFqh2kqjA6bj0vbFGeIe2Kja079qtCUmFk3199fSfYaReGRBvT1gjaQX
 xii1yPWrXkyLz87wpXZCOSXHwlqlQAVjumkp
X-Google-Smtp-Source: AMrXdXsXvnKpgXOZ1zEfslDZCQQ98wd0uIIZBRjVMeTMRyV0QI3J7mSxmLFM6Y+jXqGGeAr+xAFf5w==
X-Received: by 2002:a17:90a:630a:b0:225:c317:137c with SMTP id
 e10-20020a17090a630a00b00225c317137cmr60939706pjj.36.1673294925904; 
 Mon, 09 Jan 2023 12:08:45 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:158e:facf:7a46:ba9f])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a17090a384200b0022727d4af8dsm577574pjf.48.2023.01.09.12.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:08:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 22/27] target/s390x: Split per_breaking_event from
 per_branch_*
Date: Mon,  9 Jan 2023 12:08:14 -0800
Message-Id: <20230109200819.3916395-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109200819.3916395-1-richard.henderson@linaro.org>
References: <20230109200819.3916395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

This allows us to update gbea before other updates to psw_addr,
which will be important for TARGET_TB_PCREL.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index aca2d214bb..3b7591790d 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -353,7 +353,6 @@ static inline bool per_enabled(DisasContext *s)
 static void per_branch_dest(DisasContext *s, TCGv_i64 dest)
 {
 #ifndef CONFIG_USER_ONLY
-    gen_psw_addr_disp(s, gbea, 0);
     if (per_enabled(s)) {
         gen_helper_per_branch(cpu_env, gbea, dest);
     }
@@ -363,7 +362,6 @@ static void per_branch_dest(DisasContext *s, TCGv_i64 dest)
 static void per_branch_disp(DisasContext *s, int64_t disp)
 {
 #ifndef CONFIG_USER_ONLY
-    gen_psw_addr_disp(s, gbea, 0);
     if (per_enabled(s)) {
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


