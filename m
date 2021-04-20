Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFC9365C22
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 17:25:34 +0200 (CEST)
Received: from localhost ([::1]:42440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYsFp-0000Wp-Jw
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 11:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lYsCS-0005h2-LW
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 11:22:06 -0400
Received: from mga05.intel.com ([192.55.52.43]:37555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lYsCQ-0004Vw-PH
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 11:22:04 -0400
IronPort-SDR: emEbazlew5gWhc3nmVncniMqXl6891wxiIoGxUcTjo6K42ImJu9pOqJBA0lNUq73DRo+1+MQ0m
 sbwO/ciXBQCg==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="280854218"
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; d="scan'208";a="280854218"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 08:22:01 -0700
IronPort-SDR: hNQ8/HiT6ZmzoZNMJWi0r5ZyGS9Wg7Fkr8x2mZZcefwrY7WxLOF05TMPbGioEjf9ZsMtflT1lH
 ENJm3Bxcbg3w==
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; d="scan'208";a="523846719"
Received: from unknown (HELO tkid-nvme.lan) ([10.239.13.19])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 08:21:59 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH V6 3/6] hmp-commands: Add new HMP command for COLO passthrough
Date: Tue, 20 Apr 2021 23:15:34 +0800
Message-Id: <20210420151537.64360-4-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420151537.64360-1-chen.zhang@intel.com>
References: <20210420151537.64360-1-chen.zhang@intel.com>
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
 monitor/hmp-cmds.c    | 82 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 110 insertions(+)

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
index 0ad5b77477..6991b03075 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1634,6 +1634,88 @@ void hmp_netdev_del(Monitor *mon, const QDict *qdict)
     hmp_handle_error(mon, err);
 }
 
+void hmp_colo_passthrough_add(Monitor *mon, const QDict *qdict)
+{
+    IPFlowSpec *spec = g_new0(IPFlowSpec, 1);
+    char *src, *dst;
+    Error *err = NULL;
+
+    spec->protocol = g_strdup(qdict_get_try_str(qdict, "protocol"));
+    spec->object_name = g_strdup(qdict_get_try_str(qdict, "object-name"));
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
+    IPFlowSpec *spec = g_new0(IPFlowSpec, 1);
+    char *src, *dst;
+    Error *err = NULL;
+
+    spec->protocol = g_strdup(qdict_get_try_str(qdict, "protocol"));
+    spec->object_name = g_strdup(qdict_get_try_str(qdict, "object-name"));
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


