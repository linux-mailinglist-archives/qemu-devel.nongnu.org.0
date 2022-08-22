Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAA559C44A
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 18:41:16 +0200 (CEST)
Received: from localhost ([::1]:52182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQAUF-0003GI-3G
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 12:41:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LK-0007PD-JS
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:27:58 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:40678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LF-0000hz-KU
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:27:58 -0400
Received: by mail-pg1-x531.google.com with SMTP id w13so4594318pgq.7
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=6BDOSEGT0y+2WOd0fksOzxPg5dHDpE5xNyJzQhM+fiE=;
 b=cFycs40/bI4iLxYIEV+3tJl+X1dcA01yjKub0OSaS/vN4dzw0/vlwM2bd/kPps2WHP
 pbHi19bmpTWYXLNieKvGKnM1PjZoXFdgpXNUBjhPaCj9Ym12+yuJbJGrtb/Q19pE7Cj6
 ccVwsI0gDQLqrF1HSUQKxiFQ60EI0iJSNf877xbcfS+55ZFC+f9kxFSg+QyH5GwHsPF7
 00Rk3jaZ+Ke42l20XMpf5oVI3A+irqyty8EsdjXqPIlgulf6cb8/LuloualDg0koZs9f
 pCbZXjY2kUBNuyZkgHzqHeCgfmleBvBU3oU1U/G0+dT6gzFaRHdLKr2Py5adoFvpCPGm
 hJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=6BDOSEGT0y+2WOd0fksOzxPg5dHDpE5xNyJzQhM+fiE=;
 b=F1rm0ChrY6WVNQfb6IStxxi2fltRx29KJTq1+HGvoqO3OIpUMV5cOwbHKDWE/CDzUe
 U4NVjLZsL+xiBlGsMrWObq8v7W0WawrldH4R3a20ytTgLARDPVfThH/hq9P8mWgZRc9Y
 3jeP8HCrA1HwasLmS6c18J2Kofg0NuMXIv40TWgMJGvdJ8pnpC0AMvByr9huMhqRvDzL
 llMMsWrLBZuo9IoWW6FVDfNhKbDosp/QTXeXKzL/pPn+t+OeV7aRLWs8f+5ydKK1f3y+
 yCXhhJyVmggE3IoTCzZEmoqfq8dEJRYFIs59i+x8SLjnzRWY/1PupBL2kUOkqg8qIbUB
 Hs2A==
X-Gm-Message-State: ACgBeo260+qnfBF6tpqie57JDfDJ3A/0XydyH3N19+eByIqa0CwAF1E6
 lqt7NCXmySSqRgwzWkvapzU1f/JC/qvtEA==
X-Google-Smtp-Source: AA6agR4C1HJtRRno8ZIx1EG7R6feIg4X8IhkgbAvcr0jzX3kG85S9FVFM0fPYWcU2ZNeH+26UwHDMQ==
X-Received: by 2002:a05:6a00:1c69:b0:536:ccaf:c551 with SMTP id
 s41-20020a056a001c6900b00536ccafc551mr2766243pfw.59.1661182072289; 
 Mon, 22 Aug 2022 08:27:52 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:27:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 12/66] target/arm: Add secure parameter to pmsav8_mpu_lookup
Date: Mon, 22 Aug 2022 08:26:47 -0700
Message-Id: <20220822152741.1617527-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

Remove the use of regime_is_secure from pmsav8_mpu_lookup,
passing the new parameter to the lookup instead.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 4 ++--
 target/arm/m_helper.c  | 2 +-
 target/arm/ptw.c       | 7 +++----
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 7f3b5bb406..ee40f41c12 100644
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
index bbfb80f4dd..5628581ddc 100644
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
@@ -1715,7 +1715,6 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
      */
     ARMCPU *cpu = env_archcpu(env);
     bool is_user = regime_is_user(env, mmu_idx);
-    uint32_t secure = regime_is_secure(env, mmu_idx);
     int n;
     int matchregion = -1;
     bool hit = false;
@@ -2034,7 +2033,7 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
         }
     }
 
-    ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx,
+    ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx, secure,
                             result, fi, NULL);
     if (sattrs.subpage) {
         result->page_size = 1;
-- 
2.34.1


