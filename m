Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABE415AD4D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Feb 2020 17:23:45 +0100 (CET)
Received: from localhost ([::1]:40024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1ung-00023P-76
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 11:23:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33567)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1j1uj6-0001y4-Hn
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 11:19:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1j1uj5-0004lS-IM
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 11:19:00 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26806
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1j1uj5-0004kf-EZ
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 11:18:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581524339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0UieOV73AiBm51CMiies0SzIbjpyynbNGnm+Kn4I9e0=;
 b=Xz3MGv1LmM/zK0ZBbGA9+nwuDuEHbIMIP+qFTr6FjCR9AFWof3mcVPotK3mtBx/q6eSmdl
 G3+CKqhWLxqm2juAq6Jums/xN3sTV7KERNG0DomO1yt7OLlwokk4sP4BoW4dYRcB4skfoU
 FrRaOARI9K93vz7zn24QceivZBJ9sZw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276--Kmofeb8MLmH0mKaeHijdQ-1; Wed, 12 Feb 2020 11:18:55 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C7B1133656D;
 Wed, 12 Feb 2020 16:18:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com
 [10.36.117.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 686D227063;
 Wed, 12 Feb 2020 16:18:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 10C6D31EA0; Wed, 12 Feb 2020 17:18:36 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/10] ui/gtk: implement show-cursor option
Date: Wed, 12 Feb 2020 17:18:32 +0100
Message-Id: <20200212161835.28576-8-kraxel@redhat.com>
In-Reply-To: <20200212161835.28576-1-kraxel@redhat.com>
References: <20200212161835.28576-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: -Kmofeb8MLmH0mKaeHijdQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When specified just set null_cursor to NULL so we get the default
pointer instead of a blank pointer.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: J=C3=A1n Tomko <jtomko@redhat.com>
---
 ui/gtk.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 850c49bee02a..f3f0af8921d9 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -2246,8 +2246,12 @@ static void gtk_display_init(DisplayState *ds, Displ=
ayOptions *opts)
     textdomain("qemu");
=20
     window_display =3D gtk_widget_get_display(s->window);
-    s->null_cursor =3D gdk_cursor_new_for_display(window_display,
-                                                GDK_BLANK_CURSOR);
+    if (s->opts->has_show_cursor && s->opts->show_cursor) {
+        s->null_cursor =3D NULL; /* default pointer */
+    } else {
+        s->null_cursor =3D gdk_cursor_new_for_display(window_display,
+                                                    GDK_BLANK_CURSOR);
+    }
=20
     s->mouse_mode_notifier.notify =3D gd_mouse_mode_change;
     qemu_add_mouse_mode_change_notifier(&s->mouse_mode_notifier);
--=20
2.18.2


