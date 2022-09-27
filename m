Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2DE5EC84A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 17:40:30 +0200 (CEST)
Received: from localhost ([::1]:60398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odChB-0006CH-Sj
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 11:40:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odBMj-00055e-VS
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:15:19 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:43895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odBMc-0005zh-IS
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:15:13 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 r3-20020a05600c35c300b003b4b5f6c6bdso5526688wmq.2
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 07:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=jinC1E8FBpCtwExy5oEB2wbtRevFZPQmAbFk5PB8kRY=;
 b=gLTcB6Czzx3VJdWGNqcAsFy6R1+SJ8DAs8+LrUAwxlvZ0DQRJYm4UzukgAUx3G804/
 It5yr7e/JoxhrUch8KFQtTMV7w2oU5fyLZFtVelUWvw2gYJzt9nQRyho2BZ/2saA746y
 MQqesr8JPIRTmb2pB5lF0RJTrWI9suoghsWm6lxBCCznI+NUS5jwQTXbfP77UV/yTRsI
 +whj2hNU//YRUfHnwev5F6s1+KdDn3hJ2clhvk0bagJOq5mjG30gXxZl0THdon8WmTnu
 rnDm4iB/ayxzF8RJfIVFbgDakhp1KgGVaSylSdQMHTJ06wcxYjQlGtg+eMwX/w1mowAU
 ak7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=jinC1E8FBpCtwExy5oEB2wbtRevFZPQmAbFk5PB8kRY=;
 b=hWtU0Gf/2TQw9pO88QiRYZQjwoe3p0TdF+iCYp6f2pFGTzSbkFuYQKWNwOa+7ZwhC8
 NrbC0xPuyd4ezdVVz1NFkDmAQWFhrC9+xDkZWPKxrsOKVekjABhzpCA5BpVkLDoZDVbK
 4VcOovf4g02VqkBlaR7nAAB9a+Jz/taDu5MidHjXDzvfVCNEbaDWmqGH37xfVdko+6eo
 CYC6lt4KBMy9oLVOzn4ocdQpc9mtmMG1/4DAifDJNR2ErC+MF4ReixR/DYmEi1bPcwAN
 YGnoL7zdLevdZPglbXQcKQEhRI/xNDCiVgWVKHgyyH6xSh1r+r1SLvugZD8K9+VGi+c2
 8sqw==
X-Gm-Message-State: ACrzQf0NzypCGyTM99Q0C/ljLwqm+sqzaJOlCmmx4KeIEHk56dYi4nMA
 rWePRoUE4GIrEciRC+2nTP+3Hg==
X-Google-Smtp-Source: AMsMyM7nx4GBbJ6jrZNIdLSGvy4obHwUe2oEjfUVDrw3vMocX+vfP1s3I2fqZIY5WDNcBqEbsp2iqQ==
X-Received: by 2002:a05:600c:34d2:b0:3b4:a617:f3b9 with SMTP id
 d18-20020a05600c34d200b003b4a617f3b9mr2846431wmq.204.1664288109247; 
 Tue, 27 Sep 2022 07:15:09 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 az19-20020a05600c601300b003a83ca67f73sm2107341wmb.3.2022.09.27.07.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 07:15:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DAF1D1FFBC;
 Tue, 27 Sep 2022 15:15:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org (open list:Overall KVM CPUs)
Subject: [PATCH v3 04/15] target/arm: ensure KVM traps set appropriate
 MemTxAttrs
Date: Tue, 27 Sep 2022 15:14:53 +0100
Message-Id: <20220927141504.3886314-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927141504.3886314-1-alex.bennee@linaro.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Although most KVM users will use the in-kernel GIC emulation it is
perfectly possible not to. In this case we need to ensure the
MemTxAttrs are correctly populated so the GIC can divine the source
CPU of the operation.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - new for v3
---
 target/arm/kvm.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index e5c1bd50d2..05056562f4 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -801,13 +801,14 @@ MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)
 {
     ARMCPU *cpu;
     uint32_t switched_level;
+    MemTxAttrs attrs = MEMTXATTRS_CPU(cs);
 
     if (kvm_irqchip_in_kernel()) {
         /*
          * We only need to sync timer states with user-space interrupt
          * controllers, so return early and save cycles if we don't.
          */
-        return MEMTXATTRS_UNSPECIFIED;
+        return attrs;
     }
 
     cpu = ARM_CPU(cs);
@@ -848,7 +849,7 @@ MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)
         qemu_mutex_unlock_iothread();
     }
 
-    return MEMTXATTRS_UNSPECIFIED;
+    return attrs;
 }
 
 void kvm_arm_vm_state_change(void *opaque, bool running, RunState state)
@@ -1003,6 +1004,10 @@ int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
     hwaddr xlat, len, doorbell_gpa;
     MemoryRegionSection mrs;
     MemoryRegion *mr;
+    MemTxAttrs attrs = {
+        .requester_type = MTRT_PCI,
+        .requester_id = pci_requester_id(dev)
+    };
 
     if (as == &address_space_memory) {
         return 0;
@@ -1012,8 +1017,7 @@ int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
 
     RCU_READ_LOCK_GUARD();
 
-    mr = address_space_translate(as, address, &xlat, &len, true,
-                                 MEMTXATTRS_UNSPECIFIED);
+    mr = address_space_translate(as, address, &xlat, &len, true, attrs);
 
     if (!mr) {
         return 1;
-- 
2.34.1


