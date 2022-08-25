Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B74C5A1C55
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:28:49 +0200 (CEST)
Received: from localhost ([::1]:53244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLLE-0004C9-5t
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRL7c-0008Pw-N2
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:14:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRL7W-0002kM-AE
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:14:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661465677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qungBgIQRLzx+Bgep1MPWp2kJs22KSwmUKxLcHLUV5U=;
 b=cnqYoJNPoNetAVooqGwKjKxUBBEeTMsldZDA3ogCKZGVzZsl9Z5hzEt4xe0XSvbQObNbNz
 McPvT+wcldEVBimQ/ImmAbsn9pK5dftKOqMh3w9RktAqV1D6cpu2QvSlA29alI4xYSMOxG
 pGBDvfr2bKY86Dj+aafdchIsFKOJICY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-193-oR8j7igoOfmiho8eVCeJCg-1; Thu, 25 Aug 2022 18:14:36 -0400
X-MC-Unique: oR8j7igoOfmiho8eVCeJCg-1
Received: by mail-wm1-f71.google.com with SMTP id
 f9-20020a7bcd09000000b003a62725489bso1145072wmj.2
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:14:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=qungBgIQRLzx+Bgep1MPWp2kJs22KSwmUKxLcHLUV5U=;
 b=gYZxYwN34PBBRU5YMej6EoJj7TjVUrbd/IM3q324RfBoUS3FOw9169SS8WiDN/ADo2
 6DKzll9eWPRQCZb8jDk1/1+3pdpCV5mHiX71E24qUeczDmhtbTcrTDuUuYhIaGFwi5WF
 TExKGm7ZIJIQ1y2usmRt3yjuxFdIlZUonTigextT6gE9YBkUt315Nmu5trveWk9PhH8o
 9kjP/SO+9GiVTCvYpvjdcyOlpKxYPciad8OHmA637HHErj0oGRTht7xcAy/TyqlR5kXx
 +E3trAKWELWLSqGHphG8QHlEYwq9/0ZQ9Z3g0o3nHfTKne6efV9mor5V4hA5Iq/1fHGv
 yrRA==
X-Gm-Message-State: ACgBeo0gugoTgcUr5kZU6339y2Z0XAi4d1tJ8HLhrJTC5vgiY3Va+qKw
 nb+qK162sXMparQ9tVlOxRJVaIt/9cDvpxNKO9YwlFAj7UXYexepalkCt4galtltVVd9lf/Z8fy
 tG/zTDO8SfAViMVDp6FxVp+uNoAee2odncTmmOgl27ndOsyrQ7HohlH2UfXtbPOmDQuw=
X-Received: by 2002:a5d:47a9:0:b0:225:79bd:ad15 with SMTP id
 9-20020a5d47a9000000b0022579bdad15mr3063100wrb.9.1661465675049; 
 Thu, 25 Aug 2022 15:14:35 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6nPmxylQTqSkJq1+uVzM6oJG3V1a/RGAI8DbDPwyWop5orNFpiOgP3PTAfJQNLmmTLXl7PSg==
X-Received: by 2002:a5d:47a9:0:b0:225:79bd:ad15 with SMTP id
 9-20020a5d47a9000000b0022579bdad15mr3063093wrb.9.1661465674765; 
 Thu, 25 Aug 2022 15:14:34 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a5d668e000000b002253fd19a6asm430943wru.18.2022.08.25.15.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:14:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 13/18] i386: Dot product AVX helper prep
Date: Fri, 26 Aug 2022 00:14:06 +0200
Message-Id: <20220825221411.35122-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825221411.35122-1-pbonzini@redhat.com>
References: <20220825221411.35122-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Make the dpps and dppd helpers AVX-ready

I can't see any obvious reason why dppd shouldn't work on 256 bit ymm
registers, but both AMD and Intel agree that it's xmm only.

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-17-paul@nowt.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 80 ++++++++++++++++++++++++-------------------
 1 file changed, 45 insertions(+), 35 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 851a05d594..0493a26804 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -1942,55 +1942,64 @@ SSE_HELPER_I(helper_blendps, L, 4, FBLENDP)
 SSE_HELPER_I(helper_blendpd, Q, 2, FBLENDP)
 SSE_HELPER_I(helper_pblendw, W, 8, FBLENDP)
 
-void glue(helper_dpps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, uint32_t mask)
+void glue(helper_dpps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
+                               uint32_t mask)
 {
+    Reg *v = d;
     float32 prod1, prod2, temp2, temp3, temp4;
+    int i;
 
-    /*
-     * We must evaluate (A+B)+(C+D), not ((A+B)+C)+D
-     * to correctly round the intermediate results
-     */
-    if (mask & (1 << 4)) {
-        prod1 = float32_mul(d->ZMM_S(0), s->ZMM_S(0), &env->sse_status);
-    } else {
-        prod1 = float32_zero;
-    }
-    if (mask & (1 << 5)) {
-        prod2 = float32_mul(d->ZMM_S(1), s->ZMM_S(1), &env->sse_status);
-    } else {
-        prod2 = float32_zero;
-    }
-    temp2 = float32_add(prod1, prod2, &env->sse_status);
-    if (mask & (1 << 6)) {
-        prod1 = float32_mul(d->ZMM_S(2), s->ZMM_S(2), &env->sse_status);
-    } else {
-        prod1 = float32_zero;
-    }
-    if (mask & (1 << 7)) {
-        prod2 = float32_mul(d->ZMM_S(3), s->ZMM_S(3), &env->sse_status);
-    } else {
-        prod2 = float32_zero;
-    }
-    temp3 = float32_add(prod1, prod2, &env->sse_status);
-    temp4 = float32_add(temp2, temp3, &env->sse_status);
+    for (i = 0; i < 2 << SHIFT; i += 4) {
+        /*
+         * We must evaluate (A+B)+(C+D), not ((A+B)+C)+D
+         * to correctly round the intermediate results
+         */
+        if (mask & (1 << 4)) {
+            prod1 = float32_mul(v->ZMM_S(i), s->ZMM_S(i), &env->sse_status);
+        } else {
+            prod1 = float32_zero;
+        }
+        if (mask & (1 << 5)) {
+            prod2 = float32_mul(v->ZMM_S(i+1), s->ZMM_S(i+1), &env->sse_status);
+        } else {
+            prod2 = float32_zero;
+        }
+        temp2 = float32_add(prod1, prod2, &env->sse_status);
+        if (mask & (1 << 6)) {
+            prod1 = float32_mul(v->ZMM_S(i+2), s->ZMM_S(i+2), &env->sse_status);
+        } else {
+            prod1 = float32_zero;
+        }
+        if (mask & (1 << 7)) {
+            prod2 = float32_mul(v->ZMM_S(i+3), s->ZMM_S(i+3), &env->sse_status);
+        } else {
+            prod2 = float32_zero;
+        }
+        temp3 = float32_add(prod1, prod2, &env->sse_status);
+        temp4 = float32_add(temp2, temp3, &env->sse_status);
 
-    d->ZMM_S(0) = (mask & (1 << 0)) ? temp4 : float32_zero;
-    d->ZMM_S(1) = (mask & (1 << 1)) ? temp4 : float32_zero;
-    d->ZMM_S(2) = (mask & (1 << 2)) ? temp4 : float32_zero;
-    d->ZMM_S(3) = (mask & (1 << 3)) ? temp4 : float32_zero;
+        d->ZMM_S(i) = (mask & (1 << 0)) ? temp4 : float32_zero;
+        d->ZMM_S(i+1) = (mask & (1 << 1)) ? temp4 : float32_zero;
+        d->ZMM_S(i+2) = (mask & (1 << 2)) ? temp4 : float32_zero;
+        d->ZMM_S(i+3) = (mask & (1 << 3)) ? temp4 : float32_zero;
+    }
 }
 
-void glue(helper_dppd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, uint32_t mask)
+#if SHIFT == 1
+/* Oddly, there is no ymm version of dppd */
+void glue(helper_dppd, SUFFIX)(CPUX86State *env,
+                               Reg *d, Reg *s, uint32_t mask)
 {
+    Reg *v = d;
     float64 prod1, prod2, temp2;
 
     if (mask & (1 << 4)) {
-        prod1 = float64_mul(d->ZMM_D(0), s->ZMM_D(0), &env->sse_status);
+        prod1 = float64_mul(v->ZMM_D(0), s->ZMM_D(0), &env->sse_status);
     } else {
         prod1 = float64_zero;
     }
     if (mask & (1 << 5)) {
-        prod2 = float64_mul(d->ZMM_D(1), s->ZMM_D(1), &env->sse_status);
+        prod2 = float64_mul(v->ZMM_D(1), s->ZMM_D(1), &env->sse_status);
     } else {
         prod2 = float64_zero;
     }
@@ -1998,6 +2007,7 @@ void glue(helper_dppd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, uint32_t mask)
     d->ZMM_D(0) = (mask & (1 << 0)) ? temp2 : float64_zero;
     d->ZMM_D(1) = (mask & (1 << 1)) ? temp2 : float64_zero;
 }
+#endif
 
 void glue(helper_mpsadbw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
                                   uint32_t offset)
-- 
2.37.1



