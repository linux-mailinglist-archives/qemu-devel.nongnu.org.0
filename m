Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5486A4F64
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 00:02:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWmVF-0007kP-I8; Mon, 27 Feb 2023 18:01:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmV1-0007ip-8c
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:01:39 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmUz-0000xh-EX
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:01:39 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 y15-20020a17090aa40f00b00237ad8ee3a0so7777121pjp.2
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 15:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1DhgmYrdRtcz8D+NJIKyPDdTEW1LOW9SZeYmEwPQF4o=;
 b=Mia7BNxkaRVi0Dq4tDhPuR5hbzqHAIR/77m6mtkTz9AAFn15RiXJ3pTQYRQX7R2OK9
 7/sqqjxktLTxm37dYlQPhs33lgAyB/G3dA5ZJd6Q/s8N9i9WPUOWdKiITT/y2Ppx0g3L
 fZ6CweMBeoely6ncZAl7SycmMNjoZ3PfYZgZIro71/T/J28ZdH8HGZ8ZRetAebQhC9KK
 MDfw9Mtssv/Sn+ymU590NXM7mKZ/B3cP7wMAXWkOPFJcDCGfO8m/Uw1FL21L3uIyTX2j
 XH5XSwAWMxgho5hxF00P2z4U0vkg88NJcyKs1DHPnVl7TVc+56vPS6bhBhV3Vlxpa4eQ
 ntZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1DhgmYrdRtcz8D+NJIKyPDdTEW1LOW9SZeYmEwPQF4o=;
 b=0B2ERmBuQxO871xMK1ZtsLCVx+b7Nn/4d+RBE0aPUOdhybx6jbgXFTi7GpsVwBk+fs
 KL+olJ8xrdfAGZzPMqIGYfNY63y3b2e92f6Fet5Za8+8AHnIqUU3uPf8xbRx609GQPKU
 0zkLbJJT+vNuFO7CwRNfh+5mYaHlsZ6kAmMDbeptJ0adQ7ikPy1KM/VXf60jHVtCySSs
 5WBdP7670PxvntRV9PAIincBrNDa0dYFiSOVya7IMLwflg4RWMeJJ9Ib6irhyEde3V8j
 +3R6CJjHNmalVy10Yr7MSCPudnw/1NTTE8fd6EvHiYCzCevl/s/lRTdXY0dQKfanmbo4
 Ijog==
X-Gm-Message-State: AO0yUKWZXoKXuIZf2gSSGvJRg8KOFt0V61PTrV2jdIm9QWUEIFbYgdyf
 yXeo6cF/P64qIskaDAZMZt99No/y2vN7eg5LKfU=
X-Google-Smtp-Source: AK7set+S8RV4FuExmWo+9Y7VEmSyArdCJFjM6TR8rPQg48I8s7srZtsOBTSvMlGm/qjhpm3roiXgmA==
X-Received: by 2002:a17:90a:4146:b0:234:b35b:f8e7 with SMTP id
 m6-20020a17090a414600b00234b35bf8e7mr892330pjg.7.1677538896562; 
 Mon, 27 Feb 2023 15:01:36 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a637902000000b0050301745a5dsm4406130pgc.50.2023.02.27.15.01.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 15:01:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-8.0 v4 07/21] target/arm: Adjust the order of Phys and
 Stage2 ARMMMUIdx
Date: Mon, 27 Feb 2023 13:01:08 -1000
Message-Id: <20230227230122.816702-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227230122.816702-1-richard.henderson@linaro.org>
References: <20230227230122.816702-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

It will be helpful to have ARMMMUIdx_Phys_* to be in the same
relative order as ARMSecuritySpace enumerators. This requires
the adjustment to the nstable check. While there, check for being
in secure state rather than rely on clearing the low bit making
no change to non-secure state.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 12 ++++++------
 target/arm/ptw.c | 12 +++++-------
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 203a3e0046..c5fc475cf8 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2855,18 +2855,18 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_E2        = 6 | ARM_MMU_IDX_A,
     ARMMMUIdx_E3        = 7 | ARM_MMU_IDX_A,
 
-    /* TLBs with 1-1 mapping to the physical address spaces. */
-    ARMMMUIdx_Phys_NS   = 8 | ARM_MMU_IDX_A,
-    ARMMMUIdx_Phys_S    = 9 | ARM_MMU_IDX_A,
-
     /*
      * Used for second stage of an S12 page table walk, or for descriptor
      * loads during first stage of an S1 page table walk.  Note that both
      * are in use simultaneously for SecureEL2: the security state for
      * the S2 ptw is selected by the NS bit from the S1 ptw.
      */
-    ARMMMUIdx_Stage2    = 10 | ARM_MMU_IDX_A,
-    ARMMMUIdx_Stage2_S  = 11 | ARM_MMU_IDX_A,
+    ARMMMUIdx_Stage2_S  = 8 | ARM_MMU_IDX_A,
+    ARMMMUIdx_Stage2    = 9 | ARM_MMU_IDX_A,
+
+    /* TLBs with 1-1 mapping to the physical address spaces. */
+    ARMMMUIdx_Phys_S    = 10 | ARM_MMU_IDX_A,
+    ARMMMUIdx_Phys_NS   = 11 | ARM_MMU_IDX_A,
 
     /*
      * These are not allocated TLBs and are used only for AT system
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 89cc7e2aff..5aa58c200c 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1414,16 +1414,14 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     descaddr |= (address >> (stride * (4 - level))) & indexmask;
     descaddr &= ~7ULL;
     nstable = extract32(tableattrs, 4, 1);
-    if (nstable) {
+    if (nstable && ptw->in_secure) {
         /*
          * Stage2_S -> Stage2 or Phys_S -> Phys_NS
-         * Assert that the non-secure idx are even, and relative order.
+         * Assert the relative order of the secure/non-secure indexes.
          */
-        QEMU_BUILD_BUG_ON((ARMMMUIdx_Phys_NS & 1) != 0);
-        QEMU_BUILD_BUG_ON((ARMMMUIdx_Stage2 & 1) != 0);
-        QEMU_BUILD_BUG_ON(ARMMMUIdx_Phys_NS + 1 != ARMMMUIdx_Phys_S);
-        QEMU_BUILD_BUG_ON(ARMMMUIdx_Stage2 + 1 != ARMMMUIdx_Stage2_S);
-        ptw->in_ptw_idx &= ~1;
+        QEMU_BUILD_BUG_ON(ARMMMUIdx_Phys_S + 1 != ARMMMUIdx_Phys_NS);
+        QEMU_BUILD_BUG_ON(ARMMMUIdx_Stage2_S + 1 != ARMMMUIdx_Stage2);
+        ptw->in_ptw_idx += 1;
         ptw->in_secure = false;
     }
     if (!S1_ptw_translate(env, ptw, descaddr, fi)) {
-- 
2.34.1


