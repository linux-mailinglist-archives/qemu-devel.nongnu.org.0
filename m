Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 738F44CC7BD
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:16:22 +0100 (CET)
Received: from localhost ([::1]:43458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPso9-0003q7-Hu
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:16:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYW-000642-Ub
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:14 -0500
Received: from [2607:f8b0:4864:20::431] (port=39680
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYV-0004IK-FJ
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:12 -0500
Received: by mail-pf1-x431.google.com with SMTP id y11so5797947pfa.6
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 13:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QDDlJN6MJVLgjog2f3d7nAGveYgDV1Ef+8NhvEcVhw0=;
 b=lZAummEdnh+Z7wOIbjqpW/rwV70H/w3ucGyUVo+HyLkATZGqNPP8UkLjf+sz0hZ+y6
 jwuObTzX695uToHv5ehrGZ2MtNbaA4nKpJwF0vo1dw+ad09kgNud59NAve6j1hylMH5N
 FH4r9qAsNbBoiold7MZHvFqVKCdZEFSpWi5w2EKdF036XQ/m3gmQwOtouQoS/9mcR51s
 6410YxxaTqG+P3i95z86RzcaQK/zO3Ssto+XEuytUJDCe8CcT/cO86bYBBMG1nI08Oaq
 HvOrlJaFm7CaxeiEt77v/18FXSwWWQ9D+n7PDpaTxXKJdDRhWjrCFo+CWIZvC/41+3Zo
 LnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QDDlJN6MJVLgjog2f3d7nAGveYgDV1Ef+8NhvEcVhw0=;
 b=HU7zLqfMAE9/j8ILBm1HGmqEtRCtWfX5YxjvoJA3N6qyeuovSv/QR9mw5+qo+4u4W/
 ENpAjBek/gKizeeehpK8Lv3/yOs3OgQvQBb1LAXtsKKzBwYgE2Hp1VbNakA1+4apLsju
 fdsZ8uitZuEy87CEMiJp+eO+p7h3xErrJvIJbzJmO3X5CtbByH/41VIaCHCvALdQc1bQ
 LcebR6OFtFljpXsPnpJg/rrc0nRchKCglPfZnMfTpYRHltZYLxgNr7gf2Yg5/25epb5f
 jrRj6U4W/fdCt8z1O0qMX9AvyoDMtNKnT6w55tSBBaGdzmK3cnbVY0rAi3aR9cXUyL9W
 95oQ==
X-Gm-Message-State: AOAM530ctvrWuSP/qhTUj9Gnw4hfDnc8jydYPDBrX/sLwKakzAAD0gnv
 MreFBTnDWfT+3MscJ+K5/pGjYyxXG2dHXw==
X-Google-Smtp-Source: ABdhPJzurlz3ZoUIfclDWNuWUfvxbq6pjY97Z/9IghRn3b8sFGOu2x8yuI6tV3WtK6SYwvceDZ1HOQ==
X-Received: by 2002:a63:202:0:b0:37c:4cfc:b89f with SMTP id
 2-20020a630202000000b0037c4cfcb89fmr5635880pgc.396.1646341210102; 
 Thu, 03 Mar 2022 13:00:10 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a6549c8000000b00372eb3a7fb3sm2729934pgs.92.2022.03.03.13.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 13:00:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/30] tcg/i386: Expand vector word rotate as avx512vbmi2
 shift-double
Date: Thu,  3 Mar 2022 10:59:29 -1000
Message-Id: <20220303205944.469445-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303205944.469445-1-richard.henderson@linaro.org>
References: <20220303205944.469445-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While there are no specific 16-bit rotate instructions, there
are double-word shifts, which can perform the same operation.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index a39f890a7d..19cf124456 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -3444,6 +3444,8 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_rotlv_vec:
     case INDEX_op_rotrv_vec:
         switch (vece) {
+        case MO_16:
+            return have_avx512vbmi2 ? -1 : 0;
         case MO_32:
         case MO_64:
             return have_avx512vl ? 1 : have_avx2 ? -1 : 0;
@@ -3588,6 +3590,12 @@ static void expand_vec_rotli(TCGType type, unsigned vece,
         return;
     }
 
+    if (have_avx512vbmi2) {
+        vec_gen_4(INDEX_op_x86_vpshldi_vec, type, vece,
+                  tcgv_vec_arg(v0), tcgv_vec_arg(v1), tcgv_vec_arg(v1), imm);
+        return;
+    }
+
     t = tcg_temp_new_vec(type);
     tcg_gen_shli_vec(vece, t, v1, imm);
     tcg_gen_shri_vec(vece, v0, v1, (8 << vece) - imm);
@@ -3618,8 +3626,16 @@ static void expand_vec_rotls(TCGType type, unsigned vece,
 static void expand_vec_rotv(TCGType type, unsigned vece, TCGv_vec v0,
                             TCGv_vec v1, TCGv_vec sh, bool right)
 {
-    TCGv_vec t = tcg_temp_new_vec(type);
+    TCGv_vec t;
 
+    if (have_avx512vbmi2) {
+        vec_gen_4(right ? INDEX_op_x86_vpshrdv_vec : INDEX_op_x86_vpshldv_vec,
+                  type, vece, tcgv_vec_arg(v0), tcgv_vec_arg(v1),
+                  tcgv_vec_arg(v1), tcgv_vec_arg(sh));
+        return;
+    }
+
+    t = tcg_temp_new_vec(type);
     tcg_gen_dupi_vec(vece, t, 8 << vece);
     tcg_gen_sub_vec(vece, t, t, sh);
     if (right) {
-- 
2.25.1


