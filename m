Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAADB37032E
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 23:47:02 +0200 (CEST)
Received: from localhost ([::1]:58400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcayT-0003cx-V8
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 17:47:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZp8-0006mU-Kc
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:33:20 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:37870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZot-0000rt-MG
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:33:13 -0400
Received: by mail-pf1-x42d.google.com with SMTP id b15so5019551pfl.4
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PS5/3Bgg+wTxPQ6ZWYhKexmWIte/yItcs5KmNlLkiRY=;
 b=SRfl8eTfYpam230n/syaxqtDBTUBQX21+jpNyMtnieQq8aM+PShwWvX2NLIZ9yf9Rk
 ydp+45FKAx0TCloU8RRCgGwgyiA57DLBn6MicEpyZYoY7tqLl3rCrBCJKR1EP7TQPVv9
 SJMmi6C2rVTL0tLA+00A33qsQpGdPj0P8m/JdIo8b6ahEAAHeQAc4bmRuCwneC0hmky1
 xIL2Z4x0zIrIEP0BWatO8Q2P4FfKNfHpL0uLdX+MUdB8hVL5aYKC5KfJRET2DGqPsSbJ
 2FG2ocEp7Gukmrz55K7UVDMnCOhkj2hUusRlYBUNtO8EdTyiDwiZyi3undLJTul8iy2U
 RQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PS5/3Bgg+wTxPQ6ZWYhKexmWIte/yItcs5KmNlLkiRY=;
 b=oMUE8J4DLxEBu5AZb2IKxSKqlNLAbp39DyQlD0r7H8FIuvrIHZnuiOUWvjX1k+6YJG
 QYqt1dnYPT6QnRy8skoVqjX4XIPlyRD+0JQdW9ENrJMArEXakQ7HW0W/k02IiHC28V4c
 qtr3j+IDc76CrIkatGRUh5Tw7cE1XTfjsBMBPCdYMjk4OM8YxPOhb/SwDvjoggxyFOHt
 kOG2Zp9Q84a52+qZ6VPE7Q7We/Y5avpRcaxBMjW++T9Am1Qnr1qQARQzSrrXX3tCgoH7
 uy/ZNi52hLbi40i2HVjWKXJIWq1NlXTs7cZaYp5xo/he1IDKmLN5z1eKAN7JBi6LLebq
 UcFQ==
X-Gm-Message-State: AOAM533x5Ebt/L/AHr+qwEcprPcl4p1yPsBEVqyLhPEodzNqCbYDUr7n
 RTno3a9DhGmaWXyV4SC6TgIIZE+pdfbYpg==
X-Google-Smtp-Source: ABdhPJwJ5hRzTGVHN405eFJ2e3t57FdBd9G3exUzRJY5GrO7vz+gLUymOW4oNViREd2k2J2hWT6NKg==
X-Received: by 2002:a65:60d8:: with SMTP id r24mr6364448pgv.226.1619814781951; 
 Fri, 30 Apr 2021 13:33:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3792511pgt.42.2021.04.30.13.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:33:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 81/82] linux-user/aarch64: Enable hwcap bits for sve2 and
 related extensions
Date: Fri, 30 Apr 2021 13:26:09 -0700
Message-Id: <20210430202610.1136687-82-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index fc9c4f12be..299116d450 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -648,8 +648,18 @@ static uint32_t get_elf_hwcap2(void)
     uint32_t hwcaps = 0;
 
     GET_FEATURE_ID(aa64_dcpodp, ARM_HWCAP2_A64_DCPODP);
+    GET_FEATURE_ID(aa64_sve2, ARM_HWCAP2_A64_SVE2);
+    GET_FEATURE_ID(aa64_sve2_aes, ARM_HWCAP2_A64_SVEAES);
+    GET_FEATURE_ID(aa64_sve2_pmull128, ARM_HWCAP2_A64_SVEPMULL);
+    GET_FEATURE_ID(aa64_sve2_bitperm, ARM_HWCAP2_A64_SVEBITPERM);
+    GET_FEATURE_ID(aa64_sve2_sha3, ARM_HWCAP2_A64_SVESHA3);
+    GET_FEATURE_ID(aa64_sve2_sm4, ARM_HWCAP2_A64_SVESM4);
     GET_FEATURE_ID(aa64_condm_5, ARM_HWCAP2_A64_FLAGM2);
     GET_FEATURE_ID(aa64_frint, ARM_HWCAP2_A64_FRINT);
+    GET_FEATURE_ID(aa64_sve_i8mm, ARM_HWCAP2_A64_SVEI8MM);
+    GET_FEATURE_ID(aa64_sve_f32mm, ARM_HWCAP2_A64_SVEF32MM);
+    GET_FEATURE_ID(aa64_sve_f64mm, ARM_HWCAP2_A64_SVEF64MM);
+    GET_FEATURE_ID(aa64_i8mm, ARM_HWCAP2_A64_I8MM);
     GET_FEATURE_ID(aa64_rndr, ARM_HWCAP2_A64_RNG);
     GET_FEATURE_ID(aa64_bti, ARM_HWCAP2_A64_BTI);
     GET_FEATURE_ID(aa64_mte, ARM_HWCAP2_A64_MTE);
-- 
2.25.1


