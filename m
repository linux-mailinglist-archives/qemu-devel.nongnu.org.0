Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE04A4DC8D0
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 15:32:56 +0100 (CET)
Received: from localhost ([::1]:40784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUrBP-0003rZ-Qu
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 10:32:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nUqgb-0000cu-Ev
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 10:01:09 -0400
Received: from mga12.intel.com ([192.55.52.136]:25019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nUqgZ-0004LN-Gn
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 10:01:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647525663; x=1679061663;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/qTfHzbQ7Js7epycg8meh7h+jZZHKsMGM8Fx6fShEHQ=;
 b=CrWiQyyXDeMm7l79xX/378wZ5cagzU8cmTaImtvQTn1WxjlSdr5cBHQ9
 yN2pZtDfRuXllC+0P9G3RV6/Vwjyvp0gBCZMbFxogYcJ3s33gK9FTbQ06
 BffT649KSmx7NiGVzvQRmoaOvqYdXZDMjTECMzaZ+WwEU4/c2BpijOPJa
 9TCcKLbCtiJV3ReW6N7l7c5tuXMa1rXuN4hguuC9nnbrMA9p8OEFWvFWb
 KtNOowrdPYP9bXKKIzp6sC1e+OGlJ29ATVBJ5TetxW1z3hgXzbQOJaEsW
 cJu4IeTId8manOgvjOBc+bDO0VULSDTvXKYhco9wYCM1pk3DSeAhFScgs w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="236816910"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="236816910"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 07:00:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="541378215"
Received: from lxy-dell.sh.intel.com ([10.239.159.55])
 by orsmga007.jf.intel.com with ESMTP; 17 Mar 2022 07:00:21 -0700
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
Subject: [RFC PATCH v3 15/36] i386/tdx: Implement user specified tsc frequency
Date: Thu, 17 Mar 2022 21:58:52 +0800
Message-Id: <20220317135913.2166202-16-xiaoyao.li@intel.com>
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

Reuse "-cpu,tsc-frequency=" to get user wanted tsc frequency and pass it
to KVM_TDX_INIT_VM.

Besides, sanity check the tsc frequency to be in the legal range and
legal granularity (required by TDX module).

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 target/i386/kvm/kvm.c |  8 ++++++++
 target/i386/kvm/tdx.c | 18 ++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index f2d71359b59d..4a8b6e2c8797 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -806,6 +806,14 @@ static int kvm_arch_set_tsc_khz(CPUState *cs)
     int r, cur_freq;
     bool set_ioctl = false;
 
+    /*
+     * TD guest's TSC is immutable, it cannot be set/changed via
+     * KVM_SET_TSC_KHZ, but only be initialized via KVM_TDX_INIT_VM
+     */
+    if (is_tdx_vm()) {
+        return 0;
+    }
+
     if (!env->tsc_khz) {
         return 0;
     }
diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
index a76c41fe5724..94a9c1ea7e9c 100644
--- a/target/i386/kvm/tdx.c
+++ b/target/i386/kvm/tdx.c
@@ -26,6 +26,9 @@
 #define TDX_TD_ATTRIBUTES_PKS               BIT_ULL(30)
 #define TDX_TD_ATTRIBUTES_PERFMON           BIT_ULL(63)
 
+#define TDX_MIN_TSC_FREQUENCY_KHZ   (100 * 1000)
+#define TDX_MAX_TSC_FREQUENCY_KHZ   (10 * 1000 * 1000)
+
 static TdxGuest *tdx_guest;
 
 /* It's valid after kvm_confidential_guest_init()->kvm_tdx_init() */
@@ -209,6 +212,20 @@ int tdx_pre_create_vcpu(CPUState *cpu)
         goto out;
     }
 
+    r = -EINVAL;
+    if (env->tsc_khz && (env->tsc_khz < TDX_MIN_TSC_FREQUENCY_KHZ ||
+                         env->tsc_khz > TDX_MAX_TSC_FREQUENCY_KHZ)) {
+        error_report("Invalid TSC %ld KHz, must specify cpu_frequency between [%d, %d] kHz",
+                      env->tsc_khz, TDX_MIN_TSC_FREQUENCY_KHZ,
+                      TDX_MAX_TSC_FREQUENCY_KHZ);
+        goto out;
+    }
+
+    if (env->tsc_khz % (25 * 1000)) {
+        error_report("Invalid TSC %ld KHz, it must be multiple of 25MHz", env->tsc_khz);
+        goto out;
+    }
+
     r = setup_td_guest_attributes(x86cpu);
     if (r) {
         goto out;
@@ -219,6 +236,7 @@ int tdx_pre_create_vcpu(CPUState *cpu)
 
     init_vm.cpuid = (__u64)(&cpuid_data);
     init_vm.max_vcpus = ms->smp.cpus;
+    init_vm.tsc_khz = env->tsc_khz;
     init_vm.attributes = tdx_guest->attributes;
 
     r = tdx_vm_ioctl(KVM_TDX_INIT_VM, 0, &init_vm);
-- 
2.27.0


