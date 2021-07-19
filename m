Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9123CD037
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 11:12:12 +0200 (CEST)
Received: from localhost ([::1]:57406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5PJr-0000mL-8a
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 05:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1m5PGe-0001b4-U3
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 05:08:52 -0400
Received: from mga05.intel.com ([192.55.52.43]:20937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1m5PGc-0004MG-3S
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 05:08:51 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10049"; a="296581732"
X-IronPort-AV: E=Sophos;i="5.84,251,1620716400"; d="scan'208";a="296581732"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 02:08:48 -0700
X-IronPort-AV: E=Sophos;i="5.84,251,1620716400"; d="scan'208";a="499842109"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 02:08:45 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PULL V3 for 6.2 3/6] hmp-commands: Add new HMP command for filter
 passthrough
Date: Mon, 19 Jul 2021 17:00:48 +0800
Message-Id: <20210719090051.3824672-4-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210719090051.3824672-1-chen.zhang@intel.com>
References: <20210719090051.3824672-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=chen.zhang@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>,
 Zhang Chen <chen.zhang@intel.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add hmp_passthrough_filter_add and hmp_passthrough_filter_del make user
can maintain object network passthrough list in human monitor

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 hmp-commands.hx       | 26 ++++++++++++++++++
 include/monitor/hmp.h |  2 ++
 monitor/hmp-cmds.c    | 63 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 91 insertions(+)

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
index 0942027208..b61f6158de 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1638,6 +1638,69 @@ void hmp_netdev_del(Monitor *mon, const QDict *qdict)
     hmp_handle_error(mon, err);
 }
 
+static IPFlowSpec *hmp_parse_IPFlowSpec(Monitor *mon, const QDict *qdict)
+{
+    IPFlowSpec *spec = g_new0(IPFlowSpec, 1);
+    g_autofree char *src = NULL, *dst = NULL;
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
+            goto err;
+        }
+    }
+
+    if (dst) {
+        spec->destination = g_new0(InetSocketAddressBase, 1);
+
+        if (inet_parse_base(spec->destination, dst, NULL)) {
+            monitor_printf(mon, "Incorrect passthrough dst address\n");
+            goto err;
+        }
+    }
+
+    return spec;
+
+err:
+    g_free(spec->source);
+    g_free(spec->destination);
+    g_free(spec);
+    return NULL;
+}
+
+void hmp_passthrough_filter_add(Monitor *mon, const QDict *qdict)
+{
+    IPFlowSpec *spec;
+    Error *err = NULL;
+
+    spec = hmp_parse_IPFlowSpec(mon, qdict);
+    if (spec) {
+        qmp_passthrough_filter_add(spec, &err);
+    }
+
+    hmp_handle_error(mon, err);
+}
+
+void hmp_passthrough_filter_del(Monitor *mon, const QDict *qdict)
+{
+    IPFlowSpec *spec;
+    Error *err = NULL;
+
+    spec = hmp_parse_IPFlowSpec(mon, qdict);
+    if (spec) {
+        qmp_passthrough_filter_del(spec, &err);
+    }
+
+    hmp_handle_error(mon, err);
+}
+
 void hmp_object_add(Monitor *mon, const QDict *qdict)
 {
     const char *options = qdict_get_str(qdict, "object");
-- 
2.25.1


