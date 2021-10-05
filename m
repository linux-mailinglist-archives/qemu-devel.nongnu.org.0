Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 591A2422E2B
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:40:59 +0200 (CEST)
Received: from localhost ([::1]:47546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXnUw-0008S0-B9
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmt2-0000Pb-Oa
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:01:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmt1-0005Eh-11
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:01:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K+DILqdRPrmyt7zpDyv69OZUbVta4rTANUIRBMHOu6g=;
 b=TvVE4kBGyRjFgOszQFjmUAPtnoxzk03jwXNJGaeCFdpuHp/Jgxnoe472wFnf5puu8OvO6S
 bK07YdubbiUtwMpOpn/MmiOXPpnxFRTxvALa2S+50f2SalxUmO59HJA2wS49ABnbMlPVZp
 VTPURXWtGj69yRgzY8H72s3xM7pB1Yg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38--jhJZuHhMCSt1No7v7My_g-1; Tue, 05 Oct 2021 12:01:45 -0400
X-MC-Unique: -jhJZuHhMCSt1No7v7My_g-1
Received: by mail-wr1-f72.google.com with SMTP id
 r15-20020adfce8f000000b0015df1098ccbso5899890wrn.4
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:01:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=K+DILqdRPrmyt7zpDyv69OZUbVta4rTANUIRBMHOu6g=;
 b=vB32Tduql6JnQ9m2xNfXuhflLTHhjue/hMNcJ2pmMmsUy2SnFeoAT/zq5C/TKgJELm
 8c9kOjbRiVvYjDRMX5HJulVwsroFqtJbmJlesVWMf2c9rprJc6CcypxS50Kz8vusDBPK
 5qf47RA3pItJzv66EzvOjT+2pWVlTrdsSVevPIxjXxrJRyNs/D5vn9LXoiCxqbsE0Tte
 obHYe+OUXlRJanwSQk/b8UgWEcyPpvJcwuFwJETn9Siai64bfgLvRV+0OBWAI+DivqiN
 bzRMXGWensmAOFVDRBzZfTC73jye+VPx6+nI5+OzfYKJ2qXSDEx0XOCtZVQ/BZsTAgQJ
 7qfg==
X-Gm-Message-State: AOAM532MaCFjGO4RfDrf94t2q8GH+12hrKmSaQ7+/gMUR/MBqPYsQVuN
 kZBHWWxSCOAINhqBG0rzcszVmv/slvS0Bkawvxty+foFjqIzxO5U73gmhEqhyGjgXUWzApnBPud
 s93k1aEf8msh/o5IQ4cJgy3hOWb/Z0ZtOKlQVFqQPpjfZS0wVeSEnMxGf9/bv
X-Received: by 2002:adf:bbc2:: with SMTP id z2mr21859550wrg.359.1633449703448; 
 Tue, 05 Oct 2021 09:01:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyey59N4Du9ia15xXrFU13z7vRaqdIjDqpgty3Y7U9hec1shzMjAEC8JMMJ9pg4mJuAsge0Ag==
X-Received: by 2002:adf:bbc2:: with SMTP id z2mr21859522wrg.359.1633449703246; 
 Tue, 05 Oct 2021 09:01:43 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id z133sm2715428wmc.45.2021.10.05.09.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:01:42 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:01:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/57] acpi: build_rsdt: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Message-ID: <20211005155946.513818-17-mst@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
 Eric Auger <eric.auger@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offests magic from API user.

While at it switch to build_append_int_noprefix() to build
entries to other tables (which also removes some manual offset
calculations).

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210924122802.1455362-3-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/acpi-defs.h | 10 ----------
 hw/acpi/aml-build.c         | 29 ++++++++++++++---------------
 2 files changed, 14 insertions(+), 25 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index cf9f44299c..ccfa3382aa 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -149,16 +149,6 @@ struct AcpiSerialPortConsoleRedirection {
 typedef struct AcpiSerialPortConsoleRedirection
                AcpiSerialPortConsoleRedirection;
 
-/*
- * ACPI 1.0 Root System Description Table (RSDT)
- */
-struct AcpiRsdtDescriptorRev1 {
-    ACPI_TABLE_HEADER_DEF       /* ACPI common table header */
-    uint32_t table_offset_entry[];  /* Array of pointers to other */
-    /* ACPI tables */
-} QEMU_PACKED;
-typedef struct AcpiRsdtDescriptorRev1 AcpiRsdtDescriptorRev1;
-
 /*
  * ACPI 2.0 eXtended System Description Table (XSDT)
  */
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 229a3eb654..616a292229 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1884,33 +1884,32 @@ build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
                                     32);
 }
 
-/* Build rsdt table */
+/*
+ * ACPI 1.0 Root System Description Table (RSDT)
+ */
 void
 build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
            const char *oem_id, const char *oem_table_id)
 {
     int i;
-    unsigned rsdt_entries_offset;
-    AcpiRsdtDescriptorRev1 *rsdt;
-    int rsdt_start = table_data->len;
-    const unsigned table_data_len = (sizeof(uint32_t) * table_offsets->len);
-    const unsigned rsdt_entry_size = sizeof(rsdt->table_offset_entry[0]);
-    const size_t rsdt_len = sizeof(*rsdt) + table_data_len;
+    AcpiTable table = { .sig = "RSDT", .rev = 1,
+                        .oem_id = oem_id, .oem_table_id = oem_table_id };
 
-    rsdt = acpi_data_push(table_data, rsdt_len);
-    rsdt_entries_offset = (char *)rsdt->table_offset_entry - table_data->data;
+    acpi_table_begin(&table, table_data);
     for (i = 0; i < table_offsets->len; ++i) {
         uint32_t ref_tbl_offset = g_array_index(table_offsets, uint32_t, i);
-        uint32_t rsdt_entry_offset = rsdt_entries_offset + rsdt_entry_size * i;
+        uint32_t rsdt_entry_offset = table.array->len;
 
-        /* rsdt->table_offset_entry to be filled by Guest linker */
+        /* reserve space for entry */
+        build_append_int_noprefix(table.array, 0, 4);
+
+        /* mark position of RSDT entry to be filled by Guest linker */
         bios_linker_loader_add_pointer(linker,
-            ACPI_BUILD_TABLE_FILE, rsdt_entry_offset, rsdt_entry_size,
+            ACPI_BUILD_TABLE_FILE, rsdt_entry_offset, 4,
             ACPI_BUILD_TABLE_FILE, ref_tbl_offset);
+
     }
-    build_header(linker, table_data,
-                 (void *)(table_data->data + rsdt_start),
-                 "RSDT", rsdt_len, 1, oem_id, oem_table_id);
+    acpi_table_end(linker, &table);
 }
 
 /* Build xsdt table */
-- 
MST


