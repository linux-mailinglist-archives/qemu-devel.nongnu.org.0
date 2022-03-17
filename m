Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B564DC867
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 15:09:50 +0100 (CET)
Received: from localhost ([::1]:58376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUqp2-0001Lc-QG
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 10:09:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nUqfd-00007g-VQ
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 10:00:06 -0400
Received: from mga12.intel.com ([192.55.52.136]:24910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nUqfa-00040f-VF
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 10:00:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647525602; x=1679061602;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a1ryONR5l3FOW34yLvx4vmx62tCL+BziXbr83jqcf20=;
 b=W/jeSUr+STA/UC9M+0wcRRLWhqM4uTgItZUFvdwxxH8Yhx/xUfrNoRyw
 NPlFEpJma3klyEpXCUug6tNF7LRdSxmxeT0mzVPneuwXTLO7G4cmGT/PN
 wmDXMkomuAFGSnmbtfhUKUwGa6gHFtucmnc+7Y7/Q/VWJ3gvkaDMhH/Wd
 qx+lC3JVKFcqRPN6tfJBK0K45hgDlcPHnvXNDCMiEnRCK5JjPGcQpvk2b
 cgzUJC9LO+fF0ft7G5eHc0/FYjfyUMoH7JkWjoPvJRcGAThk2jC0clg01
 Uh6ha484FVOhcw6ntdJWA7XE0gh+NTJ6dTneCaXD5mpn+CkDc1L1xyCoS A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="236816736"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="236816736"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 06:59:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="541377942"
Received: from lxy-dell.sh.intel.com ([10.239.159.55])
 by orsmga007.jf.intel.com with ESMTP; 17 Mar 2022 06:59:54 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [RFC PATCH v3 09/36] KVM: Introduce kvm_arch_pre_create_vcpu()
Date: Thu, 17 Mar 2022 21:58:46 +0800
Message-Id: <20220317135913.2166202-10-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220317135913.2166202-1-xiaoyao.li@intel.com>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=xiaoyao.li@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: isaku.yamahata@intel.com, kvm@vger.kernel.org,
 Connor Kuehl <ckuehl@redhat.com>, seanjc@google.com, xiaoyao.li@intel.com,
 qemu-devel@nongnu.org, erdemaktas@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce kvm_arch_pre_create_vcpu(), to perform arch-dependent
work prior to create any vcpu. This is for i386 TDX because it needs
call TDX_INIT_VM before creating any vcpu.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 accel/kvm/kvm-all.c    | 7 +++++++
 include/sysemu/kvm.h   | 1 +
 target/arm/kvm64.c     | 5 +++++
 target/i386/kvm/kvm.c  | 5 +++++
 target/mips/kvm.c      | 5 +++++
 target/ppc/kvm.c       | 5 +++++
 target/s390x/kvm/kvm.c | 5 +++++
 7 files changed, 33 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 27864dfaeaaa..a4bb449737a6 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -465,6 +465,13 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
 
     trace_kvm_init_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
 
+    ret = kvm_arch_pre_create_vcpu(cpu);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret,
+                         "kvm_init_vcpu: kvm_arch_pre_create_vcpu() failed");
+        goto err;
+    }
+
     ret = kvm_get_vcpu(s, kvm_arch_vcpu_id(cpu));
     if (ret < 0) {
         error_setg_errno(errp, -ret, "kvm_init_vcpu: kvm_get_vcpu failed (%lu)",
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index a783c7886811..0e94031ab7c7 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -373,6 +373,7 @@ int kvm_arch_put_registers(CPUState *cpu, int level);
 
 int kvm_arch_init(MachineState *ms, KVMState *s);
 
+int kvm_arch_pre_create_vcpu(CPUState *cpu);
 int kvm_arch_init_vcpu(CPUState *cpu);
 int kvm_arch_destroy_vcpu(CPUState *cpu);
 
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index ccadfbbe72be..ae7336851c62 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -935,6 +935,11 @@ int kvm_arch_init_vcpu(CPUState *cs)
     return kvm_arm_init_cpreg_list(cpu);
 }
 
+int kvm_arch_pre_create_vcpu(CPUState *cpu)
+{
+    return 0;
+}
+
 int kvm_arch_destroy_vcpu(CPUState *cs)
 {
     return 0;
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index ddbe8f64fadb..7bd5589e1e6c 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2102,6 +2102,11 @@ int kvm_arch_init_vcpu(CPUState *cs)
     return r;
 }
 
+int kvm_arch_pre_create_vcpu(CPUState *cpu)
+{
+    return 0;
+}
+
 int kvm_arch_destroy_vcpu(CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
diff --git a/target/mips/kvm.c b/target/mips/kvm.c
index 086debd9f013..0647fe7c654a 100644
--- a/target/mips/kvm.c
+++ b/target/mips/kvm.c
@@ -92,6 +92,11 @@ int kvm_arch_init_vcpu(CPUState *cs)
     return ret;
 }
 
+int kvm_arch_pre_create_vcpu(CPUState *cpu)
+{
+    return 0;
+}
+
 int kvm_arch_destroy_vcpu(CPUState *cs)
 {
     return 0;
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index dc93b99189ea..c14a20b80f12 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -507,6 +507,11 @@ int kvm_arch_init_vcpu(CPUState *cs)
     return ret;
 }
 
+int kvm_arch_pre_create_vcpu(CPUState *cpu)
+{
+    return 0;
+}
+
 int kvm_arch_destroy_vcpu(CPUState *cs)
 {
     return 0;
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 6acf14d5ecb4..8170c5fad0b8 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -405,6 +405,11 @@ int kvm_arch_init_vcpu(CPUState *cs)
     return 0;
 }
 
+int kvm_arch_pre_create_vcpu(CPUState *cpu)
+{
+    return 0;
+}
+
 int kvm_arch_destroy_vcpu(CPUState *cs)
 {
     S390CPU *cpu = S390_CPU(cs);
-- 
2.27.0


