Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE31664DBF2
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 14:09:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5nhW-00078M-7w; Thu, 15 Dec 2022 07:51:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5nh7-0006qR-Qu
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:43 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5nh6-00045o-6Q
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:37 -0500
Received: by mail-wm1-x335.google.com with SMTP id v7so13711696wmn.0
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 04:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=14LvpKp7/VTsP7I0u8An5rfr4jPKW0e5uC6loLOGGqM=;
 b=i9Lc8fig3YxW+a3N8hY3WNsQUnERcl1Sm5i/KXqznGM9KDRV8U+4zeV7B3lgieTwim
 rquH1YsTZLWzQf06Sn3q/CREEBjF9OQKwJvmzD61KfyCAuSYpQrpIKy+NyhbIGc2+1ms
 6FQhwGjRrliCZed8THx1XHJHE+o5yd+m4ELJA068cQz8Lu5uIh/tnafbFFenw6Eh4k5M
 dBGEMeVu9qc+2dO0PU+kui5u/kWxE4suYim65HfKdVYBn2Sf1asGAjUjL3oquMLCQj5/
 j7Yt2WbYbqEDCW93eW1SqSjB1soyX+mfjaEwQMKgKP/QZHK8xXKYKg+4gWIQkaZfisDO
 lgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=14LvpKp7/VTsP7I0u8An5rfr4jPKW0e5uC6loLOGGqM=;
 b=D45MUkLV2J0n0Q4wmasmRV01hhx6mgnPO0yLQ18epm3mzVdYaw8ZTHOVprDXUtAYT6
 R3IlId6Tc7Z1D/+rCLrfRDyOiPveDsRQX+umBlxAcZKip4JlcC+lgf7T/ySkmlxpy4n7
 59l5LvCG8vHMsX//Hy4fpoEC9B/pB/ztkWoMY5akKM1SL18Wp800MOdNt8L3ZvtdrSTt
 vFheZGHoeiPZ+xM2Iq+uBeqf4kO5eA5vniM2l7Rusxyu5NzJb0kgV3VWeYMiPgnW9dG0
 EY8uGqZuApHXrsCsa6wBv9JdY5FRrDravBCqwxr5Pg7SeH7itVKaPeiX8RVblBBIF8aV
 ycbA==
X-Gm-Message-State: ANoB5pn1jW6rwa8n+FYw2dJ+RcMlrmihfRO4b4Ue74ZF2e8XBKQRM30k
 LmGkG1vO4neaO48I0AkEbQ90/lr8Q+WXBmrg
X-Google-Smtp-Source: AA0mqf6wSbpH+Ay8BSjd+22eK/VqgVPddhhfTBA8rniJim+EFV1fvyGR1PEl75xFzdLGnB3F/HXbEA==
X-Received: by 2002:a05:600c:1da2:b0:3cf:5fd2:87a0 with SMTP id
 p34-20020a05600c1da200b003cf5fd287a0mr20915844wms.40.1671108635426; 
 Thu, 15 Dec 2022 04:50:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a05600c354c00b003cfd64b6be1sm8388787wmq.27.2022.12.15.04.50.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 04:50:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/29] hw/arm/boot: set initrd with #address-cells type in fdt
Date: Thu, 15 Dec 2022 12:50:06 +0000
Message-Id: <20221215125009.980128-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215125009.980128-1-peter.maydell@linaro.org>
References: <20221215125009.980128-1-peter.maydell@linaro.org>
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

From: Schspa Shi <schspa@gmail.com>

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

This doesn't affect any machine types we currently support, because
for all of our machine types the RAM starts well below the 4GB
mark, but it does demonstrate that we're not currently writing
the device-tree properties quite as intended.

To fix it, we can change it to write these values to the dtb using a
type width matching #address-cells.  This is the intended size for
these dtb properties, and is how u-boot, for instance, writes them,
although in practice the Linux kernel will cope with them being any
width as long as they're big enough to fit the value.

Signed-off-by: Schspa Shi <schspa@gmail.com>
Message-id: 20221129160724.75667-1-schspa@gmail.com
[PMM: tweaked commit message]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/boot.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 15c2bf1867f..3d7d11f782f 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -656,15 +656,17 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
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
2.25.1


