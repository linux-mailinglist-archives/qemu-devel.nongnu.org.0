Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BBE6161E5
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 12:43:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqC8O-0005DT-ET; Wed, 02 Nov 2022 07:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqC7s-00058s-3C
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 07:41:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqC7q-0005Bm-Gm
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 07:41:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667389299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QbtLKVZd0RBMCQcMwj1oY0O7eZja6HLh6zFQEYp3+Yg=;
 b=D91sZDAuXEdbKyIxv+48NopcIoDnqvn4z0m3fNs54RQPF2P/Ri4KxZsUgmhKM91EkceBfo
 Pw5iVeuzb1CBxJFoO5/thJEUnizDNrnoJkSSmtZHCTHj1iyIuTXrPiu8Iw/FLjF//cW21Y
 o/eGlpIBlbqtBFiJjB9CHSVuOz7f8Xs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-142-dddgdqDgNmesVIzfHHar6w-1; Wed, 02 Nov 2022 07:41:38 -0400
X-MC-Unique: dddgdqDgNmesVIzfHHar6w-1
Received: by mail-ed1-f70.google.com with SMTP id
 l18-20020a056402255200b004633509768bso6480699edb.12
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 04:41:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QbtLKVZd0RBMCQcMwj1oY0O7eZja6HLh6zFQEYp3+Yg=;
 b=4WxzLK/Y/+3nJmildatpCaOqa4g3Lvt/GRytowz47jC+ySAmaNPe0PN+1uWYiiUVJI
 SZJeYU/oJIgIo82IAcIYNarIbA7+GRPbNCueRG/zmNoQNKn/mUi/XMrYNxn9VaRUTeRu
 Ukb/dsFdC1+ErPejn2GyfO7elI0hMem2nYEPwYKNmopw1TPGRZ9tU+B4g+ePek10Em2e
 amls0GFhmBC4a8eQgKGRm9E+hyH4qqWQrtfBLeoJXbAspHwgU6aemaaSUwJbTziQ1SSc
 IxzXfp6mpfE6H0Qxev/CEdBIx0YkHU16miY1sDkDwiHqargn6FKd5YJUab0TkW4rSYPU
 hUEg==
X-Gm-Message-State: ACrzQf0tS0Kwai5LHQ6a5DcVzzK6UGmOPr68G4dU9KhBZxQRj+9qxRUQ
 B9k4Yml9UQpesiT20nbpa4vfWC9AQctrBjIcMc4zChR9Bne0pUISHs3r3Xlc05vOS2m6zlrzYbX
 eyJy5ecBKKDCV14vcUdfJ4WvzZzgz7Nc6aZiuLxznXAw72GkBqCy11zoQw/HMuvsR26g=
X-Received: by 2002:a17:907:6e9e:b0:78c:5533:4158 with SMTP id
 sh30-20020a1709076e9e00b0078c55334158mr21870582ejc.417.1667389296295; 
 Wed, 02 Nov 2022 04:41:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM449Cwch6rtuHuxwDLf1qvPyIUKs2DHXPr8o/562xVe6ATxsDxYbijUTCuHRTK79nKEyEhz/w==
X-Received: by 2002:a17:907:6e9e:b0:78c:5533:4158 with SMTP id
 sh30-20020a1709076e9e00b0078c55334158mr21870562ejc.417.1667389296007; 
 Wed, 02 Nov 2022 04:41:36 -0700 (PDT)
Received: from avogadro.local ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 ce24-20020a170906b25800b007a7f9b6318asm5331814ejb.50.2022.11.02.04.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 04:41:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Zeng Guang <guang.zeng@intel.com>, Peter Xu <peterx@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PULL 3/5] target/i386: Set maximum APIC ID to KVM prior to vCPU
 creation
Date: Wed,  2 Nov 2022 12:41:23 +0100
Message-Id: <20221102114125.58902-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221102114125.58902-1-pbonzini@redhat.com>
References: <20221102114125.58902-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Zeng Guang <guang.zeng@intel.com>

Specify maximum possible APIC ID assigned for current VM session to KVM
prior to the creation of vCPUs. By this setting, KVM can set up VM-scoped
data structure indexed by the APIC ID, e.g. Posted-Interrupt Descriptor
pointer table to support Intel IPI virtualization, with the most optimal
memory footprint.

It can be achieved by calling KVM_ENABLE_CAP for KVM_CAP_MAX_VCPU_ID
capability once KVM has enabled it. Ignoring the return error if KVM
doesn't support this capability yet.

Signed-off-by: Zeng Guang <guang.zeng@intel.com>
Acked-by: Peter Xu <peterx@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20220825025246.26618-1-guang.zeng@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/x86.c              | 4 ++++
 target/i386/kvm/kvm-stub.c | 5 +++++
 target/i386/kvm/kvm.c      | 5 +++++
 target/i386/kvm/kvm_i386.h | 2 ++
 4 files changed, 16 insertions(+)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index bd50a064a36d..78cc131926c8 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -140,6 +140,10 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
         exit(EXIT_FAILURE);
     }
 
+    if (kvm_enabled()) {
+        kvm_set_max_apic_id(x86ms->apic_id_limit);
+    }
+
     possible_cpus = mc->possible_cpu_arch_ids(ms);
     for (i = 0; i < ms->smp.cpus; i++) {
         x86_cpu_new(x86ms, possible_cpus->cpus[i].arch_id, &error_fatal);
diff --git a/target/i386/kvm/kvm-stub.c b/target/i386/kvm/kvm-stub.c
index f6e7e4466e1a..e052f1c7b0ef 100644
--- a/target/i386/kvm/kvm-stub.c
+++ b/target/i386/kvm/kvm-stub.c
@@ -44,3 +44,8 @@ bool kvm_hyperv_expand_features(X86CPU *cpu, Error **errp)
 {
     abort();
 }
+
+void kvm_set_max_apic_id(uint32_t max_apic_id)
+{
+    return;
+}
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 4df04280890a..a21320937943 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -5723,3 +5723,8 @@ void kvm_arch_accel_class_init(ObjectClass *oc)
                                           "Clock cycles without an event window "
                                           "after which a notification VM exit occurs");
 }
+
+void kvm_set_max_apic_id(uint32_t max_apic_id)
+{
+    kvm_vm_enable_cap(kvm_state, KVM_CAP_MAX_VCPU_ID, 0, max_apic_id);
+}
diff --git a/target/i386/kvm/kvm_i386.h b/target/i386/kvm/kvm_i386.h
index b7c38ba2c462..6a5c24e3dc40 100644
--- a/target/i386/kvm/kvm_i386.h
+++ b/target/i386/kvm/kvm_i386.h
@@ -66,4 +66,6 @@ typedef struct kvm_msr_handlers {
 bool kvm_filter_msr(KVMState *s, uint32_t msr, QEMURDMSRHandler *rdmsr,
                     QEMUWRMSRHandler *wrmsr);
 
+void kvm_set_max_apic_id(uint32_t max_apic_id);
+
 #endif
-- 
2.38.1


