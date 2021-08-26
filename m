Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2B03F8CC7
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:15:21 +0200 (CEST)
Received: from localhost ([::1]:48534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJIyB-0005Iz-5Z
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:15:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImi-0005FI-FM
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:24 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:33759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImd-0008Jx-Tj
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:24 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 j14-20020a1c230e000000b002e748b9a48bso5954454wmj.0
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=tyR1y0HDeb4qDYNOGLutqZ2YiIjaqyovJPhaX/u5RCk=;
 b=r0VOVJgvnqQAIROCgP/vEh61C8Viks7tdU6rWw3GuFrDnM1YdvqgWRrJiyAlikHnSf
 m53DGyTkti/HCzBKV92d2MOUKzNY66bNdSvGZ/gno6/A7QAcOjRhO9SGv5kvwGNfdzVw
 qZnhmiCt3fw/MnmuBTJ8SXCnZVbZjdr30j+keUkBoNDJZf5HKMRIGmmuJnBvI7SFixu/
 r5fa7cWW0kUtlv5EFaq0DLwWTcRisMw7lUP6iMckveOvEhtqOyIq9eAxwO6XFCPaqGki
 gZV1pL6DQ1dcFso6kDMpqyLqPdevM2myhwOrBMkocQIfuJSi3GyZduDxHsJ/1meoVn5P
 +K4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tyR1y0HDeb4qDYNOGLutqZ2YiIjaqyovJPhaX/u5RCk=;
 b=a77vWiojOVQnqwgM+NgdrxhqCZChKraiKcvMQt470cu9FAuFlqPAjFKsm0UMRU++fS
 M5R2t+kICr+8/9ZuEs9HQLQALA2/OlyPF5JlqzbUSm71x/dJjSb7PoMyXg1w3yKHM12m
 W7ohD+W7tN90vX4OpKWH0jv5FFnSM9ijniNzMOsq0hQT2hZngqFIkqWl2TL15pMT1DwR
 dltfLv6KXUKGtKORHp3Bx80wHk9xA+OM7gcxi9FcFvM+7EcCR934WvtgieTxUWFxC/FW
 RMMs0Rgy5a3PWJX9nKsblfALVXcez2hzv3vLeMwfFWbhPPC1PzfQlNBzqjNgSgkEMtBe
 H0aQ==
X-Gm-Message-State: AOAM531WBc2pT1v88wT4daQAFD/LFMwstBlCLQziCX5eR7Oi3SsI9CJs
 1SS2Ky3lZwT7B3skWGuhT7lsh6m3FR6UwQ==
X-Google-Smtp-Source: ABdhPJwJdl7dmTI2nCmFKYKloiS/ieSIgtjEWHq+KjkfDP7W+Fw3tbEBFnJZxsXd4LvMgy9fhPeuOg==
X-Received: by 2002:a05:600c:3514:: with SMTP id
 h20mr15521753wmq.31.1629997398429; 
 Thu, 26 Aug 2021 10:03:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/37] target/arm/cpu64: Replace kvm_supported with
 sve_vq_supported
Date: Thu, 26 Aug 2021 18:02:38 +0100
Message-Id: <20210826170307.27733-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

From: Andrew Jones <drjones@redhat.com>

Now that we have an ARMCPU member sve_vq_supported we no longer
need the local kvm_supported bitmap for KVM's supported vector
lengths.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210823160647.34028-4-drjones@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu64.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index eb9318c83b7..557fd475774 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -265,14 +265,17 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
      * any of the above.  Finally, if SVE is not disabled, then at least one
      * vector length must be enabled.
      */
-    DECLARE_BITMAP(kvm_supported, ARM_MAX_VQ);
     DECLARE_BITMAP(tmp, ARM_MAX_VQ);
     uint32_t vq, max_vq = 0;
 
-    /* Collect the set of vector lengths supported by KVM. */
-    bitmap_zero(kvm_supported, ARM_MAX_VQ);
+    /*
+     * CPU models specify a set of supported vector lengths which are
+     * enabled by default.  Attempting to enable any vector length not set
+     * in the supported bitmap results in an error.  When KVM is enabled we
+     * fetch the supported bitmap from the host.
+     */
     if (kvm_enabled() && kvm_arm_sve_supported()) {
-        kvm_arm_sve_get_vls(CPU(cpu), kvm_supported);
+        kvm_arm_sve_get_vls(CPU(cpu), cpu->sve_vq_supported);
     } else if (kvm_enabled()) {
         assert(!cpu_isar_feature(aa64_sve, cpu));
     }
@@ -299,7 +302,7 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
              * For KVM we have to automatically enable all supported unitialized
              * lengths, even when the smaller lengths are not all powers-of-two.
              */
-            bitmap_andnot(tmp, kvm_supported, cpu->sve_vq_init, max_vq);
+            bitmap_andnot(tmp, cpu->sve_vq_supported, cpu->sve_vq_init, max_vq);
             bitmap_or(cpu->sve_vq_map, cpu->sve_vq_map, tmp, max_vq);
         } else {
             /* Propagate enabled bits down through required powers-of-two. */
@@ -322,12 +325,12 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
             /* Disabling a supported length disables all larger lengths. */
             for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
                 if (test_bit(vq - 1, cpu->sve_vq_init) &&
-                    test_bit(vq - 1, kvm_supported)) {
+                    test_bit(vq - 1, cpu->sve_vq_supported)) {
                     break;
                 }
             }
             max_vq = vq <= ARM_MAX_VQ ? vq - 1 : ARM_MAX_VQ;
-            bitmap_andnot(cpu->sve_vq_map, kvm_supported,
+            bitmap_andnot(cpu->sve_vq_map, cpu->sve_vq_supported,
                           cpu->sve_vq_init, max_vq);
             if (max_vq == 0 || bitmap_empty(cpu->sve_vq_map, max_vq)) {
                 error_setg(errp, "cannot disable sve%d", vq * 128);
@@ -392,7 +395,7 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
 
     if (kvm_enabled()) {
         /* Ensure the set of lengths matches what KVM supports. */
-        bitmap_xor(tmp, cpu->sve_vq_map, kvm_supported, max_vq);
+        bitmap_xor(tmp, cpu->sve_vq_map, cpu->sve_vq_supported, max_vq);
         if (!bitmap_empty(tmp, max_vq)) {
             vq = find_last_bit(tmp, max_vq) + 1;
             if (test_bit(vq - 1, cpu->sve_vq_map)) {
-- 
2.20.1


