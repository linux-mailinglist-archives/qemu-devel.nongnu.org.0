Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA43A3D9E06
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 09:06:07 +0200 (CEST)
Received: from localhost ([::1]:46538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m907K-0007SQ-Ut
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 03:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m903E-00044n-JD; Thu, 29 Jul 2021 03:01:52 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:41731 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m903C-0002mg-Ju; Thu, 29 Jul 2021 03:01:52 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Gb1fY1m6nz9sjD; Thu, 29 Jul 2021 17:01:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1627542101;
 bh=Jl6xuoP214Fxa/VVS1LDGZ3xPuBsuF5l+i5Y/s+dhDk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mE3RQTx0zjzQxbTafGOQvBxfXhRX3Mf1zhPJmzFzCDIpDlW6impv+a1w8+pVWXMGY
 VTkkhwtrS0Oiux+YRG4MYIMf/ccTNerXdeu9nJP4LMr9nF8q458OpUaFE+f6iwV7T9
 nW8sBTrddP81HpuU8Z83BTwkA/HSSdhil0W7ZU2M=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 5/5] kvm: ppc: Print meaningful message on KVM_CREATE_VM failure
Date: Thu, 29 Jul 2021 17:01:35 +1000
Message-Id: <20210729070135.422262-6-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210729070135.422262-1-david@gibson.dropbear.id.au>
References: <20210729070135.422262-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, qemu-ppc@nongnu.org, groug@kaod.org,
 David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

PowerPC has two KVM types (HV, PR) that translate into three kernel
modules:

kvm.ko - common kvm code
kvm_hv.ko - kvm running with MSR_HV=1 or MSR_HV|PR=0 in a nested guest.
kvm_pr.ko - kvm running in usermode MSR_PR=1.

Since the two KVM types can both be running at the same time, this
creates a situation in which it is possible for one or both of the
modules to fail to initialize, leaving the generic one behind. This
leads QEMU to think it can create a guest, but KVM will fail when
calling the type-specific code:

 ioctl(KVM_CREATE_VM) failed: 22 Invalid argument
 qemu-kvm: failed to initialize KVM: Invalid argument

Ideally this would be solved kernel-side, but it might be a while
until we can get rid of one of the modules. So in the meantime this
patch tries to make this less confusing for the end user by adding a
more elucidative message:

 ioctl(KVM_CREATE_VM) failed: 22 Invalid argument
 PPC KVM module is not loaded. Try 'modprobe kvm_hv'.

[dwg: Fixed error in #elif which failed compile on !ppc hosts]
Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20210722141340.2367905-1-farosas@linux.ibm.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 accel/kvm/kvm-all.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index e5b10dd129..0125c17edb 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2397,6 +2397,12 @@ static int kvm_init(MachineState *ms)
                     "- for kernels supporting the vm.allocate_pgste sysctl, "
                     "whether it is enabled\n");
         }
+#elif defined(TARGET_PPC)
+        if (ret == -EINVAL) {
+            fprintf(stderr,
+                    "PPC KVM module is not loaded. Try modprobe kvm_%s.\n",
+                    (type == 2) ? "pr" : "hv");
+        }
 #endif
         goto err;
     }
-- 
2.31.1


