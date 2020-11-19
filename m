Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C312B9027
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 11:34:19 +0100 (CET)
Received: from localhost ([::1]:36670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfhGb-0002MP-T6
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 05:34:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kfhEt-0000rJ-Go
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:32:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kfhEr-0007XD-6s
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:32:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605781948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=67+5A7Lw/CKiVeQEGb5PuiunFj9yz7T8LGeU84HjuIk=;
 b=A6TlGmXMZWZ3XTiQwOh1vV8pBhV1QJwPLWK3wnjGs5hIyHLlg/4aHFvnaD66W0qFcZsZxM
 VQ4kjnSRfGQ84kQvX8CADvf/H99unP4ttQmP+nWeI3tKY9DQFOa57f0s8GD8MFLH0tkeO4
 RPgLNsfc0ncW+1VsLOHqEEPIGY0/Y48=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-H-pt5ftIPV2Gwl-RbwCcqA-1; Thu, 19 Nov 2020 05:32:26 -0500
X-MC-Unique: H-pt5ftIPV2Gwl-RbwCcqA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A71FF18957E9
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 10:32:25 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.193.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52D8360854;
 Thu, 19 Nov 2020 10:32:24 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] i386: move hyperv_vendor_id initialization to
 x86_cpu_realizefn()
Date: Thu, 19 Nov 2020 11:32:17 +0100
Message-Id: <20201119103221.1665171-2-vkuznets@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 23:36:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
hyperv_vendor_id initialization to x86_cpu_realizefn(). Introduce
x86_cpu_hyperv_realize() to not not pollute x86_cpu_realizefn()
itself.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/cpu.c | 23 ++++++++++++++++++++++-
 target/i386/cpu.h |  3 ++-
 target/i386/kvm.c | 25 ++++++++++---------------
 3 files changed, 34 insertions(+), 17 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 5a8c96072e41..2a6885753378 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6509,6 +6509,25 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
     }
 }
 
+static void x86_cpu_hyperv_realize(X86CPU *cpu)
+{
+    size_t len;
+
+    /* Hyper-V vendor id */
+    if (!cpu->hyperv_vendor) {
+        memcpy(cpu->hyperv_vendor_id, "Microsoft Hv", 12);
+    } else {
+        len = strlen(cpu->hyperv_vendor);
+
+        if (len > 12) {
+            warn_report("hv-vendor-id truncated to 12 characters");
+            len = 12;
+        }
+        memset(cpu->hyperv_vendor_id, 0, 12);
+        memcpy(cpu->hyperv_vendor_id, cpu->hyperv_vendor, len);
+    }
+}
+
 static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
@@ -6680,6 +6699,8 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
         env->cache_info_amd.l3_cache = &legacy_l3_cache;
     }
 
+    /* Process Hyper-V enlightenments */
+    x86_cpu_hyperv_realize(cpu);
 
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
@@ -7198,7 +7219,7 @@ static Property x86_cpu_properties[] = {
     DEFINE_PROP_UINT32("min-xlevel2", X86CPU, env.cpuid_min_xlevel2, 0),
     DEFINE_PROP_UINT64("ucode-rev", X86CPU, ucode_rev, 0),
     DEFINE_PROP_BOOL("full-cpuid-auto-level", X86CPU, full_cpuid_auto_level, true),
-    DEFINE_PROP_STRING("hv-vendor-id", X86CPU, hyperv_vendor_id),
+    DEFINE_PROP_STRING("hv-vendor-id", X86CPU, hyperv_vendor),
     DEFINE_PROP_BOOL("cpuid-0xb", X86CPU, enable_cpuid_0xb, true),
     DEFINE_PROP_BOOL("lmce", X86CPU, enable_lmce, false),
     DEFINE_PROP_BOOL("l3-cache", X86CPU, enable_l3_cache, true),
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 88e8586f8fb4..be640bf45c29 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1655,11 +1655,12 @@ struct X86CPU {
     uint64_t ucode_rev;
 
     uint32_t hyperv_spinlock_attempts;
-    char *hyperv_vendor_id;
+    char *hyperv_vendor;
     bool hyperv_synic_kvm_only;
     uint64_t hyperv_features;
     bool hyperv_passthrough;
     OnOffAuto hyperv_no_nonarch_cs;
+    uint32_t hyperv_vendor_id[3];
 
     bool check_cpuid;
     bool enforce_cpuid;
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index a2934dda027c..788a2cf2ec51 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -1205,6 +1205,13 @@ static int hyperv_handle_properties(CPUState *cs,
         memcpy(cpuid_ent, &cpuid->entries[0],
                cpuid->nent * sizeof(cpuid->entries[0]));
 
+        c = cpuid_find_entry(cpuid, HV_CPUID_VENDOR_AND_MAX_FUNCTIONS, 0);
+        if (c) {
+            cpu->hyperv_vendor_id[0] = c->ebx;
+            cpu->hyperv_vendor_id[1] = c->ecx;
+            cpu->hyperv_vendor_id[2] = c->edx;
+        }
+
         c = cpuid_find_entry(cpuid, HV_CPUID_FEATURES, 0);
         if (c) {
             env->features[FEAT_HYPERV_EAX] = c->eax;
@@ -1279,23 +1286,11 @@ static int hyperv_handle_properties(CPUState *cs,
 
     c = &cpuid_ent[cpuid_i++];
     c->function = HV_CPUID_VENDOR_AND_MAX_FUNCTIONS;
-    if (!cpu->hyperv_vendor_id) {
-        memcpy(signature, "Microsoft Hv", 12);
-    } else {
-        size_t len = strlen(cpu->hyperv_vendor_id);
-
-        if (len > 12) {
-            error_report("hv-vendor-id truncated to 12 characters");
-            len = 12;
-        }
-        memset(signature, 0, 12);
-        memcpy(signature, cpu->hyperv_vendor_id, len);
-    }
     c->eax = hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS) ?
         HV_CPUID_NESTED_FEATURES : HV_CPUID_IMPLEMENT_LIMITS;
-    c->ebx = signature[0];
-    c->ecx = signature[1];
-    c->edx = signature[2];
+    c->ebx = cpu->hyperv_vendor_id[0];
+    c->ecx = cpu->hyperv_vendor_id[1];
+    c->edx = cpu->hyperv_vendor_id[2];
 
     c = &cpuid_ent[cpuid_i++];
     c->function = HV_CPUID_INTERFACE;
-- 
2.26.2


