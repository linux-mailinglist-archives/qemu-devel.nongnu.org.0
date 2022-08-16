Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CB65961C2
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 20:02:04 +0200 (CEST)
Received: from localhost ([::1]:37586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO0t8-0007U2-C1
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 14:02:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0T8-0005Fe-Ua; Tue, 16 Aug 2022 13:35:13 -0400
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d]:35648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0T5-0002a7-9B; Tue, 16 Aug 2022 13:35:09 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id 67so10850221vsv.2;
 Tue, 16 Aug 2022 10:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=PLxCnDavL3XAQX8RlAlWZXySX+ubp7/4OOfpwRVaIdY=;
 b=VOD+RkIYfYtl2xZTUWxT4qiN0Lf3SVoH+8hIvS2w36ma5TZONck8xPWV6WRk0IRdns
 myObKBcpDD+8bG2UOM5CZ/Jom8/rQ3sfdmyp0DnSsNhObpH2UpziK0T+wfgLS9PyC1M2
 XgdtCtCaOKWAHeJEFITg5Oegll3HZJUYb9pyzQn4ChxBWmiBzYTv/BmIRvA7DQuoprrM
 1yF1noZUxSKOlD/41+32nLZMzHR9FcGiG4XPU5jXZkQvbEVmdhEIdNGl20eyWFVYW6V4
 GsWHfQPfhGGRYVOyaSKUF2/xf6P/TyCIQx2GDWXV/yaX8MGvGIx8/YSlEynOQDou0Ur6
 xNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=PLxCnDavL3XAQX8RlAlWZXySX+ubp7/4OOfpwRVaIdY=;
 b=Wj1fY+b/c3p/bhPJAJt1MBHfh58Nsc51tChaskSVmG16+9x5ebeC3yNGBZ7Ll+m3fE
 IQH3fuzqL6ArwSSIclREfsCrSTSs3PQXs/GGnKSwJyfXc6DoxHtAI26LLy8+Rfhzsl5Y
 oCloCiPTRzCrTfE5ndIIcBO8DFFlYfPq8jOopoEM9Y0AciAZYPdABNbLrnyObXu+qJu2
 bLWNt1y2vB7M+hNcCvBHbBvT8sr3xpFj/CHmgYm7mao60rku/+tU3icbKRjrG/c9YDHY
 oDFYFG0giJMmt9cIBiZR1ZtkO48NVYxaVYX7qzCcDiktBqboV7omT7meGa+9LhDe7ZSJ
 xjFw==
X-Gm-Message-State: ACgBeo32jjQTuxAp54gsvRMXJyLzcG4Nbq293DVGOyYNHxFs3if00qhU
 iSR/X6Bh8gbh2b218vKWZF2x2jYxoAWQJQ==
X-Google-Smtp-Source: AA6agR44x5qa8AWUO7iLukpyBFRR2UdDRCexSS3uCLEswC8s8xcDWByKdUwXpatFOYE71SDAW2o/wg==
X-Received: by 2002:a67:a245:0:b0:357:2f52:f324 with SMTP id
 t5-20020a67a245000000b003572f52f324mr9162502vsh.50.1660671305946; 
 Tue, 16 Aug 2022 10:35:05 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 16-20020a1f0210000000b00376b105115bsm8817539vkc.48.2022.08.16.10.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 10:35:05 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, alistair.francis@wdc.com,
 david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH for-7.2 v3 12/20] hw/riscv: set machine->fdt in
 spike_board_init()
Date: Tue, 16 Aug 2022 14:34:20 -0300
Message-Id: <20220816173428.157304-13-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220816173428.157304-1-danielhb413@gmail.com>
References: <20220816173428.157304-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

This will enable support for 'dumpdtb' and 'info fdt' HMP commands for
the spike machine.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/riscv/spike.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index e41b6aa9f0..17f517bfa6 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -40,6 +40,8 @@
 #include "sysemu/device_tree.h"
 #include "sysemu/sysemu.h"
 
+#include <libfdt.h>
+
 static const MemMapEntry spike_memmap[] = {
     [SPIKE_MROM] =     {     0x1000,     0xf000 },
     [SPIKE_HTIF] =     {  0x1000000,     0x1000 },
@@ -304,6 +306,13 @@ static void spike_board_init(MachineState *machine)
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[SPIKE_DRAM].base,
                                    machine->ram_size, s->fdt);
+
+    /*
+     * Update the machine->fdt pointer to enable support for
+     * 'dumpdtb' and 'info fdt' QMP/HMP commands.
+     */
+    machine->fdt = s->fdt;
+
     /* load the reset vector */
     riscv_setup_rom_reset_vec(machine, &s->soc[0], memmap[SPIKE_DRAM].base,
                               memmap[SPIKE_MROM].base,
-- 
2.37.2


