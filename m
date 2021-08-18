Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A6D3F0BE0
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:36:17 +0200 (CEST)
Received: from localhost ([::1]:57076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRMG-0000Nn-PZ
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR9i-0006hO-9F
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:18 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:46706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR9g-0002eD-Iv
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:17 -0400
Received: by mail-pl1-x62b.google.com with SMTP id u15so2406771plg.13
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vcey1IaftmTAFoPi1JXk0SLrU7sPrAiRY1q5NRBsbUE=;
 b=ny38a9M4YLzdsML0aYTxU67wwDY30UOl6Bl7NVKl2BnCLvnQgqP0xyOqihxqX015Qw
 ZbTLggCrEV+c4CSlK8fGyLI8BBtcz9lHH6APs7KterpBOS0cGyA4bZj4FNmybAQW5dou
 eX3bGuzQoPvCUrGVdgTrVkbz0ZTwtX8C8ttI5/UU4XwOO8ZDgRZkcy0PbqZZkfI47ch6
 Y5oM0bprvVV4gtRlV+Dx2wb/xAcKHOEYTwGMco1OhhAzX0shU++I9ZPm5xDFeB5R+XGH
 TCEqkU+znw/EHmQ4rqCB0ZVIfYeHhUZDgMsZXecrf7CaX3OE3DmIUQ9yd14YaggDdpSF
 SVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vcey1IaftmTAFoPi1JXk0SLrU7sPrAiRY1q5NRBsbUE=;
 b=UebIMqlg+N9qJ4K8+91wOFOwV/0dexg85cBGdrBEAS3SSf8DZNsw9XIvrVwqxOssYn
 nWo9FbndN/td5sVb3/nm5hr1BjLIbrLju2NLnOe8BFjUC/W5vsxSL1p3VEKZ5qvWYTU9
 qA/js1xnhqvg54DqsZYwRdlpumzKo9ox8O+ECiUIfDt2H2G/DU8HXwgMf8eTx90em1hD
 umpGR3dEH0h09tJk0jKM+ArREZlrwJ7XDuKQ8PEIIpGedOXHjGkprrcmCOAJV4m4K8/b
 CsEkXwwwqCOQKSvy/fzMautQZvdAeDHHTLJdjuZznR0Q4bnr27+gBJH7m6/cYvuZL8pV
 pW8g==
X-Gm-Message-State: AOAM533V2dB4aRWf+o1ALnSyo2LdzXXRLoMByG0JdDHE8oQeMAl6uTAN
 nqd4xxzECxgzTStFMoHBNlf7wTLm6VjOsw==
X-Google-Smtp-Source: ABdhPJx+vq0SU1yh3nmU0cPI1KIRI1GDuoWcwBOmgYkfuyfju/c29A4ecuUd2h9hyji9xa0aM895Zw==
X-Received: by 2002:a17:90a:7061:: with SMTP id
 f88mr3096707pjk.121.1629314595269; 
 Wed, 18 Aug 2021 12:23:15 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id w82sm569302pff.112.2021.08.18.12.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:23:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 41/66] target/arm: Use cpu_*_mmu instead of helper_*_mmu
Date: Wed, 18 Aug 2021 09:18:55 -1000
Message-Id: <20210818191920.390759-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The helper_*_mmu functions were the only thing available
when this code was written.  This could have been adjusted
when we added cpu_*_mmuidx_ra, but now we can most easily
use the newest set of interfaces.

Cc: qemu-arm@nongnu.org
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


