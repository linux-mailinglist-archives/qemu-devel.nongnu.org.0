Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AF65E69B3
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 19:35:21 +0200 (CEST)
Received: from localhost ([::1]:45652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obQ6a-0002bg-18
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 13:35:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPB0-0002Ay-JV
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:35:59 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPAy-0005Ps-U6
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:35:50 -0400
Received: by mail-wr1-x431.google.com with SMTP id bq9so16458338wrb.4
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=S7xMDGIoF+c3kK5sdvwsAuiDPlnfpu+Z56njaQYlxFw=;
 b=Qw7S/BuJ0JGisSaJjPXDNh3J63eWA3pZiSUVRcGDCGReZpKK/YHIceoMHj50KCWHfL
 ZfZnHtnpn6qZESePGmmjh2FvgduZ53YdnmmhrYg3XXdhgCI8iuR3pIUXBLU496qZev6n
 8t/umVAoDSWZLZEOIUvn6/1gd2mTiWllMUsBOkpSO070pWiMOI8IHIeuUj72neY95W9x
 yyLbFewUciaLiKuFDNJiLrM+ux97W3Ws1P1jA3X4ryxB1Z1MqkpWvpUKSvCuKF7fgWBv
 134+z1Ve3HPZvX36fJWnboTKUXSu3LHxDU5Qc5TZV+RyIOKUnX2Ys/eHF/7dh0YT4leS
 dK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=S7xMDGIoF+c3kK5sdvwsAuiDPlnfpu+Z56njaQYlxFw=;
 b=B8UL4uCHjcLuVvwpk3GXOVO91Rcm1zhjnU7OHkw7qlYSlG5oUN7mic4XqWQceLaxDB
 BtPiWtKnFezDGquPc14X3QrRvS23VoWPQ09U3q7+xgGnPmHHJIBHRTfXiXteIQVZ0OJl
 dCADNbDwjwMOVbHc32tOC9tZVsx5U6ROFhEF7B6etmP7UBBli1T7M5rXj0CuYUg8sZ5s
 kuVKEN9Qr2u7csTEsFkwGMSKHdwqw+Q3+0S0nu/hns5JklAsvi065tSmWfQ0QJ5Ug5TL
 IyEANejy2H9JvAQ10ROZ0ygyTYIpjjvdioJ7VS9jspWH0QrRKIGXhz9rydgtapvVrWwD
 Yezw==
X-Gm-Message-State: ACrzQf0c2z4/qPkheHW0HBneowlpU7yk3tcmAfZBFi7/oDxh4J9+hfzx
 c5P7zvcGwZhXSBrJ6gsg1cgBOlYDcGpCdA==
X-Google-Smtp-Source: AMsMyM7COy6DMtTzN+MuSfzszNpwJPUUQJRa9p8cqpDPQ1Dn2qtjGX4kRGB4jAVBTARdUfqwo4kl0A==
X-Received: by 2002:a5d:4a48:0:b0:22a:e55d:535d with SMTP id
 v8-20020a5d4a48000000b0022ae55d535dmr2633093wrs.308.1663864547527; 
 Thu, 22 Sep 2022 09:35:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.35.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:35:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/39] target/arm: Add secure parameter to pmsav8_mpu_lookup
Date: Thu, 22 Sep 2022 17:35:10 +0100
Message-Id: <20220922163536.1096175-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

Remove the use of regime_is_secure from pmsav8_mpu_lookup,
passing the new parameter to the lookup instead.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220822152741.1617527-13-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 4 ++--
 target/arm/m_helper.c  | 2 +-
 target/arm/ptw.c       | 7 +++----
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index e97f5c3d47e..307a5965053 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1152,8 +1152,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
 
 bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                        MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                       GetPhysAddrResult *result, ARMMMUFaultInfo *fi,
-                       uint32_t *mregion);
+                       bool is_secure, GetPhysAddrResult *result,
+                       ARMMMUFaultInfo *fi, uint32_t *mregion);
 
 void arm_log_exception(CPUState *cs);
 
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 45fbf195590..5ee4ee15b36 100644
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
index 74d2f63359f..308a9cc3ac9 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1701,8 +1701,8 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
 
 bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                        MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                       GetPhysAddrResult *result, ARMMMUFaultInfo *fi,
-                       uint32_t *mregion)
+                       bool secure, GetPhysAddrResult *result,
+                       ARMMMUFaultInfo *fi, uint32_t *mregion)
 {
     /*
      * Perform a PMSAv8 MPU lookup (without also doing the SAU check
@@ -1716,7 +1716,6 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
      */
     ARMCPU *cpu = env_archcpu(env);
     bool is_user = regime_is_user(env, mmu_idx);
-    uint32_t secure = regime_is_secure(env, mmu_idx);
     int n;
     int matchregion = -1;
     bool hit = false;
@@ -2035,7 +2034,7 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
         }
     }
 
-    ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx,
+    ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx, secure,
                             result, fi, NULL);
     if (sattrs.subpage) {
         result->page_size = 1;
-- 
2.25.1


