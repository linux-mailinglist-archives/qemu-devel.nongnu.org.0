Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FA7552387
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 20:06:08 +0200 (CEST)
Received: from localhost ([::1]:47276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Lmp-0003Lh-Ot
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 14:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZy-0005pv-U9
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:50 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:38873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZx-0001Qu-Ch
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:50 -0400
Received: by mail-pf1-x430.google.com with SMTP id w6so3702213pfw.5
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WLkeQFDvx/m8IfCirAHMxhWxYjRgdVfqGmeTPsUXyEA=;
 b=uYkkGA7c64MLwKsN3UBMlAdZtaf3BJ7eA/J+mHWDNwkHG5Zvo+MVoMn+l2a+na27K+
 1C+G+T3w8vkHFdOJsxpYTtxKOt2Mx2nb0DBrr4/FABFjlOFNWDiyvjbG03HhTwq9YZno
 lPwC0kdwntBjc0E4QnhohuVg/6Ewc4gpiC4D8zdRJhrhxzrv1ShqoFkhzBRFRKiWNNn5
 negfmetQDiIe+HKN4qoMDT6TlE2ZCfj3Qk0nabVk++l2xncEfKRDO5dgbMp6XiJBHLgZ
 QjsLre8kkkBpPPapeA5u9FSbeKIPG/5sIyHc05qVtcnZXTY9oW/K/yT2GBTAfVChTxz2
 Mplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WLkeQFDvx/m8IfCirAHMxhWxYjRgdVfqGmeTPsUXyEA=;
 b=xdNiosBhl0Er6B2H4xCoELOT6iUfSVjMvlbc7FS7AOSewjn3azCi8X5hLlEWX+xelJ
 6EKzfoyKs5SFYkAuWHS9RMRH6sQumuH9RfcX9ZPEXEheu3iKAi7IZdBrS3BqPpqANxOu
 /ZkkVsHG+6W9wq2y2d+XyO2r4N8b6HsYmRvG7RWbvlo3IizcXC7qPDGBPr8ztwsnrkrs
 H3t68PTNXKH4qF0VT88eZ2pw72BAoYU0i8PhvpEe+7fkvtzOtzfM45Vvm8vWUzUGsuua
 B20MdfunwKDJ3auNAOxM/HKV39pWgdVw4i9HVEYwqpSXqoXsDPqFhullS2UvAncLjNjT
 /ZZw==
X-Gm-Message-State: AJIora95eieV8v7dULl6ciw773BR0bKXc5MbabHH7sVHwK9cLUHwB3MH
 VcHBQA3niDmn3HGQlj+Ik6L2ExQcrYRRxw==
X-Google-Smtp-Source: AGRyM1tswnUQwFyTl/hoKRiRQVgAETY2mGMl+N/JIKUwz4UYKU0NbsLNZSA5GpzlZ8KeCQdQlxrghw==
X-Received: by 2002:a63:4854:0:b0:3fd:696e:b48f with SMTP id
 x20-20020a634854000000b003fd696eb48fmr22693549pgk.281.1655747568125; 
 Mon, 20 Jun 2022 10:52:48 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 13/51] target/arm: Generalize cpu_arm_{get,set}_vq
Date: Mon, 20 Jun 2022 10:51:57 -0700
Message-Id: <20220620175235.60881-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

Rename from cpu_arm_{get,set}_sve_vq, and take the
ARMVQMap as the opaque parameter.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index cadc401c7e..1a3cb953bf 100644
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


