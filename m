Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E56B353C0DE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:39:21 +0200 (CEST)
Received: from localhost ([::1]:47934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwtTM-0000Jj-W2
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwshD-0005E8-6e
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:35 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:34462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsh3-0000EF-UP
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:34 -0400
Received: by mail-pl1-x62e.google.com with SMTP id n8so5549382plh.1
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7xdazpoc98KTxU+Hkap6hV74hgs0EjjQuCmdWfoKk1g=;
 b=k/0rUhe93OnFpqfx96UKtFrthpyt5fraiPax6W4qdLrQZM0Vndxhk3/P8nSZ542XRO
 ySBOBL7OuHgSkho2UceHuQhS7cJajsl/gXcPWhtbC7k36B/DndU5+fExikfHhZnXBeYM
 RW0/PKDllXKL2gxYVZ5ZTx/H0T9RYiZR6pIaCCag1DsBtUouH3pjvjpzgX2XLFCw6zGX
 L3kmayLpNdhdptNLDLTJCbRFs80y4MxxyrJ8DZck/ls9/B8ZqBCcCy7sOVkw2svFX1W4
 /HF6YT782uNIo6MXhz+uGQryI4v4WHEvrUiJccdrweIpTXUVNbrijNr/KD3Ev8bnpkNE
 Zb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7xdazpoc98KTxU+Hkap6hV74hgs0EjjQuCmdWfoKk1g=;
 b=mmlLRSfH7STEPjZooxZ7v6CaHNE1jZe60Eb/00ripSjhVZp5EV0tTy7yQYWDtmz12x
 ymab3qFNMsgu7r75BfBxUcJ3Cvr/VVV2I5XZqVJa3Vcmll/ZaH95vZTtHwBP5lVyOlsI
 yi0JtUhdz5pdU/zlhWfiFy5R/QIDTIOFB3cwxbqykvhdIB2MhroSJHHSd8fqWQ5ZkdKa
 EXHb01lypwZOYqCUPEy1+BYM71ek0PqmFr+TiNlfMgAFf1Va4/oSN82KuhFzh0pO9QyB
 fO8VvU76TXXCzp5Ghyp20LF/tTWIcWgyaLT6RAvxpp3ZJaowotRXpAS9tf14/D017ogE
 xr4w==
X-Gm-Message-State: AOAM530BnQ3wsrx4dEZJiS39hFzPDAr2aFvlydRXX2SP0xVsN3/YEHHn
 jdkwICufy6ogfODQfGOMhvdoxoI308jQkw==
X-Google-Smtp-Source: ABdhPJwyFl5WTALLYrl4raJlXdGUb0bYw390ow3vYx6qDhjwdmJPPmhj4MWYvrPD44f3UBwvZfN4Sg==
X-Received: by 2002:a17:90b:1e47:b0:1e6:7d04:2f4 with SMTP id
 pi7-20020a17090b1e4700b001e67d0402f4mr7336195pjb.93.1654206564595; 
 Thu, 02 Jun 2022 14:49:24 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 34/71] target/arm: Generalize cpu_arm_{get,
 set}_default_vec_len
Date: Thu,  2 Jun 2022 14:48:16 -0700
Message-Id: <20220602214853.496211-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


