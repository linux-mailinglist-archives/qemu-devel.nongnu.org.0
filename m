Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A799158B09C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 21:59:09 +0200 (CEST)
Received: from localhost ([::1]:45744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK3TQ-0005El-Ql
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 15:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oK3Pl-0006O1-89
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 15:55:21 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:56281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oK3Pj-0004VJ-PK
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 15:55:20 -0400
Received: by mail-pj1-x1029.google.com with SMTP id a8so3657685pjg.5
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 12:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XoU1ivq664BvtVyoqP3w9U5Cy8Z2Wrd2UTjf3IBy+og=;
 b=FkgaMo+C+6HJ7MZqb7CEjwD5SBayfdFuUK2Scu2quYO3o4FKx3jXcYa9ud0WAgCSin
 ySmjj6lMnALnumdmlEALj2IwyIZajl53PSrIqnlV0Wyy1BQpWvdjLVRGMipxLOQwH92q
 KzKtJMluVe3x/4NwQKX/9jpeMlI7kU2p2NbX6oZqFqR4J6n8X97gZbMH0gZddhUAXZKy
 HYkyIzgUH0Qj9+1BucFb7pj3dFHvoUOPDsO4CXNHAYi5bO26z1Dfze2A+MlsAlVgtuhg
 Y1PDhYCCH5wbuteTn4xLZGeCUsweXExqwMYPxaQsUv+FD8K7gDR8OjD0XDJurCAEJJ7U
 C8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XoU1ivq664BvtVyoqP3w9U5Cy8Z2Wrd2UTjf3IBy+og=;
 b=pT8JXNMTs/AoAhltQhS6covNN8lE5fSPjYX8RICcisNSmjEBP0iXb7VMM75+o8adNb
 MaEVJjO0cg3KNDSEvxodieCnXKV/kKbod4iRs4Bb/dkxeq50aEFXh7Ur7ZjxFLcGoSX0
 yZIllzExIV46WpC27QWOrDotMNmp8y7AaX+SwVtgEcLNqyS8YFub9Wst1dK8v5URHXbT
 QOz2bhPQv6RGdfnKh5cZyI0M73TFUthSi6uMMgiXu/y8Dz/FccVCnsgFpTzLKUZegrYg
 dnBtanCgMKSMvNT2zN4p46av4y1D0kQQEw32qtPd8hEHfaR9/4lG9WuHtaqe6OusMqOw
 pVbg==
X-Gm-Message-State: ACgBeo1Ts/sf1/bp5McZ6hc7KSeoPMjhnjJm7PuSSbqfDSseaiUkUG6I
 CcxXlT6otC+IfBs0AVrK7TNX3pC4C0hTHA==
X-Google-Smtp-Source: AA6agR6HGWlkXQjYCp4wVYVTWW8rzrS9pS9gmbzfqZevMwJp6SIOtHv6Q5s8w1PuGbx2CGIGLCII2w==
X-Received: by 2002:a17:90b:4f42:b0:1f5:6976:7021 with SMTP id
 pj2-20020a17090b4f4200b001f569767021mr9472482pjb.30.1659729318421; 
 Fri, 05 Aug 2022 12:55:18 -0700 (PDT)
Received: from stoup.. ([2602:ae:154e:e201:abf8:e436:f4c:9089])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a170902f70d00b0016f0c2ea158sm3393048plo.157.2022.08.05.12.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 12:55:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Qi Hu <huqi@loongson.cn>,
	Song Gao <gaosong@loongson.cn>
Subject: [PULL 1/7] target/loongarch: Fix macros SET_FPU_* in cpu.h
Date: Fri,  5 Aug 2022 12:55:09 -0700
Message-Id: <20220805195515.349768-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805195515.349768-1-richard.henderson@linaro.org>
References: <20220805195515.349768-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

From: Qi Hu <huqi@loongson.cn>

The macros SET_FPU_* are used to set corresponding bits of fcsr.
Unfortunately it forgets to set the result and it causes fcsr's
"CAUSE" never being updated. This patch is to fix this bug.

Signed-off-by: Qi Hu <huqi@loongson.cn>
Reviewed-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20220804132450.314329-1-huqi@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/cpu.h | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index a36349df83..dce999aaac 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -47,11 +47,23 @@ FIELD(FCSR0, FLAGS, 16, 5)
 FIELD(FCSR0, CAUSE, 24, 5)
 
 #define GET_FP_CAUSE(REG)      FIELD_EX32(REG, FCSR0, CAUSE)
-#define SET_FP_CAUSE(REG, V)   FIELD_DP32(REG, FCSR0, CAUSE, V)
+#define SET_FP_CAUSE(REG, V) \
+    do { \
+        (REG) = FIELD_DP32(REG, FCSR0, CAUSE, V); \
+    } while (0)
+
 #define GET_FP_ENABLES(REG)    FIELD_EX32(REG, FCSR0, ENABLES)
-#define SET_FP_ENABLES(REG, V) FIELD_DP32(REG, FCSR0, ENABLES, V)
+#define SET_FP_ENABLES(REG, V) \
+    do { \
+        (REG) = FIELD_DP32(REG, FCSR0, ENABLES, V); \
+    } while (0)
+
 #define GET_FP_FLAGS(REG)      FIELD_EX32(REG, FCSR0, FLAGS)
-#define SET_FP_FLAGS(REG, V)   FIELD_DP32(REG, FCSR0, FLAGS, V)
+#define SET_FP_FLAGS(REG, V) \
+    do { \
+        (REG) = FIELD_DP32(REG, FCSR0, FLAGS, V); \
+    } while (0)
+
 #define UPDATE_FP_FLAGS(REG, V) \
     do { \
         (REG) |= FIELD_DP32(0, FCSR0, FLAGS, V); \
-- 
2.34.1


