Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D796C8D9D
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Mar 2023 12:52:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pg2Pz-0002Wx-Hs; Sat, 25 Mar 2023 07:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2Py-0002W4-46
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 07:50:42 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2Pw-0007QM-F0
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 07:50:41 -0400
Received: by mail-io1-xd30.google.com with SMTP id d22so862995iow.12
 for <qemu-devel@nongnu.org>; Sat, 25 Mar 2023 04:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679745038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xWmme+fxH4a6wPZVVNKR2HtNDEn7qkz5eBGWEW59Xpg=;
 b=Pl7DDwmsjxGeSWIxdzkgfux7VMWXBxKrFJN03KTbD8XSyMTkte2w3BROLIN5vrmj/h
 r0ADN9C0vuKUYlXkHH8NBe6lAAOlTis2PzSAC3LWSxMu672EzbvzTLN4xvVDq95U96nv
 8c5FZkjufjS0x9CwC4beYJGUXi/dGzsYWrsmbZQBwNDvldEwMfmaQ+ySH6Ijc3EkTti6
 azoq8d/9mPsC0L/cL8IykN5kaxEDr7PW/wm8yNob99kmZYP2cgTKE2/Ys3VSvKSjGgU3
 aWIyzh+uUFFJSRdyVrCkr2BLxx1mr0fIm+F6XM4JuxxElAuEWu3TfC5n6Hetnb5ReTO6
 3s8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679745038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xWmme+fxH4a6wPZVVNKR2HtNDEn7qkz5eBGWEW59Xpg=;
 b=hEcSR9Ck2Cf3dxmPU2bdI9a9V9t+OX+a/lUyj3EPsttFoh4UsL2DG6baFHVk1MD12r
 9pupFP/X/46hq/toG+wInmvfnV0BqjEkJvZcxucDmHBuRlhT14U4dGHMl3ikskl8Aix2
 i1Iyx5ZjzFO2m3A+mLi9xtDZvpaymX8qbv4ZcKcbDPux+1BqX2Xy39ZsZ8tLhjigU955
 rWh2+DmShCubXsbQnx9EyBuPWloZOULkVVs6AOs8N3oE/UAgFpWNSOFgQjZ48FqwycPw
 /Lxx3lGbfqCvQWPRh1spewZsbSW80bQvBYPCaqLZyCv8QHhSGT7VSD0yWQtnYiQYAmmf
 D+dg==
X-Gm-Message-State: AO0yUKX/WabnRiLKI1W0DaKM3xEo2OWTKSn1rApeWoT6U9QfqhCJYPAW
 Zl3Z//rbclnXc+ia6LIS6mdAgtGVg3jqhnnNix8=
X-Google-Smtp-Source: AKy350ac3anxrKNQa2xHTKiWK/XRj+qje8wZgYkl1j47bz+LLKvQ3z3yNVkNTU8p0q43d1jp+oHWhA==
X-Received: by 2002:a17:90a:2d6:b0:234:5d3c:b02b with SMTP id
 d22-20020a17090a02d600b002345d3cb02bmr5666391pjd.42.1679741691917; 
 Sat, 25 Mar 2023 03:54:51 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Subject: [PATCH v6 24/25] target/riscv: Reorg access check in
 get_physical_address
Date: Sat, 25 Mar 2023 03:54:28 -0700
Message-Id: <20230325105429.1142530-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd30.google.com
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

We were effectively computing the protection bits twice,
once while performing access checks and once while returning
the valid bits to the caller.  Reorg so we do this once.

Move the computation of mxr close to its single use.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 69 ++++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 33 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 82a7c5f9dd..725ca45106 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -762,7 +762,7 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot,
  * @is_debug: Is this access from a debugger or the monitor?
  */
 static int get_physical_address(CPURISCVState *env, hwaddr *physical,
-                                int *prot, target_ulong addr,
+                                int *ret_prot, target_ulong addr,
                                 target_ulong *fault_pte_addr,
                                 int access_type, int mmu_idx,
                                 bool first_stage, bool two_stage,
@@ -793,20 +793,14 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
 
     if (mode == PRV_M || !riscv_cpu_cfg(env)->mmu) {
         *physical = addr;
-        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        *ret_prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
         return TRANSLATE_SUCCESS;
     }
 
-    *prot = 0;
+    *ret_prot = 0;
 
     hwaddr base;
-    int levels, ptidxbits, ptesize, vm, sum, mxr, widened;
-
-    if (first_stage == true) {
-        mxr = get_field(env->mstatus, MSTATUS_MXR);
-    } else {
-        mxr = get_field(env->vsstatus, MSTATUS_MXR);
-    }
+    int levels, ptidxbits, ptesize, vm, sum, widened;
 
     if (first_stage == true) {
         if (use_background) {
@@ -849,7 +843,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
       levels = 5; ptidxbits = 9; ptesize = 8; break;
     case VM_1_10_MBARE:
         *physical = addr;
-        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        *ret_prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
         return TRANSLATE_SUCCESS;
     default:
       g_assert_not_reached();
@@ -984,6 +978,27 @@ restart:
         return TRANSLATE_FAIL;
     }
 
+    int prot = 0;
+    if (pte & PTE_R) {
+        prot |= PAGE_READ;
+    }
+    if (pte & PTE_W) {
+        prot |= PAGE_WRITE;
+    }
+    if (pte & PTE_X) {
+        bool mxr;
+
+        if (first_stage == true) {
+            mxr = get_field(env->mstatus, MSTATUS_MXR);
+        } else {
+            mxr = get_field(env->vsstatus, MSTATUS_MXR);
+        }
+        if (mxr) {
+            prot |= PAGE_READ;
+        }
+        prot |= PAGE_EXEC;
+    }
+
     if ((pte & PTE_U) &&
         ((mode != PRV_U) && (!sum || access_type == MMU_INST_FETCH))) {
         /*
@@ -996,17 +1011,9 @@ restart:
         /* Supervisor PTE flags when not S mode */
         return TRANSLATE_FAIL;
     }
-    if (access_type == MMU_DATA_LOAD &&
-        !((pte & PTE_R) || ((pte & PTE_X) && mxr))) {
-        /* Read access check failed */
-        return TRANSLATE_FAIL;
-    }
-    if (access_type == MMU_DATA_STORE && !(pte & PTE_W)) {
-        /* Write access check failed */
-        return TRANSLATE_FAIL;
-    }
-    if (access_type == MMU_INST_FETCH && !(pte & PTE_X)) {
-        /* Fetch access check failed */
+
+    if (!((prot >> access_type) & 1)) {
+        /* Access check failed */
         return TRANSLATE_FAIL;
     }
 
@@ -1071,20 +1078,16 @@ restart:
                   (vpn & (((target_ulong)1 << ptshift) - 1))
                  ) << PGSHIFT) | (addr & ~TARGET_PAGE_MASK);
 
-    /* set permissions on the TLB entry */
-    if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
-        *prot |= PAGE_READ;
-    }
-    if (pte & PTE_X) {
-        *prot |= PAGE_EXEC;
-    }
     /*
-     * Add write permission on stores or if the page is already dirty,
-     * so that we TLB miss on later writes to update the dirty bit.
+     * Remove write permission unless this is a store, or the page is
+     * already dirty, so that we TLB miss on later writes to update
+     * the dirty bit.
      */
-    if ((pte & PTE_W) && (access_type == MMU_DATA_STORE || (pte & PTE_D))) {
-        *prot |= PAGE_WRITE;
+    if (access_type != MMU_DATA_STORE && !(pte & PTE_D)) {
+        prot &= ~PAGE_WRITE;
     }
+    *ret_prot = prot;
+
     return TRANSLATE_SUCCESS;
 }
 
-- 
2.34.1


