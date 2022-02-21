Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA724BD8C1
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 10:57:00 +0100 (CET)
Received: from localhost ([::1]:58446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM5RD-0006jN-Pn
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 04:56:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zP-000873-Ca
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:15 -0500
Received: from [2a00:1450:4864:20::333] (port=36703
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zN-00011P-HM
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:15 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 q198-20020a1ca7cf000000b0037bb52545c6so13077646wme.1
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 01:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9uNHsCSBiyyY7VqKj99MP2CiA4TXNDtewjy7bEKnAE0=;
 b=x0OJWEP3PkkrmlmxIUYxo5YyvttK7BhvSIroXT6VB//6VZUGmv8C0QNSnE9rkJf/6a
 C7sAv/dt59kDQKN6dngDnEeLt116CcpFnd2H1rzwr4H77WDG9ZxVyS2roSGsNkzau5Pt
 y8g2g826sgngxOB2u5eMN2cBYKWd0lDvPv6gmwyq+2XofQ0Fui6XQLXSQQjjUxnbmgrS
 itzfNLk7xkbCqF/l3kagwEwAsp2L1k/IAhv5NfwVSVIg7YxxEhLHHdWgEiJvzU314aN0
 4nd0u5PZLfhauNJwSqebIcEXXYLoCUxSscCArXpeHuVqkcVFHRr+ycPOP78Xmf8oIoWK
 hHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9uNHsCSBiyyY7VqKj99MP2CiA4TXNDtewjy7bEKnAE0=;
 b=IPYkDLgd8QkkzH1lfefP8Yv4rQBJbtL2WOx2dGWMfydmA+J6uPARt6Qg7BVegu+Z8K
 V4HylHE4hNSorADW4wDn8gwZuOrza7sV/FrLHu6f8bJjKEOXyq6JiDX+RNccM/C1JcTi
 Y208Amw70dyJU1MABhbA2GZozULmGAsUoYrcNtU+8EHwHJDLwqxdYRYHU7EF/ZZPLA5W
 vF7a7FPkGS/FPUo1Jdr+7fsAan+UzCQtPlEdmFBUME5b9ehoUkgSToiDVLZ8HrPyxnKE
 HyEySJosZ+7IUm+hP4C7u5Acdhb3Hfx1Lr6qffQWz58662mA+1Xd9CMLHeujH+x5Tw+Q
 TM0w==
X-Gm-Message-State: AOAM531+/n4lzJbpnEMV94/exUNFCVLd/l/oSUNabpAUSb4XmrdBGz9y
 4aZX0OiQUFCp7goPIpNGmM7ULFRNMayOLg==
X-Google-Smtp-Source: ABdhPJw6YV6nglOj2RCWv5qDq5tuVgm5nku7xUafJ2C8M6s0ZkZxw1xJo60Ccp5wTTjI7U2mH21THw==
X-Received: by 2002:a05:600c:1f14:b0:37b:c475:2de0 with SMTP id
 bd20-20020a05600c1f1400b0037bc4752de0mr17233629wmb.70.1645435692332; 
 Mon, 21 Feb 2022 01:28:12 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id q76sm7555778wme.1.2022.02.21.01.28.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 01:28:11 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/26] target/arm: Support PAuth extension for hvf
Date: Mon, 21 Feb 2022 09:27:46 +0000
Message-Id: <20220221092800.404870-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221092800.404870-1-peter.maydell@linaro.org>
References: <20220221092800.404870-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Currently we don't allow guests under hvf to use the PAuth extension,
because we didn't have any special code to handle that, and therefore
in arm_cpu_pauth_finalize() we will sanitize the ID_AA64ISAR1 value
the guest sees to clear the PAuth related fields.

Add support for this in the same way that KVM does it, by defaulting
to "PAuth enabled" if the host CPU has it and allowing the user to
disable it via '-cpu pauth=no' on the command line.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220204165506.2846058-7-peter.maydell@linaro.org
---
 target/arm/cpu64.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 19330d9ee94..1171ab16b94 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -633,9 +633,10 @@ void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
     uint64_t t;
 
     /* Exit early if PAuth is enabled, and fall through to disable it */
-    if (kvm_enabled() && cpu->prop_pauth) {
+    if ((kvm_enabled() || hvf_enabled()) && cpu->prop_pauth) {
         if (!cpu_isar_feature(aa64_pauth, cpu)) {
-            error_setg(errp, "'pauth' feature not supported by KVM on this host");
+            error_setg(errp, "'pauth' feature not supported by %s on this host",
+                       kvm_enabled() ? "KVM" : "hvf");
         }
 
         return;
@@ -672,10 +673,14 @@ void aarch64_add_pauth_properties(Object *obj)
 
     /* Default to PAUTH on, with the architected algorithm on TCG. */
     qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_property);
-    if (kvm_enabled()) {
+    if (kvm_enabled() || hvf_enabled()) {
         /*
          * Mirror PAuth support from the probed sysregs back into the
-         * property for KVM. Is it just a bit backward? Yes it is!
+         * property for KVM or hvf. Is it just a bit backward? Yes it is!
+         * Note that prop_pauth is true whether the host CPU supports the
+         * architected QARMA5 algorithm or the IMPDEF one. We don't
+         * provide the separate pauth-impdef property for KVM or hvf,
+         * only for TCG.
          */
         cpu->prop_pauth = cpu_isar_feature(aa64_pauth, cpu);
     } else {
@@ -695,6 +700,7 @@ static void aarch64_host_initfn(Object *obj)
 #elif defined(CONFIG_HVF)
     ARMCPU *cpu = ARM_CPU(obj);
     hvf_arm_set_cpu_features_from_host(cpu);
+    aarch64_add_pauth_properties(obj);
 #else
     g_assert_not_reached();
 #endif
-- 
2.25.1


