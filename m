Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8FD678C83
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 01:04:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK6km-0001vz-MD; Mon, 23 Jan 2023 19:01:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kk-0001kC-1I
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:01:30 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kg-00020v-QV
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:01:29 -0500
Received: by mail-pf1-x42c.google.com with SMTP id z31so7008008pfw.4
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 16:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sxmu3I0hDA1CWS8XImZtEgPfNNeikAqJdreOIihUfNI=;
 b=SDGSijOPYEtDNiSI+ZlIFXF6s8HyPmr7UoCJUY7LvR+h10YVsHpsOFqAsxYDZiWYWO
 x+y7TabBveA/99cBkFKYkTQ1CVopWjaqRixIoj8fVCAqZK6TtjxzWLI5WR5HBOAo8ce+
 h6hl7r5/5T2cTaGXkcTXSeJ8tpELnWzN+21FMBzpXw06KTg9JJrgRjeHrZChqLmW71C9
 mUbinCUvfP5QEmRB9bA0ytow5pq/Ky38SHWjcviS/9tz0hwyMN1oJ060+1U7NF2xidXe
 V5SV4bU2mIiv8kfCV23u/pnp0vZP23X/AeggNos1uD3wRBS/5ooYZZyF5kJduRocDAdI
 /phw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sxmu3I0hDA1CWS8XImZtEgPfNNeikAqJdreOIihUfNI=;
 b=QEo2JwQbVY5uvJusXUIDxKY1Espsz38glV53Tb/nYm/L5eI3sYRtLrSSR58vhu+33t
 BPHxH42Pm0IZ68OpBlihzvFvVqJzdRT1UxoUUDJ+I2oN3VdjqxQB/WWk9dL80Je2ZHCu
 4byrvgBA/fFU5B+A4GSIWu7y/cJxHt+L0m5GIqSZCagBaSu7HFawAj36EFXD+4r6hddv
 m1vbKYPSXsLvx5sVAyyNJ5ZgawnXpRgY0vAVD8F2iMWRgQpSUhJz80Ndn4NP68HluQZT
 bJHXAe/0srIthGKSDtqsFN/G8YQRWjbp56qvFCOgSTBh19v/xH7KYjX/WRTD/mqindVV
 p3gw==
X-Gm-Message-State: AFqh2koSHSz9ad3xraiwEPV3TlqXL3tHOia4XHBp14AkwKHUm7mL7tAM
 txQ+npcP9Y5crx9E77irVoYRDewJV/tS2lvA
X-Google-Smtp-Source: AMrXdXuarGOivnJEqJDKmL9V35HEdR1mZHK7Q+R4Ktf9n+7a+JvD/62IUpwYtcaDjMD5fZkis+3jqA==
X-Received: by 2002:a05:6a00:4515:b0:575:d06d:1bfa with SMTP id
 cw21-20020a056a00451500b00575d06d1bfamr26572835pfb.2.1674518485100; 
 Mon, 23 Jan 2023 16:01:25 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a056a00189500b0058bc37f3d13sm174104pfh.43.2023.01.23.16.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 16:01:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, yier.jin@huawei.com, jonathan.cameron@huawei.com,
 leonardo.garcia@linaro.org
Subject: [RFC PATCH 22/22] hw/arm/virt: Add some memory for Realm Management
 Monitor
Date: Mon, 23 Jan 2023 14:00:27 -1000
Message-Id: <20230124000027.3565716-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124000027.3565716-1-richard.henderson@linaro.org>
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

This is arbitrary, but used by the Huawei TF-A test code.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/arm/virt.h |  2 ++
 hw/arm/virt.c         | 43 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index c7dd59d7f1..bb7ac19358 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -86,6 +86,7 @@ enum {
     VIRT_ACPI_GED,
     VIRT_NVDIMM_ACPI,
     VIRT_PVTIME,
+    VIRT_RMM_MEM,
     VIRT_LOWMEMMAP_LAST,
 };
 
@@ -154,6 +155,7 @@ struct VirtMachineState {
     bool virt;
     bool ras;
     bool mte;
+    bool rmm;
     bool dtb_randomness;
     OnOffAuto acpi;
     VirtGICType gic_version;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ea2413a0ba..5f1fddd210 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -158,6 +158,7 @@ static const MemMapEntry base_memmap[] = {
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
     [VIRT_SECURE_MEM] =         { 0x0e000000, 0x01000000 },
+    [VIRT_RMM_MEM] =            { 0x0f000000, 0x00100000 },
     [VIRT_PCIE_MMIO] =          { 0x10000000, 0x2eff0000 },
     [VIRT_PCIE_PIO] =           { 0x3eff0000, 0x00010000 },
     [VIRT_PCIE_ECAM] =          { 0x3f000000, 0x01000000 },
@@ -1601,6 +1602,25 @@ static void create_secure_ram(VirtMachineState *vms,
     g_free(nodename);
 }
 
+static void create_rmm_ram(VirtMachineState *vms,
+                           MemoryRegion *sysmem,
+                           MemoryRegion *tag_sysmem)
+{
+    MemoryRegion *rmm_ram = g_new(MemoryRegion, 1);
+    hwaddr base = vms->memmap[VIRT_RMM_MEM].base;
+    hwaddr size = vms->memmap[VIRT_RMM_MEM].size;
+
+    memory_region_init_ram(rmm_ram, NULL, "virt.rmm-ram", size,
+                           &error_fatal);
+    memory_region_add_subregion(sysmem, base, rmm_ram);
+
+    /* do not fill in fdt to hide rmm from normal world guest */
+
+    if (tag_sysmem) {
+        create_tag_ram(tag_sysmem, base, size, "mach-virt.rmm-tag");
+    }
+}
+
 static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
 {
     const VirtMachineState *board = container_of(binfo, VirtMachineState,
@@ -2273,6 +2293,10 @@ static void machvirt_init(MachineState *machine)
                        machine->ram_size, "mach-virt.tag");
     }
 
+    if (vms->rmm) {
+        create_rmm_ram(vms, sysmem, tag_sysmem);
+    }
+
     vms->highmem_ecam &= (!firmware_loaded || aarch64);
 
     create_rtc(vms);
@@ -2552,6 +2576,20 @@ static void virt_set_mte(Object *obj, bool value, Error **errp)
     vms->mte = value;
 }
 
+static bool virt_get_rmm(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->rmm;
+}
+
+static void virt_set_rmm(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->rmm = value;
+}
+
 static char *virt_get_gic_version(Object *obj, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
@@ -3101,6 +3139,11 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                           "guest CPU which implements the ARM "
                                           "Memory Tagging Extension");
 
+    object_class_property_add_bool(oc, "rmm", virt_get_rmm, virt_set_rmm);
+    object_class_property_set_description(oc, "rmm",
+                                          "Set on/off to enable/disable ram "
+                                          "for the Realm Management Monitor");
+
     object_class_property_add_bool(oc, "its", virt_get_its,
                                    virt_set_its);
     object_class_property_set_description(oc, "its",
-- 
2.34.1


