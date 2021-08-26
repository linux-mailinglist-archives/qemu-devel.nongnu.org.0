Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFF23F8CC6
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:14:21 +0200 (CEST)
Received: from localhost ([::1]:45772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJIxI-0003RV-Mw
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImi-0005G7-O6
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:24 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:39914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImf-0008KP-0V
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:24 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso7370562wmg.4
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6qj0VLNCYgASFVMdt6JQgvSntH4PzChad90nSq2diw8=;
 b=MZi2+VrEkyt4tG3ILqXMrkqfwNn4YP+ZyPxPbz73FFvCIPC2PqI3n1WS7D4LwHyUxk
 VyVZdisJVA7cOVVb7cOeXeh7GO0MwNr5O3/g3Ntw6t9vHm7HuytntL9cGrY8vRNZp7y2
 tvMIV8GCQsaA6Qpz97885BItW7xyOwiAkSzAnOpXj3zwBFTCT6i9JrAqAbJh1E0/eMLs
 bZjmNr/0vGU5tUAaUVnyay4hK9A4Dj318EeDcbwDrzDPJ7FsYYZ4BxDe2D6gLvON4uQm
 l+gSD4Z4u5v6DUErd3jqREpPOkJq5aeRiJxPRnKbKgRyzwOnZ/KAuuqo3jzhll/r1IZ6
 CB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6qj0VLNCYgASFVMdt6JQgvSntH4PzChad90nSq2diw8=;
 b=EEZkw/9dT2qCIqWWROMXsTc/LASzP+eKNFOvhpARQYEVbnHqGpCd43ifLf8PeIC+o7
 cJZ4KAB5Jpi6c/wE3gX1fiLdbc4abn3GhC3kHSvD7bQ5HOkFg/c1tHSjIf+ILM6ooyks
 KCNfwD6ujVdpqoUcTmW7QBe/4gmB0ruYZvYj5kaHHcUan4zVgLoykb/w7tULJ26ioFtx
 w+QVMi94cyXTwz7Oymb4fflJ5APwsQxHpso0Xaykh8/rFA9KUnQu+tkkjjd4SZ8ma8e2
 2/zeB6E5/ExWT+igmwhA6vkjZiOSvN+KeBw1D3+oRigRHJAoOA0oB1RBUPNjjfpWTY4F
 ++Xg==
X-Gm-Message-State: AOAM530j/beTcabvFfx+/eWzv/GDQJG0XEUZOw1NrnP11p6td24EncE7
 X0sGLlrAQSy0Wnodvy75zrPNf9jkeYcogA==
X-Google-Smtp-Source: ABdhPJwtNIO6Op4TNELyxmraFcNSnICAMd2m1UsDcA8BQdmlLnHogXYPsQleqxW61n+TXEB6t7CoJQ==
X-Received: by 2002:a1c:1c2:: with SMTP id 185mr4628330wmb.11.1629997399564;
 Thu, 26 Aug 2021 10:03:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/37] target/arm/cpu64: Validate sve vector lengths are
 supported
Date: Thu, 26 Aug 2021 18:02:39 +0100
Message-Id: <20210826170307.27733-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

Future CPU types may specify which vector lengths are supported.
We can apply nearly the same logic to validate those lengths
as we do for KVM's supported vector lengths. We merge the code
where we can, but unfortunately can't completely merge it because
KVM requires all vector lengths, power-of-two or not, smaller than
the maximum enabled length to also be enabled. The architecture
only requires all the power-of-two lengths, though, so TCG will
only enforce that.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210823160647.34028-5-drjones@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu64.c | 101 ++++++++++++++++++++-------------------------
 1 file changed, 45 insertions(+), 56 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 557fd475774..2f0cbddab56 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -329,35 +329,26 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
                     break;
                 }
             }
-            max_vq = vq <= ARM_MAX_VQ ? vq - 1 : ARM_MAX_VQ;
-            bitmap_andnot(cpu->sve_vq_map, cpu->sve_vq_supported,
-                          cpu->sve_vq_init, max_vq);
-            if (max_vq == 0 || bitmap_empty(cpu->sve_vq_map, max_vq)) {
-                error_setg(errp, "cannot disable sve%d", vq * 128);
-                error_append_hint(errp, "Disabling sve%d results in all "
-                                  "vector lengths being disabled.\n",
-                                  vq * 128);
-                error_append_hint(errp, "With SVE enabled, at least one "
-                                  "vector length must be enabled.\n");
-                return;
-            }
         } else {
             /* Disabling a power-of-two disables all larger lengths. */
-            if (test_bit(0, cpu->sve_vq_init)) {
-                error_setg(errp, "cannot disable sve128");
-                error_append_hint(errp, "Disabling sve128 results in all "
-                                  "vector lengths being disabled.\n");
-                error_append_hint(errp, "With SVE enabled, at least one "
-                                  "vector length must be enabled.\n");
-                return;
-            }
-            for (vq = 2; vq <= ARM_MAX_VQ; vq <<= 1) {
+            for (vq = 1; vq <= ARM_MAX_VQ; vq <<= 1) {
                 if (test_bit(vq - 1, cpu->sve_vq_init)) {
                     break;
                 }
             }
-            max_vq = vq <= ARM_MAX_VQ ? vq - 1 : ARM_MAX_VQ;
-            bitmap_complement(cpu->sve_vq_map, cpu->sve_vq_init, max_vq);
+        }
+
+        max_vq = vq <= ARM_MAX_VQ ? vq - 1 : ARM_MAX_VQ;
+        bitmap_andnot(cpu->sve_vq_map, cpu->sve_vq_supported,
+                      cpu->sve_vq_init, max_vq);
+        if (max_vq == 0 || bitmap_empty(cpu->sve_vq_map, max_vq)) {
+            error_setg(errp, "cannot disable sve%d", vq * 128);
+            error_append_hint(errp, "Disabling sve%d results in all "
+                              "vector lengths being disabled.\n",
+                              vq * 128);
+            error_append_hint(errp, "With SVE enabled, at least one "
+                              "vector length must be enabled.\n");
+            return;
         }
 
         max_vq = find_last_bit(cpu->sve_vq_map, max_vq) + 1;
@@ -393,46 +384,44 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
     assert(max_vq != 0);
     bitmap_clear(cpu->sve_vq_map, max_vq, ARM_MAX_VQ - max_vq);
 
-    if (kvm_enabled()) {
-        /* Ensure the set of lengths matches what KVM supports. */
-        bitmap_xor(tmp, cpu->sve_vq_map, cpu->sve_vq_supported, max_vq);
-        if (!bitmap_empty(tmp, max_vq)) {
-            vq = find_last_bit(tmp, max_vq) + 1;
-            if (test_bit(vq - 1, cpu->sve_vq_map)) {
-                if (cpu->sve_max_vq) {
-                    error_setg(errp, "cannot set sve-max-vq=%d",
-                               cpu->sve_max_vq);
-                    error_append_hint(errp, "This KVM host does not support "
-                                      "the vector length %d-bits.\n",
-                                      vq * 128);
-                    error_append_hint(errp, "It may not be possible to use "
-                                      "sve-max-vq with this KVM host. Try "
-                                      "using only sve<N> properties.\n");
-                } else {
-                    error_setg(errp, "cannot enable sve%d", vq * 128);
-                    error_append_hint(errp, "This KVM host does not support "
-                                      "the vector length %d-bits.\n",
-                                      vq * 128);
-                }
+    /* Ensure the set of lengths matches what is supported. */
+    bitmap_xor(tmp, cpu->sve_vq_map, cpu->sve_vq_supported, max_vq);
+    if (!bitmap_empty(tmp, max_vq)) {
+        vq = find_last_bit(tmp, max_vq) + 1;
+        if (test_bit(vq - 1, cpu->sve_vq_map)) {
+            if (cpu->sve_max_vq) {
+                error_setg(errp, "cannot set sve-max-vq=%d", cpu->sve_max_vq);
+                error_append_hint(errp, "This CPU does not support "
+                                  "the vector length %d-bits.\n", vq * 128);
+                error_append_hint(errp, "It may not be possible to use "
+                                  "sve-max-vq with this CPU. Try "
+                                  "using only sve<N> properties.\n");
             } else {
+                error_setg(errp, "cannot enable sve%d", vq * 128);
+                error_append_hint(errp, "This CPU does not support "
+                                  "the vector length %d-bits.\n", vq * 128);
+            }
+            return;
+        } else {
+            if (kvm_enabled()) {
                 error_setg(errp, "cannot disable sve%d", vq * 128);
                 error_append_hint(errp, "The KVM host requires all "
                                   "supported vector lengths smaller "
                                   "than %d bits to also be enabled.\n",
                                   max_vq * 128);
-            }
-            return;
-        }
-    } else {
-        /* Ensure all required powers-of-two are enabled. */
-        for (vq = pow2floor(max_vq); vq >= 1; vq >>= 1) {
-            if (!test_bit(vq - 1, cpu->sve_vq_map)) {
-                error_setg(errp, "cannot disable sve%d", vq * 128);
-                error_append_hint(errp, "sve%d is required as it "
-                                  "is a power-of-two length smaller than "
-                                  "the maximum, sve%d\n",
-                                  vq * 128, max_vq * 128);
                 return;
+            } else {
+                /* Ensure all required powers-of-two are enabled. */
+                for (vq = pow2floor(max_vq); vq >= 1; vq >>= 1) {
+                    if (!test_bit(vq - 1, cpu->sve_vq_map)) {
+                        error_setg(errp, "cannot disable sve%d", vq * 128);
+                        error_append_hint(errp, "sve%d is required as it "
+                                          "is a power-of-two length smaller "
+                                          "than the maximum, sve%d\n",
+                                          vq * 128, max_vq * 128);
+                        return;
+                    }
+                }
             }
         }
     }
-- 
2.20.1


