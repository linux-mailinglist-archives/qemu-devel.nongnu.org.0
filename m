Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD45465362F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:24:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83kf-0008Ai-UE; Wed, 21 Dec 2022 13:23:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83ke-0008A8-2F
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:23:36 -0500
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1p83kc-0007s0-FJ
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:23:35 -0500
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1442977d77dso20122096fac.6
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TlMNl+y5tE2XtGKVprHcbifOvzze22gNRp7j44Ksk+A=;
 b=hvyAZRW1huwQMKfWZ3QSyzVfJPUjOCBqXJOARO20Le1a5t3JRrWcDs9T2cPEx9ExoW
 t/TTNVCRMquwrzPChHiVluCdhWcLBZ6NurLbeyGJJEnC5ocbLTo8RtDhLZjKWmxki1FO
 TLHV7bzQ0oHVf4vikSjUEDLxJoqFZo6N9LKSTmGMk0ONhOEDYUD3O9jkGfGqYeGziwh+
 HOiKq2EXPp5EVCYztp+iQCJFvsy4IuP97kbe7+ur9A7+EinWe6fau4oA8lTHJww42PZl
 7i/BUrxNjnxgZJ4vcv9811ar5aa0fYrR2Airyh+puMthHc5mGUIlZeN3BAaN4morY67f
 d2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TlMNl+y5tE2XtGKVprHcbifOvzze22gNRp7j44Ksk+A=;
 b=op2Zk/nFOC/ZP8KSZxyoXPvNGYhys6wnJE6+bmGLOFWm0YpnRD7OZHYBONYsAmFKP8
 cMZ8pHDCK8VtXlm9qk2b1yV5/wNL8+ULoVpk9+bCvn8SBEn314QhN6E031u7i+Nl934L
 Xt9DHWv3JgPLL7dT1yO46IZqIO9DIb6f6PChACRSvfVeJmBN0VGBPoH3BMa+B+riqiCb
 PI5jCF4h+NUr75ybLlOqQVukDaCidfnVOJOPVanTwhDBuXenfuHeC3oQlKQYhVmc/lwc
 2HyydSJ19ygbwh25OxCqZolIFPfrsLihq7hOFlxnxq1tVdi8HfpO1ESnSOwyRluR7DQS
 FTng==
X-Gm-Message-State: AFqh2koFb2UMs6s727z9bltOIXuN92x67VM5pKg3UV4qSc9Q5PJrQpBn
 45RnXHEB62OtC/K2c4zaBuGgCW8GOk7kswP7
X-Google-Smtp-Source: AMrXdXtmhQnHDRaMny7znpBe3fiDn6lkDsY6KzhAxtTHK6g3U5+wsaiIymhB4KVrrHRX78pBxqQ0iw==
X-Received: by 2002:a05:6870:46a6:b0:148:15ba:886d with SMTP id
 a38-20020a05687046a600b0014815ba886dmr1630064oap.54.1671647013213; 
 Wed, 21 Dec 2022 10:23:33 -0800 (PST)
Received: from fedora.. (201-43-103-101.dsl.telesp.net.br. [201.43.103.101])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a056871060800b0014c8685f229sm514577oan.10.2022.12.21.10.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:23:32 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 08/15] hw/riscv: write bootargs 'chosen' FDT after
 riscv_load_kernel()
Date: Wed, 21 Dec 2022 15:22:53 -0300
Message-Id: <20221221182300.307900-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221182300.307900-1-dbarboza@ventanamicro.com>
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The sifive_u, spike and virt machines are writing the 'bootargs' FDT
node during their respective create_fdt().

Given that bootargs is written only when '-append' is used, and this
option is only allowed with the '-kernel' option, which in turn is
already being check before executing riscv_load_kernel(), write
'bootargs' in the same code path as riscv_load_kernel().

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/sifive_u.c | 11 +++++------
 hw/riscv/spike.c    |  9 +++++----
 hw/riscv/virt.c     | 11 +++++------
 3 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 37f5087172..3e6df87b5b 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -117,7 +117,6 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
             error_report("load_device_tree() failed");
             exit(1);
         }
-        goto update_bootargs;
     } else {
         fdt = ms->fdt = create_device_tree(&fdt_size);
         if (!fdt) {
@@ -510,11 +509,6 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop_string(fdt, "/aliases", "serial0", nodename);
 
     g_free(nodename);
-
-update_bootargs:
-    if (cmdline && *cmdline) {
-        qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
-    }
 }
 
 static void sifive_u_machine_reset(void *opaque, int n, int level)
@@ -611,6 +605,11 @@ static void sifive_u_machine_init(MachineState *machine)
             riscv_load_initrd(machine->initrd_filename, machine->ram_size,
                               kernel_entry, machine->fdt);
         }
+
+        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
+            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
+                                    machine->kernel_cmdline);
+        }
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index e08de61205..6d50abd425 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -178,10 +178,6 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
 
     qemu_fdt_add_subnode(fdt, "/chosen");
     qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", "/htif");
-
-    if (cmdline && *cmdline) {
-        qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
-    }
 }
 
 static void spike_board_init(MachineState *machine)
@@ -284,6 +280,11 @@ static void spike_board_init(MachineState *machine)
             riscv_load_initrd(machine->initrd_filename, machine->ram_size,
                               kernel_entry, machine->fdt);
         }
+
+        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
+            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
+                                    machine->kernel_cmdline);
+        }
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 5967b136b4..6c946b6def 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1012,7 +1012,6 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
             error_report("load_device_tree() failed");
             exit(1);
         }
-        goto update_bootargs;
     } else {
         mc->fdt = create_device_tree(&s->fdt_size);
         if (!mc->fdt) {
@@ -1050,11 +1049,6 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
     create_fdt_fw_cfg(s, memmap);
     create_fdt_pmu(s);
 
-update_bootargs:
-    if (cmdline && *cmdline) {
-        qemu_fdt_setprop_string(mc->fdt, "/chosen", "bootargs", cmdline);
-    }
-
     /* Pass seed to RNG */
     qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
     qemu_fdt_setprop(mc->fdt, "/chosen", "rng-seed", rng_seed, sizeof(rng_seed));
@@ -1294,6 +1288,11 @@ static void virt_machine_done(Notifier *notifier, void *data)
             riscv_load_initrd(machine->initrd_filename, machine->ram_size,
                               kernel_entry, machine->fdt);
         }
+
+        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
+            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
+                                    machine->kernel_cmdline);
+        }
     } else {
        /*
         * If dynamic firmware is used, it doesn't know where is the next mode
-- 
2.38.1


