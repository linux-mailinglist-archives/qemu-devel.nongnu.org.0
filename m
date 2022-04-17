Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 717985048BE
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:02:22 +0200 (CEST)
Received: from localhost ([::1]:34306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9E5-0008Gw-HS
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:02:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8x9-0000m5-20
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:51 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:41509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8x5-0003KP-2Q
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:50 -0400
Received: by mail-pg1-x52c.google.com with SMTP id t13so14959740pgn.8
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IAIkA9WY+ynIkbE8B6qs1qYR9g0d4GyKrWJIQLT3oZA=;
 b=O8+5AEenqKsSi/tqs2XN7GmHHAC0qCtuR9TYGKlfMLI9yLN2JRLEIYJyfFXaU8mnNb
 4ONd5YwXui4ZbYee1FtQduBcVKHwqd4Kc4hZGyw5uSk5rXPvy2FvmQBA86coUjRRJJW/
 2ZuRmqhtx6ICwWKJcq8fp+9kEn3b5jWOHXbgwe1Ix/IxzK1sE2Taofdf2JKPRhsRHnP7
 XxSUJhEQ+jUZr3Vw8b1GPwx49nYOVvw86B8qBkLOVAZ97sCOlKcLU5W1wFLaQUYoy/Y4
 9RTActJcGEz16EMZrFKesN+pNoJ+yK/ZxOgd3s5rw03VvgNazjUljL3rA9I+T16liqlI
 W8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IAIkA9WY+ynIkbE8B6qs1qYR9g0d4GyKrWJIQLT3oZA=;
 b=WtRIE7assqB5VUgLLcAiiEjFaYAYz1wCHeq0G2HQ5HkfB+bfvmLtKdKeE58qrs8wWM
 XYxpbsKAfqZ/FGByf5RwNd1qAA55iX09brS7RAiLAGkd95+Aq6r+wisYZit/f+aXQ1DK
 bc35TJRw9tzLA74VeQeQhJPwSZgz+Eiit260KJdjQba6yRIhBIK9s2Q72J/kxiimWjBs
 VAh386+V/7tRbAsjknV6KdxVlz4ik7i2iYZrYXTXXQSx+QNlB8wJhaPWlaUxNolErqp8
 aY53eNTVJ8Kf+Rw9VjMLAg+h4mcjMjyRkLjfu77klGQRZAwLHa2BB86AT6MHR6GLUvWe
 +mWA==
X-Gm-Message-State: AOAM530C1JDodRVcmxX2kMx+jK8saKkw6j7il5MXV7Ft/ikP2s0I5PSj
 DBAFFesGSjUyX0ELScRG41sGfK8SM9580w==
X-Google-Smtp-Source: ABdhPJyO+MMSQjuSGhPsqjdmDG+SnHKk8eqHWv8TYT5OVFqjVrlq/M+8KVvw/rQBlKQpJ461QUjVmg==
X-Received: by 2002:a63:5115:0:b0:39c:d48d:1b87 with SMTP id
 f21-20020a635115000000b0039cd48d1b87mr7299197pgb.107.1650217485735; 
 Sun, 17 Apr 2022 10:44:45 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 18/60] target/arm: Use tcg_constant in translate-m-nocp.c
Date: Sun, 17 Apr 2022 10:43:44 -0700
Message-Id: <20220417174426.711829-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

Use tcg_constant_{i32,i64} as appropriate throughout.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-m-nocp.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/target/arm/translate-m-nocp.c b/target/arm/translate-m-nocp.c
index d9e144e8eb..27363a7b4e 100644
--- a/target/arm/translate-m-nocp.c
+++ b/target/arm/translate-m-nocp.c
@@ -173,7 +173,7 @@ static bool trans_VSCCLRM(DisasContext *s, arg_VSCCLRM *a)
     }
 
     /* Zero the Sregs from btmreg to topreg inclusive. */
-    zero = tcg_const_i64(0);
+    zero = tcg_constant_i64(0);
     if (btmreg & 1) {
         write_neon_element64(zero, btmreg >> 1, 1, MO_32);
         btmreg++;
@@ -187,8 +187,7 @@ static bool trans_VSCCLRM(DisasContext *s, arg_VSCCLRM *a)
     }
     assert(btmreg == topreg + 1);
     if (dc_isar_feature(aa32_mve, s)) {
-        TCGv_i32 z32 = tcg_const_i32(0);
-        store_cpu_field(z32, v7m.vpr);
+        store_cpu_field(tcg_constant_i32(0), v7m.vpr);
     }
 
     clear_eci_state(s);
@@ -512,7 +511,7 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
     }
     case ARM_VFP_FPCXT_NS:
     {
-        TCGv_i32 control, sfpa, fpscr, fpdscr, zero;
+        TCGv_i32 control, sfpa, fpscr, fpdscr;
         TCGLabel *lab_active = gen_new_label();
 
         lookup_tb = true;
@@ -552,10 +551,9 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         storefn(s, opaque, tmp, true);
         /* If SFPA is zero then set FPSCR from FPDSCR_NS */
         fpdscr = load_cpu_field(v7m.fpdscr[M_REG_NS]);
-        zero = tcg_const_i32(0);
-        tcg_gen_movcond_i32(TCG_COND_EQ, fpscr, sfpa, zero, fpdscr, fpscr);
+        tcg_gen_movcond_i32(TCG_COND_EQ, fpscr, sfpa, tcg_constant_i32(0),
+                            fpdscr, fpscr);
         gen_helper_vfp_set_fpscr(cpu_env, fpscr);
-        tcg_temp_free_i32(zero);
         tcg_temp_free_i32(sfpa);
         tcg_temp_free_i32(fpdscr);
         tcg_temp_free_i32(fpscr);
-- 
2.25.1


