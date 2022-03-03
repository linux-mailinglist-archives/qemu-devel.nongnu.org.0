Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC784CC7A2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:11:17 +0100 (CET)
Received: from localhost ([::1]:54476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPsjE-0000Tc-Ig
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:11:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYG-0005NA-EQ
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:59:56 -0500
Received: from [2607:f8b0:4864:20::102e] (port=44714
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYE-000435-SQ
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:59:56 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 gj15-20020a17090b108f00b001bef86c67c1so6034398pjb.3
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 12:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bWl3aAWm4Lw6+OWvwzdrL8E0pb9qeQYkIVix/IeF/Z4=;
 b=qG0QogFcyfN/2UyLT7oP8Y3ghhI2M3eFkTQ9fABffn8BXNas7S2i2GpqjVNmbPSxTr
 AUOhEBx3pZNCVfhU1BsgkeEoK61xZhSQLiGNV/Kfvh6/CMgGELLAiNJ3j2yyZDOUjuOh
 IqGCUpkxZQartb4V2slMrfvNQ2pKPztKyHXmD/9FdJM3IMMb6cXecU3hgr/4dyy/rJKH
 oueNJoPnPhi4ArB85kxZEF5nC1TC9zllExBWtBxqxdD+1IayMWqOVpF5pdaDhQ0GCgQu
 BdKGGUq2untujLIhw+Tvh0s4wFqcZHGlS52/Tp46HJH3oSfzGkjTtW3dzgH0hgTWA6PR
 H28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bWl3aAWm4Lw6+OWvwzdrL8E0pb9qeQYkIVix/IeF/Z4=;
 b=elVK5aWTbFtb9QAvhtSk0XIBG2o3XXltSQfbBQZpxdo7ppzQXJi9AzovhyHM+z9Tsz
 azv39Og86rJiaF/5FdxcbtPZWqx2PnDxha2aZy+G299ygC43maeeqrIQ9X5lO0/rnF2T
 +UXAru3MvX7QgvdZeiFR/luTqxiRSKU4g0vCj2Ftd4dXJMXR8nLZL0vpSokkyjMyRtU6
 RqXSsFMVqacKkUBDyDMpt8fjrT7rZYMGEnwH4mZ6EAGeaaUDdRcoDbYryfHPWZHMMIMD
 fRzY6b3hdBsh6cKl3g7+Ws0HGp9vOwuVsUnAADXevv13lu07oeGDv1PXsJtGoK1Jjnzo
 19Ag==
X-Gm-Message-State: AOAM531TK8TTbeuw7C+uWZun8IhwpNeryg1GoarkxXtaMnbzqhNP9pNS
 X5Dm3wAiHW690WV951wBsh9iXaVhTsDA8Q==
X-Google-Smtp-Source: ABdhPJwZmMN5n/BhlHCWjgSdiB0S34+27cndkT+q1VfuBLgGHHogjY3faq534dmDaTmgsPclnraYFQ==
X-Received: by 2002:a17:90a:7e95:b0:1bc:5d56:8d4c with SMTP id
 j21-20020a17090a7e9500b001bc5d568d4cmr7221728pjl.93.1646341193593; 
 Thu, 03 Mar 2022 12:59:53 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a6549c8000000b00372eb3a7fb3sm2729934pgs.92.2022.03.03.12.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 12:59:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/30] tcg/ppc: Implement vector NAND, NOR, EQV
Date: Thu,  3 Mar 2022 10:59:18 -1000
Message-Id: <20220303205944.469445-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303205944.469445-1-richard.henderson@linaro.org>
References: <20220303205944.469445-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.h     |  6 +++---
 tcg/ppc/tcg-target.c.inc | 15 +++++++++++++++
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index 3e543161eb..e6cf72503f 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -162,9 +162,9 @@ extern bool have_vsx;
 
 #define TCG_TARGET_HAS_andc_vec         1
 #define TCG_TARGET_HAS_orc_vec          have_isa_2_07
-#define TCG_TARGET_HAS_nand_vec         0
-#define TCG_TARGET_HAS_nor_vec          0
-#define TCG_TARGET_HAS_eqv_vec          0
+#define TCG_TARGET_HAS_nand_vec         have_isa_2_07
+#define TCG_TARGET_HAS_nor_vec          1
+#define TCG_TARGET_HAS_eqv_vec          have_isa_2_07
 #define TCG_TARGET_HAS_not_vec          1
 #define TCG_TARGET_HAS_neg_vec          have_isa_3_00
 #define TCG_TARGET_HAS_abs_vec          0
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 69d22e08cb..1f3c5c171c 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -3122,6 +3122,9 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_xor_vec:
     case INDEX_op_andc_vec:
     case INDEX_op_not_vec:
+    case INDEX_op_nor_vec:
+    case INDEX_op_eqv_vec:
+    case INDEX_op_nand_vec:
         return 1;
     case INDEX_op_orc_vec:
         return have_isa_2_07;
@@ -3400,6 +3403,15 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_orc_vec:
         insn = VORC;
         break;
+    case INDEX_op_nand_vec:
+        insn = VNAND;
+        break;
+    case INDEX_op_nor_vec:
+        insn = VNOR;
+        break;
+    case INDEX_op_eqv_vec:
+        insn = VEQV;
+        break;
 
     case INDEX_op_cmp_vec:
         switch (args[3]) {
@@ -3787,6 +3799,9 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_xor_vec:
     case INDEX_op_andc_vec:
     case INDEX_op_orc_vec:
+    case INDEX_op_nor_vec:
+    case INDEX_op_eqv_vec:
+    case INDEX_op_nand_vec:
     case INDEX_op_cmp_vec:
     case INDEX_op_ssadd_vec:
     case INDEX_op_sssub_vec:
-- 
2.25.1


