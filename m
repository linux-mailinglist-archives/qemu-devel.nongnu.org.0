Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B816A146A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 01:46:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVME0-0000qm-2F; Thu, 23 Feb 2023 19:46:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVMDw-0000px-6c
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 19:46:08 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVMDr-0000dy-Dk
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 19:46:07 -0500
Received: by mail-pg1-x52f.google.com with SMTP id s18so6508285pgq.1
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 16:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+qsAMP9wC738msLcUblh0m3ctb2RJA2SW0IRyhYJPKQ=;
 b=nY4PIFIeeP6BLR+qGEQymKY4j+Ho2leebdspNIEMWrIsQPTO0AS40C+NYC7urFxDoB
 06rV4if2d1rLjQqlvVPRPaQ6ysvHD7iEtw30M6cqW3HhqcRkruOZHbCKa+NvYeuP6Ev4
 omi51K5X2cfqmCQtypFg/THHTR2N0GZc60RFWATtoh2tZkCbG4rh4EsuYM0cvujambEu
 I9yRdcMR909iFpqorj2JE1cPtPGy6AV1b7VXdzi33Itm54ZKMlj3f6CGkEINZvt16P15
 eBXmyFY3juMT1Zyq7DlJLDlrz6b4W1HeCJ5uwXESUMHVviprYD902COOzaxqcfffi4RA
 dQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+qsAMP9wC738msLcUblh0m3ctb2RJA2SW0IRyhYJPKQ=;
 b=UmdXjvxNsVaRcRKTgovkooYbmD7poIw/4QIT7xUHbcFBvzO4mEsCM3FCbVfiKKbtA1
 oK8lG2AReW7XeVIoebOS+HUHxIUeigJcoWDRNqXt5mpFNgn/WwMBTzoy8aQHYcjApqgz
 APwjmfqkIW3sTYlIQi0UxrNV47mb9tBzWJY9M3PAfbr17GF3pnIBujrDyEjG5nw2xzBh
 UXgAO1VwtKnbN67Z+/0s4hHqm/G7j8wwGIw0soMvy93v3q35CMIGv3rHN/vskjFlGBMo
 k0n9zdW/UGQDtgOEJuD/j/1w8Y0PapdQT16afRb5ECr2d0SdE4RrkooRyxwt4M3qb+8L
 vHlQ==
X-Gm-Message-State: AO0yUKWZILFTsToih9UzOGsO7jzb+tNpRileHROM5nbWXw5HCkagzmmq
 yvDB+f4/G/vjvcTGPvNXpAIrAHfAOBSdAoNKqj4=
X-Google-Smtp-Source: AK7set/Wjg6OroyvLfVE5HKjC6W2xgb6hucSjRRXYNF1VL/tPJQg2fRpb9ZVzNXF90XtkMTG4lEAMQ==
X-Received: by 2002:a05:6a00:4ac4:b0:5a9:cad5:b283 with SMTP id
 ds4-20020a056a004ac400b005a9cad5b283mr12807217pfb.14.1677199561642; 
 Thu, 23 Feb 2023 16:46:01 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 c9-20020aa78e09000000b005dfc8a35793sm971353pfr.38.2023.02.23.16.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 16:46:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: dbarboza@ventanamicro.com
Subject: [PATCH] accel/tcg: Add 'size' param to probe_access_full
Date: Thu, 23 Feb 2023 14:45:58 -1000
Message-Id: <20230224004558.1313614-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

Change to match the recent change to probe_access_flags.
All existing callers updated to supply 0, so no change in behaviour.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h              | 2 +-
 accel/tcg/cputlb.c                   | 4 ++--
 target/arm/mte_helper.c              | 4 ++--
 target/arm/ptw.c                     | 2 +-
 target/arm/sve_helper.c              | 2 +-
 target/arm/translate-a64.c           | 2 +-
 target/i386/tcg/sysemu/excp_helper.c | 4 ++--
 7 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 165b050872..b631832e17 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -475,7 +475,7 @@ int probe_access_flags(CPUArchState *env, target_ulong addr, int size,
  * and must be consumed or copied immediately, before any further
  * access or changes to TLB @mmu_idx.
  */
-int probe_access_full(CPUArchState *env, target_ulong addr,
+int probe_access_full(CPUArchState *env, target_ulong addr, int size,
                       MMUAccessType access_type, int mmu_idx,
                       bool nonfault, void **phost,
                       CPUTLBEntryFull **pfull, uintptr_t retaddr);
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index fc27e34457..008ae7a66d 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1589,12 +1589,12 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
     return flags;
 }
 
-int probe_access_full(CPUArchState *env, target_ulong addr,
+int probe_access_full(CPUArchState *env, target_ulong addr, int size,
                       MMUAccessType access_type, int mmu_idx,
                       bool nonfault, void **phost, CPUTLBEntryFull **pfull,
                       uintptr_t retaddr)
 {
-    int flags = probe_access_internal(env, addr, 0, access_type, mmu_idx,
+    int flags = probe_access_internal(env, addr, size, access_type, mmu_idx,
                                       nonfault, phost, pfull, retaddr);
 
     /* Handle clean RAM pages.  */
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 98bcf59c22..fee3c7eb96 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -118,7 +118,7 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
      * valid.  Indicate to probe_access_flags no-fault, then assert that
      * we received a valid page.
      */
-    flags = probe_access_full(env, ptr, ptr_access, ptr_mmu_idx,
+    flags = probe_access_full(env, ptr, 0, ptr_access, ptr_mmu_idx,
                               ra == 0, &host, &full, ra);
     assert(!(flags & TLB_INVALID_MASK));
 
@@ -154,7 +154,7 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
      */
     in_page = -(ptr | TARGET_PAGE_MASK);
     if (unlikely(ptr_size > in_page)) {
-        flags |= probe_access_full(env, ptr + in_page, ptr_access,
+        flags |= probe_access_full(env, ptr + in_page, 0, ptr_access,
                                    ptr_mmu_idx, ra == 0, &host, &full, ra);
         assert(!(flags & TLB_INVALID_MASK));
     }
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 1ecefb2027..d92cdc9733 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -258,7 +258,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         int flags;
 
         env->tlb_fi = fi;
-        flags = probe_access_full(env, addr, MMU_DATA_LOAD,
+        flags = probe_access_full(env, addr, 0, MMU_DATA_LOAD,
                                   arm_to_core_mmu_idx(s2_mmu_idx),
                                   true, &ptw->out_host, &full, 0);
         env->tlb_fi = NULL;
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 51909c44ac..9a8951afa4 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -5356,7 +5356,7 @@ bool sve_probe_page(SVEHostPage *info, bool nofault, CPUARMState *env,
                                &info->host, retaddr);
 #else
     CPUTLBEntryFull *full;
-    flags = probe_access_full(env, addr, access_type, mmu_idx, nofault,
+    flags = probe_access_full(env, addr, 0, access_type, mmu_idx, nofault,
                               &info->host, &full, retaddr);
 #endif
     info->flags = flags;
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index da9f877476..67e9c4ee79 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14651,7 +14651,7 @@ static bool is_guarded_page(CPUARMState *env, DisasContext *s)
      * that the TLB entry must be present and valid, and thus this
      * access will never raise an exception.
      */
-    flags = probe_access_full(env, addr, MMU_INST_FETCH, mmu_idx,
+    flags = probe_access_full(env, addr, 0, MMU_INST_FETCH, mmu_idx,
                               false, &host, &full, 0);
     assert(!(flags & TLB_INVALID_MASK));
 
diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index 55bd1194d3..e87f90dbe3 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -64,7 +64,7 @@ static bool ptw_translate(PTETranslate *inout, hwaddr addr)
     int flags;
 
     inout->gaddr = addr;
-    flags = probe_access_full(inout->env, addr, MMU_DATA_STORE,
+    flags = probe_access_full(inout->env, addr, 0, MMU_DATA_STORE,
                               inout->ptw_idx, true, &inout->haddr, &full, 0);
 
     if (unlikely(flags & TLB_INVALID_MASK)) {
@@ -428,7 +428,7 @@ do_check_protect_pse36:
         CPUTLBEntryFull *full;
         int flags, nested_page_size;
 
-        flags = probe_access_full(env, paddr, access_type,
+        flags = probe_access_full(env, paddr, 0, access_type,
                                   MMU_NESTED_IDX, true,
                                   &pte_trans.haddr, &full, 0);
         if (unlikely(flags & TLB_INVALID_MASK)) {
-- 
2.34.1


