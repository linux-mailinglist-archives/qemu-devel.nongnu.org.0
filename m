Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C21457282
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:12:26 +0100 (CET)
Received: from localhost ([::1]:39214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6Uz-0007fg-N3
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:12:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6O8-0004np-Dk
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:20 -0500
Received: from [2a00:1450:4864:20::335] (port=45003
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6O6-00047B-GD
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:20 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso7868344wme.3
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jEiQcufYOoW3VtmWCCkr3S7OMGfha+42dK/Pa431vkQ=;
 b=xbl8c3CXZ+PEiDpKW6oc08At+SJdpdgS6OhmNQNICyRED04i+uttLY/Zu8U7OuFx+B
 rmRnZsq7nLOpxS+d+9AnzGE8tffmeiU/cOeH8nABJ0USeWTo3NP4OYGJHomM6IYKCih1
 mA5Dz/F+FqYTHpM5QqUaQKb0iq1agLGC5c3PlC1xrXu3nSqgieLT3+60IMw027jpDc5a
 paD8rkV09BMUDv9spAkMnYdjIlJ3/y3TUSQAiNPL8IaApU9Lm0mmwT2gJQdNhzyz3ClI
 OFrRLq6k+7JKvKFNVslewsGF56aIW5KcVVN+bKTIEmTGBBt9+YqfZTPzNo9DiZkmzia4
 QB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jEiQcufYOoW3VtmWCCkr3S7OMGfha+42dK/Pa431vkQ=;
 b=h4sqyMdVqb/LlDQ5MCQ3lvSZ01nLw+Of9UnHNFb75YSU8nxi8rvu0LBwcEsmqdKYYh
 pF1ueMqzHjyZjKRsc2VvXqfK010LHUh+Vj0Zu3pABNEnm9AYiGy8ezBcq6GjRyU8p5vT
 Q4wdUAzgPuapKYtGKMkGkaQtWmvXAKF7oeigA8iDtnyN8/KBLoit+25ohiDCsedfo/E7
 GrQG5oHQ4FKWBW1orRK6ZTtvEnFwTKXEwDl/3B0ivK+FNENRFJhef2C0e0BuEyD8Rk6o
 rXKcXzMlY9XAcMEQduYpBM0UeOOiVXS2aEln1nA5znxYt4xLQE+rculYhauz1nHPh3wG
 jDMQ==
X-Gm-Message-State: AOAM533gDkP7WYP488OlZcg+GWBhno81jX8FxHIaHFa2jG6C1GuqM4Bt
 7TZIE2OLnJ23yfPM/EM/CtSbUys5fgtPhK5LqmI=
X-Google-Smtp-Source: ABdhPJyl2i3j7XuXbV80LbrlABOSTjRG7NHR4SNWHKTOX2if7uPCBjeQaRFH/VpgEo7TPMh/z1DXHA==
X-Received: by 2002:a05:600c:34d6:: with SMTP id
 d22mr866967wmq.111.1637337911423; 
 Fri, 19 Nov 2021 08:05:11 -0800 (PST)
Received: from localhost.localdomain
 (165.red-37-158-79.dynamicip.rima-tde.net. [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id q84sm14044877wme.3.2021.11.19.08.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:05:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/35] softfloat: Add flag specific to Inf - Inf
Date: Fri, 19 Nov 2021 17:04:29 +0100
Message-Id: <20211119160502.17432-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, alex.bennee@linaro.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PowerPC has this flag, and it's easier to compute it here
than after the fact.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-types.h | 1 +
 fpu/softfloat-parts.c.inc     | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.h
index 65a43aff59..eaa12e1e00 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -152,6 +152,7 @@ enum {
     float_flag_inexact         = 0x0010,
     float_flag_input_denormal  = 0x0020,
     float_flag_output_denormal = 0x0040,
+    float_flag_invalid_isi     = 0x0080,  /* inf - inf */
 };
 
 /*
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 41d4b17e41..eb2b475ca4 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -354,7 +354,7 @@ static FloatPartsN *partsN(addsub)(FloatPartsN *a, FloatPartsN *b,
                 return a;
             }
             /* Inf - Inf */
-            float_raise(float_flag_invalid, s);
+            float_raise(float_flag_invalid | float_flag_invalid_isi, s);
             parts_default_nan(a, s);
             return a;
         }
@@ -494,6 +494,7 @@ static FloatPartsN *partsN(muladd)(FloatPartsN *a, FloatPartsN *b,
 
         if (ab_mask & float_cmask_inf) {
             if (c->cls == float_class_inf && a->sign != c->sign) {
+                float_raise(float_flag_invalid | float_flag_invalid_isi, s);
                 goto d_nan;
             }
             goto return_inf;
-- 
2.25.1


