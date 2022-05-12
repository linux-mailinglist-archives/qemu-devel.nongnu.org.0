Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F38524396
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 05:44:42 +0200 (CEST)
Received: from localhost ([::1]:48332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nozkn-0001qn-MI
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 23:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nozNe-0005Vw-E6
 for qemu-devel@nongnu.org; Wed, 11 May 2022 23:20:47 -0400
Received: from mga11.intel.com ([192.55.52.93]:31268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nozNc-0003Hj-7s
 for qemu-devel@nongnu.org; Wed, 11 May 2022 23:20:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652325644; x=1683861644;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R5Ef0mDkZ5Gj59MHMhyQ50BAz0gPGfvcV/a/8mz85gw=;
 b=ZWD2FH8xI9kpe3uRoVkP6Cxd/mw0dxqiuoIEpSPLgsauZhT0oLOas9q1
 9KIMV6QEsEAfWIISLmGk4GlseJIDFpPQHCFlnkVcafWs0i1nPkzdZf3Of
 7p13SyfhPNSNkQMK6sg2wwpqdLySRs7qH0w7RAjA1altHwSu7M02qJJs4
 FbBZsl4s2e3lhppkat58ddjc7GC5unPGaQtfzuQNK2rRfLTIiA6X924An
 IMwJqHr7MTxBlWn88BIY9CUag/+jD06DnMNBxrVehyQXQgMRt5Yt6jlOe
 6Ic57GnbmWhY/+Gb4l8r2UUm28OO+bk68PKGsRs+1J5tTRUGqDpAOQnr8 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="267461366"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="267461366"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 20:20:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="594456650"
Received: from lxy-dell.sh.intel.com ([10.239.159.55])
 by orsmga008.jf.intel.com with ESMTP; 11 May 2022 20:20:30 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>, isaku.yamahata@intel.com,
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
Subject: [RFC PATCH v4 30/36] hw/i386: add eoi_intercept_unsupported member to
 X86MachineState
Date: Thu, 12 May 2022 11:17:57 +0800
Message-Id: <20220512031803.3315890-31-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220512031803.3315890-1-xiaoyao.li@intel.com>
References: <20220512031803.3315890-1-xiaoyao.li@intel.com>
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

Add a new bool member, eoi_intercept_unsupported, to X86MachineState
with default value false. Set true for TDX VM.

Inability to intercept eoi causes impossibility to emulate level
triggered interrupt to be re-injected when level is still kept active.
which affects interrupt controller emulation.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 hw/i386/x86.c         | 1 +
 include/hw/i386/x86.h | 1 +
 target/i386/kvm/tdx.c | 2 ++
 3 files changed, 4 insertions(+)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 17f2252296c5..182ec544611b 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1365,6 +1365,7 @@ static void x86_machine_initfn(Object *obj)
     x86ms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     x86ms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
     x86ms->bus_lock_ratelimit = 0;
+    x86ms->eoi_intercept_unsupported = false;
 }
 
 static void x86_machine_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 9089bdd99c3a..5bf91dd934db 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -58,6 +58,7 @@ struct X86MachineState {
 
     /* CPU and apic information: */
     bool apic_xrupt_override;
+    bool eoi_intercept_unsupported;
     unsigned pci_irq_mask;
     unsigned apic_id_limit;
     uint16_t boot_cpus;
diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
index 59c7aa8f1818..583fda52de5f 100644
--- a/target/i386/kvm/tdx.c
+++ b/target/i386/kvm/tdx.c
@@ -340,6 +340,8 @@ int tdx_kvm_init(MachineState *ms, Error **errp)
         return -EINVAL;
     }
 
+    x86ms->eoi_intercept_unsupported = true;
+
     if (!tdx_caps) {
         get_tdx_capabilities();
     }
-- 
2.27.0


