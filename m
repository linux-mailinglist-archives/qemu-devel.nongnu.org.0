Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC29F4200B1
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 10:12:19 +0200 (CEST)
Received: from localhost ([::1]:33612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWwba-0007eY-Rv
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 04:12:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9P-0003tq-DN
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:11 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:39884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9M-0000w2-Fp
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:10 -0400
Received: by mail-ed1-x52f.google.com with SMTP id x7so50489424edd.6
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 00:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yLqMqgJN/wHxsEfbXmoW7r8LgoKq8VIYgSuC7Xehijk=;
 b=Ijlw/BLADUteyvxYjC/LImngxPYV3neOFa2eTCnJ+5lm50pa33nRMYJ1tYnP5Caar2
 KHkNG+nWrm/6SfAioXEQuGHOEeJT7aXdgeD9YXOj98RQfmnZewO4oDvUUfv49JA+9Mzw
 xJDr6m63Jed9e03NMdS9ZapXgX2utaLW14SiW34q7VDS9ES629V8KCOUPXnzsals0G31
 4yOA/8n/pw9onbgANpMjnt4xlch7HYYid2O5fKKDZ15TYz17tegAiTz4pDDJeuQOOcS2
 tJrdaUEymp3lO6AOGr6M8eHm3iEAFpsQID+bB+oGzve9kYphzjriQjjawc2Krm9rd1OV
 arHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yLqMqgJN/wHxsEfbXmoW7r8LgoKq8VIYgSuC7Xehijk=;
 b=jQYSPBNlto6wX87icnKrOwspE/nB6/Eg3ARPhft2dSkkp0vvmS0wvWbmfEmfslYNAM
 7+O9tSReITDuyXIi3Cg/HO+MrT32+O0AIF/3idbnSnc7U1GwkSqaw9l7Qr7lcuvGZA1q
 0mwm4BUJDI+mYdi/WWQOXzsNUeVib66FRocCQxFDm/UmCIEGAQok1NC5idtEiGXoCtcz
 oKrFl3a8QTc7aT3NOwV5qcv79EbdvKTKtYtFYmtFP0ZCh25scDqCb+V5prK/5ob5g3VX
 tRQj8hcpWWPUgzQcuE6C7A+4oN0KVRZNIP19GYpJsqRVEAut07WmieqTkWqd1mOWNt5m
 UUSQ==
X-Gm-Message-State: AOAM531D4TvkvD9XCafZ9PuQNRby44yMs6e+0AXqwb7+Vyhesc42n5cs
 0HVL9PmiyZHp53L7gcBy956EmBAAR2c=
X-Google-Smtp-Source: ABdhPJyeb+ojWGEMRA4TyIDfxNa26u7O7mDXK74ZwksIBIKL+Jt0IYl9xcTXLDJBMYRLGiNbaF5wGA==
X-Received: by 2002:a17:906:5282:: with SMTP id
 c2mr9257299ejm.162.1633246987206; 
 Sun, 03 Oct 2021 00:43:07 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n6sm5560856eds.10.2021.10.03.00.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 00:43:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/30] i386: Implement pseudo 'hv-avic' ('hv-apicv')
 enlightenment
Date: Sun,  3 Oct 2021 09:42:40 +0200
Message-Id: <20211003074250.60869-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003074250.60869-1-pbonzini@redhat.com>
References: <20211003074250.60869-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vitaly Kuznetsov <vkuznets@redhat.com>

The enlightenment allows to use Hyper-V SynIC with hardware APICv/AVIC
enabled. Normally, Hyper-V SynIC disables these hardware features and
suggests the guest to use paravirtualized AutoEOI feature. Linux-4.15
gains support for conditional APICv/AVIC disablement, the feature
stays on until the guest tries to use AutoEOI feature with SynIC. With
'HV_DEPRECATING_AEOI_RECOMMENDED' bit exposed, modern enough Windows/
Hyper-V versions should follow the recommendation and not use the
(unwanted) feature.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Message-Id: <20210902093530.345756-7-vkuznets@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/hyperv.txt                | 10 +++++++++-
 target/i386/cpu.c              |  4 ++++
 target/i386/cpu.h              |  1 +
 target/i386/kvm/hyperv-proto.h |  1 +
 target/i386/kvm/kvm.c          | 10 +++++++++-
 5 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/docs/hyperv.txt b/docs/hyperv.txt
index 072709a68f..cd1ea3bbe9 100644
--- a/docs/hyperv.txt
+++ b/docs/hyperv.txt
@@ -189,7 +189,15 @@ enabled.
 
 Requires: hv-vpindex, hv-synic, hv-time, hv-stimer
 
-3.17. hv-no-nonarch-coresharing=on/off/auto
+3.18. hv-avic (hv-apicv)
+=======================
+The enlightenment allows to use Hyper-V SynIC with hardware APICv/AVIC enabled.
+Normally, Hyper-V SynIC disables these hardware feature and suggests the guest
+to use paravirtualized AutoEOI feature.
+Note: enabling this feature on old hardware (without APICv/AVIC support) may
+have negative effect on guest's performace.
+
+3.19. hv-no-nonarch-coresharing=on/off/auto
 ===========================================
 This enlightenment tells guest OS that virtual processors will never share a
 physical core unless they are reported as sibling SMT threads. This information
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 2a19eba56d..8154343cc4 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6644,6 +6644,8 @@ static void x86_cpu_initfn(Object *obj)
     object_property_add_alias(obj, "sse4_1", obj, "sse4.1");
     object_property_add_alias(obj, "sse4_2", obj, "sse4.2");
 
+    object_property_add_alias(obj, "hv-apicv", obj, "hv-avic");
+
     if (xcc->model) {
         x86_cpu_load_model(cpu, xcc->model);
     }
@@ -6831,6 +6833,8 @@ static Property x86_cpu_properties[] = {
                       HYPERV_FEAT_IPI, 0),
     DEFINE_PROP_BIT64("hv-stimer-direct", X86CPU, hyperv_features,
                       HYPERV_FEAT_STIMER_DIRECT, 0),
+    DEFINE_PROP_BIT64("hv-avic", X86CPU, hyperv_features,
+                      HYPERV_FEAT_AVIC, 0),
     DEFINE_PROP_ON_OFF_AUTO("hv-no-nonarch-coresharing", X86CPU,
                             hyperv_no_nonarch_cs, ON_OFF_AUTO_OFF),
     DEFINE_PROP_BOOL("hv-passthrough", X86CPU, hyperv_passthrough, false),
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 8a7209bbf2..65f0ee2caf 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1056,6 +1056,7 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define HYPERV_FEAT_EVMCS               12
 #define HYPERV_FEAT_IPI                 13
 #define HYPERV_FEAT_STIMER_DIRECT       14
+#define HYPERV_FEAT_AVIC                15
 
 #ifndef HYPERV_SPINLOCK_NEVER_NOTIFY
 #define HYPERV_SPINLOCK_NEVER_NOTIFY             0xFFFFFFFF
diff --git a/target/i386/kvm/hyperv-proto.h b/target/i386/kvm/hyperv-proto.h
index 5fbb385cc1..89f81afda7 100644
--- a/target/i386/kvm/hyperv-proto.h
+++ b/target/i386/kvm/hyperv-proto.h
@@ -66,6 +66,7 @@
 #define HV_APIC_ACCESS_RECOMMENDED          (1u << 3)
 #define HV_SYSTEM_RESET_RECOMMENDED         (1u << 4)
 #define HV_RELAXED_TIMING_RECOMMENDED       (1u << 5)
+#define HV_DEPRECATING_AEOI_RECOMMENDED     (1u << 9)
 #define HV_CLUSTER_IPI_RECOMMENDED          (1u << 10)
 #define HV_EX_PROCESSOR_MASKS_RECOMMENDED   (1u << 11)
 #define HV_ENLIGHTENED_VMCS_RECOMMENDED     (1u << 14)
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index a9a8f77df3..68faf72e34 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -924,6 +924,13 @@ static struct {
         },
         .dependencies = BIT(HYPERV_FEAT_STIMER)
     },
+    [HYPERV_FEAT_AVIC] = {
+        .desc = "AVIC/APICv support (hv-avic/hv-apicv)",
+        .flags = {
+            {.func = HV_CPUID_ENLIGHTMENT_INFO, .reg = R_EAX,
+             .bits = HV_DEPRECATING_AEOI_RECOMMENDED}
+        }
+    },
 };
 
 static struct kvm_cpuid2 *try_get_hv_cpuid(CPUState *cs, int max,
@@ -1373,7 +1380,8 @@ static int hyperv_fill_cpuids(CPUState *cs,
     c->eax = hv_build_cpuid_leaf(cs, HV_CPUID_ENLIGHTMENT_INFO, R_EAX);
     c->ebx = cpu->hyperv_spinlock_attempts;
 
-    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_VAPIC)) {
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_VAPIC) &&
+        !hyperv_feat_enabled(cpu, HYPERV_FEAT_AVIC)) {
         c->eax |= HV_APIC_ACCESS_RECOMMENDED;
     }
 
-- 
2.31.1



