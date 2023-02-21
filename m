Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC12D69D965
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 04:42:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUJXI-0005wp-0L; Mon, 20 Feb 2023 22:41:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUJX6-0005rV-Sx
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 22:41:37 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUJX4-0005ni-1T
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 22:41:36 -0500
Received: by mail-pj1-x1032.google.com with SMTP id u10so3311212pjc.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 19:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=USvyAWS7YOmlNqdzjMZCrgQ9PLeHSNl5QsdKClpEEQE=;
 b=VJSlB+IthyNd5xGbDwPNfOHWJzFrxxwlNLpKSGrcRCkeh5AKVQvmqApq5hekejityD
 4cd0Ji+4CJ7mxn8lpqdG37OFqAQqc7lzGlFdTq6lTs0b9NZ+xKtFh5LrPTRRYIc1HZ7m
 AD676o7cNgYsU3a9/yEuXYrIbmT1wUWFjaREu8dtN0gs0S12/4MUDYijDKJ4/adzpvS/
 0XghpoP1y52oBei/OUM8Yrub5hS68resd7g47poajDOYP/TnZbfeM/k/It9cGxk2n6G4
 29kqPW9P6yV7Mgmxw87W3b5EhtJGtoBrq7i0Uk3+PSyg30bZNReszyUI1NSfmbGPUvHe
 0uag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=USvyAWS7YOmlNqdzjMZCrgQ9PLeHSNl5QsdKClpEEQE=;
 b=8QLRwBaQeQ4Z8H8BcMRZQLhEQdqZ+XzO214Fh6cboDLA9WQdOZd35d6BosKWBEh+p6
 f3M9GYVgjCHWPc7H3zO8yEWDdiJizUHtNX3X1IxEFajM8HpwoKSVXeU17g77HrFMTVXT
 IgJ2O8dCcOzTlGXb8r8D7HGY/wj7c7rtIOScoMscH7aShIJHM/esx3gvYXXLBEMJXBS8
 sVAfDlcRa1trLMKuL+dJK7Iwgpred0OzCwrZpBGUvLcgWODpllpSWVC+EjBzsr4mSPYW
 l/zEqUBNXyxtUvWFlpbFP1jtY2CxnsMkIEXIKiqUwfKi2F/xb4I0OWqILBBLNUyxJQKI
 WYXg==
X-Gm-Message-State: AO0yUKUzxyYjzzGACO6z9ZKyqx810HTQuvn65PPOxWnLy4vEIRwGTcE0
 QiBYISAXTXEbE3GftdS8QCPeLRE+2P31TvG8PjA=
X-Google-Smtp-Source: AK7set/dBXgpaToQ3NRQjHLmF7P9qsPu1IVPtugAieLUXw3XJ83B6sWhdOsm+PjIYloASpc+d6gdxA==
X-Received: by 2002:a17:902:f90d:b0:19a:8680:ba87 with SMTP id
 kw13-20020a170902f90d00b0019a8680ba87mr3014347plb.11.1676950887157; 
 Mon, 20 Feb 2023 19:41:27 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a170902c1c400b0019a88c1cf63sm69851plc.180.2023.02.20.19.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 19:41:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 1/2] Revert "target/arm: Merge regime_is_secure into
 get_phys_addr"
Date: Mon, 20 Feb 2023 17:41:21 -1000
Message-Id: <20230221034122.471707-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230221034122.471707-1-richard.henderson@linaro.org>
References: <20230221034122.471707-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

This reverts commit 03bea66e7fa3af42976ceafb20512c59abf2e699,
but restore into ptw.c instead of internals.h.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 2b125fff44..cb073ac477 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2926,12 +2926,9 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
                                      result, fi);
 }
 
-bool get_phys_addr(CPUARMState *env, target_ulong address,
-                   MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                   GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
+/* Return true if this address translation regime is secure */
+static bool regime_is_secure(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
-    bool is_secure;
-
     switch (mmu_idx) {
     case ARMMMUIdx_E10_0:
     case ARMMMUIdx_E10_1:
@@ -2943,16 +2940,14 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
     case ARMMMUIdx_Stage1_E1:
     case ARMMMUIdx_Stage1_E1_PAN:
     case ARMMMUIdx_E2:
-        is_secure = arm_is_secure_below_el3(env);
-        break;
+        return arm_is_secure_below_el3(env);
     case ARMMMUIdx_Stage2:
     case ARMMMUIdx_Phys_NS:
     case ARMMMUIdx_MPrivNegPri:
     case ARMMMUIdx_MUserNegPri:
     case ARMMMUIdx_MPriv:
     case ARMMMUIdx_MUser:
-        is_secure = false;
-        break;
+        return false;
     case ARMMMUIdx_E3:
     case ARMMMUIdx_Stage2_S:
     case ARMMMUIdx_Phys_S:
@@ -2960,13 +2955,18 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
     case ARMMMUIdx_MSUserNegPri:
     case ARMMMUIdx_MSPriv:
     case ARMMMUIdx_MSUser:
-        is_secure = true;
-        break;
-    default:
-        g_assert_not_reached();
+        return true;
     }
+    g_assert_not_reached();
+}
+
+bool get_phys_addr(CPUARMState *env, target_ulong address,
+                   MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                   GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
+{
     return get_phys_addr_with_secure(env, address, access_type, mmu_idx,
-                                     is_secure, result, fi);
+                                     regime_is_secure(env, mmu_idx),
+                                     result, fi);
 }
 
 hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
-- 
2.34.1


