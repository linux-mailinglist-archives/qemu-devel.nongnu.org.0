Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F6159C642
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 20:29:57 +0200 (CEST)
Received: from localhost ([::1]:43080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQCBP-0005H8-Lc
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 14:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9P6-0004ok-My
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:52 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:45708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9P0-0001i8-4y
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:52 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 x63-20020a17090a6c4500b001fabbf8debfso11663579pjj.4
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=717fzziULIfrv0GZaFcKnjtRk3XAFj/8qM7MoF3/+do=;
 b=omKxley/3yr+rIUu3wY3+x6pT4C8/r5M8W9+CWcEKcyyHXLzXQ/sldfdbDwZNMIK0w
 21GK5i3RpQAoIsW48nVITOfAV8KvybMdcEGAeQ2GBQwjcGA40AzYISbGZH0DAHuqzjKQ
 VrgPM6e/p+Q/5liy6TalDUYfR6x/0lbK3bC2eNP/8mmdClT3CN54PWbxrFIXxtsIMhF+
 IjmoDmnC20FKc7pC0LzGTzbFMgqMhHkXQee5tNcEgXBNkKDw1BkySmX16hdgYQXCLfQA
 PaMT7iDNqsZK7439Diu8NBAa6KUISJPiHjsUipvMABPh9B5JrmcwfaDpEze87FXwaYtf
 aqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=717fzziULIfrv0GZaFcKnjtRk3XAFj/8qM7MoF3/+do=;
 b=Fw9R0dMucraWSHSTRMv03TFIy4HEazQ43LgF6l0whU3KwMhRrtSCQNasCXcGoo0rPc
 c2XxJthy7+8EgfLiv/uaY1LqHoyJS0HarGL1g0NtEEj69OTm72JCnZr/heOo4p9MQTuF
 Q18oct6aCKBaaXh3JyfQ8x6HLnk+nP1WSQaaD/PdNl8Ph8JPd6z1T3MWBR8pjVY3+guu
 7zj0sMOlEOFia0tlOlE+Z3pikLdXYmOfgapIu936tZejMDy+uocMP/oilhL3gIJp/oGj
 aauYqx1VD+UCeRLDkA2c6pzxqHCG6rrXu6Au8FfPyUcB/FSRf1tQ0NB93iN7iAKp8BG7
 k/Rg==
X-Gm-Message-State: ACgBeo2biM5sJ4ztGPwfEQFE00MIZ+9pot8fzKGyhMi573J37HckhNii
 KoRc7E+atAzlWmnRanRk1h8syFMsTHNYvA==
X-Google-Smtp-Source: AA6agR45WyMGyfjpGzXOhyJJhwf5G20qNOe1hrNEueg7r/KH6IYZ3xjztL2hkad+Nxsch0txxYX1BA==
X-Received: by 2002:a17:90a:f88:b0:1fa:da0f:5e6 with SMTP id
 8-20020a17090a0f8800b001fada0f05e6mr20236534pjz.102.1661182298340; 
 Mon, 22 Aug 2022 08:31:38 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm10353835pjc.3.2022.08.22.08.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:31:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 65/66] target/arm: Consider GP an attribute in
 get_phys_addr_lpae
Date: Mon, 22 Aug 2022 08:27:40 -0700
Message-Id: <20220822152741.1617527-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both GP and DBM are in the upper attribute block.
Extend the computation of attrs to include them,
then simplify the setting of guarded.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 068ff2025a..c38c7d2a65 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1029,7 +1029,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     uint32_t el = regime_el(env, mmu_idx);
     uint64_t descaddrmask;
     bool aarch64 = arm_el_is_aa64(env, el);
-    bool guarded = false;
     S1TranslateResult s1;
     uint64_t descriptor;
     bool nstable;
@@ -1291,7 +1290,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     descaddr &= ~(page_size - 1);
     descaddr |= (address & (page_size - 1));
     /* Extract attributes from the descriptor */
-    attrs = descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(52, 12));
+    attrs = descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(50, 14));
 
     if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
         /* Stage 2 table descriptors do not include any attribute fields */
@@ -1299,7 +1298,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     }
     /* Merge in attributes from table descriptors */
     attrs |= nstable << 5; /* NS */
-    guarded = extract64(descriptor, 50, 1);  /* GP */
     if (param.hpd) {
         /* HPD disables all the table attributes except NSTable.  */
         goto skip_attrs;
@@ -1352,7 +1350,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
     /* When in aarch64 mode, and BTI is enabled, remember GP in the TLB.  */
     if (aarch64 && cpu_isar_feature(aa64_bti, cpu)) {
-        result->f.guarded = guarded;
+        result->f.guarded = extract64(attrs, 50, 1); /* GP */
     }
 
     if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
-- 
2.34.1


