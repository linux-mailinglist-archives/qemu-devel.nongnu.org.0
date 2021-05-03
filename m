Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B569F371FEA
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 20:50:12 +0200 (CEST)
Received: from localhost ([::1]:58746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldddz-0004kI-Pi
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 14:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lddQO-0005tH-4B
 for qemu-devel@nongnu.org; Mon, 03 May 2021 14:36:08 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:33522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lddQA-0008Ia-9c
 for qemu-devel@nongnu.org; Mon, 03 May 2021 14:36:07 -0400
Received: by mail-pf1-x42d.google.com with SMTP id h11so4877524pfn.0
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 11:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q894i9n7Id8k1ZQ47A2dG3zYZ+36xN7hyIYM+zBegek=;
 b=Vy+gKURYIhgkw0X4WYmpjQ0NwN33IiXlhNGm8l1Vcp9wFlLsORbV++vLgGlAVuVeKT
 PKs2IlOr/Mf+gKHLj/DK+ezthtSfnTyjsa4OUhsBYuWt8YeOMvZUS/Pcxt/CiDEsUw4G
 PslJRODEQnFkAhrznElfxPQ5CxjgEEGN9wiohK2v2r76GuWcCDxF5qU+dPM8kt7l8Y4Y
 eRAO8pguuKiuu3s3/UEulQnrbvTbdm+s5N1HPxERf3lHAfTxZbJ3wxGfCQvbbfptZ8zM
 75iNYOqzj6g6JqFrPLY1kXresWwdWrguMhN1AfVOpbJEqidSoUyr2PpAYmWFOcR6lkYx
 901g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q894i9n7Id8k1ZQ47A2dG3zYZ+36xN7hyIYM+zBegek=;
 b=G/o3RJvyZ4mowPLIXPjo5bkLeKTnfyMLJS+UkCsGJvSVBdKUZHKkKh8WKmDwdb1s1W
 bZlQJQhioRz8C6Allsbq5WYo6hgLB1PW4k4c/ZZMKlXF2gjlTECLemYf+ziGT8MaKrnM
 2A3qfTNWH1z9kaDvg/V/QC8pt1/dW7eCbtXsMpVTspHEEZ/10Q3UMcNHvJYZwgTaprrY
 cDaDw3ieXXCZd68PRoa1wli63quDhAaqXgasMlRbF0JWOl09t9JNiFYqYGOiE6SALZL9
 T1bfiMhMI/ILKftHEt1M/EtzhZVnpWdjkvPMi+YlDQnYmjwKLVZ7fzPzyIAU4sGtIxxY
 xWYA==
X-Gm-Message-State: AOAM532KxiEM2ae384jRhLzS0j/4AzwtnZ6QCiemG1z2WczlELYW762S
 ozRNHPeYiyWgB2DFwA9WgmlKLcSSuCAjuQ==
X-Google-Smtp-Source: ABdhPJywWGnqwi0uEhs7VjFKAUDLBNiA8VxOb5DCqJi4flr/JTBBU6gHhr9BWwyXTgseeQvCR0ozLA==
X-Received: by 2002:a17:90a:cc11:: with SMTP id
 b17mr22636719pju.119.1620066953014; 
 Mon, 03 May 2021 11:35:53 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q27sm4251567pfl.41.2021.05.03.11.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 11:35:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/16] tcg/s390x: Implement TCG_TARGET_HAS_cmpsel_vec
Date: Mon,  3 May 2021 11:35:41 -0700
Message-Id: <20210503183541.2014496-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210503183541.2014496-1-richard.henderson@linaro.org>
References: <20210503183541.2014496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: thuth@redhat.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is via expansion; don't actually set TCG_TARGET_HAS_cmpsel_vec.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 178b992b78..0a0777dadb 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -2835,6 +2835,7 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_xor_vec:
         return 1;
     case INDEX_op_cmp_vec:
+    case INDEX_op_cmpsel_vec:
     case INDEX_op_rotrv_vec:
         return -1;
     case INDEX_op_mul_vec:
@@ -2897,6 +2898,21 @@ static void expand_vec_cmp(TCGType type, unsigned vece, TCGv_vec v0,
     }
 }
 
+static void expand_vec_cmpsel(TCGType type, unsigned vece, TCGv_vec v0,
+                              TCGv_vec c1, TCGv_vec c2,
+                              TCGv_vec v3, TCGv_vec v4, TCGCond cond)
+{
+    TCGv_vec t = tcg_temp_new_vec(type);
+
+    if (expand_vec_cmp_noinv(type, vece, t, c1, c2, cond)) {
+        /* Invert the sense of the compare by swapping arguments.  */
+        tcg_gen_bitsel_vec(vece, v0, t, v4, v3);
+    } else {
+        tcg_gen_bitsel_vec(vece, v0, t, v3, v4);
+    }
+    tcg_temp_free_vec(t);
+}
+
 static void expand_vec_sat(TCGType type, unsigned vece, TCGv_vec v0,
                            TCGv_vec v1, TCGv_vec v2, TCGOpcode add_sub_opc)
 {
@@ -2938,7 +2954,7 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
                        TCGArg a0, ...)
 {
     va_list va;
-    TCGv_vec v0, v1, v2, t0;
+    TCGv_vec v0, v1, v2, v3, v4, t0;
 
     va_start(va, a0);
     v0 = temp_tcgv_vec(arg_temp(a0));
@@ -2950,6 +2966,12 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
         expand_vec_cmp(type, vece, v0, v1, v2, va_arg(va, TCGArg));
         break;
 
+    case INDEX_op_cmpsel_vec:
+        v3 = temp_tcgv_vec(arg_temp(va_arg(va, TCGArg)));
+        v4 = temp_tcgv_vec(arg_temp(va_arg(va, TCGArg)));
+        expand_vec_cmpsel(type, vece, v0, v1, v2, v3, v4, va_arg(va, TCGArg));
+        break;
+
     case INDEX_op_rotrv_vec:
         t0 = tcg_temp_new_vec(type);
         tcg_gen_neg_vec(vece, t0, v2);
-- 
2.25.1


