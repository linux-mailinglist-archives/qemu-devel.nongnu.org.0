Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E4D4A9D50
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 18:03:32 +0100 (CET)
Received: from localhost ([::1]:39056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG1zc-0008Ef-M0
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 12:03:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG1sH-0002y7-LO
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 11:55:53 -0500
Received: from [2a00:1450:4864:20::434] (port=39608
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG1rp-0003BS-Ka
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 11:55:39 -0500
Received: by mail-wr1-x434.google.com with SMTP id r17so3414088wrr.6
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 08:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tjcvPV/juuMIi4sRDbbU/TdIgPLoSlWdDbYJe45BCYc=;
 b=KxLxce1+gFmcvFNrRLL2/maGEvJQmt0Hf0OlZuvPiuK1w5Ab3SxyurA45jGZUA/JZI
 Z4EaOa2pN+i5gYFVJloKQwcbED0T94XcGl2AS0YEvm74S4pnJWtX4JSXYN5TUmLe3oY4
 M/JVQ2urRY4NTZ04/5XnCniGrrcvh94IIAJtwLms5cCAiOiNdkbVx3rLbgWVJp6ox82X
 pZLV/LIuNnmvAhzVRWjTw7LLV+SduwyRJC4l63iobRo0PUYiWv8XvxGPTEl8AL8lHm4j
 QuuhLw8UYqke81nz9cJJ2SNbPoTq8206bV3LwI+28b4/u0OGDA82ZlD/3D1/BdKk+oeW
 eD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tjcvPV/juuMIi4sRDbbU/TdIgPLoSlWdDbYJe45BCYc=;
 b=4H9PuavoPNEiDh68ArBmmX7bqbFUTRf+U8b/Od0y26L8/KfHebhWrwNEabigOe9sDP
 +fmFh5H1fwGQ5JO1B1+xwrbRmdWtN40+OZOY95FfdYCRHGpmalMrlAOS+sIal1H1l99f
 uzvJgyaitWfPyR1JoJ5Pq9EEt3qcNtimHcRs7bCfuz9mFMf7oa98oIglTZg0ZrvO+Jfj
 O1w02brHxXI8MxzbCZiykEvmJ45m6VkadGPUwnjgHge+B9wKONl7fH14A8qP0ayZuL3x
 xc5uwuMWmziwxdxiXgjygD/r0t+cuz6bDmfi9oNi3RMEkhuHmFznsWmS7rkSwyNjfsbH
 RejA==
X-Gm-Message-State: AOAM5315OWYG8jklujlgi+CpDvZ3E/z8LdQFrTljEgH/QKckJauU3RRK
 26+zklgvLq9MbosRKf0RYn247w==
X-Google-Smtp-Source: ABdhPJy62nx2DRiSMhxqO4dfgyiqdLf3MPL/jIOKzEYnnGYDWRXlLmYatWUbQcTY8qVQKvUPgSW3jQ==
X-Received: by 2002:a05:6000:1a46:: with SMTP id
 t6mr2359874wry.49.1643993709904; 
 Fri, 04 Feb 2022 08:55:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id f12sm2486254wrs.1.2022.02.04.08.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 08:55:09 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/6] target/arm: Use aarch64_cpu_register() for 'host' CPU type
Date: Fri,  4 Feb 2022 16:55:02 +0000
Message-Id: <20220204165506.2846058-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204165506.2846058-1-peter.maydell@linaro.org>
References: <20220204165506.2846058-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Alexander Graf <agraf@csgraf.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the aarch64_cpu_register() machinery to register the 'host' CPU
type.  This doesn't gain us anything functionally, but it does mean
that the code for initializing it looks more like that for the other
CPU types, in that its initfn then doesn't need to call
arm_cpu_post_init() (because aarch64_cpu_instance_init() does that
for it).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu64.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 052666b819e..590ac562714 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -683,7 +683,7 @@ void aarch64_add_pauth_properties(Object *obj)
 }
 
 #if defined(CONFIG_KVM) || defined(CONFIG_HVF)
-static void arm_host_initfn(Object *obj)
+static void aarch64_host_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
 
@@ -696,15 +696,7 @@ static void arm_host_initfn(Object *obj)
 #else
     hvf_arm_set_cpu_features_from_host(cpu);
 #endif
-    arm_cpu_post_init(obj);
 }
-
-static const TypeInfo host_arm_cpu_type_info = {
-    .name = TYPE_ARM_HOST_CPU,
-    .parent = TYPE_AARCH64_CPU,
-    .instance_init = arm_host_initfn,
-};
-
 #endif
 
 /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
@@ -943,6 +935,9 @@ static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
     { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
     { .name = "max",                .initfn = aarch64_max_initfn },
+#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
+    { .name = "host",               .initfn = aarch64_host_initfn },
+#endif
 };
 
 static bool aarch64_cpu_get_aarch64(Object *obj, Error **errp)
@@ -1049,10 +1044,6 @@ static void aarch64_cpu_register_types(void)
     for (i = 0; i < ARRAY_SIZE(aarch64_cpus); ++i) {
         aarch64_cpu_register(&aarch64_cpus[i]);
     }
-
-#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
-    type_register_static(&host_arm_cpu_type_info);
-#endif
 }
 
 type_init(aarch64_cpu_register_types)
-- 
2.25.1


