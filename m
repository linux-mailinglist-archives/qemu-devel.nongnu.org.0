Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EF62ED034
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 13:48:43 +0100 (CET)
Received: from localhost ([::1]:41338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxUiY-0005N1-B7
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 07:48:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1kxUhL-0004wG-1X
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 07:47:27 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1kxUhI-0007Mf-2P
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 07:47:26 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DBQvW1F8bzl2J3;
 Thu,  7 Jan 2021 20:45:59 +0800 (CST)
Received: from DESKTOP-F1615D3.china.huawei.com (10.174.186.85) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Thu, 7 Jan 2021 20:47:01 +0800
From: Zihao Chang <changzihao1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] vnc: add qmp to support change authz
Date: Thu, 7 Jan 2021 20:46:57 +0800
Message-ID: <20210107124657.650-1-changzihao1@huawei.com>
X-Mailer: git-send-email 2.22.0.windows.1
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
Cc: oscar.zhangbo@huawei.com, changzihao1@huawei.com, armbru@redhat.com,
 xiexiangyou@huawei.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch add a new qmp 'change-vnc-authz' to support change the
tls/sasl authz of vm. If index='', unset tlsauthzid/sasl.authzid
{
   "execute":"change-vnc-authz",
   "arguments":{
      "index":"object-authz-id",
      "type":"tls/sasl"
   }
}

Signed-off-by: Zihao Chang <changzihao1@huawei.com>
---
 include/ui/console.h |  3 +++
 monitor/qmp-cmds.c   | 10 ++++++++++
 qapi/ui.json         | 16 ++++++++++++++++
 ui/vnc.c             | 32 ++++++++++++++++++++++++++++++++
 4 files changed, 61 insertions(+)

diff --git a/include/ui/console.h b/include/ui/console.h
index 5dd21976a3..6b85546105 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -441,6 +441,9 @@ int vnc_display_password(const char *id, const char *password);
 int vnc_display_pw_expire(const char *id, time_t expires);
 QemuOpts *vnc_parse(const char *str, Error **errp);
 int vnc_init_func(void *opaque, QemuOpts *opts, Error **errp);
+#ifdef CONFIG_VNC_SASL
+int vnc_change_authz(const char *id, const char *type, const char *index);
+#endif
 
 /* input.c */
 int index_from_key(const char *key, size_t key_length);
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 34f7e75b7b..085aeb9bec 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -289,6 +289,16 @@ static void qmp_change_vnc(const char *target, bool has_arg, const char *arg,
 }
 #endif /* !CONFIG_VNC */
 
+#ifdef CONFIG_VNC_SASL
+void qmp_change_vnc_authz(const char *type, const char *index, Error **errp)
+{
+    if (vnc_change_authz(NULL, type, index) < 0) {
+        error_setg(errp, "Could not set authz, type:%s, index:%s",
+                   type, index);
+    }
+}
+#endif
+
 void qmp_change(const char *device, const char *target,
                 bool has_arg, const char *arg, Error **errp)
 {
diff --git a/qapi/ui.json b/qapi/ui.json
index d08d72b439..37ddeabbd2 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1179,3 +1179,19 @@
 ##
 { 'command': 'query-display-options',
   'returns': 'DisplayOptions' }
+
+##
+# @change-vnc-authz:
+#
+# Change the VNC server authz.
+#
+# @type:  the new authz type to use with VNC authentication
+# @index:  the new authz object index to use with VNC authentication
+#
+# Since: 5.2
+#
+##
+{ 'command': 'change-vnc-authz',
+  'data': { 'type' : 'str',
+            'index': 'str'},
+  'if': 'defined(CONFIG_VNC_SASL)' }
diff --git a/ui/vnc.c b/ui/vnc.c
index 7452ac7df2..f0809290a8 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -3276,6 +3276,38 @@ int vnc_display_password(const char *id, const char *password)
     return 0;
 }
 
+#ifdef CONFIG_VNC_SASL
+int vnc_change_authz(const char *id, const char *type, const char *index)
+{
+    VncDisplay *vd = vnc_display_find(id);
+
+    if (!vd) {
+        return -EINVAL;
+    }
+
+    if (strcmp(type, "sasl") == 0) {
+        g_free(vd->sasl.authzid);
+        vd->sasl.authzid = NULL;
+
+        if (strcmp(index, "") != 0) {
+            vd->sasl.authzid = g_strdup(index);
+        }
+    } else if (strcmp(type, "tls") == 0) {
+        g_free(vd->tlsauthzid);
+        vd->tlsauthzid = NULL;
+
+        if (strcmp(index, "") != 0) {
+            vd->tlsauthzid = g_strdup(index);
+        }
+    } else {
+        error_printf_unless_qmp("unsupport authz type: %s", type);
+        return -EOPNOTSUPP;
+    }
+
+    return 0;
+}
+#endif
+
 int vnc_display_pw_expire(const char *id, time_t expires)
 {
     VncDisplay *vd = vnc_display_find(id);
-- 
2.23.0


