Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB54836287F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 21:19:01 +0200 (CEST)
Received: from localhost ([::1]:33536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXTzY-0002rC-Nj
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 15:19:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXTht-00040X-Ae
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:47 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:39523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThY-0004S3-2M
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:44 -0400
Received: by mail-pl1-x631.google.com with SMTP id u7so12665431plr.6
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 12:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kFpRdpzIBHPgybwqUXYjnSl/F8QbD35R7VDxiD3dIh0=;
 b=dK5vU8r1ytZLQgQHxf64w+EzZze2eOmH3UjyvumWGf8cu/yaxjnwhMMcHQKcS6jQu9
 u6hkDNzWT3PF+2SoPdk62aU9r1gGQcyUYACA2A+lnQ3u9AIkToSqYoF30+tNn3zS1bsy
 T1R67UDMo6s2bzirTriAzvDCtkgWif2aU+A/CC3+VyWS2TFAHKiR2Y6AYxcCUU+y9PiC
 tN/JzDIn8dQjXdbACGIv0stCwI0eAZNbbMcGcnQtKVqb6eRjM5YoNB/y2Ue4YPCD4Qi/
 1Hp90ulhZJudoIEWDAJJ2tQ73uhmRgeyLsXXSV9Qs26dLCwTNITJws7xhI9kkjy2hplG
 FxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kFpRdpzIBHPgybwqUXYjnSl/F8QbD35R7VDxiD3dIh0=;
 b=l2ub08+eLbTAEo1S2Vn1i4/HR+MyuEpUDo365WrttgTSEUvM/pBygdXq1H1zKuc5ps
 0MWoH+FDQBz/pvP7bKu5uuCgZnGvwb+mZVYR40KaKOls1u8r+vZQVkx3QMxU+eFJLGia
 gOaA98jmIqdbq34032ThCR+bDQeAv0b9/2TxA57IPez13E+Dzrg7GGSCo+90w4nNGCpg
 jTZa6qu1BO5UHhnPuXB3By15fWPVguXVU7NKAsiMLxtxBnbyTa25y4Z9s5m4YeINHg2O
 yzNfz10LFwyqB8X/KgfdBGJgIGlmdfFC/SZJQ5CZMj2ioCnzUcWmdzKP0aYpDBqY0Cqy
 6T+A==
X-Gm-Message-State: AOAM531Us1xv20bAIw5zMPUTk5C4EuwYBRLDHCMSh3xfKdQMZ1seN/o3
 Kt/oAs+8XMPW1VNyVuNHQMIf8+1RalYWDA==
X-Google-Smtp-Source: ABdhPJxgBMvwRGBvFMFgbzijmJ086HpJXwQjGSPo9vUHYn0S520iKxJjdOzXDrlZQHzZZBIf9l+BcQ==
X-Received: by 2002:a17:90a:5b0b:: with SMTP id
 o11mr11186341pji.18.1618599622561; 
 Fri, 16 Apr 2021 12:00:22 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 22/30] target/arm: Enforce alignment for VLDn/VSTn
 (multiple)
Date: Fri, 16 Apr 2021 11:59:51 -0700
Message-Id: <20210416185959.1520974-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-neon.c.inc | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index 9c2b076027..e706c37c80 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -429,7 +429,7 @@ static bool trans_VLDST_multiple(DisasContext *s, arg_VLDST_multiple *a)
 {
     /* Neon load/store multiple structures */
     int nregs, interleave, spacing, reg, n;
-    MemOp endian = s->be_data;
+    MemOp mop, align, endian;
     int mmu_idx = get_mem_index(s);
     int size = a->size;
     TCGv_i64 tmp64;
@@ -473,20 +473,36 @@ static bool trans_VLDST_multiple(DisasContext *s, arg_VLDST_multiple *a)
     }
 
     /* For our purposes, bytes are always little-endian.  */
+    endian = s->be_data;
     if (size == 0) {
         endian = MO_LE;
     }
+
+    /* Enforce alignment requested by the instruction */
+    if (a->align) {
+        align = pow2_align(a->align + 2); /* 4 ** a->align */
+    } else {
+        align = s->align_mem ? MO_ALIGN : 0;
+    }
+
     /*
      * Consecutive little-endian elements from a single register
      * can be promoted to a larger little-endian operation.
      */
     if (interleave == 1 && endian == MO_LE) {
+        /* Retain any natural alignment. */
+        if (align == MO_ALIGN) {
+            align = pow2_align(size);
+        }
         size = 3;
     }
+
     tmp64 = tcg_temp_new_i64();
     addr = tcg_temp_new_i32();
     tmp = tcg_const_i32(1 << size);
     load_reg_var(s, addr, a->rn);
+
+    mop = endian | size | align;
     for (reg = 0; reg < nregs; reg++) {
         for (n = 0; n < 8 >> size; n++) {
             int xs;
@@ -494,15 +510,16 @@ static bool trans_VLDST_multiple(DisasContext *s, arg_VLDST_multiple *a)
                 int tt = a->vd + reg + spacing * xs;
 
                 if (a->l) {
-                    gen_aa32_ld_internal_i64(s, tmp64, addr, mmu_idx,
-                                             endian | size);
+                    gen_aa32_ld_internal_i64(s, tmp64, addr, mmu_idx, mop);
                     neon_store_element64(tt, n, size, tmp64);
                 } else {
                     neon_load_element64(tmp64, tt, n, size);
-                    gen_aa32_st_internal_i64(s, tmp64, addr, mmu_idx,
-                                             endian | size);
+                    gen_aa32_st_internal_i64(s, tmp64, addr, mmu_idx, mop);
                 }
                 tcg_gen_add_i32(addr, addr, tmp);
+
+                /* Subsequent memory operations inherit alignment */
+                mop &= ~MO_AMASK;
             }
         }
     }
-- 
2.25.1


