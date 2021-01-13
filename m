Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 478A22F4486
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 07:29:33 +0100 (CET)
Received: from localhost ([::1]:37324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzZeu-0005mN-Bf
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 01:29:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzZcT-0003zW-Kr
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 01:27:01 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:36723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzZcR-0007Fn-ON
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 01:27:01 -0500
Received: by mail-pj1-x1034.google.com with SMTP id l23so527265pjg.1
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 22:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bymuml46Yty0XlvbocAimuoupZdaZklTevSIO7jJc+s=;
 b=SLvo5rb1waFxld5OxOq7nLR4coQIkwbEOsB7CG7Fchnh319qiSmJbHx9X6MgtCNS2A
 zKomWxBC6QjE8ytjGeCpJPUXVxrXj05Jllb84wuQdbM+1ELUeoF1/uSnwbtmGtuZRKK9
 +MEQtFCGkKaVDKx1YGp5JjmwaUwYPTFB5VFriuhUuHujagT/Ust76mB+ziCq7kWRXbLh
 5rtRFDCh2PHKoOc8n/5w/ZK1r78Pz/vXbHUwcQvEfBZei+8oXoPPBenQCaLWzQFTkKLJ
 SURrICOfrOSruaMQuRwyugYHKMsQaTJfKhb4djXeCjNU7koRE9X16QjWHK7MxmSqz9t2
 ljXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bymuml46Yty0XlvbocAimuoupZdaZklTevSIO7jJc+s=;
 b=FKJgTZ8hBg7JEuTwyXfyeave6yPYBTS51hyxUIJTOrO20t3g6wWZ2faAyItAC+l4ck
 3130R8DpQHixhSgB4nbom7lvK5mCX5SLRbTLfuevTf8sW5kM7yJMqrKeMJdMf6B6lCdh
 3pviE3uoJCduRClKVKG7epp2X2cEXeOljezziZ/o5MAwr54AIlVwjrDMIX1o6/tsFCQ6
 fa3F2Mosm0Bp4LGA8pdoPUWWCJRz/sVt2+R3h4k6S1GNtu07A1Szfu6j9qn/r9nQBrEw
 T3e0AnhF4SkYfZcmVnfMAUQwRYwkXEG3m8iNxfEiLm0gZEmWTH1mQvXN/07fgueu3Y5i
 hhJA==
X-Gm-Message-State: AOAM5307SSu4DHFlZHzBATu3rYnKdcTx9q8f/XxiDXF9ulnNbPzflu+E
 uTxyxXxLpD8yHg08CgFMFRGsrtykIFiLQQ==
X-Google-Smtp-Source: ABdhPJxI9KXtJOV/Ozelg9E1nhe3CmtOiXU6WGaN1dmmo0Lw/n3+0uVUVqLWYSQ2s45SjSbx2i2qKw==
X-Received: by 2002:a17:90a:4dcd:: with SMTP id
 r13mr652743pjl.74.1610519218183; 
 Tue, 12 Jan 2021 22:26:58 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id k25sm1138241pfi.10.2021.01.12.22.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 22:26:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] target/arm: Update PFIRST, PNEXT for pred_desc
Date: Tue, 12 Jan 2021 20:26:48 -1000
Message-Id: <20210113062650.593824-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113062650.593824-1-richard.henderson@linaro.org>
References: <20210113062650.593824-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These two were odd, in that do_pfirst_pnext passed the
count of 64-bit words rather than bytes.  Change to pass
the standard pred_full_reg_size to avoid confusion.

Cc: qemu-stable@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c    | 7 ++++---
 target/arm/translate-sve.c | 6 +++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 5f037c3a8f..ff01851bf2 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -889,8 +889,9 @@ static intptr_t last_active_element(uint64_t *g, intptr_t words, intptr_t esz)
     return (intptr_t)-1 << esz;
 }
 
-uint32_t HELPER(sve_pfirst)(void *vd, void *vg, uint32_t words)
+uint32_t HELPER(sve_pfirst)(void *vd, void *vg, uint32_t pred_desc)
 {
+    intptr_t words = DIV_ROUND_UP(FIELD_EX32(pred_desc, PREDDESC, OPRSZ), 8);
     uint32_t flags = PREDTEST_INIT;
     uint64_t *d = vd, *g = vg;
     intptr_t i = 0;
@@ -914,8 +915,8 @@ uint32_t HELPER(sve_pfirst)(void *vd, void *vg, uint32_t words)
 
 uint32_t HELPER(sve_pnext)(void *vd, void *vg, uint32_t pred_desc)
 {
-    intptr_t words = extract32(pred_desc, 0, SIMD_OPRSZ_BITS);
-    intptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
+    intptr_t words = DIV_ROUND_UP(FIELD_EX32(pred_desc, PREDDESC, OPRSZ), 8);
+    intptr_t esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
     uint32_t flags = PREDTEST_INIT;
     uint64_t *d = vd, *g = vg, esz_mask;
     intptr_t i, next;
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 0c3a6d2121..efcb646f72 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1494,10 +1494,10 @@ static bool do_pfirst_pnext(DisasContext *s, arg_rr_esz *a,
     TCGv_ptr t_pd = tcg_temp_new_ptr();
     TCGv_ptr t_pg = tcg_temp_new_ptr();
     TCGv_i32 t;
-    unsigned desc;
+    unsigned desc = 0;
 
-    desc = DIV_ROUND_UP(pred_full_reg_size(s), 8);
-    desc = deposit32(desc, SIMD_DATA_SHIFT, 2, a->esz);
+    desc = FIELD_DP32(desc, PREDDESC, OPRSZ, pred_full_reg_size(s));
+    desc = FIELD_DP32(desc, PREDDESC, ESZ, a->esz);
 
     tcg_gen_addi_ptr(t_pd, cpu_env, pred_full_reg_offset(s, a->rd));
     tcg_gen_addi_ptr(t_pg, cpu_env, pred_full_reg_offset(s, a->rn));
-- 
2.25.1


