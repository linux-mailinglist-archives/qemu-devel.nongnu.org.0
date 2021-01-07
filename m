Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 997712ED372
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 16:22:33 +0100 (CET)
Received: from localhost ([::1]:59330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxX7Q-0000Kv-L0
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 10:22:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kxX06-000069-0s
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 10:14:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kxX03-0006Re-6z
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 10:14:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610032494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9NU3i8B9LkIoL2CfvPNYWccdarbgzFm4TG0pt27rBs8=;
 b=HkoNM183busWauisdAwQw7uBDokYLJwq3PD5q9ugheOl3G4liPTnbUbptswvqf/ciziOwz
 vcmwd9+rXMQy5+853B93oXHIJQ/gFv7dcxnvdCHxSzK/48FDXoxpTupn5ssSRgNE+2CxMh
 F2bd4/7ytlE9aWUNfFXwGdYDnRM+QvY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-SwrK_P18MdqfACj974lfrQ-1; Thu, 07 Jan 2021 10:14:53 -0500
X-MC-Unique: SwrK_P18MdqfACj974lfrQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12347107ACE3
 for <qemu-devel@nongnu.org>; Thu,  7 Jan 2021 15:14:52 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.195.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C62E5B6AF;
 Thu,  7 Jan 2021 15:14:50 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 18/19] i386: provide simple 'hv-default=on' option
Date: Thu,  7 Jan 2021 16:14:49 +0100
Message-Id: <20210107151449.541062-1-vkuznets@redhat.com>
In-Reply-To: <20210107150640.539239-1-vkuznets@redhat.com>
References: <20210107150640.539239-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Enabling Hyper-V emulation for a Windows VM is a tiring experience as it
requires listing all currently supported enlightenments ("hv-*" CPU
features) explicitly. We do have 'hv-passthrough' mode enabling
everything but it can't be used in production as it prevents migration.

Introduce a simple 'hv-default=on' CPU flag enabling all currently supported
Hyper-V enlightenments. Later, when new enlightenments get implemented,
compat_props mechanism will be used to disable them for legacy machine types,
this will keep 'hv-default=on' configurations migratable.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 docs/hyperv.txt   | 16 +++++++++++++---
 target/i386/cpu.c | 38 ++++++++++++++++++++++++++++++++++++++
 target/i386/cpu.h |  5 +++++
 3 files changed, 56 insertions(+), 3 deletions(-)

diff --git a/docs/hyperv.txt b/docs/hyperv.txt
index 5df00da54fc4..a54c066cab09 100644
--- a/docs/hyperv.txt
+++ b/docs/hyperv.txt
@@ -17,10 +17,20 @@ compatible hypervisor and use Hyper-V specific features.
 
 2. Setup
 =========
-No Hyper-V enlightenments are enabled by default by either KVM or QEMU. In
-QEMU, individual enlightenments can be enabled through CPU flags, e.g:
+All currently supported Hyper-V enlightenments can be enabled by specifying
+'hv-default=on' CPU flag:
 
-  qemu-system-x86_64 --enable-kvm --cpu host,hv_relaxed,hv_vpindex,hv_time, ...
+  qemu-system-x86_64 --enable-kvm --cpu host,hv-default ...
+
+Alternatively, it is possible to do fine-grained enablement through CPU flags,
+e.g:
+
+  qemu-system-x86_64 --enable-kvm --cpu host,hv-relaxed,hv-vpindex,hv-time ...
+
+It is also possible to disable individual enlightenments from the default list,
+this can be used for debugging purposes:
+
+  qemu-system-x86_64 --enable-kvm --cpu host,hv-default=on,hv-evmcs=off ...
 
 Sometimes there are dependencies between enlightenments, QEMU is supposed to
 check that the supplied configuration is sane.
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 48007a876e32..99338de00f78 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4552,6 +4552,24 @@ static void x86_cpuid_set_tsc_freq(Object *obj, Visitor *v, const char *name,
     cpu->env.tsc_khz = cpu->env.user_tsc_khz = value / 1000;
 }
 
+static bool x86_hv_default_get(Object *obj, Error **errp)
+{
+    X86CPU *cpu = X86_CPU(obj);
+
+    return cpu->hyperv_default;
+}
+
+static void x86_hv_default_set(Object *obj, bool value, Error **errp)
+{
+    X86CPU *cpu = X86_CPU(obj);
+
+    cpu->hyperv_default = value;
+
+    if (value) {
+        cpu->hyperv_features |= cpu->hyperv_default_features;
+    }
+}
+
 /* Generic getter for "feature-words" and "filtered-features" properties */
 static void x86_cpu_get_feature_words(Object *obj, Visitor *v,
                                       const char *name, void *opaque,
@@ -6955,10 +6973,26 @@ static void x86_cpu_initfn(Object *obj)
     object_property_add_alias(obj, "pause_filter", obj, "pause-filter");
     object_property_add_alias(obj, "sse4_1", obj, "sse4.1");
     object_property_add_alias(obj, "sse4_2", obj, "sse4.2");
+    object_property_add_alias(obj, "hv_default", obj, "hv-default");
 
     if (xcc->model) {
         x86_cpu_load_model(cpu, xcc->model);
     }
+
+    /* Hyper-V features enabled with 'hv-default=on' */
+    cpu->hyperv_default_features = BIT(HYPERV_FEAT_RELAXED) |
+        BIT(HYPERV_FEAT_VAPIC) | BIT(HYPERV_FEAT_TIME) |
+        BIT(HYPERV_FEAT_CRASH) | BIT(HYPERV_FEAT_RESET) |
+        BIT(HYPERV_FEAT_VPINDEX) | BIT(HYPERV_FEAT_RUNTIME) |
+        BIT(HYPERV_FEAT_SYNIC) | BIT(HYPERV_FEAT_STIMER) |
+        BIT(HYPERV_FEAT_FREQUENCIES) | BIT(HYPERV_FEAT_REENLIGHTENMENT) |
+        BIT(HYPERV_FEAT_TLBFLUSH) | BIT(HYPERV_FEAT_IPI) |
+        BIT(HYPERV_FEAT_STIMER_DIRECT);
+
+    /* Enlightened VMCS is only available on Intel/VMX */
+    if (kvm_hv_evmcs_available()) {
+        cpu->hyperv_default_features |= BIT(HYPERV_FEAT_EVMCS);
+    }
 }
 
 static int64_t x86_cpu_get_arch_id(CPUState *cs)
@@ -7285,6 +7319,10 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
                               x86_cpu_get_crash_info_qom, NULL, NULL, NULL);
 #endif
 
+    object_class_property_add_bool(oc, "hv-default",
+                              x86_hv_default_get,
+                              x86_hv_default_set);
+
     for (w = 0; w < FEATURE_WORDS; w++) {
         int bitnr;
         for (bitnr = 0; bitnr < 64; bitnr++) {
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 6220cb2cabb9..8a484becb6b9 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1657,6 +1657,11 @@ struct X86CPU {
     bool hyperv_synic_kvm_only;
     uint64_t hyperv_features;
     bool hyperv_passthrough;
+
+    /* 'hv-default' enablement */
+    uint64_t hyperv_default_features;
+    bool hyperv_default;
+
     OnOffAuto hyperv_no_nonarch_cs;
     uint32_t hyperv_vendor_id[3];
     uint32_t hyperv_interface_id[4];
-- 
2.29.2


