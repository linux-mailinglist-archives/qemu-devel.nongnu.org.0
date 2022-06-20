Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7BC55239B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 20:12:05 +0200 (CEST)
Received: from localhost ([::1]:36816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Lsa-0006vY-9i
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 14:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZx-0005lC-34
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:49 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:34816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZu-0001Ob-Uk
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:48 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 x1-20020a17090abc8100b001ec7f8a51f5so7406170pjr.0
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=msgMMLT5cMN7hk5m6rIXGPdt1bB9hhzt+ViCqZQouiQ=;
 b=NLvsmlB7Qra9M9wYN5EWjv3vjiymETYGy3hPLFzoaIw+jfp81llJlz3/U7ERnn6su3
 8CKHZ7yw3ECv4FIBkEREHJHbDEm1JIkUdkuRiu6csWdbIiC9bxabH1M6PkIJDSrJ2t6R
 CHMpBbzoeNqpvwgQ8ezLbfWXDktBt3Sph5RpGLoQkrshYrE+dEXkXp52zzZyP9vA8O8e
 tiC53A8vwb4TeYLCCpilTo0vbiOuGibcJO45JfYQc2en+lW91Hjf69wvj5N38dyyEjSs
 iZTWXSKoN4IYgKnYhpqeGao6CpBB/NfoTR6by33v0u9uC7SO1UtLR4nM+ZVAywxGibPK
 YzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=msgMMLT5cMN7hk5m6rIXGPdt1bB9hhzt+ViCqZQouiQ=;
 b=vnIK9Ho80aJGwgm3a5+5noBcZoQDn9CXtLpWwzqQCIlrmEDpTwbkOmu//qO+uYaOju
 YBrgZvG7IhfjABi+sK2mlUTJQ6Hm4LLMtTqqZvJgVV/uaAOr7PVOpKAdEgXo0Xp4oiK4
 1Mfg3HxKyrCPdiCkW5qdhOxPIqnFT2FhjkTowDWMNhQKSC4cmEf7kf08l9cWep+JICx9
 i2tgedpEg6Lpko4CDxFagCWyKxEu7VJmVEUcMGwoOalCWA2weQRIy2QpeigPcuKsFCLv
 J2Hdhd+wOlzg63e2rLe1nnI4jI0x8I+9kDKH/qxzdtsBgdlwJ0L+nrFSGEdme5ywQzUN
 j5Tg==
X-Gm-Message-State: AJIora9d314WbgwD8FC3/qKrfFDitVrO5k+jgz6A7YKN5U8lUhWvVaaj
 fVtAbDwXWmfgjsEGRcmf4q8zAiBKm7EzPA==
X-Google-Smtp-Source: AGRyM1uEO4Wm1lY2Bm70Re/MDkk1QzZ4bFyg5tjb2ofZgnyyKTBe+i1E/rDosqzukJ00fsOmHAbcTg==
X-Received: by 2002:a17:902:e0c3:b0:16a:1c8a:5ae8 with SMTP id
 e3-20020a170902e0c300b0016a1c8a5ae8mr9001878pla.97.1655747565507; 
 Mon, 20 Jun 2022 10:52:45 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 10/51] target/arm: Implement SMSTART, SMSTOP
Date: Mon, 20 Jun 2022 10:51:54 -0700
Message-Id: <20220620175235.60881-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

These two instructions are aliases of MSR (immediate).
Use the two helpers to properly implement svcr_write.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  1 +
 target/arm/helper-sme.h    | 21 +++++++++++++
 target/arm/helper.h        |  1 +
 target/arm/helper.c        |  6 ++--
 target/arm/sme_helper.c    | 61 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c | 24 +++++++++++++++
 target/arm/meson.build     |  1 +
 7 files changed, 112 insertions(+), 3 deletions(-)
 create mode 100644 target/arm/helper-sme.h
 create mode 100644 target/arm/sme_helper.c

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c3c7ec697d..2e049291da 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1106,6 +1106,7 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
                            int new_el, bool el0_a64);
 void aarch64_add_sve_properties(Object *obj);
 void aarch64_add_pauth_properties(Object *obj);
+void arm_reset_sve_state(CPUARMState *env);
 
 /*
  * SVE registers are encoded in KVM's memory in an endianness-invariant format.
diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
new file mode 100644
index 0000000000..3bd48c235f
--- /dev/null
+++ b/target/arm/helper-sme.h
@@ -0,0 +1,21 @@
+/*
+ *  AArch64 SME specific helper definitions
+ *
+ *  Copyright (c) 2022 Linaro, Ltd
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+DEF_HELPER_FLAGS_2(set_pstate_sm, TCG_CALL_NO_RWG, void, env, i32)
+DEF_HELPER_FLAGS_2(set_pstate_za, TCG_CALL_NO_RWG, void, env, i32)
diff --git a/target/arm/helper.h b/target/arm/helper.h
index 07d45faf49..3a8ce42ab0 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1022,6 +1022,7 @@ DEF_HELPER_FLAGS_6(gvec_bfmlal_idx, TCG_CALL_NO_RWG,
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #include "helper-sve.h"
+#include "helper-sme.h"
 #endif
 
 #include "helper-mve.h"
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e06c054c3d..88d96f7991 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6366,9 +6366,9 @@ static CPAccessResult access_esm(CPUARMState *env, const ARMCPRegInfo *ri,
 static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
-    value &= R_SVCR_SM_MASK | R_SVCR_ZA_MASK;
-    /* TODO: Side effects. */
-    env->svcr = value;
+    helper_set_pstate_sm(env, FIELD_EX64(value, SVCR, SM));
+    helper_set_pstate_za(env, FIELD_EX64(value, SVCR, ZA));
+    arm_rebuild_hflags(env);
 }
 
 static void smcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
new file mode 100644
index 0000000000..b215725594
--- /dev/null
+++ b/target/arm/sme_helper.c
@@ -0,0 +1,61 @@
+/*
+ * ARM SME Operations
+ *
+ * Copyright (c) 2022 Linaro, Ltd.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internals.h"
+#include "exec/helper-proto.h"
+
+/* ResetSVEState */
+void arm_reset_sve_state(CPUARMState *env)
+{
+    memset(env->vfp.zregs, 0, sizeof(env->vfp.zregs));
+    /* Recall that FFR is stored as pregs[16]. */
+    memset(env->vfp.pregs, 0, sizeof(env->vfp.pregs));
+    vfp_set_fpcr(env, 0x0800009f);
+}
+
+void helper_set_pstate_sm(CPUARMState *env, uint32_t i)
+{
+    if (i == FIELD_EX64(env->svcr, SVCR, SM)) {
+        return;
+    }
+    env->svcr ^= R_SVCR_SM_MASK;
+    arm_reset_sve_state(env);
+}
+
+void helper_set_pstate_za(CPUARMState *env, uint32_t i)
+{
+    if (i == FIELD_EX64(env->svcr, SVCR, ZA)) {
+        return;
+    }
+    env->svcr ^= R_SVCR_ZA_MASK;
+
+    /*
+     * ResetSMEState.
+     *
+     * SetPSTATE_ZA zeros on enable and disable.  We can zero this only
+     * on enable: while disabled, the storage is inaccessible and the
+     * value does not matter.  We're not saving the storage in vmstate
+     * when disabled either.
+     */
+    if (i) {
+        memset(env->zarray, 0, sizeof(env->zarray));
+    }
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 5cf4a283ba..c050ebe005 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1762,6 +1762,30 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
         }
         break;
 
+    case 0x1b: /* SVCR* */
+        if (!dc_isar_feature(aa64_sme, s) || crm < 2 || crm > 7) {
+            goto do_unallocated;
+        }
+        if (sme_access_check(s)) {
+            bool i = crm & 1;
+            bool changed = false;
+
+            if ((crm & 2) && i != s->pstate_sm) {
+                gen_helper_set_pstate_sm(cpu_env, tcg_constant_i32(i));
+                changed = true;
+            }
+            if ((crm & 4) && i != s->pstate_za) {
+                gen_helper_set_pstate_za(cpu_env, tcg_constant_i32(i));
+                changed = true;
+            }
+            if (changed) {
+                gen_rebuild_hflags(s);
+            } else {
+                s->base.is_jmp = DISAS_NEXT;
+            }
+        }
+        break;
+
     default:
     do_unallocated:
         unallocated_encoding(s);
diff --git a/target/arm/meson.build b/target/arm/meson.build
index ac571fc45d..43dc600547 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -47,6 +47,7 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'mte_helper.c',
   'pauth_helper.c',
   'sve_helper.c',
+  'sme_helper.c',
   'translate-a64.c',
   'translate-sve.c',
 ))
-- 
2.34.1


