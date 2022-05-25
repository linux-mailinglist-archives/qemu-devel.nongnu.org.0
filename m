Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE64F534468
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 21:42:21 +0200 (CEST)
Received: from localhost ([::1]:35442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntwtg-0005Fn-RN
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 15:42:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntwhQ-000634-QH
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:29:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntwhO-0003ss-9J
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:29:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653506977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HL2VaOZYrg2xIPskTQpaLR0aHr3OzfHOd1xRp891uVc=;
 b=MG7ZgVEUVmWZWizl0y4jTKAUCnZgRXX3c2VEvU5Rw7dTf8wjAPmTtYBQ4q236SBcc/vR+F
 wck6Mb/IfGG6O7JfSMXG+kAbDB/HdCN6uV9IE3gMoBsWh61nOCKl3+2kaBXhPHF+IaSNip
 bN2ybL4KxpsDcl8YNYD+eU8BgDSX7Qc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-186-sa68kAzkMrOeuGpCndLEkg-1; Wed, 25 May 2022 15:29:35 -0400
X-MC-Unique: sa68kAzkMrOeuGpCndLEkg-1
Received: by mail-ed1-f72.google.com with SMTP id
 u1-20020aa7d981000000b0042acd1f2253so15455627eds.4
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 12:29:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HL2VaOZYrg2xIPskTQpaLR0aHr3OzfHOd1xRp891uVc=;
 b=zZ/lMVxgcx+w0j5h1jjZYanDUc0nj+l7EjPtfZzUN0EoyFMgtdI1K7YP+wt66iVM/h
 11g8nORadxN8IqxILzH/7oZv60zgXvFEkrzglMWLjtBGrBGKMDDOzzNfKoAtXUWGU3GT
 WXy9QmBtu0W/YMYF6kO3VLjuTqok0OO3watV+RQXYmOO5O/cyhDv0H0Va/K7TFsH5KcS
 pkic8FLfa1UWKMYMnZ2fLuTqDJUdfQ670TqHsYsF/YfXTsTG5PXSCK+A8BgITEBKDqJg
 hap419wTs0jhU8AEWaGG0zyTXalz8WSZdxbtYFKz9eCqNZ10Dbx4hfD+MLCf9wRahyDa
 1pgw==
X-Gm-Message-State: AOAM531cHdeKKCyPwC5MZOuA1wJZfhdbsK3NehIIsWmpQXHrAIKdbrjZ
 EgJLgouymo8oMbKN1FRlZ9WQMCI6u5Q+S/3H70DPtWwWkz/4YLT/tz9I+amV1Not+Nhx86t+xAN
 H8b0/ANQs4qdniuGxr9CNtMCyB604Z+69ocxtaEoqZ604NiJ8HNvPFsyehLcHaInit6M=
X-Received: by 2002:a05:6402:1910:b0:42b:5046:7f88 with SMTP id
 e16-20020a056402191000b0042b50467f88mr21672911edz.319.1653506973253; 
 Wed, 25 May 2022 12:29:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwREZtYiamBmN5xxxBLU5QCU8azYrY+w04eyAn1uWNw95C5dekB9rv+RwZMsNC4LJpNSfk/pw==
X-Received: by 2002:a05:6402:1910:b0:42b:5046:7f88 with SMTP id
 e16-20020a056402191000b0042b50467f88mr21672889edz.319.1653506972949; 
 Wed, 25 May 2022 12:29:32 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 15-20020a170906004f00b006f3ef214dd9sm8039944ejg.63.2022.05.25.12.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 12:29:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: [PULL 16/17] i386: Hyper-V Direct TLB flush hypercall
Date: Wed, 25 May 2022 21:28:51 +0200
Message-Id: <20220525192852.301633-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525192852.301633-1-pbonzini@redhat.com>
References: <20220525192852.301633-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

From: Vitaly Kuznetsov <vkuznets@redhat.com>

Hyper-V TLFS allows for L0 and L1 hypervisors to collaborate on L2's
TLB flush hypercalls handling. With the correct setup, L2's TLB flush
hypercalls can be handled by L0 directly, without the need to exit to
L1.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Message-Id: <20220525115949.1294004-6-vkuznets@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/hyperv.txt                | 11 +++++++++++
 target/i386/cpu.h              |  1 +
 target/i386/kvm/hyperv-proto.h |  1 +
 target/i386/cpu.c              |  2 ++
 target/i386/kvm/kvm.c          |  8 ++++++++
 5 files changed, 23 insertions(+)

diff --git a/docs/hyperv.txt b/docs/hyperv.txt
index 4b132b1c94..14a7f449ea 100644
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
 
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 5ff48257e5..82004b65b9 100644
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
index c7854ed6d3..464fbf09e3 100644
--- a/target/i386/kvm/hyperv-proto.h
+++ b/target/i386/kvm/hyperv-proto.h
@@ -90,6 +90,7 @@
 /*
  * HV_CPUID_NESTED_FEATURES.EAX bits
  */
+#define HV_NESTED_DIRECT_FLUSH              (1u << 17)
 #define HV_NESTED_MSR_BITMAP                (1u << 19)
 
 /*
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 3429a4e455..bb6a5dd498 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6974,6 +6974,8 @@ static Property x86_cpu_properties[] = {
                       HYPERV_FEAT_XMM_INPUT, 0),
     DEFINE_PROP_BIT64("hv-tlbflush-ext", X86CPU, hyperv_features,
                       HYPERV_FEAT_TLBFLUSH_EXT, 0),
+    DEFINE_PROP_BIT64("hv-tlbflush-direct", X86CPU, hyperv_features,
+                      HYPERV_FEAT_TLBFLUSH_DIRECT, 0),
     DEFINE_PROP_ON_OFF_AUTO("hv-no-nonarch-coresharing", X86CPU,
                             hyperv_no_nonarch_cs, ON_OFF_AUTO_OFF),
     DEFINE_PROP_BIT64("hv-syndbg", X86CPU, hyperv_features,
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index a11c8e88f6..f148a6d52f 100644
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
2.36.1



