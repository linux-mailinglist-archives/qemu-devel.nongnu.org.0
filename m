Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 905876874AF
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 05:53:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNRaW-0004Pu-UP; Wed, 01 Feb 2023 23:52:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pNRaQ-0004Om-Fy
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 23:52:39 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pNRaO-0001Cj-Tx
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 23:52:38 -0500
Received: by mail-pj1-x102c.google.com with SMTP id j5so803087pjn.5
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 20:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=psDfltxj5Ers806tup7ZzDpU09NdsTTfAuvz4bp4HA0=;
 b=G65PAHTUhps7Obo7ZgapY3i2ciMQks8KFdklGRdbzZ3Pl4PvHhmDHmaskbkA9UIELG
 BccRsOGDvJ93S2uwVQFlVltKDoYlE/1F370HrSNKAvmwxYWMbowY7nV4VDqYAX3CCf7M
 YZ3Pc5V1buAjHILpGHptfDCTscMWQRGNdTsWj7LIPp49rtnTRhkbnFmBTEwsKHKxp+H2
 WNK4qiU/xJzbaAvEx8x/GVuuWJ8CuaZT2teBt9S62RXu/0kMH2TjMig2nHsvaeicR6aO
 MnaU0MJHXu5UMxhhYB/DtHxLjPX2HSddBV4NGs9PLnwlCX1RVG2RwU2J0Vgvr8htTHgt
 Behg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=psDfltxj5Ers806tup7ZzDpU09NdsTTfAuvz4bp4HA0=;
 b=1gWpRjcFMaAlKp8zAQA5VaWOU0lWiNzU86cmmPbxWFx5JGb3hVpYBIg9VRMNbRUsIZ
 7gO07S38hAKRqcriWAgWsTKgDrrq3czeN64YzV1GsqE0ZV/g4Y6VBnv/JMBii0MjRHJY
 HziqTiuIi6zWqIRn6GMcoY6pLOCXVFfR6N/ydXuplZQ7LQj/m056SGuGkYHyFz0hi5Hr
 Fe5dinv83ACPFajPzLwMVSCDURPdLS0jsewVixtV+75tOsYoeUmJ4IHJS4Lsm0M3l34a
 g90VsAs/XQA8OPPSpo1qqiJ9EYbqYBe1RHF2Mdd73Frwujb2dchy26C3+8BuVPI9nMVH
 Rebw==
X-Gm-Message-State: AO0yUKWVfXevsJz1Vb61IjRsaj9kxxkMTesTSjmt7t6bbjeBIa+1F8J+
 Ii7ItphxEL2J5EanzDpjBVx3Vw==
X-Google-Smtp-Source: AK7set9m9Ndjq4NbB3ZRj5wAEgJBf5bhVWMxI8WP8xizj78WufxHBcGDp3zOGzvVZVaPa+vX6ZghGQ==
X-Received: by 2002:a17:902:f28d:b0:194:d5ec:9be6 with SMTP id
 k13-20020a170902f28d00b00194d5ec9be6mr4626134plc.23.1675313555604; 
 Wed, 01 Feb 2023 20:52:35 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a170902d70a00b001965540395fsm11222265ply.105.2023.02.01.20.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 20:52:35 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 02/10] hw/riscv/virt: Add a switch to enable/disable ACPI
Date: Thu,  2 Feb 2023 10:22:15 +0530
Message-Id: <20230202045223.2594627-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x102c.google.com
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

ACPI is optional. So, add a switch to toggle.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/riscv/virt.c         | 38 ++++++++++++++++++++++++++++++++++++++
 include/hw/riscv/virt.h |  2 ++
 2 files changed, 40 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 7ad9fda20c..84962962ff 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -50,6 +50,7 @@
 #include "hw/pci-host/gpex.h"
 #include "hw/display/ramfb.h"
 #include "hw/acpi/aml-build.h"
+#include "qapi/qapi-visit-common.h"
 
 /*
  * The virt machine physical address space used by some of the devices
@@ -1525,6 +1526,10 @@ static void virt_machine_init(MachineState *machine)
 
 static void virt_machine_instance_init(Object *obj)
 {
+    MachineState *ms = MACHINE(obj);
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(ms);
+
+    s->acpi = ON_OFF_AUTO_OFF;
 }
 
 static char *virt_get_aia_guests(Object *obj, Error **errp)
@@ -1601,6 +1606,34 @@ static void virt_set_aclint(Object *obj, bool value, Error **errp)
     s->have_aclint = value;
 }
 
+bool virt_is_acpi_enabled(RISCVVirtState *s)
+{
+    if (s->acpi == ON_OFF_AUTO_OFF) {
+        return false;
+    }
+    return true;
+}
+
+static void virt_get_acpi(Object *obj, Visitor *v, const char *name,
+                          void *opaque, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(ms);
+
+    OnOffAuto acpi = s->acpi;
+
+    visit_type_OnOffAuto(v, name, &acpi, errp);
+}
+
+static void virt_set_acpi(Object *obj, Visitor *v, const char *name,
+                          void *opaque, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(ms);
+
+    visit_type_OnOffAuto(v, name, &s->acpi, errp);
+}
+
 static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
                                                         DeviceState *dev)
 {
@@ -1672,6 +1705,11 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     sprintf(str, "Set number of guest MMIO pages for AIA IMSIC. Valid value "
                  "should be between 0 and %d.", VIRT_IRQCHIP_MAX_GUESTS);
     object_class_property_set_description(oc, "aia-guests", str);
+    object_class_property_add(oc, "acpi", "OnOffAuto",
+                              virt_get_acpi, virt_set_acpi,
+                              NULL, NULL);
+    object_class_property_set_description(oc, "acpi",
+                                          "Enable ACPI");
 }
 
 static const TypeInfo virt_machine_typeinfo = {
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 6c7885bf89..62efebaa32 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -58,6 +58,7 @@ struct RISCVVirtState {
     int aia_guests;
     char *oem_id;
     char *oem_table_id;
+    OnOffAuto acpi;
 };
 
 enum {
@@ -123,4 +124,5 @@ enum {
 #define FDT_APLIC_INT_MAP_WIDTH (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + \
                                  1 + FDT_APLIC_INT_CELLS)
 
+bool virt_is_acpi_enabled(RISCVVirtState *s);
 #endif
-- 
2.38.0


