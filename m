Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E8C2ED252
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 15:33:31 +0100 (CET)
Received: from localhost ([::1]:44242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxWLy-0001HO-Pw
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 09:33:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1kxWJd-0000LO-NC
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 09:31:06 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1kxWJT-0004sP-Q9
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 09:31:05 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DBTCP1WMvzj4s5;
 Thu,  7 Jan 2021 22:29:53 +0800 (CST)
Received: from DESKTOP-F1615D3.china.huawei.com (10.174.186.85) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Thu, 7 Jan 2021 22:30:41 +0800
From: Zihao Chang <changzihao1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 2/2] vnc: add qmp to support reload vnc tls certificates
Date: Thu, 7 Jan 2021 22:30:32 +0800
Message-ID: <20210107143032.752-3-changzihao1@huawei.com>
X-Mailer: git-send-email 2.22.0.windows.1
In-Reply-To: <20210107143032.752-1-changzihao1@huawei.com>
References: <20210107143032.752-1-changzihao1@huawei.com>
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
 armbru@redhat.com, xiexiangyou@huawei.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU loads vnc tls certificates only when vm is started. This patch
provides a new qmp to reload vnc tls certificates without restart
vnc-server/VM.
{"execute": "reload-vnc-cert"}

Signed-off-by: Zihao Chang <changzihao1@huawei.com>
---
 include/ui/console.h |  1 +
 monitor/qmp-cmds.c   |  5 +++++
 qapi/ui.json         | 18 ++++++++++++++++++
 ui/vnc.c             | 24 ++++++++++++++++++++++++
 4 files changed, 48 insertions(+)

diff --git a/include/ui/console.h b/include/ui/console.h
index 5dd21976a3..60a24a8bb5 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -441,6 +441,7 @@ int vnc_display_password(const char *id, const char *password);
 int vnc_display_pw_expire(const char *id, time_t expires);
 QemuOpts *vnc_parse(const char *str, Error **errp);
 int vnc_init_func(void *opaque, QemuOpts *opts, Error **errp);
+void vnc_display_reload_cert(const char *id,  Error **errp);
 
 /* input.c */
 int index_from_key(const char *key, size_t key_length);
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 34f7e75b7b..84f2b74ea8 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -287,6 +287,11 @@ static void qmp_change_vnc(const char *target, bool has_arg, const char *arg,
         qmp_change_vnc_listen(target, errp);
     }
 }
+
+void qmp_reload_vnc_cert(Error **errp)
+{
+    vnc_display_reload_cert(NULL, errp);
+}
 #endif /* !CONFIG_VNC */
 
 void qmp_change(const char *device, const char *target,
diff --git a/qapi/ui.json b/qapi/ui.json
index d08d72b439..855b1ac007 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1179,3 +1179,21 @@
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
+{ 'command': 'reload-vnc-cert',
+  'if': 'defined(CONFIG_VNC)' }
diff --git a/ui/vnc.c b/ui/vnc.c
index 7452ac7df2..2cc88c2421 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -582,6 +582,30 @@ VncInfo2List *qmp_query_vnc_servers(Error **errp)
     return prev;
 }
 
+void vnc_display_reload_cert(const char *id, Error **errp)
+{
+    VncDisplay *vd = vnc_display_find(id);
+    QCryptoTLSCredsClass *creds = NULL;
+
+    if (!vd) {
+        error_setg(errp, "Can not find Vnc Display");
+        return;
+    }
+
+    if (!vd->tlscreds) {
+        error_setg(errp, "Vnc tls is not enable");
+        return;
+    }
+
+    creds = QCRYPTO_TLS_CREDS_GET_CLASS(OBJECT(vd->tlscreds));
+    if (creds->reload == NULL) {
+        error_setg(errp, "%s doesn't support to reload TLS credential",
+                   object_get_typename(OBJECT(vd->tlscreds)));
+        return;
+    }
+    creds->reload(vd->tlscreds, errp);
+}
+
 /* TODO
    1) Get the queue working for IO.
    2) there is some weirdness when using the -S option (the screen is grey
-- 
2.23.0


