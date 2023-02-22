Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C170769ECD7
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 03:35:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUexX-0007ir-1R; Tue, 21 Feb 2023 21:34:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUexU-0007iA-PN
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:34:16 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUexT-0001XQ-0R
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:34:16 -0500
Received: by mail-pl1-x62f.google.com with SMTP id bh1so7212330plb.11
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 18:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H9Qr7wA8wSIkfPgh/j+3hKBpjrPyoBLV3ksLdpb2kIs=;
 b=dC2VB4qKDFvarrMYl1iKtvs/JH0i3HaDsZ7jv6B3wp7QjJUb3JvAUi/ko5r0ZAUg7Y
 BKRI/N7d5EWZdhmUJ/wtX9+x2AJOQqn1NBV/UnBAlk9rrPCRmDKkwQH7d6k2n94hIPjd
 L4rLMdzfJQSoXPJO0EOg3Qp9xm7AqbWMvGRYeb9ax3sen4Xe6DBuU9NmL4U8MuWnYlKA
 f8ahPFfnxT1lOCs2H05xPNJunPgmyEpB2gMKhq8/MbfmaZH2StQ41gaSZbw7/j8pzfam
 ngclVeUHglR4e1CACm6m8OeoLWzeFC1sRLSYl5bwzlQ/gsGH+qgID4KPKEdpvV0fuWSS
 ErIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H9Qr7wA8wSIkfPgh/j+3hKBpjrPyoBLV3ksLdpb2kIs=;
 b=ZhCC7nTI5ja5x5GjAt8wiER5OUHzUVDbujcooQFf4VglRYLpDtqeCsemVcAG4aE4M4
 x/8osIdeFlqOJbu0ZaQtDraJJI+0VJ2JGigfJDgkGYklQL1qQK2/xFuTwEvxFNZa4QS1
 O9q4mwEoNuC898c2Hm4ANWjtfaOJZXQkPO5sjeVJVMwwFDdqtitTecSYRz1q/w/mKnV7
 60PRSw1lBASWn/haPDLnsrYQ2pGDfIQMzr7Vo46tczQyY+5SgkXaEuGY+zx1Vldxp5t7
 lrQrupnLRx1Q8ipGn2IfTITHdCF+dSCx94uMeeY8K/kF2pWVI48Iv5tZLa19mgpM96eM
 hL/g==
X-Gm-Message-State: AO0yUKUgT54Y7WgfOvc07HcaS7HFSynCnLWaogU0e6n5TB9c1MH1ZdQv
 PvHqdaqvYXcqbk0WV2hfGETFzJL9hZrEzZ+q8M0=
X-Google-Smtp-Source: AK7set9QK1bKIAz9Jfhh5NZrNyXnPCbJffUoeHkZsttLWf0LNwl9SSNf+JLfP7gee84d06dWU9zPKg==
X-Received: by 2002:a17:902:e5c9:b0:19c:355c:6eb5 with SMTP id
 u9-20020a170902e5c900b0019c355c6eb5mr9614923plf.30.1677033254215; 
 Tue, 21 Feb 2023 18:34:14 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a170902e90300b00198fde9178csm10520112pld.197.2023.02.21.18.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 18:34:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH NOTFORMERGE v3 25/25] hw/arm/virt: Add some memory for Realm
 Management Monitor
Date: Tue, 21 Feb 2023 16:33:36 -1000
Message-Id: <20230222023336.915045-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222023336.915045-1-richard.henderson@linaro.org>
References: <20230222023336.915045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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


