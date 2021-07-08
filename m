Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 141B23BF34A
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 03:06:59 +0200 (CEST)
Received: from localhost ([::1]:39636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1IVG-0006Gh-2m
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 21:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IKq-00026E-TP
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:12 -0400
Received: from mga12.intel.com ([192.55.52.136]:57606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IKn-0007L7-Ls
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:12 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="189101729"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="189101729"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:58 -0700
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="423770104"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:58 -0700
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com, erdemaktas@google.com
Subject: [RFC PATCH v2 35/44] ioapic: add property to disable level interrupt
Date: Wed,  7 Jul 2021 17:55:05 -0700
Message-Id: <c8a517006ebc5ba992779d336f9090441d955514.1625704981.git.isaku.yamahata@intel.com>
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

According to TDX module spec version 344425-002US [1], VMM can inject
virtual interrupt only via posted interrupt and VMM can't get TDEXIT on
guest EOI to virtual x2APIC.  Because posted interrupt is edge-trigger and
VMM needs to hook guest EOI to re-inject level-triggered interrupt if the
level still active, level-trigger isn't supported for TD Guest VM.

Prevent trigger mode from setting to be level trigger with warning.
Without this guard, qemu can result in unexpected behavior later.

[1] https://software.intel.com/content/dam/develop/external/us/en/documents/tdx-module-1eas-v0.85.039.pdf

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 hw/intc/ioapic.c                  | 20 ++++++++++++++++++++
 hw/intc/ioapic_common.c           | 27 +++++++++++++++++++++++++++
 include/hw/i386/ioapic_internal.h |  1 +
 3 files changed, 48 insertions(+)

diff --git a/hw/intc/ioapic.c b/hw/intc/ioapic.c
index 264262959d..6d61744961 100644
--- a/hw/intc/ioapic.c
+++ b/hw/intc/ioapic.c
@@ -364,6 +364,23 @@ ioapic_fix_edge_remote_irr(uint64_t *entry)
     }
 }
 
+static inline void
+ioapic_fix_level_trigger_unsupported(uint64_t *entry)
+{
+    if ((*entry & IOAPIC_LVT_TRIGGER_MODE) !=
+        IOAPIC_TRIGGER_EDGE << IOAPIC_LVT_TRIGGER_MODE_SHIFT) {
+        /*
+         * ignore a request for level trigger because
+         * level trigger requires eoi intercept to re-inject
+         * interrupt when the level is still active.
+         */
+        warn_report_once("attempting to set level-trigger mode "
+                         "while eoi intercept isn't supported");
+        *entry &= ~IOAPIC_LVT_TRIGGER_MODE;
+        *entry |= IOAPIC_TRIGGER_EDGE << IOAPIC_LVT_TRIGGER_MODE_SHIFT;
+    }
+}
+
 static void
 ioapic_mem_write(void *opaque, hwaddr addr, uint64_t val,
                  unsigned int size)
@@ -404,6 +421,9 @@ ioapic_mem_write(void *opaque, hwaddr addr, uint64_t val,
                 s->ioredtbl[index] &= IOAPIC_RW_BITS;
                 s->ioredtbl[index] |= ro_bits;
                 s->irq_eoi[index] = 0;
+                if (s->level_trigger_unsupported) {
+                    ioapic_fix_level_trigger_unsupported(&s->ioredtbl[index]);
+                }
                 ioapic_fix_edge_remote_irr(&s->ioredtbl[index]);
                 ioapic_service(s);
             }
diff --git a/hw/intc/ioapic_common.c b/hw/intc/ioapic_common.c
index 3cccfc1556..07ee142470 100644
--- a/hw/intc/ioapic_common.c
+++ b/hw/intc/ioapic_common.c
@@ -150,6 +150,32 @@ static int ioapic_dispatch_post_load(void *opaque, int version_id)
     return 0;
 }
 
+static bool ioapic_common_get_level_trigger_unsupported(Object *obj,
+                                                        Error **errp)
+{
+    IOAPICCommonState *s = IOAPIC_COMMON(obj);
+    return s->level_trigger_unsupported;
+}
+
+static void ioapic_common_set_level_trigger_unsupported(Object *obj, bool value,
+                                                       Error **errp)
+{
+    DeviceState *dev = DEVICE(obj);
+    IOAPICCommonState *s = IOAPIC_COMMON(obj);
+    /* only disabling before realize is allowed */
+    assert(!dev->realized);
+    assert(!s->level_trigger_unsupported);
+    s->level_trigger_unsupported = value;
+}
+
+static void ioapic_common_init(Object *obj)
+{
+    object_property_add_bool(obj, "level_trigger_unsupported",
+                             ioapic_common_get_level_trigger_unsupported,
+                             ioapic_common_set_level_trigger_unsupported);
+
+}
+
 static void ioapic_common_realize(DeviceState *dev, Error **errp)
 {
     IOAPICCommonState *s = IOAPIC_COMMON(dev);
@@ -207,6 +233,7 @@ static const TypeInfo ioapic_common_type = {
     .name = TYPE_IOAPIC_COMMON,
     .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(IOAPICCommonState),
+    .instance_init = ioapic_common_init,
     .class_size = sizeof(IOAPICCommonClass),
     .class_init = ioapic_common_class_init,
     .abstract = true,
diff --git a/include/hw/i386/ioapic_internal.h b/include/hw/i386/ioapic_internal.h
index 021e715f11..20f2fc7897 100644
--- a/include/hw/i386/ioapic_internal.h
+++ b/include/hw/i386/ioapic_internal.h
@@ -103,6 +103,7 @@ struct IOAPICCommonState {
     uint32_t irr;
     uint64_t ioredtbl[IOAPIC_NUM_PINS];
     Notifier machine_done;
+    bool level_trigger_unsupported;
     uint8_t version;
     uint64_t irq_count[IOAPIC_NUM_PINS];
     int irq_level[IOAPIC_NUM_PINS];
-- 
2.25.1


