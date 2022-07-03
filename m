Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE645645E4
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 10:44:01 +0200 (CEST)
Received: from localhost ([::1]:49004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7vCx-0005ay-9K
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 04:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uuz-0007YH-10
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:25 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:44607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uux-00068q-Bk
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:24 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 n16-20020a17090ade9000b001ed15b37424so6697425pjv.3
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zlvoZgbtv2iYgMtdizbSI+TVx/on1gTKhG9DRzhIk2s=;
 b=N9uMbgzyWdzSqFWU/9rLT43NnnohqNv8aRpQ2SvzcUjR3Qf5WxuwXaaMNasVLTRhhB
 53dkCeLy8ZXexe7AQmms0lPW3Aws9WoOkaLVgCKyCS2ecdiB1a1Gk5HUot78rIvPQbTQ
 FI3uFnVgcGhiVTO0AAvRZjtc4zPn+nWXf6zvHsN8mAG0+Zpk40kJIB562Lpqo/pqE/qq
 4NbezK55KDAiF2QuV0eV6+T6xIP/M9Q7RQqknhE4mIw9sn2CpVYD+2k1DSjjfuSe81Vz
 Znx/JQhKOQY/0Z2TlK/xyBO6hVu6u2aEAFlsHUNi4EwR7WKbtHMVf8zkuk83Rt56v8li
 XQRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zlvoZgbtv2iYgMtdizbSI+TVx/on1gTKhG9DRzhIk2s=;
 b=6N0qQDb1Nua4sqZ1j+Uc27EwODM3mVKURciX9ecWgIy4Fh/B4jVlbYetM1erq359dt
 J+CC6yirnkNca+Sq2hCElTtOaOyPkKM8986HolvvcuHtDzEJrDoy6ItK9XR60oQPaDMI
 70/Lagwm0GxIn+PLGglr0DxP+qV/qH2wqjxc0uCtlg/B1t+Kt4ZhmqVROitpL52EQ/rv
 5FtwpjNcPvwXyNF6KPmD5DQg4NXODnXSAvhOXklCM/kJ4JtedsBGv6q2pd+7W+HSWYCl
 9cpdRFoPXRGt0QgcAA8Qh4DpN/Zpr+OhZUAr0VHLyGOz4ghtbnRoH2G08gXxVAABq2hb
 P6VQ==
X-Gm-Message-State: AJIora+6hC/eKDccDECoNgFSNTn4m5A4hdLA2rVcf65NGSI4IKLkWRM/
 Ob2Iy1TbxqPIDxi87Z/RH8O682dW8iM2Sutx
X-Google-Smtp-Source: AGRyM1uhPDUGOqb9Hw+ZZHb3pvRJ1q70Ez42DPUEqVD6vb/dgXYVylupH9L0qu0LzkoXlG/5EnebfQ==
X-Received: by 2002:a17:902:9887:b0:151:6e1c:7082 with SMTP id
 s7-20020a170902988700b001516e1c7082mr28835570plp.162.1656836721777; 
 Sun, 03 Jul 2022 01:25:21 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:25:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 18/62] target/arm: Add is_secure parameter to
 v8m_security_lookup
Date: Sun,  3 Jul 2022 13:53:35 +0530
Message-Id: <20220703082419.770989-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

Remove the use of regime_is_secure from v8m_security_lookup.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 2 +-
 target/arm/m_helper.c  | 9 ++++++---
 target/arm/ptw.c       | 9 +++++----
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index f6a9b963d3..30bda00a09 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1113,7 +1113,7 @@ typedef struct V8M_SAttributes {
 
 void v8m_security_lookup(CPUARMState *env, uint32_t address,
                          MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                         V8M_SAttributes *sattrs);
+                         bool secure, V8M_SAttributes *sattrs);
 
 /* Cacheability and shareability attributes for a memory access */
 typedef struct ARMCacheAttrs {
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 01263990dc..45fbf19559 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -689,7 +689,8 @@ static bool arm_v7m_load_vector(ARMCPU *cpu, int exc, bool targets_secure,
     if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
         V8M_SAttributes sattrs = {};
 
-        v8m_security_lookup(env, addr, MMU_DATA_LOAD, mmu_idx, &sattrs);
+        v8m_security_lookup(env, addr, MMU_DATA_LOAD, mmu_idx,
+                            targets_secure, &sattrs);
         if (sattrs.ns) {
             attrs.secure = false;
         } else if (!targets_secure) {
@@ -2002,7 +2003,8 @@ static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx,
     ARMMMUFaultInfo fi = {};
     MemTxResult txres;
 
-    v8m_security_lookup(env, addr, MMU_INST_FETCH, mmu_idx, &sattrs);
+    v8m_security_lookup(env, addr, MMU_INST_FETCH, mmu_idx,
+                        regime_is_secure(env, mmu_idx), &sattrs);
     if (!sattrs.nsc || sattrs.ns) {
         /*
          * This must be the second half of the insn, and it straddles a
@@ -2826,7 +2828,8 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
     }
 
     if (env->v7m.secure) {
-        v8m_security_lookup(env, addr, MMU_DATA_LOAD, mmu_idx, &sattrs);
+        v8m_security_lookup(env, addr, MMU_DATA_LOAD, mmu_idx,
+                            targetsec, &sattrs);
         nsr = sattrs.ns && r;
         nsrw = sattrs.ns && rw;
     } else {
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 5274d0b304..3b70c423a8 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1853,8 +1853,8 @@ static bool v8m_is_sau_exempt(CPUARMState *env,
 }
 
 void v8m_security_lookup(CPUARMState *env, uint32_t address,
-                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                V8M_SAttributes *sattrs)
+                         MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                         bool is_secure, V8M_SAttributes *sattrs)
 {
     /*
      * Look up the security attributes for this address. Compare the
@@ -1882,7 +1882,7 @@ void v8m_security_lookup(CPUARMState *env, uint32_t address,
     }
 
     if (idau_exempt || v8m_is_sau_exempt(env, address, access_type)) {
-        sattrs->ns = !regime_is_secure(env, mmu_idx);
+        sattrs->ns = !is_secure;
         return;
     }
 
@@ -1971,7 +1971,8 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
     bool ret;
 
     if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
-        v8m_security_lookup(env, address, access_type, mmu_idx, &sattrs);
+        v8m_security_lookup(env, address, access_type, mmu_idx,
+                            secure, &sattrs);
         if (access_type == MMU_INST_FETCH) {
             /*
              * Instruction fetches always use the MMU bank and the
-- 
2.34.1


