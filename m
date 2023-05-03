Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB116F5161
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:27:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6pH-0007hK-Tq; Wed, 03 May 2023 03:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6p6-0007DB-C5
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:48 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6oq-0007Hj-G0
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:48 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f178da21b5so30951315e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098547; x=1685690547;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m4s47C7gmYdUlM0SIov8ZnFiPUvDgmGeRG+O+etXAiw=;
 b=baj3BlHyCYlalJ3tmqFUQsxnHZHAvOXovCgIeBQQggrkmdAx6bQUOEV4vf5CirPrE8
 tQKygFA1KZ0DW3AhgCCD+JFbBIHDf8jMYAev4lYZDBL2qir13pLjuyDMwOmiNpuCAuy6
 k/ZhjEwYHsSTGdlmI6cHfmDZV3bCCnKIKXMc90WGzM3s7Oi5XDiHS/W76GKUYUCzB2o4
 3FQVnz5gNk2Fco7B7teoRZH5M4Op/dD3I6I+LPrghEqLBnPuNVptludZ256l81JH/klP
 UaxR0A9mpBDFvzmcRa4CxtmsTz7F+q6Sm8RT8KBNlwb3xGEOsGhtDLsqaOpxGJ/pDzG5
 tk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098547; x=1685690547;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m4s47C7gmYdUlM0SIov8ZnFiPUvDgmGeRG+O+etXAiw=;
 b=BxplTqOJ/GByq04autr9YrfH+UDjsZLSAPgvCefTFf1Gg3O6gell5SexXqU6oMNnl3
 dBeweYOvGV4qsECwnjGZBQeXNl2IZq7CPgfgX4YD5IquMBuVcnS6UqVjupTWv+SXR31k
 +MifGea/VNi1yIuvyTwPXETxrkZb6UQgyiic0h1LCdTLRHNi0sTE8F5E81Hs0JDI+3b5
 Xag/4LQbIx/lSdSODAIn02WqAgChZQxHgSa+3AvnHWHmu/utYuSe06DzWhY0msa9ras9
 IyLpQ9sdALYogucX7DPjtRcCSXgKjgJOzURyf/qWdpOuWhcA9IaNhGZ0smDQhpQ2+ORM
 alQQ==
X-Gm-Message-State: AC+VfDz9LcDkcR0+BmhPMmoQHlpyTKsKkFCJ1flM0jiJQuwX2/fklxbN
 UKrsRbETCTXIXVM4GrrdaSWgfohUTN4rnQ8aD8oZIA==
X-Google-Smtp-Source: ACHHUZ4cX8TdMHbT99Whw8IrRy/FdqwdcuKi6Cr1tWq+0cOqlSRAHVVVk4Pc6VWsGI3fNjNVxBbQ/Q==
X-Received: by 2002:a1c:4b12:0:b0:3f0:b1c9:25d4 with SMTP id
 y18-20020a1c4b12000000b003f0b1c925d4mr13487253wma.21.1683098547575; 
 Wed, 03 May 2023 00:22:27 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm962789wmj.23.2023.05.03.00.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:22:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng,
 Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
Subject: [PULL v2 04/12] qemu/host-utils.h: Add clz and ctz functions for
 lower-bit integers
Date: Wed,  3 May 2023 08:20:52 +0100
Message-Id: <20230503072221.1746802-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072221.1746802-1-richard.henderson@linaro.org>
References: <20230503072221.1746802-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>

This is for use in the RISC-V vclz and vctz instructions (implemented in
proceeding commit).

Signed-off-by: Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230428144757.57530-11-lawrence.hunter@codethink.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/host-utils.h | 54 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index 3ce62bf4a5..d3b4dce6a9 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -107,6 +107,36 @@ static inline uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c)
 }
 #endif
 
+/**
+ * clz8 - count leading zeros in a 8-bit value.
+ * @val: The value to search
+ *
+ * Returns 8 if the value is zero.  Note that the GCC builtin is
+ * undefined if the value is zero.
+ *
+ * Note that the GCC builtin will upcast its argument to an `unsigned int`
+ * so this function subtracts off the number of prepended zeroes.
+ */
+static inline int clz8(uint8_t val)
+{
+    return val ? __builtin_clz(val) - 24 : 8;
+}
+
+/**
+ * clz16 - count leading zeros in a 16-bit value.
+ * @val: The value to search
+ *
+ * Returns 16 if the value is zero.  Note that the GCC builtin is
+ * undefined if the value is zero.
+ *
+ * Note that the GCC builtin will upcast its argument to an `unsigned int`
+ * so this function subtracts off the number of prepended zeroes.
+ */
+static inline int clz16(uint16_t val)
+{
+    return val ? __builtin_clz(val) - 16 : 16;
+}
+
 /**
  * clz32 - count leading zeros in a 32-bit value.
  * @val: The value to search
@@ -153,6 +183,30 @@ static inline int clo64(uint64_t val)
     return clz64(~val);
 }
 
+/**
+ * ctz8 - count trailing zeros in a 8-bit value.
+ * @val: The value to search
+ *
+ * Returns 8 if the value is zero.  Note that the GCC builtin is
+ * undefined if the value is zero.
+ */
+static inline int ctz8(uint8_t val)
+{
+    return val ? __builtin_ctz(val) : 8;
+}
+
+/**
+ * ctz16 - count trailing zeros in a 16-bit value.
+ * @val: The value to search
+ *
+ * Returns 16 if the value is zero.  Note that the GCC builtin is
+ * undefined if the value is zero.
+ */
+static inline int ctz16(uint16_t val)
+{
+    return val ? __builtin_ctz(val) : 16;
+}
+
 /**
  * ctz32 - count trailing zeros in a 32-bit value.
  * @val: The value to search
-- 
2.34.1


