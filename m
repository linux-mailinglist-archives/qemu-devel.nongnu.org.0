Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 467EA323BEF
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 13:37:51 +0100 (CET)
Received: from localhost ([::1]:57020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEtQM-0006M9-AG
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 07:37:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1lEtNm-000502-00
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 07:35:10 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1lEtNh-0005LH-Pn
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 07:35:08 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DlwLk1V38zjS17;
 Wed, 24 Feb 2021 20:33:18 +0800 (CST)
Received: from DESKTOP-F1615D3.china.huawei.com (10.174.186.85) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Wed, 24 Feb 2021 20:34:47 +0800
From: Zihao Chang <changzihao1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v4 3/3] qmp: add new qmp display-reload
Date: Wed, 24 Feb 2021 20:34:19 +0800
Message-ID: <20210224123419.786-4-changzihao1@huawei.com>
X-Mailer: git-send-email 2.22.0.windows.1
In-Reply-To: <20210224123419.786-1-changzihao1@huawei.com>
References: <20210224123419.786-1-changzihao1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.85]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=changzihao1@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
{"execute": "display-reload", "arguments":{"vnc-tls-certs": true}}

Signed-off-by: Zihao Chang <changzihao1@huawei.com>
---
 monitor/qmp-cmds.c | 12 ++++++++++++
 qapi/ui.json       | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index c7df8c0ee268..02ac2fdb1a47 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -334,3 +334,15 @@ MemoryInfo *qmp_query_memory_size_summary(Error **errp)
 
     return mem_info;
 }
+
+void qmp_display_reload(DisplayReloadInfo *arg, Error **errp)
+{
+    Error *local_err = NULL;
+
+    if (arg->has_vnc_tls_certs && arg->vnc_tls_certs) {
+        if (!vnc_display_reload_certs(NULL, &local_err)) {
+            error_propagate(errp, local_err);
+            return;
+        }
+    }
+}
diff --git a/qapi/ui.json b/qapi/ui.json
index d08d72b43923..922d9ae0772e 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1179,3 +1179,35 @@
 ##
 { 'command': 'query-display-options',
   'returns': 'DisplayOptions' }
+
+##
+# @DisplayReloadInfo:
+#
+# The basic information for reload Display configuration
+#
+# @vnc-tls-certs: whether to reload tls certs
+#
+# Since: 6.0
+##
+{ 'struct': 'DisplayReloadInfo',
+  'data': { '*vnc-tls-certs': 'bool' } }
+
+##
+# @display-reload:
+#
+# Reload display configuration
+#
+# Returns: Nothing on success
+#
+# Since: 6.0
+#
+# Example:
+#
+# -> { "execute": "display-reload",
+#      "arguments": { "vnc-tls-certs": true } }
+# <- { "return": {} }
+#
+##
+{ 'command': 'display-reload',
+  'data': 'DisplayReloadInfo',
+  'boxed' : true }
-- 
2.28.0


