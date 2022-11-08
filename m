Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 930BA6206D9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 03:37:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osET3-0004yK-Ao; Mon, 07 Nov 2022 21:36:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>)
 id 1osET0-0004xm-VY; Mon, 07 Nov 2022 21:35:59 -0500
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>)
 id 1osESz-00044A-7X; Mon, 07 Nov 2022 21:35:58 -0500
Received: by mail-il1-x136.google.com with SMTP id e19so6856707ili.4;
 Mon, 07 Nov 2022 18:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f62dMkEZw1/VeoGmNwIOgwTYv39sXyhjpPSKZPA4t+g=;
 b=ccsxEzQY14gstyXGTTJWJVucgZuywqn21P9YZN/SEhtrISsM15RzLJ8Jk/+Aan4MyX
 LTJspw3N+A7dWVkJ8C15gGhOpSDB1OLIgifFOWPG1+3zxy3RCiC7Ks5qvMKr43dD5HEW
 0KPe+Spd9T4AbUDpOB+wiyM/WGIw2/QnIOph1zzGDNwbwInt5SzZXUMIDgcc7OHZW2Fs
 Y3vY4sVgQveqYBpHvN4M1y+Y8KeK70CZTqOWxX3xWiiLciB3rRvhx5oy/lUQ3FMxC37R
 Ugts543DqHkIurPeHXuA1hJH+0G6pljnrHLPvktlOQaQzK3yQIw9d6yT++znB+rmDWQ/
 YcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f62dMkEZw1/VeoGmNwIOgwTYv39sXyhjpPSKZPA4t+g=;
 b=Awq8dt+6EzugTa96nhkMUm0tzPzc+0VhADy+k0uxyAfDK5WNlLy6r12yYHlWFYAJ4o
 CEIvL5JPA42mTzrly00SpRYAw8z4P4Yn9IYMTLOGEN1rxrloWXCBCKXIk5H668inxcog
 NIO/yykMw9LeBtrqEz3PuK39iBrIKrimyBD51lqucp/4H3jkjeWv0XRfQzEC1H82Rl4K
 2xsfEnF4WclcueOkPQLA71mHbcAXK7WCrtIdrz+WZ9JbBSUla/syUXU+Wgw0KxySEi3g
 NOyzKoNtO0PR8bPbMc4r3vLKryfX65waMWa0a0wN+Pl6Oq9JlIJFu7IUUAUfB7hkpxg2
 4CnA==
X-Gm-Message-State: ACrzQf0bZcSswNYLlSEsUAFat7UniogbIqt4Cb6qgWcf9pzULIFixRoG
 Bo8vAZoBp8kGktanelMZJbA=
X-Google-Smtp-Source: AMsMyM6csPaRKnJyGVpZmW4d/A7YH9aKoOvmdj+sk3HbE+m/+nDkTbpPLW29yPGnuTK74dPUEsQE3g==
X-Received: by 2002:a05:6e02:14c4:b0:300:99b4:47f1 with SMTP id
 o4-20020a056e0214c400b0030099b447f1mr28792826ilk.8.1667874954864; 
 Mon, 07 Nov 2022 18:35:54 -0800 (PST)
Received: from MBP.lan (ec2-18-117-95-84.us-east-2.compute.amazonaws.com.
 [18.117.95.84]) by smtp.gmail.com with ESMTPSA id
 p21-20020a02b015000000b003750cd6e9f2sm3302743jah.177.2022.11.07.18.35.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Nov 2022 18:35:54 -0800 (PST)
From: Schspa Shi <schspa@gmail.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Schspa Shi <schspa@gmail.com>
Subject: [PATCH] hw/arm/boot: set initrd parameters to 64bit in fdt
Date: Tue,  8 Nov 2022 10:35:42 +0800
Message-Id: <20221108023542.17557-1-schspa@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=schspa@gmail.com; helo=mail-il1-x136.google.com
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

To fix it, we can change it to u64 type.

Signed-off-by: Schspa Shi <schspa@gmail.com>
---
 hw/arm/boot.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 57efb61ee419..da719a4f8874 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -638,14 +638,14 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
     }
 
     if (binfo->initrd_size) {
-        rc = qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-start",
+        rc = qemu_fdt_setprop_u64(fdt, "/chosen", "linux,initrd-start",
                                    binfo->initrd_start);
         if (rc < 0) {
             fprintf(stderr, "couldn't set /chosen/linux,initrd-start\n");
             goto fail;
         }
 
-        rc = qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
+        rc = qemu_fdt_setprop_u64(fdt, "/chosen", "linux,initrd-end",
                                    binfo->initrd_start + binfo->initrd_size);
         if (rc < 0) {
             fprintf(stderr, "couldn't set /chosen/linux,initrd-end\n");
-- 
2.37.3


