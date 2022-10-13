Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF235FD581
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 09:24:08 +0200 (CEST)
Received: from localhost ([::1]:36208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oisZb-00077W-3V
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 03:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois6K-0005YA-4e
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:53:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois6G-0006uv-C8
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:53:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665644027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4MzkiQ/sH44QWYKfHCb/ilLhOtedG8MbjbTBT3JxfhY=;
 b=i3Er8hNmKt/F+eCBhf7WBGO+qQPbL9j6q05VI7T6XSxEi8L4hS+Cqu1zkgSl8gsoUscCVv
 QsY1yxg8By4HLh12F1Z7YJcCPtW8dNQxnMIZdMh3ZU9YhWKMo7DHML/iugnsag6xwITfWW
 qFwcx6ZjMzrOonu121Mk4VieZVj5AQg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-qjVaNvQpMEyOZ6HLlggcUw-1; Thu, 13 Oct 2022 02:53:43 -0400
X-MC-Unique: qjVaNvQpMEyOZ6HLlggcUw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3BDDF185A79C;
 Thu, 13 Oct 2022 06:53:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD068C15BB5;
 Thu, 13 Oct 2022 06:53:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 984F81800D58; Thu, 13 Oct 2022 08:52:25 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PULL 22/26] ui/gtk: Fix the implicit mouse ungrabbing logic
Date: Thu, 13 Oct 2022 08:52:20 +0200
Message-Id: <20221013065224.1864145-23-kraxel@redhat.com>
In-Reply-To: <20221013065224.1864145-1-kraxel@redhat.com>
References: <20221013065224.1864145-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@daynix.com>

Although the grab menu item represents the tabbed displays, the old
implicit mouse ungrabbing logic changes the grab menu item even for
an untabbed display.

Leave the grab menu item when implicitly ungrabbing mouse for an
untabbed display. The new ungrabbing logic introduced in
gd_mouse_mode_change() strictly follows the corresponding grabbing
logic found in gd_button_event().

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20221008140116.11473-1-akihiko.odaki@daynix.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/gtk.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 1467b8c7d7f0..6fc2e2396393 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -681,9 +681,13 @@ static void gd_mouse_mode_change(Notifier *notify, void *data)
 
     s = container_of(notify, GtkDisplayState, mouse_mode_notifier);
     /* release the grab at switching to absolute mode */
-    if (qemu_input_is_absolute() && gd_is_grab_active(s)) {
-        gtk_check_menu_item_set_active(GTK_CHECK_MENU_ITEM(s->grab_item),
-                                       FALSE);
+    if (qemu_input_is_absolute() && s->ptr_owner) {
+        if (!s->ptr_owner->window) {
+            gtk_check_menu_item_set_active(GTK_CHECK_MENU_ITEM(s->grab_item),
+                                           FALSE);
+        } else {
+            gd_ungrab_pointer(s);
+        }
     }
     for (i = 0; i < s->nb_vcs; i++) {
         VirtualConsole *vc = &s->vc[i];
-- 
2.37.3


