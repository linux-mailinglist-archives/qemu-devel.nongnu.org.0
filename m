Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 049575418B8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 23:15:56 +0200 (CEST)
Received: from localhost ([::1]:45052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nygYN-0003UJ-2d
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 17:15:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftW-0008N5-SI
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:42 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:35680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftP-0007GS-Ln
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:42 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 o6-20020a17090a0a0600b001e2c6566046so21930494pjo.0
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EBTWvQZP/RYxFNlEjf8hqWkdSO6h/uW0wx557hiI+xw=;
 b=Mh9AYBq3cU8LhosEfmERJz+m3mYNjuWH9xNqSnyMa4mOxYWNy5rh9iwg1sZ1n+yQCD
 npzDdeExp0tm+eIgk0q6g35WAaCxBx7kIGsT+5Fu7kfBa8ICFtC9WA0aWUHKismnfurm
 drt5mBnDKDR+Euo1qDw8aEAvBsnwLF1/4b9a67E8cmsUU1Zq/QqFopj+6RnmKi5FYcJi
 HOh6cnrhaJ9kIXJE8k4724hhEpTkNxPZPguMIQzxrlB8IGO8hsE2Sm2346P60khJ19uO
 86b0t+naqs31TD0CraQQBrRbkRiuxJbFT8U/qEgZluXiXrTkRN/jY8zOIEvk2TNSGJ3Q
 gOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EBTWvQZP/RYxFNlEjf8hqWkdSO6h/uW0wx557hiI+xw=;
 b=mQpf4M6m2AQOexcIKQ1bEYOmJztyVXKx4b/xPA/xzODzPs8AVbeoigfisBYsqF10Ly
 dJrRFWRipDY6tTANCoxjNX2P8VAEGjA7opYSeyJoM+phMMeySQosF7xfDClbJ7PSLdGz
 inHqTg/2GaYIQqkV5hwE/bWHA6I+W32XFSGhuAzCR4FhM7Zy24+Rkg93gXA53JuJwSv9
 qHli4Im73XxonA2jSvuxHz1BAI08CodjC6IFqZZtuQzbmTO0F3i90Stec8ueqbrmzJpL
 hwoIQQ57R/4RI/iJF8qu/bu5ZIQi5srT6ZpX7mTX/Sl0Qeg9h1CdPc114NigDGHA0DRz
 khgg==
X-Gm-Message-State: AOAM530zvX+Au/JtSkKFcQbKpTCCNErV2izRAlEePWz1QZ+VQ/XlQ7hy
 wCJ5o1mcZ8Uhgw6U1oTMlArC9ebGAyLJTQ==
X-Google-Smtp-Source: ABdhPJxsflG6Ivhs71/ikQt4sx5BGzKxqrj7eQvWDjnsQoZZ2tRF0V/rUO4V9q1UP1S46JMydlarrQ==
X-Received: by 2002:a17:903:2112:b0:166:496a:74b5 with SMTP id
 o18-20020a170903211200b00166496a74b5mr25958473ple.138.1654634014690; 
 Tue, 07 Jun 2022 13:33:34 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 29/71] target/arm: Add the SME ZA storage to CPUARMState
Date: Tue,  7 Jun 2022 13:32:24 -0700
Message-Id: <20220607203306.657998-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

Place this late in the resettable section of the structure,
to keep the most common element offsets from being > 64k.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h     |  8 ++++++++
 target/arm/machine.c | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b48a80dab7..ef374eefe8 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -694,6 +694,14 @@ typedef struct CPUArchState {
     } keys;
 
     uint64_t scxtnum_el[4];
+
+    /*
+     * SME ZA storage -- 256 x 256 byte array, with bytes in host word order,
+     * as we do with vfp.zregs[].  Because this is so large, keep this toward
+     * the end of the reset area, to keep the offsets into the rest of the
+     * structure smaller.
+     */
+    ARMVectorReg zarray[ARM_MAX_VQ * 16];
 #endif
 
 #if defined(CONFIG_USER_ONLY)
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 285e387d2c..54c5c62433 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -167,6 +167,39 @@ static const VMStateDescription vmstate_sve = {
         VMSTATE_END_OF_LIST()
     }
 };
+
+static const VMStateDescription vmstate_vreg = {
+    .name = "vreg",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64_ARRAY(d, ARMVectorReg, ARM_MAX_VQ * 2),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static bool za_needed(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+
+    /*
+     * When ZA storage is disabled, its contents are discarded.
+     * It will be zeroed when ZA storage is re-enabled.
+     */
+    return FIELD_EX64(cpu->env.svcr, SVCR, ZA);
+}
+
+static const VMStateDescription vmstate_za = {
+    .name = "cpu/sme",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = za_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_STRUCT_ARRAY(env.zarray, ARMCPU, ARM_MAX_VQ * 16, 0,
+                             vmstate_vreg, ARMVectorReg),
+        VMSTATE_END_OF_LIST()
+    }
+};
 #endif /* AARCH64 */
 
 static bool serror_needed(void *opaque)
@@ -884,6 +917,7 @@ const VMStateDescription vmstate_arm_cpu = {
         &vmstate_m_security,
 #ifdef TARGET_AARCH64
         &vmstate_sve,
+        &vmstate_za,
 #endif
         &vmstate_serror,
         &vmstate_irq_line_state,
-- 
2.34.1


