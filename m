Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2292D2DC8DE
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 23:19:12 +0100 (CET)
Received: from localhost ([::1]:35254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpf8Y-0007Oi-V1
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 17:19:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpf2c-000396-1H
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 17:13:03 -0500
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:32823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpf2V-0006D6-1t
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 17:13:00 -0500
Received: by mail-ot1-x32b.google.com with SMTP id b24so7452205otj.0
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 14:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uSqBlmmaV2nVJPAfpMvtZ9TuNPcVPPBGEyURqCr9eR8=;
 b=dxIOMBqKO4N9R61S6AxF8v+m7P/6y+HQXgn3JZPl3QG6O29um/a5KZ3aSQqGBfX7H6
 o/UaRPzhrpF3RlDMY1REFd/GViPEt64E5KrHTNW7v7qSj/8DdH6aJxLsSic/4s4kk1HP
 lbEOFSEfy9+IXZMyaQ/UFCn0Y2k22oi3i+rhkXsjESL5LxB8Q4fADjI2ZupIFZ1DGzgi
 4D616msUMuwLOZ9i3r6iIftqznGBLI3H3AVg/Fqm+zI/ECo8BfLBlpf3fOXEk7nq60h3
 d426sKQKnGFS1PGkuKErLBeWKP1Dicy9pVjzZnua669PtO9K8WsCy8a6atphuneO+wHb
 2usQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uSqBlmmaV2nVJPAfpMvtZ9TuNPcVPPBGEyURqCr9eR8=;
 b=fLEWUykEhSfajKe/cxorLdm0oC0huo2l0nQilq6aqazGhSvooGSmGHBHPSxO1Vs9CQ
 IwuhFXDaqUnueCFO1rvFi7JGRpT0OZZaIL1QqCjq031XgDLMeNY/VzUASgr4WPSSvOHq
 cXnodGcDeL/UWbbbWD5k0wWe+Lub/Y3mj8zW/UYTvArIZzxYLFJhvntcm/GcxQCKOWS4
 XXBWyWdLekZYuJSXDTR9mYlzwXfuu5Kz7DtL5MxmAvxMM5YGsSZ8VYruemoKHN6elfBh
 K7y/cPVyytfeMqVlDpSfxylrRxflIRqhKCd7BQgpNwGnPQ768SaPpIeBfUeSKEkrEjPU
 sx1A==
X-Gm-Message-State: AOAM531rwokPhjENEGN0C7SvgAX3lFJKTXjWD6O9kZSYa/VOdcGazrXe
 9R2ZZ3Kg1gC4siHVKuWwhQE1xrFs6DgO3cuO
X-Google-Smtp-Source: ABdhPJz0gxKFXMmX6Rdm3rwzAiRZkD0hPmy8AjGB6yDy5zo5UGeLIXR/+B7eWldv3FC5Gvx1fG8Gvg==
X-Received: by 2002:a05:6830:90f:: with SMTP id
 v15mr26891399ott.223.1608156773666; 
 Wed, 16 Dec 2020 14:12:53 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id z9sm758965ote.13.2020.12.16.14.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 14:12:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/3] target/arm: Use object_property_add_bool for "sve"
 property
Date: Wed, 16 Dec 2020 16:12:47 -0600
Message-Id: <20201216221247.522686-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201216221247.522686-1-richard.henderson@linaro.org>
References: <20201216221247.522686-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
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


