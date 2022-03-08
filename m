Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D81204D16A3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:51:23 +0100 (CET)
Received: from localhost ([::1]:37198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRYN9-0007Fg-0C
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:51:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7e-0007pP-LZ
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:26 -0500
Received: from [2a00:1450:4864:20::630] (port=41544
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7W-0005zi-Te
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:19 -0500
Received: by mail-ej1-x630.google.com with SMTP id a8so38522723ejc.8
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0HGozlZ3E0yjm8Id+XSZiwcb/TzgAs6XSXR21u6h1wc=;
 b=cxXUcNyIXbhpvb3G97+vJUwA6K9Dw36UYrmk45v/5eUEUIRU100ZsqQfLAeaOWxa1p
 Xcj1y3wex+glJJKQl8elzUeT2fddrE+aRs9kiC2RvUJja6L/Jw2uSchwBhjt0oe9Dl2c
 I3naiuApUf5II4RESM4klUEfZtxaAEP7gj2NIWA10zPbf94wN/tc98BlApylZu6T5Snv
 0zg/XmQF5zpzInYoUIzRl4MAmQiC9631mz/QyLAzVHDot8hRC2g5LMDfEL3dxvL8CiG6
 Yks3simB++Ymdw2TlOa2s8MKYaufD5kXcE9ba1ycmq0r+/llNjDYTenLRn85q08cfL3H
 k+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0HGozlZ3E0yjm8Id+XSZiwcb/TzgAs6XSXR21u6h1wc=;
 b=tGPqoqIKckuU7loekPwFAwmkSuklgifbOh/Qx2pXR0ctKdwZjkqAIxB3DTIv2CxNvo
 hOHpofGjZxGbjEOQNcuc5PajXxM8Vmgx8cF17twv+ZQWiKIVDKYBgIT4PvKS0uZewo5Y
 QgkradaumdYeCYPt6ly38gDdNd+rNNPCeQs4mz8Q9WFxOPhTxhS+4brkf38h9Rd4KKt/
 RJnkchPFv48jN2goNwoAjLBc1ONeztCyxSNtmR+gvZAlRrhFB7c/57KEFOq96cKj2EWA
 1w/xpX8ZeBkaAt6NU5AnWBTOUid2GZJra+/XPhClE7ut6YOb54KYot5eFvFBydCiylfr
 YNkg==
X-Gm-Message-State: AOAM530eqq8eu8shxXzYJwqvULVi0/OSEDk3aLMuIUG3w3aBpse4+aM6
 Zb2PgUUE2kIo5t2FEfJu+09JXVPuOT4=
X-Google-Smtp-Source: ABdhPJxTBRmOVUfbHfHouXiNqkH8vxqEyCTztv4m0Uuq3ZQXfmfQnwUw/88ivhLMrcSRRqhPRdkULA==
X-Received: by 2002:a17:907:970e:b0:6da:9224:7fb3 with SMTP id
 jg14-20020a170907970e00b006da92247fb3mr12940491ejc.502.1646739308616; 
 Tue, 08 Mar 2022 03:35:08 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l2-20020aa7cac2000000b003f9b3ac68d6sm7491868edt.15.2022.03.08.03.35.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 03:35:07 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/22] linux-headers: include missing changes from 5.17
Date: Tue,  8 Mar 2022 12:34:35 +0100
Message-Id: <20220308113445.859669-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308113445.859669-1-pbonzini@redhat.com>
References: <20220308113445.859669-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
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
2.35.1



