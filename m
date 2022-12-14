Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BB664C47E
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 08:50:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5MUc-0003Zt-Th; Wed, 14 Dec 2022 02:47:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5MUK-0003Qw-5Y
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 02:47:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5MUG-0003e4-DK
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 02:47:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671004051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ElgcK3E91wbS/roT6x9L3CIhVublUDQIdbTCO2BGDT8=;
 b=ELFSqtheTkVTlyTGfDbRreheQefEEqe/9uGpagMEh84y/KeLwWXQpBKCaSDk1OlOZ9Ljym
 c3DYsGTAKkUxBwFiGrlTn6bx6f3fH4XnZRanIPP3n/ySk1iJwVlF3ivKXFzG/WxhA8kdT+
 6x2R2LpglbLyt1cSe6kwNFVtJJwDw7g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-vTOOLx4dNie55XnsMhWfOw-1; Wed, 14 Dec 2022 02:47:28 -0500
X-MC-Unique: vTOOLx4dNie55XnsMhWfOw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B8C685CCE9;
 Wed, 14 Dec 2022 07:47:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0827214171BE;
 Wed, 14 Dec 2022 07:47:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5E69521E6493; Wed, 14 Dec 2022 08:47:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 06/30] qapi acpi: Elide redundant has_FOO in generated C
Date: Wed, 14 Dec 2022 08:46:57 +0100
Message-Id: <20221214074721.731441-9-armbru@redhat.com>
In-Reply-To: <20221214074721.731441-1-armbru@redhat.com>
References: <20221214074721.731441-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

The has_FOO for pointer-valued FOO are redundant, except for arrays.
They are also a nuisance to work with.  Recent commit "qapi: Start to
elide redundant has_FOO in generated C" provided the means to elide
them step by step.  This is the step for qapi/acpi.py.

Said commit explains the transformation in more detail.  The invariant
violations mentioned there do not occur here.

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20221104160712.3005652-7-armbru@redhat.com>
---
 hw/acpi/core.c           | 14 +++++++-------
 hw/acpi/cpu.c            |  1 -
 hw/acpi/memory_hotplug.c |  1 -
 scripts/qapi/schema.py   |  1 -
 4 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/hw/acpi/core.c b/hw/acpi/core.c
index 3e811bf03c..6da275c599 100644
--- a/hw/acpi/core.c
+++ b/hw/acpi/core.c
@@ -185,7 +185,7 @@ static void acpi_table_install(const char unsigned *blob, size_t bloblen,
     changed_fields = 0;
     ext_hdr->_length = cpu_to_le16(acpi_payload_size);
 
-    if (hdrs->has_sig) {
+    if (hdrs->sig) {
         strncpy(ext_hdr->sig, hdrs->sig, sizeof ext_hdr->sig);
         ++changed_fields;
     }
@@ -204,11 +204,11 @@ static void acpi_table_install(const char unsigned *blob, size_t bloblen,
 
     ext_hdr->checksum = 0;
 
-    if (hdrs->has_oem_id) {
+    if (hdrs->oem_id) {
         strncpy(ext_hdr->oem_id, hdrs->oem_id, sizeof ext_hdr->oem_id);
         ++changed_fields;
     }
-    if (hdrs->has_oem_table_id) {
+    if (hdrs->oem_table_id) {
         strncpy(ext_hdr->oem_table_id, hdrs->oem_table_id,
                 sizeof ext_hdr->oem_table_id);
         ++changed_fields;
@@ -217,7 +217,7 @@ static void acpi_table_install(const char unsigned *blob, size_t bloblen,
         ext_hdr->oem_revision = cpu_to_le32(hdrs->oem_rev);
         ++changed_fields;
     }
-    if (hdrs->has_asl_compiler_id) {
+    if (hdrs->asl_compiler_id) {
         strncpy(ext_hdr->asl_compiler_id, hdrs->asl_compiler_id,
                 sizeof ext_hdr->asl_compiler_id);
         ++changed_fields;
@@ -255,12 +255,12 @@ void acpi_table_add(const QemuOpts *opts, Error **errp)
     if (!hdrs) {
         goto out;
     }
-    if (hdrs->has_file == hdrs->has_data) {
+    if (!hdrs->file == !hdrs->data) {
         error_setg(errp, "'-acpitable' requires one of 'data' or 'file'");
         goto out;
     }
 
-    pathnames = g_strsplit(hdrs->has_file ? hdrs->file : hdrs->data, ":", 0);
+    pathnames = g_strsplit(hdrs->file ?: hdrs->data, ":", 0);
     if (pathnames == NULL || pathnames[0] == NULL) {
         error_setg(errp, "'-acpitable' requires at least one pathname");
         goto out;
@@ -297,7 +297,7 @@ void acpi_table_add(const QemuOpts *opts, Error **errp)
         close(fd);
     }
 
-    acpi_table_install(blob, bloblen, hdrs->has_file, hdrs, errp);
+    acpi_table_install(blob, bloblen, !!hdrs->file, hdrs, errp);
 
 out:
     g_free(blob);
diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 3646dbfe68..4e580959a2 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -35,7 +35,6 @@ static ACPIOSTInfo *acpi_cpu_device_status(int idx, AcpiCpuStatus *cdev)
         DeviceState *dev = DEVICE(cdev->cpu);
         if (dev->id) {
             info->device = g_strdup(dev->id);
-            info->has_device = true;
         }
     }
     return info;
diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index 0a7e89a13e..a7476330a8 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -44,7 +44,6 @@ static ACPIOSTInfo *acpi_memory_device_status(int slot, MemStatus *mdev)
         DeviceState *dev = DEVICE(mdev->dimm);
         if (dev->id) {
             info->device = g_strdup(dev->id);
-            info->has_device = true;
         }
     }
     return info;
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index ae09c38103..ad7634de58 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -759,7 +759,6 @@ def need_has(self):
         assert self.type
         # Temporary hack to support dropping the has_FOO in reviewable chunks
         opt_out = [
-            'qapi/acpi.json',
             'qapi/audio.json',
             'qapi/block-core.json',
             'qapi/block-export.json',
-- 
2.37.3


