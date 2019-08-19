Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D18494ED6
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 22:22:44 +0200 (CEST)
Received: from localhost ([::1]:57338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzoAN-0004t1-1L
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 16:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45531)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tcminyard@gmail.com>) id 1hzo5p-0007hz-LV
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 16:17:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tcminyard@gmail.com>) id 1hzo5i-0003Km-Hy
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 16:17:29 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:35236)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <tcminyard@gmail.com>) id 1hzo5i-0003KM-D0
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 16:17:22 -0400
Received: by mail-oi1-x241.google.com with SMTP id a127so2321411oii.2
 for <qemu-devel@nongnu.org>; Mon, 19 Aug 2019 13:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7u6dzx9m1L9fcPFMzqqXPirgmOOXLNLAhmcgncHa558=;
 b=QNGyrjQGT6VbvV2S18RihejNy/ZxChh9ex8c21xxiKAnqeVcSFbobPdFnCW4JYibZ7
 7ePOSQv92IcXUZJ9rTM0JSPdYp0TL1/Gxd4v4lH+NHNEg3FvlPLVAn/ICL5KopOtaLvc
 L6w+/c+zxviSYPSmoGLPY3Ny9G0SxE9As3C2sg9JzzYFw7YVGYVUmLkefCjk6fyjiOve
 /jkxKROazdjNRsWvQMNQIppOWH+AR+s2RpjCqulNy6wN+W6wy5Agh0PZ8GQJabuN3JIo
 h6xOAcLIbXEbHZQochmbfYdQe1YfDLPQohWVZObHYHFvEr7LdYeucGEqmqSw2o9P6r8T
 +ieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=7u6dzx9m1L9fcPFMzqqXPirgmOOXLNLAhmcgncHa558=;
 b=fLjHAbObBFeG8FVw/x79genQAR3ffUNqF4Dz2C7Wnd8MrwYKJesiXiCrw3VqJo/1iz
 UnykNZ2U6brVMKSbHauVX+7GuNC3dCNow4zUzYNMtb+Jl3CHiFpqisCWgHJzicLH8rJv
 x1tV+kP8q9X2/wUVp/QiFEpNV53Kw8bnggsZL/CFqIQSVVoyBQzyw0hQjQGhwtoMEApG
 Ggb21OfJzS0vTuD6UE4EIvH9sEonRT46qRKo3YqhNzcBkVbGgQzTO4YI3i4wQsFQ+Eke
 SCfwvTB6Bb0GhmP7PEU1YfWc2FoctJvtgfcS/XjiILFr9ohazVajPjRodFRJWsTBdoPI
 aDiw==
X-Gm-Message-State: APjAAAUYYTsoeZCSsDtqfgXwJahOmjK2Vl9dtwBcCEVsaik2HKFMpKEt
 yDT1c3tdJE9SOCUYXEQoA84++xI=
X-Google-Smtp-Source: APXvYqxtFGV0B/GH2o+jRjBUKdqEspRQFNsrprrijUIC39JgNxbZtAKvZKuY59cerVKG0gYFl06JGg==
X-Received: by 2002:aca:518a:: with SMTP id
 f132mr14229083oib.114.1566245841478; 
 Mon, 19 Aug 2019 13:17:21 -0700 (PDT)
Received: from serve.minyard.net ([47.184.134.43])
 by smtp.gmail.com with ESMTPSA id v5sm5805883otk.64.2019.08.19.13.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 13:17:19 -0700 (PDT)
Received: from t430.minyard.net (t430m.minyard.net [192.168.27.3])
 by serve.minyard.net (Postfix) with ESMTPA id 2BEE81805AD;
 Mon, 19 Aug 2019 20:17:18 +0000 (UTC)
Received: by t430.minyard.net (Postfix, from userid 1000)
 id 163A7302506; Mon, 19 Aug 2019 15:17:17 -0500 (CDT)
From: minyard@acm.org
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Mon, 19 Aug 2019 15:17:03 -0500
Message-Id: <20190819201705.31633-14-minyard@acm.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819201705.31633-1-minyard@acm.org>
References: <20190819201705.31633-1-minyard@acm.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: [Qemu-devel] [PATCH 13/15] acpi: Add i2c serial bus CRS handling
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
Cc: Corey Minyard <cminyard@mvista.com>, Igor Mammedov <imammedo@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Corey Minyard <cminyard@mvista.com>

This will be required for getting IPMI SSIF (SMBus interface) into
the ACPI tables.

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 hw/acpi/aml-build.c         | 40 +++++++++++++++++++++++++++++++++++++
 include/hw/acpi/aml-build.h | 18 +++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 555c24f21d..a6ddd1db8f 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1870,3 +1870,43 @@ build_hdr:
     build_header(linker, tbl, (void *)(tbl->data + fadt_start),
                  "FACP", tbl->len - fadt_start, f->rev, oem_id, oem_table_id);
 }
+
+/* ACPI 5.0: 6.4.3.8.2 Serial Bus Connection Descriptors */
+static Aml *aml_serial_bus_device(uint8_t serial_bus_type, uint8_t flags,
+                                  uint16_t type_flags,
+                                  uint8_t revid, uint16_t data_length,
+                                  uint16_t resource_source_len)
+{
+    Aml *var = aml_alloc();
+    uint16_t length = data_length + resource_source_len + 9;
+
+    build_append_byte(var->buf, 0x8e); /* Serial Bus Connection Descriptor */
+    build_append_int_noprefix(var->buf, length, sizeof(length));
+    build_append_byte(var->buf, 1);    /* Revision ID */
+    build_append_byte(var->buf, 0);    /* Resource Source Index */
+    build_append_byte(var->buf, serial_bus_type); /* Serial Bus Type */
+    build_append_byte(var->buf, flags); /* General Flags */
+    build_append_int_noprefix(var->buf, type_flags, /* Type Specific Flags */
+                              sizeof(type_flags));
+    build_append_byte(var->buf, revid); /* Type Specification Revision ID */
+    build_append_int_noprefix(var->buf, data_length, sizeof(data_length));
+
+    return var;
+}
+
+/* ACPI 5.0: 6.4.3.8.2.1 I2C Serial Bus Connection Resource Descriptor */
+Aml *aml_i2c_serial_bus_device(uint16_t address, const char *resource_source)
+{
+    uint16_t resource_source_len = strlen(resource_source) + 1;
+    Aml *var = aml_serial_bus_device(AML_SERIAL_BUS_TYPE_I2C, 0, 0, 1,
+                                     6, resource_source_len);
+
+    /* Connection Speed.  Just set to 100K for now, it doesn't really matter. */
+    build_append_int_noprefix(var->buf, 100000, 4);
+    build_append_int_noprefix(var->buf, address, sizeof(address));
+
+    /* This is a string, not a name, so just copy it directly in. */
+    g_array_append_vals(var->buf, resource_source, resource_source_len);
+
+    return var;
+}
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 1a563ad756..ff9f9b8d7f 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -223,6 +223,23 @@ struct AcpiBuildTables {
     BIOSLinker *linker;
 } AcpiBuildTables;
 
+/*
+ * ACPI 5.0: 6.4.3.8.2 Serial Bus Connection Descriptors
+ * Serial Bus Type
+ */
+#define AML_SERIAL_BUS_TYPE_I2C  1
+#define AML_SERIAL_BUS_TYPE_SPI  2
+#define AML_SERIAL_BUS_TYPE_UART 3
+
+/*
+ * ACPI 5.0: 6.4.3.8.2 Serial Bus Connection Descriptors
+ * General Flags
+ */
+/* Slave Mode */
+#define AML_SERIAL_BUS_FLAG_MASTER_DEVICE       (1 << 0)
+/* Consumer/Producer */
+#define AML_SERIAL_BUS_FLAG_CONSUME_ONLY        (1 << 1)
+
 /**
  * init_aml_allocator:
  *
@@ -347,6 +364,7 @@ Aml *aml_qword_memory(AmlDecode dec, AmlMinFixed min_fixed,
 Aml *aml_dma(AmlDmaType typ, AmlDmaBusMaster bm, AmlTransferSize sz,
              uint8_t channel);
 Aml *aml_sleep(uint64_t msec);
+Aml *aml_i2c_serial_bus_device(uint16_t address, const char *resource_source);
 
 /* Block AML object primitives */
 Aml *aml_scope(const char *name_format, ...) GCC_FMT_ATTR(1, 2);
-- 
2.17.1


