Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3442FBAD0
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:13:55 +0100 (CET)
Received: from localhost ([::1]:54010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1she-0001IC-2m
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:13:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sf5-0007M6-6H
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:15 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sf0-00018N-L4
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:14 -0500
Received: by mail-wr1-x42b.google.com with SMTP id v15so16428067wrx.4
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=5F2hclqKLKs6JyU1ZGSU0YigGiCdbKS3mBT4RvnkJ/o=;
 b=FAtW6Tj1Ga2iPBlL/CV0U2ooGSI2HGAmub2C4MGAivZblPak50UZWSja1eExGyxPfH
 itKdtHWYH8tuihKuz9AGUDCmN3ePmshiPDenznNolPgoLc01nLgZvbwC1fsrUGm6JAV5
 4NU0QobJV/KTDI3S5pgJNFKVqGzmus/Gfvr6NEv+/mE6pIpzeNzHoqC4MYuuYB7IkuQW
 ktb9IpAP5Vswgjr4a01EANV1bsbk4gjp9lKoORq/FhgWDWSkNppTtTCudUKeiM1vseIW
 otDZ6EOY5BPCIoxizuwUr5WKpHSQI8OAVWc3sex5lcF5dLtJFfTTzQZfJTKydU4CUjZS
 b9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5F2hclqKLKs6JyU1ZGSU0YigGiCdbKS3mBT4RvnkJ/o=;
 b=fJLcKrTd50omxmRdDdRdWIM0tLust4ovEhVrcNxejiIwpYvmovrxmoQNU1RKDzzx5X
 TDS4MUw30dNhGwAWeARLehC4Zr3ipOvPOiiN+g2/9qeHPOCu+Pr6VZ/VOOz9qUOujbBL
 nwRZOEIWbYREtYeBiq1sMY3XphBji6PoHv1hVLMmrvmR+EcDwc8OToesWMuXYqY/mmLS
 kzgdtgHmjQ6O5EQ15D+sAQqixjecuFA521SoUSR+/EpQ+RIYNHH9zQGAnuGvBZvoa3QV
 t0jgNIg+nSF0gsdwiuMHZ5D8pwktm9GESEQjyXxn9mf2d0gxUt67jJqoRZ8DtcNOUPtU
 N6+w==
X-Gm-Message-State: AOAM532mzg50a8EAY0272M2vnsjlqNJIkmKvPJNEZv82lm5dYsy9QVAw
 2Ng6zosVHVNn21ZnT5wq90wPSpkfjcQGHg==
X-Google-Smtp-Source: ABdhPJxnw2My5ED2IzTJWe0Vxc3xLR8wGEy9lmRZVS4s09vfUpWI71uPPeXVbVeZM0LDTuMMcKd6Yw==
X-Received: by 2002:adf:e883:: with SMTP id d3mr4865522wrm.139.1611069069043; 
 Tue, 19 Jan 2021 07:11:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a184sm4843699wme.35.2021.01.19.07.11.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 07:11:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/33] target/arm: Use object_property_add_bool for "sve"
 property
Date: Tue, 19 Jan 2021 15:10:34 +0000
Message-Id: <20210119151104.16264-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119151104.16264-1-peter.maydell@linaro.org>
References: <20210119151104.16264-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The interface for object_property_add_bool is simpler,
making the code easier to understand.

Reviewed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210111235740.462469-4-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu64.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index fa58211f7e6..dbd06ccc24c 100644
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
2.20.1


