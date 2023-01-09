Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AFF663166
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:24:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEybr-00054j-90; Mon, 09 Jan 2023 15:19:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEybm-00051T-Un
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:19:03 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEybk-00052k-TQ
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:19:02 -0500
Received: by mail-pg1-x531.google.com with SMTP id 141so6720505pgc.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8qzET9c8q9s+vZ1TgifLLKnu2IuZqas7ApRIvzu8fJ8=;
 b=NJ32uywqwon4xkfws9mlmpDqIbQ2f7C5g/bLBCUcQKoinmfoJyDBkzUEYwPNXj44sG
 Ep70M2dYtmebcHonaxoCAP8/XsSVZMzqJbeLfRjWIIVToTClfotHnzbhcrz8EJfuN1Wv
 nGOB8BxsrZTBOgbfDDETta20AKJUT/gCOyKQPPcdaaD51ELspFpA5EU3j3ssQuXjoend
 ljJPXnKuDGt7WuVlCqYlsns0B6yzAtOJKOQDTLq4fVs6dVSXLW+HiiSZqZzajhBc2LBk
 2UJ/lAfvnjGEmQUaIdv950qW7tmhsJal6e/XuI/JhtXv6VGEfJqC0G8avY35n2TfBsQY
 LVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8qzET9c8q9s+vZ1TgifLLKnu2IuZqas7ApRIvzu8fJ8=;
 b=4lBmCBAJsTg45jbxwcGc2lIOqFMKIIXmBpIEZw33ijZoLmU1iG3j2fZJv0YRPWRuf4
 v9cMyHwxrECB/X0GM4uBUOGSXi4Q6RHZvCtaqyfTStivqKldWaGAsLQHrOy2bHCbLj/4
 YmhdSduoBZJdCE9/A2bavaRHMoCm8/ICBv3XGfl+b2QWWS1+jYRv+BPox0Y5jaBcDrkD
 Re9OnA3fdyBy1+/VfLIgPObYq+LZiwzCEIBeABDOJdGIvMXYhKmRsNGU2LFQmA6K1Wpv
 pIUt50fVyYmaSbsDZlFz7tSIE4pu3dhRzAo/uwuGVrRowMk3qsNqWDkyvu2e98V2JPkm
 7sxg==
X-Gm-Message-State: AFqh2kpKyeXSSc5IpqLURmkGZiepVtuMSLtCRPg+BgYxCoq4uF1gih1F
 +HInUqtf4+We8MT60ydDIhUSzqO4xDmPG6dg
X-Google-Smtp-Source: AMrXdXuB11y63D+ET79NIH8G4GkmckV2BlqgNzb1dmpr7eAQQmI0d95OyYgt1KlFI1z4UXxKC2loYA==
X-Received: by 2002:aa7:9254:0:b0:572:6e9b:9f9e with SMTP id
 20-20020aa79254000000b005726e9b9f9emr68261557pfp.19.1673295539155; 
 Mon, 09 Jan 2023 12:18:59 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:158e:facf:7a46:ba9f])
 by smtp.gmail.com with ESMTPSA id
 c132-20020a621c8a000000b00589a7824703sm1470972pfc.194.2023.01.09.12.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:18:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: david@redhat.com
Subject: [PATCH 1/7] target/s390x: Fix s390_probe_access for user-only
Date: Mon,  9 Jan 2023 12:18:50 -0800
Message-Id: <20230109201856.3916639-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109201856.3916639-1-richard.henderson@linaro.org>
References: <20230109201856.3916639-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

In db9aab5783a2 we broke the contract of s390_probe_access, in that it
no longer returned an exception code, nor set __excp_addr.  Fix both.

Reported-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/mem_helper.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index cb82cd1c1d..5c0a7b1961 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -138,23 +138,27 @@ typedef struct S390Access {
  * For !CONFIG_USER_ONLY, the TEC is stored stored to env->tlb_fill_tec.
  * For CONFIG_USER_ONLY, the faulting address is stored to env->__excp_addr.
  */
-static int s390_probe_access(CPUArchState *env, target_ulong addr, int size,
-                             MMUAccessType access_type, int mmu_idx,
-                             bool nonfault, void **phost, uintptr_t ra)
+static inline int s390_probe_access(CPUArchState *env, target_ulong addr,
+                                    int size, MMUAccessType access_type,
+                                    int mmu_idx, bool nonfault,
+                                    void **phost, uintptr_t ra)
 {
-#if defined(CONFIG_USER_ONLY)
-    return probe_access_flags(env, addr, access_type, mmu_idx,
-                              nonfault, phost, ra);
-#else
-    int flags;
+    int flags = probe_access_flags(env, addr, access_type, mmu_idx,
+                                   nonfault, phost, ra);
 
-    env->tlb_fill_exc = 0;
-    flags = probe_access_flags(env, addr, access_type, mmu_idx, nonfault, phost,
-                               ra);
-    if (env->tlb_fill_exc) {
+    if (unlikely(flags & TLB_INVALID_MASK)) {
+        assert(!nonfault);
+#ifdef CONFIG_USER_ONLY
+        /* Address is in TEC in system mode; see s390_cpu_record_sigsegv. */
+        env->__excp_addr = addr & TARGET_PAGE_MASK;
+        return (page_get_flags(addr) & PAGE_VALID
+                ? PGM_PROTECTION : PGM_ADDRESSING);
+#else
         return env->tlb_fill_exc;
+#endif
     }
 
+#ifndef CONFIG_USER_ONLY
     if (unlikely(flags & TLB_WATCHPOINT)) {
         /* S390 does not presently use transaction attributes. */
         cpu_check_watchpoint(env_cpu(env), addr, size,
@@ -162,8 +166,9 @@ static int s390_probe_access(CPUArchState *env, target_ulong addr, int size,
                              (access_type == MMU_DATA_STORE
                               ? BP_MEM_WRITE : BP_MEM_READ), ra);
     }
-    return 0;
 #endif
+
+    return 0;
 }
 
 static int access_prepare_nf(S390Access *access, CPUS390XState *env,
-- 
2.34.1


