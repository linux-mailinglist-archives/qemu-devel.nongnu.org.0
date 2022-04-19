Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2465071E2
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 17:34:57 +0200 (CEST)
Received: from localhost ([::1]:53742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngpsW-0002Rt-UX
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 11:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ngpfp-0002EH-Dv
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 11:21:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ngp9K-0008Cw-Io
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 10:48:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650379694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XMy6K4m6kgkexhxmXxfUl/IiZbgc4Y0yOJ1aLOT88Pk=;
 b=ExrLtyBN5A5cQyC3UE6mdp7Qi+5YXfyljw5mPSgJytKzCOK1z8dsrZjhliGz5VSSFEnTty
 ta+kkKamRbushWRKb+TG15Nj7YlN3tTOLSu/I59NBHyQL6wIB2kiQwFJZEyTdr5+OOpwRm
 SjTGPgysdX1bx5liwLyMDZHsmBX+710=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-XY8ntmuEPVuEE6_NUwZUew-1; Tue, 19 Apr 2022 10:48:10 -0400
X-MC-Unique: XY8ntmuEPVuEE6_NUwZUew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85FB7833960
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 14:48:10 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.40.194.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE90B40E80E0;
 Tue, 19 Apr 2022 14:48:09 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 4/5] i386: Hyper-V Support extended GVA ranges for TLB
 flush hypercalls
Date: Tue, 19 Apr 2022 16:48:02 +0200
Message-Id: <20220419144803.1698337-5-vkuznets@redhat.com>
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
index 857268d37d61..acc411eb84cf 100644
--- a/docs/hyperv.txt
+++ b/docs/hyperv.txt
@@ -241,6 +241,13 @@ Hyper-V specification allows to pass parameters for certain hypercalls using XMM
 registers ("XMM Fast Hypercall Input"). When the feature is in use, it allows
 for faster hypercalls processing as KVM can avoid reading guest's memory.
 
+3.23. hv-tlbflush-ext
+=====================
+Allow for extended GVA ranges to be passed to Hyper-V TLB flush hypercalls
+(HvFlushVirtualAddressList/HvFlushVirtualAddressListEx).
+
+Requires: hv-tlbflush
+
 4. Supplementary features
 =========================
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index c4be8ffe7988..f80db9a403bd 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6929,6 +6929,8 @@ static Property x86_cpu_properties[] = {
                       HYPERV_FEAT_MSR_BITMAP, 0),
     DEFINE_PROP_BIT64("hv-xmm-input", X86CPU, hyperv_features,
                       HYPERV_FEAT_XMM_INPUT, 0),
+    DEFINE_PROP_BIT64("hv-tlbflush-ext", X86CPU, hyperv_features,
+                      HYPERV_FEAT_TLBFLUSH_EXT, 0),
     DEFINE_PROP_ON_OFF_AUTO("hv-no-nonarch-coresharing", X86CPU,
                             hyperv_no_nonarch_cs, ON_OFF_AUTO_OFF),
     DEFINE_PROP_BOOL("hv-passthrough", X86CPU, hyperv_passthrough, false),
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index ea561e18f934..ec96b0e7a4cb 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1086,6 +1086,7 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 #define HYPERV_FEAT_AVIC                15
 #define HYPERV_FEAT_MSR_BITMAP          16
 #define HYPERV_FEAT_XMM_INPUT           17
+#define HYPERV_FEAT_TLBFLUSH_EXT        18
 
 #ifndef HYPERV_SPINLOCK_NEVER_NOTIFY
 #define HYPERV_SPINLOCK_NEVER_NOTIFY             0xFFFFFFFF
diff --git a/target/i386/kvm/hyperv-proto.h b/target/i386/kvm/hyperv-proto.h
index 74d91adb7a16..b3f42ab92051 100644
--- a/target/i386/kvm/hyperv-proto.h
+++ b/target/i386/kvm/hyperv-proto.h
@@ -55,6 +55,7 @@
 #define HV_GUEST_IDLE_STATE_AVAILABLE           (1u << 5)
 #define HV_FREQUENCY_MSRS_AVAILABLE             (1u << 8)
 #define HV_GUEST_CRASH_MSR_AVAILABLE            (1u << 10)
+#define HV_EXT_GVA_RANGES_FLUSH_AVAILABLE       (1u << 14)
 #define HV_STIMER_DIRECT_MODE_AVAILABLE         (1u << 19)
 
 /*
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 7f752ef4376a..8a71de07f3c7 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -980,6 +980,14 @@ static struct {
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
2.35.1


