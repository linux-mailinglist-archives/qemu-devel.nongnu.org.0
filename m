Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75158316C1F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 18:10:00 +0100 (CET)
Received: from localhost ([::1]:45974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9t03-0003Fh-7I
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 12:09:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1l9sYZ-0007QL-Dj
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 11:41:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1l9sYP-0008VZ-UM
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 11:41:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612975284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h0QvmjX98VbM0hJDAiWjHMsOGh3uS/mkzUm9fqxf+c0=;
 b=OgLG29xca1go4UsZbnkJ6znB1xGYKF8bwq4oj7SqssckipNFtnMrLT1G+xu80KBzFGvJ7/
 f1PE5sTm4xWrnwoZY8xYrk2dJepFKUQJ9JPuv8uPAqFcMZbzlNq6UVHOfx82Dx3X+Tlw46
 Vblmy4Aldle2lnDgA1TwBar/9uR/fYo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-RRSRKQTXMtaCXFBI-2uPXQ-1; Wed, 10 Feb 2021 11:41:23 -0500
X-MC-Unique: RRSRKQTXMtaCXFBI-2uPXQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B040801962
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 16:41:22 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.195.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 972D25D9D0;
 Wed, 10 Feb 2021 16:41:20 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v4 19/21] i386: introduce kvm_hv_evmcs_available()
Date: Wed, 10 Feb 2021 17:40:31 +0100
Message-Id: <20210210164033.607612-20-vkuznets@redhat.com>
In-Reply-To: <20210210164033.607612-1-vkuznets@redhat.com>
References: <20210210164033.607612-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
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
index 7f175faa3abd..4e486f41a60a 100644
--- a/target/i386/kvm/kvm-stub.c
+++ b/target/i386/kvm/kvm-stub.c
@@ -44,3 +44,8 @@ void kvm_hyperv_expand_features(X86CPU *cpu, Error **errp)
 {
     return;
 }
+
+bool kvm_hv_evmcs_available(void)
+{
+    return false;
+}
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 480908b2463a..6c26b2091d4a 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -96,6 +96,7 @@ static bool has_msr_hv_crash;
 static bool has_msr_hv_reset;
 static bool has_msr_hv_vpindex;
 static bool hv_vpindex_settable;
+static bool hv_evmcs_available;
 static bool has_msr_hv_runtime;
 static bool has_msr_hv_synic;
 static bool has_msr_hv_stimer;
@@ -195,6 +196,11 @@ bool kvm_hv_vpindex_settable(void)
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
@@ -2235,6 +2241,8 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     has_pit_state2 = kvm_check_extension(s, KVM_CAP_PIT_STATE2);
 
     hv_vpindex_settable = kvm_check_extension(s, KVM_CAP_HYPERV_VP_INDEX);
+    hv_evmcs_available =
+        kvm_check_extension(s, KVM_CAP_HYPERV_ENLIGHTENED_VMCS);
 
     has_exception_payload = kvm_check_extension(s, KVM_CAP_EXCEPTION_PAYLOAD);
     if (has_exception_payload) {
diff --git a/target/i386/kvm/kvm_i386.h b/target/i386/kvm/kvm_i386.h
index f1176491051d..0fa00511be27 100644
--- a/target/i386/kvm/kvm_i386.h
+++ b/target/i386/kvm/kvm_i386.h
@@ -48,6 +48,7 @@ bool kvm_has_waitpkg(void);
 
 bool kvm_hv_vpindex_settable(void);
 void kvm_hyperv_expand_features(X86CPU *cpu, Error **errp);
+bool kvm_hv_evmcs_available(void);
 
 uint64_t kvm_swizzle_msi_ext_dest_id(uint64_t address);
 
-- 
2.29.2


