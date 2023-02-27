Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9EB6A461D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 16:32:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWfTr-00033v-GO; Mon, 27 Feb 2023 10:31:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1pWfTi-00030n-VL
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 10:31:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1pWfTh-00013E-5N
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 10:31:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677511906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GVLZJlBSmoUM7cwNX3XWxz7mTnN3JZ31QrYsVuata0A=;
 b=eK2c21nONBYf+PxDj9m+s5Y4BXafNxKvdbqvyyo+soHFvk6if+sJcfUqnv9jdGuqkvs9dn
 LQTchHfeiBXPWQbqPevCjUugJtI/XIE8vW2dbZW15KI7dYJjQJ4X18hSw8eEU+KJ9IVMZy
 6qZ2un7Jm2gaXMISKJXeXT6rZ5MK9As=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-noc4Nna_PoasTss9608tVQ-1; Mon, 27 Feb 2023 10:31:44 -0500
X-MC-Unique: noc4Nna_PoasTss9608tVQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27FFD3823A08;
 Mon, 27 Feb 2023 15:31:42 +0000 (UTC)
Received: from speedmetal.redhat.com (unknown [10.45.242.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D98A2166B2B;
 Mon, 27 Feb 2023 15:31:40 +0000 (UTC)
From: Peter Krempa <pkrempa@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH] qapi: Add 'acpi' field to 'query-machines' output
Date: Mon, 27 Feb 2023 16:31:39 +0100
Message-Id: <c556e203447618f5e1020878b1781428b16ad97e.1677511289.git.pkrempa@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pkrempa@redhat.com;
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

Report which machine types support ACPI so that management applications
can properly use the 'acpi' property even on platforms such as ARM where
support for ACPI depends on the machine type and thus checking presence
of '-machine acpi=' in 'query-command-line-options' is insufficient.

Signed-off-by: Peter Krempa <pkrempa@redhat.com>
---

Libvirt intends to use this information to unbreak configs of ARM
machines with machine type which doesn't support ACPI. Historically
we'd use '-no-acpi' as the default was to enable ACPI. Conversion
to the modern equivalent '-machine acpi=' unfortunately didn't really
allow to fix the logic for this specific case whithout additional
information.

Libvirt patches are posted as:
https://listman.redhat.com/archives/libvir-list/2023-February/238153.html

 hw/core/machine-qmp-cmds.c | 1 +
 include/hw/boards.h        | 3 +++
 qapi/machine.json          | 4 +++-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 2d904747c0..b98ff15089 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -102,6 +102,7 @@ MachineInfoList *qmp_query_machines(Error **errp)
         info->hotpluggable_cpus = mc->has_hotpluggable_cpus;
         info->numa_mem_supported = mc->numa_mem_supported;
         info->deprecated = !!mc->deprecation_reason;
+        info->acpi = !!object_class_property_find(OBJECT_CLASS(mc), "acpi");
         if (mc->default_cpu_type) {
             info->default_cpu_type = g_strdup(mc->default_cpu_type);
         }
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 6fbbfd56c8..c18b444bef 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -174,6 +174,8 @@ typedef struct {
  *    index @idx in @ms->possible_cpus[]
  * @has_hotpluggable_cpus:
  *    If true, board supports CPUs creation with -device/device_add.
+ * @has_acpi:
+ *    Machine type has support for ACPI.
  * @default_cpu_type:
  *    specifies default CPU_TYPE, which will be used for parsing target
  *    specific features and for creating CPUs if CPU name wasn't provided
@@ -262,6 +264,7 @@ struct MachineClass {
     bool rom_file_has_mr;
     int minimum_page_bits;
     bool has_hotpluggable_cpus;
+    bool has_acpi;
     bool ignore_memory_transaction_failures;
     int numa_mem_align_shift;
     const char **valid_cpu_types;
diff --git a/qapi/machine.json b/qapi/machine.json
index b9228a5e46..f82a00963b 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -155,6 +155,8 @@
 #
 # @default-ram-id: the default ID of initial RAM memory backend (since 5.2)
 #
+# @acpi: machine type supports acpi (since 8.0)
+#
 # Since: 1.2
 ##
 { 'struct': 'MachineInfo',
@@ -162,7 +164,7 @@
             '*is-default': 'bool', 'cpu-max': 'int',
             'hotpluggable-cpus': 'bool',  'numa-mem-supported': 'bool',
             'deprecated': 'bool', '*default-cpu-type': 'str',
-            '*default-ram-id': 'str' } }
+            '*default-ram-id': 'str', 'acpi': 'bool' } }

 ##
 # @query-machines:
-- 
2.39.2


