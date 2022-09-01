Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 799AA5A92B4
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 11:06:09 +0200 (CEST)
Received: from localhost ([::1]:45510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTg9I-00068u-4c
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 05:06:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTexC-0001Tt-Qf
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:49:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTexB-0003Bn-16
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:49:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662018572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BybYTNikrXupXntL2EKojQjO6GO3TVFAcNn2eVVB5uY=;
 b=OHjrd+0Q9WjSnj4eJNLMe13Bv3VoWUKQCD4DRJPHuTt9Y4+CQBwm+arRIvidQQb/bNxy8F
 +b2tquxyW1c34NS1ecf5vgvotGGdAJPs9CcOYaRwzbWxzwyLSj3t37PHNCEU8wf9ZdFEIq
 z4EsvCSrYtAxIQYtVQzuWIE6Wfq5FEs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-398-EPABywsOOY-ph9_5Fr911g-1; Thu, 01 Sep 2022 03:49:31 -0400
X-MC-Unique: EPABywsOOY-ph9_5Fr911g-1
Received: by mail-wm1-f69.google.com with SMTP id
 r10-20020a1c440a000000b003a538a648a9so9471367wma.5
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 00:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=BybYTNikrXupXntL2EKojQjO6GO3TVFAcNn2eVVB5uY=;
 b=GB9VXbNz5Gdnq8wY63m6HL4zgfGOxqpK/PSmJW2FzBKU72FQanlDn/OSzbk3hTZsNP
 QA0amBSKR3YZ4aNQbRixgumUlguwmqLM93OSmWQt0FvD5UjZ4fuedas65+qak0CG0kOf
 JZUT5SQ4HNe+SfoQGNYafqwLog1EwiBI//Cg4Zi5h2TwF/mUtg8hJmavTF/SPdHvcFeO
 8H3NwM+eXLOLgTsi+kFSgbXEg7qTyb4qeOV4+nvD0YD46PnyPDOj9UGcMfA87hH+irtx
 z3rEJE7g09eZ/t1Yhf5UoDjA2WlLf+YFcEnUN0KEXqT0MsiOC2bpvgFXEfu9U1QaZ8SE
 N20Q==
X-Gm-Message-State: ACgBeo3RYV9v2P9Va3oT6qH5oQnwCumIA5pMarngHhgOwnNDKnkFA2/s
 1RnWuLr44azBn65x+gBHGE/xsbOmrMhYfvXC0CSfA3G1LDWvAkHFRDWff0/J4/AW743GmSB/Ctz
 TEWyeqriQDRY7T5+R80plddeY+8ph+h4isLfoRY9IW27oMKTaUOkTTMLmozdw/wL0aoM=
X-Received: by 2002:a7b:c7d8:0:b0:3a6:34d2:1705 with SMTP id
 z24-20020a7bc7d8000000b003a634d21705mr4188151wmk.206.1662018570033; 
 Thu, 01 Sep 2022 00:49:30 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5v7zs4fa2+G8/zvdsCqXAPRZlisulrGpRShVi1M8t5InxnfLTGqZQoCC1X9w595ZojntQqdQ==
X-Received: by 2002:a7b:c7d8:0:b0:3a6:34d2:1705 with SMTP id
 z24-20020a7bc7d8000000b003a634d21705mr4188138wmk.206.1662018569726; 
 Thu, 01 Sep 2022 00:49:29 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 bh11-20020a05600c3d0b00b003a53731f273sm4707928wmb.31.2022.09.01.00.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 00:49:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH v3 21/23] i386: Rewrite blendv helpers
Date: Thu,  1 Sep 2022 09:48:40 +0200
Message-Id: <20220901074842.57424-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220901074842.57424-1-pbonzini@redhat.com>
References: <20220901074842.57424-1-pbonzini@redhat.com>
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

Rewrite the blendv helpers so that they can easily be extended to support
the AVX encodings, which make all 4 arguments explicit.

No functional changes to the existing helpers

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-20-paul@nowt.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 86 ++++++++++++-------------------------------
 1 file changed, 24 insertions(+), 62 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 7cfbcce49f..a11a0143bf 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -1591,76 +1591,38 @@ void glue(helper_palignr, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
     }
 }
 
-#define XMM0 (env->xmm_regs[0])
+#if SHIFT >= 1
 
-#if SHIFT == 1
 #define SSE_HELPER_V(name, elem, num, F)                                \
-    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)           \
+    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)   \
     {                                                                   \
-        d->elem(0) = F(d->elem(0), s->elem(0), XMM0.elem(0));           \
-        d->elem(1) = F(d->elem(1), s->elem(1), XMM0.elem(1));           \
-        if (num > 2) {                                                  \
-            d->elem(2) = F(d->elem(2), s->elem(2), XMM0.elem(2));       \
-            d->elem(3) = F(d->elem(3), s->elem(3), XMM0.elem(3));       \
-            if (num > 4) {                                              \
-                d->elem(4) = F(d->elem(4), s->elem(4), XMM0.elem(4));   \
-                d->elem(5) = F(d->elem(5), s->elem(5), XMM0.elem(5));   \
-                d->elem(6) = F(d->elem(6), s->elem(6), XMM0.elem(6));   \
-                d->elem(7) = F(d->elem(7), s->elem(7), XMM0.elem(7));   \
-                if (num > 8) {                                          \
-                    d->elem(8) = F(d->elem(8), s->elem(8), XMM0.elem(8)); \
-                    d->elem(9) = F(d->elem(9), s->elem(9), XMM0.elem(9)); \
-                    d->elem(10) = F(d->elem(10), s->elem(10), XMM0.elem(10)); \
-                    d->elem(11) = F(d->elem(11), s->elem(11), XMM0.elem(11)); \
-                    d->elem(12) = F(d->elem(12), s->elem(12), XMM0.elem(12)); \
-                    d->elem(13) = F(d->elem(13), s->elem(13), XMM0.elem(13)); \
-                    d->elem(14) = F(d->elem(14), s->elem(14), XMM0.elem(14)); \
-                    d->elem(15) = F(d->elem(15), s->elem(15), XMM0.elem(15)); \
-                }                                                       \
-            }                                                           \
+        Reg *v = d;                                                     \
+        Reg *m = &env->xmm_regs[0];                                     \
+        int i;                                                          \
+        for (i = 0; i < num; i++) {                                     \
+            d->elem(i) = F(v->elem(i), s->elem(i), m->elem(i));         \
         }                                                               \
     }
 
 #define SSE_HELPER_I(name, elem, num, F)                                \
-    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, uint32_t imm) \
+    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,   \
+                            uint32_t imm)                               \
     {                                                                   \
-        d->elem(0) = F(d->elem(0), s->elem(0), ((imm >> 0) & 1));       \
-        d->elem(1) = F(d->elem(1), s->elem(1), ((imm >> 1) & 1));       \
-        if (num > 2) {                                                  \
-            d->elem(2) = F(d->elem(2), s->elem(2), ((imm >> 2) & 1));   \
-            d->elem(3) = F(d->elem(3), s->elem(3), ((imm >> 3) & 1));   \
-            if (num > 4) {                                              \
-                d->elem(4) = F(d->elem(4), s->elem(4), ((imm >> 4) & 1)); \
-                d->elem(5) = F(d->elem(5), s->elem(5), ((imm >> 5) & 1)); \
-                d->elem(6) = F(d->elem(6), s->elem(6), ((imm >> 6) & 1)); \
-                d->elem(7) = F(d->elem(7), s->elem(7), ((imm >> 7) & 1)); \
-                if (num > 8) {                                          \
-                    d->elem(8) = F(d->elem(8), s->elem(8), ((imm >> 8) & 1)); \
-                    d->elem(9) = F(d->elem(9), s->elem(9), ((imm >> 9) & 1)); \
-                    d->elem(10) = F(d->elem(10), s->elem(10),           \
-                                    ((imm >> 10) & 1));                 \
-                    d->elem(11) = F(d->elem(11), s->elem(11),           \
-                                    ((imm >> 11) & 1));                 \
-                    d->elem(12) = F(d->elem(12), s->elem(12),           \
-                                    ((imm >> 12) & 1));                 \
-                    d->elem(13) = F(d->elem(13), s->elem(13),           \
-                                    ((imm >> 13) & 1));                 \
-                    d->elem(14) = F(d->elem(14), s->elem(14),           \
-                                    ((imm >> 14) & 1));                 \
-                    d->elem(15) = F(d->elem(15), s->elem(15),           \
-                                    ((imm >> 15) & 1));                 \
-                }                                                       \
-            }                                                           \
+        Reg *v = d;                                                     \
+        int i;                                                          \
+        for (i = 0; i < num; i++) {                                     \
+            int j = i & 7;                                              \
+            d->elem(i) = F(v->elem(i), s->elem(i), (imm >> j) & 1);     \
         }                                                               \
     }
 
 /* SSE4.1 op helpers */
-#define FBLENDVB(d, s, m) ((m & 0x80) ? s : d)
-#define FBLENDVPS(d, s, m) ((m & 0x80000000) ? s : d)
-#define FBLENDVPD(d, s, m) ((m & 0x8000000000000000LL) ? s : d)
-SSE_HELPER_V(helper_pblendvb, B, 16, FBLENDVB)
-SSE_HELPER_V(helper_blendvps, L, 4, FBLENDVPS)
-SSE_HELPER_V(helper_blendvpd, Q, 2, FBLENDVPD)
+#define FBLENDVB(v, s, m) ((m & 0x80) ? s : v)
+#define FBLENDVPS(v, s, m) ((m & 0x80000000) ? s : v)
+#define FBLENDVPD(v, s, m) ((m & 0x8000000000000000LL) ? s : v)
+SSE_HELPER_V(helper_pblendvb, B, 8 << SHIFT, FBLENDVB)
+SSE_HELPER_V(helper_blendvps, L, 2 << SHIFT, FBLENDVPS)
+SSE_HELPER_V(helper_blendvpd, Q, 1 << SHIFT, FBLENDVPD)
 
 void glue(helper_ptest, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
@@ -1926,10 +1888,10 @@ void glue(helper_roundsd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 }
 #endif
 
-#define FBLENDP(d, s, m) (m ? s : d)
-SSE_HELPER_I(helper_blendps, L, 4, FBLENDP)
-SSE_HELPER_I(helper_blendpd, Q, 2, FBLENDP)
-SSE_HELPER_I(helper_pblendw, W, 8, FBLENDP)
+#define FBLENDP(v, s, m) (m ? s : v)
+SSE_HELPER_I(helper_blendps, L, 2 << SHIFT, FBLENDP)
+SSE_HELPER_I(helper_blendpd, Q, 1 << SHIFT, FBLENDP)
+SSE_HELPER_I(helper_pblendw, W, 4 << SHIFT, FBLENDP)
 
 void glue(helper_dpps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
                                uint32_t mask)
-- 
2.37.1



