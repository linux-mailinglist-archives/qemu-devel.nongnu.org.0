Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 862236AF0F4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:37:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZc9g-0003fq-K1; Tue, 07 Mar 2023 13:35:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9e-0003dX-7u
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:18 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9c-0007lJ-Mm
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:17 -0500
Received: by mail-pl1-x62c.google.com with SMTP id h8so15088079plf.10
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678214115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jq9KoSyW2mIrQO7O/lR75k8qpkz+hVmZSfTa0f3eIeM=;
 b=DpqwGgpUrmtWLimRhHciBDOZzi2+QW7Q1JhvErSpAZMlMEX5NRD6pIza+X9AlQM6Wo
 LiSKzZWoqi/TlDbVTlAKh4G1u361EDcOh2fbIToOM0VMg6zIbkwAY2qOBUgLYCB2UPyE
 Px5gZV8mS1eqpAbyvNzFbnFtzic0XvsU7ygJc8GC9KbGFq0OHvuYT8N9J3wUObAVgRh3
 qe7eJPW3Kxx8Ak+gjjd54WhQvqAfczPRGDuNo4c45qXtD2N3GodSjcjX7I/8Zvey9V6r
 a6FPYy2cHgrGTXPpEqgqRoHBsh1JBbHUA390qbgGLdjycny2wMZ/sS3RLzQgqVgroM8/
 2Gjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678214115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jq9KoSyW2mIrQO7O/lR75k8qpkz+hVmZSfTa0f3eIeM=;
 b=HgI602oXwGxKZM4KlanQ/QQhuZ+YLiCGKZ7Qr4Hw+1Uh5UbL9qhOv5u2f1/tHdt+EF
 iysKVyG7++WS8Q2AayH1PIimPkuLOEPg+iirBOAigBex5mOeAnbYa4TKGcHcIaaWTJK1
 gXBGCxMX4TTYJw5r4DNocOCumQuKSAdJrYM5Du7OdcVixI0w2DCHppeRXKE3lpUeT9OU
 WTKpEsARZrXk+hyl+EcsdLX+xl2dreIboRz8bHKZXgBHwguit6rSBdOb4GdX9eGqDeRx
 GWBSAw1W+wAAaKWMnXbkcb9pfN0iZq3JwfE39hedUMaaj5iQodXFxR27rw3T+jzlJPJr
 Dxag==
X-Gm-Message-State: AO0yUKWq30BQfSKDCTO+fJjHWSQmno8uFyjCTQ/K+VGip9Z5cSSZSCJ1
 14A3AJMMjsEefp4ElqNSye6gENnWYxLSoxRr1q4=
X-Google-Smtp-Source: AK7set+TAJZhsdeXZw3KraftO2KkMcAvbb0uxbDvv9ZtzuvrZr6b+FhajTHf/8duNTsKMiYzKEIM4w==
X-Received: by 2002:a17:90b:4ac4:b0:233:cbb9:9682 with SMTP id
 mh4-20020a17090b4ac400b00233cbb99682mr17275839pjb.24.1678214115418; 
 Tue, 07 Mar 2023 10:35:15 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a17090a1b0100b0022c0a05229fsm7757940pjq.41.2023.03.07.10.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:35:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 14/25] target/ppc: Avoid tcg_const_i64 in do_vcntmb
Date: Tue,  7 Mar 2023 10:34:52 -0800
Message-Id: <20230307183503.2512684-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307183503.2512684-1-richard.henderson@linaro.org>
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Compute both partial results separately and accumulate
at the end, instead of accumulating in the middle.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: Cédric Le Goater <clg@kaod.org>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Greg Kurz <groug@kaod.org>
Cc: qemu-ppc@nongnu.org
---
 target/ppc/translate/vmx-impl.c.inc | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 7af6d7217d..ca27c11d87 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -2236,24 +2236,25 @@ static bool trans_MTVSRBMI(DisasContext *ctx, arg_DX_b *a)
 
 static bool do_vcntmb(DisasContext *ctx, arg_VX_mp *a, int vece)
 {
-    TCGv_i64 rt, vrb, mask;
-    rt = tcg_const_i64(0);
-    vrb = tcg_temp_new_i64();
+    TCGv_i64 r[2], mask;
+
+    r[0] = tcg_temp_new_i64();
+    r[1] = tcg_temp_new_i64();
     mask = tcg_constant_i64(dup_const(vece, 1ULL << ((8 << vece) - 1)));
 
     for (int i = 0; i < 2; i++) {
-        get_avr64(vrb, a->vrb, i);
+        get_avr64(r[i], a->vrb, i);
         if (a->mp) {
-            tcg_gen_and_i64(vrb, mask, vrb);
+            tcg_gen_and_i64(r[i], mask, r[i]);
         } else {
-            tcg_gen_andc_i64(vrb, mask, vrb);
+            tcg_gen_andc_i64(r[i], mask, r[i]);
         }
-        tcg_gen_ctpop_i64(vrb, vrb);
-        tcg_gen_add_i64(rt, rt, vrb);
+        tcg_gen_ctpop_i64(r[i], r[i]);
     }
 
-    tcg_gen_shli_i64(rt, rt, TARGET_LONG_BITS - 8 + vece);
-    tcg_gen_trunc_i64_tl(cpu_gpr[a->rt], rt);
+    tcg_gen_add_i64(r[0], r[0], r[1]);
+    tcg_gen_shli_i64(r[0], r[0], TARGET_LONG_BITS - 8 + vece);
+    tcg_gen_trunc_i64_tl(cpu_gpr[a->rt], r[0]);
     return true;
 }
 
-- 
2.34.1


