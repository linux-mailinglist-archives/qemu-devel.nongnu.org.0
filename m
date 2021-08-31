Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C97903FC922
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 15:58:10 +0200 (CEST)
Received: from localhost ([::1]:40670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL4HB-0007Ww-SN
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 09:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mL3um-0002tu-5w
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 09:35:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mL3ug-0001FJ-Ra
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 09:34:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630416894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xU/VN7bvDDvNA1ji619aXXCC7BwE5g5sFdIhP7GrQQw=;
 b=HaS5JocK9LNbapNhTK5UiwuAjyuQsC4OeU9bdRke2B26CTn4DtaUA9CLuy/M3v4KmHOXQ8
 /7tyXtrkaUqBzd2QMw5r1nWnHZnOCNtbMeKfHKgMdf4oFfadt7VEYy/IGgnsAG6/dp2vJ0
 BWfz79erfOYWQsZ2JNtGHi43WZNtSJQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-pySoLIhfNHOWO4uqLA0UnA-1; Tue, 31 Aug 2021 09:34:52 -0400
X-MC-Unique: pySoLIhfNHOWO4uqLA0UnA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C44E93921;
 Tue, 31 Aug 2021 13:34:51 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8FE5F5D9D5;
 Tue, 31 Aug 2021 13:34:42 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 15/18] ui/gtk-clipboard: use qemu_clipboard_info helper
Date: Tue, 31 Aug 2021 17:31:29 +0400
Message-Id: <20210831133132.1697228-16-marcandre.lureau@redhat.com>
In-Reply-To: <20210831133132.1697228-1-marcandre.lureau@redhat.com>
References: <20210831133132.1697228-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210805135715.857938-16-marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/gtk.h   |  1 -
 ui/gtk-clipboard.c | 14 ++++++--------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index 80d6bbd9b5..7835ef1a71 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -143,7 +143,6 @@ struct GtkDisplayState {
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
2.33.0.rc2


