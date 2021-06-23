Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 829D03B172C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 11:46:52 +0200 (CEST)
Received: from localhost ([::1]:41086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvzT9-0007e0-Ht
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 05:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lvzRf-0005Ta-JO
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 05:45:19 -0400
Received: from mga02.intel.com ([134.134.136.20]:12499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lvzRb-0007B8-Jq
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 05:45:18 -0400
IronPort-SDR: ji3nA/gJVmeVakGdMPqVxCvfIjV0sirRZ6gR7L3pTT87OdNyqgmGemx4nc3mgZ6F3XMcYDhAtK
 ND20lbK5grkw==
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="194369580"
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="194369580"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 02:45:10 -0700
IronPort-SDR: yr7bwcbDZNxpF5CXMlns896xqyso9DLM0vO1w24EgFlanuvTgG/tpq5NR0cFwPE7a9Y5zH78wW
 Kv2lq/o+vRxQ==
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="487242871"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 02:45:08 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH V9 3/6] hmp-commands: Add new HMP command for filter
 passthrough
Date: Wed, 23 Jun 2021 17:37:54 +0800
Message-Id: <20210623093757.2683226-4-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210623093757.2683226-1-chen.zhang@intel.com>
References: <20210623093757.2683226-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20; envelope-from=chen.zhang@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Zhang Chen <chen.zhang@intel.com>, Lukas Straub <lukasstraub2@web.de>,
 Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add hmp_passthrough_filter_add and hmp_passthrough_filter_del make user
can maintain object network passthrough list in human monitor

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 hmp-commands.hx       | 26 +++++++++++++++
 include/monitor/hmp.h |  2 ++
 monitor/hmp-cmds.c    | 76 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 104 insertions(+)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 8e45bce2cd..426a7d6cda 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1292,6 +1292,32 @@ SRST
   Remove host network device.
 ERST
 
+    {
+        .name       = "passthrough_filter_add",
+        .args_type  = "protocol:s?,object-name:s,src:s?,dst:s?",
+        .params     = "[protocol] object-name [src] [dst]",
+        .help       = "Add network passthrough rule to object passthrough list",
+        .cmd        = hmp_passthrough_filter_add,
+    },
+
+SRST
+``passthrough_filter_add``
+  Add network stream to object passthrough list.
+ERST
+
+    {
+        .name       = "passthrough_filter_del",
+        .args_type  = "protocol:s?,object-name:s,src:s?,dst:s?",
+        .params     = "[protocol] object-name [src] [dst]",
+        .help       = "Delete network passthrough rule from object passthrough list",
+        .cmd        = hmp_passthrough_filter_del,
+    },
+
+SRST
+``passthrough_filter_del``
+  Delete network stream from object passthrough list.
+ERST
+
     {
         .name       = "object_add",
         .args_type  = "object:S",
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 3baa1058e2..ba6987e552 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -77,6 +77,8 @@ void hmp_device_del(Monitor *mon, const QDict *qdict);
 void hmp_dump_guest_memory(Monitor *mon, const QDict *qdict);
 void hmp_netdev_add(Monitor *mon, const QDict *qdict);
 void hmp_netdev_del(Monitor *mon, const QDict *qdict);
+void hmp_passthrough_filter_add(Monitor *mon, const QDict *qdict);
+void hmp_passthrough_filter_del(Monitor *mon, const QDict *qdict);
 void hmp_getfd(Monitor *mon, const QDict *qdict);
 void hmp_closefd(Monitor *mon, const QDict *qdict);
 void hmp_sendkey(Monitor *mon, const QDict *qdict);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 0942027208..26ff316c93 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1638,6 +1638,82 @@ void hmp_netdev_del(Monitor *mon, const QDict *qdict)
     hmp_handle_error(mon, err);
 }
 
+void hmp_passthrough_filter_add(Monitor *mon, const QDict *qdict)
+{
+    IPFlowSpec *spec = g_new0(IPFlowSpec, 1);
+    char *src, *dst;
+    Error *err = NULL;
+
+    spec->protocol = g_strdup(qdict_get_try_str(qdict, "protocol"));
+    spec->object_name = g_strdup(qdict_get_try_str(qdict, "object-name"));
+    src = g_strdup(qdict_get_try_str(qdict, "src"));
+    dst = g_strdup(qdict_get_try_str(qdict, "dst"));
+
+    if (src) {
+        spec->source = g_new0(InetSocketAddressBase, 1);
+
+        if (inet_parse_base(spec->source, src, NULL)) {
+            monitor_printf(mon, "Incorrect passthrough src address\n");
+            goto out;
+        }
+    }
+
+    if (dst) {
+        spec->destination = g_new0(InetSocketAddressBase, 1);
+
+        if (inet_parse_base(spec->destination, dst, NULL)) {
+            monitor_printf(mon, "Incorrect passthrough dst address\n");
+            goto out;
+        }
+    }
+
+    qmp_passthrough_filter_add(spec, &err);
+
+out:
+    g_free(src);
+    g_free(dst);
+
+    hmp_handle_error(mon, err);
+}
+
+void hmp_passthrough_filter_del(Monitor *mon, const QDict *qdict)
+{
+    IPFlowSpec *spec = g_new0(IPFlowSpec, 1);
+    char *src, *dst;
+    Error *err = NULL;
+
+    spec->protocol = g_strdup(qdict_get_try_str(qdict, "protocol"));
+    spec->object_name = g_strdup(qdict_get_try_str(qdict, "object-name"));
+    src = g_strdup(qdict_get_try_str(qdict, "src"));
+    dst = g_strdup(qdict_get_try_str(qdict, "dst"));
+
+    if (src) {
+        spec->source = g_new0(InetSocketAddressBase, 1);
+
+        if (inet_parse_base(spec->source, src, NULL)) {
+            monitor_printf(mon, "Incorrect passthrough src address\n");
+            goto out;
+        }
+    }
+
+    if (dst) {
+        spec->destination = g_new0(InetSocketAddressBase, 1);
+
+        if (inet_parse_base(spec->destination, dst, NULL)) {
+            monitor_printf(mon, "Incorrect passthrough dst address\n");
+            goto out;
+        }
+    }
+
+    qmp_passthrough_filter_del(spec, &err);
+
+out:
+    g_free(src);
+    g_free(dst);
+
+    hmp_handle_error(mon, err);
+}
+
 void hmp_object_add(Monitor *mon, const QDict *qdict)
 {
     const char *options = qdict_get_str(qdict, "object");
-- 
2.25.1


