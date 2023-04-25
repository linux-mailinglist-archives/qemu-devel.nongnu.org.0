Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 513696EDD22
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:49:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDMp-0007FN-1y; Tue, 25 Apr 2023 03:45:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDMj-0006o2-Q3
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:45:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDMi-0006jh-0x
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:45:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682408731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kRkJbKTYdQMPPesksxF7xN8VfXkNWpD4bYsPHdaN2MU=;
 b=eXHXHju3XabHFQuMSDokLRIE7pgaaTB1yxgdegIWusqLESt1so9Ew7GGy4sT0zIupNL9kO
 qb+7dqLq4kKGVOpNFGQFLqFxN03SgGHl+BIlyQXllpZXClGtYzNZjnkeDRhq5EkYjzmaGZ
 jXxND1tfH6hfhuu2RZI7ZUjW8F/mzvw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-igQZS5RtMaOMWkISz3RC7Q-1; Tue, 25 Apr 2023 03:45:30 -0400
X-MC-Unique: igQZS5RtMaOMWkISz3RC7Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f08901fed3so32375115e9.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:45:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682408728; x=1685000728;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kRkJbKTYdQMPPesksxF7xN8VfXkNWpD4bYsPHdaN2MU=;
 b=N6rBnSl+FglmJ5RKDUlLKroBXFmhGTyi5R/5eMxsa+O6hyfp5nI1ePej87Vzxy5gOC
 yYL59sVlC+zfqQTqFIV1c+UIPXeOdiHsxJv8cmPD+JVFJnUNkrFsn+0pMsuFsTgUgH3T
 cCKYh+UgcibMipgJECkosmWuvHDssM/Rgkk7HO2Q8AxLqpgSdoBnTfyzRAQSkYlNrA24
 op2bgvjGT4b9IS5ckDRwGP1dgxJEYSrbjTVfDRymu0UtpvKWb4TyKlwwfvSeEqkKEAmZ
 zB3AxJiCFtf3Wn3Wcez9kVsKZYCWtgixunrGJaPR3aOpuCqnhgu4Qw7P7QtcjVa7RWfX
 sGRA==
X-Gm-Message-State: AAQBX9dv7aZn+pN1N6scwK+QIhRPFzcDVNHOC9bRMfA18bmaAc5o6XrL
 PuS0Z/5Hxu+8axY5f0GUaZvXa3rVnesxQn1rBGdD8EyhoeLkuMZS8lrVQqwIxyoZ7g41MOF1aQh
 QP9KQRJTgM2QRt3ehD0+DJ1SK3ZTeqgWOARHIkO1sGTOyZ80Zh/TP8NCYIQi11LhBP39b
X-Received: by 2002:adf:fd88:0:b0:2c5:5a65:79a0 with SMTP id
 d8-20020adffd88000000b002c55a6579a0mr10993754wrr.53.1682408727768; 
 Tue, 25 Apr 2023 00:45:27 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZQtXVJ0pQd7jupwSkhr4ax1O1NHhGuoa9hXSx5yjOWIc7YjKiAz+6epykYySnHF3eZtG0PmQ==
X-Received: by 2002:adf:fd88:0:b0:2c5:5a65:79a0 with SMTP id
 d8-20020adffd88000000b002c55a6579a0mr10993723wrr.53.1682408727419; 
 Tue, 25 Apr 2023 00:45:27 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 o22-20020a1c7516000000b003f18372d540sm13977119wmc.14.2023.04.25.00.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:45:26 -0700 (PDT)
Date: Tue, 25 Apr 2023 03:45:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 11/31] hw/i386/amd_iommu: Remove intermediate
 AMDVIState::devid field
Message-ID: <531f50ab058c6e443194cdda1a8eaf010c6e740a.1682408661.git.mst@redhat.com>
References: <cover.1682408661.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1682408661.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

AMDVIState::devid is only accessed by build_amd_iommu() which
has access to the PCIDevice state. Directly get the property
calling object_property_get_int() there.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230313153031.86107-4-philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/amd_iommu.h  | 2 --
 hw/i386/acpi-build.c | 4 +++-
 hw/i386/amd_iommu.c  | 2 --
 3 files changed, 3 insertions(+), 5 deletions(-)

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
-- 
MST


