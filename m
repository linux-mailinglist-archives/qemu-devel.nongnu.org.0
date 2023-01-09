Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 507A5662557
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:19:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqxw-0000Ba-S1; Mon, 09 Jan 2023 07:09:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqxv-0000B9-99
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:09:23 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqxs-00061W-5l
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:09:23 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so6508757wms.4
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 04:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nfl9vSICdKM0NyWoDAVGk3SRqJjMJWSIIowMTStBvnw=;
 b=om2W/3DDStD8FxqLQespwo5dTpdpCesXi31T0xbE9BOX12rQOPigt4M+75N/gV6++i
 yjp6Cv9osl6uhgz/oF3VyxG6T+gPv07+mnQan951HGHSrqVlYqHF0G4acdQgJGQdndDU
 SfNwI9xNx/lWo1yvzI5HADM7FjCwcspqg52/4sIunGur9QI3STX0nGONGHgZy1NzN/nf
 QPzlYkasVt72u2kIiiM/qCAJvquEdzK5KiU9VUMPq+IdSCQPzDixVPT0kkm4Wa/lvzlK
 9/CCp4ba6InAHzN1oBmJ28wmgf4Q77YJPSvTNy/tq1dRW+SJMO3QnphKrxYCpZScC1kX
 C58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nfl9vSICdKM0NyWoDAVGk3SRqJjMJWSIIowMTStBvnw=;
 b=jC5z29G4k9ofb6atSjA+6T/n34AUHnOAU3+SchNkQBTfVLOldp+PWJTfdveBFWX+A5
 m6vXEVGD7D59eTWdmGWGPS0GVTm2cAuH9us0+J+HVZUC8PgGuuEjr+rPC2s4GvoylZ9e
 AuCHmWapVmYHN3ib0+TVbIttY1FuyhcIWXurrSrlJJcwfL/J5YpD6NoRdWt9IcdthKzG
 9unHc94R8EmGE5HC/BNHm1EFeRjiqRVt7geTwj9QAQHZ4XfaxW6lUIf2Mu0HvpwpYSN5
 lF70W5eHFSZgvQCugmakJ2P7sVrUgyyaHTYtlz0lbMPNq49QcmSALkEbiguVGOahJV97
 ns9w==
X-Gm-Message-State: AFqh2krcuGNog0R73WQ4uCpzRpVcDtMBIx/Gl+rJps5A1fbprgFQNeGa
 7TPnpWMHTl6m2tDxVjRcHLffzYsSyWHenH19
X-Google-Smtp-Source: AMrXdXuPHaifiCqNV15lvdqTO5nrowfZ4kHyuf16GgALh5ShgBA1pqsZ2eNAqLVIHgBMG6misTxQgQ==
X-Received: by 2002:a05:600c:4b1b:b0:3d2:1d51:2477 with SMTP id
 i27-20020a05600c4b1b00b003d21d512477mr56304360wmp.11.1673266158265; 
 Mon, 09 Jan 2023 04:09:18 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a5d548f000000b002425dc49024sm8343577wrv.43.2023.01.09.04.09.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 04:09:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v2 09/21] hw/xtensa: Use generic DeviceState instead of
 PFlashCFI01
Date: Mon,  9 Jan 2023 13:08:21 +0100
Message-Id: <20230109120833.3330-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109120833.3330-1-philmd@linaro.org>
References: <20230109120833.3330-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

Nothing here requires access to PFlashCFI01 internal fields:
use the inherited generic DeviceState.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/xtensa/xtfpga.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
index bce3a543b0..b039416fde 100644
--- a/hw/xtensa/xtfpga.c
+++ b/hw/xtensa/xtfpga.c
@@ -165,7 +165,7 @@ static void xtfpga_net_init(MemoryRegion *address_space,
     memory_region_add_subregion(address_space, buffers, ram);
 }
 
-static PFlashCFI01 *xtfpga_flash_init(MemoryRegion *address_space,
+static DeviceState *xtfpga_flash_init(MemoryRegion *address_space,
                                       const XtfpgaBoardDesc *board,
                                       DriveInfo *dinfo, int be)
 {
@@ -183,7 +183,7 @@ static PFlashCFI01 *xtfpga_flash_init(MemoryRegion *address_space,
     sysbus_realize_and_unref(s, &error_fatal);
     memory_region_add_subregion(address_space, board->flash->base,
                                 sysbus_mmio_get_region(s, 0));
-    return PFLASH_CFI01(dev);
+    return dev;
 }
 
 static uint64_t translate_phys_addr(void *opaque, uint64_t addr)
@@ -231,7 +231,7 @@ static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *machine)
     XtensaMxPic *mx_pic = NULL;
     qemu_irq *extints;
     DriveInfo *dinfo;
-    PFlashCFI01 *flash = NULL;
+    DeviceState *flash = NULL;
     const char *kernel_filename = machine->kernel_filename;
     const char *kernel_cmdline = machine->kernel_cmdline;
     const char *dtb_filename = machine->dtb;
@@ -459,7 +459,7 @@ static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *machine)
         }
     } else {
         if (flash) {
-            MemoryRegion *flash_mr = pflash_cfi01_get_memory(DEVICE(flash));
+            MemoryRegion *flash_mr = pflash_cfi01_get_memory(flash);
             MemoryRegion *flash_io = g_malloc(sizeof(*flash_io));
             uint32_t size = env->config->sysrom.location[0].size;
 
-- 
2.38.1


