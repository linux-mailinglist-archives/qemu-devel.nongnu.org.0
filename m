Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA76422E37
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:44:28 +0200 (CEST)
Received: from localhost ([::1]:55810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXnYI-0005nG-3a
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmtM-0000s1-Dx
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:02:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmtK-0005S8-Lb
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:02:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AUlMLhF7lHwLJN9qe1cXBZOGqAksRpcgI2Cp4ZjL4m8=;
 b=KujiNZuKLv9I8JChbMGAJHWmiSAHbyhejvs6bhR31jS3c3/rWbig+/qfzZtSyol8mL85XM
 8i7ti6Fj8gCRvQCqtpmX5z/2/HwT9kh/4QKElmH73/TI9hMsyhpTTP+7RYl83UCCTliohf
 xR/DoUJrhyzScTHmLRQrXsq/xbAdTHI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-wggme-86OB6ESPGxgnSYMA-1; Tue, 05 Oct 2021 12:02:01 -0400
X-MC-Unique: wggme-86OB6ESPGxgnSYMA-1
Received: by mail-wm1-f71.google.com with SMTP id
 f11-20020a7bcd0b000000b0030d72d5d0bcso1457989wmj.7
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:02:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AUlMLhF7lHwLJN9qe1cXBZOGqAksRpcgI2Cp4ZjL4m8=;
 b=45L646Xvyomrn2yy7tWhY4UIhrCAUNq0QOR7LsSf25c80WJaISfuWn/vr/t4FnP12y
 fW0lRHvfs3SbFLZq91Cu+aaYaKgHghmvpj36mbCyrvVF8UmnJFhAvnCdUZOZ6XbdEbO+
 pNZD1h+6zqK49rUmnU8KL3L38qbe8hIIWYFVIazOjilhAu2xogcOPi9ZI1uVcCD6mLXA
 ydFFnKQRr9PLgnRawfCRW+QdsSjYefdFb77c/ANxGNGmScksYicC4cW7i+qvtvU0ukQa
 Xa8CdmKwZYvf/Bpfw27GyI548a03j1vLe4mFxu0onCRmQfGm8dSVQLW+CZbNoTgH8Aaj
 TFMA==
X-Gm-Message-State: AOAM533NvTZ0YAt6Dx1gVObAY3RnAhynd/lNIh6MsykkwF2qUwm1IvDB
 qa/gUFMtOusmKwU3EvMH4T/0bdmoKtVyllJCup5xvduhP5x/X44yrfS9xvmAmV+MPA1V7DPreGM
 KbxAIjvmqvBEjo4WSojwFM9DPJJS1Iy8NrPc4cuW6Xp7pwE/ymW+yIxuYbGg3
X-Received: by 2002:adf:fe4e:: with SMTP id m14mr1181231wrs.14.1633449719768; 
 Tue, 05 Oct 2021 09:01:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6l9JjRNItDWDiI72C30IgdM7AuXVubp9yCGQ/4MNDnGBDX+YLI1CpkXdka6HOXKHpHzgrmw==
X-Received: by 2002:adf:fe4e:: with SMTP id m14mr1181189wrs.14.1633449719490; 
 Tue, 05 Oct 2021 09:01:59 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id n14sm5105393wrm.78.2021.10.05.09.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:01:58 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:01:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/57] acpi: build_tpm2: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Message-ID: <20211005155946.513818-21-mst@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Stefan Berger <stefanb@linux.ibm.com>, Eric Auger <eric.auger@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Tested-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210924122802.1455362-7-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/aml-build.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 4d0ff6e5f3..23cda45ee0 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -2111,13 +2111,14 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
                 const char *oem_id, const char *oem_table_id)
 {
     uint8_t start_method_params[12] = {};
-    unsigned log_addr_offset, tpm2_start;
+    unsigned log_addr_offset;
     uint64_t control_area_start_address;
     TPMIf *tpmif = tpm_find();
     uint32_t start_method;
+    AcpiTable table = { .sig = "TPM2", .rev = 4,
+                        .oem_id = oem_id, .oem_table_id = oem_table_id };
 
-    tpm2_start = table_data->len;
-    acpi_data_push(table_data, sizeof(AcpiTableHeader));
+    acpi_table_begin(&table, table_data);
 
     /* Platform Class */
     build_append_int_noprefix(table_data, TPM2_ACPI_CLASS_CLIENT, 2);
@@ -2155,9 +2156,7 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
     bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
                                    log_addr_offset, 8,
                                    ACPI_BUILD_TPMLOG_FILE, 0);
-    build_header(linker, table_data,
-                 (void *)(table_data->data + tpm2_start),
-                 "TPM2", table_data->len - tpm2_start, 4, oem_id, oem_table_id);
+    acpi_table_end(linker, &table);
 }
 #endif
 
-- 
MST


