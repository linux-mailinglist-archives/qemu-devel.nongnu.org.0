Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EE06B7C06
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 16:32:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbk8V-0007N0-Uk; Mon, 13 Mar 2023 11:30:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbk8U-0007Ms-Iv
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 11:30:54 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbk8S-0003fJ-WD
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 11:30:54 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso8184083wmo.0
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 08:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678721451;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N5CtT69IrDpUWsZ2cEH8Q0Ev0Hw6M0HQO47n0CmUmu0=;
 b=Rjo4njV130v00sJkhialJyAt29GOMY5rwvNmQA6K5gfOBs7ej03QjycW84cOdFNzMa
 NPZD6xiJp4UuRLcwtRGurBwP256hwbMD3pFq0YKZCI9zywTC19Ux1AnqyQzwhBUR5Fzm
 9guoPZzKDaIfpGTe1yFgtWh5jnMXamdq2HnLDmP5ijR1I1gVIs+z1seNmjRwZS9et1pS
 Z9EVi7WhTdJy9Ox58sqp8b4R1RLkeMLyH2Z/XsbFYwY67+tmlGzjaC/A+4Y7gwYz0a8V
 Y5V0KjQpj0ZzvD3PUfI6Uo9zzc3HTtEdnJZOGn6WUot5KPjBI4eVnP3jyE3EM1t02A8m
 47qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678721451;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N5CtT69IrDpUWsZ2cEH8Q0Ev0Hw6M0HQO47n0CmUmu0=;
 b=bSj6o8zm2C2iMh5afAN2vy2HBvmeWtW9f/OVoMpBMlYxivtssWr+YtyQ+4hg94nlO9
 C2y1UyQR5hgcg3E8hgTwwjv9p0O1TlEv1esypgjLK/bQGfTxEVT+E0o6uVVD1WvI1OEx
 ly0/INbUtCllsixNcuniBrXw+efCJ6OREUIpW2ykxfS35jJ/M3FdEKcbbUB0b2gSK9ge
 hglRmptctUUTV7vVaUxtTa7iQhclmSbmuhEFIzvocbBRukiIY/XmKaM9Z+2Zg1/VnuRG
 rWCZY8jRsaC/kDoElEol2zdrYDn1LqIYGaZbdcqUf89/9ld0zwVsbzSxXJrmr7neH3fw
 ybvw==
X-Gm-Message-State: AO0yUKWqcvoBKMzbV9Ihw/NwFgQB5yAvq0O8LPV4SESlDBu+GKY4ym5A
 xJvwT3OdqZYHZY29Rn5nIenHsA==
X-Google-Smtp-Source: AK7set9Jv/Iy/qOLRwQDYoFIzsjeiq28C4lGhOjYgUgwNIPFNvSNu7Nn48ppUkH0YPlJ+J9zebDaVA==
X-Received: by 2002:a05:600c:3c8f:b0:3ea:f6c4:5f3d with SMTP id
 bg15-20020a05600c3c8f00b003eaf6c45f3dmr11193646wmb.2.1678721451331; 
 Mon, 13 Mar 2023 08:30:51 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 i5-20020a1c5405000000b003ed246f76a2sm107993wmb.1.2023.03.13.08.30.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Mar 2023 08:30:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Wei Huang <wei.huang2@amd.com>,
	qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, Peter Xu <peterx@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/6] hw/i386/amd_iommu: Remove intermediate AMDVIState::devid
 field
Date: Mon, 13 Mar 2023 16:30:28 +0100
Message-Id: <20230313153031.86107-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230313153031.86107-1-philmd@linaro.org>
References: <20230313153031.86107-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

AMDVIState::devid is only accessed by build_amd_iommu() which
has access to the PCIDevice state. Directly get the property
calling object_property_get_int() there.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/acpi-build.c | 4 +++-
 hw/i386/amd_iommu.c  | 2 --
 hw/i386/amd_iommu.h  | 2 --
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index ec857a117e..a27bc33956 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2395,7 +2395,9 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker, const char *oem_id,
     /* IVHD length */
     build_append_int_noprefix(table_data, ivhd_table_len, 2);
     /* DeviceID */
-    build_append_int_noprefix(table_data, s->devid, 2);
+    build_append_int_noprefix(table_data,
+                              object_property_get_int(OBJECT(&s->pci), "addr",
+                                                      &error_abort), 2);
     /* Capability offset */
     build_append_int_noprefix(table_data, s->capab_offset, 2);
     /* IOMMU base address */
diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 3813b341ec..19f57e6318 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1513,7 +1513,6 @@ static void amdvi_init(AMDVIState *s)
     /* reset device ident */
     pci_config_set_vendor_id(s->pci.dev.config, PCI_VENDOR_ID_AMD);
     pci_config_set_prog_interface(s->pci.dev.config, 00);
-    pci_config_set_device_id(s->pci.dev.config, s->devid);
     pci_config_set_class(s->pci.dev.config, 0x0806);
 
     /* reset AMDVI specific capabilities, all r/o */
@@ -1581,7 +1580,6 @@ static void amdvi_sysbus_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->mmio);
     sysbus_mmio_map(SYS_BUS_DEVICE(s), 0, AMDVI_BASE_ADDR);
     pci_setup_iommu(bus, amdvi_host_dma_iommu, s);
-    s->devid = object_property_get_int(OBJECT(&s->pci), "addr", &error_abort);
     msi_init(&s->pci.dev, 0, 1, true, false, errp);
     amdvi_init(s);
 }
diff --git a/hw/i386/amd_iommu.h b/hw/i386/amd_iommu.h
index 79d38a3e41..5eccaad790 100644
--- a/hw/i386/amd_iommu.h
+++ b/hw/i386/amd_iommu.h
@@ -319,8 +319,6 @@ struct AMDVIState {
 
     uint64_t mmio_addr;
 
-    uint32_t devid;              /* auto-assigned devid          */
-
     bool enabled;                /* IOMMU enabled                */
     bool ats_enabled;            /* address translation enabled  */
     bool cmdbuf_enabled;         /* command buffer enabled       */
-- 
2.38.1


