Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC92F2F5747
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 03:38:07 +0100 (CET)
Received: from localhost ([::1]:35268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzsWU-0002S6-Rw
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 21:38:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzsCg-0003pv-Gz
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 21:17:38 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:52229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzsCe-0003XX-Hi
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 21:17:38 -0500
Received: by mail-pj1-x102e.google.com with SMTP id v1so2268169pjr.2
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 18:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VLAvWvNnNgLaMZdiybYsc0aBns7VEvbUJaVjvegbPqs=;
 b=aYd53ngV6wfm5jjjG/WurHCSMJusyT+eChAvMuNuoJvsn2meXeh1Cprt44rG/xvj2h
 xDqbpVgJlO/4vJ8X+kV7zs1tApu/7kar4Ex03Lz+QLNtSNgDuj1aCCSaDTHGbxX8hFMJ
 bKtryzcpxhlyuyhgPIDxlECNEzU+75z5QYNkHkWHXaPVwGyY3rQo8eOFtqm4fGlDmP45
 KO8CV3r9Wcyk32XX5DRjCHk8HkDRWKmuzxpdp31GBWt10OJ/5YXaKr/9YIFs6CzIvs8R
 Ds4weEcIGGDTFKsUEFaEDA47DAc59P916EuDNN3jPuaHGfv7HasgQ9hKHQhrcLDdCpIs
 iYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VLAvWvNnNgLaMZdiybYsc0aBns7VEvbUJaVjvegbPqs=;
 b=N/IPTxoUZG4YpH+JOmRSL5Wphr9/pkrYDDPquIcgg8nE3GJ8ffjCkbr0gyFFlgRhaW
 PwFO6JEaUEmbsS9YorL+BL4TbLP7hluEAjAGo6ZVu99ZKOSvoaqAHCg/v7bd5dTyOEoP
 NV/dpXM/6CAwzatFFSpuyHS9n2HA67r4Jq6vRDdKjYRejlzjRTAq7Yc7lqdLj7zl7RPw
 RFovJOSfW6kXnLd37F6FCjG6ctiYcLcE3Z9gL5cZ0G/mp7c5Q5ifYwAxqJ1Oe/Lx3BGc
 ypntdOjmxY5ezBd/wg6fSqDXP2TWpI4S2/Wh4kENUVte3FfsXmxamkme7H8Er4uXMmHM
 FNHw==
X-Gm-Message-State: AOAM531ZolYJQbfauAnfQ3FEspBoro4aEutAelitGzj1cxVvubHnCr64
 x00zmFqovCL/uBsBQ9PJuF8zOznHo5YAlQ==
X-Google-Smtp-Source: ABdhPJwPipYsObqQWd7DxN/muda8ctxhOlsiSH8T6cUv2vZWDxeUtu303+Y4BtCosn42PLVPsZX2EA==
X-Received: by 2002:a17:90a:528b:: with SMTP id
 w11mr2428672pjh.73.1610590655007; 
 Wed, 13 Jan 2021 18:17:35 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id i7sm3771687pfc.50.2021.01.13.18.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 18:17:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/24] tcg/ppc: Use tcg_constant_vec with tcg vec expanders
Date: Wed, 13 Jan 2021 16:16:52 -1000
Message-Id: <20210114021654.647242-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114021654.647242-1-richard.henderson@linaro.org>
References: <20210114021654.647242-1-richard.henderson@linaro.org>
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
Cc: peter.maydell@linaro.org
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


