Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60376320B08
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 15:45:25 +0100 (CET)
Received: from localhost ([::1]:51416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDpzA-0001EO-7a
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 09:45:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpp3-0005pW-O3
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:34:57 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpp2-0002QQ-5L
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:34:57 -0500
Received: by mail-wr1-x42a.google.com with SMTP id r3so4695876wro.9
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iQCdnP7/+IinBGfjLqtzcKPEH1MPJ2eJ7nepr+C+eeM=;
 b=eiEpgAH/wSedsja1tL1Cilo5NZNM2Z2YK4YzlX87nvNAQeVIecIAEfKqmC39E9eVvU
 sdWGXdwEg0SkM1rI5BxaiCIK/J+8EY5odN81eC49Wb8rIBCRvPUwrWRaSxox9ls/YT5W
 HeBfyMubdKQOto1oleXSDUW1S4rfI0GwMxuYRnYoZ3FM/5JfFM1CDHUN21di6Fs/Roy0
 zDFDKgsC4uLWVv4XzGdR98tjQTcuIusRqkgJD8uDWj+YmwSHXEdoVF7l59gq63PaRDfZ
 3FhZZMO79orEQ7/Ft/Tg7aaV1n2qhpixemNjtR/v7DVoRLxuDi/hTNLCcEakf3L/8ABC
 BATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iQCdnP7/+IinBGfjLqtzcKPEH1MPJ2eJ7nepr+C+eeM=;
 b=gzNJz8eagE3kQ8KTa2K7e2L0uVCD7RLPeYgB/kyqqR5/iPqTeSTuv5jVLX7xC+or9Y
 DtOTsnoaM9a6PySR1X9lWMfYYetZk9LZT2sBd3vvdXVPFU3/Ebi8Vx9+WI1ZogSXGkUk
 H6cMhJ31an9Sy+26Plt96fhEBrT/0ttLca4oVvh52h9Y/ZiULkxqp7jWl7H47BGET/bT
 J/6qdTzEpPbLsQa9TUrYL2gz/cxN/noc7wjsJS5BefLXjWeo7sOLri75xF7+TJjOf1Cb
 GStQ5nnTKkKiT9wzF53dDXywMnVKxVlToXexAGM+mvGZVHdbgG77O4Zgdl6fq28Il12O
 RGDw==
X-Gm-Message-State: AOAM533L451g3t6+d+trZTzzEig8x3yoyygGsPGj7KUrLQ5ioiZecQfe
 3KLFWosG8a6ScdUGiheT2WBL1U0NGcw=
X-Google-Smtp-Source: ABdhPJzA/6G5P5PBGJ/Ri4PNBP9SdqRKfnyRdFI92XZ3IlaMAKaGIqE3iUFC+BWewf1LaMkISGQ1Cg==
X-Received: by 2002:adf:ea48:: with SMTP id j8mr17622014wrn.197.1613918094717; 
 Sun, 21 Feb 2021 06:34:54 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f7sm21771819wmh.39.2021.02.21.06.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:34:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/43] hw/mips/boston: Use bl_gen_kernel_jump to generate
 bootloaders
Date: Sun, 21 Feb 2021 15:33:53 +0100
Message-Id: <20210221143432.2468220-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

Replace embedded binary with generated code.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201215064507.30148-2-jiaxun.yang@flygoat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: Split original patch as one for each machine (here boston)]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/boston.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 467fbc1c8be..b976c8199a1 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -27,6 +27,7 @@
 #include "hw/ide/ahci.h"
 #include "hw/loader.h"
 #include "hw/loader-fit.h"
+#include "hw/mips/bootloader.h"
 #include "hw/mips/cps.h"
 #include "hw/pci-host/xilinx-pcie.h"
 #include "hw/qdev-clock.h"
@@ -324,21 +325,7 @@ static void gen_firmware(uint32_t *p, hwaddr kernel_entry, hwaddr fdt_addr,
      * a2/$6 = 0
      * a3/$7 = 0
      */
-    stl_p(p++, 0x2404fffe);                     /* li   $4, -2 */
-                                                /* lui  $5, hi(fdt_addr) */
-    stl_p(p++, 0x3c050000 | ((fdt_addr >> 16) & 0xffff));
-    if (fdt_addr & 0xffff) {                    /* ori  $5, lo(fdt_addr) */
-        stl_p(p++, 0x34a50000 | (fdt_addr & 0xffff));
-    }
-    stl_p(p++, 0x34060000);                     /* li   $6, 0 */
-    stl_p(p++, 0x34070000);                     /* li   $7, 0 */
-
-    /* Load kernel entry address & jump to it */
-                                                /* lui  $25, hi(kernel_entry) */
-    stl_p(p++, 0x3c190000 | ((kernel_entry >> 16) & 0xffff));
-                                                /* ori  $25, lo(kernel_entry) */
-    stl_p(p++, 0x37390000 | (kernel_entry & 0xffff));
-    stl_p(p++, 0x03200009);                     /* jr   $25 */
+    bl_gen_jump_kernel(&p, 0, (int32_t)-2, fdt_addr, 0, 0, kernel_entry);
 }
 
 static const void *boston_fdt_filter(void *opaque, const void *fdt_orig,
-- 
2.26.2


