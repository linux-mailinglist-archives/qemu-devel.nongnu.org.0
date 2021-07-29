Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1C33D9ADD
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 03:13:24 +0200 (CEST)
Received: from localhost ([::1]:42660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8ubz-0008Jb-Lz
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 21:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uD7-0005BE-16
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:42 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:36666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uD4-0002sD-GV
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:40 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 ds11-20020a17090b08cbb0290172f971883bso12931689pjb.1
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KtHrCMSK7Nl7NnSRCIKaSQmUffpETjRi2cgM4IGILXk=;
 b=j3GNIJ/sGSFpN9dynQcKz//YSj3thPyDIM2xPSBXsFY7YNjyawt3BLpcgkGMmhlwQx
 UlxJdmNMW5Dbw/YAdQkyNV39lNiDL3qVg8Xb0ogopWVZC1L2eLj2x9srnJxOOB8ADKEX
 fT/FVMf4KSU7hcj53NWSjW8By7UrV7SRM4kp2oERWbj6GPBclEdxUJVVjZ07s9LjNFkc
 lXCw+dFAv2I364nAvS85xvKYa9Jt791URSCuj5R6Kc6Ua64EOzYKv9RR1BmKVY0L13fS
 kwDULizwgkVixdO+/n+Nu6wRALp64xULSneA2IsftFedR5zBUVd0CndCSKMV8BUobHz7
 KhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KtHrCMSK7Nl7NnSRCIKaSQmUffpETjRi2cgM4IGILXk=;
 b=X6CvLZF9Z9+aIVpso3qQtueZmzNoADRbx4UI2doXqm9AyRm5+5E/BvAka49iHGLmdE
 0dXC3a59ygX6+E2vkhCPZnCMBb2wu/3JRYUBJ96RSr58HzDxtFY5QbKhnr57ZivgoQNj
 B/dmav0qQ18JRq4Ydu78R+JOcuxGGUWm2tzeHMEni/5ob1CpSnhUgoblgT6k6tzJSr5L
 hR9juz1YlChWny8KKZUE0texhbxEe9An3S72P40tUMWOjQ8eFrPWRx60JBshvE7/4kYH
 s7E8r9faH2gjsWZ3VneuoN6Brc4w1gshVC3BKu416aLHTvbKzn3TXgGyVDUVUstqpOjf
 oy0A==
X-Gm-Message-State: AOAM531JQBr2U7CJrOMhICf9nrFCg7j5kpTrewEeb3T+fbVRPqnbG5gH
 5z/dsGt1iqh4O/0WwXSBp5+QOP+q7dW4Lg==
X-Google-Smtp-Source: ABdhPJwGlzbJ1pu9nL+NG2oURcEVhKkYZxvUuwb8QaPsVDnJUMIIoMAwwQn0hyuEYoCrDu71ZPSjxg==
X-Received: by 2002:aa7:9ac9:0:b029:377:8e8d:910e with SMTP id
 x9-20020aa79ac90000b02903778e8d910emr2313159pfp.28.1627519655767; 
 Wed, 28 Jul 2021 17:47:35 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:47:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 38/43] target/arm: Use cpu_*_mmu instead of
 helper_*_mmu
Date: Wed, 28 Jul 2021 14:46:42 -1000
Message-Id: <20210729004647.282017-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The helper_*_mmu functions were the only thing available
when this code was written.  This could have been adjusted
when we added cpu_*_mmuidx_ra, but now we can most easily
use the newest set of interfaces.

Cc: qemu-arm@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.c | 52 +++++++----------------------------------
 target/arm/m_helper.c   |  6 ++---
 2 files changed, 11 insertions(+), 47 deletions(-)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index f1a4089a4f..17c0ebebb2 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -512,37 +512,19 @@ uint64_t HELPER(paired_cmpxchg64_le)(CPUARMState *env, uint64_t addr,
     uintptr_t ra = GETPC();
     uint64_t o0, o1;
     bool success;
-
-#ifdef CONFIG_USER_ONLY
-    /* ??? Enforce alignment.  */
-    uint64_t *haddr = g2h(env_cpu(env), addr);
-
-    set_helper_retaddr(ra);
-    o0 = ldq_le_p(haddr + 0);
-    o1 = ldq_le_p(haddr + 1);
-    oldv = int128_make128(o0, o1);
-
-    success = int128_eq(oldv, cmpv);
-    if (success) {
-        stq_le_p(haddr + 0, int128_getlo(newv));
-        stq_le_p(haddr + 1, int128_gethi(newv));
-    }
-    clear_helper_retaddr();
-#else
     int mem_idx = cpu_mmu_index(env, false);
     MemOpIdx oi0 = make_memop_idx(MO_LEQ | MO_ALIGN_16, mem_idx);
     MemOpIdx oi1 = make_memop_idx(MO_LEQ, mem_idx);
 
-    o0 = helper_le_ldq_mmu(env, addr + 0, oi0, ra);
-    o1 = helper_le_ldq_mmu(env, addr + 8, oi1, ra);
+    o0 = cpu_ldq_le_mmu(env, addr + 0, oi0, ra);
+    o1 = cpu_ldq_le_mmu(env, addr + 8, oi1, ra);
     oldv = int128_make128(o0, o1);
 
     success = int128_eq(oldv, cmpv);
     if (success) {
-        helper_le_stq_mmu(env, addr + 0, int128_getlo(newv), oi1, ra);
-        helper_le_stq_mmu(env, addr + 8, int128_gethi(newv), oi1, ra);
+        cpu_stq_le_mmu(env, addr + 0, int128_getlo(newv), oi1, ra);
+        cpu_stq_le_mmu(env, addr + 8, int128_gethi(newv), oi1, ra);
     }
-#endif
 
     return !success;
 }
@@ -582,37 +564,19 @@ uint64_t HELPER(paired_cmpxchg64_be)(CPUARMState *env, uint64_t addr,
     uintptr_t ra = GETPC();
     uint64_t o0, o1;
     bool success;
-
-#ifdef CONFIG_USER_ONLY
-    /* ??? Enforce alignment.  */
-    uint64_t *haddr = g2h(env_cpu(env), addr);
-
-    set_helper_retaddr(ra);
-    o1 = ldq_be_p(haddr + 0);
-    o0 = ldq_be_p(haddr + 1);
-    oldv = int128_make128(o0, o1);
-
-    success = int128_eq(oldv, cmpv);
-    if (success) {
-        stq_be_p(haddr + 0, int128_gethi(newv));
-        stq_be_p(haddr + 1, int128_getlo(newv));
-    }
-    clear_helper_retaddr();
-#else
     int mem_idx = cpu_mmu_index(env, false);
     MemOpIdx oi0 = make_memop_idx(MO_BEQ | MO_ALIGN_16, mem_idx);
     MemOpIdx oi1 = make_memop_idx(MO_BEQ, mem_idx);
 
-    o1 = helper_be_ldq_mmu(env, addr + 0, oi0, ra);
-    o0 = helper_be_ldq_mmu(env, addr + 8, oi1, ra);
+    o1 = cpu_ldq_be_mmu(env, addr + 0, oi0, ra);
+    o0 = cpu_ldq_be_mmu(env, addr + 8, oi1, ra);
     oldv = int128_make128(o0, o1);
 
     success = int128_eq(oldv, cmpv);
     if (success) {
-        helper_be_stq_mmu(env, addr + 0, int128_gethi(newv), oi1, ra);
-        helper_be_stq_mmu(env, addr + 8, int128_getlo(newv), oi1, ra);
+        cpu_stq_be_mmu(env, addr + 0, int128_gethi(newv), oi1, ra);
+        cpu_stq_be_mmu(env, addr + 8, int128_getlo(newv), oi1, ra);
     }
-#endif
 
     return !success;
 }
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index efb522dc44..b6019595f5 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -1947,9 +1947,9 @@ static bool do_v7m_function_return(ARMCPU *cpu)
          * do them as secure, so work out what MMU index that is.
          */
         mmu_idx = arm_v7m_mmu_idx_for_secstate(env, true);
-        oi = make_memop_idx(MO_LE, arm_to_core_mmu_idx(mmu_idx));
-        newpc = helper_le_ldul_mmu(env, frameptr, oi, 0);
-        newpsr = helper_le_ldul_mmu(env, frameptr + 4, oi, 0);
+        oi = make_memop_idx(MO_LEUL, arm_to_core_mmu_idx(mmu_idx));
+        newpc = cpu_ldl_le_mmu(env, frameptr, oi, 0);
+        newpsr = cpu_ldl_le_mmu(env, frameptr + 4, oi, 0);
 
         /* Consistency checks on new IPSR */
         newpsr_exc = newpsr & XPSR_EXCP;
-- 
2.25.1


