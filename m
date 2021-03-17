Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2490B33ED0D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 10:32:16 +0100 (CET)
Received: from localhost ([::1]:48864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMSXH-0003ja-4u
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 05:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lMSTw-0001lg-Eq
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:28:48 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:37203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lMSTu-00013d-4u
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:28:47 -0400
Received: by mail-pg1-x52c.google.com with SMTP id o10so24439486pgg.4
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 02:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q+3SQ1h/ZiK+NQG+zSbCG676wEEMohnKSXfyBletwdI=;
 b=Mo3EXAXS9ISjyYdntIfJ2GRk1WZJZkm0kOxi4kC0l2UQz6SCoxLUHssI5zKspwxoss
 OWP9VHNroyIMuZrCYIlIAoS9wvmEBskBf2xW7vzn7QMVfUU4ZmbZb4YbEG3YseFjp+tf
 CfB2ZiqHOdNGj9Dv+3/NI9ibLoBxfBi3ywlQNo+2V4iGpI/VEnZg9GfHsghhKhTViWDU
 kb4G6BSyhywEttloJN5L3R4bmfkmwMy7GD8uZ0QnGjk95lytohdRBA1rC25OHV9XpFTs
 E+0bDW9M+85TFG0sDr5Dag1pbQyZewgnXPHgrNe+9GlKNL42NLcgbrK/dL4Tu2x0ySNW
 AZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q+3SQ1h/ZiK+NQG+zSbCG676wEEMohnKSXfyBletwdI=;
 b=iz5e/RPOqYW5sCLwyEy1v/3C7pvAgiYxSu/tzoccRoF/uOWAIv2416JZU5/S7Pn/Mi
 512q/KtMuXij2QEzo2AUvmweOl693gZSm8+3zq3QWL0gydHV5a5jN4bXECKU1clQUeM1
 PpUhXOhG0jdl6NZYf0yWDj8y+EiuMnyF973yFwOL7SUnc2im52nAEDY4EOYIF94RECg/
 PATLFuj9gaTxd9TnOadjnmniqp54LdMOWRO0EuOF29AwjbNYR+shA3QfdaUnRemPpbHr
 V/jJtA55oQia3u5GC5yI56gbI9ogDJ6hSoIUjGK1C57nFDuv/eQGjVJNg/0FAZD1Og31
 PrvQ==
X-Gm-Message-State: AOAM5312STF/qzMIMH5rABclfsZQdA9PCNN8xmJWsWxQFMNgf+uGp09C
 Wvr+l4l9XyI8XwmA09N0TTT9
X-Google-Smtp-Source: ABdhPJyJXxhoUObk5wauk8k3YbmWOx2ZXolVbbJSq8kNonSXx8N/tQ6SjYcU0wqNqyZzrttaFZ1PoQ==
X-Received: by 2002:a62:e90c:0:b029:203:90f:6f34 with SMTP id
 j12-20020a62e90c0000b0290203090f6f34mr3401533pfh.29.1615973324687; 
 Wed, 17 Mar 2021 02:28:44 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id r30sm18630163pgu.86.2021.03.17.02.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 02:28:40 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: dgilbert@redhat.com, quintela@redhat.com, drjones@redhat.com,
 richard.henderson@linaro.org
Subject: [RFC PATCH v2 1/5] Update Linux headers with new MTE support
Date: Wed, 17 Mar 2021 09:28:20 +0000
Message-Id: <a3cdacb0fb46d8e1dd7215800b9abf5b14fa4b86.1615972140.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615972140.git.haibo.xu@linaro.org>
References: <cover.1615972140.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=haibo.xu@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 linux-headers/linux/kvm.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 020b62a619..941743b3a7 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1056,6 +1056,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_ENFORCE_PV_FEATURE_CPUID 190
 #define KVM_CAP_SYS_HYPERV_CPUID 191
 #define KVM_CAP_DIRTY_LOG_RING 192
+#define KVM_CAP_ARM_MTE 195
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
@@ -1241,6 +1242,20 @@ struct kvm_arm_device_addr {
 	__u64 addr;
 };
 
+#define KVM_ARM_TAGS_TO_GUEST           0
+#define KVM_ARM_TAGS_FROM_GUEST         1
+
+struct kvm_arm_copy_mte_tags {
+	__u64 guest_ipa;
+	__u64 length;
+	union {
+		void *addr;
+		__u64 padding;
+	};
+	__u64 flags;
+	__u64 reserved[2];
+};
+
 /*
  * Device control API, available with KVM_CAP_DEVICE_CTRL
  */
@@ -1396,6 +1411,7 @@ struct kvm_s390_ucas_mapping {
 /* Available with KVM_CAP_PMU_EVENT_FILTER */
 #define KVM_SET_PMU_EVENT_FILTER  _IOW(KVMIO,  0xb2, struct kvm_pmu_event_filter)
 #define KVM_PPC_SVM_OFF		  _IO(KVMIO,  0xb3)
+#define KVM_ARM_MTE_COPY_TAGS	  _IOR(KVMIO,  0xb4, struct kvm_arm_copy_mte_tags)
 
 /* ioctl for vm fd */
 #define KVM_CREATE_DEVICE	  _IOWR(KVMIO,  0xe0, struct kvm_create_device)
-- 
2.17.1


