Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8FB6136E7
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:51:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUFw-0000hl-QI; Mon, 31 Oct 2022 08:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUFs-0000Yr-2I
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:51:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUFq-0002El-9t
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:51:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NBEgnvyPuSubVpepgBU5LLBjdsEmlTwEplvXdoQGW9E=;
 b=hykDoMIdk9q9PsJ29pZHUB6/Wsnu7P5WH2o+tBPUbqPiOyMBTzVXoWJCAiiv8HHFgcsONK
 H2GngnhKn4WbG/MEadMaH4HD3pZjs6SsRaXxAyFwnKNhL189a26zayxMcM3jMVVA1H60Vh
 PkgDVb+32DkWGpfDttLeyAzFTfv1TV4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-190-0M9NeVVzNialmEyqmDWL4g-1; Mon, 31 Oct 2022 08:50:59 -0400
X-MC-Unique: 0M9NeVVzNialmEyqmDWL4g-1
Received: by mail-wm1-f69.google.com with SMTP id
 c130-20020a1c3588000000b003b56be513e1so5283261wma.0
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NBEgnvyPuSubVpepgBU5LLBjdsEmlTwEplvXdoQGW9E=;
 b=XmLECpYHUAlWwKOGYLVc8sbsLqfwaooS88zSoUV6CBAg3wim/24sWwKcgzHcuyj559
 HXuGUJSCzkR2HLjk5jC1N9tnsvm5hg3O3nZI7tSRl1/eQAxDb7LPVb5tR+//qgbxkrFy
 CPgEsCSVssIOx9wbH9jP8WphbJmSwUeUw2sWhnBo2oZdeee72/TDD2ILyouUaON4Vqnj
 ZBTocy9rIHyijbHVb4D2cjqn1txr2A9twOybr200bN0khXhOz+R5HPebV5XWKkSjCKXv
 5nw8Hw3es3V9Ax12kd+ygf49ZqRJHAh1vbytIwWqifRYd6lj4NZZIg4YcKIHQ9OJhXdo
 E6tg==
X-Gm-Message-State: ACrzQf149jGTkEf+Pz7vMHmFIQgUUfZLqxzrNmOsEkLyGvqoMPdgEHMA
 al6msxZ6Obvew4+jwjsjoerhtEE2QkF/XN8UI5jdl/dBcJLJd4WM8L0t1dPgxt0foAtDbwDwZaA
 xP1A1TZj3vdp+GGpnsyQohEPU+eYlUNVeItwXnvTrXz35j7I15Y3rpYm8BiHe
X-Received: by 2002:adf:e603:0:b0:236:80ac:5f4b with SMTP id
 p3-20020adfe603000000b0023680ac5f4bmr7744165wrm.83.1667220658122; 
 Mon, 31 Oct 2022 05:50:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6VmcQRhlz+xSyVGchIZJlJPVFR/lycf/SInBKBUBK5hPmouV2EBMBn48kqMGBnbK39eMiJ+A==
X-Received: by 2002:adf:e603:0:b0:236:80ac:5f4b with SMTP id
 p3-20020adfe603000000b0023680ac5f4bmr7744153wrm.83.1667220657892; 
 Mon, 31 Oct 2022 05:50:57 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 h11-20020adff18b000000b0023677e1157fsm7101531wro.56.2022.10.31.05.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:50:57 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:50:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 05/86] acpi/nvdimm: define macro for NVDIMM Device _DSM
Message-ID: <20221031124928.128475-6-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

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


