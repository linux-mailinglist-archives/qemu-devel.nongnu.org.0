Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5362E5A1C34
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:23:32 +0200 (CEST)
Received: from localhost ([::1]:36602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLG7-0001lW-5F
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRL7O-0007iD-OR
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:14:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRL7M-0002j4-V0
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:14:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661465668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mnq7WWcjlKpVAwqT57yhjo1aymVsPom9m3I11pNTPgc=;
 b=B3v+CMk4ivKwYLw+RhMMpytrKDcyzUMhEkdQr1LIWwQb+DKgfs46nUZXIp94p5rxmah55C
 B6nlzIohi61jGQnW6JkPP08Ba561qj6TKmEufhxM2V4dpoXyLy9rCGpVSjYmGtDIemWO3s
 tppBVVw4/MtUcCIUKAi7dOijeihtBQM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-528-DSYCEtbkNtyir1Te6sdApA-1; Thu, 25 Aug 2022 18:14:27 -0400
X-MC-Unique: DSYCEtbkNtyir1Te6sdApA-1
Received: by mail-wr1-f71.google.com with SMTP id
 e14-20020adf9bce000000b002254afda62aso2654280wrc.18
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:14:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=mnq7WWcjlKpVAwqT57yhjo1aymVsPom9m3I11pNTPgc=;
 b=6/+jVBMCKp/kb1DTuakOg4OeTvuzSCuGcAFBbEMQXoAUcjUXro0phoeSNtl+NyHEwZ
 qzF2b+AKMaCssiis2Ky1H4cRH3oRAnzVkv95t233O2V/LQQVI/B8g2cQ8631iOb596Fk
 upZLzqv2SEMN0D5xjkCs5ail3IKMV+yoTm1RvMHkpsgrTnbE9uDDOdyOJ7bv70IPqok2
 XVu/cLOxP36ivhYJ8ldeEZJBr4PSWYzuljDkN0ESvLgAW6pzPp/DDbBl68AAS7+NptFh
 rHEYGsovbolzHURUTSljJ0QstvvUqMPJI9vrqt2jSg52/1QqA4o0DYDTiY5bEVkkLZh3
 qakQ==
X-Gm-Message-State: ACgBeo1Gg2qREafzLnyj0EfyJXSoqmFBDM+QYbEXivcXLrO07/GUmSbf
 MgArHYCt16M1V8pIwPGSkG7B+5+D6eCX4aeITYRiiy2PdWJAgSUX/tPGhQyz8SmA0mEoKeAnXmR
 sWjBK30q94sUdt5o2MnqnE5amDX59ke+nykwkppueVrHARyQIEiZ/QwSVuqgVAFmzceQ=
X-Received: by 2002:a1c:7c0d:0:b0:3a6:673a:395e with SMTP id
 x13-20020a1c7c0d000000b003a6673a395emr3444144wmc.67.1661465665809; 
 Thu, 25 Aug 2022 15:14:25 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5Dh1UV/THjmIpB8zXJwCjfkkbTYq9eibr5dEZF3pmq3CqK+qVAtzV8mF4R81DIkq+lVMDWfQ==
X-Received: by 2002:a1c:7c0d:0:b0:3a6:673a:395e with SMTP id
 x13-20020a1c7c0d000000b003a6673a395emr3444132wmc.67.1661465665479; 
 Thu, 25 Aug 2022 15:14:25 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 b4-20020adff244000000b002238ea5750csm353993wrp.72.2022.08.25.15.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:14:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 07/18] i386: Rewrite simple integer vector helpers
Date: Fri, 26 Aug 2022 00:14:00 +0200
Message-Id: <20220825221411.35122-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825221411.35122-1-pbonzini@redhat.com>
References: <20220825221411.35122-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Paul Brook <paul@nowt.org>

Rewrite the "simple" vector integer helpers in preperation for AVX support.

While the current code is able to use the same prototype for unary
(a = F(b)) and binary (a = F(b, c)) operations, future changes will cause
them to diverge.

No functional changes to existing helpers

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-12-paul@nowt.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 96 +++++++++++++++++--------------------------
 1 file changed, 38 insertions(+), 58 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index a1d3fbc482..0b5a8a9b34 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -223,63 +223,36 @@ void glue(helper_pslldq, SUFFIX)(CPUX86State *env, Reg *d, Reg *c)
 }
 #endif
 
-#define SSE_HELPER_B(name, F)                                   \
+#define SSE_HELPER_1(name, elem, num, F)                        \
     void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)   \
     {                                                           \
-        d->B(0) = F(d->B(0), s->B(0));                          \
-        d->B(1) = F(d->B(1), s->B(1));                          \
-        d->B(2) = F(d->B(2), s->B(2));                          \
-        d->B(3) = F(d->B(3), s->B(3));                          \
-        d->B(4) = F(d->B(4), s->B(4));                          \
-        d->B(5) = F(d->B(5), s->B(5));                          \
-        d->B(6) = F(d->B(6), s->B(6));                          \
-        d->B(7) = F(d->B(7), s->B(7));                          \
-        XMM_ONLY(                                               \
-                 d->B(8) = F(d->B(8), s->B(8));                 \
-                 d->B(9) = F(d->B(9), s->B(9));                 \
-                 d->B(10) = F(d->B(10), s->B(10));              \
-                 d->B(11) = F(d->B(11), s->B(11));              \
-                 d->B(12) = F(d->B(12), s->B(12));              \
-                 d->B(13) = F(d->B(13), s->B(13));              \
-                 d->B(14) = F(d->B(14), s->B(14));              \
-                 d->B(15) = F(d->B(15), s->B(15));              \
-                                                        )       \
-            }
+        int n = num;                                            \
+        for (int i = 0; i < n; i++) {                           \
+            d->elem(i) = F(s->elem(i));                         \
+        }                                                       \
+    }
+
+#define SSE_HELPER_2(name, elem, num, F)                        \
+    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)   \
+    {                                                           \
+	Reg *v = d;                                             \
+        int n = num;                                            \
+        for (int i = 0; i < n; i++) {                           \
+            d->elem(i) = F(v->elem(i), s->elem(i));             \
+        }                                                       \
+    }
+
+#define SSE_HELPER_B(name, F)                                   \
+    SSE_HELPER_2(name, B, 8 << SHIFT, F)
 
 #define SSE_HELPER_W(name, F)                                   \
-    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)   \
-    {                                                           \
-        d->W(0) = F(d->W(0), s->W(0));                          \
-        d->W(1) = F(d->W(1), s->W(1));                          \
-        d->W(2) = F(d->W(2), s->W(2));                          \
-        d->W(3) = F(d->W(3), s->W(3));                          \
-        XMM_ONLY(                                               \
-                 d->W(4) = F(d->W(4), s->W(4));                 \
-                 d->W(5) = F(d->W(5), s->W(5));                 \
-                 d->W(6) = F(d->W(6), s->W(6));                 \
-                 d->W(7) = F(d->W(7), s->W(7));                 \
-                                                        )       \
-            }
+    SSE_HELPER_2(name, W, 4 << SHIFT, F)
 
 #define SSE_HELPER_L(name, F)                                   \
-    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)   \
-    {                                                           \
-        d->L(0) = F(d->L(0), s->L(0));                          \
-        d->L(1) = F(d->L(1), s->L(1));                          \
-        XMM_ONLY(                                               \
-                 d->L(2) = F(d->L(2), s->L(2));                 \
-                 d->L(3) = F(d->L(3), s->L(3));                 \
-                                                        )       \
-            }
+    SSE_HELPER_2(name, L, 2 << SHIFT, F)
 
 #define SSE_HELPER_Q(name, F)                                   \
-    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)   \
-    {                                                           \
-        d->Q(0) = F(d->Q(0), s->Q(0));                          \
-        XMM_ONLY(                                               \
-                 d->Q(1) = F(d->Q(1), s->Q(1));                 \
-                                                        )       \
-            }
+    SSE_HELPER_2(name, Q, 1 << SHIFT, F)
 
 #if SHIFT == 0
 static inline int satub(int x)
@@ -400,12 +373,19 @@ SSE_HELPER_W(helper_pcmpeqw, FCMPEQ)
 SSE_HELPER_L(helper_pcmpeql, FCMPEQ)
 
 SSE_HELPER_W(helper_pmullw, FMULLW)
-#if SHIFT == 0
-SSE_HELPER_W(helper_pmulhrw, FMULHRW)
-#endif
 SSE_HELPER_W(helper_pmulhuw, FMULHUW)
 SSE_HELPER_W(helper_pmulhw, FMULHW)
 
+#if SHIFT == 0
+void glue(helper_pmulhrw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
+{
+    d->W(0) = FMULHRW(d->W(0), s->W(0));
+    d->W(1) = FMULHRW(d->W(1), s->W(1));
+    d->W(2) = FMULHRW(d->W(2), s->W(2));
+    d->W(3) = FMULHRW(d->W(3), s->W(3));
+}
+#endif
+
 SSE_HELPER_B(helper_pavgb, FAVG)
 SSE_HELPER_W(helper_pavgw, FAVG)
 
@@ -1538,12 +1518,12 @@ void glue(helper_phsubsw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     MOVE(*d, r);
 }
 
-#define FABSB(_, x) (x > INT8_MAX  ? -(int8_t)x : x)
-#define FABSW(_, x) (x > INT16_MAX ? -(int16_t)x : x)
-#define FABSL(_, x) (x > INT32_MAX ? -(int32_t)x : x)
-SSE_HELPER_B(helper_pabsb, FABSB)
-SSE_HELPER_W(helper_pabsw, FABSW)
-SSE_HELPER_L(helper_pabsd, FABSL)
+#define FABSB(x) (x > INT8_MAX  ? -(int8_t)x : x)
+#define FABSW(x) (x > INT16_MAX ? -(int16_t)x : x)
+#define FABSL(x) (x > INT32_MAX ? -(int32_t)x : x)
+SSE_HELPER_1(helper_pabsb, B, 8 << SHIFT, FABSB)
+SSE_HELPER_1(helper_pabsw, W, 4 << SHIFT, FABSW)
+SSE_HELPER_1(helper_pabsd, L, 2 << SHIFT, FABSL)
 
 #define FMULHRSW(d, s) (((int16_t) d * (int16_t)s + 0x4000) >> 15)
 SSE_HELPER_W(helper_pmulhrsw, FMULHRSW)
-- 
2.37.1



