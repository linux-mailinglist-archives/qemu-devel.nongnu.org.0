Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F41D2FBAF6
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:22:15 +0100 (CET)
Received: from localhost ([::1]:51396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1spi-0003Zp-Be
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:22:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfL-0007rx-Kz
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:31 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfH-0001JA-KC
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:31 -0500
Received: by mail-wr1-x434.google.com with SMTP id 6so12801877wri.3
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sg57w1bNfmqm++/I9BpHEaponzLd4xw5oOY0y5ivsJI=;
 b=dsFSK3b8KzQ6wdZgTFNuh/8eDoVnnCQ3d/jIZXtTBixmLPFRBeLnB8fM42Ja82pY0o
 8xdzgoJjd8vsKUB/R6s3rMX1LyQElkhTqIPEWATv41m/L3nv6AQXopovjiuiB9az6M8Y
 R+6Xy2Nb/o0//MIaBA+1k9fuJYh5al+URvrTffHXto4qpPajPRHMDaFYdpRNmjEJVXbB
 TrubgQUvFtp3oHDHluyx82MmIBaFy2db4nKUXPZU9T1YlzPyV4kxkuZMDJgAsG1GAFVP
 RvMB2lt9dKNcGDPJgRJRkmG22M6fgOqJtMCwU5uvV+DdHCXfh8tXE36s84G03Zjy55Wk
 JOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sg57w1bNfmqm++/I9BpHEaponzLd4xw5oOY0y5ivsJI=;
 b=ApWHSi+1T/uy5rWKzAV3nirMzresP4uCvGEFdUPMo8AzO3DGYNrPWfk78UMnFtI2Xa
 Jvz1HbN/Tf69Zu6S9a319PRQyCBo/JVaPOov1QfMeRwHItAcD0A8IlmuToOYq5KEDNQx
 zudIBkz8bwA4CM3QbX2GMfQpDgQXhSRKPUQv9aFTM3cKkw65YFPzS6A2XBm6bQOVfq+a
 nJW7ZmDEovJGTJDAoD7I7ytDTl9mdZbM2a2sNfcs06wC719amqm+I04oj1nCCu/1TFVO
 V8j27LHqDSGdb/npsYnLrBxQB62n6dYVr60qyMR6FlYS9rXPSKGiz15gGSwwy+w9tAvS
 1Krg==
X-Gm-Message-State: AOAM531a9t40NU+xkIen1pcxsgB7KkcESE9t3ATwbO6x26y6GTo/r4x5
 8+aTsf5xJJmvapkBCB018DcIOA4dLnGusA==
X-Google-Smtp-Source: ABdhPJy6aUU84gTSnJ4rQ2r9/DW2L1nIRhuzLQsy7LdF3vV/KA6HbELLIS92BEaik3Luyq8KTiH1wA==
X-Received: by 2002:a5d:4bc2:: with SMTP id l2mr4971954wrt.204.1611069086414; 
 Tue, 19 Jan 2021 07:11:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a184sm4843699wme.35.2021.01.19.07.11.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 07:11:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/33] target/arm: Update PFIRST, PNEXT for pred_desc
Date: Tue, 19 Jan 2021 15:10:55 +0000
Message-Id: <20210119151104.16264-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119151104.16264-1-peter.maydell@linaro.org>
References: <20210119151104.16264-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

These two were odd, in that do_pfirst_pnext passed the
count of 64-bit words rather than bytes.  Change to pass
the standard pred_full_reg_size to avoid confusion.

Cc: qemu-stable@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210113062650.593824-3-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve_helper.c    | 7 ++++---
 target/arm/translate-sve.c | 6 +++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 5f037c3a8f8..ff01851bf28 100644
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
index 0c3a6d21210..efcb646f729 100644
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
2.20.1


