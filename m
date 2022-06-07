Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 354E9541836
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 23:11:40 +0200 (CEST)
Received: from localhost ([::1]:36376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nygUF-0005je-A8
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 17:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftU-0008Gw-EU
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:40 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:38909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftN-0007E5-DO
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:39 -0400
Received: by mail-pl1-x634.google.com with SMTP id n18so15800533plg.5
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u3mG8wDmfQDUdFmC25VMT57BuuE4O0ooDRoJ9UT54UY=;
 b=CTYYilsQNzBZqcdO4ar0ypDz5XZ1HXOYderHcVkiFB0jXBbSWFi4bUoAo7VXRitVVv
 61nFUoZ8nqPyekHUfDHZB/F37jEcQ/zP4GChaB7g9iTZRopCIX9Vnr0NzIYi7D6uk/ct
 K1+DSehphgD8MB5S0GefEEKa80oi9qRPlQpLaj2isJ6j761YqiHZTl9miOAE30yYjzEb
 zVKwJNeVPj0Z0DfVcE19QIJufcnKlOwljCL/45jjjHiAH3ZEZl9/I3QUwpsoCgZfMJgR
 oTnYZ2ievOWB2FNlx6ic0dttj32ApYl41HyK0uedVJnJbBIOEkCMEXhGRXVE0x3vaBx+
 YObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u3mG8wDmfQDUdFmC25VMT57BuuE4O0ooDRoJ9UT54UY=;
 b=d6u6anyqWDwz7QdOVpZgi1yVQW1HhQvb77XujKBFYoRzCL1PprK8FCSzsGjl7K2hxz
 PvAKMx+bXOtBsbk6XZDMOVy3qcwKXs4TpMshW35JLijZFFUHxRcC7I1SCeAhG/Igjysr
 oNFhs+GAcbxv8gbBcTHaPgu7nHjulN3G2TydViEGqk0b7lChgfJRJ1geLUYL/nMS2z1O
 nvy7FkiRfnwkObHkX173/WTfKzBvytN4LTte7yTABAaVctBkrlhy580tAIIQNDoQwIM4
 zyb5104Jpby20nCIYVLxd92WBrH+yXtRIelTgjBPnedML50NS3NrJr0u5NXgOcIKfZU1
 pspQ==
X-Gm-Message-State: AOAM533EvpGXcOdtrH09F5cg42oqZYdhG0GntxbgpIdgQl04byzRzxbU
 zxozJX5cOe30Btp/kfRXWqy2EjaHdi8rhA==
X-Google-Smtp-Source: ABdhPJzyQm4ELXqGBa+cQMXkotdEJuG1oQzp9lxBUSoqDNM/OGCoznXI4Xsg3vJrGl2KwQc9ZHaKKQ==
X-Received: by 2002:a17:90a:ce07:b0:1e3:50eb:64d with SMTP id
 f7-20020a17090ace0700b001e350eb064dmr41160732pju.22.1654634012639; 
 Tue, 07 Jun 2022 13:33:32 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 27/71] target/arm: Add SMIDR_EL1, SMPRI_EL1, SMPRIMAP_EL2
Date: Tue,  7 Jun 2022 13:32:22 -0700
Message-Id: <20220607203306.657998-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

Implement the streaming mode identification register, and the
two streaming priority registers.  For QEMU, they are all RES0.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 46318515a8..e7e94213b1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6355,6 +6355,18 @@ static CPAccessResult access_tpidr2(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+static CPAccessResult access_esm(CPUARMState *env, const ARMCPRegInfo *ri,
+                                 bool isread)
+{
+    /* TODO: FEAT_FGT for SMPRI_EL1 but not SMPRIMAP_EL2 */
+    if (arm_current_el(env) < 3
+        && arm_feature(env, ARM_FEATURE_EL3)
+        && !FIELD_EX64(env->cp15.cptr_el[3], CPTR_EL3, ESM)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+    return CP_ACCESS_OK;
+}
+
 static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
@@ -6412,6 +6424,27 @@ static const ARMCPRegInfo sme_reginfo[] = {
       .access = PL3_RW, .type = ARM_CP_SME,
       .fieldoffset = offsetof(CPUARMState, vfp.smcr_el[3]),
       .writefn = smcr_write, .raw_writefn = raw_write },
+    { .name = "SMIDR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 1, .crn = 0, .crm = 0, .opc2 = 6,
+      .access = PL1_R, .accessfn = access_aa64_tid1,
+      /*
+       * IMPLEMENTOR = 0 (software)
+       * REVISION    = 0 (implementation defined)
+       * SMPS        = 0 (no streaming execution priority in QEMU)
+       * AFFINITY    = 0 (streaming sve mode not shared with other PEs)
+       */
+      .type = ARM_CP_CONST, .resetvalue = 0, },
+    /*
+     * Because SMIDR_EL1.SMPS is 0, SMPRI_EL1 and SMPRIMAP_EL2 are RES 0.
+     */
+    { .name = "SMPRI_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 2, .opc2 = 4,
+      .access = PL1_RW, .accessfn = access_esm,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "SMPRIMAP_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 2, .opc2 = 5,
+      .access = PL2_RW, .accessfn = access_esm,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
 };
 #endif /* TARGET_AARCH64 */
 
-- 
2.34.1


