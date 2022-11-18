Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 456B362F1FF
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:58:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovxzj-0007vr-4Z; Fri, 18 Nov 2022 04:49:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxz8-0007T0-Ue
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:38 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxz7-000219-0T
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:34 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 w3-20020a17090a460300b00218524e8877so6671488pjg.1
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 01:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QT31Djbsn269igvk/uvuWG/+hysavp7cLqTo/+oIdKQ=;
 b=BQBqD8M2Uuk8C7B+P+3Z0u4ZmIcTjiOaGZam2SoUU1b8VnYdFSm/CI5/ApPJtQyP8z
 a3u1Doj5E9sAl8THVEgT6OHfhjdJ88lNW1g0/1GDTkui0jyEC9fVxUVNwtKDMD4mjrni
 +SrC5f8SSaz9dCUNK9nyT6OLD4RxPLQUQShu7lChbyf0zYna8aZJbz1cUr026EsYx5ou
 hzcZZy6itV4iMO36tqAMnVvuMm0nQG+Ai4YF9fjxaXY0SZP3Bdr/GVxIfdkhz7LlHGIO
 yYNjr2PEs3d/ZUBkSjB8vMSv8fr7TauJJLb4ju8g4ivpmV/NVA0FSEJ61av5Zl/rwCnd
 wJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QT31Djbsn269igvk/uvuWG/+hysavp7cLqTo/+oIdKQ=;
 b=M5BOVtljfvM+YXxh3AfovoDgOXYNIWfiOQ0T2YZhBiVPlunVTMcY+ddUGPYnzWqmuJ
 8y7RvqyrGrJ1akTTg6rnW5OxnKrCWL3bpKvf9vuqBOhYebmxE2AdZP6oALfH/pASuy0g
 b1msu+HyLCa+qOVVcMyvPQQKlXugXhd0TVVeK0kiCvcSx4q1qOiCbo231OW1Hkb8MS03
 KocQQbfUE4AcHy5KY5nrzg2OSInhK5RR6+QBaLL2LT8pGHvlVhw7FzuCsfZ/yEALeM/d
 1eRrx2GgIegJ8E2Lnl7IMWMImL96HBJN/cquIK2wz614hjLlE23r7cnUklBYQgtxybva
 LwQg==
X-Gm-Message-State: ANoB5pnUrSUcx+rm7HjxTrpIPqO/EMue8m5gjnWQZDOOPbpp0BHdsN5d
 a23GTwxzBw8p5tmP0hip+Dmmrd30kqfycw==
X-Google-Smtp-Source: AA0mqf6c9YcLIHzMHrgZN1OV2HJKOW0eRgGGu+yZnCCg2VQJBj/4Ebpy04I86MSTEDU3LBbGI94IxQ==
X-Received: by 2002:a17:90b:3d0a:b0:213:3521:f83a with SMTP id
 pt10-20020a17090b3d0a00b002133521f83amr6896899pjb.84.1668764911805; 
 Fri, 18 Nov 2022 01:48:31 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902e54c00b0018862bb3976sm3115421plf.308.2022.11.18.01.48.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 01:48:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 18/29] accel/tcg: Add aarch64 specific support in
 ldst_atomicity
Date: Fri, 18 Nov 2022 01:47:43 -0800
Message-Id: <20221118094754.242910-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118094754.242910-1-richard.henderson@linaro.org>
References: <20221118094754.242910-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

We have code in atomic128.h noting that through GCC 8, there
was no support for atomic operations on __uint128.  This has
been fixed in GCC 10.  But we can still improve over any
basic compare-and-swap loop using the ldxp/stxp instructions.

Add fast paths for FEAT_LSE2, using the detection in tcg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/ldst_atomicity.c.inc | 75 ++++++++++++++++++++++++++++++++--
 1 file changed, 72 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/ldst_atomicity.c.inc b/accel/tcg/ldst_atomicity.c.inc
index d2a3783193..186862b5ec 100644
--- a/accel/tcg/ldst_atomicity.c.inc
+++ b/accel/tcg/ldst_atomicity.c.inc
@@ -41,6 +41,8 @@
  * but we're using tcg/tci/ instead.
  */
 # define HAVE_al16_fast    false
+#elif defined(__aarch64__)
+# define HAVE_al16_fast    likely(have_lse2)
 #elif defined(__x86_64__)
 # define HAVE_al16_fast    likely(have_atomic16)
 #else
@@ -48,6 +50,8 @@
 #endif
 #if defined(CONFIG_ATOMIC128) || defined(CONFIG_CMPXCHG128)
 # define HAVE_al16         true
+#elif defined(__aarch64__)
+# define HAVE_al16         true
 #else
 # define HAVE_al16         false
 #endif
@@ -168,6 +172,12 @@ load_atomic16(void *pv)
 
     r.u = qatomic_read__nocheck(p);
     return r.s;
+#elif defined(__aarch64__)
+    /* Via HAVE_al16_fast, FEAT_LSE2 is present: LDP becomes atomic. */
+    Int128Alias r;
+
+    asm("ldp %0, %R0, %1" : "=r"(r.u) : "m"(*(__uint128_t *)pv));
+    return r.s;
 #elif defined(__x86_64__)
     Int128Alias r;
 
@@ -246,7 +256,20 @@ static Int128 load_atomic16_or_exit(CPUArchState *env, uintptr_t ra, void *pv)
      * In system mode all guest pages are writable, and for user-only
      * we have just checked writability.  Try cmpxchg.
      */
-#if defined(CONFIG_CMPXCHG128)
+#if defined(__aarch64__)
+    /* We can do better than cmpxchg for AArch64.  */
+    {
+        Int128Alias r;
+        uint32_t fail;
+
+        /* The load must be paired with the store to guarantee not tearing.  */
+        asm("0: ldxp %0, %R0, %2\n\t"
+            "stxp %w1, %0, %R0, %2\n\t"
+            "cbnz %w1, 0b"
+            : "=&r"(r.u), "=&r"(fail) : "Q"(*p));
+        return r.s;
+    }
+#elif defined(CONFIG_CMPXCHG128)
     /* Swap 0 with 0, with the side-effect of returning the old value. */
     {
         Int128Alias r;
@@ -393,6 +416,18 @@ load_atom_extract_al16_or_al8(void *pv, int s)
         r = qatomic_read__nocheck(p16);
     }
     return r >> shr;
+#elif defined(__aarch64__)
+    /*
+     * Via HAVE_al16_fast, FEAT_LSE2 is present.
+     * LDP becomes single-copy atomic if 16-byte aligned, and
+     * single-copy atomic on the parts if 8-byte aligned.
+     */
+    uintptr_t pi = (uintptr_t)pv;
+    int shr = (pi & 7) * 8;
+    uint64_t l, h;
+
+    asm("ldp %0, %1, %2" : "=r"(l), "=r"(h) : "m"(*(__uint128_t *)(pi & ~7)));
+    return (l >> shr) | (h << (-shr & 63));
 #elif defined(__x86_64__)
     uintptr_t pi = (uintptr_t)pv;
     int shr = (pi & 7) * 8;
@@ -739,7 +774,23 @@ store_atomic16(void *pv, Int128Alias val)
         return;
     }
 #endif
-#if defined(CONFIG_CMPXCHG128)
+#if defined(__aarch64__)
+    /* We can do better than cmpxchg for AArch64.  */
+    __uint128_t *pu = __builtin_assume_aligned(pv, 16);
+    __uint128_t old;
+    uint32_t fail;
+
+    if (HAVE_al16_fast) {
+        /* Via HAVE_al16_fast, FEAT_LSE2 is present: STP becomes atomic. */
+        asm("stp %1, %R1, %0" : "=Q"(*pu) : "r"(val.u));
+    } else {
+        asm("0: ldxp %0, %R0, %1\n\t"
+            "stxp %w2, %3, %R3, %1\n\t"
+            "cbnz %w2, 0b"
+            : "=&r"(old), "=Q"(*pu), "=&r"(fail) : "r"(val.u));
+    }
+    return;
+#elif defined(CONFIG_CMPXCHG128)
     {
         __uint128_t *pu = __builtin_assume_aligned(pv, 16);
         __uint128_t o;
@@ -839,7 +890,25 @@ static void store_atom_insert_al8(uint64_t *p, uint64_t val, uint64_t msk)
 static void ATTRIBUTE_ATOMIC128_OPT
 store_atom_insert_al16(Int128 *ps, Int128Alias val, Int128Alias msk)
 {
-#if defined(CONFIG_ATOMIC128)
+#if defined(__aarch64__)
+    /*
+     * GCC only implements __sync* primitives for int128 on aarch64.
+     * We can do better without the barriers, and integrating the
+     * arithmetic into the load-exclusive/store-conditional pair.
+     */
+    __uint128_t tmp, *pu = __builtin_assume_aligned(ps, 16);
+    uint32_t fail;
+
+    asm("0: ldxp %[t], %R[t], %[mem]\n\t"
+        "bic %[t], %[t], %[m]\n\t"
+        "bic %R[t], %R[t], %R[m]\n\t"
+        "orr %[t], %[t], %[v]\n\t"
+        "orr %R[t], %R[t], %R[v]\n\t"
+        "stxp %w[f], %[t], %R[t], %[mem]\n\t"
+        "cbnz %w[f], 0b\n"
+        : [mem] "+Q"(*pu), [f] "=&r"(fail), [t] "=&r"(tmp)
+        : [v] "r"(val.u), [m] "r"(msk.u));
+#elif defined(CONFIG_ATOMIC128)
     __uint128_t *pu, old, new;
 
     /* With CONFIG_ATOMIC128, we can avoid the memory barriers. */
-- 
2.34.1


