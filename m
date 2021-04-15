Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3C6360769
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 12:45:41 +0200 (CEST)
Received: from localhost ([::1]:56996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWzVE-0005Kr-UM
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 06:45:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lWzRI-0000vK-Rx
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 06:41:37 -0400
Received: from mga06.intel.com ([134.134.136.31]:54482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lWzRD-00029d-Th
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 06:41:36 -0400
IronPort-SDR: 0PuCJsy6f/Sb0gZIQdCSftca8Ru70wJUIERvSSXvBPycJPDcz4/n1GGxdg1mm1eVwYLneumEAP
 dm3lmST249oA==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="256146919"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="256146919"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 03:41:24 -0700
IronPort-SDR: oOxzNrtGE10+ubuIhg0Pc+D0MVmWnVZ3hSL0MbbvnGT0LZTJavnzeDLzSkukew/dpAi3t2jQmC
 2C71puYL/LSQ==
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="425134946"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 03:41:21 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH V5 3/6] hmp-commands: Add new HMP command for COLO passthrough
Date: Thu, 15 Apr 2021 18:35:12 +0800
Message-Id: <20210415103515.1251386-4-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210415103515.1251386-1-chen.zhang@intel.com>
References: <20210415103515.1251386-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=chen.zhang@intel.com;
 helo=mga06.intel.com
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
Cc: Zhang Chen <chen.zhang@intel.com>, Lukas Straub <lukasstraub2@web.de>,
 Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add hmp_colo_passthrough_add and hmp_colo_passthrough_del make user
can maintain COLO network passthrough list in human monitor

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 hmp-commands.hx       | 26 ++++++++++++++
 include/monitor/hmp.h |  2 ++
 monitor/hmp-cmds.c    | 84 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 112 insertions(+)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 435c591a1c..cbb08623c7 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1290,6 +1290,32 @@ SRST
   Remove host network device.
 ERST
 
+    {
+        .name       = "colo_passthrough_add",
+        .args_type  = "protocol:s,object-name:s?,src:s?,dst:s?",
+        .params     = "protocol [object-name] [src] [dst]",
+        .help       = "Add network stream to colo passthrough list",
+        .cmd        = hmp_colo_passthrough_add,
+    },
+
+SRST
+``colo_passthrough_add``
+  Add network stream to colo passthrough list.
+ERST
+
+    {
+        .name       = "colo_passthrough_del",
+        .args_type  = "protocol:s,object-name:s?,src:s?,dst:s?",
+        .params     = "protocol [object-name] [src] [dst]",
+        .help       = "Delete network stream from colo passthrough list",
+        .cmd        = hmp_colo_passthrough_del,
+    },
+
+SRST
+``colo_passthrough_del``
+  Delete network stream from colo passthrough list.
+ERST
+
     {
         .name       = "object_add",
         .args_type  = "object:S",
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 605d57287a..a784f98531 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -77,6 +77,8 @@ void hmp_device_del(Monitor *mon, const QDict *qdict);
 void hmp_dump_guest_memory(Monitor *mon, const QDict *qdict);
 void hmp_netdev_add(Monitor *mon, const QDict *qdict);
 void hmp_netdev_del(Monitor *mon, const QDict *qdict);
+void hmp_colo_passthrough_add(Monitor *mon, const QDict *qdict);
+void hmp_colo_passthrough_del(Monitor *mon, const QDict *qdict);
 void hmp_getfd(Monitor *mon, const QDict *qdict);
 void hmp_closefd(Monitor *mon, const QDict *qdict);
 void hmp_sendkey(Monitor *mon, const QDict *qdict);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 0ad5b77477..2c1c382c9e 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1634,6 +1634,90 @@ void hmp_netdev_del(Monitor *mon, const QDict *qdict)
     hmp_handle_error(mon, err);
 }
 
+void hmp_colo_passthrough_add(Monitor *mon, const QDict *qdict)
+{
+    const char *prot = qdict_get_str(qdict, "protocol");
+    IPFlowSpec *spec = g_new0(IPFlowSpec, 1);
+    char *src, *dst;
+    Error *err = NULL;
+
+    spec->object_name = g_strdup(qdict_get_try_str(qdict, "object-name"));
+    spec->protocol = qapi_enum_parse(&IPProtocol_lookup, prot, -1, &err);
+
+    src = g_strdup(qdict_get_try_str(qdict, "src"));
+    if (src) {
+        spec->source = g_new0(InetSocketAddressBase, 1);
+
+        if (inet_parse_base(spec->source, src, NULL)) {
+            monitor_printf(mon, "bad colo passthrough src address");
+            goto out;
+        }
+    }
+
+    dst = g_strdup(qdict_get_try_str(qdict, "dst"));
+    if (dst) {
+        spec->destination = g_new0(InetSocketAddressBase, 1);
+
+        if (inet_parse_base(spec->destination, dst, NULL)) {
+            monitor_printf(mon, "bad colo passthrough dst address");
+            goto out;
+        }
+    }
+
+    qmp_colo_passthrough_add(spec, &err);
+
+out:
+    g_free(src);
+    src = NULL;
+
+    g_free(dst);
+    dst = NULL;
+
+    hmp_handle_error(mon, err);
+}
+
+void hmp_colo_passthrough_del(Monitor *mon, const QDict *qdict)
+{
+    const char *prot = qdict_get_str(qdict, "protocol");
+    IPFlowSpec *spec = g_new0(IPFlowSpec, 1);
+    char *src, *dst;
+    Error *err = NULL;
+
+    spec->object_name = g_strdup(qdict_get_try_str(qdict, "object-name"));
+    spec->protocol = qapi_enum_parse(&IPProtocol_lookup, prot, -1, &err);
+
+    src = g_strdup(qdict_get_try_str(qdict, "src"));
+    if (src) {
+        spec->source = g_new0(InetSocketAddressBase, 1);
+
+        if (inet_parse_base(spec->source, src, NULL)) {
+            monitor_printf(mon, "bad colo passthrough src address");
+            goto out;
+        }
+    }
+
+    dst = g_strdup(qdict_get_try_str(qdict, "dst"));
+    if (dst) {
+        spec->destination = g_new0(InetSocketAddressBase, 1);
+
+        if (inet_parse_base(spec->destination, dst, NULL)) {
+            monitor_printf(mon, "bad colo passthrough dst address");
+            goto out;
+        }
+    }
+
+    qmp_colo_passthrough_del(spec, &err);
+
+out:
+    g_free(src);
+    src = NULL;
+
+    g_free(dst);
+    dst = NULL;
+
+    hmp_handle_error(mon, err);
+}
+
 void hmp_object_add(Monitor *mon, const QDict *qdict)
 {
     const char *options = qdict_get_str(qdict, "object");
-- 
2.25.1


