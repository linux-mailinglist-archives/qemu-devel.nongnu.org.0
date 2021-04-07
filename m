Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D9735612D
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 04:03:24 +0200 (CEST)
Received: from localhost ([::1]:41878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTxXP-0007be-7Q
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 22:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lTxVW-0006fL-9M
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 22:01:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lTxVS-0003VW-RL
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 22:01:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617760880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EpSlBYg3bRq/5OZEEnPJ1d/5ybos372G0BQnWdecVVI=;
 b=ZdKYGTZ1iSMoukYdFbyQ+/Ie+5snZFhHJ+YSfMcZK0kV1htRhUIFouzkMAyZGul7v77kpW
 3J4rn2cInk7twSs7BkUG5gDjfmHP4Qe0YEbpVP4jdEOjiE8S5Vm0RIJtRQEUn3ngorRYth
 ax0o5MUAd29Q/jwOSUxtZgLf8zm0Pgo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-poi8vdTmNUuTdWaH6W2psQ-1; Tue, 06 Apr 2021 22:01:18 -0400
X-MC-Unique: poi8vdTmNUuTdWaH6W2psQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B8891084C8C;
 Wed,  7 Apr 2021 02:01:17 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-160.bne.redhat.com [10.64.54.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 818315D743;
 Wed,  7 Apr 2021 02:01:14 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 1/2] target/arm: Needn't validate the target in scratch host
Date: Wed,  7 Apr 2021 12:00:59 +0800
Message-Id: <20210407040100.9933-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=gshan@redhat.com;
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

@init->target is always -1 and preferred target is retrieved from
host when @init isn't NULL in kvm_arm_create_scratch_host_vcpu().
So we can have the assumption that preferred target retrived from
host is tried prior to the specified target list.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/arm/kvm.c   | 15 ++++-----------
 target/arm/kvm64.c | 12 +++++-------
 2 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index d8381ba224..3141d5d313 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -69,6 +69,7 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
                                       int *fdarray,
                                       struct kvm_vcpu_init *init)
 {
+    struct kvm_vcpu_init try;
     int ret = 0, kvmfd = -1, vmfd = -1, cpufd = -1;
 
     kvmfd = qemu_open_old("/dev/kvm", O_RDWR);
@@ -89,15 +90,9 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
         goto finish;
     }
 
-    if (init->target == -1) {
-        struct kvm_vcpu_init preferred;
-
-        ret = ioctl(vmfd, KVM_ARM_PREFERRED_TARGET, &preferred);
-        if (!ret) {
-            init->target = preferred.target;
-        }
-    }
-    if (ret >= 0) {
+    ret = ioctl(vmfd, KVM_ARM_PREFERRED_TARGET, &try);
+    if (!ret) {
+        init->target = try.target;
         ret = ioctl(cpufd, KVM_ARM_VCPU_INIT, init);
         if (ret < 0) {
             goto err;
@@ -108,8 +103,6 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
          * creating one kind of guest CPU which is its preferred
          * CPU type.
          */
-        struct kvm_vcpu_init try;
-
         while (*cpus_to_try != QEMU_KVM_ARM_TARGET_NONE) {
             try.target = *cpus_to_try++;
             memcpy(try.features, init->features, sizeof(init->features));
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 581335e49d..79800f00a7 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -515,11 +515,9 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         KVM_ARM_TARGET_CORTEX_A57,
         QEMU_KVM_ARM_TARGET_NONE
     };
-    /*
-     * target = -1 informs kvm_arm_create_scratch_host_vcpu()
-     * to use the preferred target
-     */
-    struct kvm_vcpu_init init = { .target = -1, };
+    struct kvm_vcpu_init init = {
+        .features[0] = 0;
+    };
 
     if (!kvm_arm_create_scratch_host_vcpu(cpus_to_try, fdarray, &init)) {
         return false;
@@ -742,8 +740,7 @@ void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map)
      */
     if (!probed) {
         struct kvm_vcpu_init init = {
-            .target = -1,
-            .features[0] = (1 << KVM_ARM_VCPU_SVE),
+            .features[0] = 0,
         };
         struct kvm_one_reg reg = {
             .id = KVM_REG_ARM64_SVE_VLS,
@@ -753,6 +750,7 @@ void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map)
 
         probed = true;
 
+        init.features[0] = (1 << KVM_ARM_VCPU_SVE);
         if (!kvm_arm_create_scratch_host_vcpu(NULL, fdarray, &init)) {
             error_report("failed to create scratch VCPU with SVE enabled");
             abort();
-- 
2.23.0


