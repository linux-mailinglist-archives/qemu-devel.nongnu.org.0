Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B55338F57
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:03:47 +0100 (CET)
Received: from localhost ([::1]:45014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKiOI-0000Br-8H
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:03:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiD0-0002u9-8V
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:06 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCp-0001yM-NC
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:05 -0500
Received: by mail-wr1-x42f.google.com with SMTP id o14so1047789wrm.11
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TuSUwNn4/oWD5KusSonCvPZ2G4zGe7mrVYleQK6qoWU=;
 b=lj4JGGigk4qUd6Xe9qpCANAt7xQ5wA/aVbHPv88+dIzNSGRcpcbbzBmC5AIyNLvByD
 a9UUnz9LW8bMTyTohL5a0BWDPenIv7bLqDvnlRabMRCAlJYppCyd0JaG00IBHMQYNqvL
 Yv5ShmXt18ADJylNL6ZgoMBLHQNHARtucPoheHsX1LDjOln42GIawz+dFhsWnrZXVrKE
 F8EiqSD3puCXt5YbhCf6g0eXghk9dqVVBnS18RVyZK2ULN9B6+SKgfUspO5odxEraY4X
 YlJDkFjJ3Ehq0C2koVdLH/zLqSgxRgflXi+FAYIdve6MKh0WHyg9McpOzddwDPclYpTz
 QRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TuSUwNn4/oWD5KusSonCvPZ2G4zGe7mrVYleQK6qoWU=;
 b=bbT8c6DbHek2ZA6Cy4e0+TqvAtmTbSGg/24lPLohuc0bgnVcLa08n4su3ZltuU5B1r
 IbagWdppd0ZLzxmm44GeArB13W22/PQy44Pqnpa95r3t+WPt/OkO80A1oJYZxzAuMC6B
 88vlYXKd88ylmnkAObjNPXWU1RxARVFEEOqJoBQ1qrdSnxkPC5GdE2o5ubUbKkQe1wvA
 MKwuzNT+/Ql4X9uKtsKwIG0O5m8+FtbFnGO2W7z4cKs474fnrNT9XtfBXkiQyDLxV78o
 GG4EZZcn88LPCfDCutLEz5X8RkDUH4sWZeCaqvjbDXtz3gT6WRs3cs5fD+QQHrRADeoG
 ni5Q==
X-Gm-Message-State: AOAM530hqtiRVIpR+61IydYaeTLgWQh1W8oovxyUos3IMr++bt9b0sCR
 lz2YQ4oexgjoM4ZUCQK02pUgCw9qT43NkQju
X-Google-Smtp-Source: ABdhPJz2auLng8jf8a6GO+oUcxdYbKdeeP2Ns8L1B6gsew8RiMsSvI+0KStGfN3QFHcV3MOG0jr1HA==
X-Received: by 2002:adf:f948:: with SMTP id q8mr14307547wrr.296.1615557113464; 
 Fri, 12 Mar 2021 05:51:53 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m6sm7964994wrv.73.2021.03.12.05.51.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:51:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/39] target/arm: Update WHILE for PREDDESC
Date: Fri, 12 Mar 2021 13:51:17 +0000
Message-Id: <20210312135140.1099-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312135140.1099-1-peter.maydell@linaro.org>
References: <20210312135140.1099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

Since b64ee454a4a0, all predicate operations should be
using these field macros for predicates.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210309155305.11301-8-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve_helper.c    | 4 ++--
 target/arm/translate-sve.c | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index a95bbece4f3..6f4bc3a3cc2 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2850,8 +2850,8 @@ uint64_t HELPER(sve_cntp)(void *vn, void *vg, uint32_t pred_desc)
 
 uint32_t HELPER(sve_while)(void *vd, uint32_t count, uint32_t pred_desc)
 {
-    uintptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
-    intptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
+    intptr_t esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
     uint64_t esz_mask = pred_esz_masks[esz];
     ARMPredicateReg *d = vd;
     uint32_t flags;
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 722805cf99e..2420cd741b4 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3097,7 +3097,8 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
     TCGv_i64 op0, op1, t0, t1, tmax;
     TCGv_i32 t2, t3;
     TCGv_ptr ptr;
-    unsigned desc, vsz = vec_full_reg_size(s);
+    unsigned vsz = vec_full_reg_size(s);
+    unsigned desc = 0;
     TCGCond cond;
 
     if (!sve_access_check(s)) {
@@ -3161,8 +3162,8 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
     /* Scale elements to bits.  */
     tcg_gen_shli_i32(t2, t2, a->esz);
 
-    desc = (vsz / 8) - 2;
-    desc = deposit32(desc, SIMD_DATA_SHIFT, 2, a->esz);
+    desc = FIELD_DP32(desc, PREDDESC, OPRSZ, vsz / 8);
+    desc = FIELD_DP32(desc, PREDDESC, ESZ, a->esz);
     t3 = tcg_const_i32(desc);
 
     ptr = tcg_temp_new_ptr();
-- 
2.20.1


