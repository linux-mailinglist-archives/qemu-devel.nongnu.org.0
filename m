Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E65C9234B52
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jul 2020 20:52:03 +0200 (CEST)
Received: from localhost ([::1]:43452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k1a8Q-0002Qq-E5
	for lists+qemu-devel@lfdr.de; Fri, 31 Jul 2020 14:52:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1k1a7h-00020m-Bs
 for qemu-devel@nongnu.org; Fri, 31 Jul 2020 14:51:17 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:21800
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1k1a7e-0000UJ-Cu
 for qemu-devel@nongnu.org; Fri, 31 Jul 2020 14:51:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596221473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=imsvRW5yWZy6AQyive/oOZhhd9Y0331pS9i0+Do6C1M=;
 b=KzYLlkWkYeeZ7dvONS8nTD/jSlV/AlCQ1Rh8NGIgb7orSh878gnLFMFwiQETS6OJ9ilnkb
 YuSVlAecjag+5uEnwzptfg/8E2FbRUEiGt0ZUlCkNMbYwOi+0ZDRTJ6qsb2KYCiN9BffFX
 WXsxnUuRX4p7B3ez1jxpGt66koWoDJI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-1bxy9DAGNVaLJ5R7yVBZEQ-1; Fri, 31 Jul 2020 14:50:02 -0400
X-MC-Unique: 1bxy9DAGNVaLJ5R7yVBZEQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82922100CCC0;
 Fri, 31 Jul 2020 18:50:01 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.40.192.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 501811001B0B;
 Fri, 31 Jul 2020 18:49:44 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] target/i386: kvm: Enable KVM_FEATURE_PCI_GO_MMCONFIG
 CPUID bit
Date: Fri, 31 Jul 2020 20:49:38 +0200
Message-Id: <20200731184938.606754-1-jusual@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jusual@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=jusual@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/31 12:28:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This feature allows MMCONFIG to be used even to access the base PCI
config space [1]. This means increased performance: one access to
MMCONFIG instead of two conventional accesses to I/O ports.

Q35 makes no distinction in base or extended PCI config access to
MMCONFIG, MMCONFIG is always on, and in case it is is not initialized,
probing of PCI devices will fall back to normal process and use type1
access.

Enable the feature unconditionally.

[1]: https://lore.kernel.org/kvm/20200730193510.578309-1-jusual@redhat.com/

Signed-off-by: Julia Suvorova <jusual@redhat.com>
---
The feature is in the review phase.

 include/standard-headers/asm-x86/kvm_para.h | 1 +
 target/i386/cpu.c                           | 3 ++-
 target/i386/kvm.c                           | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/standard-headers/asm-x86/kvm_para.h b/include/standard-headers/asm-x86/kvm_para.h
index 07877d3295..52eeba9067 100644
--- a/include/standard-headers/asm-x86/kvm_para.h
+++ b/include/standard-headers/asm-x86/kvm_para.h
@@ -32,6 +32,7 @@
 #define KVM_FEATURE_POLL_CONTROL	12
 #define KVM_FEATURE_PV_SCHED_YIELD	13
 #define KVM_FEATURE_ASYNC_PF_INT	14
+#define KVM_FEATURE_PCI_GO_MMCONFIG	15
 
 #define KVM_HINTS_REALTIME      0
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 588f32e136..5509523bb3 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -810,7 +810,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             "kvmclock", "kvm-nopiodelay", "kvm-mmu", "kvmclock",
             "kvm-asyncpf", "kvm-steal-time", "kvm-pv-eoi", "kvm-pv-unhalt",
             NULL, "kvm-pv-tlb-flush", NULL, "kvm-pv-ipi",
-            "kvm-poll-control", "kvm-pv-sched-yield", NULL, NULL,
+            "kvm-poll-control", "kvm-pv-sched-yield", NULL, "kvm-pci-go-mmconfig",
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             "kvmclock-stable-bit", NULL, NULL, NULL,
@@ -4141,6 +4141,7 @@ static PropValue kvm_default_props[] = {
     { "acpi", "off" },
     { "monitor", "off" },
     { "svm", "off" },
+    { "kvm-pci-go-mmconfig", "on" },
     { NULL, NULL },
 };
 
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 6f18d940a5..0069e945e6 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -440,6 +440,7 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
         if (!kvm_irqchip_in_kernel()) {
             ret &= ~(1U << KVM_FEATURE_PV_UNHALT);
         }
+        ret |= 1U << KVM_FEATURE_PCI_GO_MMCONFIG;
     } else if (function == KVM_CPUID_FEATURES && reg == R_EDX) {
         ret |= 1U << KVM_HINTS_REALTIME;
         found = 1;
-- 
2.25.4


