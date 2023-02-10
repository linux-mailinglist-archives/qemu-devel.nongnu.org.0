Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6BC692B31
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 00:32:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQcrg-0006AC-6W; Fri, 10 Feb 2023 18:31:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQcrd-00068m-6E
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 18:31:33 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQcrb-0007qf-5p
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 18:31:32 -0500
Received: by mail-wr1-x431.google.com with SMTP id ba1so6673932wrb.5
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 15:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hr4ahbd9BnJloRVtV9Nrdh7BCCM/TxPydcu4B3q+EU0=;
 b=H7Ewl9LOwb8k2lnQujRAsbyCbsV8F+3pJoQFvNNix/r+aXrATJ2QKmy91yD46KYvJg
 +sIS9voAERzJEOQz4nlAeT1mhV532DPMumyDtwpwoSU2PUjjnsxQclwOpLhHgTXLZWH4
 zZKbl4cDG968H57uMtpRhMCQCkq+Jxm4DC7dqwVhHbgvR7+M4z+LhYie3eBKpAWbwZlf
 Gzm4WTlcZrtr/8tRJK3lIVEr0Nd49X/OhF4P/2xu/dp5Zu7SIqQJdv2lnsv+IfWVUTnt
 XhU4xJR2AbywsumMMgwef5E2WCzE6O7vizCVvVggvdrq+RHa5W31LVBZXU4Y9ROZhh7D
 eQ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hr4ahbd9BnJloRVtV9Nrdh7BCCM/TxPydcu4B3q+EU0=;
 b=fbOpGmeKJbThndFiJbdZhPYqkDrXXn9tjjNOq9/LMyFcMscc7WkjW0CV/yTqyDgzo+
 MGXY3s7QVuENrY3/+Ac3cHla/qc2HNMsRS6EU4Tzqer4x/IRmT2aLbdsmsRUYdYB7LNu
 CAgejf8FcRANWrKvMNl5wgEvIuKYDBZdM+hwUrqAsHW8ObVLg4Ygsaj7zMBWvfVsQJl3
 +EIB58VfLaiEf0aHNmKtRxHuSUjawLD+07dXcjauLiIGw1liIXg36h6y3ueC3pvw4uWP
 ojRK2i8JmfNg5EJUDNsZV5F20O0RqqCgz6S6OEX5ez4LofzMGkZdfcKL2iExFFx/uUIz
 N+YQ==
X-Gm-Message-State: AO0yUKUYcMXOoMp0B6mW8hbOxoR+oiXUqQc/DDGH/hs2hchcSfDd2T4g
 YhvrUykn112RgkAq88R0JMZgd8W1PGx0JINZ
X-Google-Smtp-Source: AK7set99duLDnKur1Azi5jhivWRtpDyGd4qyKoU549+2c0zi/naOMsKIK68JPV2QEyXwLuwpE7JSUw==
X-Received: by 2002:a5d:6203:0:b0:2c1:28dc:1561 with SMTP id
 y3-20020a5d6203000000b002c128dc1561mr14901627wru.44.1676071889536; 
 Fri, 10 Feb 2023 15:31:29 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w11-20020adff9cb000000b002c54e9f6bc2sm225092wrr.77.2023.02.10.15.31.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Feb 2023 15:31:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sergio Lopez <slp@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 2/3] hw/rtc/mc146818rtc: Pass MC146818RtcState instead of
 ISADevice argument
Date: Sat, 11 Feb 2023 00:31:15 +0100
Message-Id: <20230210233116.80311-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230210233116.80311-1-philmd@linaro.org>
References: <20230210233116.80311-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

rtc_get_memory() and rtc_set_memory() methods can not take any
TYPE_ISA_DEVICE object. They expect a TYPE_MC146818_RTC one.

Simplify the API by passing a MC146818RtcState.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/microvm.c            |  6 ++----
 hw/i386/pc.c                 | 16 +++++++++-------
 hw/i386/x86.c                |  4 +++-
 hw/ppc/prep.c                |  3 +--
 hw/rtc/mc146818rtc.c         | 13 ++++++-------
 include/hw/rtc/mc146818rtc.h |  8 ++++----
 6 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 29f30dd6d3..04b453cde5 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -57,7 +57,7 @@
 #define MICROVM_QBOOT_FILENAME "qboot.rom"
 #define MICROVM_BIOS_FILENAME  "bios-microvm.bin"
 
-static void microvm_set_rtc(MicrovmMachineState *mms, ISADevice *s)
+static void microvm_set_rtc(MicrovmMachineState *mms, MC146818RtcState *s)
 {
     X86MachineState *x86ms = X86_MACHINE(mms);
     int val;
@@ -161,7 +161,6 @@ static void microvm_devices_init(MicrovmMachineState *mms)
     const char *default_firmware;
     X86MachineState *x86ms = X86_MACHINE(mms);
     ISABus *isa_bus;
-    ISADevice *rtc_state;
     GSIState *gsi_state;
     int ioapics;
     int i;
@@ -267,8 +266,7 @@ static void microvm_devices_init(MicrovmMachineState *mms)
 
     if (mms->rtc == ON_OFF_AUTO_ON ||
         (mms->rtc == ON_OFF_AUTO_AUTO && !kvm_enabled())) {
-        rtc_state = mc146818_rtc_init(isa_bus, 2000, NULL);
-        microvm_set_rtc(mms, rtc_state);
+        microvm_set_rtc(mms, mc146818_rtc_init(isa_bus, 2000, NULL));
     }
 
     if (mms->isa_serial) {
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 6e592bd969..606686dafc 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -439,7 +439,7 @@ static uint64_t ioportF0_read(void *opaque, hwaddr addr, unsigned size)
 
 #define REG_EQUIPMENT_BYTE          0x14
 
-static void cmos_init_hd(ISADevice *s, int type_ofs, int info_ofs,
+static void cmos_init_hd(MC146818RtcState *s, int type_ofs, int info_ofs,
                          int16_t cylinders, int8_t heads, int8_t sectors)
 {
     rtc_set_memory(s, type_ofs, 47);
@@ -471,7 +471,8 @@ static int boot_device2nibble(char boot_device)
     return 0;
 }
 
-static void set_boot_dev(ISADevice *s, const char *boot_device, Error **errp)
+static void set_boot_dev(MC146818RtcState *s, const char *boot_device,
+                         Error **errp)
 {
 #define PC_MAX_BOOT_DEVICES 3
     int nbds, bds[3] = { 0, };
@@ -499,7 +500,7 @@ static void pc_boot_set(void *opaque, const char *boot_device, Error **errp)
     set_boot_dev(opaque, boot_device, errp);
 }
 
-static void pc_cmos_init_floppy(ISADevice *rtc_state, ISADevice *floppy)
+static void pc_cmos_init_floppy(MC146818RtcState *rtc_state, ISADevice *floppy)
 {
     int val, nb, i;
     FloppyDriveType fd_type[2] = { FLOPPY_DRIVE_TYPE_NONE,
@@ -537,7 +538,7 @@ static void pc_cmos_init_floppy(ISADevice *rtc_state, ISADevice *floppy)
 }
 
 typedef struct pc_cmos_init_late_arg {
-    ISADevice *rtc_state;
+    MC146818RtcState *rtc_state;
     BusState *idebus[2];
 } pc_cmos_init_late_arg;
 
@@ -604,7 +605,7 @@ static ISADevice *pc_find_fdc0(void)
 static void pc_cmos_init_late(void *opaque)
 {
     pc_cmos_init_late_arg *arg = opaque;
-    ISADevice *s = arg->rtc_state;
+    MC146818RtcState *s = arg->rtc_state;
     int16_t cylinders;
     int8_t heads, sectors;
     int val;
@@ -646,11 +647,12 @@ static void pc_cmos_init_late(void *opaque)
 
 void pc_cmos_init(PCMachineState *pcms,
                   BusState *idebus0, BusState *idebus1,
-                  ISADevice *s)
+                  ISADevice *rtc)
 {
     int val;
     static pc_cmos_init_late_arg arg;
     X86MachineState *x86ms = X86_MACHINE(pcms);
+    MC146818RtcState *s = MC146818_RTC(rtc);
 
     /* various important CMOS locations needed by PC/Bochs bios */
 
@@ -1304,7 +1306,7 @@ void pc_basic_device_init(struct PCMachineState *pcms,
         pit_alt_irq = qdev_get_gpio_in(hpet, HPET_LEGACY_PIT_INT);
         rtc_irq = qdev_get_gpio_in(hpet, HPET_LEGACY_RTC_INT);
     }
-    *rtc_state = mc146818_rtc_init(isa_bus, 2000, rtc_irq);
+    *rtc_state = ISA_DEVICE(mc146818_rtc_init(isa_bus, 2000, rtc_irq));
 
     qemu_register_boot_set(pc_boot_set, *rtc_state);
 
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index eaff4227bd..5dbdd75bfc 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -151,8 +151,10 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
     }
 }
 
-void x86_rtc_set_cpus_count(ISADevice *rtc, uint16_t cpus_count)
+void x86_rtc_set_cpus_count(ISADevice *s, uint16_t cpus_count)
 {
+    MC146818RtcState *rtc = MC146818_RTC(s);
+
     if (cpus_count > 0xff) {
         /*
          * If the number of CPUs can't be represented in 8 bits, the
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index fcbe4c5837..076e2d0d22 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -212,10 +212,9 @@ static int PPC_NVRAM_set_params (Nvram *nvram, uint16_t NVRAM_size,
 static int prep_set_cmos_checksum(DeviceState *dev, void *opaque)
 {
     uint16_t checksum = *(uint16_t *)opaque;
-    ISADevice *rtc;
 
     if (object_dynamic_cast(OBJECT(dev), TYPE_MC146818_RTC)) {
-        rtc = ISA_DEVICE(dev);
+        MC146818RtcState *rtc = MC146818_RTC(dev);
         rtc_set_memory(rtc, 0x2e, checksum & 0xff);
         rtc_set_memory(rtc, 0x3e, checksum & 0xff);
         rtc_set_memory(rtc, 0x2f, checksum >> 8);
diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index 08f6c0e0c5..478eee97e4 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -739,16 +739,14 @@ static uint64_t cmos_ioport_read(void *opaque, hwaddr addr,
     }
 }
 
-void rtc_set_memory(ISADevice *dev, int addr, int val)
+void rtc_set_memory(MC146818RtcState *s, int addr, int val)
 {
-    MC146818RtcState *s = MC146818_RTC(dev);
     if (addr >= 0 && addr <= 127)
         s->cmos_data[addr] = val;
 }
 
-int rtc_get_memory(ISADevice *dev, int addr)
+int rtc_get_memory(MC146818RtcState *s, int addr)
 {
-    MC146818RtcState *s = MC146818_RTC(dev);
     assert(addr >= 0 && addr <= 127);
     return s->cmos_data[addr];
 }
@@ -858,7 +856,7 @@ static const VMStateDescription vmstate_rtc = {
 static void rtc_notify_suspend(Notifier *notifier, void *data)
 {
     MC146818RtcState *s = container_of(notifier, MC146818RtcState, suspend_notifier);
-    rtc_set_memory(ISA_DEVICE(s), 0xF, 0xFE);
+    rtc_set_memory(s, 0xF, 0xFE);
 }
 
 static const MemoryRegionOps cmos_ops = {
@@ -945,7 +943,8 @@ static void rtc_realizefn(DeviceState *dev, Error **errp)
     QLIST_INSERT_HEAD(&rtc_devices, s, link);
 }
 
-ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq)
+MC146818RtcState *mc146818_rtc_init(ISABus *bus, int base_year,
+                                    qemu_irq intercept_irq)
 {
     DeviceState *dev;
     ISADevice *isadev;
@@ -965,7 +964,7 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq)
     object_property_add_alias(qdev_get_machine(), "rtc-time", OBJECT(isadev),
                               "date");
 
-    return isadev;
+    return s;
 }
 
 static Property mc146818rtc_properties[] = {
diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc.h
index 11631af7e3..a6b0c135c0 100644
--- a/include/hw/rtc/mc146818rtc.h
+++ b/include/hw/rtc/mc146818rtc.h
@@ -51,10 +51,10 @@ struct MC146818RtcState {
 
 #define RTC_ISA_IRQ 8
 
-ISADevice *mc146818_rtc_init(ISABus *bus, int base_year,
-                             qemu_irq intercept_irq);
-void rtc_set_memory(ISADevice *dev, int addr, int val);
-int rtc_get_memory(ISADevice *dev, int addr);
+MC146818RtcState *mc146818_rtc_init(ISABus *bus, int base_year,
+                                    qemu_irq intercept_irq);
+void rtc_set_memory(MC146818RtcState *s, int addr, int val);
+int rtc_get_memory(MC146818RtcState *s, int addr);
 void qmp_rtc_reset_reinjection(Error **errp);
 
 #endif /* HW_RTC_MC146818RTC_H */
-- 
2.38.1


