Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A784AAED1
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 11:22:14 +0100 (CET)
Received: from localhost ([::1]:38696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGegP-0001rl-IC
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 05:22:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGe0R-0001GZ-05
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGe0O-0003k8-Ag
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644140325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xdn3hH7GYkmOyJreuMxMec/MdQOpS7XbSzRxBzQ41Cg=;
 b=X4o2OAoxQI1PV+ESlhmqPTxvnrqn2UH+OzqJG0GRwncUrZ5Y/r9CmoD6PpBwPBHwb9MpWh
 66HISlZJSzjLGUsMnt1D9B1jbGMn+Z2GaWcLYqw/W9CoQcooC/ItqlCApgLdB80xkrZaPi
 UrQwrBz3TjGejWfdJpZp3EzsD13weSs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-111-c6V3DAGtMTmOdhFdDU9JYg-1; Sun, 06 Feb 2022 04:38:45 -0500
X-MC-Unique: c6V3DAGtMTmOdhFdDU9JYg-1
Received: by mail-wm1-f69.google.com with SMTP id
 z2-20020a05600c220200b0034d2eb95f27so3956972wml.1
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 01:38:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Xdn3hH7GYkmOyJreuMxMec/MdQOpS7XbSzRxBzQ41Cg=;
 b=E4QvJalH25o9AzyAjtuyV72iprGZF93ZeCpRiiIYoGSkNg9m5PZJJJd/QAVQvJNnvO
 s65BhuyCFDfvUI4F7c74SowuEXDmunys57rE430ViMiS01lpfYz8t0JxrUAzANLfSFgO
 MmaQO1Reaq9c/RXxYWo47WXFm/uFrMtPphFy+vavopvAx33rLsRpjLY8P7CRfDADZ1mV
 c3mElA4vTzh/g8bCQhPAAMD4NU2/wyP45gsiZetaJmPFwZSCKaN+SycTuoH6onSiKj1F
 GXE0eCpsHgjqMtN39SFvj+0O4jEVMM6EcNtdJMqc+irH4C/KdtXnclhx7RiAFH+BOYuV
 ebIA==
X-Gm-Message-State: AOAM533X8rBR0rHO0sAr2zOaJu7AMPPkRSXrjZGUcuTV2BS3yTI/E1+b
 r0Cwn7d7lfdq9O0SeZ9CfzHRJ2F35So45Szo4RYC3aGr8N5T0iooDqfreZ9MFijc2kevHwMY5ww
 ZkVWLe69sqMF54i1hsHKlR8uqhfpxBJtV1YVsD8JyzpzptUy4dHp4p6CfmrHP
X-Received: by 2002:adf:f001:: with SMTP id j1mr4113435wro.48.1644140322397;
 Sun, 06 Feb 2022 01:38:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwP/bf5qKZfE1bquerEidiYi41CmG8JqRXwdrFMFwiSjk9VOz/h1kiTcCKkptCJ7TLlJno0AA==
X-Received: by 2002:adf:f001:: with SMTP id j1mr4113404wro.48.1644140322104;
 Sun, 06 Feb 2022 01:38:42 -0800 (PST)
Received: from redhat.com ([2.52.12.81])
 by smtp.gmail.com with ESMTPSA id e10sm7506404wrq.53.2022.02.06.01.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 01:38:41 -0800 (PST)
Date: Sun, 6 Feb 2022 04:38:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 20/24] ACPI ERST: create ACPI ERST table for pc/x86 machines
Message-ID: <20220206093702.1282676-21-mst@redhat.com>
References: <20220206093702.1282676-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220206093702.1282676-1-mst@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric DeVolder <eric.devolder@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric DeVolder <eric.devolder@oracle.com>

This change exposes ACPI ERST support for x86 guests.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <1643402289-22216-8-git-send-email-eric.devolder@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/erst.h |  5 +++++
 hw/i386/acpi-build.c   | 15 +++++++++++++++
 hw/i386/acpi-microvm.c | 15 +++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/include/hw/acpi/erst.h b/include/hw/acpi/erst.h
index 9d637179fe..b747fe7739 100644
--- a/include/hw/acpi/erst.h
+++ b/include/hw/acpi/erst.h
@@ -16,4 +16,9 @@ void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
 
 #define TYPE_ACPI_ERST "acpi-erst"
 
+/* returns NULL unless there is exactly one device */
+static inline Object *find_erst_dev(void)
+{
+    return object_resolve_path_type("", TYPE_ACPI_ERST, NULL);
+}
 #endif
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index ce823e8fcb..ebd47aa26f 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -43,6 +43,7 @@
 #include "sysemu/tpm.h"
 #include "hw/acpi/tpm.h"
 #include "hw/acpi/vmgenid.h"
+#include "hw/acpi/erst.h"
 #include "sysemu/tpm_backend.h"
 #include "hw/rtc/mc146818rtc_regs.h"
 #include "migration/vmstate.h"
@@ -74,6 +75,8 @@
 #include "hw/acpi/hmat.h"
 #include "hw/acpi/viot.h"
 
+#include CONFIG_DEVICES
+
 /* These are used to size the ACPI tables for -M pc-i440fx-1.7 and
  * -M pc-i440fx-2.0.  Even if the actual amount of AML generated grows
  * a little bit, there should be plenty of free space since the DSDT
@@ -2575,6 +2578,18 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
                     ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
                     x86ms->oem_table_id);
 
+#ifdef CONFIG_ACPI_ERST
+    {
+        Object *erst_dev;
+        erst_dev = find_erst_dev();
+        if (erst_dev) {
+            acpi_add_table(table_offsets, tables_blob);
+            build_erst(tables_blob, tables->linker, erst_dev,
+                       x86ms->oem_id, x86ms->oem_table_id);
+        }
+    }
+#endif
+
     vmgenid_dev = find_vmgenid_dev();
     if (vmgenid_dev) {
         acpi_add_table(table_offsets, tables_blob);
diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index 196d318499..68ca7e7fc2 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -30,6 +30,7 @@
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/acpi/generic_event_device.h"
 #include "hw/acpi/utils.h"
+#include "hw/acpi/erst.h"
 #include "hw/i386/fw_cfg.h"
 #include "hw/i386/microvm.h"
 #include "hw/pci/pci.h"
@@ -40,6 +41,8 @@
 #include "acpi-common.h"
 #include "acpi-microvm.h"
 
+#include CONFIG_DEVICES
+
 static void acpi_dsdt_add_virtio(Aml *scope,
                                  MicrovmMachineState *mms)
 {
@@ -207,6 +210,18 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
                     ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
                     x86ms->oem_table_id);
 
+#ifdef CONFIG_ACPI_ERST
+    {
+        Object *erst_dev;
+        erst_dev = find_erst_dev();
+        if (erst_dev) {
+            acpi_add_table(table_offsets, tables_blob);
+            build_erst(tables_blob, tables->linker, erst_dev,
+                       x86ms->oem_id, x86ms->oem_table_id);
+        }
+    }
+#endif
+
     xsdt = tables_blob->len;
     build_xsdt(tables_blob, tables->linker, table_offsets, x86ms->oem_id,
                x86ms->oem_table_id);
-- 
MST


