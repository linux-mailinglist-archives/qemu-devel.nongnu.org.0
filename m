Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA18332C4D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 17:38:58 +0100 (CET)
Received: from localhost ([::1]:35534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJfNp-00064c-NZ
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 11:38:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJefd-0004t3-Kh
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:53:17 -0500
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:41288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJefb-0001G5-Tq
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:53:17 -0500
Received: by mail-ot1-x333.google.com with SMTP id f8so8208576otp.8
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 07:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=za48O+F8pe+cx2YKh2fq/jSCGfZWB6heIOQcKS7+4hU=;
 b=TjgiVrTelXvgtfADV7qMnMzU0YC6MCB3slQ+MpbtDvcE0fhXtI23Cp/aJ9FTFSEF1p
 FFGOELM86zJPyOsZIl9hspptXrLlf6w7xHgbi8LpwyvDEVgzf+niJrETuX8rBJY6cK4h
 oSoiQQ3j5zMmA87R7m7h/rm+WVy7EIMDpSGEFN7UdKud7u84YjGIZLapbZxjR8N6Lnqh
 f2B9GNVweqbZ5vghI21EKTPXfp3+DVmgrf7I3XeHwhDaSRyls5AxjBSSvKLNI4IrsAzT
 4830R7SwV35RLkGuIQXIWgwxPOlUP6BaeAIDX2VHDoqBYjEUYW7d70LI2ut8Ub6t9MP4
 0oDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=za48O+F8pe+cx2YKh2fq/jSCGfZWB6heIOQcKS7+4hU=;
 b=H38HTushkwORmAgaZGIyBzZN0gnq7+/1Iuil811tz4gMvBlaYphAqJQupNrCMQpgQt
 36QLSLvJCgpZNPQNWvczTVdHXYd+dxTqYOfj6MbEmc5ino7R2ySj6Cup1UDpGUAPqHIk
 BXAq1+PXiUwnto9EbtTFRNOcPBplqzH6JSX9Qgv2OUHRmljfYT8K7lUgHQY7jOyFMP+d
 HH2yuCC4PVW20ZxLN7vG/Qr21m3xeRlzbgJHv4VVigGcsAOlTTmDZBU9h2SjeIeDJhQh
 ZaQyLxrKKnpt9N96uXSVCpg5N6lTdPRrLqWIq0mF0AgUculcaaSiVZo71DV1IQu+tyH9
 uavQ==
X-Gm-Message-State: AOAM530DTNOMa36I107tY8FFMpUtExgFdgHwIY+ytlsB9YrvGlkmNHqo
 bplOObL3geHkfnqbyv5zd4LAMaTmfHXSZZy/
X-Google-Smtp-Source: ABdhPJzbThi+ZkCVP9zGhvqiaJMM4IusupgOtIhOvi4Lter6+oGWF0kk1ivZmL+/wKKgKpjxFUXZAA==
X-Received: by 2002:a9d:5604:: with SMTP id e4mr25460860oti.198.1615305194901; 
 Tue, 09 Mar 2021 07:53:14 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id b14sm2952539ooj.26.2021.03.09.07.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 07:53:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 6/8] target/arm: Update CNTP for PREDDESC
Date: Tue,  9 Mar 2021 07:53:03 -0800
Message-Id: <20210309155305.11301-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309155305.11301-1-richard.henderson@linaro.org>
References: <20210309155305.11301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since b64ee454a4a0, all predicate operations should be
using these field macros for predicates.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c    | 6 +++---
 target/arm/translate-sve.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 8e0a5d30a5..a95bbece4f 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2836,12 +2836,12 @@ uint32_t HELPER(sve_brkns)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 
 uint64_t HELPER(sve_cntp)(void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
-    intptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
+    intptr_t words = DIV_ROUND_UP(FIELD_EX32(pred_desc, PREDDESC, OPRSZ), 8);
+    intptr_t esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
     uint64_t *n = vn, *g = vg, sum = 0, mask = pred_esz_masks[esz];
     intptr_t i;
 
-    for (i = 0; i < DIV_ROUND_UP(oprsz, 8); ++i) {
+    for (i = 0; i < words; ++i) {
         uint64_t t = n[i] & g[i] & mask;
         sum += ctpop64(t);
     }
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index c0212e6b08..722805cf99 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2967,11 +2967,11 @@ static void do_cntp(DisasContext *s, TCGv_i64 val, int esz, int pn, int pg)
     } else {
         TCGv_ptr t_pn = tcg_temp_new_ptr();
         TCGv_ptr t_pg = tcg_temp_new_ptr();
-        unsigned desc;
+        unsigned desc = 0;
         TCGv_i32 t_desc;
 
-        desc = psz - 2;
-        desc = deposit32(desc, SIMD_DATA_SHIFT, 2, esz);
+        desc = FIELD_DP32(desc, PREDDESC, OPRSZ, psz);
+        desc = FIELD_DP32(desc, PREDDESC, ESZ, esz);
 
         tcg_gen_addi_ptr(t_pn, cpu_env, pred_full_reg_offset(s, pn));
         tcg_gen_addi_ptr(t_pg, cpu_env, pred_full_reg_offset(s, pg));
-- 
2.25.1


