Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD20294F16
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 16:53:00 +0200 (CEST)
Received: from localhost ([::1]:39270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVFU3-00012G-E7
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 10:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kVFOl-00049d-4I
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 10:47:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kVFOj-0006Yz-03
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 10:47:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603291648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Jf537lw3PJANIZbpIvuw6YG8fiRPFoCxmfaKHCs3go8=;
 b=WIkcqNpyGihpOA5ScFcCb7++KOm0eGEIgjwZ3N9KmkzrcUZ/xf/7hEkphTBkBPd25OSCsh
 l8ry17YqPfi/Cshzr+C9f2IzIweHltIobx8KKSAV12YwZEqvrVxFV+p2DYeejOYBY+pNsK
 HKrfNHMVvtWWqhAHBsDEYBZ0xk1e/q0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-tQeNLj6kMbqMh2fu4FAuFA-1; Wed, 21 Oct 2020 10:47:25 -0400
X-MC-Unique: tQeNLj6kMbqMh2fu4FAuFA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D501C18A8225;
 Wed, 21 Oct 2020 14:47:24 +0000 (UTC)
Received: from localhost (ovpn-66-44.rdu2.redhat.com [10.10.66.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 425BA5D9DD;
 Wed, 21 Oct 2020 14:47:21 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] pc: Implement -no-hpet as sugar for -machine allow-hpet=no
Date: Wed, 21 Oct 2020 10:46:29 -0400
Message-Id: <20201021144629.1535871-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 22:12:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Get rid of yet another global variable.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v2 -> v3:
* Revert v2 changes (use "hpet" property), plus:
* Default to hpet=off if CONFIG_HPET=n
* Error out if creation of HPET device fails and hpet=on

Changes v1 -> v2:
* Rename property to "allow-hpet" to make its semantic clearer,
  as it won't make sure HPET is created if CONFIG_HPET=n
* Use qdev_new(TYPE_HPET) at pc_basic_device_init()
---
 include/hw/i386/pc.h  |  1 +
 include/hw/i386/x86.h |  3 ---
 hw/i386/pc.c          | 61 +++++++++++++++++++++++++++++--------------
 hw/i386/pc_piix.c     |  2 +-
 softmmu/vl.c          |  4 +--
 5 files changed, 46 insertions(+), 25 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 84639d0ebc..911e460097 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -43,6 +43,7 @@ typedef struct PCMachineState {
     bool smbus_enabled;
     bool sata_enabled;
     bool pit_enabled;
+    bool hpet_enabled;
 
     /* NUMA information: */
     uint64_t numa_nodes;
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index d5dcf7a07f..4e66a15ff5 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -124,7 +124,4 @@ qemu_irq x86_allocate_cpu_irq(void);
 void gsi_handler(void *opaque, int n, int level);
 void ioapic_init_gsi(GSIState *gsi_state, const char *parent_name);
 
-/* hpet.c */
-extern int no_hpet;
-
 #endif
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 4e323755d0..416fb0e0f6 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1142,28 +1142,31 @@ void pc_basic_device_init(struct PCMachineState *pcms,
      * Without KVM_CAP_PIT_STATE2, we cannot switch off the in-kernel PIT
      * when the HPET wants to take over. Thus we have to disable the latter.
      */
-    if (!no_hpet && (!kvm_irqchip_in_kernel() || kvm_has_pit_state2())) {
+    if (pcms->hpet_enabled && (!kvm_irqchip_in_kernel() ||
+                               kvm_has_pit_state2())) {
         hpet = qdev_try_new(TYPE_HPET);
-        if (hpet) {
-            /* For pc-piix-*, hpet's intcap is always IRQ2. For pc-q35-1.7
-             * and earlier, use IRQ2 for compat. Otherwise, use IRQ16~23,
-             * IRQ8 and IRQ2.
-             */
-            uint8_t compat = object_property_get_uint(OBJECT(hpet),
-                    HPET_INTCAP, NULL);
-            if (!compat) {
-                qdev_prop_set_uint32(hpet, HPET_INTCAP, hpet_irqs);
-            }
-            sysbus_realize_and_unref(SYS_BUS_DEVICE(hpet), &error_fatal);
-            sysbus_mmio_map(SYS_BUS_DEVICE(hpet), 0, HPET_BASE);
+        if (!hpet) {
+            error_report("couldn't create HPET device");
+            exit(1);
+        }
+        /* For pc-piix-*, hpet's intcap is always IRQ2. For pc-q35-1.7
+            * and earlier, use IRQ2 for compat. Otherwise, use IRQ16~23,
+            * IRQ8 and IRQ2.
+            */
+        uint8_t compat = object_property_get_uint(OBJECT(hpet),
+                HPET_INTCAP, NULL);
+        if (!compat) {
+            qdev_prop_set_uint32(hpet, HPET_INTCAP, hpet_irqs);
+        }
+        sysbus_realize_and_unref(SYS_BUS_DEVICE(hpet), &error_fatal);
+        sysbus_mmio_map(SYS_BUS_DEVICE(hpet), 0, HPET_BASE);
 
-            for (i = 0; i < GSI_NUM_PINS; i++) {
-                sysbus_connect_irq(SYS_BUS_DEVICE(hpet), i, gsi[i]);
-            }
-            pit_isa_irq = -1;
-            pit_alt_irq = qdev_get_gpio_in(hpet, HPET_LEGACY_PIT_INT);
-            rtc_irq = qdev_get_gpio_in(hpet, HPET_LEGACY_RTC_INT);
+        for (i = 0; i < GSI_NUM_PINS; i++) {
+            sysbus_connect_irq(SYS_BUS_DEVICE(hpet), i, gsi[i]);
         }
+        pit_isa_irq = -1;
+        pit_alt_irq = qdev_get_gpio_in(hpet, HPET_LEGACY_PIT_INT);
+        rtc_irq = qdev_get_gpio_in(hpet, HPET_LEGACY_RTC_INT);
     }
     *rtc_state = mc146818_rtc_init(isa_bus, 2000, rtc_irq);
 
@@ -1535,6 +1538,20 @@ static void pc_machine_set_pit(Object *obj, bool value, Error **errp)
     pcms->pit_enabled = value;
 }
 
+static bool pc_machine_get_hpet(Object *obj, Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+
+    return pcms->hpet_enabled;
+}
+
+static void pc_machine_set_hpet(Object *obj, bool value, Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+
+    pcms->hpet_enabled = value;
+}
+
 static void pc_machine_get_max_ram_below_4g(Object *obj, Visitor *v,
                                             const char *name, void *opaque,
                                             Error **errp)
@@ -1585,6 +1602,9 @@ static void pc_machine_initfn(Object *obj)
     pcms->smbus_enabled = true;
     pcms->sata_enabled = true;
     pcms->pit_enabled = true;
+#ifdef CONFIG_HPET
+    pcms->hpet_enabled = true;
+#endif
 
     pc_system_flash_create(pcms);
     pcms->pcspk = isa_new(TYPE_PC_SPEAKER);
@@ -1705,6 +1725,9 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
 
     object_class_property_add_bool(oc, PC_MACHINE_PIT,
         pc_machine_get_pit, pc_machine_set_pit);
+
+    object_class_property_add_bool(oc, "hpet",
+        pc_machine_get_hpet, pc_machine_set_hpet);
 }
 
 static const TypeInfo pc_machine_info = {
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 0cf22a57ad..13d1628f13 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -216,7 +216,7 @@ static void pc_init1(MachineState *machine,
         i440fx_state = NULL;
         isa_bus = isa_bus_new(NULL, get_system_memory(), system_io,
                               &error_abort);
-        no_hpet = 1;
+        pcms->hpet_enabled = false;
     }
     isa_bus_irqs(isa_bus, x86ms->gsi);
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index cb476aa70b..c2281f45a8 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -146,7 +146,6 @@ static Chardev **serial_hds;
 Chardev *parallel_hds[MAX_PARALLEL_PORTS];
 int win2k_install_hack = 0;
 int singlestep = 0;
-int no_hpet = 0;
 int fd_bootchk = 1;
 static int no_reboot;
 int no_shutdown = 0;
@@ -3562,7 +3561,8 @@ void qemu_init(int argc, char **argv, char **envp)
                 qemu_opts_parse_noisily(olist, "acpi=off", false);
                 break;
             case QEMU_OPTION_no_hpet:
-                no_hpet = 1;
+                olist = qemu_find_opts("machine");
+                qemu_opts_parse_noisily(olist, "hpet=off", false);
                 break;
             case QEMU_OPTION_no_reboot:
                 no_reboot = 1;
-- 
2.28.0


