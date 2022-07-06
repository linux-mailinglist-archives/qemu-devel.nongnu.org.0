Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D40568386
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:33:30 +0200 (CEST)
Received: from localhost ([::1]:44674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o91PU-00041V-Om
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90PR-0000nd-IY
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:29:21 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:37735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90PQ-0001Fh-1k
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:29:21 -0400
Received: by mail-pg1-x530.google.com with SMTP id bh13so7517504pgb.4
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ojyZOIf2uqXDhLYPW4II9jqD/RYb57Q1CkTjNakDECE=;
 b=LQM7v3FXJd5OvJvSswIUXN/4OBPEazXdJr5PeQsGQP0h9nE1FuoBSZL6VrABzRgBxt
 NDnRb6YIJvAnL80N48NTCb+UfmVRa4KMJ7K+877ox2+SvW7vPGCbMwdqnoEOL/UM+jk9
 WH4zCMjh4X7A0/Zzd54FV7Npn39gUjcf2odtIZwJdcqMLMWdrAmuPCKLytfxV42d28Hq
 pVKRY3RIa3niIiDBM5n4EuFpSP2nmeEFQqCsRv/sv6QTxwiMKY+0S8zFg8rtmQwJ3+8H
 J8v1S7eXxKUX0nTQVbElsH6p/MrBG2Zu8Mo5+oK5nBuSfH9NCY4JKlAxDwoyCb5GTuGe
 ptCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ojyZOIf2uqXDhLYPW4II9jqD/RYb57Q1CkTjNakDECE=;
 b=g5cYJarwQWR/j3PFUALA6/qCybUSHs5qaVb1sGb1SxYhn1c//i/Bhh52fTpINogoRR
 +JbsVAYLJksScU9b02Z+9KgqUou7EPswOWupliG3GRBAXWJmNrjMBakCF4GL7lJaW4py
 WofHddTZImKrq0gKqNoD20g1McTQINXMKtZGBh8zjuM10HAlMpLl3bt4+NVTGTcVPfOl
 dyvrLAuSiR3TIfERRb99IqCyy7xY1ZUTddnwy6H7aEifIJEnYf8DVwvBSYNRiEqPp/aZ
 GVAzsgv/Yhix9hxIk/zSX+teUZyZRR6FqlfJaG+yrhR9Te0hi1PrPkc9kMgV3hl2cGuG
 lLYw==
X-Gm-Message-State: AJIora/p44/vWowd/1uFIc8vs7sqahBEcjderxeL3+quhw6gtdeyb202
 KYV44Z/QskCzE0ms1Hu9YEbdZ7UxTX3ZzW7H
X-Google-Smtp-Source: AGRyM1tSm9YB7Xscl0N0CKQ/e43PI0tqUOdkSneuthDobtQNyQVjplbn1OwwpN0xhMIp/xJkz9qbsQ==
X-Received: by 2002:a63:6d8b:0:b0:40d:a35:13ed with SMTP id
 i133-20020a636d8b000000b0040d0a3513edmr34473006pgc.615.1657096158734; 
 Wed, 06 Jul 2022 01:29:18 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 c17-20020a170903235100b0016bdf53b303sm6700529plh.205.2022.07.06.01.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:29:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 44/45] target/arm: Enable SME for user-only
Date: Wed,  6 Jul 2022 13:54:10 +0530
Message-Id: <20220706082411.1664825-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

Enable SME, TPIDR2_EL0, and FA64 if supported by the cpu.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 9b54443843..5de7e097e9 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -210,6 +210,17 @@ static void arm_cpu_reset(DeviceState *dev)
                                              CPACR_EL1, ZEN, 3);
             env->vfp.zcr_el[1] = cpu->sve_default_vq - 1;
         }
+        /* and for SME instructions, with default vector length, and TPIDR2 */
+        if (cpu_isar_feature(aa64_sme, cpu)) {
+            env->cp15.sctlr_el[1] |= SCTLR_EnTP2;
+            env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
+                                             CPACR_EL1, SMEN, 3);
+            env->vfp.smcr_el[1] = cpu->sme_default_vq - 1;
+            if (cpu_isar_feature(aa64_sme_fa64, cpu)) {
+                env->vfp.smcr_el[1] = FIELD_DP64(env->vfp.smcr_el[1],
+                                                 SMCR, FA64, 1);
+            }
+        }
         /*
          * Enable 48-bit address space (TODO: take reserved_va into account).
          * Enable TBI0 but not TBI1.
-- 
2.34.1


