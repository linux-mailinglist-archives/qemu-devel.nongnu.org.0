Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1F2703019
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:38:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZI6-0007VP-2F; Mon, 15 May 2023 10:35:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZH5-0006qp-1w
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:15 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZGP-0004td-4p
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:33:35 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1adc913094aso45799925ad.0
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161203; x=1686753203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qq/bfx/cnVfgddia2Z24C2Fe0/LSiH7rE9uM4DdN6u4=;
 b=DePA+PM+BOtrodLW+PFFvwWQ3nNBMcmf5p9EyBz8Zq+xK+VlTZ3UK1mYbU8XW6+D5L
 a4ncrrydjYt+iYtVOTRXAsn4jTIvx0kU52BAyZasInblt11bg5zjyniNSdJQbESxS89l
 B7ZI8Coro054XOok1JWAomt/OL/y8Z6FGPtoIdJFzawBRmoGrqNW3yCU9wijOEcfUpO1
 Ctp56jdc5xi6Trvne3PxLi22YbQmG4GhqNpqV3v+hwXGfAMbosiS6JeY73GxYgYOOE85
 o29VMq8s48zsJBjTcfFwRj0xvR0dwbDt9hdRuTl3SowZxblpEOUdop/L4kN07YzaYBPF
 m4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161203; x=1686753203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qq/bfx/cnVfgddia2Z24C2Fe0/LSiH7rE9uM4DdN6u4=;
 b=CeoJQgdQ8Ia0ZHOMLGd3e8R5n7kQJ3dJsZNuYq/M6z1oBuqZLVIEe4Iyj9XHoRLqH6
 /abkTfJFCGh+qOukljc5TfpqwxUj/Wyu96o3h2xHdUUYivufPc5z81xdnPcPFODITInD
 YlGAwzc4087xYng4InmHBJTlNiATx9z0EG8qdeBukFgsd7hKlWxN49XOVoaR8AAujrd3
 FOpTNPy/ZROrJwSGjuZSMKkYZGjeCxtSiVbESwGMQdjX+xjgtoHEntBaCPJfxxbu0b2W
 YNKvOtSu3iyTPDMD1EnaY8YWqkJjCpISovfP1NvJEE23w7Al7TzJRvnhHEKpmdlIxYUl
 t10w==
X-Gm-Message-State: AC+VfDxyonFPNR3sLRIlZYksN0qsgglr2xZj+IJsnEVAbPJMt2T4RQiJ
 v8ZAu6x//KltJPne1FurEJV4Ye8Av77uJwJmy1E=
X-Google-Smtp-Source: ACHHUZ63IOVB9eJ637EgFvgej1oi1033qRuxRt+dYe7V6FX3ykF0CA/PDoxvED6sjKIWHlfOwcqVxA==
X-Received: by 2002:a17:902:b707:b0:1ac:aaf6:ee3a with SMTP id
 d7-20020a170902b70700b001acaaf6ee3amr19980240pls.32.1684161203683; 
 Mon, 15 May 2023 07:33:23 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v5 10/54] accel/tcg: Use have_atomic16 in ldst_atomicity.c.inc
Date: Mon, 15 May 2023 07:32:29 -0700
Message-Id: <20230515143313.734053-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

Hosts using Intel and AMD AVX cpus are quite common.
Add fast paths through ldst_atomicity using this.

Only enable with CONFIG_INT128; some older clang versions do not
support __int128_t, and the inline assembly won't work on structures.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/ldst_atomicity.c.inc | 76 +++++++++++++++++++++++++++-------
 1 file changed, 60 insertions(+), 16 deletions(-)

diff --git a/accel/tcg/ldst_atomicity.c.inc b/accel/tcg/ldst_atomicity.c.inc
index dd387c9bdd..69c1c61997 100644
--- a/accel/tcg/ldst_atomicity.c.inc
+++ b/accel/tcg/ldst_atomicity.c.inc
@@ -35,6 +35,14 @@
 
 #if defined(CONFIG_ATOMIC128)
 # define HAVE_al16_fast    true
+#elif defined(CONFIG_TCG_INTERPRETER)
+/*
+ * FIXME: host specific detection for this is in tcg/$host/,
+ * but we're using tcg/tci/ instead.
+ */
+# define HAVE_al16_fast    false
+#elif defined(__x86_64__) && defined(CONFIG_INT128)
+# define HAVE_al16_fast    likely(have_atomic16)
 #else
 # define HAVE_al16_fast    false
 #endif
@@ -178,6 +186,12 @@ load_atomic16(void *pv)
 
     r.u = qatomic_read__nocheck(p);
     return r.s;
+#elif defined(__x86_64__) && defined(CONFIG_INT128)
+    Int128Alias r;
+
+    /* Via HAVE_al16_fast, have_atomic16 is true. */
+    asm("vmovdqa %1, %0" : "=x" (r.u) : "m" (*(Int128 *)pv));
+    return r.s;
 #else
     qemu_build_not_reached();
 #endif
@@ -399,6 +413,24 @@ load_atom_extract_al16_or_al8(void *pv, int s)
         r = qatomic_read__nocheck(p16);
     }
     return r >> shr;
+#elif defined(__x86_64__) && defined(CONFIG_INT128)
+    uintptr_t pi = (uintptr_t)pv;
+    int shr = (pi & 7) * 8;
+    uint64_t a, b;
+
+    /* Via HAVE_al16_fast, have_atomic16 is true. */
+    pv = (void *)(pi & ~7);
+    if (pi & 8) {
+        uint64_t *p8 = __builtin_assume_aligned(pv, 16, 8);
+        a = qatomic_read__nocheck(p8);
+        b = qatomic_read__nocheck(p8 + 1);
+    } else {
+        asm("vmovdqa %2, %0\n\tvpextrq $1, %0, %1"
+            : "=x"(a), "=r"(b) : "m" (*(__uint128_t *)pv));
+    }
+    asm("shrd %b2, %1, %0" : "+r"(a) : "r"(b), "c"(shr));
+
+    return a;
 #else
     qemu_build_not_reached();
 #endif
@@ -715,23 +747,35 @@ static inline void ATTRIBUTE_ATOMIC128_OPT
 store_atomic16(void *pv, Int128Alias val)
 {
 #if defined(CONFIG_ATOMIC128)
-    __uint128_t *pu = __builtin_assume_aligned(pv, 16);
-    qatomic_set__nocheck(pu, val.u);
-#elif defined(CONFIG_CMPXCHG128)
-    __uint128_t *pu = __builtin_assume_aligned(pv, 16);
-    __uint128_t o;
-
-    /*
-     * Without CONFIG_ATOMIC128, __atomic_compare_exchange_n will always
-     * defer to libatomic, so we must use __sync_*_compare_and_swap_16
-     * and accept the sequential consistency that comes with it.
-     */
-    do {
-        o = *pu;
-    } while (!__sync_bool_compare_and_swap_16(pu, o, val.u));
-#else
-    qemu_build_not_reached();
+    {
+        __uint128_t *pu = __builtin_assume_aligned(pv, 16);
+        qatomic_set__nocheck(pu, val.u);
+        return;
+    }
 #endif
+#if defined(__x86_64__) && defined(CONFIG_INT128)
+    if (HAVE_al16_fast) {
+        asm("vmovdqa %1, %0" : "=m"(*(__uint128_t *)pv) : "x" (val.u));
+        return;
+    }
+#endif
+#if defined(CONFIG_CMPXCHG128)
+    {
+        __uint128_t *pu = __builtin_assume_aligned(pv, 16);
+        __uint128_t o;
+
+        /*
+         * Without CONFIG_ATOMIC128, __atomic_compare_exchange_n will always
+         * defer to libatomic, so we must use __sync_*_compare_and_swap_16
+         * and accept the sequential consistency that comes with it.
+         */
+        do {
+            o = *pu;
+        } while (!__sync_bool_compare_and_swap_16(pu, o, val.u));
+        return;
+    }
+#endif
+    qemu_build_not_reached();
 }
 
 /**
-- 
2.34.1


