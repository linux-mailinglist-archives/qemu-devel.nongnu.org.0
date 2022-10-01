Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5D15F1E63
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 19:19:36 +0200 (CEST)
Received: from localhost ([::1]:55586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeg9H-0007v1-8X
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 13:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefLT-0008Ad-7D
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:28:07 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:41556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefLQ-00073t-KW
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:28:06 -0400
Received: by mail-qk1-x72b.google.com with SMTP id k12so4539393qkj.8
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=c3faqUVexkW9Ve/ySw7NotLcZ32qWMzAZ3wh+jbFG0Y=;
 b=S461/8spdNdshMllW4X9a3n2XFBsfMMa86ssRTXrrRk/x2VKBlvmFHkA+qgk5hzsVj
 LfPP5Nr4ncNHEdMiLcyDLDjFiCw3fOSSIzG1PLlQEIp6jmvuXbZIJO8YKoPNdnhRlK3e
 XXziGJNfa/vLt1MEf0I7fSfTqDZfIdxd7nPtBHxKTImUfm7GDvHyqkp3pEWEn16JygsN
 yBDHgcVsySynVmTOpypqo6PSU2ol/0o88rmZm3wyh5MwC3XQZgn9jABKUo6QVYv6X8A/
 V9bKNPD6s8KI/c3q1awNgfdvR7gA+s0xxhMklyNmNguX8inZluGG59XM/lQBRbMWjipY
 qVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=c3faqUVexkW9Ve/ySw7NotLcZ32qWMzAZ3wh+jbFG0Y=;
 b=PIpvFcJ3R8p5KUrY9/IaM2ts/ejVqVtNP76MBnYAKT6s6h6pRYytHVceC8Lz9VyLL+
 vqOKAjYOI0GnFHqu9+2QdopoWeTfKsXC+v/GYwl/9KXrK3LYWPn/V2WccYeWMGMi+0Xa
 ob7i2uJrfF2VZ7znw0w8hySnE5UILYAIz0yzGnFWHiW39Dxd3MIX2Y1lcPH0Ra+TIE8Y
 TDkgrTKycu1RVDUgENVI6j/V0MA8mci0KKIfVlRUW3MBFhOVWQs/MnP99YYan9lvzkCC
 6j00jA9m7tEvXntSubITMK08eZj0E7Xkp9L9XeQ2YR6+COleugimT2CGEcYYBkOcCBUk
 h32A==
X-Gm-Message-State: ACrzQf2/nDjtP5wa8SUjrtPehTtdIQoInbvednDhxdxJ1cxrmI/Yx2dl
 NOMGvpIqTysTQOG3x0PHgP5xEA7WyOin9A==
X-Google-Smtp-Source: AMsMyM4v1FDZRHiNn2L89BWxBYfNoyJLrlfRoUr5tZbDh09kQKWxxfiPsSTClnkhY2065NBRApG51A==
X-Received: by 2002:a05:620a:1727:b0:6ce:9b88:92aa with SMTP id
 az39-20020a05620a172700b006ce9b8892aamr9698822qkb.160.1664641682742; 
 Sat, 01 Oct 2022 09:28:02 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 i19-20020a05620a249300b006b5e296452csm6403305qkn.54.2022.10.01.09.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:28:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 40/42] target/arm: Consider GP an attribute in
 get_phys_addr_lpae
Date: Sat,  1 Oct 2022 09:23:16 -0700
Message-Id: <20221001162318.153420-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index c68fd73617..45734b0d28 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1079,7 +1079,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     uint32_t el = regime_el(env, mmu_idx);
     uint64_t descaddrmask;
     bool aarch64 = arm_el_is_aa64(env, el);
-    bool guarded = false;
     S1TranslateResult s1;
     uint64_t descriptor;
     bool nstable;
@@ -1341,7 +1340,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     descaddr &= ~(page_size - 1);
     descaddr |= (address & (page_size - 1));
     /* Extract attributes from the descriptor */
-    attrs = descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(52, 12));
+    attrs = descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(50, 14));
 
     if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
         /* Stage 2 table descriptors do not include any attribute fields */
@@ -1349,7 +1348,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     }
     /* Merge in attributes from table descriptors */
     attrs |= nstable << 5; /* NS */
-    guarded = extract64(descriptor, 50, 1);  /* GP */
     if (param.hpd) {
         /* HPD disables all the table attributes except NSTable.  */
         goto skip_attrs;
@@ -1402,7 +1400,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
     /* When in aarch64 mode, and BTI is enabled, remember GP in the TLB.  */
     if (aarch64 && cpu_isar_feature(aa64_bti, cpu)) {
-        result->f.guarded = guarded;
+        result->f.guarded = extract64(attrs, 50, 1); /* GP */
     }
 
     if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
-- 
2.34.1


