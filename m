Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 960C61C397F
	for <lists+qemu-devel@lfdr.de>; Mon,  4 May 2020 14:38:15 +0200 (CEST)
Received: from localhost ([::1]:52944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVaMQ-0000DB-LA
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 08:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jVaHg-0008GS-8H
 for qemu-devel@nongnu.org; Mon, 04 May 2020 08:33:20 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:56267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jVaHf-0000k4-9w
 for qemu-devel@nongnu.org; Mon, 04 May 2020 08:33:19 -0400
Received: by mail-wm1-x332.google.com with SMTP id e26so8234134wmk.5
 for <qemu-devel@nongnu.org>; Mon, 04 May 2020 05:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TMW8YHXkbMkDDM0tj/I4/jG2iVg72cOVyZkRU2LK7Xk=;
 b=dZTuk860fKQZ45kXm5FY2b/0nD/Ul8E/DWwdcbFYZsGM/WeloTCVq6C4soehHSUh46
 cQODeNR1y/HmXpCmvxF7AeAjBmL/CxG4rLYgacz7ICu+IWzkCYFp2RS5jxj0haTV37gq
 TvMrIAAsC+g6xUhl5+ULZvxjFtOUjnUiXr8rFds345tUCX32bGWMMwL8M13MGVU5WYxc
 NEfnjShehxZlPhwexiKn8MqpEFj96jhG24xuj+Ht0WXuhAtOvcc8LRz/+0absVUnn5M8
 /Tvc94ImOiUVzV9k0lC85bYsMY3QMSeopcKfmFVK5q2+It3U4c1s/vwB25e7872/9vyK
 YvwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TMW8YHXkbMkDDM0tj/I4/jG2iVg72cOVyZkRU2LK7Xk=;
 b=aIN7wbm/6NmiNLlq7CfttFrvMBFUD2olchYPFI7T+x1O3Z9GVfA6e+LANRwt0Z7xly
 YOVzptpOhYzQm3hZz8lGOU8+4qSZbTLHqLG0oSrUy/tGH7NPhPJwY3qDBq/P3uIUwsIh
 4jybFtkAJecm6BilecXT8DsBwA5ccCGxjRSR/YHkIoVZUhdpzBTrxDyCKOah8UZSDXXH
 TOLYOwldwUhR0UKUtM263dkurHDdc9QouYvu7IK/isBKOpX5uYR5ZN/xfQf1Tjoz0QT+
 +MIugMY8aOn/xm9elLFgSfUULlqpkQemgz0CxNFEcTPoLXhqtHTBczkH2+nYRMzfFktz
 Pu1g==
X-Gm-Message-State: AGi0PubyxRNrxcFVtxr3zY7NDVq/4K2wl6rzeJ2932mzGMTRG9JXReet
 zKLSnf3t9H5c03Z1zDDOdbzYx+zjvxc3rg==
X-Google-Smtp-Source: APiQypLh4SvZTjBiNFH0oJLvI+EDMxSufZ3i1IQmGbGV8xn28UsmIhEX2vzSkOyDbRWa33eNODqipw==
X-Received: by 2002:a05:600c:1:: with SMTP id
 g1mr14143378wmc.142.1588595597558; 
 Mon, 04 May 2020 05:33:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q4sm12253608wrx.9.2020.05.04.05.33.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 05:33:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/39] target/arm: Add new 's1_is_el0' argument to
 get_phys_addr_lpae()
Date: Mon,  4 May 2020 13:32:35 +0100
Message-Id: <20200504123309.3808-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200504123309.3808-1-peter.maydell@linaro.org>
References: <20200504123309.3808-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

For ARMv8.2-TTS2UXN, the stage 2 page table walk wants to know
whether the stage 1 access is for EL0 or not, because whether
exec permission is given can depend on whether this is an EL0
or EL1 access. Add a new argument to get_phys_addr_lpae() so
the call sites can pass this information in.

Since get_phys_addr_lpae() doesn't already have a doc comment,
add one so we have a place to put the documentation of the
semantics of the new s1_is_el0 argument.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20200330210400.11724-4-peter.maydell@linaro.org
---
 target/arm/helper.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f17841ec24e..b26f5801943 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -41,6 +41,7 @@
 
 static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                               bool s1_is_el0,
                                hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
                                target_ulong *page_size_ptr,
                                ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs);
@@ -10053,6 +10054,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
         }
 
         ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, ARMMMUIdx_Stage2,
+                                 false,
                                  &s2pa, &txattrs, &s2prot, &s2size, fi,
                                  pcacheattrs);
         if (ret) {
@@ -10655,8 +10657,32 @@ static ARMVAParameters aa32_va_parameters(CPUARMState *env, uint32_t va,
     };
 }
 
+/**
+ * get_phys_addr_lpae: perform one stage of page table walk, LPAE format
+ *
+ * Returns false if the translation was successful. Otherwise, phys_ptr, attrs,
+ * prot and page_size may not be filled in, and the populated fsr value provides
+ * information on why the translation aborted, in the format of a long-format
+ * DFSR/IFSR fault register, with the following caveats:
+ *  * the WnR bit is never set (the caller must do this).
+ *
+ * @env: CPUARMState
+ * @address: virtual address to get physical address for
+ * @access_type: MMU_DATA_LOAD, MMU_DATA_STORE or MMU_INST_FETCH
+ * @mmu_idx: MMU index indicating required translation regime
+ * @s1_is_el0: if @mmu_idx is ARMMMUIdx_Stage2 (so this is a stage 2 page table
+ *             walk), must be true if this is stage 2 of a stage 1+2 walk for an
+ *             EL0 access). If @mmu_idx is anything else, @s1_is_el0 is ignored.
+ * @phys_ptr: set to the physical address corresponding to the virtual address
+ * @attrs: set to the memory transaction attributes to use
+ * @prot: set to the permissions for the page containing phys_ptr
+ * @page_size_ptr: set to the size of the page containing phys_ptr
+ * @fi: set to fault info if the translation fails
+ * @cacheattrs: (if non-NULL) set to the cacheability/shareability attributes
+ */
 static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                               bool s1_is_el0,
                                hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
                                target_ulong *page_size_ptr,
                                ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
@@ -11748,6 +11774,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
 
             /* S1 is done. Now do S2 translation.  */
             ret = get_phys_addr_lpae(env, ipa, access_type, ARMMMUIdx_Stage2,
+                                     mmu_idx == ARMMMUIdx_E10_0,
                                      phys_ptr, attrs, &s2_prot,
                                      page_size, fi,
                                      cacheattrs != NULL ? &cacheattrs2 : NULL);
@@ -11872,7 +11899,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
     }
 
     if (regime_using_lpae_format(env, mmu_idx)) {
-        return get_phys_addr_lpae(env, address, access_type, mmu_idx,
+        return get_phys_addr_lpae(env, address, access_type, mmu_idx, false,
                                   phys_ptr, attrs, prot, page_size,
                                   fi, cacheattrs);
     } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
-- 
2.20.1


