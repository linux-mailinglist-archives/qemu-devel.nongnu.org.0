Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB465418BB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 23:17:21 +0200 (CEST)
Received: from localhost ([::1]:48790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nygZl-0006E0-08
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 17:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftc-0000E9-3o
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:48 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:40825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftU-0007Gf-0X
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:47 -0400
Received: by mail-pg1-x52d.google.com with SMTP id f65so6752127pgc.7
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7xdazpoc98KTxU+Hkap6hV74hgs0EjjQuCmdWfoKk1g=;
 b=uHv8x/Nf/neIA93S+wbDDYJYsPsV/MqtVTAQmTlIjXJiapyq7dFbfboMwxhIW827Y4
 zQrm8DKH+1VqIjniD92OQjvoUddABJrw7B0rOC5bne6gsrwvPrALbPETZhDKBUoDeYgc
 T77DDXDUWI5ebZlsUPT4xrWrahIX6BgEYaqkPQ+9OExvG4MARHI3TKr99BhlijmBdsFH
 b6oOelGO/QptVsLP2zlPKPKvcsZrIX0ZhV90LbFaJJkb6nIUQ91tXeVQGOR1fRGJ90w/
 oletdaoLZeMQmxlHyMbEJEKUiQPl9XjKXGeSSt1OhAJDp14niW24dP6NYcv4Cr9wqyxx
 Mi+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7xdazpoc98KTxU+Hkap6hV74hgs0EjjQuCmdWfoKk1g=;
 b=6IHTh22HWPrl9LbURcxEFLEkQ5j2ORwc7JxMCNDi1x6856UN0ONgemNizePIRZJ2vG
 H6AJLl+oQdujmoYJwcx3Gv0/CxMZk8Wct8S7en2FJ7AtgwF+82YBAdaVyKCBViBDdEjZ
 MAiliKEgWcAl78CsJcGQFI74bweaGzwnwd9KrSesxi45TPoSipAqFVOUCoVXcuOSU3jY
 8zVKt/xJ/FWgcBrCEv5QS3P7JJxdPbpU6/RkkTz2g62LN/hTi+b7pomZx3k6qCQ4aLJ1
 gaGKStww8KREasf6nvxdqdPEiUxHHEJ7B5ifE0w0cXjcMsjYR3ACdFILR6N8TgcxbnzC
 J8FQ==
X-Gm-Message-State: AOAM533d7a+szqVoAni4Ge0f05U1mPrsm5PhKsAfrtxHs7hj0M3j3uYA
 MyKkQBLhUbcVx7kY0Fn6qpVWhRle0m0pxQ==
X-Google-Smtp-Source: ABdhPJw9SlGCccT/591rCxQn/fjxDfdwg5CPPElfsbHOkT/UgDXxAPjzCPEMtGo8sKY6wQpccXsenA==
X-Received: by 2002:a63:b55:0:b0:3fd:a384:bd10 with SMTP id
 a21-20020a630b55000000b003fda384bd10mr12291615pgl.534.1654634019154; 
 Tue, 07 Jun 2022 13:33:39 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 34/71] target/arm: Generalize cpu_arm_{get,
 set}_default_vec_len
Date: Tue,  7 Jun 2022 13:32:29 -0700
Message-Id: <20220607203306.657998-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

Rename from cpu_arm_{get,set}_sve_default_vec_len,
and take the pointer to default_vq from opaque.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index dcec0a6559..c5bfc3d082 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -638,11 +638,11 @@ static void cpu_arm_set_sve(Object *obj, bool value, Error **errp)
 
 #ifdef CONFIG_USER_ONLY
 /* Mirror linux /proc/sys/abi/sve_default_vector_length. */
-static void cpu_arm_set_sve_default_vec_len(Object *obj, Visitor *v,
-                                            const char *name, void *opaque,
-                                            Error **errp)
+static void cpu_arm_set_default_vec_len(Object *obj, Visitor *v,
+                                        const char *name, void *opaque,
+                                        Error **errp)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
+    uint32_t *ptr_default_vq = opaque;
     int32_t default_len, default_vq, remainder;
 
     if (!visit_type_int32(v, name, &default_len, errp)) {
@@ -651,7 +651,7 @@ static void cpu_arm_set_sve_default_vec_len(Object *obj, Visitor *v,
 
     /* Undocumented, but the kernel allows -1 to indicate "maximum". */
     if (default_len == -1) {
-        cpu->sve_default_vq = ARM_MAX_VQ;
+        *ptr_default_vq = ARM_MAX_VQ;
         return;
     }
 
@@ -675,15 +675,15 @@ static void cpu_arm_set_sve_default_vec_len(Object *obj, Visitor *v,
         return;
     }
 
-    cpu->sve_default_vq = default_vq;
+    *ptr_default_vq = default_vq;
 }
 
-static void cpu_arm_get_sve_default_vec_len(Object *obj, Visitor *v,
-                                            const char *name, void *opaque,
-                                            Error **errp)
+static void cpu_arm_get_default_vec_len(Object *obj, Visitor *v,
+                                        const char *name, void *opaque,
+                                        Error **errp)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
-    int32_t value = cpu->sve_default_vq * 16;
+    uint32_t *ptr_default_vq = opaque;
+    int32_t value = *ptr_default_vq * 16;
 
     visit_type_int32(v, name, &value, errp);
 }
@@ -706,8 +706,9 @@ void aarch64_add_sve_properties(Object *obj)
 #ifdef CONFIG_USER_ONLY
     /* Mirror linux /proc/sys/abi/sve_default_vector_length. */
     object_property_add(obj, "sve-default-vector-length", "int32",
-                        cpu_arm_get_sve_default_vec_len,
-                        cpu_arm_set_sve_default_vec_len, NULL, NULL);
+                        cpu_arm_get_default_vec_len,
+                        cpu_arm_set_default_vec_len, NULL,
+                        &cpu->sve_default_vq);
 #endif
 }
 
-- 
2.34.1


