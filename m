Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6B42ED33B
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 16:08:59 +0100 (CET)
Received: from localhost ([::1]:47260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxWuI-0008QG-C1
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 10:08:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kxWsO-0006o5-BA
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 10:07:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kxWsL-0003l4-2y
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 10:07:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610032015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e21cEJUFpBfzlnQhTjopy16GeqCf8d26UnTF7WcnlWM=;
 b=XH3plSJ3Is1uKURkE4RFKxQiJwtt8NdQd+jOEdQEGSPtaDtZWm0+lXL2vZXNDJRhpxud9C
 YY/NAxKtpkvySQLg+sKIp08OomvZzRecJGcSlhILZSvjyzOuIPw+wumBprnOtC4W3r9TdT
 WEaSTJADGZtqI0WRpUcXKbGBI1Ztthk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-OIJEvyb5Pj-jWPunP3NiZg-1; Thu, 07 Jan 2021 10:06:52 -0500
X-MC-Unique: OIJEvyb5Pj-jWPunP3NiZg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0BB41005504
 for <qemu-devel@nongnu.org>; Thu,  7 Jan 2021 15:06:51 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.195.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4262860861;
 Thu,  7 Jan 2021 15:06:49 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/19] i386: introduce kvm_hv_evmcs_available()
Date: Thu,  7 Jan 2021 16:06:23 +0100
Message-Id: <20210107150640.539239-3-vkuznets@redhat.com>
In-Reply-To: <20210107150640.539239-1-vkuznets@redhat.com>
References: <20210107150640.539239-1-vkuznets@redhat.com>
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

Enlightened VMCS feature is hardware specific, it is only supported on
Intel CPUs. Introduce a simple kvm_hv_evmcs_available() helper, it will
be used to filter out 'hv_evmcs' when 'hyperv=on' option is added to
X86MachineClass.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/kvm/kvm-stub.c | 5 +++++
 target/i386/kvm/kvm.c      | 8 ++++++++
 target/i386/kvm/kvm_i386.h | 1 +
 3 files changed, 14 insertions(+)

diff --git a/target/i386/kvm/kvm-stub.c b/target/i386/kvm/kvm-stub.c
index 92f49121b8fa..0a163ae207c5 100644
--- a/target/i386/kvm/kvm-stub.c
+++ b/target/i386/kvm/kvm-stub.c
@@ -39,3 +39,8 @@ bool kvm_hv_vpindex_settable(void)
 {
     return false;
 }
+
+bool kvm_hv_evmcs_available(void)
+{
+    return false;
+}
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 6dc1ee052d5f..edaaed56c6e2 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -95,6 +95,7 @@ static bool has_msr_hv_crash;
 static bool has_msr_hv_reset;
 static bool has_msr_hv_vpindex;
 static bool hv_vpindex_settable;
+static bool hv_evmcs_available;
 static bool has_msr_hv_runtime;
 static bool has_msr_hv_synic;
 static bool has_msr_hv_stimer;
@@ -192,6 +193,11 @@ bool kvm_hv_vpindex_settable(void)
     return hv_vpindex_settable;
 }
 
+bool kvm_hv_evmcs_available(void)
+{
+    return hv_evmcs_available;
+}
+
 static int kvm_get_tsc(CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -2146,6 +2152,8 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     has_pit_state2 = kvm_check_extension(s, KVM_CAP_PIT_STATE2);
 
     hv_vpindex_settable = kvm_check_extension(s, KVM_CAP_HYPERV_VP_INDEX);
+    hv_evmcs_available =
+        kvm_check_extension(s, KVM_CAP_HYPERV_ENLIGHTENED_VMCS);
 
     has_exception_payload = kvm_check_extension(s, KVM_CAP_EXCEPTION_PAYLOAD);
     if (has_exception_payload) {
diff --git a/target/i386/kvm/kvm_i386.h b/target/i386/kvm/kvm_i386.h
index dc725083891c..08968cfb33f1 100644
--- a/target/i386/kvm/kvm_i386.h
+++ b/target/i386/kvm/kvm_i386.h
@@ -47,6 +47,7 @@ bool kvm_has_x2apic_api(void);
 bool kvm_has_waitpkg(void);
 
 bool kvm_hv_vpindex_settable(void);
+bool kvm_hv_evmcs_available(void);
 
 uint64_t kvm_swizzle_msi_ext_dest_id(uint64_t address);
 
-- 
2.29.2


