Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0D3703020
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:39:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZI8-0007Vl-EG; Mon, 15 May 2023 10:35:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHQ-0006wr-Oo
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:33 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZGP-0004q9-SC
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:33:36 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1ab13da70a3so124359735ad.1
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161205; x=1686753205;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vwB32Lu8jReXcA/wvC/qx9nAhkYXsChfxxD2grqRfag=;
 b=BvisT1N3QcyJn+HIcURGy7vgTVeVGmWfGpUbBahF7IYPxhfkg2FVuq5+hi3EsMLJB2
 Lswr1bhQT90XOdsuO9YtoEwXnES88HJW547919/UvgVKKrGn7MK8uzsgDz/wH7o6EQo9
 k1HuIS0v9dHuktoHpkVC9Ba+mXlO/2sX7aYzuC3aGjYLmMg2pMf/KNj1cdQhZrwoMu6Y
 w2Ft0Dxf6WZ57SxpjAA3snn+YD8UBU3gOYxsBRyMt8gdM2GpxyCTgIE2Xo8tlFfoPsBm
 J1IPEYypC+Gdi72T+fBqBB4IHdb2ISLA1FrbxH55fOLdY7wldvFy9c2D9WnYoGL5yWMD
 SuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161205; x=1686753205;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vwB32Lu8jReXcA/wvC/qx9nAhkYXsChfxxD2grqRfag=;
 b=f2efdyJoVEVyeSat1QeOOvegMAqBHd0EESKqweL3bxL5cgkih0Gs1WQdPUP86BhaEy
 9MIKPzXnCzRhyRsnZFt85Zx4ruaKgvwBwNjSzMWVApZQVI75+CcFc+luKAICkMfA+H9b
 ntmWYCYHP/6OxQx3/9qmHXRSGowUVhMfDEhOv9h81hxzGO87LsFpNR+XOkILz4uW1S5q
 HDFDzrQFm1oTqh1ixAWw0yak/7v8EeRA3CPvWuROjJsFNJRwCdhullxHJvtk6k1WZo3A
 FP2+8c4mS8deDQBlD+c1CpK5H4zpr3tix10m+96FwAYCipc5DgwNhQdy+uwN7TouMiSy
 4D/A==
X-Gm-Message-State: AC+VfDz0VHVa6jbD9Vi/hKLKh8ZK+uQ66WPo4+JnTLwN3I55iO7GOQNT
 61PW14tk/lB748LLYzQjLEJXeZuvtlJMOQzwvEI=
X-Google-Smtp-Source: ACHHUZ6rtnqFqeMIlAW8AUd6/hRP0IZUDH7U3MyyH5UxZmt6aRIOBo0ud5KtbfJTID3hk2tgyQ/pmg==
X-Received: by 2002:a17:902:ee8a:b0:1ac:6c26:c32f with SMTP id
 a10-20020a170902ee8a00b001ac6c26c32fmr29497439pld.46.1684161204522; 
 Mon, 15 May 2023 07:33:24 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v5 11/54] accel/tcg: Add aarch64 specific support in
 ldst_atomicity
Date: Mon, 15 May 2023 07:32:30 -0700
Message-Id: <20230515143313.734053-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/ldst_atomicity.c.inc | 60 ++++++++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/ldst_atomicity.c.inc b/accel/tcg/ldst_atomicity.c.inc
index 69c1c61997..c3b2b35823 100644
--- a/accel/tcg/ldst_atomicity.c.inc
+++ b/accel/tcg/ldst_atomicity.c.inc
@@ -263,7 +263,22 @@ static Int128 load_atomic16_or_exit(CPUArchState *env, uintptr_t ra, void *pv)
      * In system mode all guest pages are writable, and for user-only
      * we have just checked writability.  Try cmpxchg.
      */
-#if defined(CONFIG_CMPXCHG128)
+#if defined(__aarch64__)
+    /* We can do better than cmpxchg for AArch64.  */
+    {
+        uint64_t l, h;
+        uint32_t fail;
+
+        /* The load must be paired with the store to guarantee not tearing. */
+        asm("0: ldxp %0, %1, %3\n\t"
+            "stxp %w2, %0, %1, %3\n\t"
+            "cbnz %w2, 0b"
+            : "=&r"(l), "=&r"(h), "=&r"(fail) : "Q"(*p));
+
+        qemu_build_assert(!HOST_BIG_ENDIAN);
+        return int128_make128(l, h);
+    }
+#elif defined(CONFIG_CMPXCHG128)
     /* Swap 0 with 0, with the side-effect of returning the old value. */
     {
         Int128Alias r;
@@ -759,7 +774,22 @@ store_atomic16(void *pv, Int128Alias val)
         return;
     }
 #endif
-#if defined(CONFIG_CMPXCHG128)
+#if defined(__aarch64__)
+    /* We can do better than cmpxchg for AArch64.  */
+    {
+        uint64_t l, h, t;
+
+        qemu_build_assert(!HOST_BIG_ENDIAN);
+        l = int128_getlo(val.s);
+        h = int128_gethi(val.s);
+
+        asm("0: ldxp %0, xzr, %1\n\t"
+            "stxp %w0, %2, %3, %1\n\t"
+            "cbnz %w0, 0b"
+            : "=&r"(t), "=Q"(*(__uint128_t *)pv) : "r"(l), "r"(h));
+        return;
+    }
+#elif defined(CONFIG_CMPXCHG128)
     {
         __uint128_t *pu = __builtin_assume_aligned(pv, 16);
         __uint128_t o;
@@ -857,7 +887,31 @@ static void store_atom_insert_al8(uint64_t *p, uint64_t val, uint64_t msk)
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
+    uint64_t tl, th, vl, vh, ml, mh;
+    uint32_t fail;
+
+    qemu_build_assert(!HOST_BIG_ENDIAN);
+    vl = int128_getlo(val.s);
+    vh = int128_gethi(val.s);
+    ml = int128_getlo(msk.s);
+    mh = int128_gethi(msk.s);
+
+    asm("0: ldxp %[l], %[h], %[mem]\n\t"
+        "bic %[l], %[l], %[ml]\n\t"
+        "bic %[h], %[h], %[mh]\n\t"
+        "orr %[l], %[l], %[vl]\n\t"
+        "orr %[h], %[h], %[vh]\n\t"
+        "stxp %w[f], %[l], %[h], %[mem]\n\t"
+        "cbnz %w[f], 0b\n"
+        : [mem] "+Q"(*ps), [f] "=&r"(fail), [l] "=&r"(tl), [h] "=&r"(th)
+        : [vl] "r"(vl), [vh] "r"(vh), [ml] "r"(ml), [mh] "r"(mh));
+#elif defined(CONFIG_ATOMIC128)
     __uint128_t *pu, old, new;
 
     /* With CONFIG_ATOMIC128, we can avoid the memory barriers. */
-- 
2.34.1


