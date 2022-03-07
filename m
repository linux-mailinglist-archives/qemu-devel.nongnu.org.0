Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D78ED4D066B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 19:23:51 +0100 (CET)
Received: from localhost ([::1]:60720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRI1O-0006pE-Uv
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 13:23:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHui-000184-RB
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:56 -0500
Received: from [2a00:1450:4864:20::62a] (port=44941
 helo=mail-ej1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHud-0005Nd-7j
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:56 -0500
Received: by mail-ej1-x62a.google.com with SMTP id qt6so33797542ejb.11
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 10:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ohuOj7/RPeB7VtN1AquejguYaBzi1b7GC1f/dw4ahVU=;
 b=dgVUNGpfOMpSYcgiLZ87A1qpx0qYLarLdZPLI4orYikX2XwFJKJwNqCr+jjlZSNDNo
 AD639bORQCsbvz4JCdRvDsT5m8SVfKRm0HWhLhthhHeix31uiJiLOsKOAYoU/sgOBDDA
 +/9BbvheXRh1VJJYq4LHJbdmEr0JMKaR0jkWe2dWQ8YStd8Y+9Ck4FURNPbd3uydR/5J
 8Oz2FPzf7o/TVP6GgE5/WiAcRf3NXPKy2zS0oEJdPhKUIh46/N8glvHuazM/EmuGthXn
 vBU8MWU++t4cTqyZH/2JA+fhmsj8JgkqH3AHd2qOEJt8ev7mYWF0Ukjj690qvTpg/bOV
 HXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ohuOj7/RPeB7VtN1AquejguYaBzi1b7GC1f/dw4ahVU=;
 b=7dok4O8yZy1Bu1fU3YR73Am8lGic6Sk4BVY1fEd4BRVjU76dcov7XF2GVxGfpz8FI1
 x/WWIyGQ234xxkglhm58u9Vb2Ivxe4xdbWKjBYAJJ4xoL0Fz3RGHcPrf2NPgwiPM1bX6
 lqIrYgf5KbQIDebcAFyewRNXmV42wgNxFUcloEGWO/5xI5spisG5+KvEJmUNKJN8AqYL
 kQXYp0UHFt1r2x9X5M5suWFWaaJ6Ts8h1TO2O2FeOEhmecUbvT8JQnCIBKuuqzusUfVE
 H+Ix66/ciGa/zhG3uMQyhf5yZxfwxa95m+iXQPCeN37kUF/8tnZ3cdMxncxL09qdMN1Q
 XyOA==
X-Gm-Message-State: AOAM532HDbMTSrUKV/QoOgFcSjNL7TiBm6b5Y5tIKsdvTQnXej9Drk+D
 9ZFaZYJQD96yhMDmjhYs2HJgawgIhwA=
X-Google-Smtp-Source: ABdhPJwcUh2s6uA32HOG02zhAF55i8cleYHz0FaUzmRwVYYrFloWzHMeJ7KODHYs5BlTuQzjR2fkqw==
X-Received: by 2002:a17:906:402:b0:6d5:c6bc:3150 with SMTP id
 d2-20020a170906040200b006d5c6bc3150mr10176662eja.403.1646677005056; 
 Mon, 07 Mar 2022 10:16:45 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a170906304800b006cdf8a1e146sm4983382ejd.217.2022.03.07.10.16.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 10:16:44 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/23] linux-headers: include missing changes from 5.17
Date: Mon,  7 Mar 2022 19:16:22 +0100
Message-Id: <20220307181633.596898-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307181633.596898-1-pbonzini@redhat.com>
References: <20220307181633.596898-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 linux-headers/asm-x86/kvm.h | 3 +++
 linux-headers/linux/kvm.h   | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/linux-headers/asm-x86/kvm.h b/linux-headers/asm-x86/kvm.h
index 2da3316bb5..bf6e96011d 100644
--- a/linux-headers/asm-x86/kvm.h
+++ b/linux-headers/asm-x86/kvm.h
@@ -452,6 +452,9 @@ struct kvm_sync_regs {
 
 #define KVM_STATE_VMX_PREEMPTION_TIMER_DEADLINE	0x00000001
 
+/* attributes for system fd (group 0) */
+#define KVM_X86_XCOMP_GUEST_SUPP	0
+
 struct kvm_vmx_nested_state_data {
 	__u8 vmcs12[KVM_STATE_NESTED_VMX_VMCS_SIZE];
 	__u8 shadow_vmcs12[KVM_STATE_NESTED_VMX_VMCS_SIZE];
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 00af3bc333..d232feaae9 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1133,6 +1133,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_VM_MOVE_ENC_CONTEXT_FROM 206
 #define KVM_CAP_VM_GPA_BITS 207
 #define KVM_CAP_XSAVE2 208
+#define KVM_CAP_SYS_ATTRIBUTES 209
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
@@ -2047,4 +2048,7 @@ struct kvm_stats_desc {
 
 #define KVM_GET_STATS_FD  _IO(KVMIO,  0xce)
 
+/* Available with KVM_CAP_XSAVE2 */
+#define KVM_GET_XSAVE2		  _IOR(KVMIO,  0xcf, struct kvm_xsave)
+
 #endif /* __LINUX_KVM_H */
-- 
2.34.1



