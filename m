Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A2A1E1327
	for <lists+qemu-devel@lfdr.de>; Mon, 25 May 2020 19:06:30 +0200 (CEST)
Received: from localhost ([::1]:53574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdGYX-0007HU-VB
	for lists+qemu-devel@lfdr.de; Mon, 25 May 2020 13:06:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1jdGVz-0004xu-CE
 for qemu-devel@nongnu.org; Mon, 25 May 2020 13:03:51 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:58908
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1jdGVy-00053Y-Aj
 for qemu-devel@nongnu.org; Mon, 25 May 2020 13:03:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590426229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jwC/xJDsIIWsyZBaF+nKnOb0ZvqTUi4FcIIyaCX2MqM=;
 b=cJX/3KDatkn5TugDsOBoCBb1gaYzAiawQAhcBMJYvXD9cqU6xwnmvxjCHKUlsoh+GuC2ig
 zA4ZQ82b6kVoHGGFzMozX+OiTceIYOFh287HfwtpraCjeOfZ2FX7G3rUE8ztSuAervznlq
 MRixXy2c2SK2e2HdyxQXX7LbMCbYOtk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-avCxbHuFPwK69p7fkWjkYA-1; Mon, 25 May 2020 13:03:47 -0400
X-MC-Unique: avCxbHuFPwK69p7fkWjkYA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 027FB1855A0C;
 Mon, 25 May 2020 17:03:46 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.40.193.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92EE45C1C5;
 Mon, 25 May 2020 17:03:44 +0000 (UTC)
From: Michal Privoznik <mprivozn@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] qmp: Expose MachineClass::default_ram_id
Date: Mon, 25 May 2020 19:03:28 +0200
Message-Id: <2dbffbc4e2c0f3a0184daaadf56f94a85aedef58.1590426097.git.mprivozn@redhat.com>
In-Reply-To: <cover.1590426097.git.mprivozn@redhat.com>
References: <cover.1590426097.git.mprivozn@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/25 02:40:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: imammedo@redhat.com, ehabkost@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If a management application (like Libvirt) want's to preserve
migration ability and switch to '-machine memory-backend' it
needs to set exactly the same RAM id as QEMU would. Since the id
is machine type dependant, expose it under 'query-machines'
result.

Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
---
 hw/core/machine-qmp-cmds.c | 1 +
 qapi/machine.json          | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 2c5da8413d..8333e674ce 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -234,6 +234,7 @@ MachineInfoList *qmp_query_machines(Error **errp)
         info->hotpluggable_cpus = mc->has_hotpluggable_cpus;
         info->numa_mem_supported = mc->numa_mem_supported;
         info->deprecated = !!mc->deprecation_reason;
+        info->default_ram_id = g_strdup(mc->default_ram_id);
         if (mc->default_cpu_type) {
             info->default_cpu_type = g_strdup(mc->default_cpu_type);
             info->has_default_cpu_type = true;
diff --git a/qapi/machine.json b/qapi/machine.json
index 39caa1d914..e5647c4031 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -352,6 +352,8 @@
 #              in future versions of QEMU according to the QEMU deprecation
 #              policy (since 4.1.0)
 #
+# @default-ram-id: the default name of initial RAM memory region (since 5.1)
+#
 # @default-cpu-type: default CPU model typename if none is requested via
 #                    the -cpu argument. (since 4.2)
 #
@@ -361,7 +363,8 @@
   'data': { 'name': 'str', '*alias': 'str',
             '*is-default': 'bool', 'cpu-max': 'int',
             'hotpluggable-cpus': 'bool',  'numa-mem-supported': 'bool',
-            'deprecated': 'bool', '*default-cpu-type': 'str' } }
+            'deprecated': 'bool', 'default-ram-id': 'str',
+            '*default-cpu-type': 'str' } }
 
 ##
 # @query-machines:
-- 
2.26.2


