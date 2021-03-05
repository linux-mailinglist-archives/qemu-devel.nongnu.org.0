Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 798F032F191
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:42:54 +0100 (CET)
Received: from localhost ([::1]:56850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIETV-0004bo-A8
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:42:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3N-0006sL-Bw
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:53 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE2z-0007Uk-Mt
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:53 -0500
Received: by mail-wr1-x42f.google.com with SMTP id 7so2919471wrz.0
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=2hhxDYI5vU3qXX2kxDdWzLG7EDIqI+CmWItPuBlZX/M=;
 b=KD3WoDA9YGVsMlIc58jgQ7w+JCzSL4QIKWqaykUx0KzOQIfaAqjF2azZemu1tU5+8q
 cA9sjflcVxFftervn/vOMKWRg3OH3TqTTRbz444zIZP+gJhKEHfMo/pybw9DJdS3vR95
 efTPQtP+9y4oiZVe2W0gvvbj5RN7TGnJCIySOyY01GGhAXdIKJjTFsAGQ5v+zAPGP2RY
 SrZZ2JR13DzrRoHQk7cOTVvwAXDfh6Lcl8ymynXg3q8ht9+Bm7wzj2/b3eacgxfTTlSG
 /yltTcySJ5MG1AEKNz5+U0dpMI2LwPpbcF5idX90uNAAAJG0qlr/As/aC47HwProW5on
 l/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2hhxDYI5vU3qXX2kxDdWzLG7EDIqI+CmWItPuBlZX/M=;
 b=Ay8CLTofr9yEcHEEDV/UgEZfBUMI0UqWidA/RKqtMW2N90pIJHtffRkWjVxVET1IS3
 pgTJ1G0U/DOUxe3M15Dam20rTr9lDZyvEJhSrUCa6RuzVspLAU/apk1AZcBpJBK9IIlm
 1VsQdUn+JfvACuFEirTCJalccIgXzqxuUH1bt9LpDxJ8mt3ExSSAmGK+taR4o0Od8xrL
 f1VKpVl8D+37W11YGaDdGhKMkLds5CLEOx8Eeqx5GGdo9jaELV0/avAMbd1Fv/TPioRm
 +LHpEp51FAkxZ6TI7f1eSjXNV8T2716SUAVY6g38qRKmx7L66BBiV2sZ9stTSNdWyIfS
 /GJA==
X-Gm-Message-State: AOAM533p0eQtWoFdSnBVwGu58bzKA7tL/qWWKnb2DxHj0E4hhKBHOkgp
 DL2ng/drMQF2MapCsCbMmw+owNf0d9BURQ==
X-Google-Smtp-Source: ABdhPJwMe1IXvvpCmqDApRwsuijtGrnq4wfzr6JDLVxH3o0agEJWc0h2M/y7GNqb9Q9qC3w/35iGIA==
X-Received: by 2002:a5d:4649:: with SMTP id j9mr10054362wrs.259.1614964528096; 
 Fri, 05 Mar 2021 09:15:28 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/49] target/arm: Restrict v8M IDAU to TCG
Date: Fri,  5 Mar 2021 17:14:40 +0000
Message-Id: <20210305171515.1038-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

IDAU is specific to M-profile. KVM only supports A-profile.
Restrict this interface to TCG, as it is pointless (and
confusing) on a KVM-only build.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210221222617.2579610-2-f4bug@amsat.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c     | 7 -------
 target/arm/cpu_tcg.c | 8 ++++++++
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 058672c9776..2666d4363d0 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2384,12 +2384,6 @@ static const TypeInfo arm_cpu_type_info = {
     .class_init = arm_cpu_class_init,
 };
 
-static const TypeInfo idau_interface_type_info = {
-    .name = TYPE_IDAU_INTERFACE,
-    .parent = TYPE_INTERFACE,
-    .class_size = sizeof(IDAUInterfaceClass),
-};
-
 static void arm_cpu_register_types(void)
 {
     const size_t cpu_count = ARRAY_SIZE(arm_cpus);
@@ -2403,7 +2397,6 @@ static void arm_cpu_register_types(void)
     if (cpu_count) {
         size_t i;
 
-        type_register_static(&idau_interface_type_info);
         for (i = 0; i < cpu_count; ++i) {
             arm_cpu_register(&arm_cpus[i]);
         }
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index c29b434c60d..fb07a336939 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -14,6 +14,7 @@
 #include "hw/core/tcg-cpu-ops.h"
 #endif /* CONFIG_TCG */
 #include "internals.h"
+#include "target/arm/idau.h"
 
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
@@ -739,10 +740,17 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
     { .name = "pxa270-c5",   .initfn = pxa270c5_initfn },
 };
 
+static const TypeInfo idau_interface_type_info = {
+    .name = TYPE_IDAU_INTERFACE,
+    .parent = TYPE_INTERFACE,
+    .class_size = sizeof(IDAUInterfaceClass),
+};
+
 static void arm_tcg_cpu_register_types(void)
 {
     size_t i;
 
+    type_register_static(&idau_interface_type_info);
     for (i = 0; i < ARRAY_SIZE(arm_tcg_cpus); ++i) {
         arm_cpu_register(&arm_tcg_cpus[i]);
     }
-- 
2.20.1


