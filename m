Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D07082A07B7
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 15:21:12 +0100 (CET)
Received: from localhost ([::1]:40778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYVHD-00042k-Tu
	for lists+qemu-devel@lfdr.de; Fri, 30 Oct 2020 10:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kYV8n-0003kh-Px
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 10:12:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kYV8b-0007GD-W2
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 10:12:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604067135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=et4yufnnD++h3AJk3UX83J9geIWo0Gn07GUHuuNVBW4=;
 b=F0SPUVCfnu3exJAzS0b/bO2Yd4hWv6TqlEXYsoTvjXL3XSBBObpgsfmJbicGu8dtnNiAu4
 Jl+1r5AcOicjO9KbbJXbhbiWPCMUZScsw5vhYVj2haw+sPbXO6idKltAHy59l6KvUzYWDy
 5RLGysrsl6bE+zho2B/MO/edftchNj0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-LZsVszREPCuToUf3RoNSGA-1; Fri, 30 Oct 2020 10:12:13 -0400
X-MC-Unique: LZsVszREPCuToUf3RoNSGA-1
Received: by mail-wm1-f69.google.com with SMTP id t21so664509wmt.8
 for <qemu-devel@nongnu.org>; Fri, 30 Oct 2020 07:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=et4yufnnD++h3AJk3UX83J9geIWo0Gn07GUHuuNVBW4=;
 b=ogPajFItmHCvMreWDq0mw1GN+NigC9q9hoITPTbu1apQO28i9uJuZMe3JbjDzh1pFu
 zuZ3xTbcj7ZluNln7z27kQJF9/xb+8hhDmFDJZEfo4PdtQwJ4q4t5yeQJ9S28l9ILR39
 HPIrA3J0NZViF5XSXx4FDMWXbRHqak7IX39ZfOBfb/fpL7zm0DYMTVZXKbmKSImbVsjx
 gFlv1ASh1BpJfV+U0EslxH4nmVQFc0GNMkvN+XdBsjnvSUy8tZGmN+joNkpxjrTBXYRY
 T5BttbgrK335KCqdoGQ2bQ+SOzTfZ0/GGcCxrwJU/WnM7KkuL4+Gx1DoK2Np2TDCbB3m
 JXLw==
X-Gm-Message-State: AOAM5325ceq3iBfxvX090RxtaVdqeMUBv2JHcB553u//EruCyi6j01sA
 JF2LMX2qtLuVsjpxcnF0KKL5p4qqZXBytYi8z0En0FjUJKOVX6lw2v2skhhr2rqUJUbni3pAfOw
 dRA7pzJeFb5L+ARM=
X-Received: by 2002:adf:de91:: with SMTP id w17mr3381734wrl.84.1604067131523; 
 Fri, 30 Oct 2020 07:12:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxenQYLluWaV0MelRk2jGRS+18z8P0Ya7gU76Jyn65Op9K1fHWh3ZLUmaSI+6Yohfm6PQw55Q==
X-Received: by 2002:adf:de91:: with SMTP id w17mr3381718wrl.84.1604067131349; 
 Fri, 30 Oct 2020 07:12:11 -0700 (PDT)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id t7sm10157363wrx.42.2020.10.30.07.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 07:12:10 -0700 (PDT)
Date: Fri, 30 Oct 2020 10:12:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/15] pc: Implement -no-hpet as sugar for -machine hpet=on
Message-ID: <20201030141136.1013521-10-mst@redhat.com>
References: <20201030141136.1013521-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201030141136.1013521-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/30 02:24:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eduardo Habkost <ehabkost@redhat.com>

Get rid of yet another global variable.

The default will be hpet=on only if CONFIG_HPET=y.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20201021144716.1536388-1-ehabkost@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/i386/pc.h  |  1 +
 include/hw/i386/x86.h |  3 ---
 hw/i386/pc.c          | 63 +++++++++++++++++++++++++++++--------------
 hw/i386/pc_piix.c     |  2 +-
 softmmu/vl.c          |  4 +--
 5 files changed, 47 insertions(+), 26 deletions(-)

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
index bfa9cb2a25..739fac5087 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -126,7 +126,4 @@ qemu_irq x86_allocate_cpu_irq(void);
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
-
-            for (i = 0; i < GSI_NUM_PINS; i++) {
-                sysbus_connect_irq(SYS_BUS_DEVICE(hpet), i, gsi[i]);
-            }
-            pit_isa_irq = -1;
-            pit_alt_irq = qdev_get_gpio_in(hpet, HPET_LEGACY_PIT_INT);
-            rtc_irq = qdev_get_gpio_in(hpet, HPET_LEGACY_RTC_INT);
+        if (!hpet) {
+            error_report("couldn't create HPET device");
+            exit(1);
         }
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
+
+        for (i = 0; i < GSI_NUM_PINS; i++) {
+            sysbus_connect_irq(SYS_BUS_DEVICE(hpet), i, gsi[i]);
+        }
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
index 7c1c6d37ef..a537a0377f 100644
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
MST


