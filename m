Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D00DA6A4465
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:29:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeAS-0008QG-Hy; Mon, 27 Feb 2023 09:07:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeAH-0007rD-C2
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:07:42 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeAF-0000IN-9i
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:07:41 -0500
Received: by mail-wm1-x335.google.com with SMTP id p26so4303174wmc.4
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HzGq9APDxAMzQIo8VltVW2aurDsOTUdVVQvgrdGYPTo=;
 b=D7hXoqDnRblyu72fvUJlffqThaADbBBWVs4BtY23Lnf9rL8PLfVqIisbSoMaF1lfm8
 7G28csfRqkp1/CrHR7kyJFBPYIgSAZvUEwxRWQ5RxwWF2gCmAy0n16jOs5YyRj0jLSUT
 otrYCaOafYZbGOH8jQXxiWJgST5/sVQE6h/JT5dqN6i6mrvI1K9R/c/XfV/5YXt8eZ+j
 bSlo5Se1ZWWQ0j1Nh8UGYWpRBRazRW/nKkt4fGXiax/8v5lQgtSmSVn02snwaq7FhS4u
 o+r/Cs2bHCSVT48DMFUnpIiaxQYAkAZJNX6igLkgZX2BSF0SoCrnI4XnzFHNqzB3nfWV
 J3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HzGq9APDxAMzQIo8VltVW2aurDsOTUdVVQvgrdGYPTo=;
 b=WBgFS8wsxsx2mL5kSlX4mnZja5G0rg2lwJJ0G8d/FRA6Lw+ys1DY7l/YVHkKaQx/F5
 OZS+X/yx2BQdX1ptjHIk/oMWSNfx54eCvOpMmj10szLJc8i6WTbTUrYByM9tO+RuEUed
 wKdj3p6t6YgFHJo4Kio9Rn4eR8adF+5qPhMIqmf5z/LqXIC278U1qPo7HajlN8kcGgoX
 yTIr///mhsQ7DZ/RroIeU2qEV49PsEM0LRxDelNIkoUG5S2h9eAFfCJFmHp5mjqAoBCM
 vVx6IhllwUxQAmyngaYlb6HkPtGdIJwPN1Io4lCLcMcev44f/2pKbwceoW5cXzpf0Kxp
 cyng==
X-Gm-Message-State: AO0yUKUzKn5xfnCHT8iFnjtytT4O6sRJv9/Q1Fy6XVFC56+cmgd713Sy
 civ4NcWQMeIXx6ZEAvZTphmkV4nSBdzQHc2e
X-Google-Smtp-Source: AK7set+wUYfhMPwbZag+uCI0tfzxH9riBkzHwZsJNHeOGQuyMvp+E0L0o61qD+lNHnm2R7BNIj0IOg==
X-Received: by 2002:a05:600c:4b30:b0:3e2:147f:ac16 with SMTP id
 i48-20020a05600c4b3000b003e2147fac16mr16823986wmp.10.1677506855502; 
 Mon, 27 Feb 2023 06:07:35 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c1d8f00b003e20970175dsm13223389wms.32.2023.02.27.06.07.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:07:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 068/126] hw/rtc: Rename rtc_[get|set]_memory ->
 mc146818rtc_[get|set]_cmos_data
Date: Mon, 27 Feb 2023 15:01:15 +0100
Message-Id: <20230227140213.35084-59-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

rtc_get_memory() and rtc_set_memory() helpers only work with
TYPE_MC146818_RTC devices. 'memory' in their name refer to
the CMOS region. Rename them as mc146818rtc_get_cmos_data()
and mc146818rtc_set_cmos_data() to be explicit about what
they are doing.

Mechanical change doing:

  $ sed -i -e 's/rtc_set_memory/mc146818rtc_set_cmos_data/g' \
        $(git grep -wl rtc_set_memory)
  $ sed -i -e 's/rtc_get_memory/mc146818rtc_get_cmos_data/g' \
        $(git grep -wl rtc_get_memory)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230210233116.80311-4-philmd@linaro.org>
---
 hw/i386/microvm.c            | 22 +++++++-------
 hw/i386/pc.c                 | 58 ++++++++++++++++++------------------
 hw/i386/x86.c                |  4 +--
 hw/ppc/prep.c                |  8 ++---
 hw/rtc/mc146818rtc.c         |  6 ++--
 include/hw/rtc/mc146818rtc.h |  4 +--
 6 files changed, 51 insertions(+), 51 deletions(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 2349c4a0ab..68c22016d2 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -63,8 +63,8 @@ static void microvm_set_rtc(MicrovmMachineState *mms, MC146818RtcState *s)
     int val;
 
     val = MIN(x86ms->below_4g_mem_size / KiB, 640);
-    rtc_set_memory(s, 0x15, val);
-    rtc_set_memory(s, 0x16, val >> 8);
+    mc146818rtc_set_cmos_data(s, 0x15, val);
+    mc146818rtc_set_cmos_data(s, 0x16, val >> 8);
     /* extended memory (next 64MiB) */
     if (x86ms->below_4g_mem_size > 1 * MiB) {
         val = (x86ms->below_4g_mem_size - 1 * MiB) / KiB;
@@ -74,10 +74,10 @@ static void microvm_set_rtc(MicrovmMachineState *mms, MC146818RtcState *s)
     if (val > 65535) {
         val = 65535;
     }
-    rtc_set_memory(s, 0x17, val);
-    rtc_set_memory(s, 0x18, val >> 8);
-    rtc_set_memory(s, 0x30, val);
-    rtc_set_memory(s, 0x31, val >> 8);
+    mc146818rtc_set_cmos_data(s, 0x17, val);
+    mc146818rtc_set_cmos_data(s, 0x18, val >> 8);
+    mc146818rtc_set_cmos_data(s, 0x30, val);
+    mc146818rtc_set_cmos_data(s, 0x31, val >> 8);
     /* memory between 16MiB and 4GiB */
     if (x86ms->below_4g_mem_size > 16 * MiB) {
         val = (x86ms->below_4g_mem_size - 16 * MiB) / (64 * KiB);
@@ -87,13 +87,13 @@ static void microvm_set_rtc(MicrovmMachineState *mms, MC146818RtcState *s)
     if (val > 65535) {
         val = 65535;
     }
-    rtc_set_memory(s, 0x34, val);
-    rtc_set_memory(s, 0x35, val >> 8);
+    mc146818rtc_set_cmos_data(s, 0x34, val);
+    mc146818rtc_set_cmos_data(s, 0x35, val >> 8);
     /* memory above 4GiB */
     val = x86ms->above_4g_mem_size / 65536;
-    rtc_set_memory(s, 0x5b, val);
-    rtc_set_memory(s, 0x5c, val >> 8);
-    rtc_set_memory(s, 0x5d, val >> 16);
+    mc146818rtc_set_cmos_data(s, 0x5b, val);
+    mc146818rtc_set_cmos_data(s, 0x5c, val >> 8);
+    mc146818rtc_set_cmos_data(s, 0x5d, val >> 16);
 }
 
 static void create_gpex(MicrovmMachineState *mms)
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 91f195032c..98c2becc11 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -441,16 +441,16 @@ static uint64_t ioportF0_read(void *opaque, hwaddr addr, unsigned size)
 static void cmos_init_hd(MC146818RtcState *s, int type_ofs, int info_ofs,
                          int16_t cylinders, int8_t heads, int8_t sectors)
 {
-    rtc_set_memory(s, type_ofs, 47);
-    rtc_set_memory(s, info_ofs, cylinders);
-    rtc_set_memory(s, info_ofs + 1, cylinders >> 8);
-    rtc_set_memory(s, info_ofs + 2, heads);
-    rtc_set_memory(s, info_ofs + 3, 0xff);
-    rtc_set_memory(s, info_ofs + 4, 0xff);
-    rtc_set_memory(s, info_ofs + 5, 0xc0 | ((heads > 8) << 3));
-    rtc_set_memory(s, info_ofs + 6, cylinders);
-    rtc_set_memory(s, info_ofs + 7, cylinders >> 8);
-    rtc_set_memory(s, info_ofs + 8, sectors);
+    mc146818rtc_set_cmos_data(s, type_ofs, 47);
+    mc146818rtc_set_cmos_data(s, info_ofs, cylinders);
+    mc146818rtc_set_cmos_data(s, info_ofs + 1, cylinders >> 8);
+    mc146818rtc_set_cmos_data(s, info_ofs + 2, heads);
+    mc146818rtc_set_cmos_data(s, info_ofs + 3, 0xff);
+    mc146818rtc_set_cmos_data(s, info_ofs + 4, 0xff);
+    mc146818rtc_set_cmos_data(s, info_ofs + 5, 0xc0 | ((heads > 8) << 3));
+    mc146818rtc_set_cmos_data(s, info_ofs + 6, cylinders);
+    mc146818rtc_set_cmos_data(s, info_ofs + 7, cylinders >> 8);
+    mc146818rtc_set_cmos_data(s, info_ofs + 8, sectors);
 }
 
 /* convert boot_device letter to something recognizable by the bios */
@@ -490,8 +490,8 @@ static void set_boot_dev(MC146818RtcState *s, const char *boot_device,
             return;
         }
     }
-    rtc_set_memory(s, 0x3d, (bds[1] << 4) | bds[0]);
-    rtc_set_memory(s, 0x38, (bds[2] << 4) | (fd_bootchk ? 0x0 : 0x1));
+    mc146818rtc_set_cmos_data(s, 0x3d, (bds[1] << 4) | bds[0]);
+    mc146818rtc_set_cmos_data(s, 0x38, (bds[2] << 4) | (fd_bootchk ? 0x0 : 0x1));
 }
 
 static void pc_boot_set(void *opaque, const char *boot_device, Error **errp)
@@ -513,9 +513,9 @@ static void pc_cmos_init_floppy(MC146818RtcState *rtc_state, ISADevice *floppy)
     }
     val = (cmos_get_fd_drive_type(fd_type[0]) << 4) |
         cmos_get_fd_drive_type(fd_type[1]);
-    rtc_set_memory(rtc_state, 0x10, val);
+    mc146818rtc_set_cmos_data(rtc_state, 0x10, val);
 
-    val = rtc_get_memory(rtc_state, REG_EQUIPMENT_BYTE);
+    val = mc146818rtc_get_cmos_data(rtc_state, REG_EQUIPMENT_BYTE);
     nb = 0;
     if (fd_type[0] != FLOPPY_DRIVE_TYPE_NONE) {
         nb++;
@@ -533,7 +533,7 @@ static void pc_cmos_init_floppy(MC146818RtcState *rtc_state, ISADevice *floppy)
         val |= 0x41; /* 2 drives, ready for boot */
         break;
     }
-    rtc_set_memory(rtc_state, REG_EQUIPMENT_BYTE, val);
+    mc146818rtc_set_cmos_data(rtc_state, REG_EQUIPMENT_BYTE, val);
 }
 
 typedef struct pc_cmos_init_late_arg {
@@ -621,7 +621,7 @@ static void pc_cmos_init_late(void *opaque)
         cmos_init_hd(s, 0x1a, 0x24, cylinders, heads, sectors);
         val |= 0x0f;
     }
-    rtc_set_memory(s, 0x12, val);
+    mc146818rtc_set_cmos_data(s, 0x12, val);
 
     val = 0;
     for (i = 0; i < 4; i++) {
@@ -637,7 +637,7 @@ static void pc_cmos_init_late(void *opaque)
             val |= trans << (i * 2);
         }
     }
-    rtc_set_memory(s, 0x39, val);
+    mc146818rtc_set_cmos_data(s, 0x39, val);
 
     pc_cmos_init_floppy(s, pc_find_fdc0());
 
@@ -658,8 +658,8 @@ void pc_cmos_init(PCMachineState *pcms,
     /* memory size */
     /* base memory (first MiB) */
     val = MIN(x86ms->below_4g_mem_size / KiB, 640);
-    rtc_set_memory(s, 0x15, val);
-    rtc_set_memory(s, 0x16, val >> 8);
+    mc146818rtc_set_cmos_data(s, 0x15, val);
+    mc146818rtc_set_cmos_data(s, 0x16, val >> 8);
     /* extended memory (next 64MiB) */
     if (x86ms->below_4g_mem_size > 1 * MiB) {
         val = (x86ms->below_4g_mem_size - 1 * MiB) / KiB;
@@ -668,10 +668,10 @@ void pc_cmos_init(PCMachineState *pcms,
     }
     if (val > 65535)
         val = 65535;
-    rtc_set_memory(s, 0x17, val);
-    rtc_set_memory(s, 0x18, val >> 8);
-    rtc_set_memory(s, 0x30, val);
-    rtc_set_memory(s, 0x31, val >> 8);
+    mc146818rtc_set_cmos_data(s, 0x17, val);
+    mc146818rtc_set_cmos_data(s, 0x18, val >> 8);
+    mc146818rtc_set_cmos_data(s, 0x30, val);
+    mc146818rtc_set_cmos_data(s, 0x31, val >> 8);
     /* memory between 16MiB and 4GiB */
     if (x86ms->below_4g_mem_size > 16 * MiB) {
         val = (x86ms->below_4g_mem_size - 16 * MiB) / (64 * KiB);
@@ -680,13 +680,13 @@ void pc_cmos_init(PCMachineState *pcms,
     }
     if (val > 65535)
         val = 65535;
-    rtc_set_memory(s, 0x34, val);
-    rtc_set_memory(s, 0x35, val >> 8);
+    mc146818rtc_set_cmos_data(s, 0x34, val);
+    mc146818rtc_set_cmos_data(s, 0x35, val >> 8);
     /* memory above 4GiB */
     val = x86ms->above_4g_mem_size / 65536;
-    rtc_set_memory(s, 0x5b, val);
-    rtc_set_memory(s, 0x5c, val >> 8);
-    rtc_set_memory(s, 0x5d, val >> 16);
+    mc146818rtc_set_cmos_data(s, 0x5b, val);
+    mc146818rtc_set_cmos_data(s, 0x5c, val >> 8);
+    mc146818rtc_set_cmos_data(s, 0x5d, val >> 16);
 
     object_property_add_link(OBJECT(pcms), "rtc_state",
                              TYPE_ISA_DEVICE,
@@ -701,7 +701,7 @@ void pc_cmos_init(PCMachineState *pcms,
     val = 0;
     val |= 0x02; /* FPU is there */
     val |= 0x04; /* PS/2 mouse installed */
-    rtc_set_memory(s, REG_EQUIPMENT_BYTE, val);
+    mc146818rtc_set_cmos_data(s, REG_EQUIPMENT_BYTE, val);
 
     /* hard drives and FDC */
     arg.rtc_state = s;
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 38d2ec0581..c44846f47b 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -160,9 +160,9 @@ void x86_rtc_set_cpus_count(ISADevice *s, uint16_t cpus_count)
          * BIOS must use "FW_CFG_NB_CPUS". Set RTC field to 0 just
          * to make old BIOSes fail more predictably.
          */
-        rtc_set_memory(rtc, 0x5f, 0);
+        mc146818rtc_set_cmos_data(rtc, 0x5f, 0);
     } else {
-        rtc_set_memory(rtc, 0x5f, cpus_count - 1);
+        mc146818rtc_set_cmos_data(rtc, 0x5f, cpus_count - 1);
     }
 }
 
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index 076e2d0d22..d00280c0f8 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -215,10 +215,10 @@ static int prep_set_cmos_checksum(DeviceState *dev, void *opaque)
 
     if (object_dynamic_cast(OBJECT(dev), TYPE_MC146818_RTC)) {
         MC146818RtcState *rtc = MC146818_RTC(dev);
-        rtc_set_memory(rtc, 0x2e, checksum & 0xff);
-        rtc_set_memory(rtc, 0x3e, checksum & 0xff);
-        rtc_set_memory(rtc, 0x2f, checksum >> 8);
-        rtc_set_memory(rtc, 0x3f, checksum >> 8);
+        mc146818rtc_set_cmos_data(rtc, 0x2e, checksum & 0xff);
+        mc146818rtc_set_cmos_data(rtc, 0x3e, checksum & 0xff);
+        mc146818rtc_set_cmos_data(rtc, 0x2f, checksum >> 8);
+        mc146818rtc_set_cmos_data(rtc, 0x3f, checksum >> 8);
 
         object_property_add_alias(qdev_get_machine(), "rtc-time", OBJECT(rtc),
                                   "date");
diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index b4d7777634..c27c362db9 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -739,13 +739,13 @@ static uint64_t cmos_ioport_read(void *opaque, hwaddr addr,
     }
 }
 
-void rtc_set_memory(MC146818RtcState *s, int addr, int val)
+void mc146818rtc_set_cmos_data(MC146818RtcState *s, int addr, int val)
 {
     if (addr >= 0 && addr <= 127)
         s->cmos_data[addr] = val;
 }
 
-int rtc_get_memory(MC146818RtcState *s, int addr)
+int mc146818rtc_get_cmos_data(MC146818RtcState *s, int addr)
 {
     assert(addr >= 0 && addr <= 127);
     return s->cmos_data[addr];
@@ -857,7 +857,7 @@ static void rtc_notify_suspend(Notifier *notifier, void *data)
 {
     MC146818RtcState *s = container_of(notifier, MC146818RtcState,
                                        suspend_notifier);
-    rtc_set_memory(s, 0xF, 0xFE);
+    mc146818rtc_set_cmos_data(s, 0xF, 0xFE);
 }
 
 static const MemoryRegionOps cmos_ops = {
diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc.h
index a6b0c135c0..97cec0b3e8 100644
--- a/include/hw/rtc/mc146818rtc.h
+++ b/include/hw/rtc/mc146818rtc.h
@@ -53,8 +53,8 @@ struct MC146818RtcState {
 
 MC146818RtcState *mc146818_rtc_init(ISABus *bus, int base_year,
                                     qemu_irq intercept_irq);
-void rtc_set_memory(MC146818RtcState *s, int addr, int val);
-int rtc_get_memory(MC146818RtcState *s, int addr);
+void mc146818rtc_set_cmos_data(MC146818RtcState *s, int addr, int val);
+int mc146818rtc_get_cmos_data(MC146818RtcState *s, int addr);
 void qmp_rtc_reset_reinjection(Error **errp);
 
 #endif /* HW_RTC_MC146818RTC_H */
-- 
2.38.1


