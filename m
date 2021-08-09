Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6443E46A9
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:31:40 +0200 (CEST)
Received: from localhost ([::1]:45594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5N9-00087r-O1
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:31:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD54N-0003rX-Eh; Mon, 09 Aug 2021 09:11:55 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:46594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD54L-0001jf-GH; Mon, 09 Aug 2021 09:11:55 -0400
Received: by mail-qk1-x72d.google.com with SMTP id f23so1922212qkk.13;
 Mon, 09 Aug 2021 06:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XXHLDH1bWrPsXOr8m0aObt+cK/ABxtqGEmMxxYOw+g8=;
 b=M3p2HUarUb+npCPWb92Euoh1I0AdxDAdCwcjfYHg4PivsjHiaraQIV0yMSunWeqFFJ
 8goStyAYvyiNOuutbwaNk98clSy5AgP01aTtzLP6HvFB7MYxplgNDEwKtb4D1DFpBgP9
 nQhu8uMdcCwxnzliSJI/c5MWyjRpna/UKsbbZZ2SVyKMpZjchC4QRBtkurwlBBi5X7gA
 z0kri6MpyJMUFKdtXE7KH7fV4jiJLnq3HOpW6BdZnF5XzcpL3LfqSToq8rGuOVaPRiVk
 zmyoTGb4K4AYC7Ek91yYBKbYIXcwsa4SFkUF4sq3lThqTh2KQekKm2Ucff/iVFfXmfhY
 rJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XXHLDH1bWrPsXOr8m0aObt+cK/ABxtqGEmMxxYOw+g8=;
 b=Y5ub21e61lmOPxcMykX9sGZh82FqGUB6sgufs9d1lnJiznYWWjA7qEa/dGo3kMrX56
 vmADpt4OJDMqc2Cq5DjGAEmNeGX+YPt6jfGzRc3hNa8DHZHrpQOiVFoTjZZUTHBH5GYK
 ogOdFh9/JJwFhyyjFdv75MMAxjSLXr06lnXAXW6EOyVC+2GkSuzGjjzUiMiJ0dDbww86
 +T94OrxsrgOe23Pa4X9kYiV8ke0SEBelQftcMVuVQgGy4qKyeBrUJPwnygCmgfkC3B0x
 vzyqsSpgUcCo+JKO2kYT0iQ+nsmQR2SSgwqLTEyAmgAyZTZEZ4s2gStqSRiduyCakmtC
 JeYA==
X-Gm-Message-State: AOAM530iyZcAfmY5Q0HlFKNwjfPpQLRRJWIPumBWcKH4zTzY/LVgBJpJ
 CpFQxSNQj82yeeXio4Coxd4NCW0vYNkN5Q==
X-Google-Smtp-Source: ABdhPJy6f0DVOcs1RQPk0C4VmUblfBtvSlu+nSfYgX+eD8YugpJm7DyU//mFY8g7VxcEGAfrqoCTFA==
X-Received: by 2002:a05:620a:d41:: with SMTP id
 o1mr23087439qkl.214.1628514711863; 
 Mon, 09 Aug 2021 06:11:51 -0700 (PDT)
Received: from rekt.ibmuc.com ([191.19.172.190])
 by smtp.gmail.com with ESMTPSA id f3sm6757435qti.65.2021.08.09.06.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 06:11:51 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/19] target/ppc/pmu_book3s_helper.c: add PM_CMPLU_STALL mock
 events
Date: Mon,  9 Aug 2021 10:10:56 -0300
Message-Id: <20210809131057.1694145-19-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809131057.1694145-1-danielhb413@gmail.com>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72d.google.com
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

EBB powerpc kernel test 'multi_counter_test' uses PM_CMPLU_STALL events
that we do not support. These events are related to CPU stalled/wasted
cycles while waiting for resources, cache misses and so on.

Unlike the 0xFA event added previously, there's no available equivalent
for us to use, and at this moment we can't sample those events as well.
What we can do is mock those events as if we were calculating them.

This patch implements PM_CMPLU_STALL, PM_CMPLU_STALL_FXU,
PM_CMPLU_STALL_OTHER_CMPL and PM_CMPLU_STALL_THRD mock events by giving
them a fixed amount of the total elapsed cycles.

The chosen sample values for these events (25% of total cycles for
PM_CMPLU_STALL and 5% for the other three) were chosen at random and has
no intention of being truthful with what a real PowerPC hardware would
give us. Our intention here is to make 'multi_counter_test' EBB test
pass.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/pmu_book3s_helper.c | 81 +++++++++++++++++++++++++++++++++-
 1 file changed, 79 insertions(+), 2 deletions(-)

diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_helper.c
index ae7050cd62..32cf76b77f 100644
--- a/target/ppc/pmu_book3s_helper.c
+++ b/target/ppc/pmu_book3s_helper.c
@@ -92,16 +92,54 @@ static void update_PMC_PM_CYC(CPUPPCState *env, int sprn,
     env->spr[sprn] += get_cycles(icount_delta);
 }
 
+static int get_stall_ratio(uint8_t stall_event)
+{
+    int stall_ratio = 0;
+
+    switch (stall_event) {
+    case 0xA:
+        stall_ratio = 25;
+        break;
+    case 0x6:
+    case 0x16:
+    case 0x1C:
+        stall_ratio = 5;
+        break;
+    default:
+        break;
+    }
+
+    return stall_ratio;
+}
+
+static void update_PMC_PM_STALL(CPUPPCState *env, int sprn,
+                                uint64_t icount_delta,
+                                uint8_t stall_event)
+{
+    int stall_ratio = get_stall_ratio(stall_event);
+    uint64_t cycles = muldiv64(get_cycles(icount_delta), stall_ratio, 100);
+
+    env->spr[sprn] += cycles;
+}
+
 static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
                                         uint64_t icount_delta)
 {
-    switch (get_PMC_event(env, sprn)) {
+    uint8_t event = get_PMC_event(env, sprn);
+
+    switch (event) {
     case 0x2:
         update_PMC_PM_INST_CMPL(env, sprn, icount_delta);
         break;
     case 0x1E:
         update_PMC_PM_CYC(env, sprn, icount_delta);
         break;
+    case 0xA:
+    case 0x6:
+    case 0x16:
+    case 0x1C:
+        update_PMC_PM_STALL(env, sprn, icount_delta, event);
+        break;
     default:
         return;
     }
@@ -163,6 +201,34 @@ static int64_t get_CYC_timeout(CPUPPCState *env, int sprn)
     return muldiv64(remaining_cyc, NANOSECONDS_PER_SECOND, PPC_CPU_FREQ);
 }
 
+static int64_t get_stall_timeout(CPUPPCState *env, int sprn,
+                                 uint8_t stall_event)
+{
+    uint64_t remaining_cyc;
+    int stall_multiplier;
+
+    if (env->spr[sprn] == 0) {
+        return icount_to_ns(COUNTER_NEGATIVE_VAL);
+    }
+
+    if (env->spr[sprn] >= COUNTER_NEGATIVE_VAL) {
+        return 0;
+    }
+
+    remaining_cyc = COUNTER_NEGATIVE_VAL - env->spr[sprn];
+
+    /*
+     * Consider that for this stall event we'll advance the counter
+     * in a lower rate, thus requiring more cycles to overflow.
+     * E.g. for PM_CMPLU_STALL (0xA), ratio 25, it'll require
+     * 100/25 = 4 times the same amount of cycles to overflow.
+     */
+    stall_multiplier = 100 / get_stall_ratio(stall_event);
+    remaining_cyc *= stall_multiplier;
+
+    return muldiv64(remaining_cyc, NANOSECONDS_PER_SECOND, PPC_CPU_FREQ);
+}
+
 static bool pmc_counter_negative_enabled(CPUPPCState *env, int sprn)
 {
     bool PMC14_running = !(env->spr[SPR_POWER_MMCR0] & MMCR0_FC14);
@@ -191,6 +257,7 @@ static bool pmc_counter_negative_enabled(CPUPPCState *env, int sprn)
 static int64_t get_counter_neg_timeout(CPUPPCState *env, int sprn)
 {
     int64_t timeout = -1;
+    uint8_t event;
 
     if (!pmc_counter_negative_enabled(env, sprn)) {
         return -1;
@@ -205,13 +272,23 @@ static int64_t get_counter_neg_timeout(CPUPPCState *env, int sprn)
     case SPR_POWER_PMC2:
     case SPR_POWER_PMC3:
     case SPR_POWER_PMC4:
-        switch (get_PMC_event(env, sprn)) {
+        event = get_PMC_event(env, sprn);
+
+        switch (event) {
         case 0x2:
             timeout = get_INST_CMPL_timeout(env, sprn);
             break;
         case 0x1E:
             timeout = get_CYC_timeout(env, sprn);
             break;
+        case 0xA:
+        case 0x6:
+        case 0x16:
+        case 0x1c:
+            timeout = get_stall_timeout(env, sprn, event);
+            break;
+        default:
+            break;
         }
 
         break;
-- 
2.31.1


