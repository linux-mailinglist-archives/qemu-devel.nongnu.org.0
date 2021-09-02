Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 113B63FEB5D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 11:38:58 +0200 (CEST)
Received: from localhost ([::1]:43854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLjBR-0005me-3L
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 05:38:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1mLj9b-000344-M9
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:37:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1mLj9Z-0005VZ-Ve
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:37:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630575421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NChB+iqSavAeJK3mAcR1LskxwsJVsrC28OzaIoJCGbg=;
 b=SJMR0gyZT1szvoTj1lomYMBKS2qLhzc6reLDNxSbX+ovC6WIYb+P4EBmFAeN234j/DjQqV
 BEMyj366nY1rqZ569yBJPTBhykwffg6wq+q2mM0MD72D3CTPv8wKSz/LruA2ZkCIp6DFf3
 RSPdkRKPrmXKET4TkZxxe0tn3J+9mkQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-KsjKQgHxMpOhDWnymJnp2A-1; Thu, 02 Sep 2021 05:35:43 -0400
X-MC-Unique: KsjKQgHxMpOhDWnymJnp2A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7F07501E3
 for <qemu-devel@nongnu.org>; Thu,  2 Sep 2021 09:35:42 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6EF5977BE7;
 Thu,  2 Sep 2021 09:35:40 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/8] i386: Support KVM_CAP_HYPERV_ENFORCE_CPUID
Date: Thu,  2 Sep 2021 11:35:26 +0200
Message-Id: <20210902093530.345756-5-vkuznets@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
index a70038f172d9..36e1b6ec9c9b 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6665,6 +6665,7 @@ static Property x86_cpu_properties[] = {
     DEFINE_PROP_ON_OFF_AUTO("hv-no-nonarch-coresharing", X86CPU,
                             hyperv_no_nonarch_cs, ON_OFF_AUTO_OFF),
     DEFINE_PROP_BOOL("hv-passthrough", X86CPU, hyperv_passthrough, false),
+    DEFINE_PROP_BOOL("hv-enforce-cpuid", X86CPU, hyperv_enforce_cpuid, false),
 
     DEFINE_PROP_BOOL("check", X86CPU, check_cpuid, true),
     DEFINE_PROP_BOOL("enforce", X86CPU, enforce_cpuid, false),
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 20273a8069dd..8822bea5c9a4 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1699,6 +1699,7 @@ struct X86CPU {
     uint32_t hyperv_version_id[4];
     uint32_t hyperv_limits[3];
     uint32_t hyperv_nested[4];
+    bool hyperv_enforce_cpuid;
 
     bool check_cpuid;
     bool enforce_cpuid;
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 49f97f345069..bd0b53416315 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1531,6 +1531,15 @@ static int hyperv_init_vcpu(X86CPU *cpu)
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


