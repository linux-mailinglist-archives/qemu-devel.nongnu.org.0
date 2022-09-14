Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A97A65B870C
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 13:12:25 +0200 (CEST)
Received: from localhost ([::1]:47292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYQJb-0007eV-VI
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 07:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <davydov-max@yandex-team.ru>)
 id 1oYQ3x-0004Tn-R7
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 06:56:13 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:45868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <davydov-max@yandex-team.ru>)
 id 1oYQ3v-0005W5-PK
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 06:56:13 -0400
Received: from vla5-b2806cb321eb.qloud-c.yandex.net
 (vla5-b2806cb321eb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:3e0d:0:640:b280:6cb3])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 69C582E0D5D;
 Wed, 14 Sep 2022 13:55:59 +0300 (MSK)
Received: from davydov-max-nux.yandex.net (unknown
 [2a02:6b8:0:107:fa75:a4ff:fe7d:8480])
 by vla5-b2806cb321eb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 BUZ4sh4mWm-twOqfr8i; Wed, 14 Sep 2022 13:55:58 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1663152958; bh=oFprw3uUFoLytr9Lv+ETp67t74TaC5z5c04J7UUz0yM=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=vAoi++6qjKJ8Zp3i1EC+t4CNl/KgcXtw2wemTa821KxR20k0LzT9bvnmiEKEh2J2u
 xQcqdKuXKaSAlnUwRVkY4uxQI8akLQwG8cmcb292mr1WHdXgxBCqRu/s5qrga3l8vl
 DgaT2Z5SUnGPXhtto/fYqC0GY12Mnh1ueDS7/MVA=
Authentication-Results: vla5-b2806cb321eb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Maksim Davydov <davydov-max@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: davydov-max@yandex-team.ru, yc-core@yandex-team.ru, pbonzini@redhat.com,
 berrange@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, armbru@redhat.com, alxndr@bu.edu,
 bsd@redhat.com, stefanha@redhat.com, thuth@redhat.com,
 darren.kenny@oracle.com, Qiuhao.Li@outlook.com, lvivier@redhat.com,
 jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Subject: [PATCH v2 3/4] qmp: add dump machine type compatible properties
Date: Wed, 14 Sep 2022 13:55:38 +0300
Message-Id: <20220914105539.18461-4-davydov-max@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220914105539.18461-1-davydov-max@yandex-team.ru>
References: <20220914105539.18461-1-davydov-max@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=davydov-max@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

To control that creating new machine type doesn't affect the previous
types (their compat_props) and to check complex compat_props inheritance
we need qmp command to print machine type compatible properties.
This patch adds the ability to get list of all the compat_props of the
corresponding supported machines for their comparison via new optional
argument of "query-machines" command.

Signed-off-by: Maksim Davydov <davydov-max@yandex-team.ru>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 hw/core/machine-qmp-cmds.c  | 22 ++++++++++++++-
 qapi/machine.json           | 54 +++++++++++++++++++++++++++++++++++--
 tests/qtest/fuzz/qos_fuzz.c |  2 +-
 3 files changed, 74 insertions(+), 4 deletions(-)

diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 4f4ab30f8c..a6fc387439 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -74,7 +74,8 @@ CpuInfoFastList *qmp_query_cpus_fast(Error **errp)
     return head;
 }
 
-MachineInfoList *qmp_query_machines(Error **errp)
+MachineInfoList *qmp_query_machines(bool has_compat_props, bool compat_props,
+                                    Error **errp)
 {
     GSList *el, *machines = object_class_get_list(TYPE_MACHINE, false);
     MachineInfoList *mach_list = NULL;
@@ -107,6 +108,25 @@ MachineInfoList *qmp_query_machines(Error **errp)
             info->default_ram_id = g_strdup(mc->default_ram_id);
             info->has_default_ram_id = true;
         }
+        if (compat_props && mc->compat_props) {
+            int i;
+            info->compat_props = NULL;
+            CompatPropertyList **tail = &(info->compat_props);
+            info->has_compat_props = true;
+
+            for (i = 0; i < mc->compat_props->len; i++) {
+                GlobalProperty *mt_prop = g_ptr_array_index(mc->compat_props,
+                                                            i);
+                CompatProperty *prop;
+
+                prop = g_malloc0(sizeof(*prop));
+                prop->driver = g_strdup(mt_prop->driver);
+                prop->property = g_strdup(mt_prop->property);
+                prop->value = g_strdup(mt_prop->value);
+
+                QAPI_LIST_APPEND(tail, prop);
+            }
+        }
 
         QAPI_LIST_PREPEND(mach_list, info);
     }
diff --git a/qapi/machine.json b/qapi/machine.json
index 6afd1936b0..b5477224a8 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -127,6 +127,25 @@
 ##
 { 'command': 'query-cpus-fast', 'returns': [ 'CpuInfoFast' ] }
 
+##
+# @CompatProperty:
+#
+# Machine type compatible property. It's based on GlobalProperty and created
+# for machine type compat properties (see scripts)
+#
+# @driver: name of the driver that has GlobalProperty
+#
+# @property: global property name
+#
+# @value: global property value
+#
+# Since: 7.2
+##
+{ 'struct': 'CompatProperty',
+  'data': { 'driver': 'str',
+            'property': 'str',
+            'value': 'str' } }
+
 ##
 # @MachineInfo:
 #
@@ -155,6 +174,9 @@
 #
 # @default-ram-id: the default ID of initial RAM memory backend (since 5.2)
 #
+# @compat-props: List of compatible properties that defines machine type
+#                (since 7.2)
+#
 # Since: 1.2
 ##
 { 'struct': 'MachineInfo',
@@ -162,18 +184,46 @@
             '*is-default': 'bool', 'cpu-max': 'int',
             'hotpluggable-cpus': 'bool',  'numa-mem-supported': 'bool',
             'deprecated': 'bool', '*default-cpu-type': 'str',
-            '*default-ram-id': 'str' } }
+            '*default-ram-id': 'str', '*compat-props': ['CompatProperty'] } }
 
 ##
 # @query-machines:
 #
 # Return a list of supported machines
 #
+# @compat-props: if true return will contain information about machine type
+#                compatible properties (since 7.2)
+#
 # Returns: a list of MachineInfo
 #
 # Since: 1.2
+#
+# Example:
+#
+# -> { "execute": "query-machines", "arguments": { "compat-props": true } }
+# <- { "return": [
+#          {
+#              "hotpluggable-cpus": true,
+#              "name": "pc-q35-6.2",
+#              "compat-props": [
+#                  {
+#                      "driver": "virtio-mem",
+#                      "property": "unplugged-inaccessible",
+#                      "value": "off"
+#                   }
+#               ],
+#               "numa-mem-supported": false,
+#               "default-cpu-type": "qemu64-x86_64-cpu",
+#               "cpu-max": 288,
+#               "deprecated": false,
+#               "default-ram-id": "pc.ram"
+#           },
+#           ...
+#    }
 ##
-{ 'command': 'query-machines', 'returns': ['MachineInfo'] }
+{ 'command': 'query-machines',
+  'data': { '*compat-props': 'bool' },
+  'returns': ['MachineInfo'] }
 
 ##
 # @CurrentMachineParams:
diff --git a/tests/qtest/fuzz/qos_fuzz.c b/tests/qtest/fuzz/qos_fuzz.c
index c856d3d500..f0c9ed4c4b 100644
--- a/tests/qtest/fuzz/qos_fuzz.c
+++ b/tests/qtest/fuzz/qos_fuzz.c
@@ -46,7 +46,7 @@ static void qos_set_machines_devices_available(void)
     MachineInfoList *mach_info;
     ObjectTypeInfoList *type_info;
 
-    mach_info = qmp_query_machines(&error_abort);
+    mach_info = qmp_query_machines(false, false, &error_abort);
     machines_apply_to_node(mach_info);
     qapi_free_MachineInfoList(mach_info);
 
-- 
2.25.1


