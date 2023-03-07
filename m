Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3376AF0EE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:37:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZc9m-0003oi-L2; Tue, 07 Mar 2023 13:35:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9l-0003o4-78
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:25 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9j-0007n7-I6
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:24 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 h11-20020a17090a2ecb00b00237c740335cso12716170pjs.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678214123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/kqb+FJ785WyoATSXgO6HwVDPJoq2Vijw5MdWjgOOw4=;
 b=PLyTn2DPGX1LbvfwpQVKnzRmMw2pVKbYayXcBqIIjzdY9OtE4f2TULfb0yVHOA+Zm1
 BGLaxbxA87a0oNZ7F05UfBWUtsnJYpwOg4BCuGgnL0l7qZSOA4scyiX8Sa3fRsVIh8rV
 V8smTHgYiKm2o4IXw6brW+gT/Q1kHyd2UjZLmdtBDjJG41okpdSGaALfJBAPpeiYBVZO
 qIG+DrEH5EGY/FaVvz5sn40O+4mkVcNj83FjyZQyMxH2ccaoUegd4EL+yy1ll4u0U136
 /OuIiq/8sQjraxW1ffgz2tZhySwz3kcYbafXgAMHPDTPDx6GcrIa34FgyCvvkQQgaaIC
 ULXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678214123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/kqb+FJ785WyoATSXgO6HwVDPJoq2Vijw5MdWjgOOw4=;
 b=UOOV2qxJ1w79trVapl0z9PWB+bi2lDq4SzsD6fvnXkQBdvbODmqeXoNYoLlfoI0U6v
 wMFn+6tBsTCMJmJrHr8MygQ2dKIAaXlNHfsqpML85UftjLYoMuzYYiYQTsYtHd4g1dRF
 She5rPU+PG0D3x99t5VnDdTgVChhT13AYJfzWWy6ndWzJvvcLN6YLx4AZAZlFOUEBrQn
 5QIUihCsCQ/S46t8gS4XlpFtQJNkhCpdsutMnNbJWYE7ObBZP1a8W8LcMdLAJ/pDzsUt
 pSnYDJLp6NwnwLPqmCHBHt0neJp1QlsM8UAv7k8CxuazlVQZyhWTOHbZ4Sgv6XHsRMuz
 6CTg==
X-Gm-Message-State: AO0yUKUik9GZCg59vXpMmQhLE548L5ezFiz8c6fC2dmMIp14REibj/7r
 EFZSLiMNs6VzH+J3ZKcxmc7NWslPxr0et5qpCV0=
X-Google-Smtp-Source: AK7set9k2PzKcKpVvd96/Hd3u9ETX+MdCb3TyX+vvbRKdiWx/LWptD0y/on1d1z4MgdFfFzyUFfB4Q==
X-Received: by 2002:a17:90b:3a92:b0:233:b5c2:7d17 with SMTP id
 om18-20020a17090b3a9200b00233b5c27d17mr16025402pjb.23.1678214122749; 
 Tue, 07 Mar 2023 10:35:22 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a17090a1b0100b0022c0a05229fsm7757940pjq.41.2023.03.07.10.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:35:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v2 23/25] target/tricore: Use min/max for saturate
Date: Tue,  7 Mar 2023 10:35:01 -0800
Message-Id: <20230307183503.2512684-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307183503.2512684-1-richard.henderson@linaro.org>
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

Use tcg_constant_i32 for the bounds.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 target/tricore/translate.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index a3a5263a5d..2646cb3eb5 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -2443,21 +2443,13 @@ gen_msubsui_64(TCGv ret_low, TCGv ret_high, TCGv r1, TCGv r2_low, TCGv r2_high,
 
 static void gen_saturate(TCGv ret, TCGv arg, int32_t up, int32_t low)
 {
-    TCGv sat_neg = tcg_const_i32(low);
-    TCGv temp = tcg_const_i32(up);
-
-    /* sat_neg = (arg < low ) ? low : arg; */
-    tcg_gen_movcond_tl(TCG_COND_LT, sat_neg, arg, sat_neg, sat_neg, arg);
-
-    /* ret = (sat_neg > up ) ? up  : sat_neg; */
-    tcg_gen_movcond_tl(TCG_COND_GT, ret, sat_neg, temp, temp, sat_neg);
+    tcg_gen_smax_tl(ret, arg, tcg_constant_i32(low));
+    tcg_gen_smin_tl(ret, ret, tcg_constant_i32(up));
 }
 
 static void gen_saturate_u(TCGv ret, TCGv arg, int32_t up)
 {
-    TCGv temp = tcg_const_i32(up);
-    /* sat_neg = (arg > up ) ? up : arg; */
-    tcg_gen_movcond_tl(TCG_COND_GTU, ret, arg, temp, temp, arg);
+    tcg_gen_umin_tl(ret, arg, tcg_constant_i32(up));
 }
 
 static void gen_shi(TCGv ret, TCGv r1, int32_t shift_count)
-- 
2.34.1


