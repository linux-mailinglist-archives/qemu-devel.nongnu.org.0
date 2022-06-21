Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43726552F25
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 11:50:58 +0200 (CEST)
Received: from localhost ([::1]:37112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3aXB-0008VW-CA
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 05:50:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3aQp-0007dp-B9; Tue, 21 Jun 2022 05:44:23 -0400
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c]:45022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3aQj-0007MW-6I; Tue, 21 Jun 2022 05:44:19 -0400
Received: by mail-oo1-xc2c.google.com with SMTP id
 v33-20020a4a9764000000b0035f814bb06eso2594704ooi.11; 
 Tue, 21 Jun 2022 02:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xw/traBkJK4WZrtB3Zd7lj1xKpe3oozUBGfzbgYPUGw=;
 b=ZdzfO1Z9kLGNLenUXdhCZMv48SNT+PtQYAbnQBh1rO6MGtiTTGt8+b9H8TahkUcvBi
 wB64xcsPdka2OczZS8n+gf5JdJFhGbJszGjglSOiYDI4OzLve6Hch/T4EGW4mOLVQTUq
 5sE8chSd1VcLvegkNBeF434B72qexVN51s0IFCkoI6CfzAYaRFKXEB2E0MQTSlUv2umd
 DVdtAsifSpfP/NrGvBaVVwZ0p+hCTAR0aRX6dsjb5ObDwGsyrfrELfp8qVZboImUKQsF
 rtnTetPrSgvo4R8lP5icH3n4B4WcySaoaoBRW7fYdbkEuBvGoNE3bl3BUA8WZByXvw/0
 wFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xw/traBkJK4WZrtB3Zd7lj1xKpe3oozUBGfzbgYPUGw=;
 b=RV+bq/V6c4s1r8xky166Yd+bjf2ldGreKm0y+MaB+2KzqvOIvL78awG6ynBTNSf7by
 gTJafEonK1naAdbddgIujbuwMiIJXTGzqHUhRSvLFwjVL4PZCVm8oTn//14PcNrzXF7W
 m4babmdE5JYuRHxm4sR9Y9en5867ZrtyJZUGMUYgNwH+DIA3Qa/qMGMHlYX0ThgiEZOm
 L234DjRmcJ97a8/QLWgQBK99pOCQGbK98vJeR1yhrDTQ2/9tmqV62IMdalFcUVhtXckb
 lGhbmI9NvAJfZP+CE8XX6kxu5swI/2FcDe8MaELSgqM6BnE8bymSpCinf5Um/h6rjZ+K
 fa6A==
X-Gm-Message-State: AJIora85OCjaxu76SkS722mWPWTzhKoBCnkDUmw59t4VP09+fZUgCToa
 niglCa6JYOQew883lq/oUHlBbjYhZLBmWA==
X-Google-Smtp-Source: AGRyM1se+nPf7BL1o+BSjTbRk+2KJSOzMw4sGnJLtF0pAk8FnsM3jJiNIe9mG6qA38ePXcELJSQt2Q==
X-Received: by 2002:a05:6820:56:b0:41b:928a:406f with SMTP id
 v22-20020a056820005600b0041b928a406fmr10835064oob.56.1655804655522; 
 Tue, 21 Jun 2022 02:44:15 -0700 (PDT)
Received: from balboa.ibmuc.com ([187.34.29.129])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a9d7a49000000b0061020865f1asm7555119otm.50.2022.06.21.02.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 02:44:15 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: [PULL 04/15] host-utils: Implemented unsigned 256-by-128 division
Date: Tue, 21 Jun 2022 06:43:49 -0300
Message-Id: <20220621094400.122800-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621094400.122800-1-danielhb413@gmail.com>
References: <20220621094400.122800-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

Based on already existing QEMU implementation, created an unsigned 256
bit by 128 bit division needed to implement the vector divide extended
unsigned instruction from PowerISA3.1

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220525134954.85056-5-lucas.araujo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 include/qemu/host-utils.h |   2 +
 include/qemu/int128.h     |  38 +++++++++++
 util/host-utils.c         | 129 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 169 insertions(+)

diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index f19bd29105..9767af7573 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -32,6 +32,7 @@
 
 #include "qemu/compiler.h"
 #include "qemu/bswap.h"
+#include "qemu/int128.h"
 
 #ifdef CONFIG_INT128
 static inline void mulu64(uint64_t *plow, uint64_t *phigh,
@@ -849,4 +850,5 @@ static inline uint64_t udiv_qrnnd(uint64_t *r, uint64_t n1,
 #endif
 }
 
+Int128 divu256(Int128 *plow, Int128 *phigh, Int128 divisor);
 #endif
diff --git a/include/qemu/int128.h b/include/qemu/int128.h
index ef71f56e3f..d2b76ca6ac 100644
--- a/include/qemu/int128.h
+++ b/include/qemu/int128.h
@@ -128,11 +128,21 @@ static inline bool int128_ge(Int128 a, Int128 b)
     return a >= b;
 }
 
+static inline bool int128_uge(Int128 a, Int128 b)
+{
+    return ((__uint128_t)a) >= ((__uint128_t)b);
+}
+
 static inline bool int128_lt(Int128 a, Int128 b)
 {
     return a < b;
 }
 
+static inline bool int128_ult(Int128 a, Int128 b)
+{
+    return (__uint128_t)a < (__uint128_t)b;
+}
+
 static inline bool int128_le(Int128 a, Int128 b)
 {
     return a <= b;
@@ -177,6 +187,15 @@ static inline Int128 bswap128(Int128 a)
 #endif
 }
 
+static inline int clz128(Int128 a)
+{
+    if (a >> 64) {
+        return __builtin_clzll(a >> 64);
+    } else {
+        return (a) ? __builtin_clzll((uint64_t)a) + 64 : 128;
+    }
+}
+
 static inline Int128 int128_divu(Int128 a, Int128 b)
 {
     return (__uint128_t)a / (__uint128_t)b;
@@ -373,11 +392,21 @@ static inline bool int128_ge(Int128 a, Int128 b)
     return a.hi > b.hi || (a.hi == b.hi && a.lo >= b.lo);
 }
 
+static inline bool int128_uge(Int128 a, Int128 b)
+{
+    return (uint64_t)a.hi > (uint64_t)b.hi || (a.hi == b.hi && a.lo >= b.lo);
+}
+
 static inline bool int128_lt(Int128 a, Int128 b)
 {
     return !int128_ge(a, b);
 }
 
+static inline bool int128_ult(Int128 a, Int128 b)
+{
+    return !int128_uge(a, b);
+}
+
 static inline bool int128_le(Int128 a, Int128 b)
 {
     return int128_ge(b, a);
@@ -418,6 +447,15 @@ static inline Int128 bswap128(Int128 a)
     return int128_make128(bswap64(a.hi), bswap64(a.lo));
 }
 
+static inline int clz128(Int128 a)
+{
+    if (a.hi) {
+        return __builtin_clzll(a.hi);
+    } else {
+        return (a.lo) ? __builtin_clzll(a.lo) + 64 : 128;
+    }
+}
+
 Int128 int128_divu(Int128, Int128);
 Int128 int128_remu(Int128, Int128);
 Int128 int128_divs(Int128, Int128);
diff --git a/util/host-utils.c b/util/host-utils.c
index 96d5dc0bed..93dfb1b6ab 100644
--- a/util/host-utils.c
+++ b/util/host-utils.c
@@ -266,3 +266,132 @@ void ulshift(uint64_t *plow, uint64_t *phigh, int32_t shift, bool *overflow)
         *plow = *plow << shift;
     }
 }
+
+/*
+ * Unsigned 256-by-128 division.
+ * Returns the remainder via r.
+ * Returns lower 128 bit of quotient.
+ * Needs a normalized divisor (most significant bit set to 1).
+ *
+ * Adapted from include/qemu/host-utils.h udiv_qrnnd,
+ * from the GNU Multi Precision Library - longlong.h __udiv_qrnnd
+ * (https://gmplib.org/repo/gmp/file/tip/longlong.h)
+ *
+ * Licensed under the GPLv2/LGPLv3
+ */
+static Int128 udiv256_qrnnd(Int128 *r, Int128 n1, Int128 n0, Int128 d)
+{
+    Int128 d0, d1, q0, q1, r1, r0, m;
+    uint64_t mp0, mp1;
+
+    d0 = int128_make64(int128_getlo(d));
+    d1 = int128_make64(int128_gethi(d));
+
+    r1 = int128_remu(n1, d1);
+    q1 = int128_divu(n1, d1);
+    mp0 = int128_getlo(q1);
+    mp1 = int128_gethi(q1);
+    mulu128(&mp0, &mp1, int128_getlo(d0));
+    m = int128_make128(mp0, mp1);
+    r1 = int128_make128(int128_gethi(n0), int128_getlo(r1));
+    if (int128_ult(r1, m)) {
+        q1 = int128_sub(q1, int128_one());
+        r1 = int128_add(r1, d);
+        if (int128_uge(r1, d)) {
+            if (int128_ult(r1, m)) {
+                q1 = int128_sub(q1, int128_one());
+                r1 = int128_add(r1, d);
+            }
+        }
+    }
+    r1 = int128_sub(r1, m);
+
+    r0 = int128_remu(r1, d1);
+    q0 = int128_divu(r1, d1);
+    mp0 = int128_getlo(q0);
+    mp1 = int128_gethi(q0);
+    mulu128(&mp0, &mp1, int128_getlo(d0));
+    m = int128_make128(mp0, mp1);
+    r0 = int128_make128(int128_getlo(n0), int128_getlo(r0));
+    if (int128_ult(r0, m)) {
+        q0 = int128_sub(q0, int128_one());
+        r0 = int128_add(r0, d);
+        if (int128_uge(r0, d)) {
+            if (int128_ult(r0, m)) {
+                q0 = int128_sub(q0, int128_one());
+                r0 = int128_add(r0, d);
+            }
+        }
+    }
+    r0 = int128_sub(r0, m);
+
+    *r = r0;
+    return int128_or(int128_lshift(q1, 64), q0);
+}
+
+/*
+ * Unsigned 256-by-128 division.
+ * Returns the remainder.
+ * Returns quotient via plow and phigh.
+ * Also returns the remainder via the function return value.
+ */
+Int128 divu256(Int128 *plow, Int128 *phigh, Int128 divisor)
+{
+    Int128 dhi = *phigh;
+    Int128 dlo = *plow;
+    Int128 rem, dhighest;
+    int sh;
+
+    if (!int128_nz(divisor) || !int128_nz(dhi)) {
+        *plow  = int128_divu(dlo, divisor);
+        *phigh = int128_zero();
+        return int128_remu(dlo, divisor);
+    } else {
+        sh = clz128(divisor);
+
+        if (int128_ult(dhi, divisor)) {
+            if (sh != 0) {
+                /* normalize the divisor, shifting the dividend accordingly */
+                divisor = int128_lshift(divisor, sh);
+                dhi = int128_or(int128_lshift(dhi, sh),
+                                int128_urshift(dlo, (128 - sh)));
+                dlo = int128_lshift(dlo, sh);
+            }
+
+            *phigh = int128_zero();
+            *plow = udiv256_qrnnd(&rem, dhi, dlo, divisor);
+        } else {
+            if (sh != 0) {
+                /* normalize the divisor, shifting the dividend accordingly */
+                divisor = int128_lshift(divisor, sh);
+                dhighest = int128_rshift(dhi, (128 - sh));
+                dhi = int128_or(int128_lshift(dhi, sh),
+                                int128_urshift(dlo, (128 - sh)));
+                dlo = int128_lshift(dlo, sh);
+
+                *phigh = udiv256_qrnnd(&dhi, dhighest, dhi, divisor);
+            } else {
+                /*
+                 * dhi >= divisor
+                 * Since the MSB of divisor is set (sh == 0),
+                 * (dhi - divisor) < divisor
+                 *
+                 * Thus, the high part of the quotient is 1, and we can
+                 * calculate the low part with a single call to udiv_qrnnd
+                 * after subtracting divisor from dhi
+                 */
+                dhi = int128_sub(dhi, divisor);
+                *phigh = int128_one();
+            }
+
+            *plow = udiv256_qrnnd(&rem, dhi, dlo, divisor);
+        }
+
+        /*
+         * since the dividend/divisor might have been normalized,
+         * the remainder might also have to be shifted back
+         */
+        rem = int128_urshift(rem, sh);
+        return rem;
+    }
+}
-- 
2.36.1


