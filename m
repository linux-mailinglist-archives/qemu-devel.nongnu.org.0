Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1713413F7
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 05:03:27 +0100 (CET)
Received: from localhost ([::1]:56102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN6M9-0000LH-SU
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 00:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lN6Jv-0006xV-Oe
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 00:01:09 -0400
Received: from mga18.intel.com ([134.134.136.126]:65171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lN6Jm-0004V3-JS
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 00:01:07 -0400
IronPort-SDR: EwMGLq5pFiWAOrFs2UR8HJraS1xErE8wQp5o4Ypo0JalO69ctGsY1X2mwB+u2qGhVx2uW3tZBL
 z/pRBRNRZAqA==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="177409917"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="177409917"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 21:00:54 -0700
IronPort-SDR: NPTnpFf6uGCTXxJgn6jtwyZjnPTowhXJarMtRQl6tei18RSTgvg66fBtoS09v6C97kJ3/pND1V
 CN5YScUUieBg==
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="606456693"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 21:00:51 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH V4 4/7] hmp-commands: Add new HMP command for COLO passthrough
Date: Fri, 19 Mar 2021 11:55:05 +0800
Message-Id: <20210319035508.113741-5-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319035508.113741-1-chen.zhang@intel.com>
References: <20210319035508.113741-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=chen.zhang@intel.com; helo=mga18.intel.com
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
can maintain COLO network passthrough list in human monitor.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 hmp-commands.hx       | 26 ++++++++++++++++++++++++++
 include/monitor/hmp.h |  2 ++
 monitor/hmp-cmds.c    | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index d4001f9c5d..b67a5a04cb 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1335,6 +1335,32 @@ SRST
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
index 3c88a4faef..b57e3430ab 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1668,6 +1668,40 @@ void hmp_netdev_del(Monitor *mon, const QDict *qdict)
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


