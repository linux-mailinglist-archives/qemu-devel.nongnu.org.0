Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FAD3D0ABA
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 10:52:36 +0200 (CEST)
Received: from localhost ([::1]:51354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m67y0-0001EG-0p
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 04:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m67p1-0001pg-Mm
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:43:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m67p0-0005ot-97
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:43:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626856997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1JN7UrKol7qbbldXYzHlGAwiFdzqulFx27Pl4PCm2Ok=;
 b=ah7v30h7QOnT8v9iq3lizHxtuQlSHe0rhRBQ3GTvocME3O8TP0/fXP85d8etobfYVE2HyC
 yKcj8akthTdOG/4/GLe6Rh+qp7nC5PlqC/oMvhaIphYJsABE7HQwiWay5ziR/vD/Ym26k2
 shNkoLekU0q5/PP1c+hkb9XnD3nsnnU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-X1BG1H5KNUW6HT1Vlz6dHQ-1; Wed, 21 Jul 2021 04:43:16 -0400
X-MC-Unique: X1BG1H5KNUW6HT1Vlz6dHQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A193A800D62
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 08:43:15 +0000 (UTC)
Received: from localhost (unknown [10.36.110.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53EBD19C79;
 Wed, 21 Jul 2021 08:43:07 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/13] ui/gtk-clipboard: emit release clipboard events
Date: Wed, 21 Jul 2021 12:41:39 +0400
Message-Id: <20210721084139.1124779-14-marcandre.lureau@redhat.com>
In-Reply-To: <20210721084139.1124779-1-marcandre.lureau@redhat.com>
References: <20210721084139.1124779-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 ui/gtk-clipboard.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/ui/gtk-clipboard.c b/ui/gtk-clipboard.c
index 4e4b3c52bb..16b2e2063e 100644
--- a/ui/gtk-clipboard.c
+++ b/ui/gtk-clipboard.c
@@ -144,7 +144,7 @@ static void gd_owner_change(GtkClipboard *clipboard,
 {
     GtkDisplayState *gd = data;
     QemuClipboardSelection s = gd_find_selection(gd, clipboard);
-    QemuClipboardInfo *info;
+    g_autoptr(QemuClipboardInfo) info = NULL;
 
     if (gd->cbowner[s]) {
         /* ignore notifications about our own grabs */
@@ -158,13 +158,13 @@ static void gd_owner_change(GtkClipboard *clipboard,
         if (gtk_clipboard_wait_is_text_available(clipboard)) {
             info->types[QEMU_CLIPBOARD_TYPE_TEXT].available = true;
         }
-
-        qemu_clipboard_update(info);
-        qemu_clipboard_info_unref(info);
         break;
     default:
+        info = qemu_clipboard_info_new(NULL, s);
+        gd->cbowner[s] = false;
         break;
     }
+    qemu_clipboard_update(info);
 }
 
 void gd_clipboard_init(GtkDisplayState *gd)
-- 
2.32.0.264.g75ae10bc75


