Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9422C7B31
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Nov 2020 21:42:07 +0100 (CET)
Received: from localhost ([::1]:43520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjTWI-0000DS-6p
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 15:42:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjTU2-0007Gy-La
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 15:39:46 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:40444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjTTk-0001I4-UL
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 15:39:46 -0500
Received: by mail-wr1-x442.google.com with SMTP id m6so12585149wrg.7
 for <qemu-devel@nongnu.org>; Sun, 29 Nov 2020 12:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ad0c4jjqo0MMN5YLMESrd8BQ23F4DSjdkon9WAKsMB0=;
 b=vVcU7EJStD2EJSoZycUfP6WmFxf2NRoJJLdpqDfVuEAZEanLGe77AcudBBMuNQCLZc
 gn66ZDKyQrMZU+BWqvKk3ZCj3+/MWSl9euYqIP6O8670a/9/UsWoLsfnAT7m1yNy1ECN
 7i9ME5ICjIJd3l83LdJY+XKdjIsS4QnxCm/9BOzA4uvMfy/jhNRGpoS3o56H53PM87Kt
 Yq8i5fZPaK/6R3tTMAtMa1+bN5ETyM0apIIG8uYaio8Gt68yflgLCw0ozFJaBmYZ80Mg
 n2zLYbaB8L2cPMifCYe7M3XCXO+Vaq6U0Pbs2bkh7n2LUc1fRfKArKoDGF0ygkVhmTav
 L+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ad0c4jjqo0MMN5YLMESrd8BQ23F4DSjdkon9WAKsMB0=;
 b=aXLN+qG5WBROzXE+p33oaJtT+NR0ojYk/yEGd810L3eEQzi4e8xBxCBZ7hZSlRe0Ub
 /0/WNnlBJSPAgoR+RF+oqUgUkyMbmEQ3vM/X8JQ49/w/VvxzVyGTmFNV4JbYHMBeaMwh
 OCUxDhWXay/nfQzM81ArT4Ub51EB8vN3izWeGyVJZJrfFcXDFjR4zXlfpZFHHC+1otfD
 0k1RPzTrzTmR+AKAGWaBjkCFF09eRnAuiCryeeU+8M4SMncvYfGcJ1DF0IhHyzekDUmv
 ZPywc6UA/mWcqRX6evY0thtCAEChi5aqsMg6NoJeNs+zFgstkhARV7+DwI5gmzKnfHaP
 K3wA==
X-Gm-Message-State: AOAM533hxNQxTy1Q/4mfwZwIEp1M7miquANTxxLzJJrmk45wxbcjn+ZH
 3o21T21xXwhwdf9ZTs79LGCmJTyO9NJRIA==
X-Google-Smtp-Source: ABdhPJznYnx7e9dwHpmHGGkG/Ly4orXy/5NS16sZoFifde5QUHDFARggvhRvZVCDvEmJpo+TdrRwmg==
X-Received: by 2002:adf:fc49:: with SMTP id e9mr24001784wrs.31.1606682367358; 
 Sun, 29 Nov 2020 12:39:27 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q12sm23618393wrx.86.2020.11.29.12.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 12:39:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] hw/core/loader.c: Improve reporting of ROM overlap errors
Date: Sun, 29 Nov 2020 20:39:21 +0000
Message-Id: <20201129203923.10622-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201129203923.10622-1-peter.maydell@linaro.org>
References: <20201129203923.10622-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x442.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
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
---
The sample output is from a completely bogus commandline where I just
loaded multiple clashing ELF files I had to hand using -device loader.
---
 hw/core/loader.c | 48 ++++++++++++++++++++++++++++++++++++++++++------
 softmmu/vl.c     |  1 -
 2 files changed, 42 insertions(+), 7 deletions(-)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index 05052ee797e..de3c319e34f 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -1175,10 +1175,42 @@ static bool roms_overlap(Rom *last_rom, Rom *this_rom)
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
@@ -1186,12 +1218,12 @@ int rom_check_and_register_reset(void)
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
@@ -1200,6 +1232,10 @@ int rom_check_and_register_reset(void)
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
index e6e0ad5a925..aa6fd3243d5 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -4459,7 +4459,6 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_run_machine_init_done_notifiers();
 
     if (rom_check_and_register_reset() != 0) {
-        error_report("rom check and register reset failed");
         exit(1);
     }
 
-- 
2.20.1


