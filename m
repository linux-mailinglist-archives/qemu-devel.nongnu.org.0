Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C55436F8F7
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:13:16 +0200 (CEST)
Received: from localhost ([::1]:38498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcR59-0007C2-FS
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQUW-0007v2-NH
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:24 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:36468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQUH-0001Q5-OV
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:23 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 f15-20020a05600c4e8fb029013f5599b8a9so1457958wmq.1
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CMIwZrwBPChwnGRRggA6LqI9YdKQxFLgyoTpze9RWRA=;
 b=MSebDb8DRdvXQ3eYmSlP1u/II3ZbnGK5Hlx60qc8a9EA1VJ7rnJpU2gOJOHhJc4o7/
 zyXSCUESSyLxZr7vz69aWj6YS6J0nIG51C8GjM+BEEl8+UiDdKon4guQyaIkfQ6oq4yg
 LDu/hvV0UWhkH8m3J6kifi82Gzb2u3Z7JIuVOSnfMouEmcf9tLBplQoy0G0EVdQS0Y2Z
 DZfvfcX9niyhbHO2OwbRT/g96UfjnHtpA1mM39Cy3WImQqsDhoNZtQvm0DnnbF+LOZez
 W/pBx/e+ajlf7qjV1k5/jv+VpiE8hk5dNXwqk9aSYBpl4n9UqHXbxXcSLMlON59Dw4t2
 CYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CMIwZrwBPChwnGRRggA6LqI9YdKQxFLgyoTpze9RWRA=;
 b=XQH5GmyDX2g59hUyAFjLCabqAnozhKr2WH7LxW2NIfvX0CresbrE/YW7ha9PyTfLRY
 y8TFd5hIwdRcyViymiYttxmxwjL/uKabwcPeDE/Zlkh4jsSf2JaSl1d6XdxvSosBmADl
 rCyQDVFNW37H+2jPnMVsQGA6tRZstn5Vwk3Ie7JdsJykangoBdTEwaVL7fDpHzeY8tuS
 ELLzeBMr5dLv+vtHoUw4NR/KX71qCgAaXQuOJUbMlpneE42Ti7Jw8LJZKPYo08F9bQyb
 MahQuSjdx1en+6SrSFXKuKRB8awt0RQknyZPApFS34JbRcpnMa7bkBoia1A0uBzEBvy9
 AGbQ==
X-Gm-Message-State: AOAM531yPb8z7D/M7h5U1dOxnixNduiFsUxI5G5uSKSFOogNxOs2d6RP
 cAeMTqr0TG7qgijpXS82DSetUsxeJB8jXymL
X-Google-Smtp-Source: ABdhPJykFiIF8vZdXPCmZJzn1fJIs0tXv11SmReNliPLBVNwqKeHJ4mZd/dhPcj/VCj+ide+ogGtMg==
X-Received: by 2002:a7b:c091:: with SMTP id r17mr15637275wmh.28.1619778908074; 
 Fri, 30 Apr 2021 03:35:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.35.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:35:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 40/43] target/arm: Enforce alignment for aa64 vector LDn/STn
 (single)
Date: Fri, 30 Apr 2021 11:34:34 +0100
Message-Id: <20210430103437.4140-41-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
References: <20210430103437.4140-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210419202257.161730-31-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2a82dbbd6d4..95897e63af0 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3815,6 +3815,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
     int index = is_q << 3 | S << 2 | size;
     int xs, total;
     TCGv_i64 clean_addr, tcg_rn, tcg_ebytes;
+    MemOp mop;
 
     if (extract32(insn, 31, 1)) {
         unallocated_encoding(s);
@@ -3876,6 +3877,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
 
     clean_addr = gen_mte_checkN(s, tcg_rn, !is_load, is_postidx || rn != 31,
                                 total);
+    mop = finalize_memop(s, scale);
 
     tcg_ebytes = tcg_const_i64(1 << scale);
     for (xs = 0; xs < selem; xs++) {
@@ -3883,8 +3885,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
             /* Load and replicate to all elements */
             TCGv_i64 tcg_tmp = tcg_temp_new_i64();
 
-            tcg_gen_qemu_ld_i64(tcg_tmp, clean_addr,
-                                get_mem_index(s), s->be_data + scale);
+            tcg_gen_qemu_ld_i64(tcg_tmp, clean_addr, get_mem_index(s), mop);
             tcg_gen_gvec_dup_i64(scale, vec_full_reg_offset(s, rt),
                                  (is_q + 1) * 8, vec_full_reg_size(s),
                                  tcg_tmp);
@@ -3892,9 +3893,9 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
         } else {
             /* Load/store one element per register */
             if (is_load) {
-                do_vec_ld(s, rt, index, clean_addr, scale | s->be_data);
+                do_vec_ld(s, rt, index, clean_addr, mop);
             } else {
-                do_vec_st(s, rt, index, clean_addr, scale | s->be_data);
+                do_vec_st(s, rt, index, clean_addr, mop);
             }
         }
         tcg_gen_add_i64(clean_addr, clean_addr, tcg_ebytes);
-- 
2.20.1


