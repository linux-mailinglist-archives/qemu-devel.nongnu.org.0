Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9A365DFF2
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 23:24:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDBti-0000pK-KI; Wed, 04 Jan 2023 17:06:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBtf-0000n7-7r
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:06:07 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBtc-0005NE-6U
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:06:06 -0500
Received: by mail-ed1-x52e.google.com with SMTP id z11so34707691ede.1
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 14:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ML6wRiyFlYJ0aSJ3m/RlR9qnqnqYeCYdx+C4vqE1q1o=;
 b=tOcrrXr/ZKEL1dv6XM/UVZADyYAKSFhSQfIDLGLOYafYj6WohiAvbR/v9z2WOwyo9Z
 AV2G0X5kV/MJS+JBvt9wptuqe/Fma27TyVsTrHyjrSppz6iDLIOVDr8YcTUWOTZfyxcO
 08ywThR/Wa48OTO4EcQTfifr4rNp6M91we0gEeLaSph9bFYsb31c7kvM1R+rHGt67iRG
 zT8PLwdiIcNT/yUrksVCawE7JdeacVk2v1W5i2sDCCkNz9xqM6YmBwWxJTrNoN/aqcfH
 gq6uuOCQtOBSj9CLN1HJTmKGjCOS8rOY41TeF5dGPqt04Y1fToOO2fYZR6eEusXYDOvc
 XadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ML6wRiyFlYJ0aSJ3m/RlR9qnqnqYeCYdx+C4vqE1q1o=;
 b=AaVVgNKlwyl8WwViYJkN1xkD6Q2ROmaaZpKTbqnVuGz4vfezZ94iJWoPvTR/Cvgsxy
 MDS3VRz7jifXHdoVpSGBGpW3AOouYOLqLZKMkyK8v2xYYthPy7t0rxwBr9/+VK8e9c0Y
 i7y7SblgiLTWQ+5e+VivHVCgayFhOLCexfRHhXyOJd9nhYkk8lLU/NGo/utkGdbGae1t
 NXasF+7TWJTCU9KZQDrEOpZXWXxoBIkRIjoElP6ZfXtkN1CXUl/16IUFZNycEk/fK4R6
 cocxMukBJIhlojKjyG/BJ2pgpH5Qep5um+PFM3UYo26Uq0+P3lwcuC9QjDlt1qN2LWwj
 px+g==
X-Gm-Message-State: AFqh2kpzk9TcB7OhOG/C/FhQouueTQjlk1FcAfepDMGE6wPrrJbNGul8
 m+8GvMXRFEctlAzKzTdJXqjxoIzZfB7caIjr
X-Google-Smtp-Source: AMrXdXuwHWoiZfdnaURlksKYNEZeOtc5DKp6SUKtNhJyNUF7TZrWadD7hU3UA4xtYFyPntnELUboEg==
X-Received: by 2002:a50:fc15:0:b0:470:31fb:cdcc with SMTP id
 i21-20020a50fc15000000b0047031fbcdccmr44308754edr.6.1672869960630; 
 Wed, 04 Jan 2023 14:06:00 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 dn5-20020a05640222e500b004610899742asm15387750edb.13.2023.01.04.14.05.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Jan 2023 14:06:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Mark Burton <mburton@qti.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>, Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 08/20] hw/xtensa: Use generic DeviceState instead of
 PFlashCFI01
Date: Wed,  4 Jan 2023 23:04:37 +0100
Message-Id: <20230104220449.41337-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104220449.41337-1-philmd@linaro.org>
References: <20230104220449.41337-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52e.google.com
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

Nothing here requires access to PFlashCFI01 internal fields:
use the inherited generic DeviceState.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


