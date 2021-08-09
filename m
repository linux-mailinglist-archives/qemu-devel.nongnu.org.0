Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE8F3E46A6
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:30:18 +0200 (CEST)
Received: from localhost ([::1]:42320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5Ly-0005xW-ER
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:30:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD54F-0003Nn-Ra; Mon, 09 Aug 2021 09:11:47 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:34314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD54D-0001em-UU; Mon, 09 Aug 2021 09:11:47 -0400
Received: by mail-qk1-x730.google.com with SMTP id w197so16908272qkb.1;
 Mon, 09 Aug 2021 06:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=foPHQPIytUhaSntdLdjzsfKrNjlfdNtZqt9i9UGULAo=;
 b=ahv0HuKsGEtKEolHxb+jBy6NnfXqPSQwY01T4PCtltmrQKDIV7NKzP+H8VYibQfNKM
 8Hq6rxjk0PmwCrVjcEIB9xy0ee5FhmHRx4awFbSHkaCIdJBcwrxzc7Ten80RkrfK8MHZ
 0Z7RvP02dVirYCCsW60aN8Z+Bzz9mBhrSeKzJbwgCKaL2la1tEC1pYOeRqV6lbNXHcc4
 wBZjKEUb97UOTPfoxbM95euPUI4heirtP90WOhENFXH4CQFECkbydh+OWftCxK7bj36C
 +E/TODVXfz1nTJhVEkKPbSbV0vXnATcLjuQDw2HVoya7FHWsXH0J/FQCYVNCrkoX9STQ
 U+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=foPHQPIytUhaSntdLdjzsfKrNjlfdNtZqt9i9UGULAo=;
 b=hphXtQAq+nP9LEeZZEOl98MaSRl6sWNIR4u9YKVelw/HExRnbn3v8abOEKCLRxdINp
 4r5EoOkf+HUrKF5DoslyeE8YNFu4/udxQV2MTV2MEk2DJXIZxV4nY8whHwpHglDokHHS
 oIOTpB2qhAtXak9pgnc6Q6dC6QMdoqLdXirOoKTtmiB6L+BJrFFWYk6dQPsek273bp8O
 ziapNj/0n7+TTblcLBoj2vcZKJ2slHIoAEsDqBHWok4vV/I0vS1C/sF1D2PKSPtVfvhH
 wsbvu9mWup0Lf/RG9DHFZboNKRuESyY4yr0OTfNSQlBoCD6Ll7+aUvuoCTsciKaFyxkY
 +1sw==
X-Gm-Message-State: AOAM532pA65fiYTbvPiizmTcXknOnF6X3vwQvNyDIRi0kQ7E/chURdyy
 SUuU+1Qc97JDO/uggUd/akRBnvs7rARG/A==
X-Google-Smtp-Source: ABdhPJzZofbSd2unhsA/Q0igsbsyTpmsPv7xjpx8e/B77Ttf2lMNbiF7o2ubNz19VN25WYI3Fa06Aw==
X-Received: by 2002:ae9:e30c:: with SMTP id v12mr14321534qkf.206.1628514704341; 
 Mon, 09 Aug 2021 06:11:44 -0700 (PDT)
Received: from rekt.ibmuc.com ([191.19.172.190])
 by smtp.gmail.com with ESMTPSA id f3sm6757435qti.65.2021.08.09.06.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 06:11:44 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/19] target/ppc/pmu_book3s_helper: enable counter negative
 for all PMCs
Date: Mon,  9 Aug 2021 10:10:53 -0300
Message-Id: <20210809131057.1694145-16-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809131057.1694145-1-danielhb413@gmail.com>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x730.google.com
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
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All performance monitor counters can trigger a counter negative
condition if the proper MMCR0 bits are set. This patch does that by
doing the following:

- pmc_counter_negative_enabled() will check whether a given PMC is
eligible to trigger the counter negative alert;

- get_counter_neg_timeout() will return the timeout for the counter
negative condition for a given PMC, or -1 if the PMC is not able to
trigger this alert;

- the existing counter_negative_cond_enabled() now must consider the
counter negative bit for PMCs 2-6, MMCR0_PMCjCE;

- set_PMU_excp_timer() will now search all existing PMCs for the
shortest counter negative timeout. The shortest timeout will be used to
set the PMC interrupt timer.

This change makes most EBB powepc kernel tests pass, validating that the
existing EBB logic is consistent. There are a few tests that aren't passing
due to additional PMU bits and perf events that aren't covered yet.
We'll attempt to cover some of those in the next patches.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h               |  1 +
 target/ppc/pmu_book3s_helper.c | 96 ++++++++++++++++++++++++++++++----
 2 files changed, 87 insertions(+), 10 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 5c81d459f4..1aa1fd42af 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -351,6 +351,7 @@ typedef struct ppc_v3_pate_t {
 #define MMCR0_FCECE PPC_BIT(38)         /* FC on Enabled Cond or Event */
 #define MMCR0_PMCC  PPC_BITMASK(44, 45) /* PMC Control */
 #define MMCR0_PMC1CE PPC_BIT(48)
+#define MMCR0_PMCjCE PPC_BIT(49)
 
 #define MMCR1_PMC1SEL_SHIFT (63 - 39)
 #define MMCR1_PMC1SEL PPC_BITMASK(32, 39)
diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_helper.c
index 7126e9b3d5..c5c5ab38c9 100644
--- a/target/ppc/pmu_book3s_helper.c
+++ b/target/ppc/pmu_book3s_helper.c
@@ -143,22 +143,98 @@ static int64_t get_CYC_timeout(CPUPPCState *env, int sprn)
     return muldiv64(remaining_cyc, NANOSECONDS_PER_SECOND, PPC_CPU_FREQ);
 }
 
-static void set_PMU_excp_timer(CPUPPCState *env)
+static bool pmc_counter_negative_enabled(CPUPPCState *env, int sprn)
 {
-    uint64_t timeout, now;
+    switch (sprn) {
+    case SPR_POWER_PMC1:
+        return env->spr[SPR_POWER_MMCR0] & MMCR0_PMC1CE;
 
-    if (!(env->spr[SPR_POWER_MMCR0] & MMCR0_PMC1CE)) {
-        return;
+    case SPR_POWER_PMC2:
+    case SPR_POWER_PMC3:
+    case SPR_POWER_PMC4:
+    case SPR_POWER_PMC5:
+    case SPR_POWER_PMC6:
+        return env->spr[SPR_POWER_MMCR0] & MMCR0_PMCjCE;
+
+    default:
+        break;
     }
 
-    switch (get_PMC_event(env, SPR_POWER_PMC1)) {
-    case 0x2:
-        timeout = get_INST_CMPL_timeout(env, SPR_POWER_PMC1);
+    return false;
+}
+
+static int64_t get_counter_neg_timeout(CPUPPCState *env, int sprn)
+{
+    int64_t timeout = -1;
+
+    if (!pmc_counter_negative_enabled(env, sprn)) {
+        return -1;
+    }
+
+    if (env->spr[sprn] >= COUNTER_NEGATIVE_VAL) {
+        return 0;
+    }
+
+    switch (sprn) {
+    case SPR_POWER_PMC1:
+    case SPR_POWER_PMC2:
+    case SPR_POWER_PMC3:
+    case SPR_POWER_PMC4:
+        switch (get_PMC_event(env, sprn)) {
+        case 0x2:
+            timeout = get_INST_CMPL_timeout(env, sprn);
+            break;
+        case 0x1E:
+            timeout = get_CYC_timeout(env, sprn);
+            break;
+        }
+
         break;
-    case 0x1e:
-        timeout = get_CYC_timeout(env, SPR_POWER_PMC1);
+    case SPR_POWER_PMC5:
+        timeout = get_INST_CMPL_timeout(env, sprn);
+        break;
+    case SPR_POWER_PMC6:
+        timeout = get_CYC_timeout(env, sprn);
         break;
     default:
+        break;
+    }
+
+    return timeout;
+}
+
+static void set_PMU_excp_timer(CPUPPCState *env)
+{
+    int64_t timeout = -1;
+    uint64_t now;
+    int i;
+
+    /*
+     * Scroll through all PMCs and check which one is closer to a
+     * counter negative timeout.
+     */
+    for (i = SPR_POWER_PMC1; i <= SPR_POWER_PMC6; i++) {
+        int64_t curr_timeout = get_counter_neg_timeout(env, i);
+
+        if (curr_timeout == -1) {
+            continue;
+        }
+
+        if (curr_timeout == 0) {
+            timeout = 0;
+            break;
+        }
+
+        if (timeout == -1 || timeout > curr_timeout) {
+            timeout = curr_timeout;
+        }
+    }
+
+    /*
+     * This can happen if counter negative conditions were enabled
+     * without any events to be sampled.
+     */
+    if (timeout == -1) {
         return;
     }
 
@@ -204,7 +280,7 @@ void cpu_ppc_pmu_timer_init(CPUPPCState *env)
 
 static bool counter_negative_cond_enabled(uint64_t mmcr0)
 {
-    return mmcr0 & MMCR0_PMC1CE;
+    return mmcr0 & (MMCR0_PMC1CE | MMCR0_PMCjCE);
 }
 
 void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
-- 
2.31.1


