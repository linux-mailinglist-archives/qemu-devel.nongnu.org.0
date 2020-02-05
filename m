Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE211529A8
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Feb 2020 12:08:47 +0100 (CET)
Received: from localhost ([::1]:45022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izIY2-0003US-9i
	for lists+qemu-devel@lfdr.de; Wed, 05 Feb 2020 06:08:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45804)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1izITY-000512-AV
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 06:04:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1izITW-0000K1-6N
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 06:04:07 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:20373
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1izITW-0000F5-0U
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 06:04:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580900645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZVyc8HAjJeVJ4G3eNhyQFpiME3LD4DO/y41WEU9dTqg=;
 b=jCgvQKGu0b4ud/VJ1QDp27KuZJ81Am23+1wd3i+s6jI3WopitkOKTVto0n4M8eJMbcH3xQ
 pf+HrBaGpEpTokIGhiMFFXQpCccJbhsUhTe8BOjs7NFFXg0spk/3vV0AtTyhByVx511VNX
 vTaALScT8L520PrwB4vb8/OLag3rX2I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-KOQSnHulOcyRCr2ABH53Ew-1; Wed, 05 Feb 2020 06:04:03 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82D1F1063BA0;
 Wed,  5 Feb 2020 11:04:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64D8260BF7;
 Wed,  5 Feb 2020 11:03:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 924BA9C75; Wed,  5 Feb 2020 12:03:56 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] ui/gtk: implement show-cursor option
Date: Wed,  5 Feb 2020 12:03:53 +0100
Message-Id: <20200205110356.3491-3-kraxel@redhat.com>
In-Reply-To: <20200205110356.3491-1-kraxel@redhat.com>
References: <20200205110356.3491-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: KOQSnHulOcyRCr2ABH53Ew-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 jpewhacker@gmail.com, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/gtk.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index d18892d1de61..78b197ade4c1 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -247,6 +247,7 @@ static void gd_update_cursor(VirtualConsole *vc)
 {
     GtkDisplayState *s =3D vc->s;
     GdkWindow *window;
+    bool allow_hide_cursor =3D true;
=20
     if (vc->type !=3D GD_VC_GFX ||
         !qemu_console_is_graphic(vc->gfx.dcl.con)) {
@@ -257,8 +258,13 @@ static void gd_update_cursor(VirtualConsole *vc)
         return;
     }
=20
+    if (s->opts->has_show_cursor && s->opts->show_cursor) {
+        allow_hide_cursor =3D false;
+    }
+
     window =3D gtk_widget_get_window(GTK_WIDGET(vc->gfx.drawing_area));
-    if (s->full_screen || qemu_input_is_absolute() || s->ptr_owner =3D=3D =
vc) {
+    if (allow_hide_cursor &&
+        (s->full_screen || qemu_input_is_absolute() || s->ptr_owner =3D=3D=
 vc)) {
         gdk_window_set_cursor(window, s->null_cursor);
     } else {
         gdk_window_set_cursor(window, NULL);
--=20
2.18.1


