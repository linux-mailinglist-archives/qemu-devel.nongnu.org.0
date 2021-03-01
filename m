Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0581132803D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 15:07:02 +0100 (CET)
Received: from localhost ([::1]:45558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGjCP-0005hu-25
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 09:07:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lGixf-0006uM-9s
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:51:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lGixd-0008Uj-8g
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:51:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614606704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b8bIwmfTIMcTXViwqHfwsf2z/AAHcupjBkRSyHakUM4=;
 b=hQKttINSClmGwKBj15Q5n7vpPq4JhN46mI2T9FSJ1A1co9TvuKpwkr6x7Dh1xVk7aHtTHD
 mSjEnEtskpFMqpz+Sls2qOHuXGVyjs1fjeaZQDXhrlAticwHS6MVPdb05WFBXSkqXUogwN
 vpxzBYclcwu79vFYKPJhmJtP2JHKc6M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-IIf0PHbwMlSqxnzYwZYXqA-1; Mon, 01 Mar 2021 08:51:43 -0500
X-MC-Unique: IIf0PHbwMlSqxnzYwZYXqA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EFC985B6C1
 for <qemu-devel@nongnu.org>; Mon,  1 Mar 2021 13:51:41 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.195.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5898862465;
 Mon,  1 Mar 2021 13:51:39 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 16/17] i386: provide simple 'hv-default=on' option
Date: Mon,  1 Mar 2021 14:51:02 +0100
Message-Id: <20210301135103.306003-17-vkuznets@redhat.com>
In-Reply-To: <20210301135103.306003-1-vkuznets@redhat.com>
References: <20210301135103.306003-1-vkuznets@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 docs/hyperv.txt   | 18 ++++++++++++++---
 target/i386/cpu.c | 50 +++++++++++++++++++++++++++++++++++++++++++++--
 target/i386/cpu.h |  3 +++
 3 files changed, 66 insertions(+), 5 deletions(-)

diff --git a/docs/hyperv.txt b/docs/hyperv.txt
index 5df00da54fc4..0a15cf026017 100644
--- a/docs/hyperv.txt
+++ b/docs/hyperv.txt
@@ -17,10 +17,22 @@ compatible hypervisor and use Hyper-V specific features.
 
 2. Setup
 =========
-No Hyper-V enlightenments are enabled by default by either KVM or QEMU. In
-QEMU, individual enlightenments can be enabled through CPU flags, e.g:
+The default set of currently supported Hyper-V enlightenments (consisting of all
+currently supported enlightenments except for 'hv-evmcs' which can only be
+enabled on VMX enabled guests) can be enabled by specifying 'hv-default=on' CPU
+flag:
 
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
index dd639dd06784..14f566cfde57 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4658,6 +4658,25 @@ static void x86_cpuid_set_tsc_freq(Object *obj, Visitor *v, const char *name,
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
+    /* hv-default overrides everything with the default set */
+    if (value) {
+        cpu->hyperv_features = cpu->hyperv_default_features;
+    }
+}
+
 /* Generic getter for "feature-words" and "filtered-features" properties */
 static void x86_cpu_get_feature_words(Object *obj, Visitor *v,
                                       const char *name, void *opaque,
@@ -6563,10 +6582,16 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
     }
 }
 
-static void x86_cpu_hyperv_realize(X86CPU *cpu)
+static void x86_cpu_hyperv_realize(X86CPU *cpu, Error **errp)
 {
     size_t len;
 
+    if (cpu->hyperv_passthrough && cpu->hyperv_default) {
+        error_setg(errp,
+                   "'hv-default' and 'hv-paththrough' are mutually exclusive");
+        return;
+    }
+
     /* Hyper-V vendor id */
     if (!cpu->hyperv_vendor) {
         object_property_set_str(OBJECT(cpu), "hv-vendor-id", "Microsoft Hv",
@@ -6768,7 +6793,10 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 
     /* Process Hyper-V enlightenments */
-    x86_cpu_hyperv_realize(cpu);
+    x86_cpu_hyperv_realize(cpu, &local_err);
+    if (local_err) {
+        goto out;
+    }
 
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
@@ -7063,6 +7091,20 @@ static void x86_cpu_initfn(Object *obj)
     if (xcc->model) {
         x86_cpu_load_model(cpu, xcc->model);
     }
+
+    /*
+     * Hyper-V features enabled with 'hv-default=on'
+     * TODO: add 'HYPERV_FEAT_EVMCS' to the list. Enlightened VMCS can only
+     * be enabled for VMX enabled guests but here it can't be checked.
+     */
+    cpu->hyperv_default_features = BIT(HYPERV_FEAT_RELAXED) |
+        BIT(HYPERV_FEAT_VAPIC) | BIT(HYPERV_FEAT_TIME) |
+        BIT(HYPERV_FEAT_CRASH) | BIT(HYPERV_FEAT_RESET) |
+        BIT(HYPERV_FEAT_VPINDEX) | BIT(HYPERV_FEAT_RUNTIME) |
+        BIT(HYPERV_FEAT_SYNIC) | BIT(HYPERV_FEAT_STIMER) |
+        BIT(HYPERV_FEAT_FREQUENCIES) | BIT(HYPERV_FEAT_REENLIGHTENMENT) |
+        BIT(HYPERV_FEAT_TLBFLUSH) | BIT(HYPERV_FEAT_IPI) |
+        BIT(HYPERV_FEAT_STIMER_DIRECT);
 }
 
 static int64_t x86_cpu_get_arch_id(CPUState *cs)
@@ -7389,6 +7431,10 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
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
index 265e552746e7..f014f1a89f89 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1673,6 +1673,9 @@ struct X86CPU {
     bool hyperv_synic_kvm_only;
     uint64_t hyperv_features;
     bool hyperv_passthrough;
+    /* 'hv-default' enablement */
+    uint64_t hyperv_default_features;
+    bool hyperv_default;
     OnOffAuto hyperv_no_nonarch_cs;
     uint32_t hyperv_vendor_id[3];
     uint32_t hyperv_interface_id[4];
-- 
2.29.2


