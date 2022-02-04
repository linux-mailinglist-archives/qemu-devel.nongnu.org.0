Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 985D44A9D5F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 18:06:52 +0100 (CET)
Received: from localhost ([::1]:45180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG22t-0003wV-7C
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 12:06:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG1sH-0002xx-Lh
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 11:55:53 -0500
Received: from [2a00:1450:4864:20::32e] (port=38611
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG1rr-0003DI-Ht
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 11:55:37 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 o30-20020a05600c511e00b0034f4c3186f4so9821835wms.3
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 08:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=umQ/WbOJUobh23pwZIc3MfhXaZpQDP+TCKjJpFme+9w=;
 b=UgQd5pLlr/hCiydV0vb3UUenZR52JfqSNWK1Qrqd6/yOhqLigr73Peweyo/YQ/MBt5
 cuOZZH5U1Xn4USdnYMeld31IFI8I4LfWcbttMSwq5NgVAZy/EeH0yJkF6X4XiH/TxXBW
 K9alm0W3R1//WYTtGvwqeZDfGbiHRQCmfvqxxKFwfCD7OJShKS2BMhBufZbe8BugLCQz
 XSX0D9LDCXPUUrtmFdtLB32wurFYdme9JEbTh0A44oSJrHCRUrHGSLemkZxeT0gqFXJV
 C0kBUqSKiesz7709EIIiVb1WZpMpWwTY7LJAs19tRmQ1Q2E27X9L1aWXxrDLEiSJNy4A
 8Qbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=umQ/WbOJUobh23pwZIc3MfhXaZpQDP+TCKjJpFme+9w=;
 b=jrqCH6YGuJt349takbe+zjC0HkN5Hsaa2HhhvGFbYknvPfE6VQm6+m1XPIM6N5DR8T
 1LmT15qqeIq0ZcgxkzK8riOeMrINJc5t9kUgEU7bsbgOVc3dnoQ9n9x3syMuy7a9wuDO
 BLPOrvQ44RLqy1PF+4kwSM5gNwdQLHFON3h4NY+DQaM/dDhSeBxwyYb+R94qfk8L1Fpb
 Pwhc0HJmagZ54hFnrBbjEa8IvV41nY+EwgpqdnqD9UiTLxi3zaMyVl8qB+V9uuEkvRkf
 Ivk01yTuhQ+GZqOJbFY6NKMJHx/fvfLZ30h4jlFa/Pe2STLsoc/GApuHPEESiBPAo7zN
 Y8vA==
X-Gm-Message-State: AOAM530jdcdbbhApZGvxOFd+9QmgGG++aZMtEqDHXin8Lugs+cPeJz4l
 d+1M1KjM/3FxNCinyv2UotTJzU7k1q82eA==
X-Google-Smtp-Source: ABdhPJxAaxGZCDfPSBSlZn/j3XD2TuuYoaFu3fgIaTHv0VO4ysed1IXMvNS0b6I4Z1WEuSltd32Vmg==
X-Received: by 2002:a1c:4e09:: with SMTP id g9mr2972347wmh.188.1643993713025; 
 Fri, 04 Feb 2022 08:55:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id f12sm2486254wrs.1.2022.02.04.08.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 08:55:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 6/6] target/arm: Support PAuth extension for hvf
Date: Fri,  4 Feb 2022 16:55:06 +0000
Message-Id: <20220204165506.2846058-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204165506.2846058-1-peter.maydell@linaro.org>
References: <20220204165506.2846058-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Andrew Jones <drjones@redhat.com>, Alexander Graf <agraf@csgraf.de>
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
---
 target/arm/cpu64.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index fd611c97116..5be5ade6c9d 100644
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


