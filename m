Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8085C35612E
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 04:03:25 +0200 (CEST)
Received: from localhost ([::1]:41972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTxXQ-0007dw-Je
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 22:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lTxVY-0006gC-3g
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 22:01:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lTxVW-0003Y7-Gq
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 22:01:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617760885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=puMm9exJjlsbW1miEc1jOLuNGha77Fd9MACz8dzLPGs=;
 b=fbb4/FtcIi3NOSgb9PSS6fttNH/g39utB/YbVf6TtVn/v/rOVfKJ27eiLFAPXi3Z+vY87e
 3ykMRausdOvSZ8NU2jHmutMxjJE8SNWuMChoFChINoqFu0zCpMGowVoxgcVI7vdNyY5BDM
 2xB7lNvEi0v3hU9xHqRVdDhM5bjg8u0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-of-DBZoyMHWYmurS7ShRPw-1; Tue, 06 Apr 2021 22:01:22 -0400
X-MC-Unique: of-DBZoyMHWYmurS7ShRPw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 978A72AB;
 Wed,  7 Apr 2021 02:01:20 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-160.bne.redhat.com [10.64.54.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBDE9627DC;
 Wed,  7 Apr 2021 02:01:17 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 2/2] target/arm: Initlaize PMU feature for scratch vcpu
Date: Wed,  7 Apr 2021 12:01:00 +0800
Message-Id: <20210407040100.9933-2-gshan@redhat.com>
In-Reply-To: <20210407040100.9933-1-gshan@redhat.com>
References: <20210407040100.9933-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, marcin.juszkiewicz@linaro.org, shan.gavin@gmail.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the scratch vCPU is initialized without PMU feature, we receive
error on reading PMCR_EL0 as it's invisible in this case. It leads
to host probing failure.

This fixes the issue by initializing the scratch vcpu with the PMU
feature enabled and reading PMCR_EL0 from host. Otherwise, its value
is set according to the detected target.

Fixes: f7fb73b8cdd3 ("target/arm: Make number of counters in PMCR follow the CPU")
Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/arm/kvm64.c | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 79800f00a7..7311e86d1d 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -516,11 +516,14 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         QEMU_KVM_ARM_TARGET_NONE
     };
     struct kvm_vcpu_init init = {
-        .features[0] = 0;
+        .features[0] = (1 << KVM_ARM_VCPU_PMU_V3),
     };
 
-    if (!kvm_arm_create_scratch_host_vcpu(cpus_to_try, fdarray, &init)) {
-        return false;
+    if (!kvm_arm_create_scratch_host_vcpu(NULL, fdarray, &init)) {
+        init.features[0] = 0;
+        if (!kvm_arm_create_scratch_host_vcpu(cpus_to_try, fdarray, &init)) {
+            return false;
+        }
     }
 
     ahcf->target = init.target;
@@ -564,8 +567,27 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
                               ARM64_SYS_REG(3, 0, 0, 7, 1));
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr2,
                               ARM64_SYS_REG(3, 0, 0, 7, 2));
-        err |= read_sys_reg64(fdarray[2], &ahcf->isar.reset_pmcr_el0,
-                              ARM64_SYS_REG(3, 3, 9, 12, 0));
+
+        /*
+         * Read PMCR_EL0 from host if PMU feature has been enabled
+         * successfully. Otherwise, the value is set according to
+         * the detected target.
+         */
+        if (init.features[0] & (1 << KVM_ARM_VCPU_PMU_V3)) {
+            err |= read_sys_reg64(fdarray[2], &ahcf->isar.reset_pmcr_el0,
+                                  ARM64_SYS_REG(3, 3, 9, 12, 0));
+        } else {
+            switch (init.target) {
+            case KVM_ARM_TARGET_CORTEX_A53:
+                ahcf->isar.reset_pmcr_el0 = 0x41033000;
+                break;
+            case KVM_ARM_TARGET_CORTEX_A57:
+                ahcf->isar.reset_pmcr_el0 = 0x41013000;
+                break;
+            default:
+                ahcf->isar.reset_pmcr_el0 = 0x41023000;
+            }
+        }
 
         /*
          * Note that if AArch32 support is not present in the host,
-- 
2.23.0


