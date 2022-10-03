Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BBF5F381E
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 23:51:05 +0200 (CEST)
Received: from localhost ([::1]:40458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofTL6-0002iK-Ss
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 17:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ofS7l-00022p-AZ; Mon, 03 Oct 2022 16:33:19 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:38633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ofS7j-00043x-NX; Mon, 03 Oct 2022 16:33:13 -0400
Received: by mail-ed1-x52f.google.com with SMTP id l22so14730139edj.5;
 Mon, 03 Oct 2022 13:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=TvXJFwqvlsbZpuztS1ihkDWGIRqnr8hOlIhbj232Gx8=;
 b=o4HEkHm6t553Ueq0PHgl4OcBzauNTRRm3AmGtIEI1nRVAZSCrJ2CfxQTRgmhrZmma5
 KB8h1Ck8BkdMOIU4jtAGCCHF8X/vTflc4KZmKjpz7izvok+L93EohZ8fZc3UzpVbuia9
 zf+Hoa6iYnbf6Snylido9yUMMKyuNOWf05GsBnf5vUXkrWoDzIJ8p3NPWXUDqySNvvlY
 fNcyud3vpn4bubvBO2GiwueMl19NMTwm/pIQX3Cd6NxfiQ5qoCmInZx0TT+NFZ3KBx3w
 ScWGv1+Fn/Ydv8ibk17SYoGrHYCmIl4W1J6nkzPeqrYK9aUjbOy2Fo6C58KH/LyGkHcb
 bI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=TvXJFwqvlsbZpuztS1ihkDWGIRqnr8hOlIhbj232Gx8=;
 b=qrEcPoE9g0+izuFsohFbg/luYlSVeBrzDQzV4IHEYK+6tkTMECOlpDITzmXfHn8E4q
 fLcfB+CfHwSs7TTDevXJNty1ggeWQpII2WSqa/A6BU6lpomAI53Yv+tNg1DB1WX6T9bP
 +S3eVHBdSQ4fjyy3N7VRk+Qe0V2bpG/KxIglNzbLDXzOl37ZGT0uDEuY3uunaCIWbD3B
 QrrrtcRxzC0lvkYqUp9VhSrAvsbRLh2GX7nLp6yN//Tq4gPWU9X3WFVIZgPbsGy4qGgT
 HZ9WsEkEDFvu+zZ2BcA5YAQYzREDc0NoWYaX9Tm0JvotrZ/+Co+ILYuN5pfoOORX7YzI
 Zy9A==
X-Gm-Message-State: ACrzQf2NzGoi3J1jMDYWOwrLIYvZf5tTTqmI/rBxdRQxD26lJ0Lhil/W
 hNzgYAtC8YUQKGJSNvNx6M8gv2GzrH4=
X-Google-Smtp-Source: AMsMyM40mXeO3Nuy5Xi3o1vUuUpo72EXjM7wWw8WHp6smH27tc1P057Hs1kFmfIueLs/K0OdycQ77Q==
X-Received: by 2002:a05:6402:274c:b0:459:3339:570e with SMTP id
 z12-20020a056402274c00b004593339570emr2714913edd.259.1664829189346; 
 Mon, 03 Oct 2022 13:33:09 -0700 (PDT)
Received: from localhost.localdomain ([46.183.103.8])
 by smtp.gmail.com with ESMTPSA id
 lb9-20020a170907784900b0073ddd36ba8csm5978087ejc.145.2022.10.03.13.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 13:33:08 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v2 07/13] hw/ppc/e500: Remove if statement which is now always
 true
Date: Mon,  3 Oct 2022 22:31:36 +0200
Message-Id: <20221003203142.24355-8-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221003203142.24355-1-shentey@gmail.com>
References: <20221003203142.24355-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Now that the MPC8544DS board also has a platform bus, the if statement
is always true.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ppc/e500.c      | 30 ++++++++++++++----------------
 hw/ppc/e500.h      |  1 -
 hw/ppc/e500plat.c  |  1 -
 hw/ppc/mpc8544ds.c |  1 -
 4 files changed, 14 insertions(+), 19 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 496c61b612..3e950ea3ba 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -1007,25 +1007,23 @@ void ppce500_init(MachineState *machine)
     }
 
     /* Platform Bus Device */
-    if (pmc->has_platform_bus) {
-        dev = qdev_new(TYPE_PLATFORM_BUS_DEVICE);
-        dev->id = g_strdup(TYPE_PLATFORM_BUS_DEVICE);
-        qdev_prop_set_uint32(dev, "num_irqs", pmc->platform_bus_num_irqs);
-        qdev_prop_set_uint32(dev, "mmio_size", pmc->platform_bus_size);
-        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-        pms->pbus_dev = PLATFORM_BUS_DEVICE(dev);
-
-        s = SYS_BUS_DEVICE(pms->pbus_dev);
-        for (i = 0; i < pmc->platform_bus_num_irqs; i++) {
-            int irqn = pmc->platform_bus_first_irq + i;
-            sysbus_connect_irq(s, i, qdev_get_gpio_in(mpicdev, irqn));
-        }
+    dev = qdev_new(TYPE_PLATFORM_BUS_DEVICE);
+    dev->id = g_strdup(TYPE_PLATFORM_BUS_DEVICE);
+    qdev_prop_set_uint32(dev, "num_irqs", pmc->platform_bus_num_irqs);
+    qdev_prop_set_uint32(dev, "mmio_size", pmc->platform_bus_size);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    pms->pbus_dev = PLATFORM_BUS_DEVICE(dev);
 
-        memory_region_add_subregion(address_space_mem,
-                                    pmc->platform_bus_base,
-                                    &pms->pbus_dev->mmio);
+    s = SYS_BUS_DEVICE(pms->pbus_dev);
+    for (i = 0; i < pmc->platform_bus_num_irqs; i++) {
+        int irqn = pmc->platform_bus_first_irq + i;
+        sysbus_connect_irq(s, i, qdev_get_gpio_in(mpicdev, irqn));
     }
 
+    memory_region_add_subregion(address_space_mem,
+                                pmc->platform_bus_base,
+                                &pms->pbus_dev->mmio);
+
     /*
      * Smart firmware defaults ahead!
      *
diff --git a/hw/ppc/e500.h b/hw/ppc/e500.h
index 1e5853b032..68f754ce50 100644
--- a/hw/ppc/e500.h
+++ b/hw/ppc/e500.h
@@ -27,7 +27,6 @@ struct PPCE500MachineClass {
 
     int mpic_version;
     bool has_mpc8xxx_gpio;
-    bool has_platform_bus;
     hwaddr platform_bus_base;
     hwaddr platform_bus_size;
     int platform_bus_first_irq;
diff --git a/hw/ppc/e500plat.c b/hw/ppc/e500plat.c
index fc911bbb7b..5bb1c603da 100644
--- a/hw/ppc/e500plat.c
+++ b/hw/ppc/e500plat.c
@@ -86,7 +86,6 @@ static void e500plat_machine_class_init(ObjectClass *oc, void *data)
     pmc->fixup_devtree = e500plat_fixup_devtree;
     pmc->mpic_version = OPENPIC_MODEL_FSL_MPIC_42;
     pmc->has_mpc8xxx_gpio = true;
-    pmc->has_platform_bus = true;
     pmc->platform_bus_base = 0xf00000000ULL;
     pmc->platform_bus_size = 128 * MiB;
     pmc->platform_bus_first_irq = 5;
diff --git a/hw/ppc/mpc8544ds.c b/hw/ppc/mpc8544ds.c
index 9c81477698..7dd5219736 100644
--- a/hw/ppc/mpc8544ds.c
+++ b/hw/ppc/mpc8544ds.c
@@ -46,7 +46,6 @@ static void mpc8544ds_machine_class_init(ObjectClass *oc, void *data)
     pmc->pci_nr_slots = 2;
     pmc->fixup_devtree = mpc8544ds_fixup_devtree;
     pmc->mpic_version = OPENPIC_MODEL_FSL_MPIC_20;
-    pmc->has_platform_bus = true;
     pmc->platform_bus_base = 0xFF800000ULL;
     pmc->platform_bus_size = 8 * MiB;
     pmc->platform_bus_first_irq = 5;
-- 
2.37.3


