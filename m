Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D29093BF350
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 03:09:29 +0200 (CEST)
Received: from localhost ([::1]:47956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1IXg-0003K4-UE
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 21:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IKq-00025s-S8
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:12 -0400
Received: from mga12.intel.com ([192.55.52.136]:57600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IKp-0007Kk-2Q
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:12 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="189101731"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="189101731"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:59 -0700
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="423770108"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:58 -0700
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com, erdemaktas@google.com
Subject: [RFC PATCH v2 36/44] hw/i386: add eoi_intercept_unsupported member to
 X86MachineState
Date: Wed,  7 Jul 2021 17:55:06 -0700
Message-Id: <d6257e409d9da8e64f0a7d96f36db702d6071f23.1625704981.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625704980.git.isaku.yamahata@intel.com>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=isaku.yamahata@intel.com; helo=mga12.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NML_ADSP_CUSTOM_MED=0.9,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: isaku.yamahata@intel.com, isaku.yamahata@gmail.com, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Isaku Yamahata <isaku.yamahata@intel.com>

Add a new bool member, eoi_intercept_unsupported, to X86MachineState with
default value false.  Set true when tdx kvm type.  Inability to intercept
eoi causes impossibility to emulate level triggered interrupt to be
re-injected when level is still kept active.  which affects interrupt
controller emulation. Such new behavior will be introduced later.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 hw/i386/x86.c         | 1 +
 include/hw/i386/x86.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index ed15f6f2cf..9862fe5bc9 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1311,6 +1311,7 @@ static void x86_machine_initfn(Object *obj)
     x86ms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     x86ms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
     x86ms->bus_lock_ratelimit = 0;
+    x86ms->eoi_intercept_unsupported = false;
 
     object_property_add_str(obj, "kvm-type",
                             x86_get_kvm_type, x86_set_kvm_type);
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index a450b5e226..6eff42550f 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -63,6 +63,7 @@ struct X86MachineState {
     unsigned pci_irq_mask;
     unsigned apic_id_limit;
     uint16_t boot_cpus;
+    bool eoi_intercept_unsupported;
 
     OnOffAuto smm;
     OnOffAuto acpi;
-- 
2.25.1


