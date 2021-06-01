Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 110C13979ED
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 20:19:39 +0200 (CEST)
Received: from localhost ([::1]:40984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo8zK-00081I-3i
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 14:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lo8qY-0002Iy-Ck
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 14:10:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lo8qW-0005k4-Kg
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 14:10:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622571031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sDnpW+ipaKdln62AKVZyyR78WKBVDrXgag+C1IyACJM=;
 b=W/MCcz2inUohXPbwoF/mSePLk0ikKYlTWCw4eFr7snHZGYzAys4Cx7gHkTzX2xIJPDz7gm
 GDFQoRHv2egspy8VwNhlF0X7fMrcf//zptvZczDzANhAt5ALcnLCdVsNoC0PbwOpbqH8wf
 8G7hMhCtSDpRoYeHNYRRnZtZkwF1wns=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-i2XPLbkhMCqL_lsGUy91Jw-1; Tue, 01 Jun 2021 14:10:29 -0400
X-MC-Unique: i2XPLbkhMCqL_lsGUy91Jw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7631F107ACCA;
 Tue,  1 Jun 2021 18:10:28 +0000 (UTC)
Received: from localhost (ovpn-112-239.rdu2.redhat.com [10.10.112.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A054A60E3A;
 Tue,  1 Jun 2021 18:10:24 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 12/24] i386: introduce hyperv_feature_supported()
Date: Tue,  1 Jun 2021 14:10:02 -0400
Message-Id: <20210601181014.2568861-13-ehabkost@redhat.com>
In-Reply-To: <20210601181014.2568861-1-ehabkost@redhat.com>
References: <20210601181014.2568861-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vitaly Kuznetsov <vkuznets@redhat.com>

Clean up hv_cpuid_check_and_set() by separating hyperv_feature_supported()
off it. No functional change intended.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20210422161130.652779-6-vkuznets@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/kvm/kvm.c | 49 ++++++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 346528c6496..712285df40e 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1108,13 +1108,33 @@ static int hv_cpuid_get_fw(struct kvm_cpuid2 *cpuid, int fw, uint32_t *r)
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
@@ -1133,23 +1153,14 @@ static int hv_cpuid_check_and_set(CPUState *cs, struct kvm_cpuid2 *cpuid,
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


