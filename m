Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98C54C4221
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 11:18:58 +0100 (CET)
Received: from localhost ([::1]:33440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNXge-0004m3-4F
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 05:18:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNXZv-0006oo-Go; Fri, 25 Feb 2022 05:12:02 -0500
Received: from [2607:f8b0:4864:20::22f] (port=44662
 helo=mail-oi1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNXZt-0004T9-FA; Fri, 25 Feb 2022 05:11:59 -0500
Received: by mail-oi1-x22f.google.com with SMTP id j24so6781778oii.11;
 Fri, 25 Feb 2022 02:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uLHzlk3JOcyDjRNXMcavJK6VwwZ0cijbDVZOWYr50mc=;
 b=lYhU3fAALRjgcSdmw7BU4GqwwNCnED48VCW0YJg7AYp0gr2EJstHxEhed6PuB4Cn4e
 OugN6pyIVDuJ+gQOOp0zX6Sc67Z5Dpf8v7+dKnBegOH0saN2IFbmcqh8Rm8hJBSCckWC
 T8KS08X7awOvHtDDju8w8jVDNp2Vc0L2e4pDIrf1sYseoCx1ZG+Zx3ma4sBBwdZxZSFU
 /AV2bkKpgB8F9EmQe8S//ITOxBn1Py54JBJo1TSssy4bvFJSpYLtixJVALvF9slSHDE0
 aRdcaGz6mKZ9BXSpMFS4IQhFO582fBYjiYpJtbIUnpiF0oh1oFo01z3BrFLo/J3Y1/Uq
 sy1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uLHzlk3JOcyDjRNXMcavJK6VwwZ0cijbDVZOWYr50mc=;
 b=joWhJGhirkdTw+3h1lwD6ExWGT87/fzzgmgiMq64xqYtaPnH8Ntj92sud/aLiozkWx
 MXeYBKcorWr2Ghy633/pp027+nLWKNtHWVjAH6fR4xAiopPns5RK2/KDp8dRfRzESjsz
 UIvptL67j9y/ymPH5Hk1ewC2XGKDWWlc6xEz2cMySE7xHv/ldQ9R0pE4+Q/wc8tyrVFm
 wgnqsRr98WXMQOP70m/azovmrbe5/CcDVFfu3o56mm4lp5eWr1GN/NJLBGTgc7EZrfoX
 9a+Y+4hqbv1i1DqowwP8mX2RBpQXY2GkdpzonJKhTA5GfI6OBezMiDQmRI6heBd0m2pv
 c1Vg==
X-Gm-Message-State: AOAM5308i5/NGXtmHEJbDs+2naXXTnbuFWxm1zcLgwXKuF9oHrCR1G5O
 FT+paGDesg7PdeeZ+gzJ2mQU2Jgv2zc=
X-Google-Smtp-Source: ABdhPJxmR++TvpLtM6OpKS3JPU6Grr0qqTSw5yjfTaXIlHKII6v/7yKYBPDxeFMWqWeN5o2ME4SYuQ==
X-Received: by 2002:aca:2815:0:b0:2d4:a9fa:def1 with SMTP id
 21-20020aca2815000000b002d4a9fadef1mr1110601oix.220.1645783915483; 
 Fri, 25 Feb 2022 02:11:55 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a4ae6c8000000b0031c2e6dd492sm847823oot.28.2022.02.25.02.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 02:11:55 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v14 1/4] target/ppc: make power8-pmu.c CONFIG_TCG only
Date: Fri, 25 Feb 2022 07:11:37 -0300
Message-Id: <20220225101140.1054160-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225101140.1054160-1-danielhb413@gmail.com>
References: <20220225101140.1054160-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an exclusive TCG helper. Gating it with CONFIG_TCG and changing
meson.build accordingly will prevent problems --disable-tcg and
--disable-linux-user later on.

We're also changing the uses of !kvm_enabled() to tcg_enabled() to avoid
adding "defined(CONFIG_TCG)" ifdefs, since tcg_enabled() will be
defaulted to false with --disable-tcg and the block will always be
skipped.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu_init.c   | 16 +++++++---------
 target/ppc/machine.c    |  6 +++++-
 target/ppc/meson.build  |  2 +-
 target/ppc/power8-pmu.h |  4 ++--
 4 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 61d36b11a0..544e052290 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -5698,12 +5698,10 @@ static void register_power9_mmu_sprs(CPUPPCState *env)
  */
 static void init_tcg_pmu_power8(CPUPPCState *env)
 {
-#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
     /* Init PMU overflow timers */
-    if (!kvm_enabled()) {
+    if (tcg_enabled()) {
         cpu_ppc_pmu_init(env);
     }
-#endif
 }
 
 static void init_proc_book3s_common(CPUPPCState *env)
@@ -7167,14 +7165,14 @@ static void ppc_cpu_reset(DeviceState *dev)
 
 #if !defined(CONFIG_USER_ONLY)
     env->nip = env->hreset_vector | env->excp_prefix;
-#if defined(CONFIG_TCG)
-    if (env->mmu_model != POWERPC_MMU_REAL) {
-        ppc_tlb_invalidate_all(env);
+
+    if (tcg_enabled()) {
+        if (env->mmu_model != POWERPC_MMU_REAL) {
+            ppc_tlb_invalidate_all(env);
+        }
+        pmu_update_summaries(env);
     }
-#endif /* CONFIG_TCG */
 #endif
-
-    pmu_update_summaries(env);
     hreg_compute_hflags(env);
     env->reserve_addr = (target_ulong)-1ULL;
     /* Be sure no exception or interrupt is pending */
diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index 1b63146ed1..e673944597 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -2,6 +2,7 @@
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "sysemu/kvm.h"
+#include "sysemu/tcg.h"
 #include "helper_regs.h"
 #include "mmu-hash64.h"
 #include "migration/cpu.h"
@@ -20,7 +21,10 @@ static void post_load_update_msr(CPUPPCState *env)
      */
     env->msr ^= env->msr_mask & ~((1ULL << MSR_TGPR) | MSR_HVB);
     ppc_store_msr(env, msr);
-    pmu_update_summaries(env);
+
+    if (tcg_enabled()) {
+        pmu_update_summaries(env);
+    }
 }
 
 static int get_avr(QEMUFile *f, void *pv, size_t size,
diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index a49a8911e0..79beaff147 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -16,6 +16,7 @@ ppc_ss.add(when: 'CONFIG_TCG', if_true: files(
   'misc_helper.c',
   'timebase_helper.c',
   'translate.c',
+  'power8-pmu.c',
 ))
 
 ppc_ss.add(libdecnumber)
@@ -51,7 +52,6 @@ ppc_softmmu_ss.add(when: 'TARGET_PPC64', if_true: files(
   'mmu-book3s-v3.c',
   'mmu-hash64.c',
   'mmu-radix64.c',
-  'power8-pmu.c',
 ))
 
 target_arch += {'ppc': ppc_ss}
diff --git a/target/ppc/power8-pmu.h b/target/ppc/power8-pmu.h
index a839199561..256d90f523 100644
--- a/target/ppc/power8-pmu.h
+++ b/target/ppc/power8-pmu.h
@@ -13,11 +13,11 @@
 #ifndef POWER8_PMU
 #define POWER8_PMU
 
-void cpu_ppc_pmu_init(CPUPPCState *env);
-
 #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
+void cpu_ppc_pmu_init(CPUPPCState *env);
 void pmu_update_summaries(CPUPPCState *env);
 #else
+static inline void cpu_ppc_pmu_init(CPUPPCState *env) { }
 static inline void pmu_update_summaries(CPUPPCState *env) { }
 #endif
 
-- 
2.35.1


