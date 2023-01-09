Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6915A66315D
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:22:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEybs-00057a-3p; Mon, 09 Jan 2023 15:19:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEybq-00054K-7W
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:19:06 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEybo-00054K-DP
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:19:05 -0500
Received: by mail-pg1-x52f.google.com with SMTP id f3so6700809pgc.2
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g5hENHTKdMqEDVIFMgyawVY+dMepGnLmDVP7rciuUSE=;
 b=HyrFRV47HBoMVC6aOONau/sq0P8qTuPGsqYmcvO3WbSymbBGb1CASSWMyKwzs6APjV
 g9nRj2Rj1G5Mq5tSMDfN3UXgqW0YQrSCmHvD+GriTB71Juehdjko7Yiuq2h/Uo8MUaBt
 obDLTG/DbFRUR8VVHdhX7sZoJBINJnwX7YxzVbdqYcmnPciSnS3Eqb7YNsl8rvVQSVNY
 ozKrwh6XpvcoabVskUG3BhRSXjF0pkUjDukfS/CD4k7xHGrExRgrbawvyKsEcwxoXm5Z
 w/kZ8beZNYqXja/GX4OjXn/FR1pHZ95qwnMKmtIFX/QpLDsanKoMlofJKqsOs/7pjQr2
 jWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g5hENHTKdMqEDVIFMgyawVY+dMepGnLmDVP7rciuUSE=;
 b=ZTZloSpsGu5waTWfBU/sn4OBbGT74xfMshLP0XFhIrznK0qifUz9guFzh9W1GLH3eH
 /aceUdvcSQyo9tT9LjYppoMpyeId9khxB5iQj/QzJSZnbMquvA13TnBnugTWUwZBf8Lo
 XXGXwCrPNPt6f9kddT7EHcfUBkZxgAD1N1dzMz9X5LrCYtKFTJsqSmJk8E9uTs3Zheh4
 4rkn/+aBFMX9kn5fLzq74AFTG+cl4zVtRGR9FrILzM1MOTDGASgKFuY/29gIHbz80r6S
 AsoC0w+avafaMJUisjaAV1/kBts8WtTIZmrF4WcN2zqIKRjqyHkuJqm9AMuAul0DjjFH
 dgcQ==
X-Gm-Message-State: AFqh2kpjf1Vr/RCtWS0GfpxP6/ut4N+Xu2q9TTdqqMj9TQiEdMvNJIEv
 Co00aXfHFDr5Eka1HVsY7RE2cBmNd19VpBBw
X-Google-Smtp-Source: AMrXdXs7vTn4E7h7VIlU1uwMMfd4PqEkx7MYHiWEnxLMvpRlo2xYBAXmHC3zrGfLKRyfPSeoptSNqQ==
X-Received: by 2002:a05:6a00:d77:b0:587:102b:edb6 with SMTP id
 n55-20020a056a000d7700b00587102bedb6mr7671972pfv.17.1673295542986; 
 Mon, 09 Jan 2023 12:19:02 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:158e:facf:7a46:ba9f])
 by smtp.gmail.com with ESMTPSA id
 c132-20020a621c8a000000b00589a7824703sm1470972pfc.194.2023.01.09.12.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:19:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: david@redhat.com
Subject: [PATCH 5/7] target/s390x: Remove TLB_NOTDIRTY workarounds
Date: Mon,  9 Jan 2023 12:18:54 -0800
Message-Id: <20230109201856.3916639-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109201856.3916639-1-richard.henderson@linaro.org>
References: <20230109201856.3916639-1-richard.henderson@linaro.org>
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

When this code was written, it was using tlb_vaddr_to_host,
which does not handle TLB_DIRTY.  Since then, it has been
converted to probe_access_flags, which does.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/mem_helper.c | 74 +++++++++++------------------------
 1 file changed, 22 insertions(+), 52 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 59237fe7de..f7dc710814 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -122,11 +122,7 @@ typedef struct S390Access {
      * If we can't access the host page directly, we'll have to do I/O access
      * via ld/st helpers. These are internal details, so we store the
      * mmu idx to do the access here instead of passing it around in the
-     * helpers. Maybe, one day we can get rid of ld/st access - once we can
-     * handle TLB_NOTDIRTY differently. We don't expect these special accesses
-     * to trigger exceptions - only if we would have TLB_NOTDIRTY on LAP
-     * pages, we might trigger a new MMU translation - very unlikely that
-     * the mapping changes in between and we would trigger a fault.
+     * helpers.
      */
     int mmu_idx;
 } S390Access;
@@ -224,28 +220,14 @@ static void do_access_memset(CPUS390XState *env, vaddr vaddr, char *haddr,
                              uintptr_t ra)
 {
 #ifdef CONFIG_USER_ONLY
-    g_assert(haddr);
     memset(haddr, byte, size);
 #else
-    MemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
-    int i;
-
     if (likely(haddr)) {
         memset(haddr, byte, size);
     } else {
-        /*
-         * Do a single access and test if we can then get access to the
-         * page. This is especially relevant to speed up TLB_NOTDIRTY.
-         */
-        g_assert(size > 0);
-        cpu_stb_mmu(env, vaddr, byte, oi, ra);
-        haddr = tlb_vaddr_to_host(env, vaddr, MMU_DATA_STORE, mmu_idx);
-        if (likely(haddr)) {
-            memset(haddr + 1, byte, size - 1);
-        } else {
-            for (i = 1; i < size; i++) {
-                cpu_stb_mmu(env, vaddr + i, byte, oi, ra);
-            }
+        MemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
+        for (int i = 0; i < size; i++) {
+            cpu_stb_mmu(env, vaddr + i, byte, oi, ra);
         }
     }
 #endif
@@ -265,25 +247,18 @@ static void access_memset(CPUS390XState *env, S390Access *desta,
 }
 
 static uint8_t do_access_get_byte(CPUS390XState *env, vaddr vaddr,
-                                  void **haddr, int offset,
+                                  void *haddr, int offset,
                                   int mmu_idx, uintptr_t ra)
 {
 #ifdef CONFIG_USER_ONLY
-    return ldub_p(*haddr + offset);
+    return ldub_p(haddr + offset);
 #else
-    MemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
-    uint8_t byte;
-
-    if (likely(*haddr)) {
-        return ldub_p(*haddr + offset);
+    if (likely(haddr)) {
+        return ldub_p(haddr + offset);
+    } else {
+        MemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
+        return cpu_ldb_mmu(env, vaddr + offset, oi, ra);
     }
-    /*
-     * Do a single access and test if we can then get access to the
-     * page. This is especially relevant to speed up TLB_NOTDIRTY.
-     */
-    byte = cpu_ldb_mmu(env, vaddr + offset, oi, ra);
-    *haddr = tlb_vaddr_to_host(env, vaddr, MMU_DATA_LOAD, mmu_idx);
-    return byte;
 #endif
 }
 
@@ -291,32 +266,27 @@ static uint8_t access_get_byte(CPUS390XState *env, S390Access *access,
                                int offset, uintptr_t ra)
 {
     if (offset < access->size1) {
-        return do_access_get_byte(env, access->vaddr1, &access->haddr1,
+        return do_access_get_byte(env, access->vaddr1, access->haddr1,
                                   offset, access->mmu_idx, ra);
     }
-    return do_access_get_byte(env, access->vaddr2, &access->haddr2,
+    return do_access_get_byte(env, access->vaddr2, access->haddr2,
                               offset - access->size1, access->mmu_idx, ra);
 }
 
-static void do_access_set_byte(CPUS390XState *env, vaddr vaddr, void **haddr,
+static void do_access_set_byte(CPUS390XState *env, vaddr vaddr, void *haddr,
                                int offset, uint8_t byte, int mmu_idx,
                                uintptr_t ra)
 {
 #ifdef CONFIG_USER_ONLY
-    stb_p(*haddr + offset, byte);
+    stb_p(haddr + offset, byte);
 #else
-    MemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
 
-    if (likely(*haddr)) {
-        stb_p(*haddr + offset, byte);
-        return;
+    if (likely(haddr)) {
+        stb_p(haddr + offset, byte);
+    } else {
+        MemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
+        cpu_stb_mmu(env, vaddr + offset, byte, oi, ra);
     }
-    /*
-     * Do a single access and test if we can then get access to the
-     * page. This is especially relevant to speed up TLB_NOTDIRTY.
-     */
-    cpu_stb_mmu(env, vaddr + offset, byte, oi, ra);
-    *haddr = tlb_vaddr_to_host(env, vaddr, MMU_DATA_STORE, mmu_idx);
 #endif
 }
 
@@ -324,10 +294,10 @@ static void access_set_byte(CPUS390XState *env, S390Access *access,
                             int offset, uint8_t byte, uintptr_t ra)
 {
     if (offset < access->size1) {
-        do_access_set_byte(env, access->vaddr1, &access->haddr1, offset, byte,
+        do_access_set_byte(env, access->vaddr1, access->haddr1, offset, byte,
                            access->mmu_idx, ra);
     } else {
-        do_access_set_byte(env, access->vaddr2, &access->haddr2,
+        do_access_set_byte(env, access->vaddr2, access->haddr2,
                            offset - access->size1, byte, access->mmu_idx, ra);
     }
 }
-- 
2.34.1


