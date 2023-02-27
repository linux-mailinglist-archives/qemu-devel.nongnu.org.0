Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5043F6A43CA
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:09:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeAU-0000Kh-L0; Mon, 27 Feb 2023 09:07:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeA8-0007mw-Kj
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:07:36 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeA6-0000GA-Na
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:07:32 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 ay29-20020a05600c1e1d00b003e9f4c2b623so7245949wmb.3
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BH6iFkg3xXP0Y7tfwyRGkdg+hFknPWvTOF1VaPk08+M=;
 b=SqwNFxJ7W5osEFMu3bCvORvTEhOgWs7HemRFlqupYCHGPHE+bBXlDsmdYEP68NNRq2
 ExaOnvGYr+ncuJ+hXxHaA/smZjKRHRp7nnMf1+9EI7AF0/F4S+bCVBdk3HSs3EtjF1fI
 75Vnsz0bmayJ6l4o5k9VlW2cZPjx1mgaC05DMTwO7O2466llFZePLk0W6DGjGNgDn52L
 2TK6qTp0pc470+oYAia9/1ZzcdzSzszCy2KkXH0ceQjalPZjB5x6HQHrq5dUh3r2DKfA
 rPrJdIr4lntvafILHy6i5pNXjPf6y+EOH1rQmxDYcF+jBQEVqZUVdW1A4E3tKv4AKA8u
 9O0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BH6iFkg3xXP0Y7tfwyRGkdg+hFknPWvTOF1VaPk08+M=;
 b=CH2Ru/g5hiT+Hvc7LPIv4VQLA1f9npobbMgS8r3IltxARZvEfNd3SUaU1rDU4kSdhn
 AyhuvlMaU/aVvaP63hBz55F9aqBPKd4h9oeiZmPmAFzsnStMKAZZALMscreyCFLxH7k+
 w3oTqgPHf/enZs/18JIa0N54V2f4vfiuqyso6CtfEgG+qCxHN/p/UbK3zHB4+jLYG60+
 OPg4KCymOqgEvouurDNXRKcvtNQjgHwui1zhWiq28D4WYDLVRbaoCN9PAPRZWCKuWUdm
 lzBU71VKZAvFnBSFFXHJ1eq6odnv2isXxoGxoUwoJo0qOVmw1hQg/Od2cmstfzgvQScP
 8tMg==
X-Gm-Message-State: AO0yUKV2H458emCpIqxoov3D71ZdkavSAswge0QZYeAcz66fP4CZ8H5D
 mq9afcZLjK7NMrNWmYdLjMP/Hfwuq/9BT4oL
X-Google-Smtp-Source: AK7set9rIi/0yfzpsZ7olPimLAXusP+0M01SvtH/g4bo5yKSJGucRBxze8qunY/5BzgzXnCNFKA/CA==
X-Received: by 2002:a05:600c:3088:b0:3d3:49db:9b25 with SMTP id
 g8-20020a05600c308800b003d349db9b25mr19973172wmn.26.1677506849073; 
 Mon, 27 Feb 2023 06:07:29 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a05600c4f4900b003dec22de1b1sm9990523wmq.10.2023.02.27.06.07.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:07:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 067/126] hw/rtc/mc146818rtc: Pass MC146818RtcState instead of
 ISADevice argument
Date: Mon, 27 Feb 2023 15:01:14 +0100
Message-Id: <20230227140213.35084-58-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

rtc_get_memory() and rtc_set_memory() methods can not take any
TYPE_ISA_DEVICE object. They expect a TYPE_MC146818_RTC one.

Simplify the API by passing a MC146818RtcState.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230210233116.80311-3-philmd@linaro.org>
---
 hw/i386/microvm.c            |  6 ++----
 hw/i386/pc.c                 | 16 +++++++++-------
 hw/i386/x86.c                |  4 +++-
 hw/ppc/prep.c                |  3 +--
 hw/rtc/mc146818rtc.c         | 13 ++++++-------
 include/hw/rtc/mc146818rtc.h |  8 ++++----
 6 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index fed468a34d..2349c4a0ab 100644
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
index 7ad71b19aa..91f195032c 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -438,7 +438,7 @@ static uint64_t ioportF0_read(void *opaque, hwaddr addr, unsigned size)
 
 #define REG_EQUIPMENT_BYTE          0x14
 
-static void cmos_init_hd(ISADevice *s, int type_ofs, int info_ofs,
+static void cmos_init_hd(MC146818RtcState *s, int type_ofs, int info_ofs,
                          int16_t cylinders, int8_t heads, int8_t sectors)
 {
     rtc_set_memory(s, type_ofs, 47);
@@ -470,7 +470,8 @@ static int boot_device2nibble(char boot_device)
     return 0;
 }
 
-static void set_boot_dev(ISADevice *s, const char *boot_device, Error **errp)
+static void set_boot_dev(MC146818RtcState *s, const char *boot_device,
+                         Error **errp)
 {
 #define PC_MAX_BOOT_DEVICES 3
     int nbds, bds[3] = { 0, };
@@ -498,7 +499,7 @@ static void pc_boot_set(void *opaque, const char *boot_device, Error **errp)
     set_boot_dev(opaque, boot_device, errp);
 }
 
-static void pc_cmos_init_floppy(ISADevice *rtc_state, ISADevice *floppy)
+static void pc_cmos_init_floppy(MC146818RtcState *rtc_state, ISADevice *floppy)
 {
     int val, nb, i;
     FloppyDriveType fd_type[2] = { FLOPPY_DRIVE_TYPE_NONE,
@@ -536,7 +537,7 @@ static void pc_cmos_init_floppy(ISADevice *rtc_state, ISADevice *floppy)
 }
 
 typedef struct pc_cmos_init_late_arg {
-    ISADevice *rtc_state;
+    MC146818RtcState *rtc_state;
     BusState *idebus[2];
 } pc_cmos_init_late_arg;
 
@@ -603,7 +604,7 @@ static ISADevice *pc_find_fdc0(void)
 static void pc_cmos_init_late(void *opaque)
 {
     pc_cmos_init_late_arg *arg = opaque;
-    ISADevice *s = arg->rtc_state;
+    MC146818RtcState *s = arg->rtc_state;
     int16_t cylinders;
     int8_t heads, sectors;
     int val;
@@ -645,11 +646,12 @@ static void pc_cmos_init_late(void *opaque)
 
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
 
@@ -1303,7 +1305,7 @@ void pc_basic_device_init(struct PCMachineState *pcms,
         pit_alt_irq = qdev_get_gpio_in(hpet, HPET_LEGACY_PIT_INT);
         rtc_irq = qdev_get_gpio_in(hpet, HPET_LEGACY_RTC_INT);
     }
-    *rtc_state = mc146818_rtc_init(isa_bus, 2000, rtc_irq);
+    *rtc_state = ISA_DEVICE(mc146818_rtc_init(isa_bus, 2000, rtc_irq));
 
     qemu_register_boot_set(pc_boot_set, *rtc_state);
 
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 5f28dc8390..38d2ec0581 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -150,8 +150,10 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
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
index c285a53286..b4d7777634 100644
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
@@ -859,7 +857,7 @@ static void rtc_notify_suspend(Notifier *notifier, void *data)
 {
     MC146818RtcState *s = container_of(notifier, MC146818RtcState,
                                        suspend_notifier);
-    rtc_set_memory(ISA_DEVICE(s), 0xF, 0xFE);
+    rtc_set_memory(s, 0xF, 0xFE);
 }
 
 static const MemoryRegionOps cmos_ops = {
@@ -946,7 +944,8 @@ static void rtc_realizefn(DeviceState *dev, Error **errp)
     QLIST_INSERT_HEAD(&rtc_devices, s, link);
 }
 
-ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq)
+MC146818RtcState *mc146818_rtc_init(ISABus *bus, int base_year,
+                                    qemu_irq intercept_irq)
 {
     DeviceState *dev;
     ISADevice *isadev;
@@ -966,7 +965,7 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq)
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


