Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6224EA248
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 23:18:07 +0200 (CEST)
Received: from localhost ([::1]:45604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYwkY-0004Hq-R6
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 17:18:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.davydov@openvz.org>)
 id 1nYwiI-0001Vm-Cg
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 17:15:46 -0400
Received: from [2a00:1450:4864:20::22f] (port=39615
 helo=mail-lj1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.davydov@openvz.org>)
 id 1nYwiG-0003oj-Ro
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 17:15:46 -0400
Received: by mail-lj1-x22f.google.com with SMTP id bn33so20959894ljb.6
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 14:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ckh2kBLtdsCsb66fc7ENo7NnFXc/l4GnQNLcbYnl71k=;
 b=79zr+0t2aHHoWB6KVl7C/jM37Q2MpemE0152izS3V4UJKHRLdyAgGOtUlrhncC647E
 cfnTMwLHm4XEpArdy/mMRTkUvPFnM/0VSrRhJjWFxR4De+V+jyXjXRXmJgEbb1vgx0fw
 Z2fYVTnosc4EWjXAGpHZ+qdi80MU9nXEATsU+Ok2flz+c8Ra1JGviacvqzdjJ9Xh/y7T
 Anh0PWJDYU4THbNDeoGjzY3KDFBy8gzMZbzKqDEXiMTb5msWD8Ok7iNopNbtgZgVspZm
 mmZ2NVhdfXmYQmaQqJWTAAoNRTCkMSu/asFv7KPB7DxzHi0nSmPutMMUMES3U+14jAtb
 RRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ckh2kBLtdsCsb66fc7ENo7NnFXc/l4GnQNLcbYnl71k=;
 b=QQcvfmAuJLWEtEnC6BchEOdRbd3RdULu21RGTm6ZVqFAbZsW77ne2iUnGNHUvh8TGo
 WXABnBzd7u9zk8qCWzEokO51yuXI3Eo4HIgAc9nSJ/gV0WV+LH5onjItfz+h/+ceIAtP
 4uCaV/Fjtqq/UcmO1b6xevt9QnqZs6OcNxAmL5HtR8+Q/z+AiqZzLKeVFi+WGQx/arnC
 7SiGvOInrhATzmv7nXlPnvGEWSeNRMsanfY8CokgKsDuWXi6ES2ix5fDD6XvMLpr85Dr
 yl57YMWi+/lIz6EVmV3As633n8Q9qghDSLC5845pUjTnlCpg85QVQ5mlngVEab7hfP8h
 Hnsw==
X-Gm-Message-State: AOAM533KGdbBiNpCEuztNBOc0vOA8lOoJeEZSnQASIU3haCkhA7Gysx9
 QvtjXWy4PHlgQxRKcPHKRyDNkfGOZpjmOw==
X-Google-Smtp-Source: ABdhPJxx40+R4F1lakn34jWH1/g0lHBkhFeFox1nMocrFsRZG6LWZscIJY5FyB4dZdv+lH9vcXeM6g==
X-Received: by 2002:a2e:808d:0:b0:245:a501:241 with SMTP id
 i13-20020a2e808d000000b00245a5010241mr21817735ljg.479.1648502142929; 
 Mon, 28 Mar 2022 14:15:42 -0700 (PDT)
Received: from localhost.localdomain ([93.175.1.181])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a2e92cf000000b002493cc687f3sm1855827ljh.45.2022.03.28.14.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 14:15:42 -0700 (PDT)
From: Maxim Davydov <maxim.davydov@openvz.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/9] qmp: Add dump machine type compatible properties
Date: Tue, 29 Mar 2022 00:15:31 +0300
Message-Id: <20220328211539.90170-2-maxim.davydov@openvz.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220328211539.90170-1-maxim.davydov@openvz.org>
References: <20220328211539.90170-1-maxim.davydov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=maxim.davydov@openvz.org; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, v.sementsov-og@mail.ru, berrange@redhat.com,
 xiaoguangrong.eric@gmail.com, mst@redhat.com, jsnow@redhat.com,
 crosa@redhat.com, f4bug@amsat.org, chen.zhang@intel.com, armbru@redhat.com,
 wangyanan55@huawei.com, marcandre.lureau@redhat.com, imammedo@redhat.com,
 lizhijian@fujitsu.com, pbonzini@redhat.com, ani@anisinha.ca, den@openvz.org,
 maxim.davydov@openvz.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds the ability to get all the compat_props of the
corresponding supported machines for their comparison.

Example:
{ "execute" : "query-machines", "arguments" : { "is-full" : true } }

Signed-off-by: Maxim Davydov <maxim.davydov@openvz.org>
---
 hw/core/machine-qmp-cmds.c  | 25 +++++++++++++++-
 qapi/machine.json           | 58 +++++++++++++++++++++++++++++++++++--
 tests/qtest/fuzz/qos_fuzz.c |  2 +-
 3 files changed, 81 insertions(+), 4 deletions(-)

diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 4f4ab30f8c..8f3206ba8d 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -74,7 +74,8 @@ CpuInfoFastList *qmp_query_cpus_fast(Error **errp)
     return head;
 }
 
-MachineInfoList *qmp_query_machines(Error **errp)
+MachineInfoList *qmp_query_machines(bool has_is_full, bool is_full,
+                                    Error **errp)
 {
     GSList *el, *machines = object_class_get_list(TYPE_MACHINE, false);
     MachineInfoList *mach_list = NULL;
@@ -107,6 +108,28 @@ MachineInfoList *qmp_query_machines(Error **errp)
             info->default_ram_id = g_strdup(mc->default_ram_id);
             info->has_default_ram_id = true;
         }
+        if (has_is_full && is_full && mc->compat_props) {
+            int i;
+            info->compat_props = NULL;
+            info->has_compat_props = true;
+
+            for (i = 0; i < mc->compat_props->len; i++) {
+                GlobalProperty *mt_prop = g_ptr_array_index(mc->compat_props,
+                                                            i);
+                ObjectClass *klass = object_class_by_name(mt_prop->driver);
+                CompatProperty *prop;
+
+                prop = g_malloc0(sizeof(*prop));
+                if (klass && object_class_is_abstract(klass)) {
+                    prop->abstract = true;
+                }
+                prop->driver = g_strdup(mt_prop->driver);
+                prop->property = g_strdup(mt_prop->property);
+                prop->value = g_strdup(mt_prop->value);
+
+                QAPI_LIST_PREPEND(info->compat_props, prop);
+            }
+        }
 
         QAPI_LIST_PREPEND(mach_list, info);
     }
diff --git a/qapi/machine.json b/qapi/machine.json
index 42fc68403d..16e961477c 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -130,6 +130,28 @@
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
+# @abstract: Bool value that shows that property is belonged to abstract class
+#
+# @property: global property name
+#
+# @value: global property value
+#
+# Since: 7.0
+##
+{ 'struct': 'CompatProperty',
+  'data': { 'driver': 'str',
+            'abstract': 'bool',
+            'property': 'str',
+            'value': 'str' } }
+
 ##
 # @MachineInfo:
 #
@@ -158,6 +180,9 @@
 #
 # @default-ram-id: the default ID of initial RAM memory backend (since 5.2)
 #
+# @compat-props: List of compatible properties that defines machine type
+#                (since 7.0)
+#
 # Since: 1.2
 ##
 { 'struct': 'MachineInfo',
@@ -165,18 +190,47 @@
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
+# @is-full: if true return will contain information about machine type 
+#           compatible properties (since 7.0)
+#
 # Returns: a list of MachineInfo
 #
 # Since: 1.2
+#
+# Example:
+#
+# -> { "execute" : "query-machines", "arguments" : { "is-full" : true } }
+# <- { "return": [
+#          {
+#              "hotpluggable-cpus": true,
+#              "name": "pc-q35-6.2",
+#              "compat-props": [
+#                  {
+#                      "abstract": false,
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
+  'data': { '*is-full': 'bool' },
+  'returns': ['MachineInfo'] }
 
 ##
 # @CurrentMachineParams:
diff --git a/tests/qtest/fuzz/qos_fuzz.c b/tests/qtest/fuzz/qos_fuzz.c
index 7a244c951e..3f9c1ede6e 100644
--- a/tests/qtest/fuzz/qos_fuzz.c
+++ b/tests/qtest/fuzz/qos_fuzz.c
@@ -47,7 +47,7 @@ static void qos_set_machines_devices_available(void)
     MachineInfoList *mach_info;
     ObjectTypeInfoList *type_info;
 
-    mach_info = qmp_query_machines(&error_abort);
+    mach_info = qmp_query_machines(false, false, &error_abort);
     machines_apply_to_node(mach_info);
     qapi_free_MachineInfoList(mach_info);
 
-- 
2.31.1


