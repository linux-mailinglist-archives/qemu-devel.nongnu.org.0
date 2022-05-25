Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDD2533C55
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 14:13:02 +0200 (CEST)
Received: from localhost ([::1]:60536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntpsY-0007CG-1Y
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 08:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ntpgJ-0004z4-DP
 for qemu-devel@nongnu.org; Wed, 25 May 2022 08:00:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ntpgD-0000ji-VT
 for qemu-devel@nongnu.org; Wed, 25 May 2022 08:00:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653479997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PBmk8xyMqqwJp4XxYZwJs9QxzTTw8WlaS0a/s3B2Brk=;
 b=HMr2LjQMi0ynv9fCMHH/gFqUvan5fT19gOruXilPqC+k2WbQ4dxigee5jshADUJUB89FV7
 +VuOmWl+RwfVKEFSRvdGiBI8wOj7GTajbyGit8vD2BSo3dkpIH+WAn0//ybHMpQXtCpouT
 1dblwylN8QLz9eediTV5VB85/gaDnOQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-Ns5k5mmNMj-5Yoz49NUPyg-1; Wed, 25 May 2022 07:59:56 -0400
X-MC-Unique: Ns5k5mmNMj-5Yoz49NUPyg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F316B858EED
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 11:59:55 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.40.194.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0845400DB3A;
 Wed, 25 May 2022 11:59:54 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>
Subject: [PATCH v4 3/6] i386: Hyper-V XMM fast hypercall input feature
Date: Wed, 25 May 2022 13:59:46 +0200
Message-Id: <20220525115949.1294004-4-vkuznets@redhat.com>
In-Reply-To: <20220525115949.1294004-1-vkuznets@redhat.com>
References: <20220525115949.1294004-1-vkuznets@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hyper-V specification allows to pass parameters for certain hypercalls
using XMM registers ("XMM Fast Hypercall Input"). When the feature is
in use, it allows for faster hypercalls processing as KVM can avoid
reading guest's memory.

KVM supports the feature since v5.14.

Rename HV_HYPERCALL_{PARAMS_XMM_AVAILABLE -> XMM_INPUT_AVAILABLE} to
comply with KVM.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 docs/hyperv.txt                | 6 ++++++
 target/i386/cpu.c              | 2 ++
 target/i386/cpu.h              | 1 +
 target/i386/kvm/hyperv-proto.h | 2 +-
 target/i386/kvm/kvm.c          | 7 +++++++
 5 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/docs/hyperv.txt b/docs/hyperv.txt
index 5d85569b9941..af1b10c0b3d1 100644
--- a/docs/hyperv.txt
+++ b/docs/hyperv.txt
@@ -249,6 +249,12 @@ Enlightened VMCS ('hv-evmcs') feature to also be enabled.
 
 Recommended: hv-evmcs (Intel)
 
+3.23. hv-xmm-input
+===================
+Hyper-V specification allows to pass parameters for certain hypercalls using XMM
+registers ("XMM Fast Hypercall Input"). When the feature is in use, it allows
+for faster hypercalls processing as KVM can avoid reading guest's memory.
+
 4. Supplementary features
 =========================
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 5aabf0c12e8d..cb86c11f71d4 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6962,6 +6962,8 @@ static Property x86_cpu_properties[] = {
                       HYPERV_FEAT_AVIC, 0),
     DEFINE_PROP_BIT64("hv-emsr-bitmap", X86CPU, hyperv_features,
                       HYPERV_FEAT_MSR_BITMAP, 0),
+    DEFINE_PROP_BIT64("hv-xmm-input", X86CPU, hyperv_features,
+                      HYPERV_FEAT_XMM_INPUT, 0),
     DEFINE_PROP_ON_OFF_AUTO("hv-no-nonarch-coresharing", X86CPU,
                             hyperv_no_nonarch_cs, ON_OFF_AUTO_OFF),
     DEFINE_PROP_BIT64("hv-syndbg", X86CPU, hyperv_features,
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index c7882857366d..37e95535843b 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1107,6 +1107,7 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 #define HYPERV_FEAT_AVIC                15
 #define HYPERV_FEAT_SYNDBG              16
 #define HYPERV_FEAT_MSR_BITMAP          17
+#define HYPERV_FEAT_XMM_INPUT           18
 
 #ifndef HYPERV_SPINLOCK_NEVER_NOTIFY
 #define HYPERV_SPINLOCK_NEVER_NOTIFY             0xFFFFFFFF
diff --git a/target/i386/kvm/hyperv-proto.h b/target/i386/kvm/hyperv-proto.h
index cea18dbc0e23..f5f16474fa25 100644
--- a/target/i386/kvm/hyperv-proto.h
+++ b/target/i386/kvm/hyperv-proto.h
@@ -54,7 +54,7 @@
 #define HV_GUEST_DEBUGGING_AVAILABLE            (1u << 1)
 #define HV_PERF_MONITOR_AVAILABLE               (1u << 2)
 #define HV_CPU_DYNAMIC_PARTITIONING_AVAILABLE   (1u << 3)
-#define HV_HYPERCALL_PARAMS_XMM_AVAILABLE       (1u << 4)
+#define HV_HYPERCALL_XMM_INPUT_AVAILABLE        (1u << 4)
 #define HV_GUEST_IDLE_STATE_AVAILABLE           (1u << 5)
 #define HV_FREQUENCY_MSRS_AVAILABLE             (1u << 8)
 #define HV_GUEST_CRASH_MSR_AVAILABLE            (1u << 10)
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 82d1f0275c42..96d6c50ad5d9 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -980,6 +980,13 @@ static struct {
              .bits = HV_NESTED_MSR_BITMAP}
         }
     },
+    [HYPERV_FEAT_XMM_INPUT] = {
+        .desc = "XMM fast hypercall input (hv-xmm-input)",
+        .flags = {
+            {.func = HV_CPUID_FEATURES, .reg = R_EDX,
+             .bits = HV_HYPERCALL_XMM_INPUT_AVAILABLE}
+        }
+    },
 };
 
 static struct kvm_cpuid2 *try_get_hv_cpuid(CPUState *cs, int max,
-- 
2.35.3


