Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC5E5B272D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 21:52:51 +0200 (CEST)
Received: from localhost ([::1]:39418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWNZz-0005wm-0L
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 15:52:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWNOq-0005hN-QR; Thu, 08 Sep 2022 15:41:21 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35]:37525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWNOp-0007Ej-5F; Thu, 08 Sep 2022 15:41:20 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-127f5411b9cso15831622fac.4; 
 Thu, 08 Sep 2022 12:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=DW1rSBh0neqmDcZLST7TOdBTISrO3R2UrJPNhSW5CJY=;
 b=B3LO9U1UR/kqjdy82M9NlFIsSSILuR3tR3gVuOhrj9vXp++7eK/bPDyskG4cSbNJqJ
 t2uebMzjBwS2DdT7WLPpSllwuvE57wVFfvvSL4NZrkCtstMFrQ6mHQa+Cmak+m+2LKhQ
 SBjoq3zjGRHhJQoEU8irkX+GwuuLUi8dk3c/pcqVg6xMEBnzPGmR9UxaN85lioRqO9dj
 jBXdGUvNIDuTiu9Bm6dgBqkx4rJpiZxCUP6OAB7eXOfdJ/0x98CoLwlpxVFSgokDTSH1
 80hU4PK4A3lKA2bbdrJ+0/FeYXtLZrsDEPiZikKteDdNSMZC7BwOuZ907HARUg2a+n0g
 wqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=DW1rSBh0neqmDcZLST7TOdBTISrO3R2UrJPNhSW5CJY=;
 b=wxrAn7K31ZZz9u+kzevfJo7eagce3QGYm5CWwVMskXNlm/Tc/pgoAn1NJVxs69aZdO
 oHbWL4VE2qc5BatYBoBXa6CxhhFriTcqMeb2d6WtmyYmQ1FRSVKK+2DXhzpgVCc5GZ6B
 iR5bmqX/7C2zus4QQngg/o9B96af1Zeh9ZJ26WYZwzjSJqTTjNgjWNeHQOX1Jaxp2Hic
 xCvEZl+4fknDjjrpJ0icNV+lUmmkGrAkb8PbE2yhNDjcRudr+pApu9fcUxLrkv/Pue/t
 ewMms+HUzX1DL3lM7UtjVe5v8cG9CgYZrA0aO3zZQHkUkfVq9eZoMo3oN1+X1kCfx42B
 /eJQ==
X-Gm-Message-State: ACgBeo0o9h2gWh2bUZiLcc/xz6m19nofDjKGRnXSDUo41+2R5nkJansy
 AYevPjrvOG4JUd5ohQe0JFQqtU6M5YbJJQ==
X-Google-Smtp-Source: AA6agR4/R0EpeybHtMAjh6KkJzUTl9UwJDtol5C9W3GIz03jsUR9SyiXHWe4wlZAn1q15K1haJY1Ew==
X-Received: by 2002:a05:6870:7394:b0:126:6f7b:15a2 with SMTP id
 z20-20020a056870739400b001266f7b15a2mr2707288oam.227.1662666076999; 
 Thu, 08 Sep 2022 12:41:16 -0700 (PDT)
Received: from balboa.ibmuc.com (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 3-20020aca0703000000b0033ad6ea8d11sm2839849oih.47.2022.09.08.12.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 12:41:16 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v7 12/14] hw/riscv: set machine->fdt in spike_board_init()
Date: Thu,  8 Sep 2022 16:40:38 -0300
Message-Id: <20220908194040.518400-13-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220908194040.518400-1-danielhb413@gmail.com>
References: <20220908194040.518400-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x35.google.com
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

This will enable support for the 'dumpdtb' QMP/HMP command for the spike
machine.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/riscv/spike.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 5ba34543c8..1e1d752c00 100644
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
@@ -304,6 +306,10 @@ static void spike_board_init(MachineState *machine)
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[SPIKE_DRAM].base,
                                    machine->ram_size, s->fdt);
+
+    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
+    machine->fdt = s->fdt;
+
     /* load the reset vector */
     riscv_setup_rom_reset_vec(machine, &s->soc[0], memmap[SPIKE_DRAM].base,
                               memmap[SPIKE_MROM].base,
-- 
2.37.2


