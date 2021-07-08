Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2613BF36C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 03:18:47 +0200 (CEST)
Received: from localhost ([::1]:53520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Igg-0000eY-H5
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 21:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1ILA-0002nk-9U
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:32 -0400
Received: from mga12.intel.com ([192.55.52.136]:57600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IL5-0007Kk-Ol
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:31 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="189101742"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="189101742"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:59 -0700
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="423770123"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:59 -0700
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com, erdemaktas@google.com
Subject: [RFC PATCH v2 41/44] ioapic: add property to disallow INIT/SIPI
 delivery mode
Date: Wed,  7 Jul 2021 17:55:11 -0700
Message-Id: <a48dcb44623ece9ad543583d7e76c24885ca0c93.1625704981.git.isaku.yamahata@intel.com>
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

Add a property to prevent ioapic from setting INIT/SIPI delivery mode.
Without this guard, qemu can result in unexpected behavior.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 hw/intc/ioapic.c                  | 19 +++++++++++++++++++
 hw/intc/ioapic_common.c           | 21 +++++++++++++++++++++
 include/hw/i386/ioapic_internal.h |  1 +
 3 files changed, 41 insertions(+)

diff --git a/hw/intc/ioapic.c b/hw/intc/ioapic.c
index 1815fbd282..f7eb9f7146 100644
--- a/hw/intc/ioapic.c
+++ b/hw/intc/ioapic.c
@@ -396,6 +396,22 @@ ioapic_fix_smi_unsupported(uint64_t *entry)
     }
 }
 
+static inline void
+ioapic_fix_init_sipi_unsupported(uint64_t *entry)
+{
+    uint64_t delmode = *entry & IOAPIC_LVT_DELIV_MODE;
+    if (delmode == IOAPIC_DM_INIT << IOAPIC_LVT_DELIV_MODE_SHIFT ||
+        delmode == IOAPIC_DM_SIPI << IOAPIC_LVT_DELIV_MODE_SHIFT) {
+        /*
+         * ignore a request for delivery mode of lowest SMI
+         */
+        warn_report_once("attempting to set delivery mode to INIT/SIPI"
+                         "which is not supported");
+        *entry &= ~IOAPIC_LVT_DELIV_MODE;
+        *entry |= IOAPIC_DM_FIXED << IOAPIC_LVT_DELIV_MODE_SHIFT;
+    }
+}
+
 static void
 ioapic_mem_write(void *opaque, hwaddr addr, uint64_t val,
                  unsigned int size)
@@ -442,6 +458,9 @@ ioapic_mem_write(void *opaque, hwaddr addr, uint64_t val,
                 if (s->smi_unsupported) {
                     ioapic_fix_smi_unsupported(&s->ioredtbl[index]);
                 }
+                if (s->init_sipi_unsupported) {
+                    ioapic_fix_init_sipi_unsupported(&s->ioredtbl[index]);
+                }
                 ioapic_fix_edge_remote_irr(&s->ioredtbl[index]);
                 ioapic_service(s);
             }
diff --git a/hw/intc/ioapic_common.c b/hw/intc/ioapic_common.c
index b8ef7efbad..018bacbf96 100644
--- a/hw/intc/ioapic_common.c
+++ b/hw/intc/ioapic_common.c
@@ -185,6 +185,23 @@ static void ioapic_common_set_smi_unsupported(Object *obj, bool value,
     s->smi_unsupported = value;
 }
 
+static bool ioapic_common_get_init_sipi_unsupported(Object *obj, Error **errp)
+{
+    IOAPICCommonState *s = IOAPIC_COMMON(obj);
+    return s->init_sipi_unsupported;
+}
+
+static void ioapic_common_set_init_sipi_unsupported(Object *obj, bool value,
+                                                       Error **errp)
+{
+    DeviceState *dev = DEVICE(obj);
+    IOAPICCommonState *s = IOAPIC_COMMON(obj);
+    /* only disabling before realize is allowed */
+    assert(!dev->realized);
+    assert(!s->init_sipi_unsupported);
+    s->init_sipi_unsupported = value;
+}
+
 static void ioapic_common_init(Object *obj)
 {
     object_property_add_bool(obj, "level_trigger_unsupported",
@@ -194,6 +211,10 @@ static void ioapic_common_init(Object *obj)
     object_property_add_bool(obj, "smi_unsupported",
                              ioapic_common_get_smi_unsupported,
                              ioapic_common_set_smi_unsupported);
+
+    object_property_add_bool(obj, "init_sipi_unsupported",
+                             ioapic_common_get_init_sipi_unsupported,
+                             ioapic_common_set_init_sipi_unsupported);
 }
 
 static void ioapic_common_realize(DeviceState *dev, Error **errp)
diff --git a/include/hw/i386/ioapic_internal.h b/include/hw/i386/ioapic_internal.h
index 46f22a4f85..634b97426d 100644
--- a/include/hw/i386/ioapic_internal.h
+++ b/include/hw/i386/ioapic_internal.h
@@ -105,6 +105,7 @@ struct IOAPICCommonState {
     Notifier machine_done;
     bool level_trigger_unsupported;
     bool smi_unsupported;
+    bool init_sipi_unsupported;
     uint8_t version;
     uint64_t irq_count[IOAPIC_NUM_PINS];
     int irq_level[IOAPIC_NUM_PINS];
-- 
2.25.1


