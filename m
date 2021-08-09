Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6573E46A3
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:29:08 +0200 (CEST)
Received: from localhost ([::1]:36898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5L1-0002O8-Ld
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD54K-0003fV-EO; Mon, 09 Aug 2021 09:11:52 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:37568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD54I-0001hw-Kq; Mon, 09 Aug 2021 09:11:52 -0400
Received: by mail-qk1-x736.google.com with SMTP id 14so18257467qkc.4;
 Mon, 09 Aug 2021 06:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Oaekdod2OFH4OGSZhi98rTsC0XQFLN3Su5xNF5MeyXY=;
 b=NehosBRum5EAF9ePwQi7xGfFxpnBEH0On5afZ9CL1qJzuRL/xrDwkLWBiusavBkm3Y
 mD4xhfMJ/R7E8ZeSvrcJgribZbkNhwiccdzzcg93M61pQFsdYcmVWTZMVcCQEvEiYTgI
 hWu0McKENC7ugwlOWVvFyo2A5NCOyHUQ9PZiG4IBgnYtXJEwMIW59asckamOW5TULGl6
 apqrS2y31SMH1PFhnxAMPD73F/u4QZxgAosgFOW7rhVQ1snsvF4Y12k0o4He00pBBzdg
 b3d288u02Clr0PGEKUEtws6N0tXP7jz846XKxky53xDnOQ8jOm+gjlXuXYF0bcsao1s7
 VqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Oaekdod2OFH4OGSZhi98rTsC0XQFLN3Su5xNF5MeyXY=;
 b=XNFuA8Wqoz6Tx+33CKKbqZuwjKQ4xAH6KieaSTUaJJtN0jxd0PVGtRtAk+yrf+Q7+f
 EGWJ9bJ+YeUBI35Vbcw1Urv1ttrpBEH1GKk21DIxSfrpRkXGfjmTMEJ46cvM/9jnph/X
 6Z5Py01soTt1vX2vWqzZPgCNcxTfdOjaxlPi/I0PwKsClhGfwnZhKzhW/1VaplVPdeVb
 9SHtVN+QzLc++Bz/MWDx14zBXicZRacji/mMPdMsXGW1YJ5B/V8Cl26jLxo7ORNx8ae6
 82nd/1VzEfqojeg852WFSvgczGrGtALrJOE7C+D5HhDhhkJVkan24n8hpvOwwg46P8Mi
 t3Pw==
X-Gm-Message-State: AOAM531aOpSSozguyEvS+Acf2uGqbp6Cv3J320//PlHtKSr9SdUqTZg8
 bXz9FarihbdttVNTHXo5dK2URqRo1Lthxg==
X-Google-Smtp-Source: ABdhPJzgGux6Ju3MQm+4Cx/ceeN5qr//DfANAqiUamE59WF8EKaWgAzc1KJM6v04Vl8+1tfJy7JMNQ==
X-Received: by 2002:a37:9f0b:: with SMTP id i11mr1312939qke.458.1628514709338; 
 Mon, 09 Aug 2021 06:11:49 -0700 (PDT)
Received: from rekt.ibmuc.com ([191.19.172.190])
 by smtp.gmail.com with ESMTPSA id f3sm6757435qti.65.2021.08.09.06.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 06:11:49 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/19] target/ppc/pmu_book3s_helper.c: add PMC14/PMC56 counter
 freeze bits
Date: Mon,  9 Aug 2021 10:10:55 -0300
Message-Id: <20210809131057.1694145-18-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809131057.1694145-1-danielhb413@gmail.com>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x736.google.com
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

We're missing two counter freeze bits that are used to further control
how the PMCs behaves: MMCR0_FC14 and MMCR0_FC56. These bits can frozen
PMCs separately: MMCR0_FC14 freezes PMCs 1 to 4 and MMCR0_FC56 freezes
PMCs 5 and 6.

The EBB powerpc kernel test 'pmc56_overflow' exercises this logic. Let's
add it in the PMU logic to make this test pass.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h               |  2 ++
 target/ppc/pmu_book3s_helper.c | 23 +++++++++++++++++------
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 1aa1fd42af..204f0d58ee 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -352,6 +352,8 @@ typedef struct ppc_v3_pate_t {
 #define MMCR0_PMCC  PPC_BITMASK(44, 45) /* PMC Control */
 #define MMCR0_PMC1CE PPC_BIT(48)
 #define MMCR0_PMCjCE PPC_BIT(49)
+#define MMCR0_FC14 PPC_BIT(58)
+#define MMCR0_FC56 PPC_BIT(59)
 
 #define MMCR1_PMC1SEL_SHIFT (63 - 39)
 #define MMCR1_PMC1SEL PPC_BITMASK(32, 39)
diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_helper.c
index 388263688b..ae7050cd62 100644
--- a/target/ppc/pmu_book3s_helper.c
+++ b/target/ppc/pmu_book3s_helper.c
@@ -115,14 +115,20 @@ static void update_programmable_PMC_reg(CPUPPCState *env, int sprn,
  */
 static void update_PMCs(CPUPPCState *env, uint64_t icount_delta)
 {
+    bool PMC14_running = !(env->spr[SPR_POWER_MMCR0] & MMCR0_FC14);
+    bool PMC56_running = !(env->spr[SPR_POWER_MMCR0] & MMCR0_FC56);
     int sprn;
 
-    for (sprn = SPR_POWER_PMC1; sprn < SPR_POWER_PMC5; sprn++) {
-        update_programmable_PMC_reg(env, sprn, icount_delta);
+    if (PMC14_running) {
+        for (sprn = SPR_POWER_PMC1; sprn < SPR_POWER_PMC5; sprn++) {
+            update_programmable_PMC_reg(env, sprn, icount_delta);
+        }
     }
 
-    update_PMC_PM_INST_CMPL(env, SPR_POWER_PMC5, icount_delta);
-    update_PMC_PM_CYC(env, SPR_POWER_PMC6, icount_delta);
+    if (PMC56_running) {
+        update_PMC_PM_INST_CMPL(env, SPR_POWER_PMC5, icount_delta);
+        update_PMC_PM_CYC(env, SPR_POWER_PMC6, icount_delta);
+    }
 }
 
 static int64_t get_INST_CMPL_timeout(CPUPPCState *env, int sprn)
@@ -159,16 +165,21 @@ static int64_t get_CYC_timeout(CPUPPCState *env, int sprn)
 
 static bool pmc_counter_negative_enabled(CPUPPCState *env, int sprn)
 {
+    bool PMC14_running = !(env->spr[SPR_POWER_MMCR0] & MMCR0_FC14);
+    bool PMC56_running = !(env->spr[SPR_POWER_MMCR0] & MMCR0_FC56);
+
     switch (sprn) {
     case SPR_POWER_PMC1:
-        return env->spr[SPR_POWER_MMCR0] & MMCR0_PMC1CE;
+        return env->spr[SPR_POWER_MMCR0] & MMCR0_PMC1CE && PMC14_running;
 
     case SPR_POWER_PMC2:
     case SPR_POWER_PMC3:
     case SPR_POWER_PMC4:
+        return env->spr[SPR_POWER_MMCR0] & MMCR0_PMCjCE && PMC14_running;
+
     case SPR_POWER_PMC5:
     case SPR_POWER_PMC6:
-        return env->spr[SPR_POWER_MMCR0] & MMCR0_PMCjCE;
+        return env->spr[SPR_POWER_MMCR0] & MMCR0_PMCjCE && PMC56_running;
 
     default:
         break;
-- 
2.31.1


