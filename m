Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A2531224B
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 08:52:53 +0100 (CET)
Received: from localhost ([::1]:48050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8esG-0006Bp-4T
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 02:52:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1l8enL-0003PT-M3
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 02:47:47 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1l8enI-0006rO-Hn
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 02:47:47 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DYLmn2hFCzlH89;
 Sun,  7 Feb 2021 15:45:45 +0800 (CST)
Received: from DESKTOP-F1615D3.china.huawei.com (10.174.186.85) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Sun, 7 Feb 2021 15:47:21 +0800
From: Zihao Chang <changzihao1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 3/3] qmp: add new qmp display-reload
Date: Sun, 7 Feb 2021 15:47:10 +0800
Message-ID: <20210207074710.1029-4-changzihao1@huawei.com>
X-Mailer: git-send-email 2.22.0.windows.1
In-Reply-To: <20210207074710.1029-1-changzihao1@huawei.com>
References: <20210207074710.1029-1-changzihao1@huawei.com>
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
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 armbru@redhat.com, xiexiangyou@huawei.com, kraxel@redhat.com
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
index c7df8c0ee268..edf543a4febf 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -334,3 +334,15 @@ MemoryInfo *qmp_query_memory_size_summary(Error **errp)
 
     return mem_info;
 }
+
+void qmp_display_reload(DiaplayReloadInfo *arg, Error **errp)
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
index d08d72b43923..019283aad208 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1179,3 +1179,35 @@
 ##
 { 'command': 'query-display-options',
   'returns': 'DisplayOptions' }
+
+##
+# @DiaplayReloadInfo:
+#
+# The basic information for reload Display configuration
+#
+# @vnc-tls-certs: whether to reload tls certs
+#
+# Since: 6.0
+##
+{ 'struct': 'DiaplayReloadInfo',
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
+  'data': 'DiaplayReloadInfo',
+  'boxed' : true }
-- 
2.28.0


