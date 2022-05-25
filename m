Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5BC533C54
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 14:12:55 +0200 (CEST)
Received: from localhost ([::1]:60238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntpsQ-0006tZ-3M
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 08:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ntpgL-00051E-0D
 for qemu-devel@nongnu.org; Wed, 25 May 2022 08:00:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ntpgI-0000jo-Vl
 for qemu-devel@nongnu.org; Wed, 25 May 2022 08:00:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653479999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2dqivw9mvMBBu11fC6hqiOvz7iZ/NUDFCtzB2JrxB5Q=;
 b=VAfhyW3hMBfiEbkYegL1IDGrmAP/CR2GsL61QfSeuT8LPqrJaguOUuC+gLdt9lEq6Y5YJK
 olpZiS7mQyWrf+OrjW2Ly8HWx6wPvVJbqqkMfV4EY0J53e0AsDwH7qFwnZjFn26dqWStjo
 caUu8EYlHAjG2zyxcDy1jf54R7JL62k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-dqi1terFMLyaJhi7GTP8nA-1; Wed, 25 May 2022 07:59:57 -0400
X-MC-Unique: dqi1terFMLyaJhi7GTP8nA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C8AB1D3236A
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 11:59:57 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.40.194.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F2B440CF8EF;
 Wed, 25 May 2022 11:59:56 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>
Subject: [PATCH v4 4/6] i386: Hyper-V Support extended GVA ranges for TLB
 flush hypercalls
Date: Wed, 25 May 2022 13:59:47 +0200
Message-Id: <20220525115949.1294004-5-vkuznets@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

KVM kind of supported "extended GVA ranges" (up to 4095 additional GFNs
per hypercall) since the implementation of Hyper-V PV TLB flush feature
(Linux-4.18) as regardless of the request, full TLB flush was always
performed. "Extended GVA ranges for TLB flush hypercalls" feature bit
wasn't exposed then. Now, as KVM gains support for fine-grained TLB
flush handling, exposing this feature starts making sense.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 docs/hyperv.txt                | 7 +++++++
 target/i386/cpu.c              | 2 ++
 target/i386/cpu.h              | 1 +
 target/i386/kvm/hyperv-proto.h | 1 +
 target/i386/kvm/kvm.c          | 8 ++++++++
 5 files changed, 19 insertions(+)

diff --git a/docs/hyperv.txt b/docs/hyperv.txt
index af1b10c0b3d1..4b132b1c941a 100644
--- a/docs/hyperv.txt
+++ b/docs/hyperv.txt
@@ -255,6 +255,13 @@ Hyper-V specification allows to pass parameters for certain hypercalls using XMM
 registers ("XMM Fast Hypercall Input"). When the feature is in use, it allows
 for faster hypercalls processing as KVM can avoid reading guest's memory.
 
+3.24. hv-tlbflush-ext
+=====================
+Allow for extended GVA ranges to be passed to Hyper-V TLB flush hypercalls
+(HvFlushVirtualAddressList/HvFlushVirtualAddressListEx).
+
+Requires: hv-tlbflush
+
 4. Supplementary features
 =========================
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index cb86c11f71d4..a5331e6140fc 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6964,6 +6964,8 @@ static Property x86_cpu_properties[] = {
                       HYPERV_FEAT_MSR_BITMAP, 0),
     DEFINE_PROP_BIT64("hv-xmm-input", X86CPU, hyperv_features,
                       HYPERV_FEAT_XMM_INPUT, 0),
+    DEFINE_PROP_BIT64("hv-tlbflush-ext", X86CPU, hyperv_features,
+                      HYPERV_FEAT_TLBFLUSH_EXT, 0),
     DEFINE_PROP_ON_OFF_AUTO("hv-no-nonarch-coresharing", X86CPU,
                             hyperv_no_nonarch_cs, ON_OFF_AUTO_OFF),
     DEFINE_PROP_BIT64("hv-syndbg", X86CPU, hyperv_features,
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 37e95535843b..5ff48257e513 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1108,6 +1108,7 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 #define HYPERV_FEAT_SYNDBG              16
 #define HYPERV_FEAT_MSR_BITMAP          17
 #define HYPERV_FEAT_XMM_INPUT           18
+#define HYPERV_FEAT_TLBFLUSH_EXT        19
 
 #ifndef HYPERV_SPINLOCK_NEVER_NOTIFY
 #define HYPERV_SPINLOCK_NEVER_NOTIFY             0xFFFFFFFF
diff --git a/target/i386/kvm/hyperv-proto.h b/target/i386/kvm/hyperv-proto.h
index f5f16474fa25..c7854ed6d306 100644
--- a/target/i386/kvm/hyperv-proto.h
+++ b/target/i386/kvm/hyperv-proto.h
@@ -59,6 +59,7 @@
 #define HV_FREQUENCY_MSRS_AVAILABLE             (1u << 8)
 #define HV_GUEST_CRASH_MSR_AVAILABLE            (1u << 10)
 #define HV_FEATURE_DEBUG_MSRS_AVAILABLE         (1u << 11)
+#define HV_EXT_GVA_RANGES_FLUSH_AVAILABLE       (1u << 14)
 #define HV_STIMER_DIRECT_MODE_AVAILABLE         (1u << 19)
 
 /*
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 96d6c50ad5d9..7bd1b4396e8e 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -987,6 +987,14 @@ static struct {
              .bits = HV_HYPERCALL_XMM_INPUT_AVAILABLE}
         }
     },
+    [HYPERV_FEAT_TLBFLUSH_EXT] = {
+        .desc = "Extended gva ranges for TLB flush hypercalls (hv-tlbflush-ext)",
+        .flags = {
+            {.func = HV_CPUID_FEATURES, .reg = R_EDX,
+             .bits = HV_EXT_GVA_RANGES_FLUSH_AVAILABLE}
+        },
+        .dependencies = BIT(HYPERV_FEAT_TLBFLUSH)
+    },
 };
 
 static struct kvm_cpuid2 *try_get_hv_cpuid(CPUState *cs, int max,
-- 
2.35.3


