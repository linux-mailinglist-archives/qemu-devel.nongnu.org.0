Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B566D2308
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 16:52:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piG5i-0000ah-CH; Fri, 31 Mar 2023 10:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1piG5c-0000ZK-A6
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 10:50:52 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1piG5Y-0000bY-Mu
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 10:50:51 -0400
Received: by mail-wr1-x42d.google.com with SMTP id e18so22690599wra.9
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 07:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680274247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lxHwKmEkcI9a9cB3NtBeKtlKzdxzWz/JBHE/okIH9Ik=;
 b=VoCODkxFyuo15LAlwYAAEIujOQypvws9LzQ2YyxyCutoHMnGkjwW7WukAvKVuIeL81
 KYt0nZ+zHQu4HjpBLVrvv1hjxlgmg/1aJnCnbZeqp6ML27C7arO/r6g9+bCJNKsYQe8k
 /RtIy0JKxhGjwSjB8uotvSWRRLmj7Enn0kZwhZMGxEWCjKS9msNuuA8CRh8LfZzk5TJH
 rbwrqGhcw4ENHtJR3htctdyEzcFtycj9/zY+GPkKqpKCHxwILgHq0ua+LvzNkEIIvBT5
 OiHAZeTH295TgYZaw8g8iAoopVmYZnDxaKRWbgyNs4g8lj05ELLAerOFyqaTj1S6iyUF
 ywgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680274247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lxHwKmEkcI9a9cB3NtBeKtlKzdxzWz/JBHE/okIH9Ik=;
 b=qt334JSBcEoti5Tb5/fGVzLsp6ywIQAr3i0mUpFj+xlBBDs3QMbmk5EneF+D8bJFW7
 YjTX7DwHx4iHjTRzqEBOzyp1Xiyr1ovhysOI/UFIwv2YI1pfHntgPYcXoZw1kH9LrrmR
 M6fxWm8QlW1Rd8vmT+4Xj/Ooq3FdClaNMXQQ8Ae1IBANUNnyghFK0NjvX5Jq8aqiEK9k
 tFdap008QEWIMhglQEAqQFuVnD+MX1UlIcN4BsJFTJ+NtvwVPHp8+5VFebJHPiDA0Mai
 JVTn0YwznGzz6I1IUC2lF+PH/EyX1sBSNd7MPj9C88DWtjmcGzuYLa+A3K6/KBxX5jUJ
 y9+w==
X-Gm-Message-State: AAQBX9eW1QuSQ5/2ZhSQzcOnpYg9Qd+BDgog6ahYs/osjSvZq4eV/7Hw
 EKu33qLgP2mzsqGBxfcQSs4nGA==
X-Google-Smtp-Source: AKy350aCeTChyeM/sREhULRoGc8cuG/o2pUA9VTgfIpljSwnpg9jf11iJgMYU8DS+R+j1TLZtxnAYg==
X-Received: by 2002:a5d:62cd:0:b0:2e4:f53a:45a1 with SMTP id
 o13-20020a5d62cd000000b002e4f53a45a1mr3982609wrv.57.1680274247270; 
 Fri, 31 Mar 2023 07:50:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a5d560c000000b002cfe685bfd6sm2339831wrv.108.2023.03.31.07.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 07:50:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/3] target/arm: Pass ARMMMUFaultInfo to merge_syn_data_abort()
Date: Fri, 31 Mar 2023 15:50:43 +0100
Message-Id: <20230331145045.2584941-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230331145045.2584941-1-peter.maydell@linaro.org>
References: <20230331145045.2584941-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

We already pass merge_syn_data_abort() two fields from the
ARMMMUFaultInfo struct, and we're about to want to use a third field.
Refactor to just pass a pointer to the fault info.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/tlb_helper.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
index 31eb77f7df9..1a61adb8a68 100644
--- a/target/arm/tcg/tlb_helper.c
+++ b/target/arm/tcg/tlb_helper.c
@@ -24,9 +24,9 @@ bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
 }
 
 static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
+                                            ARMMMUFaultInfo *fi,
                                             unsigned int target_el,
-                                            bool same_el, bool ea,
-                                            bool s1ptw, bool is_write,
+                                            bool same_el, bool is_write,
                                             int fsc)
 {
     uint32_t syn;
@@ -43,9 +43,9 @@ static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
      * ISS encoding for an exception from a Data Abort, the
      * ISV field.
      */
-    if (!(template_syn & ARM_EL_ISV) || target_el != 2 || s1ptw) {
+    if (!(template_syn & ARM_EL_ISV) || target_el != 2 || fi->s1ptw) {
         syn = syn_data_abort_no_iss(same_el, 0,
-                                    ea, 0, s1ptw, is_write, fsc);
+                                    fi->ea, 0, fi->s1ptw, is_write, fsc);
     } else {
         /*
          * Fields: IL, ISV, SAS, SSE, SRT, SF and AR come from the template
@@ -54,7 +54,7 @@ static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
          */
         syn = syn_data_abort_with_iss(same_el,
                                       0, 0, 0, 0, 0,
-                                      ea, 0, s1ptw, is_write, fsc,
+                                      fi->ea, 0, fi->s1ptw, is_write, fsc,
                                       true);
         /* Merge the runtime syndrome with the template syndrome.  */
         syn |= template_syn;
@@ -117,9 +117,8 @@ void arm_deliver_fault(ARMCPU *cpu, vaddr addr,
         syn = syn_insn_abort(same_el, fi->ea, fi->s1ptw, fsc);
         exc = EXCP_PREFETCH_ABORT;
     } else {
-        syn = merge_syn_data_abort(env->exception.syndrome, target_el,
-                                   same_el, fi->ea, fi->s1ptw,
-                                   access_type == MMU_DATA_STORE,
+        syn = merge_syn_data_abort(env->exception.syndrome, fi, target_el,
+                                   same_el, access_type == MMU_DATA_STORE,
                                    fsc);
         if (access_type == MMU_DATA_STORE
             && arm_feature(env, ARM_FEATURE_V6)) {
-- 
2.34.1


