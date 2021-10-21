Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AE34366A1
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 17:42:56 +0200 (CEST)
Received: from localhost ([::1]:40514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdaDX-0005Yj-4U
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 11:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZx6-0000Gi-1I
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:56 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:42868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZx0-0002R3-Rm
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:55 -0400
Received: by mail-pg1-x534.google.com with SMTP id t7so617987pgl.9
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 08:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ErF+8i/+0tR5/azRFLcQKZVn9pixjkrst7fCrRvD3X8=;
 b=MZjLG+i+saUFtjmsQsFIzwiDNzD+WePxKuXVC73B9xBP12qJqQ122jgEDRpqHFLKHH
 Ng9GFk/cHgw/a7XUunlxwoffGJibVwgXH+jr7aY+u+c6qEE99W/Ce3av6A3mcd1mv3k4
 M0CyfO4KHhMBHZfGwR9MUd6dL+fAVRnsx9sM/dbjEnM9H8g1hV/FnzH2iWKhJ+ImZ1iV
 5hkU7SzTPVHIIQLBB6Jubh73Wb87/YRawakZme/jt0oDf3Y+vh/nWEk5mwNuD+fXHiDf
 EXHq9UwsHVjc1+rlHHhTqqNXCz+gP7RPKzbDouGTTDw497yW3mYaRbhu3yafEgXYUBaY
 XsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ErF+8i/+0tR5/azRFLcQKZVn9pixjkrst7fCrRvD3X8=;
 b=MGQxrUIk22QFURXG9aLcXEi9Ti2I0K0ZbgnvxPmJJoOx3l6jMhkd1tPJMn2zudU/u8
 SqD4Egwf9+3UiystcctfMnWvdFirvTzUDx8c004WZyZYNx8PxHhmEyv6R3gDzFuUKAbq
 Ut4x59Pec/Yso4968C6Ntd0qowD5JyWXGXy7h5Q6YhiUobdGMkSSZjAirGt7Xry1JR+l
 ieZWakoAPrBl25T3YtRQMUs/ftyNmqHCoL9GO6xxZg/xP5KeQTbXUe9+v0oRlDRZd1Dh
 rbQHr4TztEivjZnEQejNQjoOx7IAyfvtjbzxUdi3U10A8oHDtCJHcM5Z8IF5yBLmgxG1
 KBYg==
X-Gm-Message-State: AOAM5323274CqI2SCdgU8yphqufk5eAfHOJ8Gy+AIkGSVdYD8NVsgrSs
 KCc2L9WOR2W/uINXYi7PupZxEl7jdPO0vw==
X-Google-Smtp-Source: ABdhPJy5qbyPbKpnk/wYu4vf2mqmYxdAHk0G+utvptZpDV/M36Fon+qk0uZMIGnnzW04t6bKMPKV0w==
X-Received: by 2002:a05:6a00:2301:b0:44d:8136:c0db with SMTP id
 h1-20020a056a00230100b0044d8136c0dbmr6663128pfh.43.1634829949479; 
 Thu, 21 Oct 2021 08:25:49 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y3sm5676257pge.44.2021.10.21.08.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:25:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/19] hw/arm/virt_acpi_build: Generate DBG2 table
Date: Thu, 21 Oct 2021 08:25:32 -0700
Message-Id: <20211021152541.781175-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021152541.781175-1-richard.henderson@linaro.org>
References: <20211021152541.781175-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Eric Auger <eric.auger@redhat.com>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

ARM SBBR specification mandates DBG2 table (Debug Port Table 2)
since v1.0 (ARM DEN0044F 8.3.1.7 DBG2).

The DBG2 table allows to describe one or more debug ports.

Generate an DBG2 table featuring a single debug port, the PL011.

The DBG2 specification can be found at
"Microsoft Debug Port Table 2 (DBG2)"
https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table?redirectedfrom=MSDN

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20211019080037.930641-3-eric.auger@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/virt-acpi-build.c | 63 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 62 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 9c4730f4ab..d3bb4cba3e 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -626,6 +626,64 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     acpi_table_end(linker, &table);
 }
 
+/* Debug Port Table 2 (DBG2) */
+static void
+build_dbg2(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
+{
+    AcpiTable table = { .sig = "DBG2", .rev = 0, .oem_id = vms->oem_id,
+                        .oem_table_id = vms->oem_table_id };
+    int dbg2devicelength;
+    const char name[] = "COM0";
+    const int namespace_length = sizeof(name);
+
+    acpi_table_begin(&table, table_data);
+
+    dbg2devicelength = 22 + /* BaseAddressRegister[] offset */
+                       12 + /* BaseAddressRegister[] */
+                       4 + /* AddressSize[] */
+                       namespace_length /* NamespaceString[] */;
+
+    /* OffsetDbgDeviceInfo */
+    build_append_int_noprefix(table_data, 44, 4);
+    /* NumberDbgDeviceInfo */
+    build_append_int_noprefix(table_data, 1, 4);
+
+    /* Table 2. Debug Device Information structure format */
+    build_append_int_noprefix(table_data, 0, 1); /* Revision */
+    build_append_int_noprefix(table_data, dbg2devicelength, 2); /* Length */
+    /* NumberofGenericAddressRegisters */
+    build_append_int_noprefix(table_data, 1, 1);
+    /* NameSpaceStringLength */
+    build_append_int_noprefix(table_data, namespace_length, 2);
+    build_append_int_noprefix(table_data, 38, 2); /* NameSpaceStringOffset */
+    build_append_int_noprefix(table_data, 0, 2); /* OemDataLength */
+    /* OemDataOffset (0 means no OEM data) */
+    build_append_int_noprefix(table_data, 0, 2);
+
+    /* Port Type */
+    build_append_int_noprefix(table_data, 0x8000 /* Serial */, 2);
+    /* Port Subtype */
+    build_append_int_noprefix(table_data, 0x3 /* ARM PL011 UART */, 2);
+    build_append_int_noprefix(table_data, 0, 2); /* Reserved */
+    /* BaseAddressRegisterOffset */
+    build_append_int_noprefix(table_data, 22, 2);
+    /* AddressSizeOffset */
+    build_append_int_noprefix(table_data, 34, 2);
+
+    /* BaseAddressRegister[] */
+    build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 8, 0, 1,
+                     vms->memmap[VIRT_UART].base);
+
+    /* AddressSize[] */
+    build_append_int_noprefix(table_data,
+                              vms->memmap[VIRT_UART].size, 4);
+
+    /* NamespaceString[] */
+    g_array_append_vals(table_data, name, namespace_length);
+
+    acpi_table_end(linker, &table);
+};
+
 /*
  * ACPI spec, Revision 5.1 Errata A
  * 5.2.12 Multiple APIC Description Table (MADT)
@@ -885,7 +943,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     dsdt = tables_blob->len;
     build_dsdt(tables_blob, tables->linker, vms);
 
-    /* FADT MADT GTDT MCFG SPCR pointed to by RSDT */
+    /* FADT MADT GTDT MCFG SPCR DBG2 pointed to by RSDT */
     acpi_add_table(table_offsets, tables_blob);
     build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
 
@@ -908,6 +966,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     acpi_add_table(table_offsets, tables_blob);
     build_spcr(tables_blob, tables->linker, vms);
 
+    acpi_add_table(table_offsets, tables_blob);
+    build_dbg2(tables_blob, tables->linker, vms);
+
     if (vms->ras) {
         build_ghes_error_table(tables->hardware_errors, tables->linker);
         acpi_add_table(table_offsets, tables_blob);
-- 
2.25.1


