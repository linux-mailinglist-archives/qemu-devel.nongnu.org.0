Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A41A3FEB5C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 11:38:46 +0200 (CEST)
Received: from localhost ([::1]:43128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLjBF-0005Hk-GK
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 05:38:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1mLj9H-0002cI-6k
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:36:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1mLj9E-0005Cc-Fn
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:36:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630575399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w+4med4o5e0PjbTHwYVDzYIj4ycjnS9ptWt5VFOW8Vk=;
 b=DWvvlW2DKujSPL/TjlO6B/WLqctfesBp5dHAHehix3WyOub6ZoAs/80dKrC5vEubX6BH+i
 LDD+LYVN5LnArTiC9gUakAbLv/ThrWNslvJAjLdk/FdaGCLajj1V8cxQawzIBSG7KbY9gY
 p7tpFOdQs8YzcIyfCfQ5brsiKl2M4VI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-y7ySyiUeNVyZWhApI97z2Q-1; Thu, 02 Sep 2021 05:36:37 -0400
X-MC-Unique: y7ySyiUeNVyZWhApI97z2Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DE5C819042
 for <qemu-devel@nongnu.org>; Thu,  2 Sep 2021 09:36:23 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 813E783BFA;
 Thu,  2 Sep 2021 09:36:05 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/8] i386: Make Hyper-V version id configurable
Date: Thu,  2 Sep 2021 11:35:29 +0200
Message-Id: <20210902093530.345756-8-vkuznets@redhat.com>
In-Reply-To: <20210902093530.345756-1-vkuznets@redhat.com>
References: <20210902093530.345756-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Vadim Rozenfeld <vrozenfe@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, we hardcode Hyper-V version id (CPUID 0x40000002) to
WS2008R2 and it is known that certain tools in Windows check this. It
seems useful to provide some flexibility by making it possible to change
this info at will. CPUID information is defined in TLFS as:

EAX: Build Number
EBX Bits 31-16: Major Version
    Bits 15-0: Minor Version
ECX Service Pack
EDX Bits 31-24: Service Branch
    Bits 23-0: Service Number

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 docs/hyperv.txt       | 14 ++++++++++++++
 target/i386/cpu.c     | 15 +++++++++++----
 target/i386/cpu.h     |  7 ++++++-
 target/i386/kvm/kvm.c | 26 ++++++++++++++++----------
 4 files changed, 47 insertions(+), 15 deletions(-)

diff --git a/docs/hyperv.txt b/docs/hyperv.txt
index cd1ea3bbe9d7..7803495468b7 100644
--- a/docs/hyperv.txt
+++ b/docs/hyperv.txt
@@ -211,6 +211,20 @@ When the option is set to 'on' QEMU will always enable the feature, regardless
 of host setup. To keep guests secure, this can only be used in conjunction with
 exposing correct vCPU topology and vCPU pinning.
 
+3.20. hv-version-id-{build,major,minor,spack,sbranch,snumber}
+=============================================================
+This changes Hyper-V version identification in CPUID 0x40000002.EAX-EDX from the
+default (WS2008R2).
+- hv-version-id-build sets 'Build Number' (32 bits)
+- hv-version-id-major sets 'Major Version' (16 bits)
+- hv-version-id-minor sets 'Minor Version' (16 bits)
+- hv-version-id-spack sets 'Service Pack' (32 bits)
+- hv-version-id-sbranch sets 'Service Branch' (8 bits)
+- hv-version-id-snumber sets 'Service Number' (24 bits)
+
+Note: hv-version-id-* are not enlightenments and thus don't enable Hyper-V
+identification when specified without any other enlightenments.
+
 4. Supplementary features
 =========================
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index a695e200d409..5766e720093d 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6093,10 +6093,6 @@ static void x86_cpu_hyperv_realize(X86CPU *cpu)
     cpu->hyperv_interface_id[2] = 0;
     cpu->hyperv_interface_id[3] = 0;
 
-    /* Hypervisor system identity */
-    cpu->hyperv_version_id[0] = 0x00001bbc;
-    cpu->hyperv_version_id[1] = 0x00060001;
-
     /* Hypervisor implementation limits */
     cpu->hyperv_limits[0] = 64;
     cpu->hyperv_limits[1] = 0;
@@ -6671,6 +6667,17 @@ static Property x86_cpu_properties[] = {
     DEFINE_PROP_BOOL("hv-passthrough", X86CPU, hyperv_passthrough, false),
     DEFINE_PROP_BOOL("hv-enforce-cpuid", X86CPU, hyperv_enforce_cpuid, false),
 
+    /* WS2008R2 identify by default */
+    DEFINE_PROP_UINT32("hv-version-id-build", X86CPU, hyperv_ver_id_build,
+                       0x1bbc),
+    DEFINE_PROP_UINT16("hv-version-id-major", X86CPU, hyperv_ver_id_major,
+                       0x0006),
+    DEFINE_PROP_UINT16("hv-version-id-minor", X86CPU, hyperv_ver_id_minor,
+                       0x0001),
+    DEFINE_PROP_UINT32("hv-version-id-spack", X86CPU, hyperv_ver_id_sp, 0),
+    DEFINE_PROP_UINT8("hv-version-id-sbranch", X86CPU, hyperv_ver_id_sb, 0),
+    DEFINE_PROP_UINT32("hv-version-id-snumber", X86CPU, hyperv_ver_id_sn, 0),
+
     DEFINE_PROP_BOOL("check", X86CPU, check_cpuid, true),
     DEFINE_PROP_BOOL("enforce", X86CPU, enforce_cpuid, false),
     DEFINE_PROP_BOOL("x-force-features", X86CPU, force_features, false),
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d22a8d259967..5c2bf1079745 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1697,10 +1697,15 @@ struct X86CPU {
     OnOffAuto hyperv_no_nonarch_cs;
     uint32_t hyperv_vendor_id[3];
     uint32_t hyperv_interface_id[4];
-    uint32_t hyperv_version_id[4];
     uint32_t hyperv_limits[3];
     uint32_t hyperv_nested[4];
     bool hyperv_enforce_cpuid;
+    uint32_t hyperv_ver_id_build;
+    uint16_t hyperv_ver_id_major;
+    uint16_t hyperv_ver_id_minor;
+    uint32_t hyperv_ver_id_sp;
+    uint8_t hyperv_ver_id_sb;
+    uint32_t hyperv_ver_id_sn;
 
     bool check_cpuid;
     bool enforce_cpuid;
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 0f3cb61a9cfd..918472905e73 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1258,14 +1258,18 @@ bool kvm_hyperv_expand_features(X86CPU *cpu, Error **errp)
         cpu->hyperv_interface_id[3] =
             hv_cpuid_get_host(cs, HV_CPUID_INTERFACE, R_EDX);
 
-        cpu->hyperv_version_id[0] =
+        cpu->hyperv_ver_id_build =
             hv_cpuid_get_host(cs, HV_CPUID_VERSION, R_EAX);
-        cpu->hyperv_version_id[1] =
-            hv_cpuid_get_host(cs, HV_CPUID_VERSION, R_EBX);
-        cpu->hyperv_version_id[2] =
+        cpu->hyperv_ver_id_major =
+            hv_cpuid_get_host(cs, HV_CPUID_VERSION, R_EBX) >> 16;
+        cpu->hyperv_ver_id_minor =
+            hv_cpuid_get_host(cs, HV_CPUID_VERSION, R_EBX) & 0xffff;
+        cpu->hyperv_ver_id_sp =
             hv_cpuid_get_host(cs, HV_CPUID_VERSION, R_ECX);
-        cpu->hyperv_version_id[3] =
-            hv_cpuid_get_host(cs, HV_CPUID_VERSION, R_EDX);
+        cpu->hyperv_ver_id_sb =
+            hv_cpuid_get_host(cs, HV_CPUID_VERSION, R_EDX) >> 24;
+        cpu->hyperv_ver_id_sn =
+            hv_cpuid_get_host(cs, HV_CPUID_VERSION, R_EDX) & 0xffffff;
 
         cpu->hv_max_vps = hv_cpuid_get_host(cs, HV_CPUID_IMPLEMENT_LIMITS,
                                             R_EAX);
@@ -1351,10 +1355,12 @@ static int hyperv_fill_cpuids(CPUState *cs,
 
     c = &cpuid_ent[cpuid_i++];
     c->function = HV_CPUID_VERSION;
-    c->eax = cpu->hyperv_version_id[0];
-    c->ebx = cpu->hyperv_version_id[1];
-    c->ecx = cpu->hyperv_version_id[2];
-    c->edx = cpu->hyperv_version_id[3];
+    c->eax = cpu->hyperv_ver_id_build;
+    c->ebx = (uint32_t)cpu->hyperv_ver_id_major << 16 |
+        cpu->hyperv_ver_id_minor;
+    c->ecx = cpu->hyperv_ver_id_sp;
+    c->edx = (uint32_t)cpu->hyperv_ver_id_sb << 24 |
+        (cpu->hyperv_ver_id_sn & 0xffffff);
 
     c = &cpuid_ent[cpuid_i++];
     c->function = HV_CPUID_FEATURES;
-- 
2.31.1


