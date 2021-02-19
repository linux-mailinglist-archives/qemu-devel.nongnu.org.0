Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D01D131F9D9
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 14:22:28 +0100 (CET)
Received: from localhost ([::1]:44712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD5jn-0001RG-R3
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 08:22:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lD5bg-0004A8-Tz
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:14:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lD5bd-0006OZ-S7
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:14:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613740441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rQw1JyPioEG61sPokozmCTDZpK/dfl0sk44WZbQbTig=;
 b=ArOl0qBMnaGZn6myDCHNe2GFW2Cybm3ubxLBl4O63b5Nm5+yG3rhIAGt8n+b3ubUTdatw+
 WGO/pC1CMd1mwPzfcYYDjm+C55LY1gNdTpelItNAsNeSIbH7mZD5BloAX47kq4BrIrjOJw
 XLUwQ6bMa+en7jojpp/PF+PVOMgGN0k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-5aJTmWGKMSuU66Cj_0JZLA-1; Fri, 19 Feb 2021 08:13:59 -0500
X-MC-Unique: 5aJTmWGKMSuU66Cj_0JZLA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65855801982
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 13:13:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FD1910016F9;
 Fri, 19 Feb 2021 13:13:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F0A0E18000B6; Fri, 19 Feb 2021 14:13:49 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] ui: add clipboard infrastructure
Date: Fri, 19 Feb 2021 14:13:43 +0100
Message-Id: <20210219131349.3993192-2-kraxel@redhat.com>
In-Reply-To: <20210219131349.3993192-1-kraxel@redhat.com>
References: <20210219131349.3993192-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add some infrastructure to manage the clipboard in qemu.

TODO: Add API docs.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/clipboard.h | 68 +++++++++++++++++++++++++++++++
 ui/clipboard.c         | 92 ++++++++++++++++++++++++++++++++++++++++++
 ui/meson.build         |  1 +
 3 files changed, 161 insertions(+)
 create mode 100644 include/ui/clipboard.h
 create mode 100644 ui/clipboard.c

diff --git a/include/ui/clipboard.h b/include/ui/clipboard.h
new file mode 100644
index 000000000000..00ff559425ee
--- /dev/null
+++ b/include/ui/clipboard.h
@@ -0,0 +1,68 @@
+#ifndef QEMU_CLIPBOARD_H
+#define QEMU_CLIPBOARD_H
+
+#include "qemu/notify.h"
+
+typedef enum QemuClipboardType QemuClipboardType;
+typedef enum QemuClipboardSelection QemuClipboardSelection;
+typedef struct QemuClipboardPeer QemuClipboardPeer;
+typedef struct QemuClipboardInfo QemuClipboardInfo;
+
+enum QemuClipboardType {
+    QEMU_CLIPBOARD_TYPE_TEXT,  /* text/plain; charset=utf-8 */
+    QEMU_CLIPBOARD_TYPE__COUNT,
+};
+
+/* same as VD_AGENT_CLIPBOARD_SELECTION_* */
+enum QemuClipboardSelection {
+    QEMU_CLIPBOARD_SELECTION_CLIPBOARD,
+    QEMU_CLIPBOARD_SELECTION_PRIMARY,
+    QEMU_CLIPBOARD_SELECTION_SECONDARY,
+    QEMU_CLIPBOARD_SELECTION__COUNT,
+};
+
+struct QemuClipboardPeer {
+    const char *name;
+    Notifier update;
+    void (*request)(QemuClipboardInfo *info,
+                    QemuClipboardType type);
+};
+
+struct QemuClipboardInfo {
+    uint32_t refcount;
+    QemuClipboardPeer *owner;
+    QemuClipboardSelection selection;
+    struct {
+        bool available;
+        bool requested;
+        size_t size;
+        void *data;
+    } types[QEMU_CLIPBOARD_TYPE__COUNT];
+};
+
+struct QemuClipboardData {
+    uint32_t refcount;
+    QemuClipboardInfo *info;
+    QemuClipboardType type;
+};
+
+void qemu_clipboard_peer_register(QemuClipboardPeer *peer);
+void qemu_clipboard_peer_unregister(QemuClipboardPeer *peer);
+
+QemuClipboardInfo *qemu_clipboard_info_new(QemuClipboardPeer *owner,
+                                           QemuClipboardSelection selection);
+QemuClipboardInfo *qemu_clipboard_info_get(QemuClipboardInfo *info);
+void qemu_clipboard_info_put(QemuClipboardInfo *info);
+
+void qemu_clipboard_update(QemuClipboardInfo *info);
+void qemu_clipboard_request(QemuClipboardInfo *info,
+                            QemuClipboardType type);
+
+void qemu_clipboard_set_data(QemuClipboardPeer *peer,
+                             QemuClipboardInfo *info,
+                             QemuClipboardType type,
+                             uint32_t size,
+                             void *data,
+                             bool update);
+
+#endif /* QEMU_CLIPBOARD_H */
diff --git a/ui/clipboard.c b/ui/clipboard.c
new file mode 100644
index 000000000000..556531c578a1
--- /dev/null
+++ b/ui/clipboard.c
@@ -0,0 +1,92 @@
+#include "qemu/osdep.h"
+#include "ui/clipboard.h"
+
+static NotifierList clipboard_notifiers =
+    NOTIFIER_LIST_INITIALIZER(clipboard_notifiers);
+
+void qemu_clipboard_peer_register(QemuClipboardPeer *peer)
+{
+    notifier_list_add(&clipboard_notifiers, &peer->update);
+}
+
+void qemu_clipboard_peer_unregister(QemuClipboardPeer *peer)
+{
+    notifier_remove(&peer->update);
+}
+
+void qemu_clipboard_update(QemuClipboardInfo *info)
+{
+    notifier_list_notify(&clipboard_notifiers, info);
+}
+
+QemuClipboardInfo *qemu_clipboard_info_new(QemuClipboardPeer *owner,
+                                           QemuClipboardSelection selection)
+{
+    QemuClipboardInfo *info = g_new0(QemuClipboardInfo, 1);
+
+    info->owner = owner;
+    info->selection = selection;
+    info->refcount = 1;
+
+    return info;
+}
+
+QemuClipboardInfo *qemu_clipboard_info_get(QemuClipboardInfo *info)
+{
+    info->refcount++;
+    return info;
+}
+
+void qemu_clipboard_info_put(QemuClipboardInfo *info)
+{
+    uint32_t type;
+
+    if (!info) {
+        return;
+    }
+
+    info->refcount--;
+    if (info->refcount > 0) {
+        return;
+    }
+
+    for (type = 0; type < QEMU_CLIPBOARD_TYPE__COUNT; type++) {
+        g_free(info->types[type].data);
+    }
+    g_free(info);
+}
+
+void qemu_clipboard_request(QemuClipboardInfo *info,
+                            QemuClipboardType type)
+{
+    if (info->types[type].data ||
+        info->types[type].requested ||
+        !info->types[type].available ||
+        !info->owner)
+        return;
+
+    info->types[type].requested = true;
+    info->owner->request(info, type);
+}
+
+void qemu_clipboard_set_data(QemuClipboardPeer *peer,
+                             QemuClipboardInfo *info,
+                             QemuClipboardType type,
+                             uint32_t size,
+                             void *data,
+                             bool update)
+{
+    if (!info ||
+        info->owner != peer) {
+        return;
+    }
+
+    g_free(info->types[type].data);
+    info->types[type].data = g_memdup(data, size);
+    info->types[type].size = size;
+    info->types[type].available = true;
+
+    if (update) {
+        qemu_clipboard_update(info);
+    }
+}
diff --git a/ui/meson.build b/ui/meson.build
index 156b600a9998..fbb9a512042a 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -2,6 +2,7 @@ softmmu_ss.add(pixman)
 specific_ss.add(when: ['CONFIG_SOFTMMU'], if_true: pixman)   # for the include path
 
 softmmu_ss.add(files(
+  'clipboard.c',
   'console.c',
   'cursor.c',
   'input-keymap.c',
-- 
2.29.2


