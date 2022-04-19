Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0B15071C5
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 17:27:57 +0200 (CEST)
Received: from localhost ([::1]:39626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngplk-0001Ay-BI
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 11:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ngpfh-0001ZI-VB
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 11:21:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ngp9J-0008Ck-L0
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 10:48:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650379693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZeuD0ZSCC3AiT5xeIZSL9Fv64cGHP61Ote/17KsUy3o=;
 b=JXrX7y8Ngh+/birO8R7cq0jUJm8Yli3OnkxWVFspv7A5YuvKyeFExUGfwewIGAm2QNgKFn
 7L5S/8LQOEZx4TDeBKXFnQyYLzZVgZmuVONEX/s98eEN2YbHTOMMpM0ywNSa72j6iIXxjm
 qKIydmBmPf+XvNEPGt8N4n9LCnEwPdE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-gnI4bT2EM3K_cQ64tNyhYw-1; Tue, 19 Apr 2022 10:48:12 -0400
X-MC-Unique: gnI4bT2EM3K_cQ64tNyhYw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B817B1C01E8F
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 14:48:11 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.40.194.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C276640E80E0;
 Tue, 19 Apr 2022 14:48:10 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 5/5] i386: Hyper-V Direct TLB flush hypercall
Date: Tue, 19 Apr 2022 16:48:03 +0200
Message-Id: <20220419144803.1698337-6-vkuznets@redhat.com>
In-Reply-To: <20220419144803.1698337-1-vkuznets@redhat.com>
References: <20220419144803.1698337-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Marcelo Tosatti <mtosatti@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hyper-V TLFS allows for L0 and L1 hypervisors to collaborate on L2's
TLB flush hypercalls handling. With the correct setup, L2's TLB flush
hypercalls can be handled by L0 directly, without the need to exit to
L1.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 docs/hyperv.txt                | 11 +++++++++++
 target/i386/cpu.c              |  2 ++
 target/i386/cpu.h              |  1 +
 target/i386/kvm/hyperv-proto.h |  1 +
 target/i386/kvm/kvm.c          |  8 ++++++++
 5 files changed, 23 insertions(+)

diff --git a/docs/hyperv.txt b/docs/hyperv.txt
index acc411eb84cf..9553e5c03c6b 100644
--- a/docs/hyperv.txt
+++ b/docs/hyperv.txt
@@ -248,6 +248,17 @@ Allow for extended GVA ranges to be passed to Hyper-V TLB flush hypercalls
 
 Requires: hv-tlbflush
 
+3.24. hv-tlbflush-direct
+=========================
+The enlightenment is nested specific, it targets Hyper-V on KVM guests. When
+enabled, it allows L0 (KVM) to directly handle TLB flush hypercalls from L2
+guest without the need to exit to L1 (Hyper-V) hypervisor. While the feature is
+supported for both VMX (Intel) and SVM (AMD), the VMX implementation requires
+Enlightened VMCS ('hv-evmcs') feature to also be enabled.
+
+Requires: hv-vapic
+Recommended: hv-evmcs (Intel)
+
 4. Supplementary features
 =========================
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index f80db9a403bd..e8bbaf24d38d 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6931,6 +6931,8 @@ static Property x86_cpu_properties[] = {
                       HYPERV_FEAT_XMM_INPUT, 0),
     DEFINE_PROP_BIT64("hv-tlbflush-ext", X86CPU, hyperv_features,
                       HYPERV_FEAT_TLBFLUSH_EXT, 0),
+    DEFINE_PROP_BIT64("hv-tlbflush-direct", X86CPU, hyperv_features,
+                      HYPERV_FEAT_TLBFLUSH_DIRECT, 0),
     DEFINE_PROP_ON_OFF_AUTO("hv-no-nonarch-coresharing", X86CPU,
                             hyperv_no_nonarch_cs, ON_OFF_AUTO_OFF),
     DEFINE_PROP_BOOL("hv-passthrough", X86CPU, hyperv_passthrough, false),
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index ec96b0e7a4cb..2d17d52c00c1 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1087,6 +1087,7 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 #define HYPERV_FEAT_MSR_BITMAP          16
 #define HYPERV_FEAT_XMM_INPUT           17
 #define HYPERV_FEAT_TLBFLUSH_EXT        18
+#define HYPERV_FEAT_TLBFLUSH_DIRECT     19
 
 #ifndef HYPERV_SPINLOCK_NEVER_NOTIFY
 #define HYPERV_SPINLOCK_NEVER_NOTIFY             0xFFFFFFFF
diff --git a/target/i386/kvm/hyperv-proto.h b/target/i386/kvm/hyperv-proto.h
index b3f42ab92051..28d7759770e1 100644
--- a/target/i386/kvm/hyperv-proto.h
+++ b/target/i386/kvm/hyperv-proto.h
@@ -76,6 +76,7 @@
 /*
  * HV_CPUID_NESTED_FEATURES.EAX bits
  */
+#define HV_NESTED_DIRECT_FLUSH              (1u << 17)
 #define HV_NESTED_MSR_BITMAP                (1u << 19)
 
 /*
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 8a71de07f3c7..e966ab467b74 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -988,6 +988,14 @@ static struct {
         },
         .dependencies = BIT(HYPERV_FEAT_TLBFLUSH)
     },
+    [HYPERV_FEAT_TLBFLUSH_DIRECT] = {
+        .desc = "direct TLB flush (hv-tlbflush-direct)",
+        .flags = {
+            {.func = HV_CPUID_NESTED_FEATURES, .reg = R_EAX,
+             .bits = HV_NESTED_DIRECT_FLUSH}
+        },
+        .dependencies = BIT(HYPERV_FEAT_VAPIC)
+    },
 };
 
 static struct kvm_cpuid2 *try_get_hv_cpuid(CPUState *cs, int max,
-- 
2.35.1


