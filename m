Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A23EA4BA483
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 16:38:11 +0100 (CET)
Received: from localhost ([::1]:42874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKirC-0007AM-DR
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 10:38:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1nKhnI-0001Zh-6k
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 09:30:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1nKhnG-0000i4-Dg
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 09:30:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645108201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uyJ1XaiHU9zZLZzBkPbvTXeCsTJuK8cz5xTDH2PFO2c=;
 b=iqvAu7yPXLXMPY5O0UuV/wVknYn7+9gXy/2p6kZiD2a63EykBk/fU4maHpGkxQJqIMNKFo
 YJJg5+YPny7RzCxERes2/g8789xbdZfH9A3wCfXe1dnXoR9ROq7/d4SnivxBHBSrzH+6NA
 B/yeJL5bTavsP7kmeysU/Oz7yeCzD9c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-79aU66bLPmmOCUGeEmhKZg-1; Thu, 17 Feb 2022 09:29:58 -0500
X-MC-Unique: 79aU66bLPmmOCUGeEmhKZg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA67A801ADB
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 14:29:57 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.40.193.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75E8C7D717;
 Thu, 17 Feb 2022 14:29:56 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] i386: Hyper-V XMM fast hypercall input feature
Date: Thu, 17 Feb 2022 15:29:49 +0100
Message-Id: <20220217142949.297454-4-vkuznets@redhat.com>
In-Reply-To: <20220217142949.297454-1-vkuznets@redhat.com>
References: <20220217142949.297454-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
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
index 08429124a634..857268d37d61 100644
--- a/docs/hyperv.txt
+++ b/docs/hyperv.txt
@@ -235,6 +235,12 @@ Enlightened VMCS ('hv-evmcs') feature to also be enabled.
 
 Recommended: hv-evmcs (Intel)
 
+3.22. hv-xmm-input
+===================
+Hyper-V specification allows to pass parameters for certain hypercalls using XMM
+registers ("XMM Fast Hypercall Input"). When the feature is in use, it allows
+for faster hypercalls processing as KVM can avoid reading guest's memory.
+
 4. Supplementary features
 =========================
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index f7405fdf4fa5..0b171db1d046 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6841,6 +6841,8 @@ static Property x86_cpu_properties[] = {
                       HYPERV_FEAT_AVIC, 0),
     DEFINE_PROP_BIT64("hv-emsr-bitmap", X86CPU, hyperv_features,
                       HYPERV_FEAT_MSR_BITMAP, 0),
+    DEFINE_PROP_BIT64("hv-xmm-input", X86CPU, hyperv_features,
+                      HYPERV_FEAT_XMM_INPUT, 0),
     DEFINE_PROP_ON_OFF_AUTO("hv-no-nonarch-coresharing", X86CPU,
                             hyperv_no_nonarch_cs, ON_OFF_AUTO_OFF),
     DEFINE_PROP_BOOL("hv-passthrough", X86CPU, hyperv_passthrough, false),
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d6ae9e60a9a0..da251d165d13 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1061,6 +1061,7 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define HYPERV_FEAT_STIMER_DIRECT       14
 #define HYPERV_FEAT_AVIC                15
 #define HYPERV_FEAT_MSR_BITMAP          16
+#define HYPERV_FEAT_XMM_INPUT           17
 
 #ifndef HYPERV_SPINLOCK_NEVER_NOTIFY
 #define HYPERV_SPINLOCK_NEVER_NOTIFY             0xFFFFFFFF
diff --git a/target/i386/kvm/hyperv-proto.h b/target/i386/kvm/hyperv-proto.h
index 38e25468122d..74d91adb7a16 100644
--- a/target/i386/kvm/hyperv-proto.h
+++ b/target/i386/kvm/hyperv-proto.h
@@ -51,7 +51,7 @@
 #define HV_GUEST_DEBUGGING_AVAILABLE            (1u << 1)
 #define HV_PERF_MONITOR_AVAILABLE               (1u << 2)
 #define HV_CPU_DYNAMIC_PARTITIONING_AVAILABLE   (1u << 3)
-#define HV_HYPERCALL_PARAMS_XMM_AVAILABLE       (1u << 4)
+#define HV_HYPERCALL_XMM_INPUT_AVAILABLE        (1u << 4)
 #define HV_GUEST_IDLE_STATE_AVAILABLE           (1u << 5)
 #define HV_FREQUENCY_MSRS_AVAILABLE             (1u << 8)
 #define HV_GUEST_CRASH_MSR_AVAILABLE            (1u << 10)
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index f719ef3f8384..8279b116fac6 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -941,6 +941,13 @@ static struct {
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
2.35.1


