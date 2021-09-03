Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 267464006D3
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:42:42 +0200 (CEST)
Received: from localhost ([::1]:50732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMG1J-00068J-7E
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mMFqi-0002Es-Jo; Fri, 03 Sep 2021 16:31:44 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:36689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mMFqf-0001Xd-P5; Fri, 03 Sep 2021 16:31:44 -0400
Received: by mail-qv1-xf31.google.com with SMTP id 4so374475qvp.3;
 Fri, 03 Sep 2021 13:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ukurBi8X67LqiASHRO+Ul9Xn9yD1nrkZ6OZjA9p8dZc=;
 b=Uu9LqkESRfQs1/7YETm948XY377HZ5cM2sQhIPLzGamiebYpD/60Xi5XKJc3jH1xd+
 nKSE/kQUyW1Cz35wLnB0UXy6DzX3Uk7ITjvlm1D/xEvxg/5j/5dM3rlhm2KiBf2CISeW
 o7WwhvxFCfnwPOa53nW/LtiWSdRClbpzg7Y48ojZUzvEDepVxh0zbCgDjSctdOT2409R
 EFqbnR9T+iRMmbKx8pXyhcWCqM8Y7I64XvAiJdoVD8H/EGiM4PS4fSt+OLfdhj1kOT8+
 cL0S5fQIvL6LS9EfBQ3UUTWclbn5832DmjZhKoQn3hO148QbettC1J5X3MZ30gRB5Nee
 yvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ukurBi8X67LqiASHRO+Ul9Xn9yD1nrkZ6OZjA9p8dZc=;
 b=m4DWr7iGnuYzLM+GYRixWtnVBd0+8unX9k0jPP5avYrKfILQq/+JyaIC7vCEI5KomO
 dbiZGM2apk5ARqIPdzwmsrHVL3DuFtWJwg4S5xUsZq5BbkZ9dProkZaNjy0NGBXJyg1n
 pDrjZY4ZGVWpkefMcyLv/cE7zjtEnTesn1MTAwA2bVLL0dAnd9kwLa8iPM8IugWCfyrv
 XrNEtaz+uwiJATmPXF8UnZpoPXcQ/LKUzHlTEdkdMbFrDl21//L2XayvBZGxs68Qkv0X
 2XgnD11ZPP/1d0pzvR1lRQu3hkAb1s5K1EH1VJ07YUgaAyAtuOOvbGZMiXmbmvgO69eb
 3MOg==
X-Gm-Message-State: AOAM531BzQvzz+A98RQWGNpRvlZInNPBYI0ZMnaGww5IECG20mlIIDLE
 ahsw+0GDov4mNGhcu5/l90NJZw+9T8Q=
X-Google-Smtp-Source: ABdhPJz8UMOnMdnBverO1ftZzSaFd546+NSAcNaXCWXrWd+pV1YoV4jDOX49ToPOwSYCw11dFXSNCg==
X-Received: by 2002:a05:6214:3008:: with SMTP id
 ke8mr951007qvb.17.1630701100410; 
 Fri, 03 Sep 2021 13:31:40 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.136.122])
 by smtp.gmail.com with ESMTPSA id z6sm285613qtq.78.2021.09.03.13.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 13:31:40 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/15] target/ppc/power8_pmu.c: enable PMC1-PMC4 events
Date: Fri,  3 Sep 2021 17:31:05 -0300
Message-Id: <20210903203116.80628-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903203116.80628-1-danielhb413@gmail.com>
References: <20210903203116.80628-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf31.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 richard.henderson@linaro.org, groug@kaod.org, qemu-ppc@nongnu.org,
 clg@kaod.org, matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch enable all PMCs but PMC5 to count cycles. To do that we
need to implement MMCR1 bits where the event are stored, retrieve
them, see if the PMC was configured with a PM_CYC event, and
calculate cycles if that's the case.

PowerISA v3.1 defines the following conditions to count cycles:

- PMC1 set with the event 0xF0;
- PMC6, which always count cycles

However, the PowerISA also defines a range of 'implementation dependent'
events that the chip can use in the 0x01-0xBF range. Turns out that IBM
POWER chips implements some non-ISA events, and the Linux kernel makes uses
of them. For instance, 0x1E is an implementation specific event that
counts cycles in PMCs 1-4 that the kernel uses. Let's also support 0x1E
to count cycles to allow for existing kernels to behave properly with the
PMU.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h        | 11 +++++++++
 target/ppc/power8_pmu.c | 52 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index a9b31736af..74698a3600 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -352,6 +352,17 @@ typedef struct ppc_v3_pate_t {
 /* MMCR0 userspace r/w mask */
 #define MMCR0_UREG_MASK (MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE)
 
+#define MMCR1_EVT_SIZE 8
+/* extract64() does a right shift before extracting */
+#define MMCR1_PMC1SEL_START 32
+#define MMCR1_PMC1EVT_EXTR (64 - MMCR1_PMC1SEL_START - MMCR1_EVT_SIZE)
+#define MMCR1_PMC2SEL_START 40
+#define MMCR1_PMC2EVT_EXTR (64 - MMCR1_PMC2SEL_START - MMCR1_EVT_SIZE)
+#define MMCR1_PMC3SEL_START 48
+#define MMCR1_PMC3EVT_EXTR (64 - MMCR1_PMC3SEL_START - MMCR1_EVT_SIZE)
+#define MMCR1_PMC4SEL_START 56
+#define MMCR1_PMC4EVT_EXTR (64 - MMCR1_PMC4SEL_START - MMCR1_EVT_SIZE)
+
 /* LPCR bits */
 #define LPCR_VPM0         PPC_BIT(0)
 #define LPCR_VPM1         PPC_BIT(1)
diff --git a/target/ppc/power8_pmu.c b/target/ppc/power8_pmu.c
index 47de38a99e..3f7b305f4f 100644
--- a/target/ppc/power8_pmu.c
+++ b/target/ppc/power8_pmu.c
@@ -31,10 +31,62 @@ static void update_PMC_PM_CYC(CPUPPCState *env, int sprn,
     env->spr[sprn] += time_delta;
 }
 
+static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
+                                        uint64_t time_delta)
+{
+    uint8_t event, evt_extr;
+
+    switch (sprn) {
+    case SPR_POWER_PMC1:
+        evt_extr = MMCR1_PMC1EVT_EXTR;
+        break;
+    case SPR_POWER_PMC2:
+        evt_extr = MMCR1_PMC2EVT_EXTR;
+        break;
+    case SPR_POWER_PMC3:
+        evt_extr = MMCR1_PMC3EVT_EXTR;
+        break;
+    case SPR_POWER_PMC4:
+        evt_extr = MMCR1_PMC4EVT_EXTR;
+        break;
+    default:
+        return;
+    }
+
+    event = extract64(env->spr[SPR_POWER_MMCR1], evt_extr, MMCR1_EVT_SIZE);
+
+    /*
+     * MMCR0_PMC1SEL = 0xF0 is the architected PowerISA v3.1 event
+     * that counts cycles using PMC1.
+     *
+     * IBM POWER chips also has support for an implementation dependent
+     * event, 0x1E, that enables cycle counting on PMCs 1-4. The
+     * Linux kernel makes extensive use of 0x1E, so let's also support
+     * it.
+     */
+    switch (event) {
+    case 0xF0:
+        if (sprn == SPR_POWER_PMC1) {
+            update_PMC_PM_CYC(env, sprn, time_delta);
+        }
+        break;
+    case 0x1E:
+        update_PMC_PM_CYC(env, sprn, time_delta);
+        break;
+    default:
+        return;
+    }
+}
+
 static void update_cycles_PMCs(CPUPPCState *env)
 {
     uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
     uint64_t time_delta = now - env->pmu_base_time;
+    int sprn;
+
+    for (sprn = SPR_POWER_PMC1; sprn < SPR_POWER_PMC5; sprn++) {
+        update_programmable_PMC_reg(env, sprn, time_delta);
+    }
 
     update_PMC_PM_CYC(env, SPR_POWER_PMC6, time_delta);
 }
-- 
2.31.1


