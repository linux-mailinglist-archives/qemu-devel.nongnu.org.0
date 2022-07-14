Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 387D5575167
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 17:07:17 +0200 (CEST)
Received: from localhost ([::1]:37596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC0Qu-0004bM-BN
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 11:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_trohmel@quicinc.com>)
 id 1oC0KN-0005qS-Pq
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:00:35 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:15254)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_trohmel@quicinc.com>)
 id 1oC0KL-0007aE-Qs
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:00:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657810830; x=1689346830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w5IQxraxoSArUuftBd37e45My2CIyqHLGOT+dh/Y/3U=;
 b=NYu0ZH9Mo3hUcdvO3BMtut0tVzCjYWYkFQi26YUaSZFMcwFvlcrfpjwr
 FUDvNca5c/bSHYsgKcBZwhQdni1PNDLO1e/VZAuFuIKiF40XEwEVs6Jrf
 qSRvMJG2DckuED9xZVvb1Z4g5+x7QRRdVjE6xilyU3lvskvDqp8KZd+Hs g=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 14 Jul 2022 07:54:21 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2022 07:54:21 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Jul 2022 07:54:20 -0700
Received: from avd-de-lrx-6.eu.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Jul 2022 07:54:19 -0700
From: Tobias Roehmel <quic_trohmel@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <quic_trohmel@quicinc.com>
Subject: [PATCH 06/11] target/arm: Add ARMCacheAttrs to the signature of
 pmsav8_mpu_lookup
Date: Thu, 14 Jul 2022 16:53:50 +0200
Message-ID: <20220714145355.7225-7-quic_trohmel@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220714145355.7225-1-quic_trohmel@quicinc.com>
References: <20220714145355.7225-1-quic_trohmel@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
Received-SPF: pass client-ip=129.46.98.28;
 envelope-from=quic_trohmel@quicinc.com; helo=alexa-out.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Tobias Röhmel <quic_trohmel@quicinc.com>

Add ARMCacheAttrs to the signature of pmsav8_mpu_lookup to prepare for the Cortex-R52 MPU which uses and combines cache attributes of different translation levels.

Signed-off-by: Tobias Röhmel <quic_trohmel@quicinc.com>
---
 target/arm/internals.h | 13 +++++++------
 target/arm/m_helper.c  |  3 ++-
 target/arm/ptw.c       | 11 +++++++----
 3 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 6f94f3019d..b03049d920 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1109,12 +1109,6 @@ void v8m_security_lookup(CPUARMState *env, uint32_t address,
                          MMUAccessType access_type, ARMMMUIdx mmu_idx,
                          V8M_SAttributes *sattrs);
 
-bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
-                       MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                       hwaddr *phys_ptr, MemTxAttrs *txattrs,
-                       int *prot, bool *is_subpage,
-                       ARMMMUFaultInfo *fi, uint32_t *mregion);
-
 /* Cacheability and shareability attributes for a memory access */
 typedef struct ARMCacheAttrs {
     /*
@@ -1126,6 +1120,13 @@ typedef struct ARMCacheAttrs {
     bool is_s2_format:1;
 } ARMCacheAttrs;
 
+bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
+                       MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                       hwaddr *phys_ptr, MemTxAttrs *txattrs,
+                       int *prot, bool *is_subpage,
+                       ARMMMUFaultInfo *fi, uint32_t *mregion,
+                       ARMCacheAttrs *cacheattrs);
+
 bool get_phys_addr(CPUARMState *env, target_ulong address,
                    MMUAccessType access_type, ARMMMUIdx mmu_idx,
                    hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index a740c3e160..44c80d733a 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2829,10 +2829,11 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
      * inspecting the other MPU state.
      */
     if (arm_current_el(env) != 0 || alt) {
+        ARMCacheAttrs cacheattrs = {0};
         /* We can ignore the return value as prot is always set */
         pmsav8_mpu_lookup(env, addr, MMU_DATA_LOAD, mmu_idx,
                           &phys_addr, &attrs, &prot, &is_subpage,
-                          &fi, &mregion);
+                          &fi, &mregion, &cacheattrs);
         if (mregion == -1) {
             mrvalid = false;
             mregion = 0;
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8b037c1f55..c4f5721012 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1702,7 +1702,8 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                        MMUAccessType access_type, ARMMMUIdx mmu_idx,
                        hwaddr *phys_ptr, MemTxAttrs *txattrs,
                        int *prot, bool *is_subpage,
-                       ARMMMUFaultInfo *fi, uint32_t *mregion)
+                       ARMMMUFaultInfo *fi, uint32_t *mregion,
+                       ARMCacheAttrs *cacheattrs)
 {
     /*
      * Perform a PMSAv8 MPU lookup (without also doing the SAU check
@@ -1968,7 +1969,7 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                  hwaddr *phys_ptr, MemTxAttrs *txattrs,
                                  int *prot, target_ulong *page_size,
-                                 ARMMMUFaultInfo *fi)
+                                 ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
 {
     uint32_t secure = regime_is_secure(env, mmu_idx);
     V8M_SAttributes sattrs = {};
@@ -2036,7 +2037,8 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
     }
 
     ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx, phys_ptr,
-                            txattrs, prot, &mpu_is_subpage, fi, NULL);
+                            txattrs, prot, &mpu_is_subpage, fi,
+                            NULL, cacheattrs);
     *page_size = sattrs.subpage || mpu_is_subpage ? 1 : TARGET_PAGE_SIZE;
     return ret;
 }
@@ -2416,7 +2418,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         if (arm_feature(env, ARM_FEATURE_V8)) {
             /* PMSAv8 */
             ret = get_phys_addr_pmsav8(env, address, access_type, mmu_idx,
-                                       phys_ptr, attrs, prot, page_size, fi);
+                                       phys_ptr, attrs, prot, page_size,
+                                       fi, cacheattrs);
         } else if (arm_feature(env, ARM_FEATURE_V7)) {
             /* PMSAv7 */
             ret = get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
-- 
2.25.1


