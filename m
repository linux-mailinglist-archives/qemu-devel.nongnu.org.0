Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A47836EDD1F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:49:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDNh-0001D7-JV; Tue, 25 Apr 2023 03:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDNY-0000tl-RO
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:46:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDNJ-0006pt-GW
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:46:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682408769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=norJz+1M75We69bp+lSvK+ufLxrx4lDcxGwEvwpqxDw=;
 b=b3ypiRrfuzcUFCsAmjoBdrd4zQrmqj+GUECKdNdNxYBEvw3yyvbLAU/ZzskanCelvaQVe8
 MSlCdbhFN7HWBQLh1H6Am/MVJVkso2bDfAtubQqSlSvBf09PpPD3Ip0Wikac42AfBbc4h9
 7tk/5b+ywDNubTwCQyK+d0qSD1pezFc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-0uNaf45NMmayLrDfgm73Sw-1; Tue, 25 Apr 2023 03:46:00 -0400
X-MC-Unique: 0uNaf45NMmayLrDfgm73Sw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f16ef3be6eso32279955e9.3
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682408757; x=1685000757;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=norJz+1M75We69bp+lSvK+ufLxrx4lDcxGwEvwpqxDw=;
 b=HLJgGtJwA2RNL8Ji+Nr/DAyapA79GSpjooPKRSQWJmejLz92V9lnSJ9thl4yQ2rQWA
 hea4Yy7XE0MOYO8IfceWApF+i9c+yPpnROzbvVFlbOFldIIfxUCLXgPcEKs8od61pK7q
 iCvNwdf52A3H2k6Rq2BiBEwFsAW89LMh17X/wq0p/l3v7tCDDaIsHJrYBzcc9qtg25rk
 9HKnpFV6YdVMpXNjiO1SGJSxLpaozyQf1HS1hE9EMkV9Z+WHioh6hMyZKulUOVNVxwjG
 VbcOt1zM8E21QfhO8bCy+A4GMQUNXoUZkK0OSinLPVH9HUKQg7eDHGnAXjKrPN3ZsnCp
 8Xnw==
X-Gm-Message-State: AAQBX9c9VWVwMZqn4bsSglJYd8JcGRE25NJNZgzfVYyk/o/euftpjAiL
 YK5fF4BngALrZo86j8IditmtYod+lPFl0ENDdjEWzFISXdQrIsETnrgbCnoc7mDPD6CdpP3q+O3
 jxAI4/QaN9xGyN+lVTAGlcvwk3QxEcLWbaspw9tOK9ZxCOIctnIN3a2/VU1f0x3DzCVIn
X-Received: by 2002:adf:e651:0:b0:304:75b1:4dff with SMTP id
 b17-20020adfe651000000b0030475b14dffmr5349877wrn.48.1682408757551; 
 Tue, 25 Apr 2023 00:45:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zrbbdz2gOcDg7C3bxGugJKgNkcam+uuQoo+GuxAbwUae3atoz8NU69VASvoVUBx8282mCHRw==
X-Received: by 2002:adf:e651:0:b0:304:75b1:4dff with SMTP id
 b17-20020adfe651000000b0030475b14dffmr5349851wrn.48.1682408757222; 
 Tue, 25 Apr 2023 00:45:57 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 z18-20020adfd0d2000000b002fae7408544sm12332875wrh.108.2023.04.25.00.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:45:56 -0700 (PDT)
Date: Tue, 25 Apr 2023 03:45:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Ani Sinha <anisinha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 19/31] hw/acpi: limit warning on acpi table size to pc
 machines older than version 2.3
Message-ID: <1af507756bae775028c27d30e602e2b9c72cd074.1682408661.git.mst@redhat.com>
References: <cover.1682408661.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1682408661.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Ani Sinha <anisinha@redhat.com>

i440fx machine versions 2.3 and newer supports dynamic ram
resizing. See commit a1666142db6233 ("acpi-build: make ROMs RAM blocks resizeable") .
Currently supported all q35 machine types (versions 2.4 and newer) supports
resizable RAM/ROM blocks.Therefore the warning generated when the ACPI table
size exceeds a pre-defined value does not apply to those machine versions.
Add a check limiting the warning message to only those machines that does not
support expandable ram blocks (that is, i440fx machines with version 2.2
and older).

Signed-off-by: Ani Sinha <anisinha@redhat.com>
Message-Id: <20230329045726.14028-1-anisinha@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/i386/pc.h | 3 +++
 hw/i386/acpi-build.c | 6 ++++--
 hw/i386/pc.c         | 1 +
 hw/i386/pc_piix.c    | 1 +
 4 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index eb668e9034..84935fc958 100644
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
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 7f211e1f48..512162003b 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2697,7 +2697,8 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
         int legacy_table_size =
             ROUND_UP(tables_blob->len - aml_len + legacy_aml_len,
                      ACPI_BUILD_ALIGN_SIZE);
-        if (tables_blob->len > legacy_table_size) {
+        if ((tables_blob->len > legacy_table_size) &&
+            !pcmc->resizable_acpi_blob) {
             /* Should happen only with PCI bridges and -M pc-i440fx-2.0.  */
             warn_report("ACPI table size %u exceeds %d bytes,"
                         " migration may not work",
@@ -2708,7 +2709,8 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
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
index 615e1d3d06..d761c8c775 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1946,6 +1946,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     pcmc->acpi_data_size = 0x20000 + 0x8000;
     pcmc->pvh_enabled = true;
     pcmc->kvmclock_create_always = true;
+    pcmc->resizable_acpi_blob = true;
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = pc_get_hotplug_handler;
     mc->hotplug_allowed = pc_hotplug_allowed;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 21591dad8d..66a849d279 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -756,6 +756,7 @@ static void pc_i440fx_2_2_machine_options(MachineClass *m)
     compat_props_add(m->compat_props, hw_compat_2_2, hw_compat_2_2_len);
     compat_props_add(m->compat_props, pc_compat_2_2, pc_compat_2_2_len);
     pcmc->rsdp_in_ram = false;
+    pcmc->resizable_acpi_blob = false;
 }
 
 DEFINE_I440FX_MACHINE(v2_2, "pc-i440fx-2.2", pc_compat_2_2_fn,
-- 
MST


