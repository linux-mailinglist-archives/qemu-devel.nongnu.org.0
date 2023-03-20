Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3D56C130D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:18:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFOe-0002z3-Dk; Mon, 20 Mar 2023 09:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1peDjF-0008OP-9X
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 07:31:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1peDjC-0007Iv-AL
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 07:31:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679311860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=tjYNd17dPEGgXMFTPsqJqqomUFE9X2KXeZ6Xvxjrguk=;
 b=WtoEtMP1mGGrd5CwbO9z416U3Bk638RxscbYuU8Xg3f0AnczOk3PTfBPLk5A3RFu/gtS2m
 ixWgbB0GKRMaTMfwABSS++dZAQ+tPOMmxin1gyK8/bICzUXRwIo5yVx5z6cn0IpzuDCwCB
 Z9Txcx3gQJSvOmsV08zh4ToDgGvwdEs=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-rbpVvE_UPrKR_mC1G33y1A-1; Mon, 20 Mar 2023 07:29:31 -0400
X-MC-Unique: rbpVvE_UPrKR_mC1G33y1A-1
Received: by mail-pj1-f72.google.com with SMTP id
 oj9-20020a17090b4d8900b0023f61bd2340so3277380pjb.7
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 04:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679311771;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tjYNd17dPEGgXMFTPsqJqqomUFE9X2KXeZ6Xvxjrguk=;
 b=7KnYvA4V7Zzzr586tq3PKLVozYaL4nS6GBQwkqGZq00euYrVRTvHODkeOBhCt9plIA
 v1wzkyaiFfAfc9WIF/tffA79NS0V7TEg5zcrS8dQds8q71EoE36oO2bgEwD72FMo06YH
 Ft3VBtqtF1cA+XbTG6TW13z5QDlzbo95vxnJhbeud0jY9FbGgFLBf4hrHtf2wr4O/UlG
 Hg10v1lCIQx6mkGuNx2RZvRwldrLxf5567mKEftytbmfc/DIrpwM134QGiXcYNLgIjtI
 jfKP2Fo1Ze7nfzChDf2rqF1dvHZFKx+/QY493zxiP1iWY/AcodBF4RQTk/YZ6MgYfGZF
 GAXQ==
X-Gm-Message-State: AO0yUKUQ5kPXaxwD2F90G8heZdnbWRsJ80I5wCWVaJED0uu9avrA3mti
 2JvEJVUgQZKTGf1LfmxvsyrFvL+bYOIyDMbJJhGjVDA9FG+k+8YLAAHGDYHy0snUrX5mEbyM6Ug
 a5hCmkw0r/TEFmDA=
X-Received: by 2002:a17:903:1c2:b0:1a1:d366:b085 with SMTP id
 e2-20020a17090301c200b001a1d366b085mr3364804plh.21.1679311770771; 
 Mon, 20 Mar 2023 04:29:30 -0700 (PDT)
X-Google-Smtp-Source: AK7set+RQUVAn28DOpPFaMcTXfX/o6xPFWTz8tDO6Rh8Or3ynovxmrxJNhHUtyek5sOMgwEd+5eCZQ==
X-Received: by 2002:a17:903:1c2:b0:1a1:d366:b085 with SMTP id
 e2-20020a17090301c200b001a1d366b085mr3364782plh.21.1679311770491; 
 Mon, 20 Mar 2023 04:29:30 -0700 (PDT)
Received: from localhost.localdomain ([203.163.233.223])
 by smtp.googlemail.com with ESMTPSA id
 j1-20020a17090276c100b0019e81c8fd01sm6302375plt.249.2023.03.20.04.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 04:29:30 -0700 (PDT)
From: Ani Sinha <anisinha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: jusual@redhat.com, Ani Sinha <anisinha@redhat.com>, qemu-devel@nongnu.org
Subject: [PATCH] hw/acpi: limit warning on acpi table size to pc machines
 older than version 2.3
Date: Mon, 20 Mar 2023 16:59:02 +0530
Message-Id: <20230320112902.90160-1-anisinha@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 20 Mar 2023 09:17:41 -0400
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

i440fx machine versions 2.3 and newer and q35 machines supports dynamic ram
resizing. Please see commit a1666142db6233 ("acpi-build: make ROMs RAM blocks resizeable") .
Hence the warning when the ACPI table size exceeds a pre-defined value does
not apply to those machines. Add a check limiting the warning message to only
those machines that does not support expandable ram blocks, that is, i440fx
machines with version 2.2 and older.

Signed-off-by: Ani Sinha <anisinha@redhat.com>
---
 hw/i386/acpi-build.c | 6 ++++--
 hw/i386/pc.c         | 1 +
 hw/i386/pc_piix.c    | 1 +
 include/hw/i386/pc.h | 3 +++
 4 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index b19fb4259e..2311bea082 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2616,7 +2616,8 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
         int legacy_table_size =
             ROUND_UP(tables_blob->len - aml_len + legacy_aml_len,
                      ACPI_BUILD_ALIGN_SIZE);
-        if (tables_blob->len > legacy_table_size) {
+        if ((tables_blob->len > legacy_table_size) &&
+            !pcmc->resizable_ram_block) {
             /* Should happen only with PCI bridges and -M pc-i440fx-2.0.  */
             warn_report("ACPI table size %u exceeds %d bytes,"
                         " migration may not work",
@@ -2627,7 +2628,8 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
         g_array_set_size(tables_blob, legacy_table_size);
     } else {
         /* Make sure we have a buffer in case we need to resize the tables. */
-        if (tables_blob->len > ACPI_BUILD_TABLE_SIZE / 2) {
+        if ((tables_blob->len > ACPI_BUILD_TABLE_SIZE / 2) &&
+            !pcmc->resizable_ram_block) {
             /* As of QEMU 2.1, this fires with 160 VCPUs and 255 memory slots.  */
             warn_report("ACPI table size %u exceeds %d bytes,"
                         " migration may not work",
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 7bebea57e3..822d5de333 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1936,6 +1936,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     pcmc->acpi_data_size = 0x20000 + 0x8000;
     pcmc->pvh_enabled = true;
     pcmc->kvmclock_create_always = true;
+    pcmc->resizable_ram_block = true;
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = pc_get_hotplug_handler;
     mc->hotplug_allowed = pc_hotplug_allowed;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 2f16011bab..3c74dfcfb4 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -745,6 +745,7 @@ static void pc_i440fx_2_2_machine_options(MachineClass *m)
     compat_props_add(m->compat_props, hw_compat_2_2, hw_compat_2_2_len);
     compat_props_add(m->compat_props, pc_compat_2_2, pc_compat_2_2_len);
     pcmc->rsdp_in_ram = false;
+    pcmc->resizable_ram_block = false;
 }
 
 DEFINE_I440FX_MACHINE(v2_2, "pc-i440fx-2.2", pc_compat_2_2_fn,
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 8206d5405a..3427a35f73 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -127,6 +127,9 @@ struct PCMachineClass {
 
     /* create kvmclock device even when KVM PV features are not exposed */
     bool kvmclock_create_always;
+
+    /* resizable memory block compat */
+    bool resizable_ram_block;
 };
 
 #define TYPE_PC_MACHINE "generic-pc-machine"
-- 
2.39.2


