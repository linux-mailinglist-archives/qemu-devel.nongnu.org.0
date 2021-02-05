Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7636B310280
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 02:59:32 +0100 (CET)
Received: from localhost ([::1]:37548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7qPD-0004xq-AK
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 20:59:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7qNw-0004Ww-Qi
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 20:58:12 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:46714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7qNu-0007QB-Br
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 20:58:12 -0500
Received: by mail-pf1-x436.google.com with SMTP id f63so3282508pfa.13
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 17:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rQnZeltFcMCYQ9xe609eFENXoL/masnHJpQsAf4wZNg=;
 b=LD0J/q7PNeMxIB/3crWe1k7O3cEC3r8Onr2YVG2Vy1H7Z+wZvR4K7wBOVicu4Rq+n+
 ZQQ4rJLsTiyZOYb6J6+hvJEgulsn3E9V9nC4G4/HayLqEzVn2EGhOl4CwnEM/dh6TrgJ
 zk048PXNZpCTxka0QUJpEU9jtzbXsZlPNdHqsUZkKCZFVJ1kMGTMnY4jiVFNp4mF5cmU
 Rp8MM6zaWG2h2DY0lbV185MxciJU27dVlteLuH1+Wt5cyEJq+2LV3tpEhddtsPdfKTxp
 0R8D/MXRD1jsiH4ZVybo7hYwGAzUeTAbwagyd//3Wa11uSZza+PLF4CLRF30+yyz4+k+
 wxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rQnZeltFcMCYQ9xe609eFENXoL/masnHJpQsAf4wZNg=;
 b=t3RFdV5k/seit7rCVLL8Jok5jxIRChgCA4i7lZe3LuPelAfveT0Gl+tUX0AGK4JCoS
 POmJ3TLV3ukVqnJbs8z547CinJKrKAZBVJ76ox761MMeY1Eq11tKX32yqNgOD7+Qdp5N
 ONo0UVheOyBR53CSSKjnXQhS72anVGS0btArCWvFzZ2BQ4uy/akuzz75HLJIpUQJvVvv
 NKXQmFtB6uOOfkWc/TBh55JPdUXE5qvn1e9Sx0shO6G+lNOobRfAYTCbOa82li3+Fr6l
 UdZVjb8hToV1iatBfKtSCJKmTal8vd5sAwr4uywCWdMQrLv+DemIElshZI3eGoXxvRjS
 S0Ag==
X-Gm-Message-State: AOAM531e2Z8GUEkU1fmlFEaXsO3n7MI52uYjsZv20xqickT6kYr8cwOx
 CU3z6YPwqNqWaMupTowiLMFdZIJjuugyRmOu
X-Google-Smtp-Source: ABdhPJxnV+JZLv3euRYUuzSYTqS3F7Ll21qj4OWKU0AsBnucx8nJgFFAbEbEHb3+dXOmGDe83RaInA==
X-Received: by 2002:aa7:946c:0:b029:1ce:3f04:3f67 with SMTP id
 t12-20020aa7946c0000b02901ce3f043f67mr2332026pfq.6.1612490288122; 
 Thu, 04 Feb 2021 17:58:08 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id 6sm7746246pgv.70.2021.02.04.17.58.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 17:58:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg/aarch64: Do not convert TCGArg to temps that are not temps
Date: Thu,  4 Feb 2021 15:58:04 -1000
Message-Id: <20210205015804.999729-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes INDEX_op_rotli_vec for aarch64 host, where the 3rd
argument is an integer, not a temporary, which now tickles
an assert added in e89b28a6350.

Previously, the value computed into v2 would be garbage for
rotli_vec, but as the value was unused it caused no harm.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 3c1ee39fd4..1376cdc404 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -2488,7 +2488,7 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
     v0 = temp_tcgv_vec(arg_temp(a0));
     v1 = temp_tcgv_vec(arg_temp(va_arg(va, TCGArg)));
     a2 = va_arg(va, TCGArg);
-    v2 = temp_tcgv_vec(arg_temp(a2));
+    va_end(va);
 
     switch (opc) {
     case INDEX_op_rotli_vec:
@@ -2502,6 +2502,7 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
     case INDEX_op_shrv_vec:
     case INDEX_op_sarv_vec:
         /* Right shifts are negative left shifts for AArch64.  */
+        v2 = temp_tcgv_vec(arg_temp(a2));
         t1 = tcg_temp_new_vec(type);
         tcg_gen_neg_vec(vece, t1, v2);
         opc = (opc == INDEX_op_shrv_vec
@@ -2512,6 +2513,7 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
         break;
 
     case INDEX_op_rotlv_vec:
+        v2 = temp_tcgv_vec(arg_temp(a2));
         t1 = tcg_temp_new_vec(type);
         c1 = tcg_constant_vec(type, vece, 8 << vece);
         tcg_gen_sub_vec(vece, t1, v2, c1);
@@ -2525,6 +2527,7 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
         break;
 
     case INDEX_op_rotrv_vec:
+        v2 = temp_tcgv_vec(arg_temp(a2));
         t1 = tcg_temp_new_vec(type);
         t2 = tcg_temp_new_vec(type);
         c1 = tcg_constant_vec(type, vece, 8 << vece);
@@ -2543,8 +2546,6 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
     default:
         g_assert_not_reached();
     }
-
-    va_end(va);
 }
 
 static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
-- 
2.25.1


