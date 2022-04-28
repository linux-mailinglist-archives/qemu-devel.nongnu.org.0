Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 755885137B2
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:05:21 +0200 (CEST)
Received: from localhost ([::1]:38482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5ho-0002dQ-GR
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:05:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5JT-00053d-T7
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:11 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5JS-0006Dj-78
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:11 -0400
Received: by mail-wr1-x435.google.com with SMTP id k2so7087225wrd.5
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=foEZXg9mJmplMi/dn+uJoWShhkvsQk1MZSIpAHMV1Xo=;
 b=D03AKJbQI4qzq+gjA5IXkAl8LMXqf1hIrvhM/yb6pgBIcUMNXCjDq69uaL6vhkkYmV
 VFRTb5EEsYJJMT97aotIaZXBZ/6g21bzwvKTxj53IwxyC8dnOVj70PT1rTBYUGkMH27Z
 BMTdEXX9VXNbjVEE7MTy1kS0pJApsbsRK53f0rbZJqBWFd3c5ttq38p3Mve/9IQXFi37
 V8gmuBmyrsug1DiMD1RnG7ZMc/uoldtmsaT4BCUgzr3PXY6nl31Dmx0/CoXJ//neR5Wy
 8XPwZZan0ZpmpWwyUn52IGiIRU1T8ihxR1XdF/anYLiw24cp0HYNty2yancKEaGtitIs
 F06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=foEZXg9mJmplMi/dn+uJoWShhkvsQk1MZSIpAHMV1Xo=;
 b=o9sYJKwB4Fd15ANZwnRy/lYbvcctzntzO/r+yswem7CKR7ns3CiZDsQbhgKXYo4vIx
 YeB8yNKYxVOwNDpuAhIGsBwn1A35Oyyg0aVQKBAwTTZSncNqs65PtL8oRyTzvu0zJhF8
 2zXXXoTpJLDJrAFdJHwK0PWHTlww/m1yQzuSgwHQMvWNPEWBX6XT/dFSIE4JM+tih4TF
 +XZKNMMvK+r5pJgPfzz5rG/AyWqotllnYW2ME8MkzS3rg1KSPn1xwS9TNQ2FGV8yBpr/
 MXmO0kHC/C/EtGYqoxDMtYY60eTqbH5trwt6DswjOYaoN+KMwO7ScYNu88uxc0XZhqZw
 ZkoQ==
X-Gm-Message-State: AOAM532O9EV93SbtnLQKGanPvoyF3tWY/Ig1/KHzwrWFTMn1nWrGRj6Q
 R1C6jrmOOUeGE+VSejq6MVpRyNT62grn6Q==
X-Google-Smtp-Source: ABdhPJyXfg/jFYtXMHGGZnr5jEt9ZcCGaW16Hb47qcFWa1gPVylLW3tNi/ZuOFdWyDJFp9xoW1Dy0w==
X-Received: by 2002:adf:b1db:0:b0:20a:bcb5:6526 with SMTP id
 r27-20020adfb1db000000b0020abcb56526mr27568848wra.305.1651156808863; 
 Thu, 28 Apr 2022 07:40:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/54] target/arm: Use tcg_constant in handle_sys
Date: Thu, 28 Apr 2022 15:39:10 +0100
Message-Id: <20220428143958.2451229-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220426163043.100432-7-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 31 +++++++++----------------------
 1 file changed, 9 insertions(+), 22 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ec4765362bd..5d1bccaf469 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1818,19 +1818,14 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
         /* Emit code to perform further access permissions checks at
          * runtime; this may result in an exception.
          */
-        TCGv_ptr tmpptr;
-        TCGv_i32 tcg_syn, tcg_isread;
         uint32_t syndrome;
 
-        gen_a64_set_pc_im(s->pc_curr);
-        tmpptr = tcg_const_ptr(ri);
         syndrome = syn_aa64_sysregtrap(op0, op1, op2, crn, crm, rt, isread);
-        tcg_syn = tcg_const_i32(syndrome);
-        tcg_isread = tcg_const_i32(isread);
-        gen_helper_access_check_cp_reg(cpu_env, tmpptr, tcg_syn, tcg_isread);
-        tcg_temp_free_ptr(tmpptr);
-        tcg_temp_free_i32(tcg_syn);
-        tcg_temp_free_i32(tcg_isread);
+        gen_a64_set_pc_im(s->pc_curr);
+        gen_helper_access_check_cp_reg(cpu_env,
+                                       tcg_constant_ptr(ri),
+                                       tcg_constant_i32(syndrome),
+                                       tcg_constant_i32(isread));
     } else if (ri->type & ARM_CP_RAISES_EXC) {
         /*
          * The readfn or writefn might raise an exception;
@@ -1861,17 +1856,15 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
     case ARM_CP_DC_ZVA:
         /* Writes clear the aligned block of memory which rt points into. */
         if (s->mte_active[0]) {
-            TCGv_i32 t_desc;
             int desc = 0;
 
             desc = FIELD_DP32(desc, MTEDESC, MIDX, get_mem_index(s));
             desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
             desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
-            t_desc = tcg_const_i32(desc);
 
             tcg_rt = new_tmp_a64(s);
-            gen_helper_mte_check_zva(tcg_rt, cpu_env, t_desc, cpu_reg(s, rt));
-            tcg_temp_free_i32(t_desc);
+            gen_helper_mte_check_zva(tcg_rt, cpu_env,
+                                     tcg_constant_i32(desc), cpu_reg(s, rt));
         } else {
             tcg_rt = clean_data_tbi(s, cpu_reg(s, rt));
         }
@@ -1935,10 +1928,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
         if (ri->type & ARM_CP_CONST) {
             tcg_gen_movi_i64(tcg_rt, ri->resetvalue);
         } else if (ri->readfn) {
-            TCGv_ptr tmpptr;
-            tmpptr = tcg_const_ptr(ri);
-            gen_helper_get_cp_reg64(tcg_rt, cpu_env, tmpptr);
-            tcg_temp_free_ptr(tmpptr);
+            gen_helper_get_cp_reg64(tcg_rt, cpu_env, tcg_constant_ptr(ri));
         } else {
             tcg_gen_ld_i64(tcg_rt, cpu_env, ri->fieldoffset);
         }
@@ -1947,10 +1937,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
             /* If not forbidden by access permissions, treat as WI */
             return;
         } else if (ri->writefn) {
-            TCGv_ptr tmpptr;
-            tmpptr = tcg_const_ptr(ri);
-            gen_helper_set_cp_reg64(cpu_env, tmpptr, tcg_rt);
-            tcg_temp_free_ptr(tmpptr);
+            gen_helper_set_cp_reg64(cpu_env, tcg_constant_ptr(ri), tcg_rt);
         } else {
             tcg_gen_st_i64(tcg_rt, cpu_env, ri->fieldoffset);
         }
-- 
2.25.1


