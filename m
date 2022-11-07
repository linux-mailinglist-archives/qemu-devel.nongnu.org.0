Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A592E620294
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 23:49:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAuK-0006Fr-F2; Mon, 07 Nov 2022 17:47:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAuH-0006Fh-L5
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:47:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAuG-0001VH-0N
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:47:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NBEgnvyPuSubVpepgBU5LLBjdsEmlTwEplvXdoQGW9E=;
 b=TxaGyZaE5lKPUFydhkBd0SXmTxET0TAcaG+fxpSmZC9/du0U+9+BBIQRd/mKn/WXHoUpAH
 klIEWLApIEzcQbkV84UeD52zZYeb16W2XvMpjClYn+gRJlUr4d0HV4YkxJPQabbXKoYURQ
 HcKYtpkvGkrz9f0Lmup93ClHOJrSiyg=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-127--6ypqqLrN4e2F01Hnoe8gw-1; Mon, 07 Nov 2022 17:47:50 -0500
X-MC-Unique: -6ypqqLrN4e2F01Hnoe8gw-1
Received: by mail-qt1-f199.google.com with SMTP id
 u31-20020a05622a199f00b003a51fa90654so9111526qtc.19
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:47:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NBEgnvyPuSubVpepgBU5LLBjdsEmlTwEplvXdoQGW9E=;
 b=WQJmLuHIuAGjQDpwqDdO+s20QeaA57FT1pitMYoePkQFrT0TdWKxYSiVKW/bS+okjG
 QvxQFOr+nwi0FQ1NFyJHt/9TQjErwpuJBcB04rdBnfAw4XM7TuoSP6Le9x7GALeRsW6I
 J5POh4YYp1YXLu1OgkYYt5vC29AzG9ASz0o6BusNLzJJhx3Qw9EDtVQgQH27KMK8x2S5
 TvohiEImUo1FsD7AELfdmvCWmBZbaS133m2KYClJ9uBn6fdO0iwH/AgMxAS/KUzPa1mR
 mAj1SeaHmB2a5MDxwMaWQd+xpaF4FQW6sIya3nAkhu1Jcyht8W41Nhgq05f83T2RqOvH
 Ih8Q==
X-Gm-Message-State: ACrzQf1KSPohXw8H4wBFlKzDAR8HWbGx4cQDNqdJ3huOtL1zKEFrCC3M
 SuB7arK7dODOcsmeVtGJnNTKRG9/7yZAw0bQ5vkbJUUg1ERarcT6zYZgBuLpm0p6ya0e0aRK6ev
 Hp60dY+vhlX+oInuTAOrRzhg9vBm8yhupwb2yoeSzW/5L3x8elsaobQ1+D/sr
X-Received: by 2002:ad4:5fc5:0:b0:4bb:6360:e80 with SMTP id
 jq5-20020ad45fc5000000b004bb63600e80mr46500605qvb.63.1667861269614; 
 Mon, 07 Nov 2022 14:47:49 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5OKiGBoJlgXegI3sFMymbz0epprP7GAmPxRD2d8qNYArErAb1+9stEkLc4T8pepLPTinwX8g==
X-Received: by 2002:ad4:5fc5:0:b0:4bb:6360:e80 with SMTP id
 jq5-20020ad45fc5000000b004bb63600e80mr46500589qvb.63.1667861269355; 
 Mon, 07 Nov 2022 14:47:49 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 i22-20020a05620a249600b006faf76e7c9asm1384100qkn.115.2022.11.07.14.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:47:49 -0800 (PST)
Date: Mon, 7 Nov 2022 17:47:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v4 04/83] acpi/nvdimm: define macro for NVDIMM Device _DSM
Message-ID: <20221107224600.934080-5-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Robert Hoo <robert.hu@linux.intel.com>

Since it will be heavily used in next patch, define macro
NVDIMM_DEVICE_DSM_UUID for "4309AC30-0D11-11E4-9191-0800200C9A66", which is
NVDIMM device specific method uuid defined in NVDIMM _DSM interface spec,
Section 3. [1]

No functional changes in this patch.

[1] https://pmem.io/documents/IntelOptanePMem_DSM_Interface-V2.0.pdf

Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220922122155.1326543-4-robert.hu@linux.intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/nvdimm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index 201317c611..afff911c1e 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -922,6 +922,7 @@ void nvdimm_init_acpi_state(NVDIMMState *state, MemoryRegion *io,
 #define NVDIMM_DSM_RFIT_STATUS  "RSTA"
 
 #define NVDIMM_QEMU_RSVD_UUID   "648B9CF2-CDA1-4312-8AD9-49C4AF32BD62"
+#define NVDIMM_DEVICE_DSM_UUID  "4309AC30-0D11-11E4-9191-0800200C9A66"
 
 static void nvdimm_build_common_dsm(Aml *dev,
                                     NVDIMMState *nvdimm_state)
@@ -1029,8 +1030,7 @@ static void nvdimm_build_common_dsm(Aml *dev,
                /* UUID for QEMU internal use */), expected_uuid));
     aml_append(elsectx, ifctx);
     elsectx2 = aml_else();
-    aml_append(elsectx2, aml_store(
-               aml_touuid("4309AC30-0D11-11E4-9191-0800200C9A66")
+    aml_append(elsectx2, aml_store(aml_touuid(NVDIMM_DEVICE_DSM_UUID)
                /* UUID for NVDIMM Devices */, expected_uuid));
     aml_append(elsectx, elsectx2);
     aml_append(method, elsectx);
-- 
MST


