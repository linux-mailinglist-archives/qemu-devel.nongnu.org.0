Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8932F1FAB
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 20:41:55 +0100 (CET)
Received: from localhost ([::1]:48924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz34c-0000eQ-Et
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 14:41:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2SF-0006Tz-Ki
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:02:16 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:40064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2S8-0006YY-T9
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:02:15 -0500
Received: by mail-pl1-x629.google.com with SMTP id q4so334179plr.7
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6T/o1lhn6aSUmH+RBGXbRyAbXaPSiwSZ8/GJte4+zxA=;
 b=veqUcAfEKkOdgtGBmuxzfqqRywgKTkPGA58D/I4uIREHkWRTNhXWIbQdVsaYk7Weso
 BTI5skZEBoGn6csTSbu4mPIDOoODq5MlKNpz+HNSh+aZWXcGXHjK86pCUXTyILN2dVoG
 d854M+WbOVXI0QIoeJi+9ns8uFNrH1akYRqTKX32cY+N0g9h4QuHwecHT7iOpn7ulc70
 hUrcdVm3m44YH0yK+FYUVwmHcKuk4LcEfxQbsf1TPhbxPqEguzwBTXGC7FWzyt/6YEAs
 MBiQPYY+G367ZDMGeosMICT/xKDIwv+4sOfUK9trWKHspzcCLoSnGTmdiQWcC5acCUzd
 06OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6T/o1lhn6aSUmH+RBGXbRyAbXaPSiwSZ8/GJte4+zxA=;
 b=b/P8CQC0isOB/lTBtqQCQfq0lI5R3Omg5JcrLJaovvn28kJgL6INCXZ9KNhqecg4d7
 NGcxK6AEKAHDNIzJgPHKZGCuOP9vQctf6lTpopvEy5ASL3DPy3b/7j+P7tbXMhhOcKhG
 6HNfYh3NFmzglzLp/YFPvzWfiWWzPNUOkGkMVSpwMX2NMluXnNJJMjQpPHOdY62NI/uH
 yW3lRpbAP6i7aLEMNL7LcYMOKPTZi9YksbKJ5yS7SZfPblTLuZOeiTXO0or/UooXhyVm
 OCae/VFQXTiNvaRsWwdPr2urO7fVPQAWAtHbI8/2VkyZmtNE3fjTRmGzP6JhuWXElTXQ
 9Nmw==
X-Gm-Message-State: AOAM530WkzzQ5IwwcEGpo/YUiV4M11hhSHzQEX6RmHVe2kAHwrJ0GfSt
 1kdeJEx7jupp9Nl3wtkOAmOjJi6BsXiTZQ==
X-Google-Smtp-Source: ABdhPJzxjOFqnwtZKkTHgisAQ1bQ24qktjgMkz05EFN4qGckejJs4QDefyIS5bV1Vd1kEXCGSp9DdQ==
X-Received: by 2002:a17:90a:e64e:: with SMTP id
 ep14mr279189pjb.5.1610391727352; 
 Mon, 11 Jan 2021 11:02:07 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:02:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 29/30] target/arm: Enforce alignment for aa64 vector
 LDn/STn (single)
Date: Mon, 11 Jan 2021 09:01:12 -1000
Message-Id: <20210111190113.303726-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 7765c15e0c..ec8e488b11 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3786,6 +3786,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
     int index = is_q << 3 | S << 2 | size;
     int xs, total;
     TCGv_i64 clean_addr, tcg_rn, tcg_ebytes;
+    MemOp mop;
 
     if (extract32(insn, 31, 1)) {
         unallocated_encoding(s);
@@ -3847,6 +3848,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
 
     clean_addr = gen_mte_checkN(s, tcg_rn, !is_load, is_postidx || rn != 31,
                                 scale, total);
+    mop = finalize_memop(s, scale);
 
     tcg_ebytes = tcg_const_i64(1 << scale);
     for (xs = 0; xs < selem; xs++) {
@@ -3854,8 +3856,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
             /* Load and replicate to all elements */
             TCGv_i64 tcg_tmp = tcg_temp_new_i64();
 
-            tcg_gen_qemu_ld_i64(tcg_tmp, clean_addr,
-                                get_mem_index(s), s->be_data + scale);
+            tcg_gen_qemu_ld_i64(tcg_tmp, clean_addr, get_mem_index(s), mop);
             tcg_gen_gvec_dup_i64(scale, vec_full_reg_offset(s, rt),
                                  (is_q + 1) * 8, vec_full_reg_size(s),
                                  tcg_tmp);
@@ -3863,9 +3864,9 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
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
2.25.1


