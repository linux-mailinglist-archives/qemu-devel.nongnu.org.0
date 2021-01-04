Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC9C2E90C8
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 08:14:20 +0100 (CET)
Received: from localhost ([::1]:59890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwK4I-0004GN-Rc
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 02:14:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1kwK27-0003NH-0w
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 02:12:03 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1kwK22-0001Qo-46
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 02:12:02 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4D8Rc94XN6z7Q39;
 Mon,  4 Jan 2021 15:10:49 +0800 (CST)
Received: from DESKTOP-F1615D3.china.huawei.com (10.174.186.85) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Mon, 4 Jan 2021 15:11:33 +0800
From: Zihao Chang <changzihao1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] vnc: add qmp to support reload vnc tls certificates
Date: Mon, 4 Jan 2021 15:11:28 +0800
Message-ID: <20210104071128.754-1-changzihao1@huawei.com>
X-Mailer: git-send-email 2.22.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.85]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=changzihao1@huawei.com; helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: oscar.zhangbo@huawei.com, changzihao1@huawei.com, armbru@redhat.com,
 xiexiangyou@huawei.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU loads vnc tls certificates only when vm is started. This patch
provides a new qmp command to reload vnc tls certificates without
restart vnc-server/VM.

Signed-off-by: Zihao Chang <changzihao1@huawei.com>
---
 include/ui/console.h |  1 +
 monitor/qmp-cmds.c   |  7 +++++++
 qapi/ui.json         | 17 +++++++++++++++++
 ui/vnc.c             | 20 ++++++++++++++++++++
 4 files changed, 45 insertions(+)

diff --git a/include/ui/console.h b/include/ui/console.h
index 5dd21976a3..f05140b662 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -441,6 +441,7 @@ int vnc_display_password(const char *id, const char *password);
 int vnc_display_pw_expire(const char *id, time_t expires);
 QemuOpts *vnc_parse(const char *str, Error **errp);
 int vnc_init_func(void *opaque, QemuOpts *opts, Error **errp);
+int vnc_display_reload_cert(const char *id,  Error **errp);
 
 /* input.c */
 int index_from_key(const char *key, size_t key_length);
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 34f7e75b7b..90bd08c8ed 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -287,6 +287,13 @@ static void qmp_change_vnc(const char *target, bool has_arg, const char *arg,
         qmp_change_vnc_listen(target, errp);
     }
 }
+
+void qmp_reload_vnc_cert(Error **errp)
+{
+    if (vnc_display_reload_cert(NULL, errp) < 0) {
+        error_setg(errp, "Reload vnc tls cert failed");
+    }
+}
 #endif /* !CONFIG_VNC */
 
 void qmp_change(const char *device, const char *target,
diff --git a/qapi/ui.json b/qapi/ui.json
index d08d72b439..bc3ffdb20f 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1179,3 +1179,20 @@
 ##
 { 'command': 'query-display-options',
   'returns': 'DisplayOptions' }
+
+##
+# @reload-vnc-cert:
+#
+# Reload certificates for vnc.
+#
+# Returns: nothing
+#
+# Since: 5.2
+#
+# Example:
+#
+# -> { "execute": "reload-vnc-cert" }
+# <- { "return": {} }
+#
+##
+{ 'command': 'reload-vnc-cert' }
diff --git a/ui/vnc.c b/ui/vnc.c
index 7452ac7df2..b0cfbcf47c 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -582,6 +582,26 @@ VncInfo2List *qmp_query_vnc_servers(Error **errp)
     return prev;
 }
 
+int vnc_display_reload_cert(const char *id, Error **errp)
+{
+    VncDisplay *vd = vnc_display_find(id);
+
+    if (!vd) {
+        return -EINVAL;
+    }
+
+    if (!vd->tlscreds) {
+        error_printf_unless_qmp("If you want use vnc tls  please enable "
+                                "vnc tls using '-vnc tls-creds=${tls-obj-id}'.\n");
+        return -EPERM;
+    }
+
+    object_property_set_bool(OBJECT(vd->tlscreds), "loaded", false, NULL);
+    object_property_set_bool(OBJECT(vd->tlscreds), "loaded", true, NULL);
+
+    return 0;
+}
+
 /* TODO
    1) Get the queue working for IO.
    2) there is some weirdness when using the -S option (the screen is grey
-- 
2.23.0


