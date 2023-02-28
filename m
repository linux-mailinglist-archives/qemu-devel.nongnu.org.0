Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE366A5432
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 09:13:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWv6O-00061z-6f; Tue, 28 Feb 2023 03:12:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1pWv6M-00061p-Eo
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 03:12:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1pWv6K-0004JV-AV
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 03:12:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677571963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4MBnMZQuYCXjq3qFanZyNxVcXAhkFNbWYAFPnTIIWY0=;
 b=XFM6NQ37C1GSu5QYSY5eKT2f6LAx6JFUAtCP/zGGyvp+TbrtS2MMSFnpKh4nSIkXqR+rT4
 EzYXM/u5rxMYHiWnGDnJXkc5eLzXpKpo8hca0M8HRFjaATCAYM4niAJ0bevOSCLJYzz8P2
 X15xlaEg8VyV600RvqOaYU96p2sGWFk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-tZAE5jkYPzqC-uLP3r0vog-1; Tue, 28 Feb 2023 03:12:37 -0500
X-MC-Unique: tZAE5jkYPzqC-uLP3r0vog-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 296D8101A55E;
 Tue, 28 Feb 2023 08:12:37 +0000 (UTC)
Received: from speedmetal.redhat.com (unknown [10.45.242.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92B7C492B12;
 Tue, 28 Feb 2023 08:12:35 +0000 (UTC)
From: Peter Krempa <pkrempa@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v2] qapi: Add 'acpi' field to 'query-machines' output
Date: Tue, 28 Feb 2023 09:12:34 +0100
Message-Id: <537625d3e25d345052322c42ca19812b98b4f49a.1677571792.git.pkrempa@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
Acked-by: Markus Armbruster <armbru@redhat.com>
---

Diff to v1:
 - Fix spelling of 'ACPI' in 'machine.json'
 - Removed addition of a field to 'struct MachineClass' which was not
    used in the final version

 hw/core/machine-qmp-cmds.c | 1 +
 qapi/machine.json          | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

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
diff --git a/qapi/machine.json b/qapi/machine.json
index b9228a5e46..604b686e59 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -155,6 +155,8 @@
 #
 # @default-ram-id: the default ID of initial RAM memory backend (since 5.2)
 #
+# @acpi: machine type supports ACPI (since 8.0)
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


