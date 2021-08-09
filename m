Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D04F73E4650
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:14:56 +0200 (CEST)
Received: from localhost ([::1]:53352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD57H-0008WL-Rv
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD53r-0002a5-Au; Mon, 09 Aug 2021 09:11:23 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:37555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD53p-0001HO-C5; Mon, 09 Aug 2021 09:11:22 -0400
Received: by mail-qk1-x72c.google.com with SMTP id 14so18255888qkc.4;
 Mon, 09 Aug 2021 06:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oBjeY+h4DDKvlmCeSGqHWTu1e6e6AXqfNuMu/Y5LzwE=;
 b=WAn3l5tF6spTfz/A258biusIyVn9WaAkKa07erG+CjyrNDzyZH6QQSBk5SJhDUqrMw
 Ddgig/ztLMa0TbS0Tj/kqg58cxUbNkDyp01FXP7UviwinQ3YBXwdMpBSIvJAi8eIynKf
 TsriHZqdGZLrpTBlQUVm6ZHzjX1aOo9LmlxBJw0MrvLwOxJkUc2rD7Mtx2maimvJVKUd
 hlnqW6dC8/QLSs1fg6TT+W66nY4fe3wHUoBiVMHvH0Ixl5BRA4GPKLpJahxvsEW8kwGp
 OaKmSJ2n4cdlulMxByOns6IpPUJX6beJd2TItrcPe3dCrXKN5pUick3VX4kbNLTQpuIj
 Ko7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oBjeY+h4DDKvlmCeSGqHWTu1e6e6AXqfNuMu/Y5LzwE=;
 b=EB+9CvHECsGE3/DytwmceCZ49lqWzsaOG+n/pRizTVXV4CHZZL+HAkcYiBcBJJ6Dqa
 zc/ehHo1Qiy450KQw+rPcl0Uk725+zpkfn/KKM6sySitWVIuKZJLQtN4Kh2UK3LmGWjD
 LcCqOtjJj5m05o63SGqWBaC3uRRj3lPOEbR7bxLnrobAcFmFQ+3ZTxmpnKTLhEOdJzfC
 QP7JbU8Ic9OVzaYEyDgHMzf83lIZuEpGVoVXD6ePyXm2yXs4S/0fI9um+4quSFFF+Xyz
 HyhURIf52l1K1GRzR59fFltBmyCqAsMjmMCV680JRyAE5Rr5XyOicGPJcSljCW8MVFgr
 eA4g==
X-Gm-Message-State: AOAM5314GTVVd1sn59LX38z3TUfpO36rM0mHsn2nqFEO33eUOyh5Np3r
 sDJI3G199DlfQyXJEzugq72jXrMmQsC4cg==
X-Google-Smtp-Source: ABdhPJw31pNa5T7/Vu0m4Qjq65HGID7FEH2hqd0PyxxsHThB4jyw9a7YMRfpqbARBY70CDfndAuZBg==
X-Received: by 2002:ae9:f81a:: with SMTP id x26mr14206614qkh.196.1628514678951; 
 Mon, 09 Aug 2021 06:11:18 -0700 (PDT)
Received: from rekt.ibmuc.com ([191.19.172.190])
 by smtp.gmail.com with ESMTPSA id f3sm6757435qti.65.2021.08.09.06.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 06:11:18 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/19] target/ppc/pmu_book3s_helper.c: eliminate code
 repetition
Date: Mon,  9 Aug 2021 10:10:43 -0300
Message-Id: <20210809131057.1694145-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809131057.1694145-1-danielhb413@gmail.com>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72c.google.com
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

We don't need a base_icount value in CPUPPCState for each PMC. All the
calculation done after freeze will use the same base start value. Use a
single 'pmu_base_icount' attribute that can be use to all PMCs.

Likewise, the freeze count operations are going to be done for all
available PMCs, so eliminate both freeze_PMC5_value() and
freeze_PMC6_value() and use the new update_PMCs_on_freeze() that will
update all PMCs.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h               |  8 +++++---
 target/ppc/pmu_book3s_helper.c | 33 +++++++++++++--------------------
 2 files changed, 18 insertions(+), 23 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 229abfe7ee..8cea8f2aca 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1176,9 +1176,11 @@ struct CPUPPCState {
     uint64_t tm_dscr;
     uint64_t tm_tar;
 
-    /* PMU registers icount state */
-    uint64_t pmc5_base_icount;
-    uint64_t pmc6_base_icount;
+    /*
+     * PMU icount base value used by the PMU to calculate
+     * instructions and cycles.
+     */
+    uint64_t pmu_base_icount;
 };
 
 #define SET_FIT_PERIOD(a_, b_, c_, d_)          \
diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_helper.c
index fe16fcfce0..0994531f65 100644
--- a/target/ppc/pmu_book3s_helper.c
+++ b/target/ppc/pmu_book3s_helper.c
@@ -28,22 +28,19 @@ static uint64_t get_cycles(uint64_t insns)
     return insns * 4;
 }
 
-/* PMC5 always count instructions */
-static void freeze_PMC5_value(CPUPPCState *env)
-{
-    uint64_t insns = get_insns() - env->pmc5_base_icount;
-
-    env->spr[SPR_POWER_PMC5] += insns;
-    env->pmc5_base_icount += insns;
-}
-
-/* PMC6 always count cycles */
-static void freeze_PMC6_value(CPUPPCState *env)
+/*
+ * Set all PMCs values after a PMU freeze via MMCR0_FC.
+ *
+ * There is no need to update the base icount of each PMC since
+ * the PMU is not running.
+ */
+static void update_PMCs_on_freeze(CPUPPCState *env)
 {
-    uint64_t insns = get_insns() - env->pmc6_base_icount;
+    uint64_t curr_icount = get_insns();
 
-    env->spr[SPR_POWER_PMC6] += get_cycles(insns);
-    env->pmc6_base_icount += insns;
+    env->spr[SPR_POWER_PMC5] += curr_icount - env->pmu_base_icount;
+    env->spr[SPR_POWER_PMC6] += get_cycles(curr_icount -
+                                           env->pmu_base_icount);
 }
 
 void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
@@ -64,13 +61,9 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
      */
     if (curr_FC != new_FC) {
         if (!curr_FC) {
-            freeze_PMC5_value(env);
-            freeze_PMC6_value(env);
+            update_PMCs_on_freeze(env);
         } else {
-            uint64_t curr_icount = get_insns();
-
-            env->pmc5_base_icount = curr_icount;
-            env->pmc6_base_icount = curr_icount;
+            env->pmu_base_icount = get_insns();
         }
     }
 
-- 
2.31.1


