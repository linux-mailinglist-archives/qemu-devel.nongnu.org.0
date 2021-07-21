Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F34B13D0AC0
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 10:54:52 +0200 (CEST)
Received: from localhost ([::1]:57338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m680C-0005FE-2v
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 04:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m67ol-000115-FX
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:43:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m67oj-0005ct-N8
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:43:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626856981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j9c83z6wiL8GF/bT0bHj/Ul4bxjF1Y2+EXIDB94Ucig=;
 b=TccvDifWnADPCsKBn1+j79QyaEaXGgLmTahyWL3YhrN7Sobr/1Ux/BhG8INwyhgQIiPHHr
 PWB1UHZO3KBoFnzVmcJ8B9SYo/gH3/35MK5Y3vUzK+ZjamFtJ5Xkt3ST9YyJryeDi6Mvxg
 FZpjI2Rz/22qNAl4WGIUXAYNxkoskIU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-U0PKzoMkOGG8BHMi0kn1Kg-1; Wed, 21 Jul 2021 04:42:59 -0400
X-MC-Unique: U0PKzoMkOGG8BHMi0kn1Kg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDAA210150A5
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 08:42:58 +0000 (UTC)
Received: from localhost (unknown [10.36.110.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F9C160BF1;
 Wed, 21 Jul 2021 08:42:57 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/13] ui/gtk-clipboard: use qemu_clipboard_info helper
Date: Wed, 21 Jul 2021 12:41:37 +0400
Message-Id: <20210721084139.1124779-12-marcandre.lureau@redhat.com>
In-Reply-To: <20210721084139.1124779-1-marcandre.lureau@redhat.com>
References: <20210721084139.1124779-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/gtk.h   |  1 -
 ui/gtk-clipboard.c | 14 ++++++--------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index 9516670ebc..60e9cdc39c 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -139,7 +139,6 @@ struct GtkDisplayState {
     bool external_pause_update;
 
     QemuClipboardPeer cbpeer;
-    QemuClipboardInfo *cbinfo[QEMU_CLIPBOARD_SELECTION__COUNT];
     uint32_t cbpending[QEMU_CLIPBOARD_SELECTION__COUNT];
     GtkClipboard *gtkcb[QEMU_CLIPBOARD_SELECTION__COUNT];
     bool cbowner[QEMU_CLIPBOARD_SELECTION__COUNT];
diff --git a/ui/gtk-clipboard.c b/ui/gtk-clipboard.c
index 2c78de9500..4e4b3c52bb 100644
--- a/ui/gtk-clipboard.c
+++ b/ui/gtk-clipboard.c
@@ -45,24 +45,24 @@ static void gd_clipboard_get_data(GtkClipboard     *clipboard,
     GtkDisplayState *gd = data;
     QemuClipboardSelection s = gd_find_selection(gd, clipboard);
     QemuClipboardType type = QEMU_CLIPBOARD_TYPE_TEXT;
-    QemuClipboardInfo *info = qemu_clipboard_info_ref(gd->cbinfo[s]);
+    g_autoptr(QemuClipboardInfo) info = NULL;
+
+    info = qemu_clipboard_info_ref(qemu_clipboard_info(s));
 
     qemu_clipboard_request(info, type);
-    while (info == gd->cbinfo[s] &&
+    while (info == qemu_clipboard_info(s) &&
            info->types[type].available &&
            info->types[type].data == NULL) {
         main_loop_wait(false);
     }
 
-    if (info == gd->cbinfo[s] && gd->cbowner[s]) {
+    if (info == qemu_clipboard_info(s) && gd->cbowner[s]) {
         gtk_selection_data_set_text(selection_data,
                                     info->types[type].data,
                                     info->types[type].size);
     } else {
         /* clipboard owner changed while waiting for the data */
     }
-
-    qemu_clipboard_info_unref(info);
 }
 
 static void gd_clipboard_clear(GtkClipboard *clipboard,
@@ -81,9 +81,7 @@ static void gd_clipboard_notify(Notifier *notifier, void *data)
     QemuClipboardSelection s = info->selection;
     bool self_update = info->owner == &gd->cbpeer;
 
-    if (info != gd->cbinfo[s]) {
-        qemu_clipboard_info_unref(gd->cbinfo[s]);
-        gd->cbinfo[s] = qemu_clipboard_info_ref(info);
+    if (info != qemu_clipboard_info(s)) {
         gd->cbpending[s] = 0;
         if (!self_update) {
             GtkTargetList *list;
-- 
2.32.0.264.g75ae10bc75


