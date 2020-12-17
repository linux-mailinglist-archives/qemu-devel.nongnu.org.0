Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E9C2DD43D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 16:34:40 +0100 (CET)
Received: from localhost ([::1]:50832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpvId-000876-C9
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 10:34:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpue7-0003hv-N6
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:47 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:40745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpue4-00050e-I7
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:47 -0500
Received: by mail-oi1-x231.google.com with SMTP id p126so32419251oif.7
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 06:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WiJrIjKcAYzAf+icIPzlY9kRfNkMth80Cycr47tfyJ4=;
 b=oBJGHur6cEeHhlRI1EwmtjyJBaoCIGY8DEq75GtMZH6z4mxf3enLJyC68UHsO7HdsV
 3OrqPhydDwsoQwtbqTUVVRMdpabiQifFsw6x3kWKsGEYKb98K53YQeme4jJ0z5eNLX62
 2vwT0eP9Qor7wWvAW5EkRhroN4Ks98ukfC8g/3ABkTLQ0h0eoZ/1TEWtRlIPfeBz4XM1
 EMAu1AzEekNapunJhuliHdUxN8xuYc4p0IIBZ/tyqwY9Po4YknAxZA9VZdMqRGjTOaN5
 epTS/nwNoBOFJzyPkVT05ehDVri9dH1oKTEgqTRzNJMDxtK7BgMV593zhXxrTF3SvgHY
 xmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WiJrIjKcAYzAf+icIPzlY9kRfNkMth80Cycr47tfyJ4=;
 b=RCND19sBA94+CYg2TBcxRTBLZISJs69pwW5Q026omEbNpiFWJvl8Qzb9qj7EPnsUuJ
 PoIqjsx4lLIp6P1iWFcZdmEphuPz0cQN+9TuLyjRHByP8FvNkeH+HaUbxnYyiBBPtVl/
 wQRODXFtBImdiqydRuafxJTD0FC36r9q2FncpOoTVhhE2UX6TM7/oDOfzcDEodSl8EFy
 EcDMLXCbesZXZbXU623R1KMP9uDuX5hZtVCOfMoGu25MjHDFg1UD2g73DuAqmt06cXOI
 NX4VZ0zTe+ZmmPaHF0/Gr1kBQQNb8np6nhdq5UcYZZAz/SO4rTGNDu4evHQ6CkX/MSXg
 29Bg==
X-Gm-Message-State: AOAM530U/Ns3GLL4Bm9yQ84mRYOhwyOA8ycjOrXjTh84ISSzbSWYiU7y
 oZFoklEDPPkrTimb1xRJCahL+ZJ86B5sV4tk
X-Google-Smtp-Source: ABdhPJy/pJK6gFKFsKoDoTPxQXZNsrPryGz2d7bpKQyYnEB1gcV/9xHSHsrBBLxUQK766t5Pa6drPw==
X-Received: by 2002:aca:4a84:: with SMTP id x126mr4909542oia.111.1608216762179; 
 Thu, 17 Dec 2020 06:52:42 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id x130sm1136342oif.3.2020.12.17.06.52.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 06:52:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 22/23] tcg/ppc: Use tcg_constant_vec with tcg vec expanders
Date: Thu, 17 Dec 2020 08:52:14 -0600
Message-Id: <20201217145215.534637-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201217145215.534637-1-richard.henderson@linaro.org>
References: <20201217145215.534637-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
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
index 163a5bb32c..8778f729de 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -3332,13 +3332,22 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
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
@@ -3396,7 +3405,7 @@ static void expand_vec_mul(TCGType type, unsigned vece, TCGv_vec v0,
 {
     TCGv_vec t1 = tcg_temp_new_vec(type);
     TCGv_vec t2 = tcg_temp_new_vec(type);
-    TCGv_vec t3, t4;
+    TCGv_vec c0, c16;
 
     switch (vece) {
     case MO_8:
@@ -3415,21 +3424,22 @@ static void expand_vec_mul(TCGType type, unsigned vece, TCGv_vec v0,
 
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


