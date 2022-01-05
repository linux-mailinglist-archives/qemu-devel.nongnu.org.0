Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC96484FB3
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 10:02:29 +0100 (CET)
Received: from localhost ([::1]:42042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n52Bg-0001o8-3R
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 04:02:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1n527h-00005s-VO
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 03:58:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1n527e-00052A-S5
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 03:58:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641373095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZhPCOtb+4Hl3fi/XJXGATWF5e4ieMNjTya+qOj+THmY=;
 b=e+JbL0qTFd0gAWUgvxbRLl0N+W3zTrIWDeHHbzt7qCGloSu+gAGcBOPsyBHMtIzpbqwCev
 eTjNwvpSak59ADhs8ftFmaLkZcU72LuDeBCo3LiFbNLz/Xmgy8/pWQGcQ6oGVdp4nTlwYi
 j+UXsHTb/y5pEG0leOgelFr1cfVWCFI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-171-m14mP5D0N0Cd-pzOwbs78A-1; Wed, 05 Jan 2022 03:57:11 -0500
X-MC-Unique: m14mP5D0N0Cd-pzOwbs78A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF846190A7A0
 for <qemu-devel@nongnu.org>; Wed,  5 Jan 2022 08:57:10 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.40.194.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B47170D39;
 Wed,  5 Jan 2022 08:57:09 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] i386: Hyper-V Enlightened MSR bitmap feature
Date: Wed,  5 Jan 2022 09:57:04 +0100
Message-Id: <20220105085704.1267530-3-vkuznets@redhat.com>
In-Reply-To: <20220105085704.1267530-1-vkuznets@redhat.com>
References: <20220105085704.1267530-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The newly introduced enlightenment allow L0 (KVM) and L1 (Hyper-V)
hypervisors to collaborate to avoid unnecessary updates to L2
MSR-Bitmap upon vmexits.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 docs/hyperv.txt                | 10 ++++++++++
 target/i386/cpu.c              |  2 ++
 target/i386/cpu.h              |  1 +
 target/i386/kvm/hyperv-proto.h |  5 +++++
 target/i386/kvm/kvm.c          |  7 +++++++
 5 files changed, 25 insertions(+)

diff --git a/docs/hyperv.txt b/docs/hyperv.txt
index 0417c183a3b0..08429124a634 100644
--- a/docs/hyperv.txt
+++ b/docs/hyperv.txt
@@ -225,6 +225,16 @@ default (WS2016).
 Note: hv-version-id-* are not enlightenments and thus don't enable Hyper-V
 identification when specified without any other enlightenments.
 
+3.21. hv-emsr-bitmap
+=====================
+The enlightenment is nested specific, it targets Hyper-V on KVM guests. When
+enabled, it allows L0 (KVM) and L1 (Hyper-V) hypervisors to collaborate to
+avoid unnecessary updates to L2 MSR-Bitmap upon vmexits. While the protocol is
+supported for both VMX (Intel) and SVM (AMD), the VMX implementation requires
+Enlightened VMCS ('hv-evmcs') feature to also be enabled.
+
+Recommended: hv-evmcs (Intel)
+
 4. Supplementary features
 =========================
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index aa9e6368004c..f7405fdf4fa5 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6839,6 +6839,8 @@ static Property x86_cpu_properties[] = {
                       HYPERV_FEAT_STIMER_DIRECT, 0),
     DEFINE_PROP_BIT64("hv-avic", X86CPU, hyperv_features,
                       HYPERV_FEAT_AVIC, 0),
+    DEFINE_PROP_BIT64("hv-emsr-bitmap", X86CPU, hyperv_features,
+                      HYPERV_FEAT_MSR_BITMAP, 0),
     DEFINE_PROP_ON_OFF_AUTO("hv-no-nonarch-coresharing", X86CPU,
                             hyperv_no_nonarch_cs, ON_OFF_AUTO_OFF),
     DEFINE_PROP_BOOL("hv-passthrough", X86CPU, hyperv_passthrough, false),
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index a1165215d972..04e3b38abf25 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1060,6 +1060,7 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define HYPERV_FEAT_IPI                 13
 #define HYPERV_FEAT_STIMER_DIRECT       14
 #define HYPERV_FEAT_AVIC                15
+#define HYPERV_FEAT_MSR_BITMAP          16
 
 #ifndef HYPERV_SPINLOCK_NEVER_NOTIFY
 #define HYPERV_SPINLOCK_NEVER_NOTIFY             0xFFFFFFFF
diff --git a/target/i386/kvm/hyperv-proto.h b/target/i386/kvm/hyperv-proto.h
index 89f81afda7c6..38e25468122d 100644
--- a/target/i386/kvm/hyperv-proto.h
+++ b/target/i386/kvm/hyperv-proto.h
@@ -72,6 +72,11 @@
 #define HV_ENLIGHTENED_VMCS_RECOMMENDED     (1u << 14)
 #define HV_NO_NONARCH_CORESHARING           (1u << 18)
 
+/*
+ * HV_CPUID_NESTED_FEATURES.EAX bits
+ */
+#define HV_NESTED_MSR_BITMAP                (1u << 19)
+
 /*
  * Basic virtualized MSRs
  */
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index c8f4956a4e0e..2baa9609e181 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -933,6 +933,13 @@ static struct {
              .bits = HV_DEPRECATING_AEOI_RECOMMENDED}
         }
     },
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
2.33.1


