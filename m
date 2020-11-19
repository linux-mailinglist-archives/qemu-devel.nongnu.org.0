Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE1D2B9031
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 11:36:25 +0100 (CET)
Received: from localhost ([::1]:43688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfhIe-0005Ez-85
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 05:36:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kfhEy-0000xP-7c
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:32:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kfhEw-0007Z4-F1
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:32:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605781953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qDY3p5tyvrzawRbC9R90nyX4k0K9UXvXdNNRJVMI38w=;
 b=X2/JJ+U0FiBQhVx8RHSuXneJ509YiSBOpg30LjKCsOY3pP2mEIHdupQvp3M+eihZmn0w9V
 BEa2QF6OKnD0eVYK8EmHARhpapdETOvd/oBG7jpmj0Zsz+bj7yRMXR1wX//flm8yCqMCAO
 7xAslbS6d0noWhDDUXmVNK5dkm1mXvw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-enRaRFRGMHq_QcCNkFNlew-1; Thu, 19 Nov 2020 05:32:31 -0500
X-MC-Unique: enRaRFRGMHq_QcCNkFNlew-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C269318957E8
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 10:32:30 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.193.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7255560854;
 Thu, 19 Nov 2020 10:32:29 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] i386: move hyperv_limits initialization to
 x86_cpu_realizefn()
Date: Thu, 19 Nov 2020 11:32:20 +0100
Message-Id: <20201119103221.1665171-5-vkuznets@redhat.com>
In-Reply-To: <20201119103221.1665171-1-vkuznets@redhat.com>
References: <20201119103221.1665171-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 03:44:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As a preparation to expanding Hyper-V CPU features early, move
hyperv_limits initialization to x86_cpu_realizefn().

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/cpu.c |  5 +++++
 target/i386/cpu.h |  1 +
 target/i386/kvm.c | 13 ++++++++++++-
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 9e182929d29d..83aca942d87c 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6536,6 +6536,11 @@ static void x86_cpu_hyperv_realize(X86CPU *cpu)
     /* Hypervisor system identity */
     cpu->hyperv_version_id[0] = 0x00001bbc;
     cpu->hyperv_version_id[1] = 0x00060001;
+
+    /* Hypervisor implementation limits */
+    cpu->hyperv_limits[0] = 64;
+    cpu->hyperv_limits[1] = 0;
+    cpu->hyperv_limits[2] = 0;
 }
 
 static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 913927356c55..c95f20f59b15 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1663,6 +1663,7 @@ struct X86CPU {
     uint32_t hyperv_vendor_id[3];
     uint32_t hyperv_interface_id[4];
     uint32_t hyperv_version_id[4];
+    uint32_t hyperv_limits[3];
 
     bool check_cpuid;
     bool enforce_cpuid;
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 58a2528c6c41..446ab2ef1793 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -1233,6 +1233,15 @@ static int hyperv_handle_properties(CPUState *cs,
             env->features[FEAT_HYPERV_EBX] = c->ebx;
             env->features[FEAT_HYPERV_EDX] = c->edx;
         }
+
+        c = cpuid_find_entry(cpuid, HV_CPUID_IMPLEMENT_LIMITS, 0);
+        if (c) {
+            cpu->hv_max_vps = c->eax;
+            cpu->hyperv_limits[0] = c->ebx;
+            cpu->hyperv_limits[1] = c->ecx;
+            cpu->hyperv_limits[2] = c->edx;
+        }
+
         c = cpuid_find_entry(cpuid, HV_CPUID_ENLIGHTMENT_INFO, 0);
         if (c) {
             env->features[FEAT_HV_RECOMM_EAX] = c->eax;
@@ -1335,7 +1344,9 @@ static int hyperv_handle_properties(CPUState *cs,
     c = &cpuid_ent[cpuid_i++];
     c->function = HV_CPUID_IMPLEMENT_LIMITS;
     c->eax = cpu->hv_max_vps;
-    c->ebx = 0x40;
+    c->ebx = cpu->hyperv_limits[0];
+    c->ecx = cpu->hyperv_limits[1];
+    c->edx = cpu->hyperv_limits[2];
 
     if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS)) {
         __u32 function;
-- 
2.26.2


