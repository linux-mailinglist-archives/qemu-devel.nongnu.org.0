Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 890EC3F4E14
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 18:14:14 +0200 (CEST)
Received: from localhost ([::1]:48424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mICaO-0001Le-DS
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 12:14:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mICTd-0007o6-1j
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:07:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mICTb-0000M2-BC
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:07:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629734826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T1X9/1+/2b9e9bKrOVFRBolcoPKcB32213cUj9YFLRg=;
 b=g+7Mb8qnfxrZKHmtlzpTVz7ckkeAmfgBtSTPVEE1jl9TSvNoJjQxc7hOb+iiM3vHtYGwPj
 +83taCu+P33CzeHa1n+D4lnHVevWmW1sIBgMs+YXe6jApr5J/MA2Jy9JnlbFm/UEVZdCdS
 3jKM585C4qXOqnT8J4DkUn4Zdq4Qa+c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-wB1VN-8NNU2JIIILM1sMng-1; Mon, 23 Aug 2021 12:07:03 -0400
X-MC-Unique: wB1VN-8NNU2JIIILM1sMng-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11B443E741;
 Mon, 23 Aug 2021 16:07:02 +0000 (UTC)
Received: from gator.redhat.com (unknown [10.40.194.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3215560CC9;
 Mon, 23 Aug 2021 16:07:00 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 4/4] target/arm/cpu64: Validate sve vector lengths are
 supported
Date: Mon, 23 Aug 2021 18:06:47 +0200
Message-Id: <20210823160647.34028-5-drjones@redhat.com>
In-Reply-To: <20210823160647.34028-1-drjones@redhat.com>
References: <20210823160647.34028-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 ishii.shuuichir@fujitsu.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Future CPU types may specify which vector lengths are supported.
We can apply nearly the same logic to validate those lengths
as we do for KVM's supported vector lengths. We merge the code
where we can, but unfortunately can't completely merge it because
KVM requires all vector lengths, power-of-two or not, smaller than
the maximum enabled length to also be enabled. The architecture
only requires all the power-of-two lengths, though, so TCG will
only enforce that.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/cpu64.c | 101 ++++++++++++++++++++-------------------------
 1 file changed, 45 insertions(+), 56 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 557fd4757740..2f0cbddab568 100644
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
2.31.1


