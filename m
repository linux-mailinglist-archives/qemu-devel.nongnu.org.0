Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 750F869D709
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 00:28:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUFYr-0004if-Pj; Mon, 20 Feb 2023 18:27:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYo-0004bz-1l
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 18:27:06 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYm-0000QK-1G
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 18:27:05 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 v3-20020a17090a6b0300b002341a2656e5so2796166pjj.1
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 15:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H9Qr7wA8wSIkfPgh/j+3hKBpjrPyoBLV3ksLdpb2kIs=;
 b=Cr7nFj4SILcFDKj/Sxrao5rEXlPsCryfOXCDlh+Nf1jQ4Sxl300qNIafsVBRnM25Fk
 D/A+8heOpnJxYc88c8ntJRleQ457TPRKotefEojkvIm8nXTdqAitoFjgd+5XCVzwD7ad
 M1ccXMHwKuKRKRUZktgLABKUqg5mhRYNpWl6e//ZB4IEz4nYIgEWq4QBSc8WyI0fTQ5i
 KyVEw0v63kMzUAeamE6x+4WnTHXZPyFmE303IUUnQRTxWRj8Utcl6w0FIudRCgTKBaoy
 TTWDTxukPBJFtz9M2yxoR73YUM5LRqnblk3AeyrwPh+YjwLWUITFFPz37jdwU3t/arYh
 v/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H9Qr7wA8wSIkfPgh/j+3hKBpjrPyoBLV3ksLdpb2kIs=;
 b=afejGhz+hRHU8HyEXPJnRKtgygquXQ3ZSlffz64GQGt64fUEGQmB+MNx5Mf4zOP+xy
 hFAM7nd0qwq2CKRl4PHuzEVD4tzDnJiU4ZILM/IpDPZgNaJ6SjXhDHxG78F9fUPt60q7
 0WaW4DsB2NsPMd7/KvQrQMfD9YA9dvDgNc6A77SSvPlsk2DKuJ05NOI1a9ktwbLZjXgu
 3qtDrfHjfkMKR32JY9X/WLWKKl9o6fNRFovNeJOx3hdh6O8MYQEPaPLwWTXhq0xtlFi9
 g4fiweCdeBplKup4TypPnH54AN8m8AUJxxmCPVKm5XxD+xI5BTwRHTL/Y+7BWRf05VNo
 oihA==
X-Gm-Message-State: AO0yUKV6bQHAd88giGDISVuesKadteMk0RiJ5sILLcy6lOCYc30VpUlm
 ShOX/vR0AfchkG3hg8Gzbh7qojcX57QpeVHVghQ=
X-Google-Smtp-Source: AK7set/+5BuffwV81xNHv8WTk6pDHlNrrQ78RZ0T9WHpNc5/Kanp6xWQMx0rW0mB018AkQ/mEzEEBw==
X-Received: by 2002:a17:902:f544:b0:196:6577:5a96 with SMTP id
 h4-20020a170902f54400b0019665775a96mr5634257plf.30.1676935623209; 
 Mon, 20 Feb 2023 15:27:03 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a170902690a00b001992e74d058sm2665348plk.7.2023.02.20.15.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 15:27:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [NOTFORMERGE PATCH v2 21/21] hw/arm/virt: Add some memory for Realm
 Management Monitor
Date: Mon, 20 Feb 2023 13:26:26 -1000
Message-Id: <20230220232626.429947-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220232626.429947-1-richard.henderson@linaro.org>
References: <20230220232626.429947-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

This is arbitrary, but used by the Huawei TF-A test code.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/arm/virt.h |  2 ++
 hw/arm/virt.c         | 43 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index e1ddbea96b..5c0c8a67e4 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -86,6 +86,7 @@ enum {
     VIRT_ACPI_GED,
     VIRT_NVDIMM_ACPI,
     VIRT_PVTIME,
+    VIRT_RMM_MEM,
     VIRT_LOWMEMMAP_LAST,
 };
 
@@ -159,6 +160,7 @@ struct VirtMachineState {
     bool virt;
     bool ras;
     bool mte;
+    bool rmm;
     bool dtb_randomness;
     OnOffAuto acpi;
     VirtGICType gic_version;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ac626b3bef..067f16cd77 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -159,6 +159,7 @@ static const MemMapEntry base_memmap[] = {
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
     [VIRT_SECURE_MEM] =         { 0x0e000000, 0x01000000 },
+    [VIRT_RMM_MEM] =            { 0x0f000000, 0x00100000 },
     [VIRT_PCIE_MMIO] =          { 0x10000000, 0x2eff0000 },
     [VIRT_PCIE_PIO] =           { 0x3eff0000, 0x00010000 },
     [VIRT_PCIE_ECAM] =          { 0x3f000000, 0x01000000 },
@@ -1602,6 +1603,25 @@ static void create_secure_ram(VirtMachineState *vms,
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
@@ -2283,6 +2303,10 @@ static void machvirt_init(MachineState *machine)
                        machine->ram_size, "mach-virt.tag");
     }
 
+    if (vms->rmm) {
+        create_rmm_ram(vms, sysmem, tag_sysmem);
+    }
+
     vms->highmem_ecam &= (!firmware_loaded || aarch64);
 
     create_rtc(vms);
@@ -2562,6 +2586,20 @@ static void virt_set_mte(Object *obj, bool value, Error **errp)
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
@@ -3115,6 +3153,11 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
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


