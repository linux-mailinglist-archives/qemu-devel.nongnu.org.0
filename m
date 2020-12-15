Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A46D2DAEB1
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:15:23 +0100 (CET)
Received: from localhost ([::1]:44580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpB6n-0003D3-8E
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:15:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4X-0001XH-1B
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:13:01 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:39561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4O-00079V-2e
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:13:00 -0500
Received: by mail-wm1-x335.google.com with SMTP id 3so18629084wmg.4
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 06:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TM8X4iK9h8+8ZfJgrQHMpFiW1HdJJ6sLTcGF4MsNIDg=;
 b=fenOcJyx6Z/3UBwYIKvLsB74CgcRDpY9JtrMQMQpDtYUPlw2nOvv4eXgmFQG8MshGe
 eQMh+hojEguSaDu/2pwT965B4PIS3ruJn1q86yNy+wWFlmi4F2vaXTaRPA9JtKeF84+Z
 RsO+YE+6cVebCqD+pshD7K8e4S+mL2P4JhO4VSy8IMdQClO9/sLGFad9Qd4qBbd4gHmP
 e6iXPstsmP4SnMXFhzsTJBF/z17/RhSdMdoGseA4eYvPDXt3ZYQc69hS4qn/NrXbQk2H
 i2RfD6Kt5lZ6uwh4TdEJRpKxshxnl/bjdUFe3GrjWzado1jwL5fG7kuY4z6Dk/9xnYDG
 5VXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TM8X4iK9h8+8ZfJgrQHMpFiW1HdJJ6sLTcGF4MsNIDg=;
 b=n6JlbjuJjLzZU9/XyVx3rBBQ3fWq3vlS5oHXro7x6LVH4GWY34PNeL/wgveTjppG6p
 bPTaZspWc0q+ODIX2f6Atm52SabPlgBrDXpnU2f/lRcqoblj9LvjNLPF8EBXe0mwghv6
 q2xSAcwhruuTWSIpte+mlqS8m1HPQzQ9U9NgA5j+V5BzdTzRMvvInET+WBaDsjwYXLPo
 woveEX2gHv8Ff52bxlCVAsVNnAWJdxw7ScFjOYZaFdN3ivRgRgwRBVGjbWIoztQ5VlXO
 JOdrZgUz1elICw61Vcej97dLOa4mtyPRN02ZcUSvhOkC346CS1TSZ9UBeskc++lwkLQ5
 BH6Q==
X-Gm-Message-State: AOAM533IoS0zi4X8ic735aPRevrzpkJ+Fo83N/3SeMs4FEdz7Pr21VFQ
 bR5PfYsw0EzI07+1ezfxK1xslNaq+/+UBw==
X-Google-Smtp-Source: ABdhPJxs8fpIqHVAcDX4DD7qog815XYySThfHx4tre3ytXdktyxVDKpGtiCuCCm5WTU21JZWxoB+Cw==
X-Received: by 2002:a1c:6746:: with SMTP id b67mr32936746wmc.8.1608041570396; 
 Tue, 15 Dec 2020 06:12:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w21sm19667319wmi.45.2020.12.15.06.12.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 06:12:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/20] hw/core/loader.c: Improve reporting of ROM overlap errors
Date: Tue, 15 Dec 2020 14:12:26 +0000
Message-Id: <20201215141237.17868-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201215141237.17868-1-peter.maydell@linaro.org>
References: <20201215141237.17868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In rom_check_and_register_reset() we report to the user if there is
a "ROM region overlap". This has a couple of problems:
 * the reported information is not very easy to intepret
 * the function just prints the overlap to stderr (and relies on
   its single callsite in vl.c to do an error_report() and exit)
 * only the first overlap encountered is diagnosed

Make this function use error_report() and error_printf() and
report a more user-friendly report with all the overlaps
diagnosed.

Sample old output:

rom: requested regions overlap (rom dtb. free=0x0000000000008000, addr=0x0000000000000000)
qemu-system-aarch64: rom check and register reset failed

Sample new output:

qemu-system-aarch64: Some ROM regions are overlapping
These ROM regions might have been loaded by direct user request or by default.
They could be BIOS/firmware images, a guest kernel, initrd or some other file loaded into guest memory.
Check whether you intended to load all this guest code, and whether it has been built to load to the correct addresses.

The following two regions overlap (in the cpu-memory-0 address space):
  phdr #0: /home/petmay01/linaro/qemu-misc-tests/ldmia-fault.axf (addresses 0x0000000000000000 - 0x0000000000008000)
  dtb (addresses 0x0000000000000000 - 0x0000000000100000)

The following two regions overlap (in the cpu-memory-0 address space):
  phdr #1: /home/petmay01/linaro/qemu-misc-tests/bad-psci-call.axf (addresses 0x0000000040000000 - 0x0000000040000010)
  phdr #0: /home/petmay01/linaro/qemu-misc-tests/bp-test.elf (addresses 0x0000000040000000 - 0x0000000040000020)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201129203923.10622-3-peter.maydell@linaro.org
---
 hw/core/loader.c | 48 ++++++++++++++++++++++++++++++++++++++++++------
 softmmu/vl.c     |  1 -
 2 files changed, 42 insertions(+), 7 deletions(-)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index 45aaba6158b..9feca32de98 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -1176,10 +1176,42 @@ static bool roms_overlap(Rom *last_rom, Rom *this_rom)
         last_rom->addr + last_rom->romsize > this_rom->addr;
 }
 
+static const char *rom_as_name(Rom *rom)
+{
+    const char *name = rom->as ? rom->as->name : NULL;
+    return name ?: "anonymous";
+}
+
+static void rom_print_overlap_error_header(void)
+{
+    error_report("Some ROM regions are overlapping");
+    error_printf(
+        "These ROM regions might have been loaded by "
+        "direct user request or by default.\n"
+        "They could be BIOS/firmware images, a guest kernel, "
+        "initrd or some other file loaded into guest memory.\n"
+        "Check whether you intended to load all this guest code, and "
+        "whether it has been built to load to the correct addresses.\n");
+}
+
+static void rom_print_one_overlap_error(Rom *last_rom, Rom *rom)
+{
+    error_printf(
+        "\nThe following two regions overlap (in the %s address space):\n",
+        rom_as_name(rom));
+    error_printf(
+        "  %s (addresses 0x" TARGET_FMT_plx " - 0x" TARGET_FMT_plx ")\n",
+        last_rom->name, last_rom->addr, last_rom->addr + last_rom->romsize);
+    error_printf(
+        "  %s (addresses 0x" TARGET_FMT_plx " - 0x" TARGET_FMT_plx ")\n",
+        rom->name, rom->addr, rom->addr + rom->romsize);
+}
+
 int rom_check_and_register_reset(void)
 {
     MemoryRegionSection section;
     Rom *rom, *last_rom = NULL;
+    bool found_overlap = false;
 
     QTAILQ_FOREACH(rom, &roms, next) {
         if (rom->fw_file) {
@@ -1187,12 +1219,12 @@ int rom_check_and_register_reset(void)
         }
         if (!rom->mr) {
             if (roms_overlap(last_rom, rom)) {
-                fprintf(stderr, "rom: requested regions overlap "
-                        "(rom %s. free=0x" TARGET_FMT_plx
-                        ", addr=0x" TARGET_FMT_plx ")\n",
-                        rom->name, last_rom->addr + last_rom->romsize,
-                        rom->addr);
-                return -1;
+                if (!found_overlap) {
+                    found_overlap = true;
+                    rom_print_overlap_error_header();
+                }
+                rom_print_one_overlap_error(last_rom, rom);
+                /* Keep going through the list so we report all overlaps */
             }
             last_rom = rom;
         }
@@ -1201,6 +1233,10 @@ int rom_check_and_register_reset(void)
         rom->isrom = int128_nz(section.size) && memory_region_is_rom(section.mr);
         memory_region_unref(section.mr);
     }
+    if (found_overlap) {
+        return -1;
+    }
+
     qemu_register_reset(rom_reset, NULL);
     roms_loaded = 1;
     return 0;
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 7146fbe2198..cbf3896ce66 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3278,7 +3278,6 @@ static void qemu_machine_creation_done(void)
     qemu_run_machine_init_done_notifiers();
 
     if (rom_check_and_register_reset() != 0) {
-        error_report("rom check and register reset failed");
         exit(1);
     }
 
-- 
2.20.1


