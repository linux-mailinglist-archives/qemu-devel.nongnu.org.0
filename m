Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3FB3D2343
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 14:18:45 +0200 (CEST)
Received: from localhost ([::1]:37516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Xf2-0006aC-QW
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 08:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1m6XcZ-0003jD-Nz
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 08:16:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1m6XcV-0001wx-OC
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 08:16:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626956166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=btr0PhTidQ9MZJKJ7QMWWCLRZGUMLgkEu6GN5vkWXB4=;
 b=Tkmq2JJmzmfR6331KlMhxZTms04gNhidvnCk4VcSVuTQJ0fDQT5xXvIcYqUaiQEt91OGWZ
 tz8L5iXTc0a57u9Q8oOWKJUDSgt/PXsxm2/JG0lIdJueV2TeIbEDzDkKHWr/piMouvnUKG
 Nhqj23Ynzzk5P8Bm0VhDG3rCXoNVRes=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-H5m0XRp8M3S1c25jpFEsng-1; Thu, 22 Jul 2021 08:16:04 -0400
X-MC-Unique: H5m0XRp8M3S1c25jpFEsng-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76B0F10086C9
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 12:16:03 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.195.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59F1F5C230;
 Thu, 22 Jul 2021 12:15:44 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 3/3] i386: Support KVM_CAP_HYPERV_ENFORCE_CPUID
Date: Thu, 22 Jul 2021 14:15:28 +0200
Message-Id: <20210722121528.258426-4-vkuznets@redhat.com>
In-Reply-To: <20210722121528.258426-1-vkuznets@redhat.com>
References: <20210722121528.258426-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By default, KVM allows the guest to use all currently supported Hyper-V
enlightenments when Hyper-V CPUID interface was exposed, regardless of if
some features were not announced in guest visible CPUIDs. hv-enforce-cpuid
feature alters this behavior and only allows the guest to use exposed
Hyper-V enlightenments. The feature is supported by Linux >= 5.14 and is
not enabled by default in QEMU.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 docs/hyperv.txt       | 17 ++++++++++++++---
 target/i386/cpu.c     |  1 +
 target/i386/cpu.h     |  1 +
 target/i386/kvm/kvm.c |  9 +++++++++
 4 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/docs/hyperv.txt b/docs/hyperv.txt
index 000638a2fd38..072709a68f47 100644
--- a/docs/hyperv.txt
+++ b/docs/hyperv.txt
@@ -203,8 +203,11 @@ When the option is set to 'on' QEMU will always enable the feature, regardless
 of host setup. To keep guests secure, this can only be used in conjunction with
 exposing correct vCPU topology and vCPU pinning.
 
-4. Development features
-========================
+4. Supplementary features
+=========================
+
+4.1. hv-passthrough
+===================
 In some cases (e.g. during development) it may make sense to use QEMU in
 'pass-through' mode and give Windows guests all enlightenments currently
 supported by KVM. This pass-through mode is enabled by "hv-passthrough" CPU
@@ -215,8 +218,16 @@ values from KVM to QEMU. "hv-passthrough" overrides all other "hv-*" settings on
 the command line. Also, enabling this flag effectively prevents migration as the
 list of enabled enlightenments may differ between target and destination hosts.
 
+4.2. hv-enforce-cpuid
+=====================
+By default, KVM allows the guest to use all currently supported Hyper-V
+enlightenments when Hyper-V CPUID interface was exposed, regardless of if
+some features were not announced in guest visible CPUIDs. 'hv-enforce-cpuid'
+feature alters this behavior and only allows the guest to use exposed Hyper-V
+enlightenments.
+
 
-4. Useful links
+5. Useful links
 ================
 Hyper-V Top Level Functional specification and other information:
 https://github.com/MicrosoftDocs/Virtualization-Documentation
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 0a0d2cddc9d2..1d4c44c8b762 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6642,6 +6642,7 @@ static Property x86_cpu_properties[] = {
     DEFINE_PROP_ON_OFF_AUTO("hv-no-nonarch-coresharing", X86CPU,
                             hyperv_no_nonarch_cs, ON_OFF_AUTO_OFF),
     DEFINE_PROP_BOOL("hv-passthrough", X86CPU, hyperv_passthrough, false),
+    DEFINE_PROP_BOOL("hv-enforce-cpuid", X86CPU, hyperv_enforce_cpuid, false),
 
     DEFINE_PROP_BOOL("check", X86CPU, check_cpuid, true),
     DEFINE_PROP_BOOL("enforce", X86CPU, enforce_cpuid, false),
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 31f1f7caf116..9539f57199fa 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1685,6 +1685,7 @@ struct X86CPU {
     uint32_t hyperv_version_id[4];
     uint32_t hyperv_limits[3];
     uint32_t hyperv_nested[4];
+    bool hyperv_enforce_cpuid;
 
     bool check_cpuid;
     bool enforce_cpuid;
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 452b04f469b5..ccbea88080fc 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1519,6 +1519,15 @@ static int hyperv_init_vcpu(X86CPU *cpu)
         cpu->hyperv_nested[0] = evmcs_version;
     }
 
+    if (cpu->hyperv_enforce_cpuid) {
+        ret = kvm_vcpu_enable_cap(cs, KVM_CAP_HYPERV_ENFORCE_CPUID, 0, 1);
+        if (ret < 0) {
+            error_report("failed to enable KVM_CAP_HYPERV_ENFORCE_CPUID: %s",
+                         strerror(-ret));
+            return ret;
+        }
+    }
+
     return 0;
 }
 
-- 
2.31.1


