Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 573C963BE40
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 11:50:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozyA6-0003xp-L5; Tue, 29 Nov 2022 05:48:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>)
 id 1ozyA4-0003xW-SX; Tue, 29 Nov 2022 05:48:24 -0500
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>)
 id 1ozyA3-0002wJ-2O; Tue, 29 Nov 2022 05:48:24 -0500
Received: by mail-io1-xd30.google.com with SMTP id g26so9068840iob.11;
 Tue, 29 Nov 2022 02:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pXjPHtQ/uypXvAxHBCSi3SfPZv1lj6MWRPpQ5oxiQxc=;
 b=Mranf7m89VwkWnS8W+GErvWuE/McEozRdc5foD9EGIKxVOMlq1UbTBoOTC1U+6GQnr
 CM4/i0YMjyFD89PIJmMiFsZzrpbx+QajaoP3ZPqaPFYX32qXmTUKNSEQdleSP+h58ar6
 I4yqPb9uiHPUOkNoY3iQd8kKV3Y2IrRkX5uJnZNfPEHqTQu+x2KoHIRpMEuLqbcxdytd
 NxVRmgNZu0xYPnUU9QLF8rVpcXlV04g09DPBxymwH2qyEfn72AGVgNE2nbGqLPU9l7f4
 fF3H7NbGQZPAJKYUVkQfraggx9ywQmyOsKKCT1qWAs7Wij/7o9ZEnZGYThyCgNErmU8J
 ZEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pXjPHtQ/uypXvAxHBCSi3SfPZv1lj6MWRPpQ5oxiQxc=;
 b=Yr/RqjqhKd3ry+ocvxrYJiGBLeie1FUXazrj8N7I3LMpVA2BGpl8chKqpD0jAiHnXy
 BhXgeAt+Qhtp+oKxV54LS2Im34US1367FCPDhdycAgrwMP+dd0RC6JVANWW0WSjo3PYb
 GnuzR0KSEM0ik/gg65nf0LyW7HKXzvno8lUS/5+D4LE0/gA2PymwOoQb21CrRoYlAwAj
 YXI2+KBaiRDgMcHTQ/02jQvtIAofBg1Gi0Hdq2z0jNVo5Q9691c0iqulX2QDGCz6bsdc
 fLwHKkS23REG9Iw6dvq5kOcUWC6bF2c88fqTLUSSwB5PjoEpAn48c8a8ujp9WF/JzKp0
 70SQ==
X-Gm-Message-State: ANoB5pmZEwttALhCgYXY5Y97iiYRjsQRbhf2cc+JJaNRmrl7bggejXSx
 w1Tns80HjI+s+Nq4Un7Fd/M=
X-Google-Smtp-Source: AA0mqf6qv+MRM03BdjCFzZj14smRmQW/kDO6ru6f9R9HztVzRcRBtYCk3J26DrEap9FOd146FTDh4A==
X-Received: by 2002:a5d:8f84:0:b0:6d9:56fc:ef25 with SMTP id
 l4-20020a5d8f84000000b006d956fcef25mr16682671iol.56.1669718901528; 
 Tue, 29 Nov 2022 02:48:21 -0800 (PST)
Received: from MBP.lan (ec2-18-117-95-84.us-east-2.compute.amazonaws.com.
 [18.117.95.84]) by smtp.gmail.com with ESMTPSA id
 p3-20020a92c603000000b002e85e8b8d1dsm4604370ilm.5.2022.11.29.02.48.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Nov 2022 02:48:20 -0800 (PST)
From: Schspa Shi <schspa@gmail.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Schspa Shi <schspa@gmail.com>
Subject: [PATCH v2 1/1] hw/arm/boot: set initrd with #[address/size]-cells
 type in fdt
Date: Tue, 29 Nov 2022 18:48:09 +0800
Message-Id: <20221129104809.84860-1-schspa@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=schspa@gmail.com; helo=mail-io1-xd30.google.com
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
---
 hw/arm/boot.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 57efb61ee419..98cd1fdad2c6 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -638,15 +638,17 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
     }
 
     if (binfo->initrd_size) {
-        rc = qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-start",
-                                   binfo->initrd_start);
+        rc = qemu_fdt_setprop_sized_cells(fdt, "/chosen", "linux,initrd-start",
+                                     acells, binfo->initrd_start);
         if (rc < 0) {
             fprintf(stderr, "couldn't set /chosen/linux,initrd-start\n");
             goto fail;
         }
 
-        rc = qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
-                                   binfo->initrd_start + binfo->initrd_size);
+        rc = qemu_fdt_setprop_sized_cells(fdt, "/chosen", "linux,initrd-end",
+                                          scells,
+                                          binfo->initrd_start +
+                                          binfo->initrd_size);
         if (rc < 0) {
             fprintf(stderr, "couldn't set /chosen/linux,initrd-end\n");
             goto fail;
-- 
2.37.3


