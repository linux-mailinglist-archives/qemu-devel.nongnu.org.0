Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D13F85E6B0D
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 20:34:46 +0200 (CEST)
Received: from localhost ([::1]:37086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obR25-0003wy-Fm
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 14:34:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPAy-0002AR-0g
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:35:49 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:50851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPAw-0005P1-3L
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:35:47 -0400
Received: by mail-wm1-x331.google.com with SMTP id ay36so7182404wmb.0
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=lW/oPgeXhT91EvmbPc8n7WToY6I3Ebq62IKaIqyShd4=;
 b=peDWqQocGLGZep/lcTPq1KX6yj0bbg0iOBdiAiyhuFmh7kkLze7/32YHja7YPGo+Xl
 /hn5t4SHEPMRAIgt242G2HO4gm99IcTJYhqKbKZSo4I+/KwfgTnPE0BB/aGSLanjjucr
 rVtvKf5yzOLfObCbs0OKFptV2CXTp1dnMhuR2W7CgBNbFpfy1B/2xNRhL5SajV6Udf5f
 EkEHZ/QwuIuA+PBiLIMASLZ5EuYjAhqjfD4kbGLNxsqrfeJ3j7Adlh/aSEf1cg/dHeAe
 cI9PTCbv7YLdyD3cb1uT31l6pfV3LKz3hCd77zvyi+GgEZch7xNzBgXEyM5II0eD6xrq
 QHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=lW/oPgeXhT91EvmbPc8n7WToY6I3Ebq62IKaIqyShd4=;
 b=fJMl0l2Wd8awiGj6Am50lVRe0mQEo9dNd6i5if8RCloZeq9G9nlJt/eySg2Vud/pOX
 HLMQIRGsWzgj6CyzdnqkW6TIVU7RwpL95dJMkOkC5a4NQZcXQFaKRMZW3ZCEbCNBPiNK
 IX4aD2oW7f25IBxCyb/wFxoGYNndhOxQzvNCrW31K8S+DqIqBoNjXNuvZQdSjukxRciK
 zKiE425px9e6XNer47hEYBS3Cz9xIC/J8E+YN/NvrhgVltJcLL80oXMDzDCrGRdvMXBW
 /ZUGKjIcbnU9ju2TVFEcq89ZYMLik0wPOB5ctpyBjakF85k8xtxh7e1pbV1M7kFCP1oe
 5sKg==
X-Gm-Message-State: ACrzQf02Rk/VCkLXJVJSk0r7P92QBkRxON/xU3o7mPK16NXsLjO54i5f
 A8gNWzyrGe+xU38II6eqz/j0/3lQ4OuXww==
X-Google-Smtp-Source: AMsMyM5VclE3GgPb8bUv368bWRBgU+m5fxpwXeNG3oVEjSDfifwj7vx2NOLhXtfhI6axaI+5BvUdKg==
X-Received: by 2002:a7b:c4c8:0:b0:3b4:76c8:da4f with SMTP id
 g8-20020a7bc4c8000000b003b476c8da4fmr9699947wmk.63.1663864544604; 
 Thu, 22 Sep 2022 09:35:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.35.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:35:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/39] target/arm: Use GetPhysAddrResult in get_phys_addr_pmsav8
Date: Thu, 22 Sep 2022 17:35:06 +0100
Message-Id: <20220922163536.1096175-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Message-id: 20220822152741.1617527-9-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 36b108907fc..2286f6e12db 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1967,8 +1967,7 @@ void v8m_security_lookup(CPUARMState *env, uint32_t address,
 
 static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                 hwaddr *phys_ptr, MemTxAttrs *txattrs,
-                                 int *prot, target_ulong *page_size,
+                                 GetPhysAddrResult *result,
                                  ARMMMUFaultInfo *fi)
 {
     uint32_t secure = regime_is_secure(env, mmu_idx);
@@ -2003,9 +2002,9 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
                 } else {
                     fi->type = ARMFault_QEMU_SFault;
                 }
-                *page_size = sattrs.subpage ? 1 : TARGET_PAGE_SIZE;
-                *phys_ptr = address;
-                *prot = 0;
+                result->page_size = sattrs.subpage ? 1 : TARGET_PAGE_SIZE;
+                result->phys = address;
+                result->prot = 0;
                 return true;
             }
         } else {
@@ -2015,7 +2014,7 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
              * might downgrade a secure access to nonsecure.
              */
             if (sattrs.ns) {
-                txattrs->secure = false;
+                result->attrs.secure = false;
             } else if (!secure) {
                 /*
                  * NS access to S memory must fault.
@@ -2028,17 +2027,19 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
                  * for M_FAKE_FSR_SFAULT in arm_v7m_cpu_do_interrupt().
                  */
                 fi->type = ARMFault_QEMU_SFault;
-                *page_size = sattrs.subpage ? 1 : TARGET_PAGE_SIZE;
-                *phys_ptr = address;
-                *prot = 0;
+                result->page_size = sattrs.subpage ? 1 : TARGET_PAGE_SIZE;
+                result->phys = address;
+                result->prot = 0;
                 return true;
             }
         }
     }
 
-    ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx, phys_ptr,
-                            txattrs, prot, &mpu_is_subpage, fi, NULL);
-    *page_size = sattrs.subpage || mpu_is_subpage ? 1 : TARGET_PAGE_SIZE;
+    ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx,
+                            &result->phys, &result->attrs, &result->prot,
+                            &mpu_is_subpage, fi, NULL);
+    result->page_size =
+        sattrs.subpage || mpu_is_subpage ? 1 : TARGET_PAGE_SIZE;
     return ret;
 }
 
@@ -2416,8 +2417,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         if (arm_feature(env, ARM_FEATURE_V8)) {
             /* PMSAv8 */
             ret = get_phys_addr_pmsav8(env, address, access_type, mmu_idx,
-                                       &result->phys, &result->attrs,
-                                       &result->prot, &result->page_size, fi);
+                                       result, fi);
         } else if (arm_feature(env, ARM_FEATURE_V7)) {
             /* PMSAv7 */
             ret = get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
-- 
2.25.1


