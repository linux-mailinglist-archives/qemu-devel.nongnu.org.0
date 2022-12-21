Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFBC65362B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:24:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83kt-0008SR-82; Wed, 21 Dec 2022 13:23:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83kr-0008OZ-66
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:23:49 -0500
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83kp-0007rx-Ml
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:23:48 -0500
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-144b21f5e5fso20087314fac.12
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UCo1YHm2H4SIqdKOmUrpwX43J8/JiKOmCLBYdwukgIg=;
 b=nbkickxKkDusAdflOl6IennIzQIF7amH+Q6DmXbOKlxtWUPkm9lLnqIi768miY7Jws
 KgCPVoPQc1dDY/3VXl7iAirx8fxbJz9HM2Ytk4ogmQBTyh6H4d/HUN7RRvKYVNJt/C9t
 ouwgUVrzy3D8qZ3f2EK2/EejIqw7CTLfntiKxmbyTD78OBUYibPX8nIL0Nx6zNg3+kcf
 BTyFGdXVvsTgMGh0XfWyH4MnOrv7sdr7r0WUa5ChMlP6Lm0QJcZ9KDI7BcqNE4d4ch3k
 ukDNXzf3JpkWu4/3Z52uPORvLh0ck2CI2Gz62tiUHJGVVZFP2gmGHkFZ+VY/xs3hVjyQ
 /yRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UCo1YHm2H4SIqdKOmUrpwX43J8/JiKOmCLBYdwukgIg=;
 b=HDtwvHcqUeb5w3hVHljHHM8oFDrkf6fG1+Lr2lMG0TbnczRfLaRnEQyqIc1uJ4FhQl
 qNPboJ+ktCmtfXAv4qm94XPLlKi96eKlZY2v5BE/AnrYgI5GH7/pdDbe++CTHl53ZByi
 MCD+Bl5Fv1BMij9qfEeqMNsYUSYtFDF9q5rzK9h9bozZbBroI4K0doDZlz69JzjAFeFm
 7mGk17s14JSBc63oELjshtL9DLb6xZcLXcebCmvTlCEtEOw7TcGryBxEOoBpTOYtW0xM
 P8MxoRDVt5o1/m/Gy5h2nZ+t/agMqUPt9fL8U/Hon4Bq+uOAeFQ7UQZAFNz+IFY4GGyn
 ySlg==
X-Gm-Message-State: AFqh2kr0/t7L9Zn9YMhX6DbSGHHaFY2VaAbxxmWsKcvzZxXfGyOefJBN
 5DzLiUO+amZimsSywSMDRGIXSP2AEbWVeZ7p
X-Google-Smtp-Source: AMrXdXvly/jXyJg7Apg5CkvGcD+/AS4YohlTaEqJ0VUFRSAsLI4/ST09RHfVsE6bNMMj5S4ZbyFv4Q==
X-Received: by 2002:a05:6871:4501:b0:144:fc01:370 with SMTP id
 nj1-20020a056871450100b00144fc010370mr1237461oab.0.1671647026806; 
 Wed, 21 Dec 2022 10:23:46 -0800 (PST)
Received: from fedora.. (201-43-103-101.dsl.telesp.net.br. [201.43.103.101])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a056871060800b0014c8685f229sm514577oan.10.2022.12.21.10.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:23:46 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 14/15] hw/riscv/virt.c: simplify create_fdt()
Date: Wed, 21 Dec 2022 15:22:59 -0300
Message-Id: <20221221182300.307900-15-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221182300.307900-1-dbarboza@ventanamicro.com>
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2f.google.com
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

'mem_size' and 'cmdline' aren't being used and the MachineState pointer
is being retrieved via a MACHINE() macro.

Remove 'mem_size' and 'cmdline' and add MachineState as a parameter.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/virt.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 11c903a212..b13299cee8 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -998,10 +998,9 @@ static void create_fdt_fw_cfg(RISCVVirtState *s, const MemMapEntry *memmap)
     g_free(nodename);
 }
 
-static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
-                       uint64_t mem_size, const char *cmdline, bool is_32_bit)
+static void create_fdt(MachineState *mc, RISCVVirtState *s,
+                       const MemMapEntry *memmap, bool is_32_bit)
 {
-    MachineState *mc = MACHINE(s);
     uint32_t phandle = 1, irq_mmio_phandle = 1, msi_pcie_phandle = 1;
     uint32_t irq_pcie_phandle = 1, irq_virtio_phandle = 1;
     uint8_t rng_seed[32];
@@ -1498,8 +1497,7 @@ static void virt_machine_init(MachineState *machine)
     virt_flash_map(s, system_memory);
 
     /* create device tree */
-    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
-               riscv_is_32bit(&s->soc[0]));
+    create_fdt(machine, s, memmap, riscv_is_32bit(&s->soc[0]));
 
     s->machine_done.notify = virt_machine_done;
     qemu_add_machine_init_done_notifier(&s->machine_done);
-- 
2.38.1


