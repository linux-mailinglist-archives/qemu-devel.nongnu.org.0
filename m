Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5BA33CF2A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 09:01:53 +0100 (CET)
Received: from localhost ([::1]:48920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM4eH-0003Ql-01
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 04:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1lM4cI-00020f-0X
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 03:59:50 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1lM4cE-0008PR-7q
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 03:59:49 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F05Hf3RlSz17Lw8;
 Tue, 16 Mar 2021 15:57:50 +0800 (CST)
Received: from DESKTOP-F1615D3.china.huawei.com (10.174.186.85) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Tue, 16 Mar 2021 15:59:34 +0800
From: Zihao Chang <changzihao1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v8 3/3] qmp: add new qmp display-reload
Date: Tue, 16 Mar 2021 15:58:45 +0800
Message-ID: <20210316075845.1476-4-changzihao1@huawei.com>
X-Mailer: git-send-email 2.22.0.windows.1
In-Reply-To: <20210316075845.1476-1-changzihao1@huawei.com>
References: <20210316075845.1476-1-changzihao1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.85]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=changzihao1@huawei.com; helo=szxga04-in.huawei.com
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
Cc: berrange@redhat.com, oscar.zhangbo@huawei.com, changzihao1@huawei.com,
 armbru@redhat.com, xiexiangyou@huawei.com, yebiaoxiang@huawei.com,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch provides a new qmp to reload display configuration
without restart VM, but only reloading the vnc tls certificates
is implemented.
Example:
{"execute": "display-reload", "arguments":{"type": "vnc", "tls-certs": true}}

Signed-off-by: Zihao Chang <changzihao1@huawei.com>
---
 monitor/qmp-cmds.c | 17 +++++++++++++
 qapi/ui.json       | 61 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index c7df8c0ee268..f7d64a64577a 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -334,3 +334,20 @@ MemoryInfo *qmp_query_memory_size_summary(Error **errp)
 
     return mem_info;
 }
+
+void qmp_display_reload(DisplayReloadOptions *arg, Error **errp)
+{
+    switch (arg->type) {
+    case DISPLAY_RELOAD_TYPE_VNC:
+#ifdef CONFIG_VNC
+        if (arg->u.vnc.has_tls_certs && arg->u.vnc.tls_certs) {
+            vnc_display_reload_certs(NULL, errp);
+        }
+#else
+        error_setg(errp, "vnc is invalid, missing 'CONFIG_VNC'");
+#endif
+        break;
+    default:
+        abort();
+    }
+}
diff --git a/qapi/ui.json b/qapi/ui.json
index d08d72b43923..e39159eae022 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1179,3 +1179,64 @@
 ##
 { 'command': 'query-display-options',
   'returns': 'DisplayOptions' }
+
+##
+# @DisplayReloadType:
+#
+# Available DisplayReload types.
+#
+# @vnc: VNC display
+#
+# Since: 6.0
+#
+##
+{ 'enum': 'DisplayReloadType',
+  'data': ['vnc'] }
+
+##
+# @DisplayReloadOptionsVNC:
+#
+# Specify the VNC reload options.
+#
+# @tls-certs: reload tls certs or not.
+#
+# Since: 6.0
+#
+##
+{ 'struct': 'DisplayReloadOptionsVNC',
+  'data': { '*tls-certs': 'bool' } }
+
+##
+# @DisplayReloadOptions:
+#
+# Options of the display configuration reload.
+#
+# @type: Specify the display type.
+#
+# Since: 6.0
+#
+##
+{ 'union': 'DisplayReloadOptions',
+  'base': {'type': 'DisplayReloadType'},
+  'discriminator': 'type',
+  'data': { 'vnc': 'DisplayReloadOptionsVNC' } }
+
+##
+# @display-reload:
+#
+# Reload display configuration.
+#
+# Returns: Nothing on success.
+#
+# Since: 6.0
+#
+# Example:
+#
+# -> { "execute": "display-reload",
+#      "arguments": { "type": "vnc", "tls-certs": true  } }
+# <- { "return": {} }
+#
+##
+{ 'command': 'display-reload',
+  'data': 'DisplayReloadOptions',
+  'boxed' : true }
-- 
2.28.0


