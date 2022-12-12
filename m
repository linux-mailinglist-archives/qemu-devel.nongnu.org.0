Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FC96499CE
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 08:56:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4dfa-0004jg-RE; Mon, 12 Dec 2022 02:56:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p4dfX-0004jA-JR
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 02:56:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p4dfV-000549-EH
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 02:56:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670831768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HYPkZMk2nchnwW8jbnkCU90WNWY7L1a37gi6WEiP6+Q=;
 b=AdcToQCKd4BIOMKGYJ7+YjKIphjAOBLNanLgzThItcFdfh9FSeviZ4JXJINS4zklFmbV0I
 i2RQp9BFiMOpLrdfrpEhERvRgBMBpkAwzVTfF5IP5qRZOKqz8EW0CrbPLVIcRM6ujjSz/G
 eLQc2elKmRAhN/ncAhpx/Nl2QM56i9g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98-i-iKwhx9PiuuzX9liobSog-1; Mon, 12 Dec 2022 02:56:07 -0500
X-MC-Unique: i-iKwhx9PiuuzX9liobSog-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5FA5806004;
 Mon, 12 Dec 2022 07:56:06 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A34D492C14;
 Mon, 12 Dec 2022 07:56:04 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Michael S Tsirkin <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v3] hw/rtc/mc146818rtc: Make this rtc device target independent
Date: Mon, 12 Dec 2022 08:56:00 +0100
Message-Id: <20221212075600.17408-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The only reason for this code being target dependent is the apic-related
code in rtc_policy_slew_deliver_irq(). Since these apic functions are rather
simple, we can easily move them into a new, separate file (apic_irqcount.c)
which will always be compiled and linked if either APIC or the mc146818 device
are required. This way we can get rid of the #ifdef TARGET_I386 switches in
mc146818rtc.c and declare it in the softmmu_ss instead of specific_ss, so
that the code only gets compiled once for all targets.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v3: Move TYPE_APIC_COMMON from apic_internal.h to apic.h and use it

 include/hw/i386/apic.h          |  2 ++
 include/hw/i386/apic_internal.h |  2 --
 include/hw/rtc/mc146818rtc.h    |  1 +
 hw/intc/apic_common.c           | 27 -----------------
 hw/intc/apic_irqcount.c         | 53 +++++++++++++++++++++++++++++++++
 hw/rtc/mc146818rtc.c            | 25 +++++-----------
 hw/intc/meson.build             |  6 +++-
 hw/rtc/meson.build              |  3 +-
 8 files changed, 69 insertions(+), 50 deletions(-)
 create mode 100644 hw/intc/apic_irqcount.c

diff --git a/include/hw/i386/apic.h b/include/hw/i386/apic.h
index da1d2fe155..24069fb961 100644
--- a/include/hw/i386/apic.h
+++ b/include/hw/i386/apic.h
@@ -1,6 +1,7 @@
 #ifndef APIC_H
 #define APIC_H
 
+#define TYPE_APIC_COMMON "apic-common"
 
 /* apic.c */
 void apic_deliver_irq(uint8_t dest, uint8_t dest_mode, uint8_t delivery_mode,
@@ -9,6 +10,7 @@ int apic_accept_pic_intr(DeviceState *s);
 void apic_deliver_pic_intr(DeviceState *s, int level);
 void apic_deliver_nmi(DeviceState *d);
 int apic_get_interrupt(DeviceState *s);
+void apic_report_irq_delivered(int delivered);
 void apic_reset_irq_delivered(void);
 int apic_get_irq_delivered(void);
 void cpu_set_apic_base(DeviceState *s, uint64_t val);
diff --git a/include/hw/i386/apic_internal.h b/include/hw/i386/apic_internal.h
index c175e7e718..ff018f1778 100644
--- a/include/hw/i386/apic_internal.h
+++ b/include/hw/i386/apic_internal.h
@@ -125,7 +125,6 @@
 
 typedef struct APICCommonState APICCommonState;
 
-#define TYPE_APIC_COMMON "apic-common"
 typedef struct APICCommonClass APICCommonClass;
 DECLARE_OBJ_CHECKERS(APICCommonState, APICCommonClass,
                      APIC_COMMON, TYPE_APIC_COMMON)
@@ -199,7 +198,6 @@ typedef struct VAPICState {
 
 extern bool apic_report_tpr_access;
 
-void apic_report_irq_delivered(int delivered);
 bool apic_next_timer(APICCommonState *s, int64_t current_time);
 void apic_enable_tpr_access_reporting(DeviceState *d, bool enable);
 void apic_enable_vapic(DeviceState *d, hwaddr paddr);
diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc.h
index 1db0fcee92..45bcd6f040 100644
--- a/include/hw/rtc/mc146818rtc.h
+++ b/include/hw/rtc/mc146818rtc.h
@@ -55,5 +55,6 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base_year,
                              qemu_irq intercept_irq);
 void rtc_set_memory(ISADevice *dev, int addr, int val);
 int rtc_get_memory(ISADevice *dev, int addr);
+void qmp_rtc_reset_reinjection(Error **errp);
 
 #endif /* HW_RTC_MC146818RTC_H */
diff --git a/hw/intc/apic_common.c b/hw/intc/apic_common.c
index 2a20982066..b0f85f9384 100644
--- a/hw/intc/apic_common.c
+++ b/hw/intc/apic_common.c
@@ -33,7 +33,6 @@
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 
-static int apic_irq_delivered;
 bool apic_report_tpr_access;
 
 void cpu_set_apic_base(DeviceState *dev, uint64_t val)
@@ -122,32 +121,6 @@ void apic_handle_tpr_access_report(DeviceState *dev, target_ulong ip,
     vapic_report_tpr_access(s->vapic, CPU(s->cpu), ip, access);
 }
 
-void apic_report_irq_delivered(int delivered)
-{
-    apic_irq_delivered += delivered;
-
-    trace_apic_report_irq_delivered(apic_irq_delivered);
-}
-
-void apic_reset_irq_delivered(void)
-{
-    /* Copy this into a local variable to encourage gcc to emit a plain
-     * register for a sys/sdt.h marker.  For details on this workaround, see:
-     * https://sourceware.org/bugzilla/show_bug.cgi?id=13296
-     */
-    volatile int a_i_d = apic_irq_delivered;
-    trace_apic_reset_irq_delivered(a_i_d);
-
-    apic_irq_delivered = 0;
-}
-
-int apic_get_irq_delivered(void)
-{
-    trace_apic_get_irq_delivered(apic_irq_delivered);
-
-    return apic_irq_delivered;
-}
-
 void apic_deliver_nmi(DeviceState *dev)
 {
     APICCommonState *s = APIC_COMMON(dev);
diff --git a/hw/intc/apic_irqcount.c b/hw/intc/apic_irqcount.c
new file mode 100644
index 0000000000..0aadef1cb5
--- /dev/null
+++ b/hw/intc/apic_irqcount.c
@@ -0,0 +1,53 @@
+/*
+ * APIC support - functions for counting the delivered IRQs.
+ * (this code is in a separate file since it is used from the
+ * mc146818rtc code on targets without APIC, too)
+ *
+ *  Copyright (c) 2011      Jan Kiszka, Siemens AG
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>
+ */
+
+#include "qemu/osdep.h"
+#include "hw/i386/apic.h"
+#include "trace.h"
+
+static int apic_irq_delivered;
+
+void apic_report_irq_delivered(int delivered)
+{
+    apic_irq_delivered += delivered;
+
+    trace_apic_report_irq_delivered(apic_irq_delivered);
+}
+
+void apic_reset_irq_delivered(void)
+{
+    /*
+     * Copy this into a local variable to encourage gcc to emit a plain
+     * register for a sys/sdt.h marker.  For details on this workaround, see:
+     * https://sourceware.org/bugzilla/show_bug.cgi?id=13296
+     */
+    volatile int a_i_d = apic_irq_delivered;
+    trace_apic_reset_irq_delivered(a_i_d);
+
+    apic_irq_delivered = 0;
+}
+
+int apic_get_irq_delivered(void)
+{
+    trace_apic_get_irq_delivered(apic_irq_delivered);
+
+    return apic_irq_delivered;
+}
diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index 1ebb412479..d524dc02c2 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -43,11 +43,7 @@
 #include "qapi/qapi-events-misc.h"
 #include "qapi/visitor.h"
 #include "hw/rtc/mc146818rtc_regs.h"
-
-#ifdef TARGET_I386
-#include "qapi/qapi-commands-misc-target.h"
 #include "hw/i386/apic.h"
-#endif
 
 //#define DEBUG_CMOS
 //#define DEBUG_COALESCED
@@ -112,7 +108,6 @@ static void rtc_coalesced_timer_update(RTCState *s)
 static QLIST_HEAD(, RTCState) rtc_devices =
     QLIST_HEAD_INITIALIZER(rtc_devices);
 
-#ifdef TARGET_I386
 void qmp_rtc_reset_reinjection(Error **errp)
 {
     RTCState *s;
@@ -145,13 +140,6 @@ static void rtc_coalesced_timer(void *opaque)
 
     rtc_coalesced_timer_update(s);
 }
-#else
-static bool rtc_policy_slew_deliver_irq(RTCState *s)
-{
-    assert(0);
-    return false;
-}
-#endif
 
 static uint32_t rtc_periodic_clock_ticks(RTCState *s)
 {
@@ -922,14 +910,15 @@ static void rtc_realizefn(DeviceState *dev, Error **errp)
     rtc_set_date_from_host(isadev);
 
     switch (s->lost_tick_policy) {
-#ifdef TARGET_I386
-    case LOST_TICK_POLICY_SLEW:
-        s->coalesced_timer =
-            timer_new_ns(rtc_clock, rtc_coalesced_timer, s);
-        break;
-#endif
     case LOST_TICK_POLICY_DISCARD:
         break;
+    case LOST_TICK_POLICY_SLEW:
+        /* Slew tick policy is only available if the machine has an APIC */
+        if (object_resolve_path_type("", TYPE_APIC_COMMON, NULL) != NULL) {
+            s->coalesced_timer = timer_new_ns(rtc_clock, rtc_coalesced_timer, s);
+            break;
+        }
+        /* fallthrough */
     default:
         error_setg(errp, "Invalid lost tick policy.");
         return;
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index bcbf22ff51..036ad1936b 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -25,8 +25,12 @@ softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_intc.c'))
 softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP', if_true: files('xlnx-zynqmp-ipi.c'))
 softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_PMU', if_true: files('xlnx-pmu-iomod-intc.c'))
 
-specific_ss.add(when: 'CONFIG_ALLWINNER_A10_PIC', if_true: files('allwinner-a10-pic.c'))
+if config_all_devices.has_key('CONFIG_APIC') or config_all_devices.has_key('CONFIG_MC146818RTC')
+    softmmu_ss.add(files('apic_irqcount.c'))
+endif
 specific_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c', 'apic_common.c'))
+
+specific_ss.add(when: 'CONFIG_ALLWINNER_A10_PIC', if_true: files('allwinner-a10-pic.c'))
 specific_ss.add(when: 'CONFIG_ARM_GIC', if_true: files('arm_gicv3_cpuif_common.c'))
 specific_ss.add(when: 'CONFIG_ARM_GICV3_TCG', if_true: files('arm_gicv3_cpuif.c'))
 specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gic_kvm.c'))
diff --git a/hw/rtc/meson.build b/hw/rtc/meson.build
index dc33973384..34a4d316fa 100644
--- a/hw/rtc/meson.build
+++ b/hw/rtc/meson.build
@@ -13,5 +13,4 @@ softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_rtc.c'))
 softmmu_ss.add(when: 'CONFIG_GOLDFISH_RTC', if_true: files('goldfish_rtc.c'))
 softmmu_ss.add(when: 'CONFIG_LS7A_RTC', if_true: files('ls7a_rtc.c'))
 softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-rtc.c'))
-
-specific_ss.add(when: 'CONFIG_MC146818RTC', if_true: files('mc146818rtc.c'))
+softmmu_ss.add(when: 'CONFIG_MC146818RTC', if_true: files('mc146818rtc.c'))
-- 
2.31.1


