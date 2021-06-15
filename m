Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B55713A7D83
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 13:47:14 +0200 (CEST)
Received: from localhost ([::1]:36124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt7XF-000211-Pj
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 07:47:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lt7Uq-00081C-7N
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 07:44:44 -0400
Received: from mga14.intel.com ([192.55.52.115]:19451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lt7Uo-00067Q-58
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 07:44:44 -0400
IronPort-SDR: dvej6Vh+Fy+HeDH3zgB8Ad5EO9AL03h3ILzfU4FBzSsYlnxwat9nWSHL7dOONm3kKscstri8nK
 cppSfKXVvbAA==
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="205790926"
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; d="scan'208";a="205790926"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 04:44:41 -0700
IronPort-SDR: K50nA+r2zbGTNqrr1f/s0ZPlTmPmQqjddazF24dGhmvS+9+HQKkQAl/0wJolsst4vYg26LXE5w
 NTHPqTkvB9Rw==
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; d="scan'208";a="450224099"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 04:44:38 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH V8 3/6] hmp-commands: Add new HMP command for COLO passthrough
Date: Tue, 15 Jun 2021 19:37:37 +0800
Message-Id: <20210615113740.2278015-4-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210615113740.2278015-1-chen.zhang@intel.com>
References: <20210615113740.2278015-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=chen.zhang@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
index 8e45bce2cd..895e60a774 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1292,6 +1292,32 @@ SRST
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
index 3baa1058e2..2e171dba0c 100644
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
index d10ee14110..9d3269b28b 100644
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


