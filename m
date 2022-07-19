Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7B957A615
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 20:07:33 +0200 (CEST)
Received: from localhost ([::1]:41492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDrd7-0001zd-0k
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 14:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrXA-0007XQ-Kx
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:01:24 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:40736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrX8-0006Hf-Sp
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:01:24 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 z12-20020a056830128c00b0061c8168d3faso10528468otp.7
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 11:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NBaJd4q7TryS4+64HwKQjWDsbbhPf203AEbfA4LAr2k=;
 b=aRFhM6NXRS1BtM7kJQEL3idICJWz9duj1tFd0cWCu7xqwG/sL7VfbqEBtynbML8r8D
 xXYa+M3H2Ouz4z95HiaaKJwO93Hb+VlYKp4Zf5xlOblaLLqguFtkrXnH4s3zu5PEDRtB
 kkIWgwKI7ey9F5vbAjn5eLQLUYs/TSv39FrpoLQwiqj7j1c1j5pZtMIZ5wrpxLKPYTT2
 Bl6NeITG7Xz7kybWmsUdZ45TytpxSvIIcTA+5NgOsIDwPlj0tjrLxQcenK3sH3QMTzu4
 +4PoIdlZL8yZOPAStiWcd2I/pFSeB0lbCzLIjKq2EXj1orfXhJVefD1WXydJZzD1l7vq
 oxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NBaJd4q7TryS4+64HwKQjWDsbbhPf203AEbfA4LAr2k=;
 b=HBHPn7poU0t9acmQ0qyCEoiOXg7AwzY2p8ceqV6ASoxQkMbQEEObq81A4DWwQC6zVd
 5ELo9TuBC83nFwHgs0nBBhUqqW4EAXRmDTPLd5/fE6pyuVdJhHk35WwUPnejFdcyg5VA
 s2Ex0pL4mWVc7tGi6highM7nybmUAkoSjL22jyxGlH4vXyHjoQ0Nf8Ch9QygR/Of8zPb
 ybXIdFsm30XghnNAxtbyu3wdUMvOW0H3VS5leg35cpDmzN6LP+rrEMf+a2B4+iSaxp3g
 Q4ccrTYoYuHCZNAIGptjtVJDEWh2ux4vAZpdC3/8RuLF8yjaLTx7kyFQDPRTlsXIIzNu
 l3uw==
X-Gm-Message-State: AJIora/DmIeWxayGN595R6yNrM114B9iWXaBsQUtzXrAxNmvQTO+BrkB
 r1bPm+KQn4WhqltbNNk8OwTrQ/JSrZPdgrYZ
X-Google-Smtp-Source: AGRyM1tXwuM6zdLG8wTpMy2Awtd/ZRGcJbdwCTWYe06wo0A+OqyGyqGtLHEC8wr/Ps0rdnHRhql2Mg==
X-Received: by 2002:a05:6830:4110:b0:61c:9c0f:3cba with SMTP id
 w16-20020a056830411000b0061c9c0f3cbamr6203923ott.157.1658253681699; 
 Tue, 19 Jul 2022 11:01:21 -0700 (PDT)
Received: from stoup.. ([172.58.110.182]) by smtp.gmail.com with ESMTPSA id
 c25-20020a4ae259000000b0035eb4e5a6cesm6286747oot.36.2022.07.19.11.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 11:01:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL 17/21] hw/loongarch: Add uefi bios loading support
Date: Tue, 19 Jul 2022 23:29:56 +0530
Message-Id: <20220719180000.378186-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220719180000.378186-1-richard.henderson@linaro.org>
References: <20220719180000.378186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Add uefi bios loading support, now only uefi bios is porting to
loongarch virt machine.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Message-Id: <20220712083206.4187715-3-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/loongarch/virt.h |  4 ++++
 hw/loongarch/loongson3.c    | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
index 9fec1f8a5c..ec37d86e44 100644
--- a/include/hw/loongarch/virt.h
+++ b/include/hw/loongarch/virt.h
@@ -18,6 +18,8 @@
 #define LOONGARCH_ISA_IO_BASE   0x18000000UL
 #define LOONGARCH_ISA_IO_SIZE   0x0004000
 #define VIRT_FWCFG_BASE         0x1e020000UL
+#define VIRT_BIOS_BASE          0x1c000000UL
+#define VIRT_BIOS_SIZE          (4 * MiB)
 
 struct LoongArchMachineState {
     /*< private >*/
@@ -27,6 +29,8 @@ struct LoongArchMachineState {
     MemoryRegion lowmem;
     MemoryRegion highmem;
     MemoryRegion isa_io;
+    MemoryRegion bios;
+    bool         bios_loaded;
     /* State for other subsystems/APIs: */
     FWCfgState  *fw_cfg;
 };
diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index 9ee7450252..3f1849b8b0 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -310,6 +310,37 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
     loongarch_devices_init(pch_pic);
 }
 
+static void loongarch_firmware_init(LoongArchMachineState *lams)
+{
+    char *filename = MACHINE(lams)->firmware;
+    char *bios_name = NULL;
+    int bios_size;
+
+    lams->bios_loaded = false;
+    if (filename) {
+        bios_name = qemu_find_file(QEMU_FILE_TYPE_BIOS, filename);
+        if (!bios_name) {
+            error_report("Could not find ROM image '%s'", filename);
+            exit(1);
+        }
+
+        bios_size = load_image_targphys(bios_name, VIRT_BIOS_BASE, VIRT_BIOS_SIZE);
+        if (bios_size < 0) {
+            error_report("Could not load ROM image '%s'", bios_name);
+            exit(1);
+        }
+
+        g_free(bios_name);
+
+        memory_region_init_ram(&lams->bios, NULL, "loongarch.bios",
+                               VIRT_BIOS_SIZE, &error_fatal);
+        memory_region_set_readonly(&lams->bios, true);
+        memory_region_add_subregion(get_system_memory(), VIRT_BIOS_BASE, &lams->bios);
+        lams->bios_loaded = true;
+    }
+
+}
+
 static void reset_load_elf(void *opaque)
 {
     LoongArchCPU *cpu = opaque;
@@ -369,6 +400,9 @@ static void loongarch_init(MachineState *machine)
                              get_system_io(), 0, LOONGARCH_ISA_IO_SIZE);
     memory_region_add_subregion(address_space_mem, LOONGARCH_ISA_IO_BASE,
                                 &lams->isa_io);
+    /* load the BIOS image. */
+    loongarch_firmware_init(lams);
+
     /* fw_cfg init */
     lams->fw_cfg = loongarch_fw_cfg_init(ram_size, machine);
     rom_set_fw(lams->fw_cfg);
-- 
2.34.1


