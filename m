Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1677C6521D8
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 14:57:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7d3r-0004Qx-W0; Tue, 20 Dec 2022 08:53:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7d3p-0004Pi-LB; Tue, 20 Dec 2022 08:53:38 -0500
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7d3o-000137-0g; Tue, 20 Dec 2022 08:53:37 -0500
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1322d768ba7so15439418fac.5; 
 Tue, 20 Dec 2022 05:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=duf0nNtYaItwYDzbhKlns2RnaTPeDICDvkZSxpPsxPw=;
 b=H5Bj34WVN0IK4ap+gPD3d2RITnqfbK+tgwsj1kOAhYAl0KPa8Jvv+vYIu4PeGO7tsV
 mXa9zBgmGAqKurWiBtp/mmjXo5A/m3cIrCf9wJ1H7tuZ6BF7XHHg0fjHOOaBkIF4bTba
 ygHdLiKSsvVS/9+v1B8ZMxN6e4Gjkm7L1e++jPFOUvrqXQlvOjs9a/PavFjxM+rkQBYQ
 ZsXdaiHTUggwbX2gIxGt/SjBqq9DepI2qFeYI3rWdz5pU3DjojQSWmb9zDXdmAnJV2A/
 Jnx2GdGCzdxB89Ii88Gu4nTdRGprgrlNcNMWXTVfpK/d8aoPPm5sV9N0iEE6T3v1YGvN
 NYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=duf0nNtYaItwYDzbhKlns2RnaTPeDICDvkZSxpPsxPw=;
 b=Ous4c6dxkBpuHTbM1ImXTkUCFN78fC58eDFSs86//sdaSiqrIzQEwVCyy1QC4uf7ud
 h+wPe0xOv3inWIS4AvykbRP19B7MyNBfIEY2SvtfgY9QUFeAy0Bb/PsjLeb/Lg3Mgakw
 lgTHwkBQ9tCmxA+qRORUBoTnce3Vk67Yc9GgvJFKxLXIvXbfc+KbLcZiT9az4vemgVrj
 7iMLSGXGAZ8SzbwVDMfSn+zmJQuhDGsmHG2aTBfYnnXFxScDukpqyNiS6MfdBw2GNPWD
 dKGJW04C+4m62EGUOrOBAxBCiyB/F8kXjoy1NvuUGxFLsv8X/ozt7STrUOudZhEV+acc
 ztPA==
X-Gm-Message-State: ANoB5pmmOzum6N1+FQlcnFGtdB2GEC9fgzkvUSOGK6V9xef8BuGdVnu1
 QO/AGBJFTmFXSvlwzATRyzx7eg1X6gg=
X-Google-Smtp-Source: AA0mqf7+L/fQKkltfhD8zvlZpD6kRoLBdd5TJaeGa2q770klwQzO9nYOdA9DRg6r8DzVMNnjxpZ3Xw==
X-Received: by 2002:a05:6870:1d0f:b0:144:8c76:636 with SMTP id
 pa15-20020a0568701d0f00b001448c760636mr21134753oab.39.1671544414916; 
 Tue, 20 Dec 2022 05:53:34 -0800 (PST)
Received: from fedora.dc1.ventanamicro.com (201-43-103-101.dsl.telesp.net.br.
 [201.43.103.101]) by smtp.gmail.com with ESMTPSA id
 f14-20020a056870898e00b0014474019e50sm5994933oaq.24.2022.12.20.05.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 05:53:34 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 Nicholas Miehlbradt <nicholas@linux.ibm.com>
Subject: [PULL 15/15] target/ppc: Check DEXCR on hash{st, chk} instructions
Date: Tue, 20 Dec 2022 10:52:51 -0300
Message-Id: <20221220135251.155176-16-danielhb413@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220135251.155176-1-danielhb413@gmail.com>
References: <20221220135251.155176-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2a.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Nicholas Miehlbradt <nicholas@linux.ibm.com>

Adds checks to the hashst and hashchk instructions to only execute if
enabled by the relevant aspect in the DEXCR and HDEXCR.

This behaviour is guarded behind TARGET_PPC64 since Power10 is
currently the only implementation which has the DEXCR.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>
Message-Id: <20221220042330.2387944-3-nicholas@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/excp_helper.c | 58 +++++++++++++++++++++++++++++-----------
 1 file changed, 43 insertions(+), 15 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 94adcb766b..add4d54ae7 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -2902,29 +2902,57 @@ static uint64_t hash_digest(uint64_t ra, uint64_t rb, uint64_t key)
     return stage1_h ^ stage1_l;
 }
 
+static void do_hash(CPUPPCState *env, target_ulong ea, target_ulong ra,
+                    target_ulong rb, uint64_t key, bool store)
+{
+    uint64_t calculated_hash = hash_digest(ra, rb, key), loaded_hash;
+
+    if (store) {
+        cpu_stq_data_ra(env, ea, calculated_hash, GETPC());
+    } else {
+        loaded_hash = cpu_ldq_data_ra(env, ea, GETPC());
+        if (loaded_hash != calculated_hash) {
+            raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,
+                POWERPC_EXCP_TRAP, GETPC());
+        }
+    }
+}
+
 #include "qemu/guest-random.h"
 
-#define HELPER_HASH(op, key, store)                                           \
+#ifdef TARGET_PPC64
+#define HELPER_HASH(op, key, store, dexcr_aspect)                             \
 void helper_##op(CPUPPCState *env, target_ulong ea, target_ulong ra,          \
                  target_ulong rb)                                             \
 {                                                                             \
-    uint64_t calculated_hash = hash_digest(ra, rb, key), loaded_hash;         \
-                                                                              \
-    if (store) {                                                              \
-        cpu_stq_data_ra(env, ea, calculated_hash, GETPC());                   \
-    } else {                                                                  \
-        loaded_hash = cpu_ldq_data_ra(env, ea, GETPC());                      \
-        if (loaded_hash != calculated_hash) {                                 \
-            raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,                 \
-                POWERPC_EXCP_TRAP, GETPC());                                  \
-        }                                                                     \
+    if (env->msr & R_MSR_PR_MASK) {                                           \
+        if (!(env->spr[SPR_DEXCR] & R_DEXCR_PRO_##dexcr_aspect##_MASK ||      \
+            env->spr[SPR_HDEXCR] & R_HDEXCR_ENF_##dexcr_aspect##_MASK))       \
+            return;                                                           \
+    } else if (!(env->msr & R_MSR_HV_MASK)) {                                 \
+        if (!(env->spr[SPR_DEXCR] & R_DEXCR_PNH_##dexcr_aspect##_MASK ||      \
+            env->spr[SPR_HDEXCR] & R_HDEXCR_ENF_##dexcr_aspect##_MASK))       \
+            return;                                                           \
+    } else if (!(env->msr & R_MSR_S_MASK)) {                                  \
+        if (!(env->spr[SPR_HDEXCR] & R_HDEXCR_HNU_##dexcr_aspect##_MASK))     \
+            return;                                                           \
     }                                                                         \
+                                                                              \
+    do_hash(env, ea, ra, rb, key, store);                                     \
+}
+#else
+#define HELPER_HASH(op, key, store, dexcr_aspect)                             \
+void helper_##op(CPUPPCState *env, target_ulong ea, target_ulong ra,          \
+                 target_ulong rb)                                             \
+{                                                                             \
+    do_hash(env, ea, ra, rb, key, store);                                     \
 }
+#endif /* TARGET_PPC64 */
 
-HELPER_HASH(HASHST, env->spr[SPR_HASHKEYR], true)
-HELPER_HASH(HASHCHK, env->spr[SPR_HASHKEYR], false)
-HELPER_HASH(HASHSTP, env->spr[SPR_HASHPKEYR], true)
-HELPER_HASH(HASHCHKP, env->spr[SPR_HASHPKEYR], false)
+HELPER_HASH(HASHST, env->spr[SPR_HASHKEYR], true, NPHIE)
+HELPER_HASH(HASHCHK, env->spr[SPR_HASHKEYR], false, NPHIE)
+HELPER_HASH(HASHSTP, env->spr[SPR_HASHPKEYR], true, PHIE)
+HELPER_HASH(HASHCHKP, env->spr[SPR_HASHPKEYR], false, PHIE)
 #endif /* CONFIG_TCG */
 
 #if !defined(CONFIG_USER_ONLY)
-- 
2.38.1


