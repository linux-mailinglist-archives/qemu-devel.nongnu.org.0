Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB4B59C679
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 20:36:59 +0200 (CEST)
Received: from localhost ([::1]:49872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQCIE-00050l-NK
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 14:36:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Ox-0004kj-Ml
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:47 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:55829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Oj-0001e4-5T
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:35 -0400
Received: by mail-pj1-x1031.google.com with SMTP id pm13so2434571pjb.5
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=tCVH1Kl59BnkmKbSQf/4G0BExsgfIMMri2yi/FRxOQo=;
 b=F6o0yTuF+CPWWucyTOzZen4xOlYTgXOFmhfJlkIBCB9av7gMgv3kFLemjenTVKlH3A
 xXth4pFoayFQP/CaJqaKOxJwst+lIhuqszvTh4aGXKis7QIh1TFZrhAtvLJLY6l43QLv
 ellNdKvLc1EPo3Ha+qfJWzl1MwXPmwplBogMnGTJOCbAS+mM+g4a+hb53WeOOWi5OZUC
 3nFYZEUTw4D1WDScSvc1Xn4aUj5nhvu7/p2mffIi0M6vzt8lRxMRZ2lgp5Wb920W0kj/
 ulqJ+JKQmyIixr5wHssiUyneGoJ3VNvIr82GJko/ZlbNvyqbFZ7uE0QzBcFqoRMV1ptA
 XGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=tCVH1Kl59BnkmKbSQf/4G0BExsgfIMMri2yi/FRxOQo=;
 b=Th1hVyw9IANgIMSq6UDPG6f4x4NVqC2qYk6I0624iWyMyyzHVJrz+/KGttLQStCY6e
 oXZnPQQ5JoyE7/Mkah+uFQvrS6StujraTI/3mGo7+jFC5+HkczQjGMr03IvtX4i4Q8PE
 gTUo3paZC4Nfd3tupZwIsbnpdfeiDQBVmUchCSfTNq9akmDoZK1yCJqDj/R5mL363cqg
 GNYg8d531xVI4KZixovxauQFFmpAgVzOoHiMssjdXtXxkrXAvSEzhIc8GzE39qXjDtWA
 tlQwHGdabBKrPTjOTs56NUphart5x+OmK1ol0PXtnHCtWPv0aX+dUE04vFgvnza89Ahi
 NuXQ==
X-Gm-Message-State: ACgBeo0/oljtyxQH07LvdB+ybjSFPsQ7yINFQTzx88i2yJOm3CJQcRVm
 ATBFtT8KumtvIr/EGO+hDZ4oszsuEv7u2g==
X-Google-Smtp-Source: AA6agR5589LMp0nKI6pOfIXEuaMBO153dZmBUA5Dih9GT3vtIjBPPpvULE6H6i0JTLEoYNqr+7HdOQ==
X-Received: by 2002:a17:902:f64f:b0:172:a790:320a with SMTP id
 m15-20020a170902f64f00b00172a790320amr20671005plg.149.1661182287920; 
 Mon, 22 Aug 2022 08:31:27 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm10353835pjc.3.2022.08.22.08.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:31:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 51/66] target/arm: Hoist check for disabled stage2
 translation.
Date: Mon, 22 Aug 2022 08:27:26 -0700
Message-Id: <20220822152741.1617527-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

If stage2 translation is disabled, E1&0 translation is
just a single stage.  Use the complete single stage path
rather than breaking out of the middle of the two stage path.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 628c046cab..d9daaf7536 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2437,9 +2437,10 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
     if (mmu_idx != s1_mmu_idx) {
         /*
          * Call ourselves recursively to do the stage 1 and then stage 2
-         * translations if mmu_idx is a two-stage regime.
+         * translations if mmu_idx is a two-stage regime, and stage2 enabled.
          */
-        if (arm_feature(env, ARM_FEATURE_EL2)) {
+        if (arm_feature(env, ARM_FEATURE_EL2) &&
+            !regime_translation_disabled(env, ARMMMUIdx_Stage2, is_secure)) {
             hwaddr ipa;
             int s1_prot;
             int ret;
@@ -2452,9 +2453,8 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
             ret = get_phys_addr_with_secure(env, address, access_type,
                                             s1_mmu_idx, is_secure, result, fi);
 
-            /* If S1 fails or S2 is disabled, return early.  */
-            if (ret || regime_translation_disabled(env, ARMMMUIdx_Stage2,
-                                                   is_secure)) {
+            /* If S1 fails, return early.  */
+            if (ret) {
                 return ret;
             }
 
-- 
2.34.1


