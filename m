Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D3C5E7B3A
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 14:58:26 +0200 (CEST)
Received: from localhost ([::1]:37276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obiG9-0007Bk-CU
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 08:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obhsp-0006QH-Vy
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 08:34:24 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:47087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obhso-0007Vt-29
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 08:34:19 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 n40-20020a05600c3ba800b003b49aefc35fso3093911wms.5
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 05:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=nzYcMZmeofPl1Va3UQhOnDEUNbpieLRg2NI1ebwCrJo=;
 b=bHOjSLctZxqkuac3QdDYqDSBx32cnfv3NAeNOdY4v0jX5TayIc9HoYS8ZeI1MaUmf1
 bJqvXwLF6vBqfxxJxRaMxbrpkTH/Ha1mHchQ4ZcLGA7L+Jf1/AjDoHa5oWRV+OzuAzD8
 ZOnYpOC/uhqb4lWzh4PiI+jqoU38GBVGYSAWMATPeXyfopyUnzLnZXufqv4W2F9J9QWy
 iiaVgOHpqw7VF63shxgMqMLXDglCxo+AOiJU+Q2ER7tifqT/y0nWPpsWH35Bdux+z1ku
 +GOVF45+L8VB1yJAEYRZdFBSgxDGBu7EeFEIqTNkwGfmCCoBSinDggUgZ3EZ6uwJZP5u
 rI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=nzYcMZmeofPl1Va3UQhOnDEUNbpieLRg2NI1ebwCrJo=;
 b=QphVTpjJebUelcyZiaLqus7aWFA0PncNdpoBLhMh5UGnbq7sI0OTQ2p+HVF/ToZ5R6
 C+xxpNeVuFcCySwJ8W6p4BnmVikEiBoZ0VPiODxljwaPAK5XWCrsDOQQ0rhqElCoR/r0
 HH60qrT3kBBymdBhDjHAgC61mW780+tvO2KuwxBt5A/MNkA0pmye7u6eRoM4LWcqLewd
 Lq1RULyrmgkzwryoBNgFn9h5HqC5mohtEvpqaTsJVAJxszp39I2+J9hoC6LELf4afhw8
 wqSBxLtGsOFONV5F3aX+csWV4oVdnZUsMsSU9BSdRevx9/UjkK+wYRexE1y3s/h4DmxZ
 7Gkw==
X-Gm-Message-State: ACrzQf2pG9wrROHsUaUY16NwB5Aj1op21W1GzMQmXHBGgMo17RpCLktc
 dK/EuH5Ce0/gdxDTB9c+uIASRbOGJEBTEA==
X-Google-Smtp-Source: AMsMyM7g81j5/AZ29gnmGoKhLtty9j4/7hnXRQ30jSiNUvX2goHN+lhwZTcTmxjAqGsE4BTC3qtK8Q==
X-Received: by 2002:a05:600c:444b:b0:3b4:fdbd:5965 with SMTP id
 v11-20020a05600c444b00b003b4fdbd5965mr5791299wmn.128.1663936456603; 
 Fri, 23 Sep 2022 05:34:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n43-20020a05600c502b00b003b486027c8asm2504555wmr.20.2022.09.23.05.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 05:34:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
Subject: [PATCH 2/3] target/arm: Make writes to MDCR_EL3 use PMU start/finish
 calls
Date: Fri, 23 Sep 2022 13:34:11 +0100
Message-Id: <20220923123412.1214041-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220923123412.1214041-1-peter.maydell@linaro.org>
References: <20220923123412.1214041-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

In commit 01765386a88868 we fixed a bug where we weren't correctly
bracketing changes to some registers with pmu_op_start() and
pmu_op_finish() calls for changes which affect whether the PMU
counters might be enabled.  However, we missed the case of writes to
the AArch64 MDCR_EL3 register, because (unlike its AArch32
counterpart) they are currently done directly to the CPU state struct
without going through the sdcr_write() function.

Give MDCR_EL3 a writefn which handles the PMU start/finish calls.
The SDCR writefn then simplfies to "call the MDCR_EL3 writefn after
masking off the bits which don't exist in the AArch32 register".

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7c7ba328d6d..cebce23da07 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4761,8 +4761,8 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 }
 
-static void sdcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                       uint64_t value)
+static void mdcr_el3_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                           uint64_t value)
 {
     /*
      * Some MDCR_EL3 bits affect whether PMU counters are running:
@@ -4774,12 +4774,19 @@ static void sdcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     if (pmu_op) {
         pmu_op_start(env);
     }
-    env->cp15.mdcr_el3 = value & SDCR_VALID_MASK;
+    env->cp15.mdcr_el3 = value;
     if (pmu_op) {
         pmu_op_finish(env);
     }
 }
 
+static void sdcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                       uint64_t value)
+{
+    /* Not all bits defined for MDCR_EL3 exist in the AArch32 SDCR */
+    mdcr_el3_write(env, ri, value & SDCR_VALID_MASK);
+}
+
 static void mdcr_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
                            uint64_t value)
 {
@@ -5127,9 +5134,12 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .access = PL2_RW,
       .fieldoffset = offsetof(CPUARMState, banked_spsr[BANK_FIQ]) },
     { .name = "MDCR_EL3", .state = ARM_CP_STATE_AA64,
+      .type = ARM_CP_IO,
       .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 3, .opc2 = 1,
       .resetvalue = 0,
-      .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.mdcr_el3) },
+      .access = PL3_RW,
+      .writefn = mdcr_el3_write,
+      .fieldoffset = offsetof(CPUARMState, cp15.mdcr_el3) },
     { .name = "SDCR", .type = ARM_CP_ALIAS | ARM_CP_IO,
       .cp = 15, .opc1 = 0, .crn = 1, .crm = 3, .opc2 = 1,
       .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
-- 
2.25.1


