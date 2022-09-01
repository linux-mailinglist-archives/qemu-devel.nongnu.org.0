Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE895A9FD7
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 21:24:07 +0200 (CEST)
Received: from localhost ([::1]:44214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTpnK-0005Xe-Kl
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 15:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oToso-0008UG-S0
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTosi-0000AH-B1
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662056735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YDCOdhslRYHJ7FUwL54BbQclcrKm5tMvtkUVOBcj/yo=;
 b=T7rD8gTZLhThpRZKjqtM1xFNac+kMkfUc45O2kgTQX55cwWlgMCX/psJg+TpiRKgPLz5dz
 thq7+WEfq8WAvK+C2rDiyj10nEnVC2ELvjemb3EBLrnYw3mfaBxGrEJg1d1juE32A6EuZX
 jHY2UsqWMY5cSOCndEvA4i9DzbVS/vM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-624-SGUjQnwQNlialZO5xvu3fw-1; Thu, 01 Sep 2022 14:25:34 -0400
X-MC-Unique: SGUjQnwQNlialZO5xvu3fw-1
Received: by mail-ej1-f69.google.com with SMTP id
 hs4-20020a1709073e8400b0073d66965277so7150497ejc.6
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 11:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=YDCOdhslRYHJ7FUwL54BbQclcrKm5tMvtkUVOBcj/yo=;
 b=IdrccLYsWsAUPg7xf02Se/gFVPXUDWPSuzvYekVT7nP6crpx2wo9eDNtWbSvqnB1XZ
 iaaL/N5d0lsJ48JjViB6vVIfTU/sf9dcAs9wqA8+R/tqdyga2P52IqEDjfUbEEvSZT9p
 adyJflzw9SJwPaLC1FZgyK/f4MAYhYGwwuqnt3cNOVzL+1JSWQKhcFdqqbP2qBK8mlIz
 tyOhlnv0QVFOLwmdXynFUzyUct5iU0APQmVtqBFQoOHw2repWFmbMrI+udV2JO5S52zU
 jq54BxNC6LX9Fk4PTSepxkjaOvV2/sQQsXt1+KoFXbV9xKvKrw4cdIqHzSrn/y/aXR7U
 L7Ug==
X-Gm-Message-State: ACgBeo0U6wqksGzojZwjQOWKbdW1tH7R2hN0HfIuRop0Iqr9lPzwJy61
 btXg1A9GRSvnrNimVv4PlPE2PnVDLc/hVIbIDj2Pf0VHxtRhoBfE5OQSany3rCuBmu+OvBjHEio
 HIZgRsgULkamqX27fWt80rori0FApHOaLuHi10SGrrxWFbmUak+LLUSAPNTJvSuqAiJU=
X-Received: by 2002:a17:907:6293:b0:73d:b27b:e594 with SMTP id
 nd19-20020a170907629300b0073db27be594mr25083692ejc.526.1662056732582; 
 Thu, 01 Sep 2022 11:25:32 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7r9zCSsgIWUx3ChCzoIvR1uRzUAeaCNudOHRO3FSPGrdEzi00YUO8bY9SboQIDCTbzHwau6Q==
X-Received: by 2002:a17:907:6293:b0:73d:b27b:e594 with SMTP id
 nd19-20020a170907629300b0073db27be594mr25083673ejc.526.1662056732188; 
 Thu, 01 Sep 2022 11:25:32 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 v30-20020a50d09e000000b00446639c01easm1806492edd.44.2022.09.01.11.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 11:25:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paul Brook <paul@nowt.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 33/39] target/i386: reimplement AVX comparison helpers
Date: Thu,  1 Sep 2022 20:24:23 +0200
Message-Id: <20220901182429.93533-34-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220901182429.93533-1-pbonzini@redhat.com>
References: <20220901182429.93533-1-pbonzini@redhat.com>
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

AVX includes an additional set of comparison predicates, some of which
our softfloat implementation does not expose as separate functions.
Rewrite the helpers in terms of floatN_compare for future extensibility.

Signed-off-by: Paul Brook <paul@nowt.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220424220204.2493824-24-paul@nowt.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h        | 97 ++++++++++++++++++++----------------
 target/i386/ops_sse_header.h | 24 ++++-----
 target/i386/tcg/translate.c  | 20 ++++----
 3 files changed, 75 insertions(+), 66 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 86ca74492e..7463ff1599 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -1005,57 +1005,66 @@ void glue(helper_addsubpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
     }
 }
 
-/* XXX: unordered */
-#define SSE_HELPER_CMP(name, F)                                         \
-    void glue(helper_ ## name ## ps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)\
+#define SSE_HELPER_CMP_P(name, F, C)                                    \
+    void glue(helper_ ## name ## ps, SUFFIX)(CPUX86State *env,          \
+                                             Reg *d, Reg *s)    \
     {                                                                   \
-        d->ZMM_L(0) = F(32, d->ZMM_S(0), s->ZMM_S(0));                  \
-        d->ZMM_L(1) = F(32, d->ZMM_S(1), s->ZMM_S(1));                  \
-        d->ZMM_L(2) = F(32, d->ZMM_S(2), s->ZMM_S(2));                  \
-        d->ZMM_L(3) = F(32, d->ZMM_S(3), s->ZMM_S(3));                  \
+        Reg *v = d;                                                     \
+        int i;                                                          \
+        for (i = 0; i < 2 << SHIFT; i++) {                              \
+            d->ZMM_L(i) = C(F(32, v->ZMM_S(i), s->ZMM_S(i))) ? -1 : 0;  \
+        }                                                               \
     }                                                                   \
                                                                         \
-    void helper_ ## name ## ss(CPUX86State *env, Reg *d, Reg *s)        \
+    void glue(helper_ ## name ## pd, SUFFIX)(CPUX86State *env,          \
+                                             Reg *d, Reg *s)    \
     {                                                                   \
-        d->ZMM_L(0) = F(32, d->ZMM_S(0), s->ZMM_S(0));                  \
-    }                                                                   \
-                                                                        \
-    void glue(helper_ ## name ## pd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)\
-    {                                                                   \
-        d->ZMM_Q(0) = F(64, d->ZMM_D(0), s->ZMM_D(0));                  \
-        d->ZMM_Q(1) = F(64, d->ZMM_D(1), s->ZMM_D(1));                  \
-    }                                                                   \
-                                                                        \
-    void helper_ ## name ## sd(CPUX86State *env, Reg *d, Reg *s)        \
-    {                                                                   \
-        d->ZMM_Q(0) = F(64, d->ZMM_D(0), s->ZMM_D(0));                  \
+        Reg *v = d;                                                     \
+        int i;                                                          \
+        for (i = 0; i < 1 << SHIFT; i++) {                              \
+            d->ZMM_Q(i) = C(F(64, v->ZMM_D(i), s->ZMM_D(i))) ? -1 : 0;  \
+        }                                                               \
     }
 
-#define FPU_CMPEQ(size, a, b)                                           \
-    (float ## size ## _eq_quiet(a, b, &env->sse_status) ? -1 : 0)
-#define FPU_CMPLT(size, a, b)                                           \
-    (float ## size ## _lt(a, b, &env->sse_status) ? -1 : 0)
-#define FPU_CMPLE(size, a, b)                                           \
-    (float ## size ## _le(a, b, &env->sse_status) ? -1 : 0)
-#define FPU_CMPUNORD(size, a, b)                                        \
-    (float ## size ## _unordered_quiet(a, b, &env->sse_status) ? -1 : 0)
-#define FPU_CMPNEQ(size, a, b)                                          \
-    (float ## size ## _eq_quiet(a, b, &env->sse_status) ? 0 : -1)
-#define FPU_CMPNLT(size, a, b)                                          \
-    (float ## size ## _lt(a, b, &env->sse_status) ? 0 : -1)
-#define FPU_CMPNLE(size, a, b)                                          \
-    (float ## size ## _le(a, b, &env->sse_status) ? 0 : -1)
-#define FPU_CMPORD(size, a, b)                                          \
-    (float ## size ## _unordered_quiet(a, b, &env->sse_status) ? 0 : -1)
+#if SHIFT == 1
+#define SSE_HELPER_CMP(name, F, C)                                          \
+    SSE_HELPER_CMP_P(name, F, C)                                            \
+    void helper_ ## name ## ss(CPUX86State *env, Reg *d, Reg *s)    \
+    {                                                                       \
+        Reg *v = d;                                                         \
+        d->ZMM_L(0) = C(F(32, v->ZMM_S(0), s->ZMM_S(0))) ? -1 : 0;          \
+    }                                                                       \
+                                                                            \
+    void helper_ ## name ## sd(CPUX86State *env, Reg *d, Reg *s)    \
+    {                                                                       \
+        Reg *v = d;                                                         \
+        d->ZMM_Q(0) = C(F(64, v->ZMM_D(0), s->ZMM_D(0))) ? -1 : 0;          \
+    }
 
-SSE_HELPER_CMP(cmpeq, FPU_CMPEQ)
-SSE_HELPER_CMP(cmplt, FPU_CMPLT)
-SSE_HELPER_CMP(cmple, FPU_CMPLE)
-SSE_HELPER_CMP(cmpunord, FPU_CMPUNORD)
-SSE_HELPER_CMP(cmpneq, FPU_CMPNEQ)
-SSE_HELPER_CMP(cmpnlt, FPU_CMPNLT)
-SSE_HELPER_CMP(cmpnle, FPU_CMPNLE)
-SSE_HELPER_CMP(cmpord, FPU_CMPORD)
+#define FPU_EQ(x) (x == float_relation_equal)
+#define FPU_LT(x) (x == float_relation_less)
+#define FPU_LE(x) (x <= float_relation_equal)
+#define FPU_UNORD(x) (x == float_relation_unordered)
+
+#define FPU_CMPQ(size, a, b) \
+    float ## size ## _compare_quiet(a, b, &env->sse_status)
+#define FPU_CMPS(size, a, b) \
+    float ## size ## _compare(a, b, &env->sse_status)
+
+#else
+#define SSE_HELPER_CMP(name, F, C) SSE_HELPER_CMP_P(name, F, C)
+#endif
+
+SSE_HELPER_CMP(cmpeq, FPU_CMPQ, FPU_EQ)
+SSE_HELPER_CMP(cmplt, FPU_CMPS, FPU_LT)
+SSE_HELPER_CMP(cmple, FPU_CMPS, FPU_LE)
+SSE_HELPER_CMP(cmpunord, FPU_CMPQ,  FPU_UNORD)
+SSE_HELPER_CMP(cmpneq, FPU_CMPQ, !FPU_EQ)
+SSE_HELPER_CMP(cmpnlt, FPU_CMPS, !FPU_LT)
+SSE_HELPER_CMP(cmpnle, FPU_CMPS, !FPU_LE)
+SSE_HELPER_CMP(cmpord, FPU_CMPQ, !FPU_UNORD)
+
+#undef SSE_HELPER_CMP
 
 static const int comis_eflags[4] = {CC_C, CC_Z, 0, CC_Z | CC_P | CC_C};
 
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index fc697536a0..d99464afb0 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -201,20 +201,20 @@ DEF_HELPER_3(glue(hsubpd, SUFFIX), void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(glue(addsubps, SUFFIX), void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(glue(addsubpd, SUFFIX), void, env, ZMMReg, ZMMReg)
 
-#define SSE_HELPER_CMP(name, F)                           \
-    DEF_HELPER_3(glue(name ## ps, SUFFIX), void, env, Reg, Reg)         \
-    DEF_HELPER_3(name ## ss, void, env, Reg, Reg)         \
-    DEF_HELPER_3(glue(name ## pd, SUFFIX), void, env, Reg, Reg)         \
+#define SSE_HELPER_CMP(name, F, C)                              \
+    DEF_HELPER_3(glue(name ## ps, SUFFIX), void, env, Reg, Reg) \
+    DEF_HELPER_3(name ## ss, void, env, Reg, Reg)               \
+    DEF_HELPER_3(glue(name ## pd, SUFFIX), void, env, Reg, Reg) \
     DEF_HELPER_3(name ## sd, void, env, Reg, Reg)
 
-SSE_HELPER_CMP(cmpeq, FPU_CMPEQ)
-SSE_HELPER_CMP(cmplt, FPU_CMPLT)
-SSE_HELPER_CMP(cmple, FPU_CMPLE)
-SSE_HELPER_CMP(cmpunord, FPU_CMPUNORD)
-SSE_HELPER_CMP(cmpneq, FPU_CMPNEQ)
-SSE_HELPER_CMP(cmpnlt, FPU_CMPNLT)
-SSE_HELPER_CMP(cmpnle, FPU_CMPNLE)
-SSE_HELPER_CMP(cmpord, FPU_CMPORD)
+SSE_HELPER_CMP(cmpeq, FPU_CMPQ, FPU_EQ)
+SSE_HELPER_CMP(cmplt, FPU_CMPS, FPU_LT)
+SSE_HELPER_CMP(cmple, FPU_CMPS, FPU_LE)
+SSE_HELPER_CMP(cmpunord, FPU_CMPQ,  FPU_UNORD)
+SSE_HELPER_CMP(cmpneq, FPU_CMPQ, !FPU_EQ)
+SSE_HELPER_CMP(cmpnlt, FPU_CMPS, !FPU_LT)
+SSE_HELPER_CMP(cmpnle, FPU_CMPS, !FPU_LE)
+SSE_HELPER_CMP(cmpord, FPU_CMPQ, !FPU_UNORD)
 
 DEF_HELPER_3(ucomiss, void, env, Reg, Reg)
 DEF_HELPER_3(comiss, void, env, Reg, Reg)
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 99c84473f4..fc081e6ad6 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3022,20 +3022,20 @@ static const SSEFunc_l_ep sse_op_table3bq[] = {
 };
 #endif
 
-#define SSE_FOP(x) { \
+#define SSE_CMP(x) { \
     gen_helper_ ## x ## ps ## _xmm, gen_helper_ ## x ## pd ## _xmm, \
     gen_helper_ ## x ## ss, gen_helper_ ## x ## sd}
 static const SSEFunc_0_epp sse_op_table4[8][4] = {
-    SSE_FOP(cmpeq),
-    SSE_FOP(cmplt),
-    SSE_FOP(cmple),
-    SSE_FOP(cmpunord),
-    SSE_FOP(cmpneq),
-    SSE_FOP(cmpnlt),
-    SSE_FOP(cmpnle),
-    SSE_FOP(cmpord),
+    SSE_CMP(cmpeq),
+    SSE_CMP(cmplt),
+    SSE_CMP(cmple),
+    SSE_CMP(cmpunord),
+    SSE_CMP(cmpneq),
+    SSE_CMP(cmpnlt),
+    SSE_CMP(cmpnle),
+    SSE_CMP(cmpord),
 };
-#undef SSE_FOP
+#undef SSE_CMP
 
 static const SSEFunc_0_epp sse_op_table5[256] = {
     [0x0c] = gen_helper_pi2fw,
-- 
2.37.2



