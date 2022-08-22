Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1035459C3C0
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 18:10:55 +0200 (CEST)
Received: from localhost ([::1]:36080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQA0l-0007wt-W8
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 12:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LO-0007aa-7y
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:02 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:41955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LG-0000hg-RP
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:01 -0400
Received: by mail-pf1-x42b.google.com with SMTP id g129so7349469pfb.8
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=BWRDtrDD+OIowc2u5C+0Bs/iEHTC4XxgclrlkjL6OHk=;
 b=jF9Ny+Dv2/w2nmx73YWnpF9y56k4nLUDp2Uk4qUriUvfuCBwIoM4Kd/42lz9L9lD+h
 3LBcLwHAkjpMIvwtr6wKWD0HhLs3/euYYzGLsrFoSDAwLOxTAf6yqcQqmG1ybap+QjZV
 1xgcHyKmb6lVWA8kdanMJtOL167Vmj527HZHdHcyeHV5seXYwj2Y9zMBNleoEaTm6/2s
 Z5l2H6bKDL0xUw1Ke3Cohop9YEzV7MM/iY5j/szKE0uydgx+EP06rib+D6PQpLq34P7z
 Vx0qP0M8Nno0NkICr199m4WHv0R6uFW+yBcLzw/pi72t4cJJWAfK57pM9I/0o1Rlbthr
 Q2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=BWRDtrDD+OIowc2u5C+0Bs/iEHTC4XxgclrlkjL6OHk=;
 b=WTNXklIXYb6Dv6w5VE4M/DDxjsYT7PJPc6nh7Kul/w9uQVSXvEB6anykTsD8fcqPK7
 Ayl6Byu7+h3x20U5LMWLYDEvy3NZEm1efUYxNgZPJLVpsC1s5XDxtAo1pf0kM31+lqvH
 i/DcvykyZ0NKAFG6rldWEFlcO+C0nIJ2nvkjIL0u1m/Is4Irx4DCpJnJBs1aR6j97ZgV
 cJr/u7leEa6Ib7pJOGOgUG41+mSHmjrWqkVEYYcMVtGfZCjncebFT/W6fhNpAR57aCM4
 RVSHgo1YJcInQWUjux08TyF2Az/NSMSCmclkCFrFaHaeRgp2Hx0nJVTBRiKNF7eESgvX
 kJmA==
X-Gm-Message-State: ACgBeo1Hm5yv+9gSJpIpOgaULANIx1dJs5ryBggk2ERlmQA/Z7zY7iGl
 peCbfwDmbJNbaI1pksbXHryOkTHs25PTSg==
X-Google-Smtp-Source: AA6agR7cgq5AMCgaWo46LQbmWgkt9XFNMFkSvZQ4qmBDp7VMc1pu0DlKpP+ujAeqgr/idEK56gh4jQ==
X-Received: by 2002:a05:6a00:98a:b0:536:4469:12e6 with SMTP id
 u10-20020a056a00098a00b00536446912e6mr12705545pfg.9.1661182071497; 
 Mon, 22 Aug 2022 08:27:51 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:27:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 11/66] target/arm: Add is_secure parameter to
 v8m_security_lookup
Date: Mon, 22 Aug 2022 08:26:46 -0700
Message-Id: <20220822152741.1617527-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Remove the use of regime_is_secure from v8m_security_lookup,
passing the new parameter to the lookup instead.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 2 +-
 target/arm/m_helper.c  | 9 ++++++---
 target/arm/ptw.c       | 9 +++++----
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index fa8553a17e..7f3b5bb406 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1123,7 +1123,7 @@ typedef struct V8M_SAttributes {
 
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
index ec66ba6777..bbfb80f4dd 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1856,8 +1856,8 @@ static bool v8m_is_sau_exempt(CPUARMState *env,
 }
 
 void v8m_security_lookup(CPUARMState *env, uint32_t address,
-                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                V8M_SAttributes *sattrs)
+                         MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                         bool is_secure, V8M_SAttributes *sattrs)
 {
     /*
      * Look up the security attributes for this address. Compare the
@@ -1885,7 +1885,7 @@ void v8m_security_lookup(CPUARMState *env, uint32_t address,
     }
 
     if (idau_exempt || v8m_is_sau_exempt(env, address, access_type)) {
-        sattrs->ns = !regime_is_secure(env, mmu_idx);
+        sattrs->ns = !is_secure;
         return;
     }
 
@@ -1974,7 +1974,8 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
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


