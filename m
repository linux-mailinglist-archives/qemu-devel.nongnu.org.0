Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1D46AF0C2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:36:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZc9g-0003fr-MY; Tue, 07 Mar 2023 13:35:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9e-0003di-Me
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:18 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9c-0007hm-TZ
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:18 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 u3-20020a17090a450300b00239db6d7d47so12707867pjg.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678214116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bHCGQCESVEEPvC5DOWFLFs1NM0Z82tHvGWwm98O3W3s=;
 b=DKK+aJnuwlR0gfrMcVLJY98e7rsjtBMBZIgiaVfEiHofnzwRX3XKGFk9pToc7oiqeZ
 oxboSstg/Ui920uyCF4G38IYjlb9XRMq96p+lQFBqQqIblKgyCo8PRjZgIUzELo4GeH+
 nXdJ6V4XA2oFtchq1hij0BmppJI50SsUNKjQ5Sln2TGOuQos7NU6Nz7CwYa5FhGyJFOi
 6cjWovoBFN+MvQO7GhnFEWetHGLGegjgc5M4cGUmkBGwayc+5jCPSH0l/D7B+1MwlzRl
 3k5L3eFhg/giDXQLSmAEjt2/hHQ0UdVZI1WRI8YDN8egZUVAy1qNzuWov9jK1FWMz0pT
 71AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678214116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bHCGQCESVEEPvC5DOWFLFs1NM0Z82tHvGWwm98O3W3s=;
 b=O1ON7Um+oHFt2EeaOAIno/GL0X/jvaWO31RF9zhHiwb6vfAG0+h5Wq840iezNGKcAh
 VgnU0tLT6pTl/XDRS9XsbxJoeKT5fpuNASmwMIHjGVy8MB0ypozVTI3aifP2xu+OcmUs
 DGAUtAd3w6Et9gZnSdcBy21bemA6QJvNOiIOEh9hSLRap9aJ1L3bhgmnPY49fPD0KcG0
 d+XJsCQdcYOVyH9+/XCaJyZ+GWPhcf9cQjHSn2b9tA73OiWm+p0wPycQ+nrBq2iRkPQ7
 5PPQ1TLNJ+9GcMGLz709NXTdpRvuN25rIRTQ7M9mMeCw1dt2Iv6B9XRpKHT8iZBgn+aD
 Lbsg==
X-Gm-Message-State: AO0yUKVEOW3xbYgpMse8hyVslszjMHFjBOphu1DDayUMJJcTV9wLAqHA
 mlDIP8MgCPfMhuo4q+VsM/uAHls/pVRiav1tsDY=
X-Google-Smtp-Source: AK7set/muPeD2CV9vndFmyanYtgNjamfb/TWiwIQM6/f4y23nR33Ciu05Z7qGeQkyaH2drIRHlw4Hw==
X-Received: by 2002:a17:90b:3142:b0:237:39b1:7b7 with SMTP id
 ip2-20020a17090b314200b0023739b107b7mr16188720pjb.11.1678214116203; 
 Tue, 07 Mar 2023 10:35:16 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a17090a1b0100b0022c0a05229fsm7757940pjq.41.2023.03.07.10.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:35:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 15/25] target/ppc: Avoid tcg_const_* in vmx-impl.c.inc
Date: Tue,  7 Mar 2023 10:34:53 -0800
Message-Id: <20230307183503.2512684-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307183503.2512684-1-richard.henderson@linaro.org>
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

All remaining uses are strictly read-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: Cédric Le Goater <clg@kaod.org>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Greg Kurz <groug@kaod.org>
Cc: qemu-ppc@nongnu.org
---
 target/ppc/translate/vmx-impl.c.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index ca27c11d87..112233b541 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1624,7 +1624,7 @@ static void glue(gen_, name)(DisasContext *ctx)                         \
             gen_exception(ctx, POWERPC_EXCP_VPU);                       \
             return;                                                     \
         }                                                               \
-        uimm = tcg_const_i32(UIMM5(ctx->opcode));                       \
+        uimm = tcg_constant_i32(UIMM5(ctx->opcode));                    \
         rb = gen_avr_ptr(rB(ctx->opcode));                              \
         rd = gen_avr_ptr(rD(ctx->opcode));                              \
         gen_helper_##name(cpu_env, rd, rb, uimm);                       \
@@ -1965,7 +1965,7 @@ static void gen_vsldoi(DisasContext *ctx)
     ra = gen_avr_ptr(rA(ctx->opcode));
     rb = gen_avr_ptr(rB(ctx->opcode));
     rd = gen_avr_ptr(rD(ctx->opcode));
-    sh = tcg_const_i32(VSH(ctx->opcode));
+    sh = tcg_constant_i32(VSH(ctx->opcode));
     gen_helper_vsldoi(rd, ra, rb, sh);
 }
 
@@ -2575,7 +2575,7 @@ static void gen_##op(DisasContext *ctx)             \
     rb = gen_avr_ptr(rB(ctx->opcode));              \
     rd = gen_avr_ptr(rD(ctx->opcode));              \
                                                     \
-    ps = tcg_const_i32((ctx->opcode & 0x200) != 0); \
+    ps = tcg_constant_i32((ctx->opcode & 0x200) != 0); \
                                                     \
     gen_helper_##op(cpu_crf[6], rd, ra, rb, ps);    \
 }
@@ -2594,7 +2594,7 @@ static void gen_##op(DisasContext *ctx)             \
     rb = gen_avr_ptr(rB(ctx->opcode));              \
     rd = gen_avr_ptr(rD(ctx->opcode));              \
                                                     \
-    ps = tcg_const_i32((ctx->opcode & 0x200) != 0); \
+    ps = tcg_constant_i32((ctx->opcode & 0x200) != 0); \
                                                     \
     gen_helper_##op(cpu_crf[6], rd, rb, ps);        \
 }
@@ -2726,7 +2726,7 @@ static void gen_##op(DisasContext *ctx)       \
     }                                         \
     ra = gen_avr_ptr(rA(ctx->opcode));        \
     rd = gen_avr_ptr(rD(ctx->opcode));        \
-    st_six = tcg_const_i32(rB(ctx->opcode));  \
+    st_six = tcg_constant_i32(rB(ctx->opcode));  \
     gen_helper_##op(rd, ra, st_six);          \
 }
 
-- 
2.34.1


