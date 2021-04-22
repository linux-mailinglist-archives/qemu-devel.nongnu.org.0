Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8A23684BD
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 18:24:16 +0200 (CEST)
Received: from localhost ([::1]:39554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZc7j-0008Ta-VF
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 12:24:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lZbvo-0003cn-8u
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 12:11:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lZbvm-00033U-J4
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 12:11:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619107914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MF24+tGcu2Fp/r3YBZehQHa0V5od0ydoePIAfDHA10Y=;
 b=I0S84vg/9dmjVpDu+ZWNmWtMj+0Xd9zOgydcC8tdOH6RZ8ls1AAOblzM1nmv+MRzLGsVcb
 HbPJWevMUXdEzM+YZt0pk6dOvEzHG+VUjl8l/EgdE/AY/pkTItni8JMCgah2M+TuWFNdgl
 4Hf7roodimrx1uw3CNUtk9IOhycxqIc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396--Ap5XUxOOry3e_CDv_iliQ-1; Thu, 22 Apr 2021 12:11:47 -0400
X-MC-Unique: -Ap5XUxOOry3e_CDv_iliQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BE05343A2
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 16:11:46 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 068D55B4A0;
 Thu, 22 Apr 2021 16:11:44 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 05/19] i386: introduce hyperv_feature_supported()
Date: Thu, 22 Apr 2021 18:11:16 +0200
Message-Id: <20210422161130.652779-6-vkuznets@redhat.com>
In-Reply-To: <20210422161130.652779-1-vkuznets@redhat.com>
References: <20210422161130.652779-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clean up hv_cpuid_check_and_set() by separating hyperv_feature_supported()
off it. No functional change intended.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/kvm/kvm.c | 49 ++++++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index f791baa29acf..ba093dba4d23 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1107,13 +1107,33 @@ static int hv_cpuid_get_fw(struct kvm_cpuid2 *cpuid, int fw, uint32_t *r)
     return 0;
 }
 
+static bool hyperv_feature_supported(struct kvm_cpuid2 *cpuid, int feature)
+{
+    uint32_t r, fw, bits;
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(kvm_hyperv_properties[feature].flags); i++) {
+        fw = kvm_hyperv_properties[feature].flags[i].fw;
+        bits = kvm_hyperv_properties[feature].flags[i].bits;
+
+        if (!fw) {
+            continue;
+        }
+
+        if (hv_cpuid_get_fw(cpuid, fw, &r) || (r & bits) != bits) {
+            return false;
+        }
+    }
+
+    return true;
+}
+
 static int hv_cpuid_check_and_set(CPUState *cs, struct kvm_cpuid2 *cpuid,
                                   int feature)
 {
     X86CPU *cpu = X86_CPU(cs);
-    uint32_t r, fw, bits;
     uint64_t deps;
-    int i, dep_feat;
+    int dep_feat;
 
     if (!hyperv_feat_enabled(cpu, feature) && !cpu->hyperv_passthrough) {
         return 0;
@@ -1132,23 +1152,14 @@ static int hv_cpuid_check_and_set(CPUState *cs, struct kvm_cpuid2 *cpuid,
         deps &= ~(1ull << dep_feat);
     }
 
-    for (i = 0; i < ARRAY_SIZE(kvm_hyperv_properties[feature].flags); i++) {
-        fw = kvm_hyperv_properties[feature].flags[i].fw;
-        bits = kvm_hyperv_properties[feature].flags[i].bits;
-
-        if (!fw) {
-            continue;
-        }
-
-        if (hv_cpuid_get_fw(cpuid, fw, &r) || (r & bits) != bits) {
-            if (hyperv_feat_enabled(cpu, feature)) {
-                fprintf(stderr,
-                        "Hyper-V %s is not supported by kernel\n",
-                        kvm_hyperv_properties[feature].desc);
-                return 1;
-            } else {
-                return 0;
-            }
+    if (!hyperv_feature_supported(cpuid, feature)) {
+        if (hyperv_feat_enabled(cpu, feature)) {
+            fprintf(stderr,
+                    "Hyper-V %s is not supported by kernel\n",
+                    kvm_hyperv_properties[feature].desc);
+            return 1;
+        } else {
+            return 0;
         }
     }
 
-- 
2.30.2


