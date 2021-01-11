Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C36112F2335
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 01:00:40 +0100 (CET)
Received: from localhost ([::1]:56596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz771-0007lG-PX
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 19:00:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz74M-0005Tj-NN
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 18:57:55 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:39654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz74K-0003W3-3H
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 18:57:54 -0500
Received: by mail-pg1-x532.google.com with SMTP id 30so218665pgr.6
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 15:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uSqBlmmaV2nVJPAfpMvtZ9TuNPcVPPBGEyURqCr9eR8=;
 b=CRTRbErTNODBug8HUhEufRXM0LFFPOgyd/FFOsAp7DwXzHbzeAzvFbUQl617faWuVZ
 vCXGHbzXUYk8qGLXh49EdFtGADBs70lUXjCI4PrMvSBqa79QLzH5+4YsubK0ywK+g3Rg
 /xJf43mRWig5c+nrC1j0GZlFPiVNgwAfjquXn3Q2qOytJWZLbbE9DQYiRkqoSI0bOsUR
 KlffeN9RokTJOV/94dPahkIBOVugEIPePSYzA0eXfTBDRnHf7ZMqim/ha6n+bFPXjkOn
 zKflrdLKSJNJtnnVYka3iwbHueQrDkZrHgI4QvEjdMlv9cLWPLwotFLEnFXeX83lQdpk
 SBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uSqBlmmaV2nVJPAfpMvtZ9TuNPcVPPBGEyURqCr9eR8=;
 b=Fh2tEqvbXaMaQe9NgNjM7Z+yTs4DQzelZK8T1CKP6/9uOgedrePMFGv0uPe4ovN9Pk
 W8/PmzZWTPEtKR7nr4Y2cAkz51ENqVGwmNITPH5mjoVwQ37xTH6U9z348khVogl3ark/
 CqILt1uZxuPMcZOtNlHhN9V6LSIMZ+axIP+Q5mOjh7i+oTeYcUw62opWBPvm60L5wlxk
 e5Y47fO5mBp+DCOtmS/rV7wYGu/gCRoB7DLvjiXoWMWS1t80o8p7GuptaLLzY5YvdfEp
 X0bBuE8q1mri0l22eO2YDVm0ikp+tQdRUoOCqjIpvoIi5Lyase86y/9W+5IAtpuv2e/6
 gfFA==
X-Gm-Message-State: AOAM532r/OGTMeNxLsix7WHmRm9R8uECwslYOkkTFEmlpZaSyNpnlgvx
 uAn+90762peiM46RlL483j1A3Cb7wPUsKw==
X-Google-Smtp-Source: ABdhPJy0QBZlWu0C4JT5COwQYjy+w/y8WWuxylPq3IYTba2WLcl5Z8ma1jy4NBI63vAQTeu+AE9gEA==
X-Received: by 2002:aa7:9706:0:b029:19d:a2c6:aeb with SMTP id
 a6-20020aa797060000b029019da2c60aebmr1788490pfg.36.1610409469678; 
 Mon, 11 Jan 2021 15:57:49 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s67sm872220pgb.60.2021.01.11.15.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 15:57:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 3/3] target/arm: Use object_property_add_bool for "sve"
 property
Date: Mon, 11 Jan 2021 13:57:40 -1000
Message-Id: <20210111235740.462469-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111235740.462469-1-richard.henderson@linaro.org>
References: <20210111235740.462469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Andrew Jones <drjones@redhat.com>,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The interface for object_property_add_bool is simpler,
making the code easier to understand.

Reviewed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index d9feaa9cdb..8e1fad00bb 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -488,6 +488,12 @@ static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
     cpu->sve_max_vq = max_vq;
 }
 
+/*
+ * Note that cpu_arm_get/set_sve_vq cannot use the simpler
+ * object_property_add_bool interface because they make use
+ * of the contents of "name" to determine which bit on which
+ * to operate.
+ */
 static void cpu_arm_get_sve_vq(Object *obj, Visitor *v, const char *name,
                                void *opaque, Error **errp)
 {
@@ -529,26 +535,17 @@ static void cpu_arm_set_sve_vq(Object *obj, Visitor *v, const char *name,
     set_bit(vq - 1, cpu->sve_vq_init);
 }
 
-static void cpu_arm_get_sve(Object *obj, Visitor *v, const char *name,
-                            void *opaque, Error **errp)
+static bool cpu_arm_get_sve(Object *obj, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
-    bool value = cpu_isar_feature(aa64_sve, cpu);
-
-    visit_type_bool(v, name, &value, errp);
+    return cpu_isar_feature(aa64_sve, cpu);
 }
 
-static void cpu_arm_set_sve(Object *obj, Visitor *v, const char *name,
-                            void *opaque, Error **errp)
+static void cpu_arm_set_sve(Object *obj, bool value, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
-    bool value;
     uint64_t t;
 
-    if (!visit_type_bool(v, name, &value, errp)) {
-        return;
-    }
-
     if (value && kvm_enabled() && !kvm_arm_sve_supported()) {
         error_setg(errp, "'sve' feature not supported by KVM on this host");
         return;
@@ -563,8 +560,7 @@ void aarch64_add_sve_properties(Object *obj)
 {
     uint32_t vq;
 
-    object_property_add(obj, "sve", "bool", cpu_arm_get_sve,
-                        cpu_arm_set_sve, NULL, NULL);
+    object_property_add_bool(obj, "sve", cpu_arm_get_sve, cpu_arm_set_sve);
 
     for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
         char name[8];
-- 
2.25.1


