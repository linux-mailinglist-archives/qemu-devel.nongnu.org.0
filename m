Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D8153676C
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:21:30 +0200 (CEST)
Received: from localhost ([::1]:43766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufWb-0002dN-RJ
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecU-0003ok-93
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:30 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:41492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecK-0004UX-O8
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:29 -0400
Received: by mail-pg1-x532.google.com with SMTP id e66so4561581pgc.8
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6NR9ATMvKmhumYBvg99Iy+IXyN9viWesjZMf+MpW+xY=;
 b=BiM9RtxFufwUuqSXYqWteLQx1m1XzW6aIcQ6sTeM5WNKwtMCMcpo7MP8CxomT5+eUQ
 QfCE/XFKOxjNNpAlUjfcqqVEsBTOeUDXDAlJkR6fzOHDRO8Qh6eCrJydOZ1bTx2U491F
 j3aSwMzM8p1ip14CZI3OqLIDwtu9kdZGLLJdNTFYdO61JwIR5r4HDzcHQL7eB4DlJ/Yx
 UyLqCc+Z7iBWABA3DYCJ+caQMKG97eXHkZbKcjtXw9JeAcJqfIsG7T2tad5WH86Nrymt
 37DZDeTgcZ4U+VLjS5Vk1fwTC4x7HTkfnfythfIOGkErBoQ9bF8tOA+aTguixx6Z4mog
 0g0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6NR9ATMvKmhumYBvg99Iy+IXyN9viWesjZMf+MpW+xY=;
 b=tO6sjblEgCLAcvrAzsFIuFFRRW5YZHWf5GuV96XeHElmSZA+uUHrD5E4AjbXlsLS/T
 OnLM5RVWORI8l9A+440uFZ+BjE6v4XkyVx9jkwdqZTieYW7xLMMfpe9O6a9fPr/tCqUc
 gPPy7ed+dbodcy5Zt6KjQ6Dp6O6tdRheXt6rknSlTKSESsWdQEcj1NeAlNo5lTE72qBk
 vPKRquVlsjWMJNir463GLa55xtrQwztuC45VmAn82lMEnn+YOK1JRRSLucv0fUEtD883
 ST1n1KVStDRD5Ma2cRS/6uqpE3Aw93zchBlO4GOQskC9riSADSk0IDQRqq2eUcuCJF2U
 I4jg==
X-Gm-Message-State: AOAM530FPy3lDq56INeUC0DCN/i2um5AjuqCSgDL91z0Nh4aSjDRUA5I
 RtgJqR4NcTfbYx4J0kjNOn1gNLbFTZf5Bg==
X-Google-Smtp-Source: ABdhPJyOMa0spXJKj0AWSBn4Se5JslpkQ+80G2bbdIfQzSXI+dkXo9YdMJq+Jdv34p8dLi7jXfjUCQ==
X-Received: by 2002:a63:82c3:0:b0:3fa:d8cb:f2c5 with SMTP id
 w186-20020a6382c3000000b003fad8cbf2c5mr13172227pgd.128.1653675795324; 
 Fri, 27 May 2022 11:23:15 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 073/114] target/arm: Reject copy w/ shifted byte early
Date: Fri, 27 May 2022 11:18:26 -0700
Message-Id: <20220527181907.189259-74-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Remove the unparsed extractions in trans_CPY_{m,z}_i which are intended
to reject an 8-bit shift of an 8-bit constant for 8-bit element.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      | 10 ++++++++--
 target/arm/translate-sve.c |  6 ------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 8cff63cf25..7e79198f5b 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -528,8 +528,14 @@ DUPM            00000101 11 0000 dbm:13 rd:5
 FCPY            00000101 .. 01 .... 110 imm:8 .....             @rdn_pg4
 
 # SVE copy integer immediate (predicated)
-CPY_m_i         00000101 .. 01 .... 01 . ........ .....   @rdn_pg4 imm=%sh8_i8s
-CPY_z_i         00000101 .. 01 .... 00 . ........ .....   @rdn_pg4 imm=%sh8_i8s
+{
+  INVALID       00000101 00 01 ---- 01 1 -------- -----
+  CPY_m_i       00000101 .. 01 .... 01 . ........ .....   @rdn_pg4 imm=%sh8_i8s
+}
+{
+  INVALID       00000101 00 01 ---- 00 1 -------- -----
+  CPY_z_i       00000101 .. 01 .... 00 . ........ .....   @rdn_pg4 imm=%sh8_i8s
+}
 
 ### SVE Permute - Extract Group
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index bf988cab3e..83980f5ee6 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2024,9 +2024,6 @@ static bool trans_FCPY(DisasContext *s, arg_FCPY *a)
 
 static bool trans_CPY_m_i(DisasContext *s, arg_rpri_esz *a)
 {
-    if (a->esz == 0 && extract32(s->insn, 13, 1)) {
-        return false;
-    }
     if (sve_access_check(s)) {
         do_cpy_m(s, a->esz, a->rd, a->rn, a->pg, tcg_constant_i64(a->imm));
     }
@@ -2040,9 +2037,6 @@ static bool trans_CPY_z_i(DisasContext *s, arg_CPY_z_i *a)
         gen_helper_sve_cpy_z_s, gen_helper_sve_cpy_z_d,
     };
 
-    if (a->esz == 0 && extract32(s->insn, 13, 1)) {
-        return false;
-    }
     if (sve_access_check(s)) {
         unsigned vsz = vec_full_reg_size(s);
         tcg_gen_gvec_2i_ool(vec_full_reg_offset(s, a->rd),
-- 
2.34.1


