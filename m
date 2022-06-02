Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5950953C0CF
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:29:15 +0200 (CEST)
Received: from localhost ([::1]:56550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwtJa-0003bi-AW
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsh5-00051i-Uf
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:27 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:50688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsh3-0000Dk-0N
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:27 -0400
Received: by mail-pj1-x102a.google.com with SMTP id e24so6052335pjt.0
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fwPtvhYNG8jCnQ1cI9YW7usJn3JNHfnrq4zhCHsHE5Y=;
 b=xSMA/M0k2HFgDdT5Zb9zPO5UXFa+VR6KG9aJ+cpopgoKzZk8P8fYjGtShrxcPWTnXV
 Fo5TMtWUkyh6Xxuvz6UjZhLPDlwi5h/CBgFyVJPrgmOMmA4AVBk09JN9SujYbTB8pc0q
 jMY6bygiH4TkGXJaY5a/bEyivgiLNCHbQzZYyD19b5iWjII5EQpDEPYesE4xMIONBskt
 z5P6LYqksu8d2IA0ZNLESqEpFH4RtXbaudEBTy+aX+eL8ndM9UlCkrZXMUyCZaHDRyO5
 qve0x+PfRwoSfWaTzWh+lNaIbotfsJrwgmvmYeUkecmL9HD03HgfiK4Wm++nKycxpQ79
 /SPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fwPtvhYNG8jCnQ1cI9YW7usJn3JNHfnrq4zhCHsHE5Y=;
 b=gx478GluW3Q6MCL2WyS9uvqJK6b2JzFyLwclPtpswfKUv+6TKk+ymhCjAg2dp+ilcm
 J7lQ92keu93NFfxlBu/NAjRf+QZoEAwgqRYX/aHE91cUauKkWj3xCQh3GwmNeB4spphm
 QYK3zItjgCSh+dsAUw60DfLzFIWV+mJHL6jcsb8XtvlzWjBtyWvZYlloNm6LvO/7xQEv
 kGtQrjIguyEHqtp6ez051V+biHAw5JLV0FxF3U4F/JzIkWXl01InTgEKhwD5IccLZAvG
 B5dwKgM145KAGkL37in7yqX2fYwbPK7wlealBRnlkzXTxm+tZN/Ptv5gI4qA9XleOgX5
 Vq3Q==
X-Gm-Message-State: AOAM531YcF9/eaV07shc0yTXuWXslMN3+K9qJYBADvQbncfuO1nztHqN
 KiWF6JBY0Rk8jUAMMvdgd5/GonFlRTHA8g==
X-Google-Smtp-Source: ABdhPJwsSvo7HUl1ztYByNR+gD2lKfgk3Agi0GhPF9gXamXqS562Cgm/RcHjIcYDFakiu9eZ1tlCIQ==
X-Received: by 2002:a17:902:e94e:b0:158:91e6:501 with SMTP id
 b14-20020a170902e94e00b0015891e60501mr6981799pll.29.1654206563365; 
 Thu, 02 Jun 2022 14:49:23 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 33/71] target/arm: Generalize cpu_arm_{get,set}_vq
Date: Thu,  2 Jun 2022 14:48:15 -0700
Message-Id: <20220602214853.496211-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Rename from cpu_arm_{get,set}_sve_vq, and take the
ARMVQMap as the opaque parameter.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 0a2f4f3170..dcec0a6559 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -579,15 +579,15 @@ static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
 }
 
 /*
- * Note that cpu_arm_get/set_sve_vq cannot use the simpler
- * object_property_add_bool interface because they make use
- * of the contents of "name" to determine which bit on which
- * to operate.
+ * Note that cpu_arm_{get,set}_vq cannot use the simpler
+ * object_property_add_bool interface because they make use of the
+ * contents of "name" to determine which bit on which to operate.
  */
-static void cpu_arm_get_sve_vq(Object *obj, Visitor *v, const char *name,
-                               void *opaque, Error **errp)
+static void cpu_arm_get_vq(Object *obj, Visitor *v, const char *name,
+                           void *opaque, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
+    ARMVQMap *vq_map = opaque;
     uint32_t vq = atoi(&name[3]) / 128;
     bool value;
 
@@ -595,15 +595,15 @@ static void cpu_arm_get_sve_vq(Object *obj, Visitor *v, const char *name,
     if (!cpu_isar_feature(aa64_sve, cpu)) {
         value = false;
     } else {
-        value = extract32(cpu->sve_vq.map, vq - 1, 1);
+        value = extract32(vq_map->map, vq - 1, 1);
     }
     visit_type_bool(v, name, &value, errp);
 }
 
-static void cpu_arm_set_sve_vq(Object *obj, Visitor *v, const char *name,
-                               void *opaque, Error **errp)
+static void cpu_arm_set_vq(Object *obj, Visitor *v, const char *name,
+                           void *opaque, Error **errp)
 {
-    ARMCPU *cpu = ARM_CPU(obj);
+    ARMVQMap *vq_map = opaque;
     uint32_t vq = atoi(&name[3]) / 128;
     bool value;
 
@@ -611,8 +611,8 @@ static void cpu_arm_set_sve_vq(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    cpu->sve_vq.map = deposit32(cpu->sve_vq.map, vq - 1, 1, value);
-    cpu->sve_vq.init |= 1 << (vq - 1);
+    vq_map->map = deposit32(vq_map->map, vq - 1, 1, value);
+    vq_map->init |= 1 << (vq - 1);
 }
 
 static bool cpu_arm_get_sve(Object *obj, Error **errp)
@@ -691,6 +691,7 @@ static void cpu_arm_get_sve_default_vec_len(Object *obj, Visitor *v,
 
 void aarch64_add_sve_properties(Object *obj)
 {
+    ARMCPU *cpu = ARM_CPU(obj);
     uint32_t vq;
 
     object_property_add_bool(obj, "sve", cpu_arm_get_sve, cpu_arm_set_sve);
@@ -698,8 +699,8 @@ void aarch64_add_sve_properties(Object *obj)
     for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
         char name[8];
         sprintf(name, "sve%d", vq * 128);
-        object_property_add(obj, name, "bool", cpu_arm_get_sve_vq,
-                            cpu_arm_set_sve_vq, NULL, NULL);
+        object_property_add(obj, name, "bool", cpu_arm_get_vq,
+                            cpu_arm_set_vq, NULL, &cpu->sve_vq);
     }
 
 #ifdef CONFIG_USER_ONLY
-- 
2.34.1


