Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2031533C80
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 14:17:48 +0200 (CEST)
Received: from localhost ([::1]:39240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntpx9-0003hV-2T
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 08:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ntpgR-00055o-NJ
 for qemu-devel@nongnu.org; Wed, 25 May 2022 08:00:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ntpgJ-0000k0-4F
 for qemu-devel@nongnu.org; Wed, 25 May 2022 08:00:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653480000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ml1uEl1X5c8WJhxk/ne1a4iYO1dkt4sj+6xGGfjDmlw=;
 b=CoknN84apO2RGhnT9NpvCvGybdtHJwfY9hgfQYKjvdoh6sONWQSfBhBgDiV/+5EDPhgmzu
 x551z1mzllKSY+tbEv9P3qRGKCUVPr2GwioJMBLCK1e8leI5cDmBsVoOoSqigRnFH2TeRt
 fxyCKHmugrLPYHOEqDoepF3p0Uh85Po=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-tDRie9HsM8iX4jFuay8lzg-1; Wed, 25 May 2022 07:59:59 -0400
X-MC-Unique: tDRie9HsM8iX4jFuay8lzg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F6C8811E75
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 11:59:59 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.40.194.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E289540CF8EF;
 Wed, 25 May 2022 11:59:57 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>
Subject: [PATCH v4 5/6] i386: Hyper-V Direct TLB flush hypercall
Date: Wed, 25 May 2022 13:59:48 +0200
Message-Id: <20220525115949.1294004-6-vkuznets@redhat.com>
In-Reply-To: <20220525115949.1294004-1-vkuznets@redhat.com>
References: <20220525115949.1294004-1-vkuznets@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
index 4b132b1c941a..14a7f449ead9 100644
--- a/docs/hyperv.txt
+++ b/docs/hyperv.txt
@@ -262,6 +262,17 @@ Allow for extended GVA ranges to be passed to Hyper-V TLB flush hypercalls
 
 Requires: hv-tlbflush
 
+3.25. hv-tlbflush-direct
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
index a5331e6140fc..dfbf5a65f92f 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6966,6 +6966,8 @@ static Property x86_cpu_properties[] = {
                       HYPERV_FEAT_XMM_INPUT, 0),
     DEFINE_PROP_BIT64("hv-tlbflush-ext", X86CPU, hyperv_features,
                       HYPERV_FEAT_TLBFLUSH_EXT, 0),
+    DEFINE_PROP_BIT64("hv-tlbflush-direct", X86CPU, hyperv_features,
+                      HYPERV_FEAT_TLBFLUSH_DIRECT, 0),
     DEFINE_PROP_ON_OFF_AUTO("hv-no-nonarch-coresharing", X86CPU,
                             hyperv_no_nonarch_cs, ON_OFF_AUTO_OFF),
     DEFINE_PROP_BIT64("hv-syndbg", X86CPU, hyperv_features,
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 5ff48257e513..82004b65b944 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1109,6 +1109,7 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 #define HYPERV_FEAT_MSR_BITMAP          17
 #define HYPERV_FEAT_XMM_INPUT           18
 #define HYPERV_FEAT_TLBFLUSH_EXT        19
+#define HYPERV_FEAT_TLBFLUSH_DIRECT     20
 
 #ifndef HYPERV_SPINLOCK_NEVER_NOTIFY
 #define HYPERV_SPINLOCK_NEVER_NOTIFY             0xFFFFFFFF
diff --git a/target/i386/kvm/hyperv-proto.h b/target/i386/kvm/hyperv-proto.h
index c7854ed6d306..464fbf09e35a 100644
--- a/target/i386/kvm/hyperv-proto.h
+++ b/target/i386/kvm/hyperv-proto.h
@@ -90,6 +90,7 @@
 /*
  * HV_CPUID_NESTED_FEATURES.EAX bits
  */
+#define HV_NESTED_DIRECT_FLUSH              (1u << 17)
 #define HV_NESTED_MSR_BITMAP                (1u << 19)
 
 /*
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 7bd1b4396e8e..8b58bfd0fd4a 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -995,6 +995,14 @@ static struct {
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
2.35.3


