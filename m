Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E59A5A9F15
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 20:36:07 +0200 (CEST)
Received: from localhost ([::1]:59094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTp2p-0002QI-Mo
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 14:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTorx-0007bf-HE
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:24:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTorp-0008GY-Bw
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:24:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662056680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aBWn14KGMiURzBNmUtAaeeErmY9speVBwxUEMoijqO0=;
 b=L81XkMyosZxrvU0Hu4zOcybpAnUSn4A+ECJZ88wcVrUmUjID3/Pl+QEPMBBV664qsd44wC
 MYLWzrlsqSNLiInhFxljGEkGowiHgold/wBgIsPWcbnXsrM3YU9M8bKMinyeJmkzLx0qAO
 +0sPXxKqTSt0vkNzx+MchEJGM5RiZcg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-349-0rxhKXMANjehS6_Nu14uRQ-1; Thu, 01 Sep 2022 14:24:39 -0400
X-MC-Unique: 0rxhKXMANjehS6_Nu14uRQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 sh44-20020a1709076eac00b00741a01e2aafso6059968ejc.22
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 11:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=aBWn14KGMiURzBNmUtAaeeErmY9speVBwxUEMoijqO0=;
 b=AhjoDmW/cjQhJn/OIgCDEJKG+OqlK2a8Qn8Sot73fcuNZzm7iHvKshXl3wLNE7yF83
 jpQjOFXpeaKBSku19WH+7Db34t+GtH7TmlXsyb0sbQY5qtJpMivIl3unOHbhsm/XhTf+
 eMyZtLYDBZCLkm59W9jaNCuAAF/8Sqy9KzGQsSSzB3HLfT7o8mvebAjTwZmXF8BLKCws
 eg66LlRwiXimSfLF2v9Tp5RkVnyb5kpdcVQPUIAvCwAiTdmflnHLT+744S6CCruLoJOy
 0ZgFpxgCC/4CcysTYUY8rE26A40P3gDLZG51lmDoZVQLUE4VgqQm0vsFFxNS1D6Ww3R/
 Nu/g==
X-Gm-Message-State: ACgBeo2KRRJK+u4AGETNlvpYxi0A+ONX8WkX3V8rfHOGUB/qFsyZl8Sl
 FM3N2OsoE3sNpqjhaD22bzfqBf7364MRwoCn2lex60d9u1gQ+9Ep9SBO653Zo3TWf2UZP/0KMDC
 yXMm3YBV4ZvBHtSfQBLaRhltj+gQNNfebiw8n/ZfnSYmoOn3DR54FsinSAOkZLldhOio=
X-Received: by 2002:a17:907:9814:b0:73d:8afe:6039 with SMTP id
 ji20-20020a170907981400b0073d8afe6039mr23989603ejc.566.1662056677824; 
 Thu, 01 Sep 2022 11:24:37 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4tVDqPXTyY9wtoINwhkolSorZf21Zcz8pAPraULdjzSmDj0XigfAsVr/cKhdtCc8eMojz1PQ==
X-Received: by 2002:a17:907:9814:b0:73d:8afe:6039 with SMTP id
 ji20-20020a170907981400b0073d8afe6039mr23989590ejc.566.1662056677546; 
 Thu, 01 Sep 2022 11:24:37 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 h25-20020a170906855900b0073a62f3b447sm8816989ejy.44.2022.09.01.11.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 11:24:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Subject: [PULL 04/39] i386: reset KVM nested state upon CPU reset
Date: Thu,  1 Sep 2022 20:23:54 +0200
Message-Id: <20220901182429.93533-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220901182429.93533-1-pbonzini@redhat.com>
References: <20220901182429.93533-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

From: Vitaly Kuznetsov <vkuznets@redhat.com>

Make sure env->nested_state is cleaned up when a vCPU is reset, it may
be stale after an incoming migration, kvm_arch_put_registers() may
end up failing or putting vCPU in a weird state.

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Message-Id: <20220818150113.479917-2-vkuznets@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm/kvm.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index f148a6d52f..4f8dacc1d4 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1695,6 +1695,30 @@ static void kvm_init_xsave(CPUX86State *env)
            env->xsave_buf_len);
 }
 
+static void kvm_init_nested_state(CPUX86State *env)
+{
+    struct kvm_vmx_nested_state_hdr *vmx_hdr;
+    uint32_t size;
+
+    if (!env->nested_state) {
+        return;
+    }
+
+    size = env->nested_state->size;
+
+    memset(env->nested_state, 0, size);
+    env->nested_state->size = size;
+
+    if (cpu_has_vmx(env)) {
+        env->nested_state->format = KVM_STATE_NESTED_FORMAT_VMX;
+        vmx_hdr = &env->nested_state->hdr.vmx;
+        vmx_hdr->vmxon_pa = -1ull;
+        vmx_hdr->vmcs12_pa = -1ull;
+    } else if (cpu_has_svm(env)) {
+        env->nested_state->format = KVM_STATE_NESTED_FORMAT_SVM;
+    }
+}
+
 int kvm_arch_init_vcpu(CPUState *cs)
 {
     struct {
@@ -2122,19 +2146,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
         assert(max_nested_state_len >= offsetof(struct kvm_nested_state, data));
 
         if (cpu_has_vmx(env) || cpu_has_svm(env)) {
-            struct kvm_vmx_nested_state_hdr *vmx_hdr;
-
             env->nested_state = g_malloc0(max_nested_state_len);
             env->nested_state->size = max_nested_state_len;
 
-            if (cpu_has_vmx(env)) {
-                env->nested_state->format = KVM_STATE_NESTED_FORMAT_VMX;
-                vmx_hdr = &env->nested_state->hdr.vmx;
-                vmx_hdr->vmxon_pa = -1ull;
-                vmx_hdr->vmcs12_pa = -1ull;
-            } else {
-                env->nested_state->format = KVM_STATE_NESTED_FORMAT_SVM;
-            }
+            kvm_init_nested_state(env);
         }
     }
 
@@ -2199,6 +2214,8 @@ void kvm_arch_reset_vcpu(X86CPU *cpu)
     /* enabled by default */
     env->poll_control_msr = 1;
 
+    kvm_init_nested_state(env);
+
     sev_es_set_reset_vector(CPU(cpu));
 }
 
-- 
2.37.2



