Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DC469D710
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 00:29:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUFYs-0004oG-VK; Mon, 20 Feb 2023 18:27:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYm-0004XW-Sf
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 18:27:05 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYl-0000TE-8Q
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 18:27:04 -0500
Received: by mail-pj1-x1044.google.com with SMTP id
 nt5-20020a17090b248500b00237161e33f4so1010286pjb.4
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 15:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Ut/aS2oezKic9UZ9DAK+e9x8VNxmPUkA0viJdZ3AGc=;
 b=GhqdHjbrt2izcd84632/7HzZ/sVbJWMYyIOeUcjyL8xy8c7HZzFlH8ta323uZjYDZo
 gXvumDAmYks8aeypQrvrHTFIYKYUOzqmE+VJZd0fk20foX5qK9n6ShZJijB7I1fGXVAM
 a4QV/bX+kRZi0Ak5Dj1kNuPieD74OSiHjFFZwRcxGhKfVS7f8jPRDdZfuEMvSNp6c89R
 ymkHyyPngC3JM2yBJyRHI21tFx5e063YklRuGWxdfBi44/PiN3gTIlUUqn06QmISh8RM
 Ff1eaPESw+r+VyUAfkZ72aNc3cNSr2yW8iQjdMgY+1VuT5VceREwR2scRyQ7qJWWHixg
 r/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Ut/aS2oezKic9UZ9DAK+e9x8VNxmPUkA0viJdZ3AGc=;
 b=lP5JDXv241aA8yJhCPRlgojp7013x9K6XROOZZmF56q0DtQzm/sIAg/j9rRglwDgdO
 6o0QTjsAAx90v0nBy+oc+vbUwLg4QPZHaof2nWyU5YjEt5NCk+xUPnXUC5Vj3moi8QgA
 s14NDKQIasJITlqcTv8sUTAd+0Oy8H7yqOdgCwXR5VX9DXprp+MCVCbIMfHdJMX1C+Sn
 yxl91mrf7sU5mLDKgTnzSWvqyr5Q7Un3aejEGzIQtThjOxKrpE4NipQ6DE9SSJfR4Osw
 YY4wvCa+RI/kkn0mvKcbDnxxUvI5OJin2VDv8cgELHPvaYegCl2j9xznjYVZmmj/INhx
 G19Q==
X-Gm-Message-State: AO0yUKVmJTShHAlekYO7fl93n7u+h80iBVnBEz2X3lFXE4Cs4tfBaJlP
 pZspWGZ/tYROfbJ4+6RlDhYEPuvR50DPiWAMWt6T3w==
X-Google-Smtp-Source: AK7set8l/I3OllVgHzv/KfcGMwJjZYwt2LTqa2qG2doE3pDiOHQvGYfKYouP1mirI5Vb1Mr3AIVhmQ==
X-Received: by 2002:a17:902:ea07:b0:199:33ff:918a with SMTP id
 s7-20020a170902ea0700b0019933ff918amr4216964plg.21.1676935621746; 
 Mon, 20 Feb 2023 15:27:01 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a170902690a00b001992e74d058sm2665348plk.7.2023.02.20.15.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 15:27:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [NOTFORMERGE PATCH v2 20/21] target/arm: Enable RME for -cpu max
Date: Mon, 20 Feb 2023 13:26:25 -1000
Message-Id: <20230220232626.429947-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220232626.429947-1-richard.henderson@linaro.org>
References: <20230220232626.429947-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Add a cpu property to set GPCCR_EL3.L0GPTSZ, for testing
various possible configurations.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 4066950da1..70c173ee3d 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -672,6 +672,40 @@ void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp)
     cpu->isar.id_aa64mmfr0 = t;
 }
 
+static void cpu_max_set_l0gptsz(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint32_t value;
+
+    if (!visit_type_uint32(v, name, &value, errp)) {
+        return;
+    }
+
+    /* Encode the value for the GPCCR_EL3 field. */
+    switch (value) {
+    case 30:
+    case 34:
+    case 36:
+    case 39:
+        cpu->reset_l0gptsz = value - 30;
+        break;
+    default:
+        error_setg(errp, "invalid value for l0gptsz");
+        error_append_hint(errp, "valid values are 30, 34, 36, 39\n");
+        break;
+    }
+}
+
+static void cpu_max_get_l0gptsz(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint32_t value = cpu->reset_l0gptsz + 30;
+
+    visit_type_uint32(v, name, &value, errp);
+}
+
 static void aarch64_a57_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -1200,6 +1234,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
+    t = FIELD_DP64(t, ID_AA64PFR0, RME, 1);       /* FEAT_RME */
     t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 2);      /* FEAT_CSV2_2 */
     t = FIELD_DP64(t, ID_AA64PFR0, CSV3, 1);      /* FEAT_CSV3 */
     cpu->isar.id_aa64pfr0 = t;
@@ -1301,6 +1336,8 @@ static void aarch64_max_initfn(Object *obj)
     object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
                         cpu_max_set_sve_max_vq, NULL, NULL);
     qdev_property_add_static(DEVICE(obj), &arm_cpu_lpa2_property);
+    object_property_add(obj, "l0gptsz", "uint32", cpu_max_get_l0gptsz,
+                        cpu_max_set_l0gptsz, NULL, NULL);
 }
 
 static const ARMCPUInfo aarch64_cpus[] = {
-- 
2.34.1


