Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3C53F739C
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:47:29 +0200 (CEST)
Received: from localhost ([::1]:53726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqRL-0000S4-Vu
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGR-0004c0-Ns
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:36:11 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:55839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGP-0005e1-UK
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:36:11 -0400
Received: by mail-wm1-x332.google.com with SMTP id g135so5369533wme.5
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vm7ius1nKHLmi0kFWlYTD0HSlr7YYDUTqZ7gyOscQOk=;
 b=ZsEVRlqs2KcS1k0wTZaYctdn/3M8udY4e3ZOwNUccS/Vc/e534OfXAOjGAHKkPtmwF
 z+HB6yIZ+ZITiA9zNpxkhQnGgT/b/UbYIxfomkwZgf3VBKv3WP2yGfpTOrz2DfRqRRo2
 zvYkBXX4y9uljZcW/zg9/7gsBI1n+dd3Uc9nl0uws9vLgulVaxra1AA1vcqyXnRremH6
 BGktSpsoQd5fnNpai55evXz/iTlexjZVBPpG1q2zpEsAw4T4Fde3eL2NOhJacHOurRmb
 VzecHE/p4q/1DynFgkDLNnT7yjP00WJidhlcvYftVptBZWqHO7mrg7amKisLW7uIyV5W
 6oOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vm7ius1nKHLmi0kFWlYTD0HSlr7YYDUTqZ7gyOscQOk=;
 b=BQJnVPVaucd3NMMPPyZGJYTeBr85/2bV9usgTmJ3ZBoWMghUQ5xC4jDlzH2RYXOr0J
 W6E9qVXuvkY4UUJB8yrwGok4nG7rxzx4vKcNMFqGuVg1uWa3/aYxjZUqTslFGPO83bZh
 xMOTQAxMxH6Os0Bpv3CWWL5ZECttICs3UytdDnLGMAieUJH0cJgxJbijBDNmm971PzM2
 i8LWqFa9cLiyqek8zOlG2Dbuii0qThO3LoMu+cwnGkmZ9MCPT+qZOoU2LDlf7e4TiYUO
 jBm55n6Mjjm1ATfqBnSVcV7seerb85mfa9MKnsjbTT6Q3J7eXyQPVXyWv6p0GvALCqom
 6NOw==
X-Gm-Message-State: AOAM533VfU9FlF/5tAV7WcmSQv3hL1xTsoUATgP+bDoBO9PXWpn8wWbm
 l8+qMfjPs2201IjwSgvONNmpl8KE5X9gjw==
X-Google-Smtp-Source: ABdhPJw9sBVYep71TYkxNo0f+1kPLTl3xIV4Z1vsAWchT+XuhI0t5prmZuS4eU08HsEfPqpdfdTO0g==
X-Received: by 2002:a1c:2285:: with SMTP id i127mr2894662wmi.64.1629887768649; 
 Wed, 25 Aug 2021 03:36:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.36.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:36:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 38/44] target/arm: kvm: use RCU_READ_LOCK_GUARD() in
 kvm_arch_fixup_msi_route()
Date: Wed, 25 Aug 2021 11:35:28 +0100
Message-Id: <20210825103534.6936-39-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
References: <20210825103534.6936-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hamza Mahfooz <someguy@effective-light.com>

As per commit 5626f8c6d468 ("rcu: Add automatically released rcu_read_lock
variants"), RCU_READ_LOCK_GUARD() should be used instead of
rcu_read_{un}lock().

Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-id: 20210727235201.11491-1-someguy@effective-light.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/kvm.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index d8381ba2245..5d55de1a493 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -998,7 +998,6 @@ int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
     hwaddr xlat, len, doorbell_gpa;
     MemoryRegionSection mrs;
     MemoryRegion *mr;
-    int ret = 1;
 
     if (as == &address_space_memory) {
         return 0;
@@ -1006,15 +1005,19 @@ int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
 
     /* MSI doorbell address is translated by an IOMMU */
 
-    rcu_read_lock();
+    RCU_READ_LOCK_GUARD();
+
     mr = address_space_translate(as, address, &xlat, &len, true,
                                  MEMTXATTRS_UNSPECIFIED);
+
     if (!mr) {
-        goto unlock;
+        return 1;
     }
+
     mrs = memory_region_find(mr, xlat, 1);
+
     if (!mrs.mr) {
-        goto unlock;
+        return 1;
     }
 
     doorbell_gpa = mrs.offset_within_address_space;
@@ -1025,11 +1028,7 @@ int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
 
     trace_kvm_arm_fixup_msi_route(address, doorbell_gpa);
 
-    ret = 0;
-
-unlock:
-    rcu_read_unlock();
-    return ret;
+    return 0;
 }
 
 int kvm_arch_add_msi_route_post(struct kvm_irq_routing_entry *route,
-- 
2.20.1


