Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C817158A940
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 12:12:29 +0200 (CEST)
Received: from localhost ([::1]:54080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJuJg-0002Lt-Tj
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 06:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtoo-0007bQ-Id
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:40:36 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b]:46623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtob-0001dv-5E
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:40:27 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id x125so1888130vsb.13
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 02:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=x7DAsznkbtImnLCnedJbCBhvUT58/EO/hETMQi4QGgo=;
 b=Bjw4TlNhZAkYt1SyD0gXhzG2LyLTtGnlvJIGyuoTMFdt/6N2LzEf6867stiHvV2ITd
 ZA35s6XGLvZ9C+ZvoaA4VuxDMkfw7NSJAfzVZ8d1Lt8bDx/HN7WF3XQ2NIQz/56tdSqb
 M/51oSu0eTz1DSbsS/GaGj4L/0x5yDaeRnGjxJmOwweSyvMzXKtixmawN3lp8U/uQseE
 PFa6pxqE4CyRrzMZB4CPRMiPHXfpsGuUsv4UAAKzEnysuSf6uV8R+JPGLPYzYQ3b640n
 ErkZHOygO8UqwV1PBK8OKPeMLz4nPAM5pDU9UQAAcgL0DQ0/7eMDYCNrGcEUqwOylMHY
 3veA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=x7DAsznkbtImnLCnedJbCBhvUT58/EO/hETMQi4QGgo=;
 b=DdeAqzpzqS+6F4+2E6zK5Wm9gGDSECYusQu4q6T2BZJLUB8pVOB39QWmfVPhckvqdC
 K6d39TLlz51H4R8zBlIMybHg5t31YTbCzANP8RbVDN3gd3xYG4yCWa5zlpDi2nfQLquz
 1aJX0oodj1XPoKG0p9MPWEtEofNSEPMO0ru3ZlKuEi2cotypQvgLhZe5SsR4kEpd5efs
 dTtKuREcJHfsX6+o3eORBA4PyQ2MzrNueleK8k2FEouQw0oiky/LWiH1+SvNz7ud+yDZ
 34wmKHIxAhJ0CU19A8xSdIhCbCEI0KlawFoC+ZakFGasUmdazX5aCE1Y/P9L++qIrhR3
 rHAQ==
X-Gm-Message-State: ACgBeo0nXUVXNoBsL7lrC6XafuOvnSvWNN0uOq2LpfaCrRkkGa9q2cS3
 6ISpsd+ggMF9NQ+wZ6kwqd+/41gqouo=
X-Google-Smtp-Source: AA6agR4fqyNNjJbzYM9QCWJtor/6E4PePcAX8yu6Pyxd7ED241pZkO/u2qdVcRAhgzmCdlRFeoxd5g==
X-Received: by 2002:a67:ee12:0:b0:385:7059:ac88 with SMTP id
 f18-20020a67ee12000000b003857059ac88mr2612813vsp.85.1659692419654; 
 Fri, 05 Aug 2022 02:40:19 -0700 (PDT)
Received: from balboa.COMFAST ([191.19.239.67])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a1f1f09000000b00376f4f93745sm2668496vkf.10.2022.08.05.02.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 02:40:19 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH for-7.2 v2 12/20] hw/riscv: set machine->fdt in
 spike_board_init()
Date: Fri,  5 Aug 2022 06:39:40 -0300
Message-Id: <20220805093948.82561-13-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220805093948.82561-1-danielhb413@gmail.com>
References: <20220805093948.82561-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe2b.google.com
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
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/riscv/spike.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index e41b6aa9f0..2909f7b2a1 100644
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
@@ -304,6 +306,15 @@ static void spike_board_init(MachineState *machine)
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[SPIKE_DRAM].base,
                                    machine->ram_size, s->fdt);
+
+    /*
+     * Update the machine->fdt pointer to enable support for
+     * 'dumpdtb'and 'info fdt' commands. Use fdt_pack() to
+     * shrink the blob size we're going to store.
+     */
+    fdt_pack(s->fdt);
+    machine->fdt = s->fdt;
+
     /* load the reset vector */
     riscv_setup_rom_reset_vec(machine, &s->soc[0], memmap[SPIKE_DRAM].base,
                               memmap[SPIKE_MROM].base,
-- 
2.36.1


