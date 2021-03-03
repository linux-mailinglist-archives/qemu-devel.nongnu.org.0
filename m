Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D74C32B3EE
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 05:23:51 +0100 (CET)
Received: from localhost ([::1]:60734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHJ38-00078v-HZ
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 23:23:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lHJ0Z-0005E4-Nr
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 23:21:11 -0500
Received: from mga18.intel.com ([134.134.136.126]:42971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lHJ0Y-000591-27
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 23:21:11 -0500
IronPort-SDR: aU04mekUDkwizV8Xgs/RXh2yYEphwS9R1V02kmNyoRidci06gnZxs/FV2MeH+2/mfyVrxl0zoL
 2RNjjsP8H0Tg==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="174732209"
X-IronPort-AV: E=Sophos;i="5.81,218,1610438400"; d="scan'208";a="174732209"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 20:21:09 -0800
IronPort-SDR: ODCw/rlZuAEUUfmsQjjwVf4n0hX796DQdEKjcLZ2myG9X7waSTcAL49RvAOfbv/vVkz+jS0hJm
 W/OoT+8wjbcA==
X-IronPort-AV: E=Sophos;i="5.81,218,1610438400"; d="scan'208";a="407060019"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 20:21:06 -0800
From: Zhang Chen <chen.zhang@intel.com >
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Lukas Straub <lukasstraub2@web.de>
Subject: [PATCH V2 4/7] hmp-commands: Add new HMP command for COLO passthrough
Date: Wed,  3 Mar 2021 12:15:36 +0800
Message-Id: <20210303041539.1032415-5-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210303041539.1032415-1-chen.zhang@intel.com>
References: <20210303041539.1032415-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=chen.zhang@intel.com; helo=mga18.intel.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, FROM_ADDR_WS=1.624,
 FROM_WSP_TRAIL=1, HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Zhang Chen <chen.zhang@intel.com>, Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Chen <chen.zhang@intel.com>

Add hmp_colo_passthrough_add and hmp_colo_passthrough_del make user
can maintain COLO network passthrough list in human monitor.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 hmp-commands.hx       | 26 ++++++++++++++++++++++++++
 include/monitor/hmp.h |  2 ++
 monitor/hmp-cmds.c    | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 73e0832ea1..c71521303c 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1341,6 +1341,32 @@ SRST
   Remove host network device.
 ERST
 
+    {
+        .name       = "colo_passthrough_add",
+        .args_type  = "protocol:s,id:s?,src_ip:s?,dst_ip:s?,src_port:i?,dst_port:i?",
+        .params     = "protocol [id] [src_ip] [dst_ip] [src_port] [dst_port]",
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
+        .args_type  = "protocol:s,id:s?,src_ip:s?,dst_ip:s?,src_port:i?,dst_port:i?",
+        .params     = "protocol [id] [src_ip] [dst_ip] [src_port] [dst_port]",
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
         .args_type  = "object:O",
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index ed2913fd18..3c4943b09f 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -81,6 +81,8 @@ void hmp_device_del(Monitor *mon, const QDict *qdict);
 void hmp_dump_guest_memory(Monitor *mon, const QDict *qdict);
 void hmp_netdev_add(Monitor *mon, const QDict *qdict);
 void hmp_netdev_del(Monitor *mon, const QDict *qdict);
+void hmp_colo_passthrough_add(Monitor *mon, const QDict *qdict);
+void hmp_colo_passthrough_del(Monitor *mon, const QDict *qdict);
 void hmp_getfd(Monitor *mon, const QDict *qdict);
 void hmp_closefd(Monitor *mon, const QDict *qdict);
 void hmp_sendkey(Monitor *mon, const QDict *qdict);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index fd4d77e246..de675d16e7 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1660,6 +1660,40 @@ void hmp_netdev_del(Monitor *mon, const QDict *qdict)
     hmp_handle_error(mon, err);
 }
 
+void hmp_colo_passthrough_add(Monitor *mon, const QDict *qdict)
+{
+    const char *prot = qdict_get_str(qdict, "protocol");
+    L4_Connection *l4_conn = g_new0(L4_Connection, 1);
+    Error *err = NULL;
+
+    l4_conn->id = g_strdup(qdict_get_try_str(qdict, "id"));
+    l4_conn->protocol = qapi_enum_parse(&IP_PROTOCOL_lookup, prot, -1, &err);
+    l4_conn->src_ip = g_strdup(qdict_get_try_str(qdict, "src_ip"));
+    l4_conn->dst_ip = g_strdup(qdict_get_try_str(qdict, "dst_ip"));
+    l4_conn->src_port = qdict_get_try_int(qdict, "src_port", 0);
+    l4_conn->dst_port = qdict_get_try_int(qdict, "dst_port", 0);
+
+    qmp_colo_passthrough_add(l4_conn, &err);
+    hmp_handle_error(mon, err);
+}
+
+void hmp_colo_passthrough_del(Monitor *mon, const QDict *qdict)
+{
+    const char *prot = qdict_get_str(qdict, "protocol");
+    L4_Connection *l4_conn = g_new0(L4_Connection, 1);
+    Error *err = NULL;
+
+    l4_conn->id = g_strdup(qdict_get_try_str(qdict, "id"));
+    l4_conn->protocol = qapi_enum_parse(&IP_PROTOCOL_lookup, prot, -1, &err);
+    l4_conn->src_ip = g_strdup(qdict_get_try_str(qdict, "src_ip"));
+    l4_conn->dst_ip = g_strdup(qdict_get_try_str(qdict, "dst_ip"));
+    l4_conn->src_port = qdict_get_try_int(qdict, "src_port", 0);
+    l4_conn->dst_port = qdict_get_try_int(qdict, "dst_port", 0);
+
+    qmp_colo_passthrough_del(l4_conn, &err);
+    hmp_handle_error(mon, err);
+}
+
 void hmp_object_add(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
-- 
2.25.1


