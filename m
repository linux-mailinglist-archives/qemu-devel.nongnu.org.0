Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6406451039F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:37:06 +0200 (CEST)
Received: from localhost ([::1]:41868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOBV-0005U3-FS
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5Z-0002vs-Mt
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:30:58 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:56154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5U-0003m7-Ma
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:30:55 -0400
Received: by mail-pj1-x1032.google.com with SMTP id r9so1858278pjo.5
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i0bYNx9gMtvu3dlOAIwhnpYW7XVbsWcDBUkTNgwOrpw=;
 b=Sx9RPNmKCVT1C2W34YVjGEQ5EcfDecgYJR47kQQEYUsL/9xrZCk0tIUd83mGJNBE90
 DGJ2kf3b/cXg/Mp3CePtkMBwlZG228pde+6nVsOajDL3/Ao/fkwmcKOF60qawsTnGqhb
 CzrbigbooAMyKuQsjBOvCi1OXWt6gNhtyAct8c8NZ8OE2tIGv+JTHcZtpH6SYfu8pNr2
 qb7VVnJ0IroeIM8Ry+A45xHiHwbIs4VEKGn8nHBDhoSr+ZUrzmbq9EvvDr7Xff+KM8Uo
 07uksuKh1j3FT29AoP73rGmlBhjeA2ei9EulTav5PwleE6mnlaGOxs0rUxm8Oq7fT5fB
 sIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i0bYNx9gMtvu3dlOAIwhnpYW7XVbsWcDBUkTNgwOrpw=;
 b=kJe20A+xbsJOH1qJT87E8yZEfncvh3cEowP+risMuma23+xbq78NJsXTiMKDgeclVQ
 MsxxeEPRTYO4cPwUtZihlQ21bv0N38ouBJ4yyvZ6o+W4awSC2QSV1fEAtAMxxSYe5GZY
 KdmAMrDqgkzDFHzYHQHxSeSxirNziM/AtEEHVAreQHUuoCOiaWZMhdyq8CxOaQM8Bmh7
 37Eh5MDKyjpH8vR6E75y20MNV/HYX6dYFMhglobaYV++56wKnLai9ttkV3o92S6CgXE8
 cKWSNi/9U7a1xSv13wGppuW+LsEvpJmrLZ/K+xtQnyPVX17n/9aVgY+tFiT6caIBW/AO
 cyvg==
X-Gm-Message-State: AOAM533HvcNWEKEVNzDex7Wt86D2+tqNTeqoU5EOH2w3wNkMN+O6VtMj
 sv9esCHV4ZK3V1Df5fx6Vdeis185qSzTIg==
X-Google-Smtp-Source: ABdhPJz26oud3wqOIDjWjMPNL+0q0fxBzv+eKB1y1JBVR0HUvxg18ZdJXJ3rxjkyzfaJUzGm/cArHA==
X-Received: by 2002:a17:902:c2cc:b0:15b:a4e6:f58c with SMTP id
 c12-20020a170902c2cc00b0015ba4e6f58cmr23902468pla.149.1650990651073; 
 Tue, 26 Apr 2022 09:30:51 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:30:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/47] target/arm: Use tcg_constant in handle_sys
Date: Tue, 26 Apr 2022 09:30:02 -0700
Message-Id: <20220426163043.100432-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 31 +++++++++----------------------
 1 file changed, 9 insertions(+), 22 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ec4765362b..5d1bccaf46 100644
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
2.34.1


