Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B150364B49
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 22:42:21 +0200 (CEST)
Received: from localhost ([::1]:40234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYaiq-0000xy-F5
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 16:42:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQd-0007Sa-1Q
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:31 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:33472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQa-0002b5-JN
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:30 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id ef17so11886449qvb.0
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 13:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PxZGDd3JlBDpDCLbYsDYq94kYNQcx3dkagpb2Omjk8Q=;
 b=dJrYzQUjMhz8ExSmjRETVN/Spn7xYrtUcgOvv8urWeQamODO3t86k7U6T22XcMT3ri
 s9wN8XprHN/Qil5glODuWjce+sVu6MLS+DyyeXauJT936HijRbS5C9t9o9tMPt+wqGih
 wVoHkRj+/o0hKSnBOo+UG0iRMguG2BggqRkYK0Wob0Z6zq/2pKcWBGGr+yh4vgqLOS7d
 L4M7q9oqHhgwbfSqNMYhcrYmUi7SL+8dwSL+BpS4HubuRCNRd6tlqxIUzszflhqTA3vY
 5cC6TVxtNaZIqc7lgyIz9+VCaEEyl0aid7EOQ3r4N5/q3wojnVvIbGjkXU0maVAVIHdP
 oDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PxZGDd3JlBDpDCLbYsDYq94kYNQcx3dkagpb2Omjk8Q=;
 b=IWWqKln2AjT0iadJg/KEpAmAvrIHIjaz/2OwzGcxB1a6iMIw7nl/5lftDijqpRZcdP
 ywV/gFGgM5boMwvkAcOY8YH3FMJFesyUKGNm3izll2uRK0CSZFijZDTPE+QmnihnI5cE
 uXnkEVE5lb2LXl0S6NvJ43QZqNKFL/tTbfZ63eXylzhUam19ars0d5kIOKRI6gZ5Qyi8
 GS8mFSIB8SXr/DoNkFOtUBr97j0/LOfnx2xHHZfKJ4P7uTlJXBPwazHYm0ThpxhVBKgx
 TAOfrG23tvq5L96w0pMK7YPWMb/FdouGhz2DaeKnm+P1KYoUf+ctS9nEsxJ2ah5deHDa
 XyAw==
X-Gm-Message-State: AOAM531vsz3k3+GgzvP2dZwOTKQGrsblfkns84iH7CmnhbkKhyYtNNxf
 hnraFECBv88lPo8HeIzZrq+42hcppS7ieSoh
X-Google-Smtp-Source: ABdhPJyoXyfYoar+mHiXR4N+ajElXY2+MH3XKdEegWqt4/4WO3bd8ixEKRPYv1Z7OKhmYjMxUa9qOQ==
X-Received: by 2002:ad4:522b:: with SMTP id r11mr23537378qvq.6.1618863807824; 
 Mon, 19 Apr 2021 13:23:27 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 15/31] target/arm: Enforce word alignment for LDRD/STRD
Date: Mon, 19 Apr 2021 13:22:41 -0700
Message-Id: <20210419202257.161730-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Buglink: https://bugs.launchpad.net/qemu/+bug/1905356
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6171347d6d..1b0951c45b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6512,13 +6512,13 @@ static bool trans_LDRD_rr(DisasContext *s, arg_ldst_rr *a)
     addr = op_addr_rr_pre(s, a);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     store_reg(s, a->rt, tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     store_reg(s, a->rt + 1, tmp);
 
     /* LDRD w/ base writeback is undefined if the registers overlap.  */
@@ -6541,13 +6541,13 @@ static bool trans_STRD_rr(DisasContext *s, arg_ldst_rr *a)
     addr = op_addr_rr_pre(s, a);
 
     tmp = load_reg(s, a->rt);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = load_reg(s, a->rt + 1);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
 
     op_addr_rr_post(s, a, addr, -4);
@@ -6649,13 +6649,13 @@ static bool op_ldrd_ri(DisasContext *s, arg_ldst_ri *a, int rt2)
     addr = op_addr_ri_pre(s, a);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     store_reg(s, a->rt, tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = tcg_temp_new_i32();
-    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     store_reg(s, rt2, tmp);
 
     /* LDRD w/ base writeback is undefined if the registers overlap.  */
@@ -6688,13 +6688,13 @@ static bool op_strd_ri(DisasContext *s, arg_ldst_ri *a, int rt2)
     addr = op_addr_ri_pre(s, a);
 
     tmp = load_reg(s, a->rt);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
 
     tcg_gen_addi_i32(addr, addr, 4);
 
     tmp = load_reg(s, rt2);
-    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL);
+    gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
 
     op_addr_ri_post(s, a, addr, -4);
-- 
2.25.1


