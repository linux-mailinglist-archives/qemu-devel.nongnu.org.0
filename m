Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8A65AC830
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 01:50:48 +0200 (CEST)
Received: from localhost ([::1]:34636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUzO3-0002Yf-Nv
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 19:50:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUz9O-00079V-8n; Sun, 04 Sep 2022 19:35:38 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:40689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUz9I-00057q-Pu; Sun, 04 Sep 2022 19:35:37 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-11f0fa892aeso18033778fac.7; 
 Sun, 04 Sep 2022 16:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=T2XPVnXjSf/goYp6DC/PRvFVzeZZ92N7U/dWPdd8yaM=;
 b=oTzqPKOswLH7w+igVrIqeX2qIOHYsJOsAIP7dyPw3DYf7tx7YJsXXv0xpck840LQqq
 p32K0PlxC1V3a7KB5ev368bj+LLCBrE6IYNH5DJOKQLjcOUiH/bHoP+BUaUfysHLlAkz
 M8aN+tsheymF0ZNguj7cUOkGY7d5iY2Dg6263urAH1GKrbxqMf+PGob4EiameEw+yJbj
 f49E1U1S27Uhbw0+U65jdxMKTBe9njTlFO/I5rq4SAmd1/VDD56Vo3LLGxDISsyxeXHZ
 lkyP5yb5hCtPF0qUqCVXWHfWefDU1MrjsHoPNN9GEyq7Q4HaqcNL2a0vRCWfVD0MmeJ5
 T/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=T2XPVnXjSf/goYp6DC/PRvFVzeZZ92N7U/dWPdd8yaM=;
 b=fa63uaFTw5u3owgZ++ZYAlZQZ64jjroo6b0WxeE9ZJAgtBmc5gJQ92RdflZKoc4oIa
 rh8L15PPfVohofun80EWjh0r61gTTpL17gqBVnrx1gXcuqssj6RXegmE1tPLANo9HHY4
 FCWGX1v18cAYM8tQ6r6SSRuKMaO+zAfJf8HujeBakOZ6Iu7bOoOlAULSpZqDCZVIXHm3
 ocp2YyO/ZZjbrCjGTeUzb+LuPh6UhfbfToFZmE7JE80hnPuVwI1zhlKZS01DZ3Uqqofs
 NRtOsTmUXJGtuJGV34USCEdbv2qjaHKkLs0+G0/pWR2ASnVnsfQG/8M4nj4tfGKnw4ve
 0/Rw==
X-Gm-Message-State: ACgBeo0uyUQUr6kVV8B6rPhtYxPG1WCp4aM2o2PGKA0y1GOvQctlEBQa
 LNfT+ws87jXyvc7zEfkhrhTTOE3PDPi0Ow==
X-Google-Smtp-Source: AA6agR4YMgM/j2Tlb1R+FOmTMqBvKMGe03VkEo5wa2uZZrHMKu9RIvJonXW9B46PCtmCoOiMQA5+wQ==
X-Received: by 2002:a05:6808:d46:b0:345:7b42:f987 with SMTP id
 w6-20020a0568080d4600b003457b42f987mr6503551oik.92.1662334531113; 
 Sun, 04 Sep 2022 16:35:31 -0700 (PDT)
Received: from balboa.ibmuc.com (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 o7-20020a4a9587000000b0044b4acd27c5sm2549793ooi.17.2022.09.04.16.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 16:35:30 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v6 12/14] hw/riscv: set machine->fdt in spike_board_init()
Date: Sun,  4 Sep 2022 20:34:54 -0300
Message-Id: <20220904233456.209027-13-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904233456.209027-1-danielhb413@gmail.com>
References: <20220904233456.209027-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
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
index e41b6aa9f0..a980e568a4 100644
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


