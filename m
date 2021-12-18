Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4AF479C6A
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 20:50:39 +0100 (CET)
Received: from localhost ([::1]:58880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myfj4-0004YC-MQ
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 14:50:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbc-0000Ry-E8
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:42:56 -0500
Received: from [2607:f8b0:4864:20::631] (port=39914
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfba-0003Rf-UY
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:42:56 -0500
Received: by mail-pl1-x631.google.com with SMTP id z6so4765853plk.6
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 11:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qkswC6z0sn+Yr5unD90+s06LblEPuKcn0DMTalQ57KA=;
 b=l5vQw2+kcA76nG3RWy8udMZ6KgCFDxon6RdejAjO8f0RgXzukvQB1J79/nEvqSYOx/
 EW6SmfUuY2loGcu5N544aGk1YX4AtBR+dOpKAMMck0TQ2YECTsiZq+6dnKLvPNbq1sPD
 U1av9qaLcgEuffQvSTtfMXpSIF6EHo125+tLnO66Kk8t4o4i3Tg+FdwDS4iAHuoWzrsj
 49d3r4y59/dlFI/RmdTpQencULSnqyCji+N24iiZ1o/ty9Jcu3suvI+7e1q+aQfASXTh
 2W0OMKUJsgPmH4g9rISUsayOobKNVk9x6Bsvh2PR3daRtZZ1+YNk7OgXY80yNrN2pddN
 c+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qkswC6z0sn+Yr5unD90+s06LblEPuKcn0DMTalQ57KA=;
 b=Wa3TTZ0DZGZJwXbpff2xQijZtKMzOMz1LFbNx9ABRz6DVCEsncs1C+wjIY9C61YWkZ
 m4er2XLiVY8CiMTJTmTLhY0umRUopjqeYWZhI6b24XWzgnZ0DEJ5s6lq6Hzym6ETDmL0
 RkBZZQdswySvdY2G7dswK8OpEPRCpnAJqDRgDchCLaBJguR2J2z/sxkX1Ewt41BbR4tr
 OCt0sIqz7+O2Y5r3dBmcUi2clbKpdP7Ka0VoA+LnVf+r3LJRg+wXdV7wuP+Lc/dxUvnR
 SZc9B2XqLQAUccmfddB1a6JU8TwxTW0/O+th6tTWKD9aYsDc2SmElmTgteaS0v/fzCBx
 Zf7Q==
X-Gm-Message-State: AOAM533dqZU93aosWGVZmVutudHbkEg31y81BSnoE1W/IylGScpB7JTp
 th7QFSn06UxkcH+2Lv/JBYiByywVypU8Ww==
X-Google-Smtp-Source: ABdhPJzX7jqsH+jfDodxt0HY7cFosK/ViCBw0eXsAe3ZkQ53g4202w/4bhD7fy2XLlFshK3Avde3Og==
X-Received: by 2002:a17:90a:f196:: with SMTP id
 bv22mr1185800pjb.155.1639856573792; 
 Sat, 18 Dec 2021 11:42:53 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id g19sm10645919pfc.145.2021.12.18.11.42.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 11:42:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/20] tcg/ppc: Implement vector NAND, NOR, EQV
Date: Sat, 18 Dec 2021 11:42:33 -0800
Message-Id: <20211218194250.247633-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211218194250.247633-1-richard.henderson@linaro.org>
References: <20211218194250.247633-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.h     |  6 +++---
 tcg/ppc/tcg-target.c.inc | 15 +++++++++++++++
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index d4fd28c6b0..6a6bc3f480 100644
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
index 3e4ca2be88..01fd327eb9 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -3040,6 +3040,9 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_xor_vec:
     case INDEX_op_andc_vec:
     case INDEX_op_not_vec:
+    case INDEX_op_nor_vec:
+    case INDEX_op_eqv_vec:
+    case INDEX_op_nand_vec:
         return 1;
     case INDEX_op_orc_vec:
         return have_isa_2_07;
@@ -3318,6 +3321,15 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
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
@@ -3705,6 +3717,9 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
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


