Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AFD63C4B1
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 17:09:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p039D-0000nA-28; Tue, 29 Nov 2022 11:07:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>)
 id 1p0392-0000lz-Pk; Tue, 29 Nov 2022 11:07:41 -0500
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>)
 id 1p0390-0007hI-W3; Tue, 29 Nov 2022 11:07:40 -0500
Received: by mail-il1-x129.google.com with SMTP id m15so6826380ilq.2;
 Tue, 29 Nov 2022 08:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dwGyFwx/c/Mx5FUbAtVsabtI3r+1lLq2BDX9DBMPq9U=;
 b=SseVo9xV6na9aGtwen4TCbDdpVpNjun/QakOebrd9E4rMHqaDpJf4U5AMZWNNAwBXu
 Pnu/2w6Su2ZY4gPiZi0CoAf9WiR1/oOgMJY1A40AgKOyEMiMNrUQ5R80QgPJUvQn9cxS
 1A9Ku8Y3yOmSdEstj++B82uhyVGYhnOIEgE4xqucOJmAnYqKhmJJWdzNIf7sBkH+RHEg
 HDlk3gZ5ZASPfH8Rkq474SbLWj5o7B67/2s7/fqFWRqCGsr0e1HpTHZpxqxpmgsV+Jl3
 2zdU5anULh75UkbNMqQWDXV3WHPqtGhW0zsXqePVOpHKGrHroCPONO+OCR23nCWdOZQn
 511g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dwGyFwx/c/Mx5FUbAtVsabtI3r+1lLq2BDX9DBMPq9U=;
 b=oepVs9tGdoTsqzmQIOLLW0ChUOLxSA1p83vQYgVx9YTtRuPR75MIuFZBOJfoXCDqNu
 8ew/IkTIwj1i+Wuq8+9ymPKITtzNxQ0LxcexHzLmToK0kFw3MmPiRU2WuV38F+OwFlII
 I6eJfkyVfBRQEtiimJ6UF3Mk24LwoFHstA6JGOy7MavKcYCqaw6p9ux/WMp0DkbYjjnB
 sD1gw6evKFaIEJGSFoVHBozEbKzp1HJERYzO2XzO3MltFUhNkplRkZfrExcfihE2Q9xb
 WoSokIZMoBRb59vpjiyg0WOcFDWrFXp/XhK7SGnNj/o+9FaeB/tODv2Oi1wnzMO/HinF
 C4UQ==
X-Gm-Message-State: ANoB5pmLvx+SWKr//gPn3rukBYzNbGizYRi8FdLHnbr16J5za9/Gj+KQ
 xflJxZn/jA5wXIfHzkwx5sM=
X-Google-Smtp-Source: AA0mqf7c+Gm8EsctTVvXGu+yiy1KfHFznNAz9jlyZO3DZM0uQXvr8sxPRovRTSipAXlV3MxJWZVmYA==
X-Received: by 2002:a05:6e02:c65:b0:302:f4f5:8691 with SMTP id
 f5-20020a056e020c6500b00302f4f58691mr11898761ilj.206.1669738055101; 
 Tue, 29 Nov 2022 08:07:35 -0800 (PST)
Received: from MBP.lan (ec2-18-117-95-84.us-east-2.compute.amazonaws.com.
 [18.117.95.84]) by smtp.gmail.com with ESMTPSA id
 c94-20020a029667000000b00387de9e9627sm5491608jai.88.2022.11.29.08.07.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Nov 2022 08:07:34 -0800 (PST)
From: Schspa Shi <schspa@gmail.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Schspa Shi <schspa@gmail.com>
Subject: [PATCH v3 1/1] hw/arm/boot: set initrd with #address-cells type in fdt
Date: Wed, 30 Nov 2022 00:07:24 +0800
Message-Id: <20221129160724.75667-1-schspa@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=schspa@gmail.com; helo=mail-il1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

We use 32bit value for linux,initrd-[start/end], when we have
loader_start > 4GB, there will be a wrong initrd_start passed
to the kernel, and the kernel will report the following warning.

[    0.000000] ------------[ cut here ]------------
[    0.000000] initrd not fully accessible via the linear mapping -- please check your bootloader ...
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/arm64/mm/init.c:355 arm64_memblock_init+0x158/0x244
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Tainted: G        W          6.1.0-rc3-13250-g30a0b95b1335-dirty #28
[    0.000000] Hardware name: Horizon Sigi Virtual development board (DT)
[    0.000000] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    0.000000] pc : arm64_memblock_init+0x158/0x244
[    0.000000] lr : arm64_memblock_init+0x158/0x244
[    0.000000] sp : ffff800009273df0
[    0.000000] x29: ffff800009273df0 x28: 0000001000cc0010 x27: 0000800000000000
[    0.000000] x26: 000000000050a3e2 x25: ffff800008b46000 x24: ffff800008b46000
[    0.000000] x23: ffff800008a53000 x22: ffff800009420000 x21: ffff800008a53000
[    0.000000] x20: 0000000004000000 x19: 0000000004000000 x18: 00000000ffff1020
[    0.000000] x17: 6568632065736165 x16: 6c70202d2d20676e x15: 697070616d207261
[    0.000000] x14: 656e696c20656874 x13: 0a2e2e2e20726564 x12: 0000000000000000
[    0.000000] x11: 0000000000000000 x10: 00000000ffffffff x9 : 0000000000000000
[    0.000000] x8 : 0000000000000000 x7 : 796c6c756620746f x6 : 6e20647274696e69
[    0.000000] x5 : ffff8000093c7c47 x4 : ffff800008a2102f x3 : ffff800009273a88
[    0.000000] x2 : 80000000fffff038 x1 : 00000000000000c0 x0 : 0000000000000056
[    0.000000] Call trace:
[    0.000000]  arm64_memblock_init+0x158/0x244
[    0.000000]  setup_arch+0x164/0x1cc
[    0.000000]  start_kernel+0x94/0x4ac
[    0.000000]  __primary_switched+0xb4/0xbc
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000001000000000-0x0000001007ffffff]

To fix it, we can change it to #[address/size]-cells type.

Signed-off-by: Schspa Shi <schspa@gmail.com>

--

Changelog:
v1 -> v2:
        - Use #[address/size]-cells for data type.
v2 -> v3:
        - Use #address-cells for all data type.
        - Fix indent.
---
 hw/arm/boot.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 57efb61ee419..b109b8cd7d5a 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -638,15 +638,17 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
     }
 
     if (binfo->initrd_size) {
-        rc = qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-start",
-                                   binfo->initrd_start);
+        rc = qemu_fdt_setprop_sized_cells(fdt, "/chosen", "linux,initrd-start",
+                                          acells, binfo->initrd_start);
         if (rc < 0) {
             fprintf(stderr, "couldn't set /chosen/linux,initrd-start\n");
             goto fail;
         }
 
-        rc = qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
-                                   binfo->initrd_start + binfo->initrd_size);
+        rc = qemu_fdt_setprop_sized_cells(fdt, "/chosen", "linux,initrd-end",
+                                          acells,
+                                          binfo->initrd_start +
+                                          binfo->initrd_size);
         if (rc < 0) {
             fprintf(stderr, "couldn't set /chosen/linux,initrd-end\n");
             goto fail;
-- 
2.37.3


