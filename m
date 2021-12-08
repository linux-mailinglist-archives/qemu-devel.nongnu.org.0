Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C4746DEEA
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 00:14:09 +0100 (CET)
Received: from localhost ([::1]:35856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mv68V-0007IC-Mn
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 18:14:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mv66S-00058s-RH
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 18:12:00 -0500
Received: from [2607:f8b0:4864:20::62e] (port=42602
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mv66Q-0004nC-RJ
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 18:12:00 -0500
Received: by mail-pl1-x62e.google.com with SMTP id u17so2557307plg.9
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 15:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Bg5qVk1ZQ88PRRWOggs3a3wuRuKCDpNLFKTwJvEK+Vk=;
 b=TUCxmnVtTnJf++YlY/xAH9sToCVtf1EsMUZAx2FXAQXsTbzeew2Re6MjIGulNLS0w+
 ky6UH23X/hOgPaJuPTj936B4YdOKgA34ohuE4A0lCv2xyZjTNgsE+hjYMTKPv/aNO1vh
 5EmFEBtlx6Q/C66v8ydLIMOeYgn9ZhsIA8asGRb4xMwiyZ/yANjDHupqIpKsSCfyJAUp
 XQylnB+UWSCmSOm4Qiu8DvS/OCUnb9Zb03AVXPgaPGRGzGtisZTVzM5kRWl+tc1Ji5sy
 td5cjiAWJjLmvp0kL+IUeI2b6glhYkhEJn9NiiiFF7yhiieFm+23yXhRlN1SgcoSp4R2
 Tq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bg5qVk1ZQ88PRRWOggs3a3wuRuKCDpNLFKTwJvEK+Vk=;
 b=RjbZlN27rGe4V0JKvym3F8KwHqintfP+mt7GAFqaqq1fPeNf/wplm5niumaNYQYLr0
 YNUW7FT3ARhtEs7TRkjWWsOEzhgEs9i+PVMPIKIwWQC9ZzKPGbgfWnQ52szgEBa2KKYe
 ycNsqLWMcdIoOpOba3SL5bzHCX3ws01DlVefLLVdcE5qQ0nwKnZuUeA1+guE6Ev5jgop
 1U6Yq3NLXJQLCk0vXmUionobMvEJDNlUwY9IFX7s8tkLY/uOCP78u8UL791FrtYbGjtO
 XY1Bw29KY0pZs/s8/ryYrA7c27cms1oIH1+KmcWIC4oKjxsE4YuL96SDcAzpCQnE9mMS
 u/+g==
X-Gm-Message-State: AOAM533i3W3ABZNliam0d3Dx7XxBn0cBjO7uTEC/N7uy9kTzLfTXdiLE
 b0LcUOkKhgPnN6DGMMwsjq8E2Y+ZY1M/ww==
X-Google-Smtp-Source: ABdhPJy9WebIgkOp8lG0mcDNvxfb/eQkqGIHeJd63JQlgs++p/j5j6g+0oRvuvJ9E0JM9AoUm9NN4g==
X-Received: by 2002:a17:902:ba84:b0:142:5514:8dd7 with SMTP id
 k4-20020a170902ba8400b0014255148dd7mr63438969pls.87.1639005117597; 
 Wed, 08 Dec 2021 15:11:57 -0800 (PST)
Received: from localhost.localdomain
 (45-19-222-18.lightspeed.sntcca.sbcglobal.net. [45.19.222.18])
 by smtp.gmail.com with ESMTPSA id k15sm3301062pgn.91.2021.12.08.15.11.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 15:11:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] target/arm: Move arm_pamax out of line
Date: Wed,  8 Dec 2021 15:11:50 -0800
Message-Id: <20211208231154.392029-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211208231154.392029-1-richard.henderson@linaro.org>
References: <20211208231154.392029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 19 +------------------
 target/arm/helper.c    | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+), 18 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 89f7610ebc..27d2fcd26c 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -243,24 +243,7 @@ static inline void update_spsel(CPUARMState *env, uint32_t imm)
  * Returns the implementation defined bit-width of physical addresses.
  * The ARMv8 reference manuals refer to this as PAMax().
  */
-static inline unsigned int arm_pamax(ARMCPU *cpu)
-{
-    static const unsigned int pamax_map[] = {
-        [0] = 32,
-        [1] = 36,
-        [2] = 40,
-        [3] = 42,
-        [4] = 44,
-        [5] = 48,
-    };
-    unsigned int parange =
-        FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
-
-    /* id_aa64mmfr0 is a read-only register so values outside of the
-     * supported mappings can be considered an implementation error.  */
-    assert(parange < ARRAY_SIZE(pamax_map));
-    return pamax_map[parange];
-}
+unsigned int arm_pamax(ARMCPU *cpu);
 
 /* Return true if extended addresses are enabled.
  * This is always the case if our translation regime is 64 bit,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 575723d62c..fab9ee70d8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11090,6 +11090,28 @@ static uint8_t convert_stage2_attrs(CPUARMState *env, uint8_t s2attrs)
 }
 #endif /* !CONFIG_USER_ONLY */
 
+/* The cpu-specific constant value of PAMax; also used by hw/arm/virt. */
+unsigned int arm_pamax(ARMCPU *cpu)
+{
+    static const unsigned int pamax_map[] = {
+        [0] = 32,
+        [1] = 36,
+        [2] = 40,
+        [3] = 42,
+        [4] = 44,
+        [5] = 48,
+    };
+    unsigned int parange =
+        FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
+
+    /*
+     * id_aa64mmfr0 is a read-only register so values outside of the
+     * supported mappings can be considered an implementation error.
+     */
+    assert(parange < ARRAY_SIZE(pamax_map));
+    return pamax_map[parange];
+}
+
 static int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx)
 {
     if (regime_has_2_ranges(mmu_idx)) {
-- 
2.25.1


