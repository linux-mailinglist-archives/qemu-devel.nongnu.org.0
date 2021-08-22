Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F083F4026
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 16:47:51 +0200 (CEST)
Received: from localhost ([::1]:53400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHolF-0007Vh-AP
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 10:47:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1mHoih-0005Qw-6m
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 10:45:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:50802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1mHoid-0002Ib-Tx
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 10:45:06 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6F14F61247;
 Sun, 22 Aug 2021 14:45:01 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=hot-poop.lan)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1mHoiZ-006VES-Ky; Sun, 22 Aug 2021 15:44:59 +0100
From: Marc Zyngier <maz@kernel.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/arm/virt: KVM: Probe for KVM_CAP_ARM_VM_IPA_SIZE when
 creating scratch VM
Date: Sun, 22 Aug 2021 15:44:39 +0100
Message-Id: <20210822144441.1290891-2-maz@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210822144441.1290891-1-maz@kernel.org>
References: <20210822144441.1290891-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: qemu-devel@nongnu.org, drjones@redhat.com,
 eric.auger@redhat.com, peter.maydell@linaro.org, kvmarm@lists.cs.columbia.edu,
 kvm@vger.kernel.org, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Received-SPF: pass client-ip=198.145.29.99; envelope-from=maz@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>,
 kernel-team@android.com, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Although we probe for the IPA limits imposed by KVM (and the hardware)
when computing the memory map, we still use the old style '0' when
creating a scratch VM in kvm_arm_create_scratch_host_vcpu().

On systems that are severely IPA challenged (such as the Apple M1),
this results in a failure as KVM cannot use the default 40bit that
'0' represents.

Instead, probe for the extension and use the reported IPA limit
if available.

Cc: Andrew Jones <drjones@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 target/arm/kvm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index d8381ba224..cc3371a99b 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -70,12 +70,17 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
                                       struct kvm_vcpu_init *init)
 {
     int ret = 0, kvmfd = -1, vmfd = -1, cpufd = -1;
+    int max_vm_pa_size;
 
     kvmfd = qemu_open_old("/dev/kvm", O_RDWR);
     if (kvmfd < 0) {
         goto err;
     }
-    vmfd = ioctl(kvmfd, KVM_CREATE_VM, 0);
+    max_vm_pa_size = ioctl(kvmfd, KVM_CHECK_EXTENSION, KVM_CAP_ARM_VM_IPA_SIZE);
+    if (max_vm_pa_size < 0) {
+        max_vm_pa_size = 0;
+    }
+    vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
     if (vmfd < 0) {
         goto err;
     }
-- 
2.30.2


