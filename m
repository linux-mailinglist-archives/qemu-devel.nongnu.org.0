Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 875794BD0F6
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Feb 2022 20:31:40 +0100 (CET)
Received: from localhost ([::1]:56370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLrvn-0003UL-ER
	for lists+qemu-devel@lfdr.de; Sun, 20 Feb 2022 14:31:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nLrrr-0000eK-C7
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 14:27:35 -0500
Received: from [2a00:1450:4864:20::32d] (port=47031
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nLrrp-0006Ke-U1
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 14:27:35 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so829853wmp.5
 for <qemu-devel@nongnu.org>; Sun, 20 Feb 2022 11:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y/McU+O8wGOej6ngpTyjfRmYL1is5tFLApI7iXTkHog=;
 b=h36G+525Y10Vr7oHnYlbxRt17NFiyZbjRM3R5GImjy5GkqlRbpkF3DWxe3KT493UTY
 8/X5c5Io2xRVRhc0jAoZ6W/YUVWIUCF2Ugkv5PzL4tXD9QdjGv6BwEfacMKqFRTRzcCZ
 BziXtHnimSfxPYN47RApZohINXmYbtJztlgyYJv01qNBS2K1nHurdQ1/ZMI2O8AUTBu4
 oGnRev04z+lg4hAQmTVZlphroDZX8GIN8LtYCNKLSIy6tVRfdbSuFBBLilxggnPUwP1Y
 E/JKsrHSaD5alNNrcbLhqJK23VsYOQX4l8f6yNd9lumPHTexUHx9xap3ZFubrksmJnbR
 Ljpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y/McU+O8wGOej6ngpTyjfRmYL1is5tFLApI7iXTkHog=;
 b=PtUUySzGXM6ezMceBIYR3dl7m+mIDONdl0ZYtJcQXGXdNzwSM12Uul+PnKmQTgBFvx
 v3uW3lLVqOedv8Nmfm0GMD7Si9KC+XM5PbaNlut+FLnVfEiZXobAwHuE5f4aHrjbJgU3
 qejrN3QzkO2ZEdO8LRrvrAGGjgw25+vZD+5GBMdqWYbgpZEe3ESbCA79WWKlW2WLfW32
 88A6DWC0xdZrnqWAubY5RHOk9QUnES0y2WLMTaQEYeFPS9mwEp1NNiW/IWbqP3UkTy0j
 2l+I41ZkhR3LhKuFAZ7ivYu2rqddN2uXYvvYt4qfCjWDAujKI+tQ7MF/8NJX6007dXdF
 2sZA==
X-Gm-Message-State: AOAM533VQnlPMPOh3+tQvVJK/oGDonoVn3PhmlS1d2gmjLw2UmBG03Np
 VNqhJD25L5gnw+/AOWpLk+o81pIbBDinAQ==
X-Google-Smtp-Source: ABdhPJxIK4tXxr6+WldfeHG7LUwK4wiuxFkMxcqRMr/K/zf+04iRbRrWAI3LKG0CeNgEQVcH56XutA==
X-Received: by 2002:a05:600c:4ed1:b0:37b:bb72:9ecd with SMTP id
 g17-20020a05600c4ed100b0037bbb729ecdmr14843916wmq.177.1645385252382; 
 Sun, 20 Feb 2022 11:27:32 -0800 (PST)
Received: from liavpc.localdomain ([2a10:800a:bb8:1:6510:42ac:bb55:9590])
 by smtp.gmail.com with ESMTPSA id c14sm9975786wru.37.2022.02.20.11.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 11:27:31 -0800 (PST)
From: Liav Albani <liavalb@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/acpi: add indication for i8042 in IA-PC boot flags of
 the FADT table
Date: Sun, 20 Feb 2022 21:25:49 +0200
Message-Id: <20220220192549.591703-3-liavalb@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220220192549.591703-1-liavalb@gmail.com>
References: <20220220192549.591703-1-liavalb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=liavalb@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: ani@anisinha.ca, imammedo@redhat.com, Liav Albani <liavalb@gmail.com>,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This can allow the guest OS to determine more easily if i8042 controller
is present in the system or not, so it doesn't need to do probing of the
controller, but just initialize it immediately, before enumerating the
ACPI AML namespace.

Signed-off-by: Liav Albani <liavalb@gmail.com>
---
 hw/acpi/aml-build.c         | 7 ++++++-
 hw/i386/acpi-build.c        | 5 +++++
 hw/i386/acpi-microvm.c      | 5 +++++
 include/hw/acpi/acpi-defs.h | 1 +
 4 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 8966e16320..ef5f4cad87 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -2152,7 +2152,12 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
     build_append_int_noprefix(tbl, 0, 1); /* DAY_ALRM */
     build_append_int_noprefix(tbl, 0, 1); /* MON_ALRM */
     build_append_int_noprefix(tbl, f->rtc_century, 1); /* CENTURY */
-    build_append_int_noprefix(tbl, 0, 2); /* IAPC_BOOT_ARCH */
+    /* IAPC_BOOT_ARCH */
+    if (f->rev == 1) {
+        build_append_int_noprefix(tbl, 0, 2);
+    } else {
+        build_append_int_noprefix(tbl, f->iapc_boot_arch, 2);
+    }
     build_append_int_noprefix(tbl, 0, 1); /* Reserved */
     build_append_int_noprefix(tbl, f->flags, 4); /* Flags */
 
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index ebd47aa26f..5dc625b8d8 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -192,6 +192,11 @@ static void init_common_fadt_data(MachineState *ms, Object *o,
             .address = object_property_get_uint(o, ACPI_PM_PROP_GPE0_BLK, NULL)
         },
     };
+    if (isa_check_device_existence("i8042")) {
+        /* Indicates if i8042 is present or not */
+        fadt.iapc_boot_arch = (1 << 1);
+    }
+        
     *data = fadt;
 }
 
diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index 68ca7e7fc2..756c69b3b0 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -189,6 +189,11 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
         .reset_val = ACPI_GED_RESET_VALUE,
     };
 
+    if (isa_check_device_existence("i8042")) {
+        /* Indicates if i8042 is present or not */
+        pmfadt.iapc_boot_arch = (1 << 1);
+    }
+
     table_offsets = g_array_new(false, true /* clear */,
                                         sizeof(uint32_t));
     bios_linker_loader_alloc(tables->linker,
diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index c97e8633ad..2b42e4192b 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -77,6 +77,7 @@ typedef struct AcpiFadtData {
     uint16_t plvl2_lat;        /* P_LVL2_LAT */
     uint16_t plvl3_lat;        /* P_LVL3_LAT */
     uint16_t arm_boot_arch;    /* ARM_BOOT_ARCH */
+    uint16_t iapc_boot_arch;   /* IAPC_BOOT_ARCH */
     uint8_t minor_ver;         /* FADT Minor Version */
 
     /*
-- 
2.35.1


