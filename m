Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F2D533C3D
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 14:07:31 +0200 (CEST)
Received: from localhost ([::1]:51842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntpnB-0007yY-Uh
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 08:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ntpgF-0004x4-BY
 for qemu-devel@nongnu.org; Wed, 25 May 2022 07:59:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ntpgD-0000ja-NL
 for qemu-devel@nongnu.org; Wed, 25 May 2022 07:59:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653479995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CiMvOyIxBm73NtAT8j9CPiFE0748/R4EBpiDYPB7Iks=;
 b=Tj/DgV3Mr38zlhr2q06C5OqCTc+kOUGNIyskxHJH9SK/VgNWuQy4fF63wEdBl+sZ+1mmjM
 RUjr8vJdI4cSPUj8gPBl5I5DFbJW3N/j3777+YtjH8E2iHdIPSWb1yNWfpVCt+AwcjTATc
 btUrZWRZhoXzmCzdEDOoDLSsO/pErRg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-c1xGTiakP6GE9TgufFkYVg-1; Wed, 25 May 2022 07:59:54 -0400
X-MC-Unique: c1xGTiakP6GE9TgufFkYVg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7061729DD995
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 11:59:54 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.40.194.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D7C140CF8EF;
 Wed, 25 May 2022 11:59:53 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>
Subject: [PATCH v4 2/6] i386: Hyper-V Enlightened MSR bitmap feature
Date: Wed, 25 May 2022 13:59:45 +0200
Message-Id: <20220525115949.1294004-3-vkuznets@redhat.com>
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

The newly introduced enlightenment allow L0 (KVM) and L1 (Hyper-V)
hypervisors to collaborate to avoid unnecessary updates to L2
MSR-Bitmap upon vmexits.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 docs/hyperv.txt                | 9 +++++++++
 target/i386/cpu.c              | 2 ++
 target/i386/cpu.h              | 1 +
 target/i386/kvm/hyperv-proto.h | 5 +++++
 target/i386/kvm/kvm.c          | 7 +++++++
 5 files changed, 24 insertions(+)

diff --git a/docs/hyperv.txt b/docs/hyperv.txt
index 33588a03961f..5d85569b9941 100644
--- a/docs/hyperv.txt
+++ b/docs/hyperv.txt
@@ -239,6 +239,15 @@ This enlightenment requires a VMBus device (-device vmbus-bridge,irq=15)
 and the follow enlightenments to work:
 hv-relaxed,hv_time,hv-vapic,hv-vpindex,hv-synic,hv-runtime,hv-stimer
 
+3.22. hv-emsr-bitmap
+=====================
+The enlightenment is nested specific, it targets Hyper-V on KVM guests. When
+enabled, it allows L0 (KVM) and L1 (Hyper-V) hypervisors to collaborate to
+avoid unnecessary updates to L2 MSR-Bitmap upon vmexits. While the protocol is
+supported for both VMX (Intel) and SVM (AMD), the VMX implementation requires
+Enlightened VMCS ('hv-evmcs') feature to also be enabled.
+
+Recommended: hv-evmcs (Intel)
 
 4. Supplementary features
 =========================
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 35c3475e6c90..5aabf0c12e8d 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6960,6 +6960,8 @@ static Property x86_cpu_properties[] = {
                       HYPERV_FEAT_STIMER_DIRECT, 0),
     DEFINE_PROP_BIT64("hv-avic", X86CPU, hyperv_features,
                       HYPERV_FEAT_AVIC, 0),
+    DEFINE_PROP_BIT64("hv-emsr-bitmap", X86CPU, hyperv_features,
+                      HYPERV_FEAT_MSR_BITMAP, 0),
     DEFINE_PROP_ON_OFF_AUTO("hv-no-nonarch-coresharing", X86CPU,
                             hyperv_no_nonarch_cs, ON_OFF_AUTO_OFF),
     DEFINE_PROP_BIT64("hv-syndbg", X86CPU, hyperv_features,
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 2e918daf6bef..c7882857366d 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1106,6 +1106,7 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 #define HYPERV_FEAT_STIMER_DIRECT       14
 #define HYPERV_FEAT_AVIC                15
 #define HYPERV_FEAT_SYNDBG              16
+#define HYPERV_FEAT_MSR_BITMAP          17
 
 #ifndef HYPERV_SPINLOCK_NEVER_NOTIFY
 #define HYPERV_SPINLOCK_NEVER_NOTIFY             0xFFFFFFFF
diff --git a/target/i386/kvm/hyperv-proto.h b/target/i386/kvm/hyperv-proto.h
index e40e59411c83..cea18dbc0e23 100644
--- a/target/i386/kvm/hyperv-proto.h
+++ b/target/i386/kvm/hyperv-proto.h
@@ -86,6 +86,11 @@
  */
 #define HV_SYNDBG_CAP_ALLOW_KERNEL_DEBUGGING    (1u << 1)
 
+/*
+ * HV_CPUID_NESTED_FEATURES.EAX bits
+ */
+#define HV_NESTED_MSR_BITMAP                (1u << 19)
+
 /*
  * Basic virtualized MSRs
  */
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 93bfefa4a79e..82d1f0275c42 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -973,6 +973,13 @@ static struct {
         .dependencies = BIT(HYPERV_FEAT_SYNIC) | BIT(HYPERV_FEAT_RELAXED)
     },
 #endif
+    [HYPERV_FEAT_MSR_BITMAP] = {
+        .desc = "enlightened MSR-Bitmap (hv-emsr-bitmap)",
+        .flags = {
+            {.func = HV_CPUID_NESTED_FEATURES, .reg = R_EAX,
+             .bits = HV_NESTED_MSR_BITMAP}
+        }
+    },
 };
 
 static struct kvm_cpuid2 *try_get_hv_cpuid(CPUState *cs, int max,
-- 
2.35.3


