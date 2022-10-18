Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 182B46025AA
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 09:27:26 +0200 (CEST)
Received: from localhost ([::1]:36374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okh0Q-0000mT-R1
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 03:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okg6L-0005k1-Gd
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:29:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okg66-0001Ff-Sh
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:29:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666074535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J+82hJTCLfws/zGbH69DKhzOwlJu+Xk+1XNDmfUBw7A=;
 b=h1SfCHQTyqlnP3QwB5YJDXyy8HtOs82IQ3DVCTcsQv2EiD3SgapESsqlXpxbbpdchn+KAm
 4qz4rPctWHCR/rAcD/+ru+t0WUOnav5tE4zYn1Pd7w490Kf3jjoVdE31USXMyrt+uqcnx9
 AcCd2th0xa+dgxAaMuLU0KVNX/89ww8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-Tr4fXflkM_erW6IXjy1LrA-1; Tue, 18 Oct 2022 02:28:52 -0400
X-MC-Unique: Tr4fXflkM_erW6IXjy1LrA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E359D3C0D18B;
 Tue, 18 Oct 2022 06:28:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 81D754030C9;
 Tue, 18 Oct 2022 06:28:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 371E821E66FE; Tue, 18 Oct 2022 08:28:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 06/28] qapi acpi: Elide redundant has_FOO in generated C
Date: Tue, 18 Oct 2022 08:28:27 +0200
Message-Id: <20221018062849.3420573-7-armbru@redhat.com>
In-Reply-To: <20221018062849.3420573-1-armbru@redhat.com>
References: <20221018062849.3420573-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
2.37.2


