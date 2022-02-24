Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD03A4C36DA
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 21:23:54 +0100 (CET)
Received: from localhost ([::1]:36246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNKeX-0005fE-TH
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 15:23:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNKa4-00085k-Dw; Thu, 24 Feb 2022 15:19:16 -0500
Received: from [2607:f8b0:4864:20::230] (port=38693
 helo=mail-oi1-x230.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNKa2-000305-Ey; Thu, 24 Feb 2022 15:19:16 -0500
Received: by mail-oi1-x230.google.com with SMTP id y7so4744893oih.5;
 Thu, 24 Feb 2022 12:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y522670yPReb9dPlaPl6X8HKDCE4uL62kHfCdRfbumE=;
 b=Im6oWDOQ6Vg3D+XP2JntGeKUiw9f9QyXUq8/2uyr6mSctt8Pxfet7xV+AZFGEEd1Za
 fwI1hNdawCgqQc3Ts29W3HmQ49pzdYoQ0iXBKcHmcYeOzZF4IxQLARBmOQZ+A47n8ydq
 aWv7Q4P8QZGLeGlQi61JWOyA/M2QthFqyRtHGJqaz99hTIqYzbr+wRmGsa5bLE2KADT4
 dXnfH9A2v72kiDdWuRG+PhRAaUvq2xF3iTI/RDd4CBzWkt0CV9yay8PBI+js22EJXrg3
 kEVmtxcIedX22KE6hyD3ZCPR3hfEMUSRQdwRgyEGAZqdxZhJaFUJgiSoJ1uvqCcg4s68
 uogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y522670yPReb9dPlaPl6X8HKDCE4uL62kHfCdRfbumE=;
 b=bW/Mgsv7P1/KxmIOVLS0G7C0cvSYx1qgvhMHaHqDG9pWtdgDYtOFFZy9ETlYs6lrOm
 +AX6g3OfXGy1zP7cVP9ccXfGVmtwTAbv83gZ9/cy3dd5JOQ8vaJhv+J4R5XY5/HjbEnB
 MPtFlYwnOJqTAKc8W6TL8ZNAvh1v7A8t653/29c++Gs2x5Pb1Mc8aEaEpDyvU5VWsIp2
 SF/cEArhhGl55Wijzyq+uO9LlQeuZ9ycBGQvouNjAEr2oGDtxbZN8r4RQstShVMaDa+4
 QuVgNZozrNwthTReFWsxb94XjuMpZxBxIubOdQHZiTBxK8hxkAJxKgQMYE/qP2VvNxsk
 H/NA==
X-Gm-Message-State: AOAM532qsaGFpKqFDqyk/bT4xBfUvtuAhl2dRHvU2ImXF/tHvZyyUJSL
 AJ4nHFkoEs9xCwR5Omgps9JQxFUCPyI=
X-Google-Smtp-Source: ABdhPJzJO40rz+U0iWe+WjUj0DH62txLMO54vnXx4P4bZkRKvfmYDwf5H2ZJ/L74/W2Fktosqa3yrA==
X-Received: by 2002:a05:6808:1396:b0:2d5:38a8:d5b2 with SMTP id
 c22-20020a056808139600b002d538a8d5b2mr8183589oiw.243.1645733952390; 
 Thu, 24 Feb 2022 12:19:12 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 bh42-20020a056808182a00b002d538a8d5afsm305775oib.7.2022.02.24.12.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 12:19:12 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 1/4] target/ppc: make power8-pmu.c CONFIG_TCG only
Date: Thu, 24 Feb 2022 17:18:57 -0300
Message-Id: <20220224201900.1037465-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220224201900.1037465-1-danielhb413@gmail.com>
References: <20220224201900.1037465-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::230
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x230.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
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


