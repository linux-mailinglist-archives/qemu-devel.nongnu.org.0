Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF2E5645DB
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 10:40:10 +0200 (CEST)
Received: from localhost ([::1]:39972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7v9F-0007oX-Ed
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 04:40:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uv1-0007f8-Nh
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:27 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:38790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uv0-000699-1q
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:27 -0400
Received: by mail-pl1-x62e.google.com with SMTP id m14so6030066plg.5
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LaYP+2o95zy27QHmyX20UD82IAVILTEsp61gOqT10lM=;
 b=KChJYuAuc0J/uOVFYtz/nSDmIC7VkWWBibHIFC5ktYc1ODj4fRn0SpWq2kqXrwYChA
 aKNZZLu4uZ4a4bht1JtalhhaBC7XWu+Dp9Qf+n9Yq4mHmhdtlLULNKUZgv1jbr6C3m8B
 nse3RfprDQUKa7ZCd7zUnNO31YaMpzMsM/X1Ya6+qfajmxiU2oZBDi48PtILIFAYKUxv
 Us8VW5lqlz1d3lzptSrF5rI0txDLAKicDA22UkHLrS/nuxDOhKG8pKEWH7HJYA1+Gx+M
 MeuKumCMYwS4OKxaG13JXv2kjYNnWHLlspxPxpBAiarCCrzVd3mLsG6kjSM1XnD7WtSK
 0x0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LaYP+2o95zy27QHmyX20UD82IAVILTEsp61gOqT10lM=;
 b=x40AB/r6atD2fIj6jKQ9uOhvBDMPSzzOnHnUuGToiEaclnsLOVF8u91IjHlByGOoi4
 5/jimG9vSR14pEXLZI7SHCQbpD9y7iaDkY9fvUl+1zXDzpOcZ/S3m/BsrMKwA4s2F9W3
 1KrnyDw2BGC16MY1qR3aI558/QYP011fKaLP1ge+VOIkbGqdo1e03jbBSc5m/rhnsEEm
 TiXahZQUfQeKvQQODv9H9TsnQTuClwj3DPA6ihbsyzawmZ2YvLAaYiu7fok76PrDBsIJ
 uHmB8t/MP/y4rzAvHIUYATJyuU59B+VtGYT/yvjusROjd2R1Gic7d0qQYollwk0/kGFp
 OpOA==
X-Gm-Message-State: AJIora96ABBQzEeSwE8YfyV2cAHdlxC8ew5nppflODPh+B90ATXAbBmv
 ItSSgWx/PXrunG0KhadsOI6BlYJAhLlGcwTD
X-Google-Smtp-Source: AGRyM1uH+fTsbT+38DwmK10vIECQUqqIWvFfP8jjbf+3D/jWhJSEnmGRDqpHMFGwhm22e2D8tf8Nyw==
X-Received: by 2002:a17:903:120c:b0:167:8847:21f2 with SMTP id
 l12-20020a170903120c00b00167884721f2mr28391645plh.11.1656836724769; 
 Sun, 03 Jul 2022 01:25:24 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.25.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:25:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 19/62] target/arm: Add is_secure parameter to pmsav8_mpu_lookup
Date: Sun,  3 Jul 2022 13:53:36 +0530
Message-Id: <20220703082419.770989-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

Remove the use of regime_is_secure from pmsav8_mpu_lookup.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 4 ++--
 target/arm/m_helper.c  | 2 +-
 target/arm/ptw.c       | 7 +++----
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 30bda00a09..f75ac2e1b7 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1143,8 +1143,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
 
 bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                        MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                       GetPhysAddrResult *result, ARMMMUFaultInfo *fi,
-                       uint32_t *mregion);
+                       bool is_secure, GetPhysAddrResult *result,
+                       ARMMMUFaultInfo *fi, uint32_t *mregion);
 
 void arm_log_exception(CPUState *cs);
 
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 45fbf19559..5ee4ee15b3 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2810,7 +2810,7 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
         ARMMMUFaultInfo fi = {};
 
         /* We can ignore the return value as prot is always set */
-        pmsav8_mpu_lookup(env, addr, MMU_DATA_LOAD, mmu_idx,
+        pmsav8_mpu_lookup(env, addr, MMU_DATA_LOAD, mmu_idx, targetsec,
                           &res, &fi, &mregion);
         if (mregion == -1) {
             mrvalid = false;
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 3b70c423a8..1a0e708d11 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1697,8 +1697,8 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
 
 bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                        MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                       GetPhysAddrResult *result, ARMMMUFaultInfo *fi,
-                       uint32_t *mregion)
+                       bool secure, GetPhysAddrResult *result,
+                       ARMMMUFaultInfo *fi, uint32_t *mregion)
 {
     /*
      * Perform a PMSAv8 MPU lookup (without also doing the SAU check
@@ -1711,7 +1711,6 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
      */
     ARMCPU *cpu = env_archcpu(env);
     bool is_user = regime_is_user(env, mmu_idx);
-    uint32_t secure = regime_is_secure(env, mmu_idx);
     int n;
     int matchregion = -1;
     bool hit = false;
@@ -2031,7 +2030,7 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
         }
     }
 
-    ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx,
+    ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx, secure,
                             result, fi, NULL);
     if (sattrs.subpage) {
         result->page_size = 1;
-- 
2.34.1


