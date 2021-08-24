Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 538B93F62CF
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:38:54 +0200 (CEST)
Received: from localhost ([::1]:51522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZRt-0001uJ-AC
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIZKI-0007xK-IT; Tue, 24 Aug 2021 12:31:02 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:43628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIZKG-0008QC-IR; Tue, 24 Aug 2021 12:31:02 -0400
Received: by mail-qt1-x82b.google.com with SMTP id l3so17292943qtk.10;
 Tue, 24 Aug 2021 09:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4eDBsqBrkx+FZ9A4I0qxuPAYav8j2n9GDdESj6saX/o=;
 b=VUfLSW67gk4gN7V/cxhFTm81iMGPa0soHxpgc+e719k/7tPD/WHDCzZ1wqaVaJl4tt
 3JBwGtENfenYLRttA8q0huypmyBo3vixfL/5M3NRgQ+AWs2Zwt5x1gX9F+n+QHNTNX2C
 b3jzKOQV3w4cVFzNgHmBaJRzLHeotb+gvfS0LPHFXVHtPC2FkgaoDW0oFyvT9unpNbaO
 qYlWN+vExshxmC4rxeOers1vX/qltDx/VtA+NYzF6Dig+Avg7cSyUdLvJQirVLOAEJtW
 5D858FOiSnetwaO7zsGPsNHZvHj8lx+BLX04WMl56FRlle/kPApnFjboM7p2bPVGQOni
 Arpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4eDBsqBrkx+FZ9A4I0qxuPAYav8j2n9GDdESj6saX/o=;
 b=P6iMeYDdRgP7gl/QxLSbJE68YrIRn6Gcr/yNZFFtmp6nWXp4nCcDtXupyh81P26iqu
 vSZgFLYLYMRphhw33BNwy8vvrh8q2stxPLkDMk7U5fmok0vjge0cJd3x2WkxxMFAFUbN
 ZWsDxKfRGiD2TthwwuTPlhQquAtFn+tmUD96dA1UAmawvmZ24SxKmu1VB6vfiQJGcNYA
 ThxpYiIxpUgT9PTohjKkrk1pMKmkWUokLudgYja071zHzR4cKzcqScGNT3iwW1Oy8+8R
 JyANcYMJPN9TzMRGVj+njkPxcfAwktpwgJG0ybBdzpzZpzT1XaE3zAYs7AW1Pn3Y8W71
 F5bA==
X-Gm-Message-State: AOAM532XEF4HChBRBpwTzt68t8hSm954NbCx7QoTfjKWK74o0psHipXp
 Oo2r1vy4EMHFXb3/dUsRL7TLmeQ/QEQ=
X-Google-Smtp-Source: ABdhPJxUC/Rl8Y06y7VsxU5yahAHkii6rDBBOCeYgge9jMoDkvnu64K2rDrKw7NMGBQoze645fBdmA==
X-Received: by 2002:a05:622a:18a3:: with SMTP id
 v35mr24128683qtc.382.1629822658953; 
 Tue, 24 Aug 2021 09:30:58 -0700 (PDT)
Received: from rekt.ihost.com ([179.247.162.205])
 by smtp.gmail.com with ESMTPSA id 75sm10951474qko.100.2021.08.24.09.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 09:30:58 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/16] target/ppc/power8_pmu.c: enable PMC1-PMC4 events
Date: Tue, 24 Aug 2021 13:30:21 -0300
Message-Id: <20210824163032.394099-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824163032.394099-1-danielhb413@gmail.com>
References: <20210824163032.394099-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82b.google.com
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
Cc: gustavo.romero@linaro.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 richard.henderson@linaro.org, groug@kaod.org, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
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
 target/ppc/cpu.h        |  8 +++++++
 target/ppc/power8_pmu.c | 53 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 6878d950de..e5df644a3c 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -350,6 +350,14 @@ typedef struct ppc_v3_pate_t {
 #define MMCR0_FCECE PPC_BIT(38)         /* FC on Enabled Cond or Event */
 #define MMCR0_PMCC  PPC_BITMASK(44, 45) /* PMC Control */
 
+#define MMCR1_PMC1SEL_SHIFT (63 - 39)
+#define MMCR1_PMC1SEL PPC_BITMASK(32, 39)
+#define MMCR1_PMC2SEL_SHIFT (63 - 47)
+#define MMCR1_PMC2SEL PPC_BITMASK(40, 47)
+#define MMCR1_PMC3SEL_SHIFT (63 - 55)
+#define MMCR1_PMC3SEL PPC_BITMASK(48, 55)
+#define MMCR1_PMC4SEL PPC_BITMASK(56, 63)
+
 /* LPCR bits */
 #define LPCR_VPM0         PPC_BIT(0)
 #define LPCR_VPM1         PPC_BIT(1)
diff --git a/target/ppc/power8_pmu.c b/target/ppc/power8_pmu.c
index 47de38a99e..007007824d 100644
--- a/target/ppc/power8_pmu.c
+++ b/target/ppc/power8_pmu.c
@@ -31,10 +31,63 @@ static void update_PMC_PM_CYC(CPUPPCState *env, int sprn,
     env->spr[sprn] += time_delta;
 }
 
+static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
+                                        uint64_t time_delta)
+{
+    uint8_t event;
+
+    switch (sprn) {
+    case SPR_POWER_PMC1:
+        event = MMCR1_PMC1SEL & env->spr[SPR_POWER_MMCR1];
+        event = event >> MMCR1_PMC1SEL_SHIFT;
+        break;
+    case SPR_POWER_PMC2:
+        event = MMCR1_PMC2SEL & env->spr[SPR_POWER_MMCR1];
+        event = event >> MMCR1_PMC2SEL_SHIFT;
+        break;
+    case SPR_POWER_PMC3:
+        event = MMCR1_PMC3SEL & env->spr[SPR_POWER_MMCR1];
+        event = event >> MMCR1_PMC3SEL_SHIFT;
+        break;
+    case SPR_POWER_PMC4:
+        event = MMCR1_PMC4SEL & env->spr[SPR_POWER_MMCR1];
+        break;
+    default:
+        return;
+    }
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


