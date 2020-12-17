Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E19732DD1B8
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 13:53:19 +0100 (CET)
Received: from localhost ([::1]:48844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpsmU-0003AV-Vh
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 07:53:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kpsjW-0008KT-Ol
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 07:50:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kpsjT-0005ep-Ks
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 07:50:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608209411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wt4fNRO2ON9GlunoHmHt/Bx+t6xVXzutK0kdaZ0ry7E=;
 b=SCqgxmjAnwcK28tvEFLPL9/t0RnEU0tSTkefK8PhjcHsDoURfQUIgWmMcjKvDbXKUQ361n
 XTVWOpuMFrIV9dpXDipCKDvsllWu5vBwggjnqtXCgYmDc32BKXOG7x5OSVp/YJDrqq6cwQ
 Skr7aHa4EnpUmPtb620zX6Nh4DDjOUQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-OBvmLqi0OmSVKwzBBS326Q-1; Thu, 17 Dec 2020 07:50:09 -0500
X-MC-Unique: OBvmLqi0OmSVKwzBBS326Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D565107ACE6
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 12:50:08 +0000 (UTC)
Received: from vitty.brq.redhat.com (ovpn-116-238.ams2.redhat.com
 [10.36.116.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3346D5D9C0;
 Thu, 17 Dec 2020 12:50:07 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] i386: introduce kvm_hv_evmcs_available()
Date: Thu, 17 Dec 2020 13:49:58 +0100
Message-Id: <20201217124959.262639-2-vkuznets@redhat.com>
In-Reply-To: <20201217124959.262639-1-vkuznets@redhat.com>
References: <20201217124959.262639-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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

Enlightened VMCS feature is hardware specific, it is only supported on
Intel CPUs. Introduce a simple kvm_hv_evmcs_available() helper, it will
be used to filter out 'hv_evmcs' when 'hyperv=on' option is added to
X86MachineClass.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/kvm-stub.c | 5 +++++
 target/i386/kvm.c      | 8 ++++++++
 target/i386/kvm_i386.h | 1 +
 3 files changed, 14 insertions(+)

diff --git a/target/i386/kvm-stub.c b/target/i386/kvm-stub.c
index 92f49121b8fa..0a163ae207c5 100644
--- a/target/i386/kvm-stub.c
+++ b/target/i386/kvm-stub.c
@@ -39,3 +39,8 @@ bool kvm_hv_vpindex_settable(void)
 {
     return false;
 }
+
+bool kvm_hv_evmcs_available(void)
+{
+    return false;
+}
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index bcfa4b03e077..96395d499729 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
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
@@ -2124,6 +2130,8 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     has_pit_state2 = kvm_check_extension(s, KVM_CAP_PIT_STATE2);
 
     hv_vpindex_settable = kvm_check_extension(s, KVM_CAP_HYPERV_VP_INDEX);
+    hv_evmcs_available =
+        kvm_check_extension(s, KVM_CAP_HYPERV_ENLIGHTENED_VMCS);
 
     has_exception_payload = kvm_check_extension(s, KVM_CAP_EXCEPTION_PAYLOAD);
     if (has_exception_payload) {
diff --git a/target/i386/kvm_i386.h b/target/i386/kvm_i386.h
index dc725083891c..08968cfb33f1 100644
--- a/target/i386/kvm_i386.h
+++ b/target/i386/kvm_i386.h
@@ -47,6 +47,7 @@ bool kvm_has_x2apic_api(void);
 bool kvm_has_waitpkg(void);
 
 bool kvm_hv_vpindex_settable(void);
+bool kvm_hv_evmcs_available(void);
 
 uint64_t kvm_swizzle_msi_ext_dest_id(uint64_t address);
 
-- 
2.29.2


