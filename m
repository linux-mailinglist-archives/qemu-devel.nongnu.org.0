Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA94C5E6A60
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 20:06:57 +0200 (CEST)
Received: from localhost ([::1]:41656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obQb9-0008LV-RT
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 14:06:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPB9-0002CE-00
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:10 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:41859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPAx-0005P9-9i
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:35:57 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so1732799wmb.0
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=J6uh2yvAURvOGI2KB27pPtR0TDZYnQFcux+7TXKe5wo=;
 b=gjJhshDADrDbr3L9osRkKmYrvQQyHJMGoP79AVc6MpmalV41LyE+qh4lalxRACsCF+
 1Nlb3B6MAHsA1mHFfuwxyFrMaO4mMLOq3JiE8Mi2q2G8gYMnJPFZ9aQWALbAXbOuLU/j
 tmlzt/GrYOm2t8rJ2oXrlYriD9II21ry597oa7bLXjo6pindh+x8yQ7RCH2puk9J+4j0
 R2oGXTy2vd7fp6fVree0ZFpNIPKKwA0knpyQKu8Jp7HCEr5668ZTuMQNky01SyjqOKZQ
 7XHcBy/fHs/K8PX6YqKQniwo2ygvyVfKQM76Y5edMkFVS7r0sT4SLAAmHphAGnV0EFeQ
 mqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=J6uh2yvAURvOGI2KB27pPtR0TDZYnQFcux+7TXKe5wo=;
 b=ykZDgHikr4sLTWmwr7J+QzrNyon8+KLzK5tDU9zvzz/3MNfxda+5xW+lFC/3yvoJAh
 lq2imp3pnVVSTw0EXvAGQ/syR7cMz2YqUtrPBBD10dL0OPSOsNGhXl7qLR1ZcB//4jWi
 kPY9YNJk5ZJ4VbV0LYxW528epL94XTzmOI1ndeB6rDR84iX/xROWqLKIl6phdCnyONC1
 7N7rcd0MTMhLnrZmjwULXxmK336OWSFoTjDeN13Limm7NAH+IvbKhUSqFntDv9pwmxqh
 DYNfDZ/7MtOKCh78xyJG1NnGGdE/WTh03RAlGkIfUiQ2fHnhQYq9bMiCO/RtOQtcHfsv
 yFjw==
X-Gm-Message-State: ACrzQf1CtrZ5GBfRlBu2qTJ51gyIO0R7JsKOl+n3VQYuMNCNYnCqfiDD
 mq+XKjlZAV5yNBJIzWEBk7JGcsSTicmteA==
X-Google-Smtp-Source: AMsMyM47YQQ7MH710U/RKvrSEuZAwgAYXO0HPhq37Ciy5qLXzCN8TgTxl8wgiG7CzGJRisj8HOBaJg==
X-Received: by 2002:a05:600c:1987:b0:3b4:9b03:c440 with SMTP id
 t7-20020a05600c198700b003b49b03c440mr2925004wmq.14.1663864545530; 
 Thu, 22 Sep 2022 09:35:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.35.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:35:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/39] target/arm: Use GetPhysAddrResult in pmsav8_mpu_lookup
Date: Thu, 22 Sep 2022 17:35:07 +0100
Message-Id: <20220922163536.1096175-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220822152741.1617527-10-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 11 +++++------
 target/arm/m_helper.c  | 16 +++++++---------
 target/arm/ptw.c       | 20 +++++++++-----------
 3 files changed, 21 insertions(+), 26 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index e9743d3e220..103ae743a75 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1125,12 +1125,6 @@ void v8m_security_lookup(CPUARMState *env, uint32_t address,
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
@@ -1156,6 +1150,11 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                    GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
 
+bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
+                       MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                       GetPhysAddrResult *result, bool *is_subpage,
+                       ARMMMUFaultInfo *fi, uint32_t *mregion);
+
 void arm_log_exception(CPUState *cs);
 
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 84c6796b8d6..69d4a63fa6d 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2770,15 +2770,10 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
     V8M_SAttributes sattrs = {};
     uint32_t tt_resp;
     bool r, rw, nsr, nsrw, mrvalid;
-    int prot;
-    ARMMMUFaultInfo fi = {};
-    MemTxAttrs attrs = {};
-    hwaddr phys_addr;
     ARMMMUIdx mmu_idx;
     uint32_t mregion;
     bool targetpriv;
     bool targetsec = env->v7m.secure;
-    bool is_subpage;
 
     /*
      * Work out what the security state and privilege level we're
@@ -2809,18 +2804,21 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
      * inspecting the other MPU state.
      */
     if (arm_current_el(env) != 0 || alt) {
+        GetPhysAddrResult res = {};
+        ARMMMUFaultInfo fi = {};
+        bool is_subpage;
+
         /* We can ignore the return value as prot is always set */
         pmsav8_mpu_lookup(env, addr, MMU_DATA_LOAD, mmu_idx,
-                          &phys_addr, &attrs, &prot, &is_subpage,
-                          &fi, &mregion);
+                          &res, &is_subpage, &fi, &mregion);
         if (mregion == -1) {
             mrvalid = false;
             mregion = 0;
         } else {
             mrvalid = true;
         }
-        r = prot & PAGE_READ;
-        rw = prot & PAGE_WRITE;
+        r = res.prot & PAGE_READ;
+        rw = res.prot & PAGE_WRITE;
     } else {
         r = false;
         rw = false;
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 2286f6e12db..d6890048f13 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1701,8 +1701,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
 
 bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                        MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                       hwaddr *phys_ptr, MemTxAttrs *txattrs,
-                       int *prot, bool *is_subpage,
+                       GetPhysAddrResult *result, bool *is_subpage,
                        ARMMMUFaultInfo *fi, uint32_t *mregion)
 {
     /*
@@ -1724,8 +1723,8 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
     uint32_t addr_page_limit = addr_page_base + (TARGET_PAGE_SIZE - 1);
 
     *is_subpage = false;
-    *phys_ptr = address;
-    *prot = 0;
+    result->phys = address;
+    result->prot = 0;
     if (mregion) {
         *mregion = -1;
     }
@@ -1807,7 +1806,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
 
     if (matchregion == -1) {
         /* hit using the background region */
-        get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
+        get_phys_addr_pmsav7_default(env, mmu_idx, address, &result->prot);
     } else {
         uint32_t ap = extract32(env->pmsav8.rbar[secure][matchregion], 1, 2);
         uint32_t xn = extract32(env->pmsav8.rbar[secure][matchregion], 0, 1);
@@ -1822,9 +1821,9 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
             xn = 1;
         }
 
-        *prot = simple_ap_to_rw_prot(env, mmu_idx, ap);
-        if (*prot && !xn && !(pxn && !is_user)) {
-            *prot |= PAGE_EXEC;
+        result->prot = simple_ap_to_rw_prot(env, mmu_idx, ap);
+        if (result->prot && !xn && !(pxn && !is_user)) {
+            result->prot |= PAGE_EXEC;
         }
         /*
          * We don't need to look the attribute up in the MAIR0/MAIR1
@@ -1837,7 +1836,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
 
     fi->type = ARMFault_Permission;
     fi->level = 1;
-    return !(*prot & (1 << access_type));
+    return !(result->prot & (1 << access_type));
 }
 
 static bool v8m_is_sau_exempt(CPUARMState *env,
@@ -2036,8 +2035,7 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
     }
 
     ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx,
-                            &result->phys, &result->attrs, &result->prot,
-                            &mpu_is_subpage, fi, NULL);
+                            result, &mpu_is_subpage, fi, NULL);
     result->page_size =
         sattrs.subpage || mpu_is_subpage ? 1 : TARGET_PAGE_SIZE;
     return ret;
-- 
2.25.1


