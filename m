Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 328BC54564C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 23:12:45 +0200 (CEST)
Received: from localhost ([::1]:42314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzPSO-0000D1-8F
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 17:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmP-00044h-TH
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:21 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:45692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmM-0008VU-FW
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:21 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 w2-20020a17090ac98200b001e0519fe5a8so348855pjt.4
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 13:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+8pdwGU+0yoxMh5SE6yAGZhMV/fFIOLe/XYFBrqv9Rs=;
 b=oPgPlJlfZjbUYgZUzozivO2NeLRXciIzuAJfreX47HhFV+CgH8xszk7voqY/AML7Ff
 eqiHt4D+PU1WZMVYJxxsHEvTROv0/UGeXrHvWqWU1TQPXPF7Ta0zVNS2JW2GlK8LNc7R
 8bwULEGnsG69hUYEsIvG8JdxCQ9iJucWFiWUTCq+DxXX6niAgW39LiMa/qNS8pVgzdhV
 tKQLQf+wduDIqceqKdgVlUXwzJfiqBL9rsCsXyphPQEmpQRjQwbQb7tEEIDtd3dQdliT
 e2V969gKQ35lVw4HxZsI+t+0wASGw9JIvxpXx22sfdWT6OGxJivk7yfiOCb+CngZMt/v
 RT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+8pdwGU+0yoxMh5SE6yAGZhMV/fFIOLe/XYFBrqv9Rs=;
 b=mQr/K+jOB0QLGKpchcpa7i7Itk2OjThb6oArlUSRxLRGwX+xt5agPHNq2fbWiaYrq7
 nRxUzRWEyKlVno3XcE+EZM0ZXsOrIKpZZTg8TiVb8LDhahYgu4wTYYruIFTuMWzzmXp5
 6e6NKlUSrnIu/99szYTan8oT0CuNdMzy/os3Yjzt+FqZBql5YiQhQ76c+nBTcfnJs+Sp
 bV3TQskd8F8NDvC2ZUaDlQ+alPDfiCYHmrTUNQBoFvxIfWmGu+vDqQShn7omf6uTH5cX
 Rw15dy3gTIrLi+vA0IVXtmO9bM/h5QBwNQctoflnJ5EteimiIo6mf2o0DiK9prXfqcsi
 9/Ag==
X-Gm-Message-State: AOAM532ntL9590+cK3OKXT6UDoWywq5jjT79rNd3cMs4YdL1Cur1bWqL
 O51tNWDs763nvNXVB8LZeKwerFBub6wMPA==
X-Google-Smtp-Source: ABdhPJxQrWH+k+HQmd69HGK/9psWYiHdIiW1yDZ8KtXpEOLl/x71FH61nr/brV/hEAfgCabgRw5pPg==
X-Received: by 2002:a17:902:b090:b0:167:7ae5:e13b with SMTP id
 p16-20020a170902b09000b001677ae5e13bmr22908263plr.170.1654806556009; 
 Thu, 09 Jun 2022 13:29:16 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 15/23] target/arm: Move gen_exception to translate.c
Date: Thu,  9 Jun 2022 13:28:53 -0700
Message-Id: <20220609202901.1177572-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

This function is not required by any other translation file.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h | 8 --------
 target/arm/translate.c | 7 +++++++
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 8685f55e80..850bcdc155 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -328,14 +328,6 @@ static inline void gen_ss_advance(DisasContext *s)
     }
 }
 
-static inline void gen_exception(int excp, uint32_t syndrome,
-                                 uint32_t target_el)
-{
-    gen_helper_exception_with_syndrome_el(cpu_env, tcg_constant_i32(excp),
-                                          tcg_constant_i32(syndrome),
-                                          tcg_constant_i32(target_el));
-}
-
 /* Generate an architectural singlestep exception */
 static inline void gen_swstep_exception(DisasContext *s, int isv, int ex)
 {
diff --git a/target/arm/translate.c b/target/arm/translate.c
index b8a8972bac..fc5eafaeeb 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1086,6 +1086,13 @@ static void gen_exception_internal_insn(DisasContext *s, uint32_t pc, int excp)
     s->base.is_jmp = DISAS_NORETURN;
 }
 
+static void gen_exception(int excp, uint32_t syndrome, uint32_t target_el)
+{
+    gen_helper_exception_with_syndrome_el(cpu_env, tcg_constant_i32(excp),
+                                          tcg_constant_i32(syndrome),
+                                          tcg_constant_i32(target_el));
+}
+
 static void gen_exception_insn_el_v(DisasContext *s, uint64_t pc, int excp,
                                     uint32_t syn, TCGv_i32 tcg_el)
 {
-- 
2.34.1


