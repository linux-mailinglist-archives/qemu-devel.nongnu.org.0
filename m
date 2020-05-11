Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A751CDBB9
	for <lists+qemu-devel@lfdr.de>; Mon, 11 May 2020 15:49:03 +0200 (CEST)
Received: from localhost ([::1]:42636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jY8nm-0002hA-5A
	for lists+qemu-devel@lfdr.de; Mon, 11 May 2020 09:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jY8Zz-0002cu-6T
 for qemu-devel@nongnu.org; Mon, 11 May 2020 09:34:47 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:39230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jY8Zy-0007Ey-AC
 for qemu-devel@nongnu.org; Mon, 11 May 2020 09:34:46 -0400
Received: by mail-wm1-x32c.google.com with SMTP id y24so19314645wma.4
 for <qemu-devel@nongnu.org>; Mon, 11 May 2020 06:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=XSEEKypaUPHa3YKv/s4gpdUF8gfQ0Q/8VrxqSnRvXag=;
 b=MB36tHAjfWLuNmNRjVSRDDD7o99WUwlcnEL3g+Wik207G+qWGL9r00+ZECSWk4Onqp
 bRLCOZuRKyh8BvE3+5c845AysM9k7GhGsqzssIcJ6ITyizGFxEXZI01TPkDtJPdG3vkD
 VdbquIgJuZxDgtmCqt39VnA9mVCZKRYfpSGdsoUCr29nqz03zOjWsy3MrbEBXZGBaVL2
 HnS9G4yuvjVboyP26/zXQd8nAzAVgXip9KR3cgpVpDWm1Y9JElwNAwAVAPMpB4SJGKOX
 j+IGTUcn1szidkimmPrlghNZhunJN9PFUlawj2AhCKozy8d4i0b8udWreIytIAjiMrtZ
 0ffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XSEEKypaUPHa3YKv/s4gpdUF8gfQ0Q/8VrxqSnRvXag=;
 b=PE9MsrAOPxxE9VF6LInQzJlMtYMiiIflxgeKzxAmRI83dKFB6BOiNj/vkU8l/T6Mfp
 vtqXk1EhPMuFpNNLvcJjSrfOL+SCkjyaNayc5lzGpcloPl1unQl5XWgq+lYUdNNmvKT2
 8xgSdFmW+XMhZd19jP8R1yHsdbMV8FVEI4dV4FLmqoSp04nYpyqRJEUqIHXzDVsPKGXh
 ZvrwqJ3hf3issb/+2FFIQn3t3bN66ZC7COB/4UzQuCRVzU/KBR2GjZaCS/cJ7M7huu+O
 Gnh535VN3xt4Sjk29hasnGyNsjTlcDsASGTKYVYH5xtW0EFWzmoDuRXHUP+drdzV6Hmv
 6jgQ==
X-Gm-Message-State: AGi0PuZ59YpdVwvwBXJpJj/wptxNIqwZCXa/DjjnOyWyVKqv2DJpyDfE
 l9FfSk5Y7MpIGUkS8+dVhbIMAQWpRZJZXw==
X-Google-Smtp-Source: APiQypKh7twA3QkiyzkT65EFMzdNXRja7A+gdF2UwThzHdT52JEtOeMCuZtgfmq91Fy75cWh6ZJJaw==
X-Received: by 2002:a1c:bc08:: with SMTP id m8mr31295488wmf.119.1589204084630; 
 Mon, 11 May 2020 06:34:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m3sm2154818wrn.96.2020.05.11.06.34.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 06:34:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/34] target/arm/cpu: Use ARRAY_SIZE() to iterate over
 ARMCPUInfo[]
Date: Mon, 11 May 2020 14:34:00 +0100
Message-Id: <20200511133405.5275-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200511133405.5275-1-peter.maydell@linaro.org>
References: <20200511133405.5275-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Use ARRAY_SIZE() to iterate over ARMCPUInfo[].

Since on the aarch64-linux-user build, arm_cpus[] is empty, add
the cpu_count variable and only iterate when it is non-zero.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20200504172448.9402-4-philmd@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c   | 16 +++++++++-------
 target/arm/cpu64.c |  8 +++-----
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 13959cb6435..b4d73dd47c1 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2739,7 +2739,6 @@ static const ARMCPUInfo arm_cpus[] = {
     { .name = "any",         .initfn = arm_max_initfn },
 #endif
 #endif
-    { .name = NULL }
 };
 
 static Property arm_cpu_properties[] = {
@@ -2887,19 +2886,22 @@ static const TypeInfo idau_interface_type_info = {
 
 static void arm_cpu_register_types(void)
 {
-    const ARMCPUInfo *info = arm_cpus;
+    const size_t cpu_count = ARRAY_SIZE(arm_cpus);
 
     type_register_static(&arm_cpu_type_info);
     type_register_static(&idau_interface_type_info);
 
-    while (info->name) {
-        arm_cpu_register(info);
-        info++;
-    }
-
 #ifdef CONFIG_KVM
     type_register_static(&host_arm_cpu_type_info);
 #endif
+
+    if (cpu_count) {
+        size_t i;
+
+        for (i = 0; i < cpu_count; ++i) {
+            arm_cpu_register(&arm_cpus[i]);
+        }
+    }
 }
 
 type_init(arm_cpu_register_types)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index cbaa5ed2287..f5c49ee32d0 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -734,7 +734,6 @@ static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
     { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
     { .name = "max",                .initfn = aarch64_max_initfn },
-    { .name = NULL }
 };
 
 static bool aarch64_cpu_get_aarch64(Object *obj, Error **errp)
@@ -840,13 +839,12 @@ static const TypeInfo aarch64_cpu_type_info = {
 
 static void aarch64_cpu_register_types(void)
 {
-    const ARMCPUInfo *info = aarch64_cpus;
+    size_t i;
 
     type_register_static(&aarch64_cpu_type_info);
 
-    while (info->name) {
-        aarch64_cpu_register(info);
-        info++;
+    for (i = 0; i < ARRAY_SIZE(aarch64_cpus); ++i) {
+        aarch64_cpu_register(&aarch64_cpus[i]);
     }
 }
 
-- 
2.20.1


