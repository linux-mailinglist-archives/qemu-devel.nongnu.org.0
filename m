Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C907155BE71
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 07:26:33 +0200 (CEST)
Received: from localhost ([::1]:58176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o63k8-0003qZ-SX
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 01:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o6342-0008SP-Gx
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:43:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o6340-0006t1-Pv
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:43:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656391380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8OTkQgtTVoAIMM+akL7xPG2VzUScDdMLXQogm2uIas4=;
 b=Hs9RJfqY43LLC1pWhGuxfgCIF7bpFTxaF1MSNDo0XYOPc+NJa85iepx+SP6P7iGp93xAzX
 Qm0lFBdbrbd1UNegq9mdZp8qZPpjru03nuXq2BgwfD6kIddsdo524C57o0ED1pMrHfW4Tz
 dKt+EGtoDwIPnRVvSFKlaiithky3i00=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-i1cxhx1TMJeaAyQkTD2dkA-1; Tue, 28 Jun 2022 00:42:58 -0400
X-MC-Unique: i1cxhx1TMJeaAyQkTD2dkA-1
Received: by mail-wm1-f69.google.com with SMTP id
 n15-20020a05600c4f8f00b0039c3e76d646so6628738wmq.7
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=8OTkQgtTVoAIMM+akL7xPG2VzUScDdMLXQogm2uIas4=;
 b=fujAfTxP1PL+sUoPJ869n+JfVyLwp1C2xt3RjtneAy06sXn+pAyRL75GT97RwnrV+/
 L/MNK+6kg3cFaVBgx8W/SXJM9rdUhDWAoMoIw4AIkJtfdrkF5E9VRbvLB1jDTNQUTE8d
 MkCvgCYTZwtLXaE5mA5shAttBd1j2QkQ9tbKxI1EA+gAiYW6gvYjypX3jCuUuBhBW5Wd
 aD5JJa/fAbT7iNKE+EpjXm79xFehE+4xOQgflklntPcbxXHJ7HL2UsrD6BkMrs+2IGxy
 UVls20rry+OL+9k3PfyetmDxW7VmjfpL4vVGukDzkjuG2TdlvErU1KO9XiqHLTGH4FOx
 UHZA==
X-Gm-Message-State: AJIora8osQDVLkYMy4p9OxaxjhfmDiBHYLDC7BIx47j2pdf7PQWrIbNf
 eG0IAb+meFRjinTilqKan/WA1/X3eAmJTSH3i2BiLkq6vH5YYKD5uZzbfthQsgzYtjGicutmclj
 u5QchLIIdwf4g6ZQQSpvfCA424ZMh9BNb6xkg7B9gD3gO7UdkVFb/N/WHLWT9
X-Received: by 2002:a05:600c:3516:b0:39c:8091:31b6 with SMTP id
 h22-20020a05600c351600b0039c809131b6mr25662268wmq.164.1656391377452; 
 Mon, 27 Jun 2022 21:42:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sgVZQRb16LOQpSFJsdABabmdpby2Ygj6gmilwC250ym169PVt3+K9UG2SDYBTzHDPTj3vcGA==
X-Received: by 2002:a05:600c:3516:b0:39c:8091:31b6 with SMTP id
 h22-20020a05600c351600b0039c809131b6mr25662238wmq.164.1656391377215; 
 Mon, 27 Jun 2022 21:42:57 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 r13-20020adfe68d000000b0021018642ff8sm12998494wrm.76.2022.06.27.21.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:42:56 -0700 (PDT)
Date: Tue, 28 Jun 2022 00:42:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Julia Suvorova <jusual@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PULL 09/12] MAINTAINERS: Collect memory device files in "Memory
 devices"
Message-ID: <20220628044201.217173-10-mst@redhat.com>
References: <20220628044201.217173-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220628044201.217173-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: David Hildenbrand <david@redhat.com>

Xiao Guangrong doesn't have enough time to actively review or contribute
to our NVDIMM implementation. Let's dissolve the "NVDIMM" section, moving
relevant ACPI parts to "ACPI/SMBIOS" and moving memory device stuff into a
new "Memory devices" section. Make that new section cover other memory
device stuff as well.

We can now drop the "hw/mem/*" rule from "ACPI/SMBIOS". Note that
hw/acpi/nvdimm.c is already covered by "ACPI/SMBIOS".

The following files in hw/mem don't fall into the TYPE_MEMPORY_DEVICE
category:
* hw/mem/cxl_type3.c is CXL specific and belongs to "Compute Express Link"
* hw/mem/sparse-mem.c is already covered by "Device Fuzzing"
* hw/mem/npcm7xx_mc.c is already covered by "Nuvoton NPCM7xx"

Thanks Xiao for your work on NVDIMM!

Cc: Ben Widawsky <ben.widawsky@intel.com>
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>
Cc: Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Cc: "Philippe Mathieu-Daudé" <f4bug@amsat.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Julia Suvorova <jusual@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20220617123151.103033-1-david@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 MAINTAINERS | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1cbd6b72fa..05cf84b58c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1840,7 +1840,6 @@ R: Ani Sinha <ani@anisinha.ca>
 S: Supported
 F: include/hw/acpi/*
 F: include/hw/firmware/smbios.h
-F: hw/mem/*
 F: hw/acpi/*
 F: hw/smbios/*
 F: hw/i386/acpi-build.[hc]
@@ -1851,6 +1850,7 @@ F: tests/qtest/acpi-utils.[hc]
 F: tests/data/acpi/
 F: docs/specs/acpi_cpu_hotplug.rst
 F: docs/specs/acpi_mem_hotplug.rst
+F: docs/specs/acpi_nvdimm.rst
 F: docs/specs/acpi_pci_hotplug.rst
 F: docs/specs/acpi_hw_reduced_hotplug.rst
 
@@ -2158,15 +2158,6 @@ F: qapi/rocker.json
 F: tests/rocker/
 F: docs/specs/rocker.txt
 
-NVDIMM
-M: Xiao Guangrong <xiaoguangrong.eric@gmail.com>
-S: Maintained
-F: hw/acpi/nvdimm.c
-F: hw/mem/nvdimm.c
-F: include/hw/mem/nvdimm.h
-F: docs/nvdimm.txt
-F: docs/specs/acpi_nvdimm.rst
-
 e1000x
 M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
 S: Maintained
@@ -2588,6 +2579,7 @@ M: Ben Widawsky <ben.widawsky@intel.com>
 M: Jonathan Cameron <jonathan.cameron@huawei.com>
 S: Supported
 F: hw/cxl/
+F: hw/mem/cxl_type3.c
 F: include/hw/cxl/
 
 Dirty Bitmaps
@@ -2704,6 +2696,19 @@ F: softmmu/physmem.c
 F: include/exec/memory-internal.h
 F: scripts/coccinelle/memory-region-housekeeping.cocci
 
+Memory devices
+M: David Hildenbrand <david@redhat.com>
+M: Igor Mammedov <imammedo@redhat.com>
+R: Xiao Guangrong <xiaoguangrong.eric@gmail.com>
+S: Supported
+F: hw/mem/memory-device.c
+F: hw/mem/nvdimm.c
+F: hw/mem/pc-dimm.c
+F: include/hw/mem/memory-device.h
+F: include/hw/mem/nvdimm.h
+F: include/hw/mem/pc-dimm.h
+F: docs/nvdimm.txt
+
 SPICE
 M: Gerd Hoffmann <kraxel@redhat.com>
 S: Odd Fixes
-- 
MST


