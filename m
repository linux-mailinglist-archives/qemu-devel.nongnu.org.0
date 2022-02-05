Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 478BF4AA5B4
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 03:24:53 +0100 (CET)
Received: from localhost ([::1]:34536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGAku-0006rZ-Bs
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 21:24:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA7P-0003yf-RL
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:44:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA7N-0003Qm-RQ
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:44:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644025441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xdn3hH7GYkmOyJreuMxMec/MdQOpS7XbSzRxBzQ41Cg=;
 b=Pwtl86AjaWv8Vdg7Px7qKxatj1t7uT4LUMCf8Af9dTojeOJyBA4hn2xxeRRbfhbDq3yuA7
 3JO4SBTB1AhZynAD5k/FuULockCRjrC1sDptCs43WzdcZRbJ0T2suR0F6ddIopRfoUKSgD
 7NiP7xrflr0PhNv/AU2tgmMY2cjlx8U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314--6n7n7FoNaOtu9ujD5JgEQ-1; Fri, 04 Feb 2022 20:44:00 -0500
X-MC-Unique: -6n7n7FoNaOtu9ujD5JgEQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay8-20020a05600c1e0800b00350de81da56so1209178wmb.9
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 17:43:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Xdn3hH7GYkmOyJreuMxMec/MdQOpS7XbSzRxBzQ41Cg=;
 b=qURClf4/DbX/Ls6vXFEFQSELZpCXTNDvW3GuSlDrq5M5jK5siY6cEiImW7sd+npJqa
 wwzAr73lqxRS7EhRW7S3d0ETiPJOznCARoPUC4k13pqe7SzeI/bmF2j3l8NVilXwt71S
 vovSZH4gYJlAnJXjYS2PlHZ512gM0mbIUnYroDAEgTqYGN1Wbm3+to5uLLWdQmA/TIR+
 KYOO0kQBy9ZWcxa0dcHYOaQGs5aEHkYWdZqGw7ZRoxXLVAUx1W/PiGNizu0osp8b8rxh
 O/uh0tl4lorgb1LTBMogOpvz3/gB49tHjBbD5AaTCdghnJqIuuHcFYZXVzBkYwu027hz
 CHlw==
X-Gm-Message-State: AOAM530Ym6geDgYQSWU19GcCm7yfzJJZOxaKpBBjhR32Ig6EnXuDTkOw
 UI/ZxrFAb7O1Q+KDjIJb9QIvbC5QxSUKceb6ivrYxTIC0FamzqomOMCOUNCKtktD80qy1yT/gOj
 V5wh3CEDRHQPrHng053pCx92ve4I8jvbho9xuzhgmdJjP/AISLrw6yNPk5Kn2
X-Received: by 2002:a5d:448b:: with SMTP id j11mr1281885wrq.172.1644025437591; 
 Fri, 04 Feb 2022 17:43:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwyjJNORkxY9vSkK33YfIOkNNFvNd3xfbHlHSMTzw0NuVwK7NuXJb9DoKFB48n1kd7dwoOhgQ==
X-Received: by 2002:a5d:448b:: with SMTP id j11mr1281866wrq.172.1644025437343; 
 Fri, 04 Feb 2022 17:43:57 -0800 (PST)
Received: from redhat.com ([2a10:8005:331d:0:5c51:c095:613e:277c])
 by smtp.gmail.com with ESMTPSA id n13sm3078734wrv.94.2022.02.04.17.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 17:43:56 -0800 (PST)
Date: Fri, 4 Feb 2022 20:43:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/32] ACPI ERST: create ACPI ERST table for pc/x86 machines
Message-ID: <20220205014149.1189026-29-mst@redhat.com>
References: <20220205014149.1189026-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220205014149.1189026-1-mst@redhat.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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


