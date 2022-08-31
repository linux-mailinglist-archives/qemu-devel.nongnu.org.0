Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A95985A86E3
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:40:42 +0200 (CEST)
Received: from localhost ([::1]:56994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTZp-0005Wi-OH
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:40:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSp4-0004Sw-3J; Wed, 31 Aug 2022 14:52:22 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:38864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSp2-00086e-Cs; Wed, 31 Aug 2022 14:52:21 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-11edd61a9edso20213858fac.5; 
 Wed, 31 Aug 2022 11:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=eRuOtmww+N+bCMvJnbCAtUQ6Ae7jXVO4RyIaOqVIulI=;
 b=IcGxbxnlBAQsCwaSycGF5XKocnsRSc+APVbusscMzJ1LYWOSxzxLSyBCRd4oBzh+V+
 7nJk8p3yj/gtrGzBxf6ywMrwx+a8BYg/OR32t1QCDdfAGhoRqZcb6fw2K205BIA0yPox
 j2VxP/CaJTXlKFI8O4fT7b50J0x8Rc7RYaBf8eiX/AnLdm7mg3B9chJyE1d+NaGo7UTn
 jHWdSCDMpgxtWN8jtMUoy8Tn6Wz0XNjCrdLRuAcOZ0HCCbiwQOmuTX55uxGl3E3ZZTnY
 ArOEuTU4ltXqhUBR/RlpUNCGqvucwL6i7+4Jw6a2iuznOv4K5+nEU3CpDXwsVlpTiJJq
 n3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=eRuOtmww+N+bCMvJnbCAtUQ6Ae7jXVO4RyIaOqVIulI=;
 b=DA7zcLRkf/Oj1v0wtdg7gvCq1Be70drykk6QJ68Rn/SAg/TG52K3NWX4FfkKabZA2Z
 HJsmrU3PmXsCYjXFM9wy02TGe1IbNLZbN5z0TrnMqBz25wyAeOY6TvIH75ooAm7TtB4W
 wPEgN6mr0kTbZlQF32Q46ERzihRg+xdoIwIQkDfB8pJMclKiVAxG8tYtJ25P3hFsBZZi
 atqL38m8CrtnvKGAT3A8y8jEpNNonnqDgvIQ/UUhaeH9njY9jHHY9aRV+QfSDoRtD7tK
 +9kQIbG+fIyiifLB8fR18+3ejjX5dmWDz7jbZdviB3U8fFCjW0yfEAT2b6XY6n/yFWIl
 yn/Q==
X-Gm-Message-State: ACgBeo3erczYDuoZh+VL5qbKYLEx1JeRdb2MyCSHtr+HgrtOIFbL5Boj
 a2uR9pZ87j021FqRv1KE2OILqUsmv2M=
X-Google-Smtp-Source: AA6agR7QVROkkw1nI4CikHZuQsLus7wELa9HeC0FHGb67cQfp0CoU6Y6S+5mYFJetq34vYEyLGmF5Q==
X-Received: by 2002:a05:6870:2d1:b0:11c:c06e:fb51 with SMTP id
 r17-20020a05687002d100b0011cc06efb51mr2050482oaf.261.1661971939210; 
 Wed, 31 Aug 2022 11:52:19 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:52:18 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PULL 34/60] ppc/ppc405: Introduce a PPC405 SoC
Date: Wed, 31 Aug 2022 15:50:08 -0300
Message-Id: <20220831185034.23240-35-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
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

From: Cédric Le Goater <clg@kaod.org>

It is an initial model to start QOMification of the PPC405 board.
QOM'ified devices will be reintroduced one by one. Start with the
memory regions, which name prefix is changed to "ppc405".

Also, initialize only one RAM bank. The second bank is a dummy one
(zero size) which is here to match the hard coded number of banks in
ppc405ep_init().

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <20220809153904.485018-6-clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc405.h        | 16 ++++++++++++++++
 hw/ppc/ppc405_boards.c | 23 ++++++++++++-----------
 hw/ppc/ppc405_uc.c     | 40 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+), 11 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 83f156f585..66dc21cdfe 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -25,6 +25,7 @@
 #ifndef PPC405_H
 #define PPC405_H
 
+#include "qom/object.h"
 #include "hw/ppc/ppc4xx.h"
 
 #define PPC405EP_SDRAM_BASE 0x00000000
@@ -62,6 +63,21 @@ struct ppc4xx_bd_info_t {
     uint32_t bi_iic_fast[2];
 };
 
+#define TYPE_PPC405_SOC "ppc405-soc"
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc405SoCState, PPC405_SOC);
+
+struct Ppc405SoCState {
+    /* Private */
+    DeviceState parent_obj;
+
+    /* Public */
+    MemoryRegion ram_banks[2];
+    hwaddr ram_bases[2], ram_sizes[2];
+
+    MemoryRegion *dram_mr;
+    hwaddr ram_size;
+};
+
 /* PowerPC 405 core */
 ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ram_addr_t ram_size);
 
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 381f39aa94..f029d6f415 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -57,6 +57,8 @@ struct Ppc405MachineState {
     /* Private */
     MachineState parent_obj;
     /* Public */
+
+    Ppc405SoCState soc;
 };
 
 /*****************************************************************************/
@@ -232,11 +234,10 @@ static void boot_from_kernel(MachineState *machine, PowerPCCPU *cpu)
 
 static void ppc405_init(MachineState *machine)
 {
+    Ppc405MachineState *ppc405 = PPC405_MACHINE(machine);
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     const char *kernel_filename = machine->kernel_filename;
     PowerPCCPU *cpu;
-    MemoryRegion *ram_memories = g_new(MemoryRegion, 2);
-    hwaddr ram_bases[2], ram_sizes[2];
     MemoryRegion *sysmem = get_system_memory();
     DeviceState *uicdev;
 
@@ -247,16 +248,16 @@ static void ppc405_init(MachineState *machine)
         exit(EXIT_FAILURE);
     }
 
-    /* XXX: fix this */
-    memory_region_init_alias(&ram_memories[0], NULL, "ef405ep.ram.alias",
-                             machine->ram, 0, machine->ram_size);
-    ram_bases[0] = 0;
-    ram_sizes[0] = machine->ram_size;
-    memory_region_init(&ram_memories[1], NULL, "ef405ep.ram1", 0);
-    ram_bases[1] = 0x00000000;
-    ram_sizes[1] = 0x00000000;
+    object_initialize_child(OBJECT(machine), "soc", &ppc405->soc,
+                            TYPE_PPC405_SOC);
+    object_property_set_uint(OBJECT(&ppc405->soc), "ram-size",
+                             machine->ram_size, &error_fatal);
+    object_property_set_link(OBJECT(&ppc405->soc), "dram",
+                             OBJECT(machine->ram), &error_abort);
+    qdev_realize(DEVICE(&ppc405->soc), NULL, &error_fatal);
 
-    cpu = ppc405ep_init(sysmem, ram_memories, ram_bases, ram_sizes,
+    cpu = ppc405ep_init(sysmem, ppc405->soc.ram_banks, ppc405->soc.ram_bases,
+                        ppc405->soc.ram_sizes,
                         33333333, &uicdev, kernel_filename == NULL ? 0 : 1);
 
     /* allocate and load BIOS */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index d6420c88d3..adadb3a0ae 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -30,6 +30,7 @@
 #include "hw/ppc/ppc.h"
 #include "hw/i2c/ppc4xx_i2c.h"
 #include "hw/irq.h"
+#include "hw/qdev-properties.h"
 #include "ppc405.h"
 #include "hw/char/serial.h"
 #include "qemu/timer.h"
@@ -1530,3 +1531,42 @@ PowerPCCPU *ppc405ep_init(MemoryRegion *address_space_mem,
 
     return cpu;
 }
+
+static void ppc405_soc_realize(DeviceState *dev, Error **errp)
+{
+    Ppc405SoCState *s = PPC405_SOC(dev);
+
+    /* Initialize only one bank */
+    s->ram_bases[0] = 0;
+    s->ram_sizes[0] = s->ram_size;
+    memory_region_init_alias(&s->ram_banks[0], OBJECT(s),
+                             "ppc405.sdram0", s->dram_mr,
+                             s->ram_bases[0], s->ram_sizes[0]);
+}
+
+static Property ppc405_soc_properties[] = {
+    DEFINE_PROP_LINK("dram", Ppc405SoCState, dram_mr, TYPE_MEMORY_REGION,
+                     MemoryRegion *),
+    DEFINE_PROP_UINT64("ram-size", Ppc405SoCState, ram_size, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void ppc405_soc_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ppc405_soc_realize;
+    dc->user_creatable = false;
+    device_class_set_props(dc, ppc405_soc_properties);
+}
+
+static const TypeInfo ppc405_types[] = {
+    {
+        .name           = TYPE_PPC405_SOC,
+        .parent         = TYPE_DEVICE,
+        .instance_size  = sizeof(Ppc405SoCState),
+        .class_init     = ppc405_soc_class_init,
+    }
+};
+
+DEFINE_TYPES(ppc405_types)
-- 
2.37.2


