Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A535422E1F
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:37:56 +0200 (CEST)
Received: from localhost ([::1]:39034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXnRz-0002ZN-9F
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmto-0001Cr-89
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:02:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmtd-0005hc-KP
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:02:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pyxz/AAK48QVMZFo15zTre3YEn4vxWBMxwl4pRwjT14=;
 b=ELUY0D9GLmqXHJyMCq5TyjeBtwf46aPMiY7oCR+2shBFAo3O3ZGc83v98YQ6g2GSxdn9Lg
 KF6WEpwoHK4iiV4cmtMftMbZ06OYepseC+50LSR+OQR2DfxRs4k4ndkLVaFn7P/MejfCeS
 hrKme6rIJUTjFtGNvFg+A9ma3z2/uLQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-XMmK4Ko6M-K465YSh263xQ-1; Tue, 05 Oct 2021 12:02:23 -0400
X-MC-Unique: XMmK4Ko6M-K465YSh263xQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 3-20020a05600c22c300b0030d6a6a28f8so1217426wmg.5
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Pyxz/AAK48QVMZFo15zTre3YEn4vxWBMxwl4pRwjT14=;
 b=xmdgJfo76q1v8a+LkhvhLtc8COgrFtC8mOsGiU6i+kXyO2U9fE/iWaIQTDZL2bxunZ
 AzGMUycFipe+wphllgh7MW/nhYnPmFAoVtdxef18EvXDFEK4PIKggH2r5a/SwrffP8Ju
 fs5nWFK+h9JMXLMP2ER8HH26+hW8L2fi/CRbgN+E4lRXzQ3j/YDAJw9flhS6yRg4YqKA
 nBBjQvUBf3cKAIt0ytc+rVwMgt1rsHP0kFwBmNR2Y6z9xXpTFZPq62I2sPTtsjH/TnY7
 905O0v/KxsZjzlOL85QRm4G95WOYyNNP2yMZKj4grqO5cjZeIZfkBvPKdi9EPQ1VzlDH
 nrmA==
X-Gm-Message-State: AOAM532wng276XwBMQ2EcWr83IG0sVA970zCH1kDOaRsoeEX/ld+R7aE
 TI/VBXWkw9uyVydkRXtcmk5Zo7/6AIomOEWi75Bvs6o40b7BwzbQmp+z7qpcam8i9nU/IiLm0dK
 pe35qR7NqLBZDrTXwBfCwiBo7c22nDgeZBkMynQPJTk24IZ9OYV/fuw1Ewf11
X-Received: by 2002:adf:a4c7:: with SMTP id h7mr10065844wrb.57.1633449741396; 
 Tue, 05 Oct 2021 09:02:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxIlPaIL7pTPPhMDqNF4zv32q1QkhMGCb/aYOk+MqsmD/vG2wT2v4dCyWBwADXN+4NxHt3kg==
X-Received: by 2002:adf:a4c7:: with SMTP id h7mr10065801wrb.57.1633449741142; 
 Tue, 05 Oct 2021 09:02:21 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id z17sm2283052wml.24.2021.10.05.09.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:02:19 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:02:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/57] acpi: nvdimm_build_nfit: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Message-ID: <20211005155946.513818-25-mst@redhat.com>
References: <20211005155946.513818-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005155946.513818-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Eric Auger <eric.auger@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Also since acpi_table_begin() reserves space only for standard header
while previous acpi_data_push() reserved the header + 4 bytes field,
add 4 bytes 'Reserved' field into nvdimm_build_nfit() which didn't
have it.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210924122802.1455362-11-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/nvdimm.c | 42 +++++++++++++++++-------------------------
 1 file changed, 17 insertions(+), 25 deletions(-)

diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index e3d5fe1939..15f6ca82ca 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -44,22 +44,6 @@ static const uint8_t nvdimm_nfit_spa_uuid[] =
       UUID_LE(0x66f0d379, 0xb4f3, 0x4074, 0xac, 0x43, 0x0d, 0x33,
               0x18, 0xb7, 0x8c, 0xdb);
 
-/*
- * NVDIMM Firmware Interface Table
- * @signature: "NFIT"
- *
- * It provides information that allows OSPM to enumerate NVDIMM present in
- * the platform and associate system physical address ranges created by the
- * NVDIMMs.
- *
- * It is defined in ACPI 6.0: 5.2.25 NVDIMM Firmware Interface Table (NFIT)
- */
-struct NvdimmNfitHeader {
-    ACPI_TABLE_HEADER_DEF
-    uint32_t reserved;
-} QEMU_PACKED;
-typedef struct NvdimmNfitHeader NvdimmNfitHeader;
-
 /*
  * define NFIT structures according to ACPI 6.0: 5.2.25 NVDIMM Firmware
  * Interface Table (NFIT).
@@ -401,25 +385,33 @@ void nvdimm_plug(NVDIMMState *state)
     nvdimm_build_fit_buffer(state);
 }
 
+/*
+ * NVDIMM Firmware Interface Table
+ * @signature: "NFIT"
+ *
+ * It provides information that allows OSPM to enumerate NVDIMM present in
+ * the platform and associate system physical address ranges created by the
+ * NVDIMMs.
+ *
+ * It is defined in ACPI 6.0: 5.2.25 NVDIMM Firmware Interface Table (NFIT)
+ */
+
 static void nvdimm_build_nfit(NVDIMMState *state, GArray *table_offsets,
                               GArray *table_data, BIOSLinker *linker,
                               const char *oem_id, const char *oem_table_id)
 {
     NvdimmFitBuffer *fit_buf = &state->fit_buf;
-    unsigned int header;
+    AcpiTable table = { .sig = "NFIT", .rev = 1,
+                        .oem_id = oem_id, .oem_table_id = oem_table_id };
 
     acpi_add_table(table_offsets, table_data);
 
-    /* NFIT header. */
-    header = table_data->len;
-    acpi_data_push(table_data, sizeof(NvdimmNfitHeader));
+    acpi_table_begin(&table, table_data);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 4);
     /* NVDIMM device structures. */
     g_array_append_vals(table_data, fit_buf->fit->data, fit_buf->fit->len);
-
-    build_header(linker, table_data,
-                 (void *)(table_data->data + header), "NFIT",
-                 sizeof(NvdimmNfitHeader) + fit_buf->fit->len, 1, oem_id,
-                 oem_table_id);
+    acpi_table_end(linker, &table);
 }
 
 #define NVDIMM_DSM_MEMORY_SIZE      4096
-- 
MST


