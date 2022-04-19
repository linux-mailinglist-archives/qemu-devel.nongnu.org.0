Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAAB50666B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 09:58:24 +0200 (CEST)
Received: from localhost ([::1]:40176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngikh-0006uR-8m
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 03:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmR-0001J5-6B
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:52:04 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmO-0004bB-6D
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:52:02 -0400
Received: by mail-wr1-x42b.google.com with SMTP id x18so13072216wrc.0
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cqlIvFlaJGSG4uCwFUjXAq5UT9k0mVtPWMV8t35g/4Q=;
 b=qxPII67YilZy6Bekl6HUpKn0Vyn2572u2C9jk+4dyPvy9o8varpVTABAVsYwka6sRs
 CSeA1jfPibz4LxKaBqq2h9fz8KvOm98Dx5RtVm2l3+6WGv+6mMk9WMYngl9Cyg08MJiC
 279+JyI/Hd8eO+5iB/Q94BUwFTvkA8x2EWGJGrci9Z8vx2onbUQBfBnp40tpaEL4eN8C
 ByE8N9lweec5NfjQyJw5y3JGDeweLE6HiW0CJK3f6ZFJUymxpE5TyMSkZS5jnac1Uzq7
 z28pyxGJQ1Tjcm8DhQdZWiEDM0+SJlPiMGWzeb8SSmXMkSIUMwUk4LCxKsco5WsvNZ9Z
 25BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cqlIvFlaJGSG4uCwFUjXAq5UT9k0mVtPWMV8t35g/4Q=;
 b=mQ/HZGvcRG6vrje95y6inhw6c5Bide0pmrEQqobGTt1OCGNLXLNAhTp0QuRC4Ppaai
 Qi+QF8wvUoPwiy0PA6514KdTMgHrIqbQGSB6ResyNZaK+JlQDOSYhCV6nPScNc9Y4LmR
 Uz78VslpvKU40FdYpegDloTpFY8ziZpPe/W6TKkvUFBZ0LxJMzoJuktXkxRJfxy3NgO4
 ZG4KWETIcGnB3qTzQSHzxUBL88AKSW3YHLlnd462PcoHZ6s8fvS4iv/BaODvcD6ziY70
 oDeS2nQrH78CcbhgUPQXOlvU8fKp24m3S6uOTTEld+7KNpcdChUF9RlHAvgqP0O2kftV
 KGpg==
X-Gm-Message-State: AOAM530sXLoEEy/+smUhkbY2DEsiO1eRKBfxYyp/aSdHtG9n92h/E+XO
 M4UazxxLwnJ0Sr1Pj3wHPXSMBBii4Zi4Og==
X-Google-Smtp-Source: ABdhPJyLZteMV1HVVe17HwJzRqPeU/9wK9uVR9V1uti4S9AcRV8EYsGSTPIia2A+rUaxpPd0gJPUZg==
X-Received: by 2002:a5d:64ed:0:b0:20a:a5ea:e0cd with SMTP id
 g13-20020a5d64ed000000b0020aa5eae0cdmr1576698wri.520.1650347518882; 
 Mon, 18 Apr 2022 22:51:58 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 52/53] target/i386: do not access beyond the low 128 bits of
 SSE registers
Date: Tue, 19 Apr 2022 07:51:08 +0200
Message-Id: <20220419055109.142788-53-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The i386 target consolidates all vector registers so that instead of
XMMReg, YMMReg and ZMMReg structs there is a single ZMMReg that can
fit all of SSE, AVX and AVX512.

When TCG copies data from and to the SSE registers, it uses the
full 64-byte width.  This is not a correctness issue because TCG
never lets guest code see beyond the first 128 bits of the ZMM
registers, however it causes uninitialized stack memory to
make it to the CPU's migration stream.

Fix it by only copying the low 16 bytes of the ZMMReg union into
the destination register.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 75 +++++++++++++++++++++++++++----------------
 1 file changed, 47 insertions(+), 28 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 6f1fc174b3..e4d74b814a 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -22,6 +22,7 @@
 
 #if SHIFT == 0
 #define Reg MMXReg
+#define SIZE 8
 #define XMM_ONLY(...)
 #define B(n) MMX_B(n)
 #define W(n) MMX_W(n)
@@ -30,6 +31,7 @@
 #define SUFFIX _mmx
 #else
 #define Reg ZMMReg
+#define SIZE 16
 #define XMM_ONLY(...) __VA_ARGS__
 #define B(n) ZMM_B(n)
 #define W(n) ZMM_W(n)
@@ -38,6 +40,22 @@
 #define SUFFIX _xmm
 #endif
 
+/*
+ * Copy the relevant parts of a Reg value around. In the case where
+ * sizeof(Reg) > SIZE, these helpers operate only on the lower bytes of
+ * a 64 byte ZMMReg, so we must copy only those and keep the top bytes
+ * untouched in the guest-visible destination destination register.
+ * Note that the "lower bytes" are placed last in memory on big-endian
+ * hosts, which store the vector backwards in memory.  In that case the
+ * copy *starts* at B(SIZE - 1) and ends at B(0), the opposite of
+ * the little-endian case.
+ */
+#if HOST_BIG_ENDIAN
+#define MOVE(d, r) memcpy(&((d).B(SIZE - 1)), &(r).B(SIZE - 1), SIZE)
+#else
+#define MOVE(d, r) memcpy(&(d).B(0), &(r).B(0), SIZE)
+#endif
+
 void glue(helper_psrlw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
     int shift;
@@ -516,7 +534,7 @@ void glue(helper_pshufw, SUFFIX)(Reg *d, Reg *s, int order)
     r.W(1) = s->W((order >> 2) & 3);
     r.W(2) = s->W((order >> 4) & 3);
     r.W(3) = s->W((order >> 6) & 3);
-    *d = r;
+    MOVE(*d, r);
 }
 #else
 void helper_shufps(Reg *d, Reg *s, int order)
@@ -527,7 +545,7 @@ void helper_shufps(Reg *d, Reg *s, int order)
     r.L(1) = d->L((order >> 2) & 3);
     r.L(2) = s->L((order >> 4) & 3);
     r.L(3) = s->L((order >> 6) & 3);
-    *d = r;
+    MOVE(*d, r);
 }
 
 void helper_shufpd(Reg *d, Reg *s, int order)
@@ -536,7 +554,7 @@ void helper_shufpd(Reg *d, Reg *s, int order)
 
     r.Q(0) = d->Q(order & 1);
     r.Q(1) = s->Q((order >> 1) & 1);
-    *d = r;
+    MOVE(*d, r);
 }
 
 void glue(helper_pshufd, SUFFIX)(Reg *d, Reg *s, int order)
@@ -547,7 +565,7 @@ void glue(helper_pshufd, SUFFIX)(Reg *d, Reg *s, int order)
     r.L(1) = s->L((order >> 2) & 3);
     r.L(2) = s->L((order >> 4) & 3);
     r.L(3) = s->L((order >> 6) & 3);
-    *d = r;
+    MOVE(*d, r);
 }
 
 void glue(helper_pshuflw, SUFFIX)(Reg *d, Reg *s, int order)
@@ -559,7 +577,7 @@ void glue(helper_pshuflw, SUFFIX)(Reg *d, Reg *s, int order)
     r.W(2) = s->W((order >> 4) & 3);
     r.W(3) = s->W((order >> 6) & 3);
     r.Q(1) = s->Q(1);
-    *d = r;
+    MOVE(*d, r);
 }
 
 void glue(helper_pshufhw, SUFFIX)(Reg *d, Reg *s, int order)
@@ -571,7 +589,7 @@ void glue(helper_pshufhw, SUFFIX)(Reg *d, Reg *s, int order)
     r.W(5) = s->W(4 + ((order >> 2) & 3));
     r.W(6) = s->W(4 + ((order >> 4) & 3));
     r.W(7) = s->W(4 + ((order >> 6) & 3));
-    *d = r;
+    MOVE(*d, r);
 }
 #endif
 
@@ -937,7 +955,7 @@ void helper_haddps(CPUX86State *env, ZMMReg *d, ZMMReg *s)
     r.ZMM_S(1) = float32_add(d->ZMM_S(2), d->ZMM_S(3), &env->sse_status);
     r.ZMM_S(2) = float32_add(s->ZMM_S(0), s->ZMM_S(1), &env->sse_status);
     r.ZMM_S(3) = float32_add(s->ZMM_S(2), s->ZMM_S(3), &env->sse_status);
-    *d = r;
+    MOVE(*d, r);
 }
 
 void helper_haddpd(CPUX86State *env, ZMMReg *d, ZMMReg *s)
@@ -946,7 +964,7 @@ void helper_haddpd(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 
     r.ZMM_D(0) = float64_add(d->ZMM_D(0), d->ZMM_D(1), &env->sse_status);
     r.ZMM_D(1) = float64_add(s->ZMM_D(0), s->ZMM_D(1), &env->sse_status);
-    *d = r;
+    MOVE(*d, r);
 }
 
 void helper_hsubps(CPUX86State *env, ZMMReg *d, ZMMReg *s)
@@ -957,7 +975,7 @@ void helper_hsubps(CPUX86State *env, ZMMReg *d, ZMMReg *s)
     r.ZMM_S(1) = float32_sub(d->ZMM_S(2), d->ZMM_S(3), &env->sse_status);
     r.ZMM_S(2) = float32_sub(s->ZMM_S(0), s->ZMM_S(1), &env->sse_status);
     r.ZMM_S(3) = float32_sub(s->ZMM_S(2), s->ZMM_S(3), &env->sse_status);
-    *d = r;
+    MOVE(*d, r);
 }
 
 void helper_hsubpd(CPUX86State *env, ZMMReg *d, ZMMReg *s)
@@ -966,7 +984,7 @@ void helper_hsubpd(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 
     r.ZMM_D(0) = float64_sub(d->ZMM_D(0), d->ZMM_D(1), &env->sse_status);
     r.ZMM_D(1) = float64_sub(s->ZMM_D(0), s->ZMM_D(1), &env->sse_status);
-    *d = r;
+    MOVE(*d, r);
 }
 
 void helper_addsubps(CPUX86State *env, ZMMReg *d, ZMMReg *s)
@@ -1153,7 +1171,7 @@ void glue(helper_packsswb, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     r.B(14) = satsb((int16_t)s->W(6));
     r.B(15) = satsb((int16_t)s->W(7));
 #endif
-    *d = r;
+    MOVE(*d, r);
 }
 
 void glue(helper_packuswb, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
@@ -1180,7 +1198,7 @@ void glue(helper_packuswb, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     r.B(14) = satub((int16_t)s->W(6));
     r.B(15) = satub((int16_t)s->W(7));
 #endif
-    *d = r;
+    MOVE(*d, r);
 }
 
 void glue(helper_packssdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
@@ -1199,7 +1217,7 @@ void glue(helper_packssdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     r.W(6) = satsw(s->L(2));
     r.W(7) = satsw(s->L(3));
 #endif
-    *d = r;
+    MOVE(*d, r);
 }
 
 #define UNPCK_OP(base_name, base)                                       \
@@ -1227,7 +1245,7 @@ void glue(helper_packssdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
                  r.B(14) = d->B((base << (SHIFT + 2)) + 7);             \
                  r.B(15) = s->B((base << (SHIFT + 2)) + 7);             \
                                                                       ) \
-            *d = r;                                                     \
+        MOVE(*d, r);                                                    \
     }                                                                   \
                                                                         \
     void glue(helper_punpck ## base_name ## wd, SUFFIX)(CPUX86State *env,\
@@ -1245,7 +1263,7 @@ void glue(helper_packssdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
                  r.W(6) = d->W((base << (SHIFT + 1)) + 3);              \
                  r.W(7) = s->W((base << (SHIFT + 1)) + 3);              \
                                                                       ) \
-            *d = r;                                                     \
+            MOVE(*d, r);                                                \
     }                                                                   \
                                                                         \
     void glue(helper_punpck ## base_name ## dq, SUFFIX)(CPUX86State *env,\
@@ -1259,7 +1277,7 @@ void glue(helper_packssdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
                  r.L(2) = d->L((base << SHIFT) + 1);                    \
                  r.L(3) = s->L((base << SHIFT) + 1);                    \
                                                                       ) \
-            *d = r;                                                     \
+            MOVE(*d, r);                                                \
     }                                                                   \
                                                                         \
     XMM_ONLY(                                                           \
@@ -1272,7 +1290,7 @@ void glue(helper_packssdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
                                                                         \
                  r.Q(0) = d->Q(base);                                   \
                  r.Q(1) = s->Q(base);                                   \
-                 *d = r;                                                \
+                 MOVE(*d, r);                                           \
              }                                                          \
                                                                         )
 
@@ -1313,7 +1331,7 @@ void helper_pfacc(CPUX86State *env, MMXReg *d, MMXReg *s)
 
     r.MMX_S(0) = float32_add(d->MMX_S(0), d->MMX_S(1), &env->mmx_status);
     r.MMX_S(1) = float32_add(s->MMX_S(0), s->MMX_S(1), &env->mmx_status);
-    *d = r;
+    MOVE(*d, r);
 }
 
 void helper_pfadd(CPUX86State *env, MMXReg *d, MMXReg *s)
@@ -1378,7 +1396,7 @@ void helper_pfnacc(CPUX86State *env, MMXReg *d, MMXReg *s)
 
     r.MMX_S(0) = float32_sub(d->MMX_S(0), d->MMX_S(1), &env->mmx_status);
     r.MMX_S(1) = float32_sub(s->MMX_S(0), s->MMX_S(1), &env->mmx_status);
-    *d = r;
+    MOVE(*d, r);
 }
 
 void helper_pfpnacc(CPUX86State *env, MMXReg *d, MMXReg *s)
@@ -1387,7 +1405,7 @@ void helper_pfpnacc(CPUX86State *env, MMXReg *d, MMXReg *s)
 
     r.MMX_S(0) = float32_sub(d->MMX_S(0), d->MMX_S(1), &env->mmx_status);
     r.MMX_S(1) = float32_add(s->MMX_S(0), s->MMX_S(1), &env->mmx_status);
-    *d = r;
+    MOVE(*d, r);
 }
 
 void helper_pfrcp(CPUX86State *env, MMXReg *d, MMXReg *s)
@@ -1424,7 +1442,7 @@ void helper_pswapd(CPUX86State *env, MMXReg *d, MMXReg *s)
 
     r.MMX_L(0) = s->MMX_L(1);
     r.MMX_L(1) = s->MMX_L(0);
-    *d = r;
+    MOVE(*d, r);
 }
 #endif
 
@@ -1438,7 +1456,7 @@ void glue(helper_pshufb, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
         r.B(i) = (s->B(i) & 0x80) ? 0 : (d->B(s->B(i) & ((8 << SHIFT) - 1)));
     }
 
-    *d = r;
+    MOVE(*d, r);
 }
 
 void glue(helper_phaddw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
@@ -1455,7 +1473,7 @@ void glue(helper_phaddw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     XMM_ONLY(r.W(6) = (int16_t)s->W(4) + (int16_t)s->W(5));
     XMM_ONLY(r.W(7) = (int16_t)s->W(6) + (int16_t)s->W(7));
 
-    *d = r;
+    MOVE(*d, r);
 }
 
 void glue(helper_phaddd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
@@ -1467,7 +1485,7 @@ void glue(helper_phaddd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     r.L((1 << SHIFT) + 0) = (int32_t)s->L(0) + (int32_t)s->L(1);
     XMM_ONLY(r.L(3) = (int32_t)s->L(2) + (int32_t)s->L(3));
 
-    *d = r;
+    MOVE(*d, r);
 }
 
 void glue(helper_phaddsw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
@@ -1483,7 +1501,7 @@ void glue(helper_phaddsw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     XMM_ONLY(r.W(6) = satsw((int16_t)s->W(4) + (int16_t)s->W(5)));
     XMM_ONLY(r.W(7) = satsw((int16_t)s->W(6) + (int16_t)s->W(7)));
 
-    *d = r;
+    MOVE(*d, r);
 }
 
 void glue(helper_pmaddubsw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
@@ -1585,7 +1603,7 @@ void glue(helper_palignr, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 #undef SHR
     }
 
-    *d = r;
+    MOVE(*d, r);
 }
 
 #define XMM0 (env->xmm_regs[0])
@@ -1718,7 +1736,7 @@ void glue(helper_packusdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     r.W(5) = satuw((int32_t) s->L(1));
     r.W(6) = satuw((int32_t) s->L(2));
     r.W(7) = satuw((int32_t) s->L(3));
-    *d = r;
+    MOVE(*d, r);
 }
 
 #define FMINSB(d, s) MIN((int8_t)d, (int8_t)s)
@@ -1984,7 +2002,7 @@ void glue(helper_mpsadbw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
         r.W(i) += abs1(d->B(d0 + 3) - s->B(s0 + 3));
     }
 
-    *d = r;
+    MOVE(*d, r);
 }
 
 /* SSE4.2 op helpers */
@@ -2324,3 +2342,4 @@ void glue(helper_aeskeygenassist, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 #undef L
 #undef Q
 #undef SUFFIX
+#undef SIZE
-- 
2.35.1



