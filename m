Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A282312249
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 08:49:24 +0100 (CET)
Received: from localhost ([::1]:43974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8eos-0004GS-Mn
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 02:49:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1l8enK-0003PM-M1
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 02:47:46 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1l8enH-0006sE-Tj
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 02:47:46 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DYLmn3BfszlH8C;
 Sun,  7 Feb 2021 15:45:45 +0800 (CST)
Received: from DESKTOP-F1615D3.china.huawei.com (10.174.186.85) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Sun, 7 Feb 2021 15:47:20 +0800
From: Zihao Chang <changzihao1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 2/3] vnc: support reload x509 certificates for vnc
Date: Sun, 7 Feb 2021 15:47:09 +0800
Message-ID: <20210207074710.1029-3-changzihao1@huawei.com>
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

This patch add vnc_display_reload_certs() to support
update x509 certificates.

Signed-off-by: Zihao Chang <changzihao1@huawei.com>
---
 include/ui/console.h |  1 +
 ui/vnc.c             | 28 ++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/include/ui/console.h b/include/ui/console.h
index 7a3fc11abf72..da02fdd2e39d 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -441,6 +441,7 @@ int vnc_display_password(const char *id, const char *password);
 int vnc_display_pw_expire(const char *id, time_t expires);
 void vnc_parse(const char *str);
 int vnc_init_func(void *opaque, QemuOpts *opts, Error **errp);
+bool vnc_display_reload_certs(const char *id,  Error **errp);
 
 /* input.c */
 int index_from_key(const char *key, size_t key_length);
diff --git a/ui/vnc.c b/ui/vnc.c
index 16bb3be770b2..558db1db2b91 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -584,6 +584,34 @@ VncInfo2List *qmp_query_vnc_servers(Error **errp)
     return prev;
 }
 
+bool vnc_display_reload_certs(const char *id, Error **errp)
+{
+    VncDisplay *vd = vnc_display_find(id);
+    QCryptoTLSCredsClass *creds = NULL;
+
+    if (!vd) {
+        error_setg(errp, "Can not find Vnc Display");
+        return false;
+    }
+
+    if (!vd->tlscreds) {
+        error_setg(errp, "Vnc tls is not enable");
+        return false;
+    }
+
+    creds = QCRYPTO_TLS_CREDS_GET_CLASS(OBJECT(vd->tlscreds));
+    if (creds->reload == NULL) {
+        error_setg(errp, "%s doesn't support to reload TLS credential",
+                   object_get_typename(OBJECT(vd->tlscreds)));
+        return false;
+    }
+    if (!creds->reload(vd->tlscreds, errp)) {
+        return false;
+    }
+
+    return true;
+}
+
 /* TODO
    1) Get the queue working for IO.
    2) there is some weirdness when using the -S option (the screen is grey
-- 
2.28.0


