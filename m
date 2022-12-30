Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B024659829
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 13:28:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBEGK-0008Nv-SD; Fri, 30 Dec 2022 07:13:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1132f1bfe572585e6c7f+7068+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pBEFw-0007pD-PE
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:13:00 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+1132f1bfe572585e6c7f+7068+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pBEFr-00050i-0o
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:13:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=RMwn8pk01KyU/O6ggazjDrt07E6iMQlh/6Gyq4Ux3fg=; b=mvn/c5b4zr8HNr3vPtIVdJc6mI
 1y4lcJuH5e6v9cw5JIS4LkqVzPJP/kf8kqfebVsRezh+sh6v+8IIvEGIlWDj/rPbLJXhlDKFWXNLV
 HzOju3WU1+LOViwMpfzCmcnvY/akSxqFWjvxWdiTEQnKDzHelWV7w2Tj/x6DFeH0bMpD5GKoIBLb9
 Oz4yu2wlb+GvGfLXiCxbZS39wAY9FKVzute8EHQtHmV7SAd0mj0dSvvc0LqR2uVrxHN7zaC+KkOpL
 QAOsVQaAqvqqdE/bxvpwUOBVvo7663IiAWX0n67yNkla5aJFEpwfNSG5zN/Xa71qcFO8k7T4r1KwG
 1i3RuoSA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pBEFk-00Ac7z-KR; Fri, 30 Dec 2022 12:12:48 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pBEFZ-005Nvk-Az; Fri, 30 Dec 2022 12:12:37 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
Subject: [RFC PATCH v5 09/52] hw/xen_backend: refactor xen_be_init()
Date: Fri, 30 Dec 2022 12:11:52 +0000
Message-Id: <20221230121235.1282915-10-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221230121235.1282915-1-dwmw2@infradead.org>
References: <20221230121235.1282915-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+1132f1bfe572585e6c7f+7068+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Joao Martins <joao.m.martins@oracle.com>

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/xen/xen-legacy-backend.c         | 40 +++++++++++++++++++++--------
 include/hw/xen/xen-legacy-backend.h |  3 +++
 2 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index 085fd31ef7..694e7bbc54 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -676,17 +676,40 @@ void xenstore_update_fe(char *watch, struct XenLegacyDevice *xendev)
 }
 /* -------------------------------------------------------------------- */
 
-int xen_be_init(void)
+int xen_be_xenstore_open(void)
 {
-    xengnttab_handle *gnttabdev;
-
     xenstore = xs_daemon_open();
     if (!xenstore) {
-        xen_pv_printf(NULL, 0, "can't connect to xenstored\n");
         return -1;
     }
 
     qemu_set_fd_handler(xs_fileno(xenstore), xenstore_update, NULL, NULL);
+    return 0;
+}
+
+void xen_be_xenstore_close(void)
+{
+    qemu_set_fd_handler(xs_fileno(xenstore), NULL, NULL, NULL);
+    xs_daemon_close(xenstore);
+    xenstore = NULL;
+}
+
+void xen_be_sysdev_init(void)
+{
+    xen_sysdev = qdev_new(TYPE_XENSYSDEV);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(xen_sysdev), &error_fatal);
+    xen_sysbus = qbus_new(TYPE_XENSYSBUS, xen_sysdev, "xen-sysbus");
+    qbus_set_bus_hotplug_handler(xen_sysbus);
+}
+
+int xen_be_init(void)
+{
+    xengnttab_handle *gnttabdev;
+
+    if (xen_be_xenstore_open()) {
+        xen_pv_printf(NULL, 0, "can't connect to xenstored\n");
+        return -1;
+    }
 
     if (xen_xc == NULL || xen_fmem == NULL) {
         /* Check if xen_init() have been called */
@@ -701,17 +724,12 @@ int xen_be_init(void)
         xengnttab_close(gnttabdev);
     }
 
-    xen_sysdev = qdev_new(TYPE_XENSYSDEV);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(xen_sysdev), &error_fatal);
-    xen_sysbus = qbus_new(TYPE_XENSYSBUS, xen_sysdev, "xen-sysbus");
-    qbus_set_bus_hotplug_handler(xen_sysbus);
+    xen_be_sysdev_init();
 
     return 0;
 
 err:
-    qemu_set_fd_handler(xs_fileno(xenstore), NULL, NULL, NULL);
-    xs_daemon_close(xenstore);
-    xenstore = NULL;
+    xen_be_xenstore_close();
 
     return -1;
 }
diff --git a/include/hw/xen/xen-legacy-backend.h b/include/hw/xen/xen-legacy-backend.h
index be281e1f38..0aa171f6c2 100644
--- a/include/hw/xen/xen-legacy-backend.h
+++ b/include/hw/xen/xen-legacy-backend.h
@@ -42,6 +42,9 @@ int xenstore_read_fe_uint64(struct XenLegacyDevice *xendev, const char *node,
 void xen_be_check_state(struct XenLegacyDevice *xendev);
 
 /* xen backend driver bits */
+int xen_be_xenstore_open(void);
+void xen_be_xenstore_close(void);
+void xen_be_sysdev_init(void);
 int xen_be_init(void);
 void xen_be_register_common(void);
 int xen_be_register(const char *type, struct XenDevOps *ops);
-- 
2.35.3


