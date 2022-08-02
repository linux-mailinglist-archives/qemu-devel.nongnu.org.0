Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 038635878DF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 10:19:22 +0200 (CEST)
Received: from localhost ([::1]:43416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIn7Y-0004UY-QC
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 04:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oIme6-0004ui-My
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:48:55 -0400
Received: from mga11.intel.com ([192.55.52.93]:8325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oIme4-0005nR-Tw
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:48:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659426532; x=1690962532;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kmhWA69w57LCg7xUja5FWRS3kSMpraOl87sSRBpPySg=;
 b=LnQE64ulDA+XsEhIBmfCN7xVgKgfDywsaJ+gZq/de5JOHRjgpiRWMg95
 SXrYqTbn2fJ3iGXeKUPR9yitlR32C/y4HJW9DH2dbC765LWcoXsxGC/Y3
 X1ocRvPtcOpcBO3a83zQE9190UpFVtNMSx/9+NMMTaOGZryU51XnkAnbk
 +UNm8SiT2z/5EJRkEewIUW27QZlmwjrB2USklNeJ2pKIeVfOu99Itqqfi
 eFMI5q8UAmESKxEAqhxdnOw31k1higPHlNuDyx28MCQkPgWRKvE1kgDsT
 qKVyZv2XDKn8cASfjlWdTy/18OZLovf2GBv4eFllaVEdkPhcTKgpNkDd9 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="286908569"
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="286908569"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 00:48:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="630603974"
Received: from lxy-dell.sh.intel.com ([10.239.48.38])
 by orsmga008.jf.intel.com with ESMTP; 02 Aug 2022 00:48:47 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>
Cc: Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com,
 xiaoyao.li@intel.com
Subject: [PATCH v1 13/40] KVM: Introduce kvm_arch_pre_create_vcpu()
Date: Tue,  2 Aug 2022 15:47:23 +0800
Message-Id: <20220802074750.2581308-14-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220802074750.2581308-1-xiaoyao.li@intel.com>
References: <20220802074750.2581308-1-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=xiaoyao.li@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce kvm_arch_pre_create_vcpu(), to perform arch-dependent
work prior to create any vcpu. This is for i386 TDX because it needs
call TDX_INIT_VM before creating any vcpu.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 accel/kvm/kvm-all.c  | 12 ++++++++++++
 include/sysemu/kvm.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 46e609570ce1..c26d602f5476 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -460,6 +460,11 @@ static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id)
     return kvm_vm_ioctl(s, KVM_CREATE_VCPU, (void *)vcpu_id);
 }
 
+int __attribute__ ((weak)) kvm_arch_pre_create_vcpu(CPUState *cpu)
+{
+    return 0;
+}
+
 int kvm_init_vcpu(CPUState *cpu, Error **errp)
 {
     KVMState *s = kvm_state;
@@ -468,6 +473,13 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
 
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
index efd6dee818f2..e3159e1e711d 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -373,6 +373,7 @@ int kvm_arch_put_registers(CPUState *cpu, int level);
 
 int kvm_arch_init(MachineState *ms, KVMState *s);
 
+int kvm_arch_pre_create_vcpu(CPUState *cpu);
 int kvm_arch_init_vcpu(CPUState *cpu);
 int kvm_arch_destroy_vcpu(CPUState *cpu);
 
-- 
2.27.0


