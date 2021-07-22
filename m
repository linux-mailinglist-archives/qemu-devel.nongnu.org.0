Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 628E93D2341
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 14:18:33 +0200 (CEST)
Received: from localhost ([::1]:37280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Xeq-0006QW-GH
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 08:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1m6XcD-0003V3-9K
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 08:15:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1m6XcA-0001n6-KX
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 08:15:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626956146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YaN20WxT9swZk3ctK7m51QwSlcHWzGaIIaqOlpuC7Wg=;
 b=inB/DsVYZx93z5tGz5SeRHcODAldTSk4qaYiuZ5itPIi6+Aw759ZRicJveegs22vbKGJH0
 mrMNeWoYiTBZly6QbzXjAHmgoGB54oT+wDNZyoL0nZvdylVufXL1Cavp55uQAnnw/C67/N
 0fKvybonQ7+FdtSxfBokfVyr3d5PBi8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-YeRHXkFjOPC8aG7d_krxVQ-1; Thu, 22 Jul 2021 08:15:44 -0400
X-MC-Unique: YeRHXkFjOPC8aG7d_krxVQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB165100855D
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 12:15:43 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.195.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E25905C22B;
 Thu, 22 Jul 2021 12:15:33 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 2/3] i386: Support KVM_CAP_ENFORCE_PV_FEATURE_CPUID
Date: Thu, 22 Jul 2021 14:15:27 +0200
Message-Id: <20210722121528.258426-3-vkuznets@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
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

By default, KVM allows the guest to use all currently supported PV features
even when they were not announced in guest visible CPUIDs. Introduce a new
"kvm-pv-enforce-cpuid" flag to limit the supported feature set to the
exposed features. The feature is supported by Linux >= 5.10 and is not
enabled by default in QEMU.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 docs/kvm-pv.txt       | 13 ++++++++++++-
 target/i386/cpu.c     |  2 ++
 target/i386/cpu.h     |  3 +++
 target/i386/kvm/kvm.c | 10 ++++++++++
 4 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/docs/kvm-pv.txt b/docs/kvm-pv.txt
index 84ad7fa60f8d..d1aac533feea 100644
--- a/docs/kvm-pv.txt
+++ b/docs/kvm-pv.txt
@@ -87,6 +87,17 @@ the number of supported vCPUs for a given configuration lower).
 Tells the guest that guest visible TSC value can be fully trusted for kvmclock
 computations and no warps are expected.
 
-4. Useful links
+4. Supplementary features
+=========================
+
+4.1. kvm-pv-enforce-cpuid
+=========================
+By default, KVM allows the guest to use all currently supported PV features even
+when they were not announced in guest visible CPUIDs. 'kvm-pv-enforce-cpuid'
+feature alters this behavior and limits the supported feature set to the
+exposed features only.
+
+
+5. Useful links
 ================
 Please refer to Documentation/virt/kvm in Linux for additional detail.
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 48b55ebd0a67..0a0d2cddc9d2 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6668,6 +6668,8 @@ static Property x86_cpu_properties[] = {
     DEFINE_PROP_BOOL("l3-cache", X86CPU, enable_l3_cache, true),
     DEFINE_PROP_BOOL("kvm-no-smi-migration", X86CPU, kvm_no_smi_migration,
                      false),
+    DEFINE_PROP_BOOL("kvm-pv-enforce-cpuid", X86CPU, kvm_pv_enforce_cpuid,
+                     false),
     DEFINE_PROP_BOOL("vmware-cpuid-freq", X86CPU, vmware_cpuid_freq, true),
     DEFINE_PROP_BOOL("tcg-cpuid", X86CPU, expose_tcg, true),
     DEFINE_PROP_BOOL("x-migrate-smi-count", X86CPU, migrate_smi_count,
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 5d98a4e7c025..31f1f7caf116 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1768,6 +1768,9 @@ struct X86CPU {
     /* Stop SMI delivery for migration compatibility with old machines */
     bool kvm_no_smi_migration;
 
+    /* Forcefully disable KVM PV features not exposed in guest CPUIDs */
+    bool kvm_pv_enforce_cpuid;
+
     /* Number of physical address bits supported */
     uint32_t phys_bits;
 
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 59ed8327ac13..452b04f469b5 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1617,6 +1617,16 @@ int kvm_arch_init_vcpu(CPUState *cs)
 
     cpu_x86_cpuid(env, 0, 0, &limit, &unused, &unused, &unused);
 
+    if (cpu->kvm_pv_enforce_cpuid) {
+        r = kvm_vcpu_enable_cap(cs, KVM_CAP_ENFORCE_PV_FEATURE_CPUID, 0, 1);
+        if (r < 0) {
+            fprintf(stderr,
+                    "failed to enable KVM_CAP_ENFORCE_PV_FEATURE_CPUID: %s",
+                    strerror(-r));
+            abort();
+        }
+    }
+
     for (i = 0; i <= limit; i++) {
         if (cpuid_i == KVM_MAX_CPUID_ENTRIES) {
             fprintf(stderr, "unsupported level value: 0x%x\n", limit);
-- 
2.31.1


