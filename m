Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A18D4B8557
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:16:45 +0100 (CET)
Received: from localhost ([::1]:41966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKHMa-0004NV-K8
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:16:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nKHHN-0004Ix-Ji; Wed, 16 Feb 2022 05:11:21 -0500
Received: from [2607:f8b0:4864:20::c30] (port=33325
 helo=mail-oo1-xc30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nKHHL-00028d-Uo; Wed, 16 Feb 2022 05:11:21 -0500
Received: by mail-oo1-xc30.google.com with SMTP id
 f11-20020a4abb0b000000b002e9abf6bcbcso1950096oop.0; 
 Wed, 16 Feb 2022 02:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mEXvtJYPsYtAmg+LDvDMqH7OKii6TP66eGiUs1MUwOM=;
 b=g3545fzBk2cJ+LPps9mmLyJQB+Zrcq5agDkXg0sGWp7oiN8EAX86hgAD5bSuE4i/vi
 TFKYvABZ4G2KO0ssfvUtCt0OgNEIYbxanZ5y2LIVKz38rxDPVgfTPToY3n/HM6Ygl/18
 L9x7KS97mNUOojchplEPur5GkSJTmqMXMEI7Fe/HFGHK/T+Jwc+KG+Qi0/IVCfaDcmTt
 zMcAocT/zfNYlXayzpyjiGP/yxxt71NbPfmuMUS44SKQ50/FB6sFa0BZ8uSaKCKL6Gzi
 HWQC3rVtgOJwSlHt9+yqzOGK5l3LVMTwoNSeJW+xZMagAQ0B3pmHAYnyTj9iXoYC3dI2
 LDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mEXvtJYPsYtAmg+LDvDMqH7OKii6TP66eGiUs1MUwOM=;
 b=w7Rh5o3g1sTz+KCyPQUZzm7jG9c9hg/pTim4CxZ6zBxDI5R4pM+hLP4dl98yuvOiAN
 YlqizuUjwgFdMsbKM0atNi0mozavqOltq6MCxsds+Mjv1mbEnSExnOO16rIgCRLmp9FN
 6TsVfXJl0zZHpBYaUx/6YmWY8R+pOUFjIaUUeYMjsJ0GE46k7cqn0lhoTLmh/kPcFujz
 +npNXh0vL38NqQUYjIM4yE7QfgBe/Khfk+otIv/3P8ZEu1R5pKhlSmrlSMzmDEUus32x
 iZEHgSl/8Qp3Y3VXqcZO4vdyOPpRK+hzPxuiuETrGdvIUzGYBdwFliWOsJPv3wlXE5pK
 +tfQ==
X-Gm-Message-State: AOAM530M+INrY9m/5+VDvlPb7icE1ByqB5iZSgio5A2X9HCdjOJd4LBp
 X4DGeNfdrEVOKuLCFso9CJAJ8DyDw2I=
X-Google-Smtp-Source: ABdhPJybGxVJCrocV0br2Bg8Bd+hK7HbpE8aQLBbHNiwSl6tetGOg6QgdR0Ou9tuKk0ve0J0139Bwg==
X-Received: by 2002:a05:6870:a78d:b0:c4:7dc0:d78a with SMTP id
 x13-20020a056870a78d00b000c47dc0d78amr190657oao.349.1645006278243; 
 Wed, 16 Feb 2022 02:11:18 -0800 (PST)
Received: from rekt.ibmmodules.com ([2804:431:c7c6:367f:eb9c:8725:6b7f:76b3])
 by smtp.gmail.com with ESMTPSA id
 y1sm17612689oad.38.2022.02.16.02.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 02:11:18 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 2/5] target/ppc: make power8-pmu.c CONFIG_TCG only
Date: Wed, 16 Feb 2022 07:10:59 -0300
Message-Id: <20220216101102.179158-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216101102.179158-1-danielhb413@gmail.com>
References: <20220216101102.179158-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc30.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.904,
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an exclusive TCG helper. Gating it with CONFIG_TCG and changing
meson.build accordingly will prevent problems --disable-tcg and
--disable-linux-user later on.

Suggested-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu_init.c   | 5 ++---
 target/ppc/machine.c    | 2 ++
 target/ppc/meson.build  | 2 +-
 target/ppc/power8-pmu.h | 4 ++--
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index d97f718354..8fc644f8d6 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6379,7 +6379,7 @@ static void register_power9_mmu_sprs(CPUPPCState *env)
  */
 static void init_tcg_pmu_power8(CPUPPCState *env)
 {
-#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
+#if defined(CONFIG_TCG)
     /* Init PMU overflow timers */
     if (!kvm_enabled()) {
         cpu_ppc_pmu_init(env);
@@ -7872,10 +7872,9 @@ static void ppc_cpu_reset(DeviceState *dev)
     if (env->mmu_model != POWERPC_MMU_REAL) {
         ppc_tlb_invalidate_all(env);
     }
+    pmu_update_summaries(env);
 #endif /* CONFIG_TCG */
 #endif
-
-    pmu_update_summaries(env);
     hreg_compute_hflags(env);
     env->reserve_addr = (target_ulong)-1ULL;
     /* Be sure no exception or interrupt is pending */
diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index 1b63146ed1..a4b0fa1a78 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -20,7 +20,9 @@ static void post_load_update_msr(CPUPPCState *env)
      */
     env->msr ^= env->msr_mask & ~((1ULL << MSR_TGPR) | MSR_HVB);
     ppc_store_msr(env, msr);
+#if defined(CONFIG_TCG)
     pmu_update_summaries(env);
+#endif
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
2.34.1


