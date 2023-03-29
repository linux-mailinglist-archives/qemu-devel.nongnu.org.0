Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5106CD15B
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 06:59:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phNsr-0003Yv-HZ; Wed, 29 Mar 2023 00:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1phNsn-0003X9-Fk
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 00:58:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1phNsl-0006hi-L2
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 00:58:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680065878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=250rQThkMG5/radoCZVLzil7kbHVxGXomGsz3U4YPfs=;
 b=KcRDA6DLgp5BvfeCIHBgj3z3Zi0H1ttiXEkhcwhnRQEJ9MTb69bXO+MZghllIKnTfZbCh6
 ydHv3alZ205m2QgIrOfPu/EQGXIlu51p7cTjKmLcK3p3Lc2m8atJQtqMHrtq41omq+at+F
 E29Rc387T6m7QF+apg/Cdl8UDHn6RtM=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-ADpcMM8mPNiI7bLbFSQE-A-1; Wed, 29 Mar 2023 00:57:56 -0400
X-MC-Unique: ADpcMM8mPNiI7bLbFSQE-A-1
Received: by mail-pl1-f200.google.com with SMTP id
 e5-20020a17090301c500b001a1aa687e4bso8827295plh.17
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 21:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680065874;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=250rQThkMG5/radoCZVLzil7kbHVxGXomGsz3U4YPfs=;
 b=l/AqRRO/at2whzi/MrrCTUiiMcKa5flNt0J4GUcHnY2ywZl2Qhf3s2IADAfppawPym
 +SbnXA7dSy7nUKHeqVRi5rhWold8wNimxxkX9gPrHA9yHBvaGbF+zVje7/QABLh2XekM
 +0+WGRKq+MCdY/L5qcfLwY5iTuoP5lqfBOMSyyS4ztrKvqAG1E6Jd5b4/+YSVf8V04GO
 9KTPfx680wNnNFyNoAT1Ya17sZU3xh+QYoCkZAvKGwm6+QWiQjVUVG7XZTPfU1gD8uhf
 nRkN6sgrzWR9ed2UrLzvFocy25CwZZdIxQRfRSP8kZTxpmJd74mxEZLNyduY08l2mS+l
 ZQKw==
X-Gm-Message-State: AAQBX9cE3wjUNh7m/N1CNR+Z2EyokMLyPoZvrmRrSVVmahYk2ECeTFLy
 gyJQLSnJZ0mE+MkF5ajbDY5qLdFNCi4FSBxfoZiYL5I6sZll7nOO4mdSwDnMXI9JSdaBzRewO5Y
 znSy2SeAnEaXJI7w=
X-Received: by 2002:a17:90b:1a92:b0:23a:8f25:7fd6 with SMTP id
 ng18-20020a17090b1a9200b0023a8f257fd6mr21049857pjb.29.1680065874616; 
 Tue, 28 Mar 2023 21:57:54 -0700 (PDT)
X-Google-Smtp-Source: AKy350aPVnTFsetG383CIsw3rubhlmR9ceWpdCn06JLKL3eCt1Mn6XckHWroRGHF4MpJVFKsRo8PQg==
X-Received: by 2002:a17:90b:1a92:b0:23a:8f25:7fd6 with SMTP id
 ng18-20020a17090b1a9200b0023a8f257fd6mr21049835pjb.29.1680065874347; 
 Tue, 28 Mar 2023 21:57:54 -0700 (PDT)
Received: from fc37-ani.redhat.com ([115.96.144.241])
 by smtp.googlemail.com with ESMTPSA id
 in15-20020a17090b438f00b0020b21019086sm3739853pjb.3.2023.03.28.21.57.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 21:57:53 -0700 (PDT)
From: Ani Sinha <anisinha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/acpi: limit warning on acpi table size to pc machines
 older than version 2.3
Date: Wed, 29 Mar 2023 10:27:26 +0530
Message-Id: <20230329045726.14028-1-anisinha@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

i440fx machine versions 2.3 and newer supports dynamic ram
resizing. See commit a1666142db6233 ("acpi-build: make ROMs RAM blocks resizeable") .
Currently supported all q35 machine types (versions 2.4 and newer) supports
resizable RAM/ROM blocks.Therefore the warning generated when the ACPI table
size exceeds a pre-defined value does not apply to those machine versions.
Add a check limiting the warning message to only those machines that does not
support expandable ram blocks (that is, i440fx machines with version 2.2
and older).

Signed-off-by: Ani Sinha <anisinha@redhat.com>
---
 hw/i386/acpi-build.c | 6 ++++--
 hw/i386/pc.c         | 1 +
 hw/i386/pc_piix.c    | 1 +
 include/hw/i386/pc.h | 3 +++
 4 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index b19fb4259e..91be76e61f 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2616,7 +2616,8 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
         int legacy_table_size =
             ROUND_UP(tables_blob->len - aml_len + legacy_aml_len,
                      ACPI_BUILD_ALIGN_SIZE);
-        if (tables_blob->len > legacy_table_size) {
+        if ((tables_blob->len > legacy_table_size) &&
+            !pcmc->resizable_acpi_blob) {
             /* Should happen only with PCI bridges and -M pc-i440fx-2.0.  */
             warn_report("ACPI table size %u exceeds %d bytes,"
                         " migration may not work",
@@ -2627,7 +2628,8 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
         g_array_set_size(tables_blob, legacy_table_size);
     } else {
         /* Make sure we have a buffer in case we need to resize the tables. */
-        if (tables_blob->len > ACPI_BUILD_TABLE_SIZE / 2) {
+        if ((tables_blob->len > ACPI_BUILD_TABLE_SIZE / 2) &&
+            !pcmc->resizable_acpi_blob) {
             /* As of QEMU 2.1, this fires with 160 VCPUs and 255 memory slots.  */
             warn_report("ACPI table size %u exceeds %d bytes,"
                         " migration may not work",
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 7bebea57e3..2b66985013 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1936,6 +1936,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     pcmc->acpi_data_size = 0x20000 + 0x8000;
     pcmc->pvh_enabled = true;
     pcmc->kvmclock_create_always = true;
+    pcmc->resizable_acpi_blob = true;
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = pc_get_hotplug_handler;
     mc->hotplug_allowed = pc_hotplug_allowed;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 2f16011bab..8f7b3ae11b 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -745,6 +745,7 @@ static void pc_i440fx_2_2_machine_options(MachineClass *m)
     compat_props_add(m->compat_props, hw_compat_2_2, hw_compat_2_2_len);
     compat_props_add(m->compat_props, pc_compat_2_2, pc_compat_2_2_len);
     pcmc->rsdp_in_ram = false;
+    pcmc->resizable_acpi_blob = false;
 }
 
 DEFINE_I440FX_MACHINE(v2_2, "pc-i440fx-2.2", pc_compat_2_2_fn,
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 8206d5405a..6008eb045a 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -127,6 +127,9 @@ struct PCMachineClass {
 
     /* create kvmclock device even when KVM PV features are not exposed */
     bool kvmclock_create_always;
+
+    /* resizable acpi blob compat */
+    bool resizable_acpi_blob;
 };
 
 #define TYPE_PC_MACHINE "generic-pc-machine"
-- 
2.39.2


