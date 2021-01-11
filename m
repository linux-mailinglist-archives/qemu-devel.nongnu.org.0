Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EF72F1C94
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 18:38:05 +0100 (CET)
Received: from localhost ([::1]:41298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz18m-0003C2-UX
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 12:38:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0s3-0003PO-K7
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:20:47 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:54623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0rk-0000NU-Bk
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:20:46 -0500
Received: by mail-pj1-x102e.google.com with SMTP id f14so8175976pju.4
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 09:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=VLAvWvNnNgLaMZdiybYsc0aBns7VEvbUJaVjvegbPqs=;
 b=l1SfREUWrV9sgwvRTwhKkn2XzPX+OiDX1GybN2nOllY/IttV4kBmQGPKQzCwBp7614
 HjJ5IfFozAlrnDEfhAheYMFBFNORX/iDZrT+K29C5/voP2DNXh+mrCxwOtFxaCSFfTp6
 6yiAe0Yu8P8fW7op7WdApKM1gchtILIHTG1cr8F1KBEjAPFqEEOQCY+16lgXSGZ5E8Ib
 6oo+lK0f5dAOe0VVBC8lxg4/yRJd5iidxQ49p1W3FqXc23wS8CdrfGe6YKqLewxuiuiJ
 9YrJl9705w7DgD/etkfcP/qRa20O9bVLJbLFOnmM109aFr5xZAPg7cV2oPQQvWXb+WJd
 jiVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VLAvWvNnNgLaMZdiybYsc0aBns7VEvbUJaVjvegbPqs=;
 b=H9hWIdtbHy0UcuyChEswiPRRZYwBUyYivFjCMrBRxv12ToZUIXJkwgkI9X7xMdmb4f
 yLIQmDe8R51iah1VDPyJhsCsXEYms/qYogzqVS6zs9DUM9rkxfmThb5J7FhOHYRdV/Uo
 x1tH7iy1VXPKJSqiPdVgbGiXTBD0yHiORWGgmZTQ9ooFF8xxjSi9ZB6zJMa3RfmF2EMf
 ZEL0pWbldG3vcthx76CLAcBjfbbObmx0ZrdjlYetda1UsatwBEr0yp/O1PjvVXDBkCY8
 nImKzYa9ALev9UP6MSsvwe+3Bxate70Rjmw57Q+Y6pTsB+xUXprndxoVPOmQlDZ+ENej
 a51g==
X-Gm-Message-State: AOAM530mKIXHoI7JCnH0NOQt+2A1/1Fnw6Vv+gLvIsgA6nxeecM/dPew
 2BjppFLfvlydFPHMcJenXXTgvP0U4U6MIg==
X-Google-Smtp-Source: ABdhPJzqX52yrcgW6Bap16OcIazSdVV6kom/jqonIccS1n2lGJAIWPG7nVeeXl8xL65S7VZsv0eyyw==
X-Received: by 2002:a17:90a:f3c5:: with SMTP id
 ha5mr266829pjb.61.1610385626006; 
 Mon, 11 Jan 2021 09:20:26 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id k64sm206666pfd.75.2021.01.11.09.20.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 09:20:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 22/23] tcg/ppc: Use tcg_constant_vec with tcg vec expanders
Date: Mon, 11 Jan 2021 07:19:45 -1000
Message-Id: <20210111171946.219469-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111171946.219469-1-richard.henderson@linaro.org>
References: <20210111171946.219469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

Improve expand_vec_shi to use sign-extraction for MO_32.
This allows a single VSPLTISB instruction to load all of
the valid shift constants.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 44 ++++++++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 1fbb1b6db0..cf64892295 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -3336,13 +3336,22 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
 static void expand_vec_shi(TCGType type, unsigned vece, TCGv_vec v0,
                            TCGv_vec v1, TCGArg imm, TCGOpcode opci)
 {
-    TCGv_vec t1 = tcg_temp_new_vec(type);
+    TCGv_vec t1;
 
-    /* Splat w/bytes for xxspltib.  */
-    tcg_gen_dupi_vec(MO_8, t1, imm & ((8 << vece) - 1));
+    if (vece == MO_32) {
+        /*
+         * Only 5 bits are significant, and VSPLTISB can represent -16..15.
+         * So using negative numbers gets us the 4th bit easily.
+         */
+        imm = sextract32(imm, 0, 5);
+    } else {
+        imm &= (8 << vece) - 1;
+    }
+
+    /* Splat w/bytes for xxspltib when 2.07 allows MO_64. */
+    t1 = tcg_constant_vec(type, MO_8, imm);
     vec_gen_3(opci, type, vece, tcgv_vec_arg(v0),
               tcgv_vec_arg(v1), tcgv_vec_arg(t1));
-    tcg_temp_free_vec(t1);
 }
 
 static void expand_vec_cmp(TCGType type, unsigned vece, TCGv_vec v0,
@@ -3400,7 +3409,7 @@ static void expand_vec_mul(TCGType type, unsigned vece, TCGv_vec v0,
 {
     TCGv_vec t1 = tcg_temp_new_vec(type);
     TCGv_vec t2 = tcg_temp_new_vec(type);
-    TCGv_vec t3, t4;
+    TCGv_vec c0, c16;
 
     switch (vece) {
     case MO_8:
@@ -3419,21 +3428,22 @@ static void expand_vec_mul(TCGType type, unsigned vece, TCGv_vec v0,
 
     case MO_32:
         tcg_debug_assert(!have_isa_2_07);
-        t3 = tcg_temp_new_vec(type);
-        t4 = tcg_temp_new_vec(type);
-        tcg_gen_dupi_vec(MO_8, t4, -16);
+        /*
+         * Only 5 bits are significant, and VSPLTISB can represent -16..15.
+         * So using -16 is a quick way to represent 16.
+         */
+        c16 = tcg_constant_vec(type, MO_8, -16);
+        c0 = tcg_constant_vec(type, MO_8, 0);
+
         vec_gen_3(INDEX_op_rotlv_vec, type, MO_32, tcgv_vec_arg(t1),
-                  tcgv_vec_arg(v2), tcgv_vec_arg(t4));
+                  tcgv_vec_arg(v2), tcgv_vec_arg(c16));
         vec_gen_3(INDEX_op_ppc_mulou_vec, type, MO_16, tcgv_vec_arg(t2),
                   tcgv_vec_arg(v1), tcgv_vec_arg(v2));
-        tcg_gen_dupi_vec(MO_8, t3, 0);
-        vec_gen_4(INDEX_op_ppc_msum_vec, type, MO_16, tcgv_vec_arg(t3),
-                  tcgv_vec_arg(v1), tcgv_vec_arg(t1), tcgv_vec_arg(t3));
-        vec_gen_3(INDEX_op_shlv_vec, type, MO_32, tcgv_vec_arg(t3),
-                  tcgv_vec_arg(t3), tcgv_vec_arg(t4));
-        tcg_gen_add_vec(MO_32, v0, t2, t3);
-        tcg_temp_free_vec(t3);
-        tcg_temp_free_vec(t4);
+        vec_gen_4(INDEX_op_ppc_msum_vec, type, MO_16, tcgv_vec_arg(t1),
+                  tcgv_vec_arg(v1), tcgv_vec_arg(t1), tcgv_vec_arg(c0));
+        vec_gen_3(INDEX_op_shlv_vec, type, MO_32, tcgv_vec_arg(t1),
+                  tcgv_vec_arg(t1), tcgv_vec_arg(c16));
+        tcg_gen_add_vec(MO_32, v0, t1, t2);
         break;
 
     default:
-- 
2.25.1


