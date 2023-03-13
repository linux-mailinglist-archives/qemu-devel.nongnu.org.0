Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A3A6B7C05
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 16:32:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbk8j-0007Ow-BC; Mon, 13 Mar 2023 11:31:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbk8e-0007OC-QA
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 11:31:04 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbk8d-0003g9-53
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 11:31:04 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so11199083wmb.5
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 08:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678721462;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YEHJtctdUGnPbRD12ujKceUGnyxDUf64ceqFkdvQRlM=;
 b=piP+/gCwVTUSUSRogj8fCMCakfxnsJNAaRpjYC2kNYIe1a7za/+XN+2P7WkzYMN1MG
 BXm9SCBfXUCckEsUm/mlLoM1DYN+io5xeV08KYlpZ9Nr/tifEMFLjtR3QAcDS5VeQpfS
 KXiFBpGvjuFwmKnOWidLgJeBQfzfAEGpxGmzaJpoFtr/HczO+kKGrMK4YLLTyS7dSaC7
 pP0rh+hJxsttrZ18JrvM5X+gSrwlaXy1so4hdU7IOJ517OphJsz7YFm+0ZAYy6twZ4Mi
 7RksU5rLayCFr9h3VfdZHMl7D2fXoOLYPojBEr6zMh1bRmb3rNPETpVxET7/nTa9GFGP
 xecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678721462;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YEHJtctdUGnPbRD12ujKceUGnyxDUf64ceqFkdvQRlM=;
 b=lQ+TSV47jxXYVNS/YTRPZMn+Lc2HsikahyBhxtPsBjwFaeT4KKAGFhr6MFflKk4bUG
 KHCvi1ksuHy4HoUkzuG+6+d7ppcIGpOU+yoRVgdK5X0mSPfOZR74eKEWZH6cO0OnhrlL
 zsqiuUcxN/4K02a/8+2X4V3gNC/gGOjcFnUZ9YxHfUdQb3uwZbMTNlrFCJhNdWQPNQIg
 hPJxo6v/3cddc45uvhMlAOINN3OOAHbwfBmsPwq5eNuwUrcsNO/MnKfxxkbS4Rq4cq52
 cFxxeBIsTssldnNF1vQ4jBAMvaIdJvTtPGnh0hRkUWT8uBAaQLXtcCJU0TNrJs64iVHG
 ePxg==
X-Gm-Message-State: AO0yUKV919AaV+TB55Hon+yv+IcmUg4coWnIus04a0z4bvBjV6437Zj0
 NOtI19uxb1CrLgvgBaVGVgVTKQ==
X-Google-Smtp-Source: AK7set/U+FXIhpfmWGce44ou0/wXWhVCgeTldSah/TmUO/fAaKYG5WAxz5rwdZV4Lc0RGId9x0bi1A==
X-Received: by 2002:a05:600c:198e:b0:3dc:42d2:aee4 with SMTP id
 t14-20020a05600c198e00b003dc42d2aee4mr11869337wmq.25.1678721461959; 
 Mon, 13 Mar 2023 08:31:01 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a7bc843000000b003db0bb81b6asm124016wml.1.2023.03.13.08.31.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Mar 2023 08:31:01 -0700 (PDT)
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
Subject: [PATCH 5/6] hw/i386/amd_iommu: Set PCI static/const fields via
 PCIDeviceClass
Date: Mon, 13 Mar 2023 16:30:30 +0100
Message-Id: <20230313153031.86107-6-philmd@linaro.org>
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

Set PCI static/const fields once in amdvi_pci_class_init.
They will be propagated via DeviceClassRealize handler via
pci_qdev_realize() -> do_pci_register_device() -> pci_config_set*().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/amd_iommu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 9f6622e11f..8e4ce63f8e 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1511,9 +1511,7 @@ static void amdvi_init(AMDVIState *s)
     amdvi_set_quad(s, AMDVI_MMIO_STATUS, 0, 0x98, 0x67);
 
     /* reset device ident */
-    pci_config_set_vendor_id(s->pci.dev.config, PCI_VENDOR_ID_AMD);
     pci_config_set_prog_interface(s->pci.dev.config, 00);
-    pci_config_set_class(s->pci.dev.config, 0x0806);
 
     /* reset AMDVI specific capabilities, all r/o */
     pci_set_long(s->pci.dev.config + s->pci.capab_offset, AMDVI_CAPAB_FEATURES);
@@ -1623,6 +1621,10 @@ static const TypeInfo amdvi_sysbus = {
 static void amdvi_pci_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+
+    k->vendor_id = PCI_VENDOR_ID_AMD;
+    k->class_id = 0x0806;
 
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     dc->desc = "AMD IOMMU (AMD-Vi) DMA Remapping device";
-- 
2.38.1


