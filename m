Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BCF33ED1A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 10:36:21 +0100 (CET)
Received: from localhost ([::1]:58628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMSbE-0007ss-MD
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 05:36:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lMSU6-0001z7-2t
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:28:58 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:39817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lMSU0-00016A-Vl
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:28:57 -0400
Received: by mail-pf1-x42b.google.com with SMTP id x184so697604pfd.6
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 02:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kaO/3XjDddPfI9XqP7E0JoVJAI1xFWhKSBbTYqDo4uw=;
 b=P9kRGEj8r95nOVyfGoLgAjvUiNZr1RHZiuytUoHL9d7+8P1Gw/rvOHNNbYsqpIjYI9
 Wz4uoLyZvg+jANcAIvczMMdSj6O3m3dmg/wdcQJg0Nu+tbpUq+IC8HJMXNtQPcUy2IAB
 SK3V1r6tEmf1BB+2lssC6alP6HgvyIe+kfC/XbFDbuAsYksko6sp8PzDJgWFYmnh0BLF
 moJDHvUKDNuDjrocWv+a65itCWQ+CS387/b4LYCDL/H+iPBvzJGlb1yJcwuptTPPmEAP
 RW9a6YT2oj4KgVPwPbnYoInusWDTuzbhoZdzd19Yt/BVwpg1p8FP9RT8XMzn91LRtTKT
 0bEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kaO/3XjDddPfI9XqP7E0JoVJAI1xFWhKSBbTYqDo4uw=;
 b=HTNsw9cdyKki3FP6OL4n7Ba+CWlD4CM9Ge4s0mfyPr+emTbDRD+Czhq1XelpT7UeOO
 SywP/zBXnWwGaUJ2AAzTQEeDTC9IdCI0I2GH3rCKkDFE3sovuhBGgoCe5n1Au5b0utfs
 rB7maiQ6zcjFFKTUIP3jrFiE9L5/qm/tP68GrgXOlvGok4m6wFOSjj0UdHOl65nbOfRW
 48hz0TU8nNtyja5mRSQaIlLUVKpw6NMVbBKrfCT21zRqHIZpXmKS6JIBa9bEmyNj9ewm
 G34p1MBkrDDwWEba8YVCqJGwiVS7HWAE0gXbXV7ykU/nDmOlxqDeqtny4s6bxnFCMsYe
 6n2g==
X-Gm-Message-State: AOAM533CsI76tyijS2zE1rSIzuN+6VYy85YTf54+KH4dnehnSgcB+s7H
 TGnezbFvbi2kbtdTU2JkXomx
X-Google-Smtp-Source: ABdhPJwXi05rmmWj7FtuRyYAmCemqP5wwaCM8vbGra2CRNUhJI2NRoxBQlS9PkWr5tpUstpwr4VQzw==
X-Received: by 2002:aa7:9532:0:b029:1f8:838e:7773 with SMTP id
 c18-20020aa795320000b02901f8838e7773mr3426574pfp.15.1615973331737; 
 Wed, 17 Mar 2021 02:28:51 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id r30sm18630163pgu.86.2021.03.17.02.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 02:28:47 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: dgilbert@redhat.com, quintela@redhat.com, drjones@redhat.com,
 richard.henderson@linaro.org
Subject: [RFC PATCH v2 3/5] Add APIs to get/set MTE tags
Date: Wed, 17 Mar 2021 09:28:22 +0000
Message-Id: <5f269099f5f06c23f11d41b45d64f77eca23a8ff.1615972140.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615972140.git.haibo.xu@linaro.org>
References: <cover.1615972140.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=haibo.xu@linaro.org; helo=mail-pf1-x42b.google.com
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

MTE spec provide instructions to retrieve the memory tags:
(1) LDG, at 16 bytes granularity, and available in both user
    and kernel space;
(2) LDGM, at 256 bytes granularity in maximum, and only
    available in kernel space

To improve the performance, KVM has exposed the LDGM capability
to user space by providing a new APIs. This patch is just a
wrapper for the KVM APIs.

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 target/arm/kvm64.c   | 24 ++++++++++++++++++++++++
 target/arm/kvm_arm.h |  2 ++
 2 files changed, 26 insertions(+)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 73a191f8e1..3157025316 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -1606,3 +1606,27 @@ bool kvm_arm_verify_ext_dabt_pending(CPUState *cs)
     }
     return false;
 }
+
+int kvm_arm_mte_get_tags(uint64_t ipa, uint64_t len, uint8_t *buf)
+{
+    struct kvm_arm_copy_mte_tags args = {
+        .guest_ipa = ipa,
+        .length = len,
+        .addr = buf,
+        .flags = KVM_ARM_TAGS_FROM_GUEST,
+    };
+
+    return kvm_vm_ioctl(kvm_state, KVM_ARM_MTE_COPY_TAGS, &args);
+}
+
+int kvm_arm_mte_set_tags(uint64_t ipa, uint64_t len, uint8_t *buf)
+{
+    struct kvm_arm_copy_mte_tags args = {
+        .guest_ipa = ipa,
+        .length = len,
+        .addr = buf,
+        .flags = KVM_ARM_TAGS_TO_GUEST,
+    };
+
+    return kvm_vm_ioctl(kvm_state, KVM_ARM_MTE_COPY_TAGS, &args);
+}
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 34f8daa377..bbb833d6c6 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -360,6 +360,8 @@ int kvm_arm_vgic_probe(void);
 
 void kvm_arm_pmu_set_irq(CPUState *cs, int irq);
 void kvm_arm_pmu_init(CPUState *cs);
+int kvm_arm_mte_get_tags(uint64_t ipa, uint64_t len, uint8_t *buf);
+int kvm_arm_mte_set_tags(uint64_t ipa, uint64_t len, uint8_t *buf);
 
 /**
  * kvm_arm_pvtime_init:
-- 
2.17.1


