Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F8B4BA010
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 13:26:07 +0100 (CET)
Received: from localhost ([::1]:58830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKfrK-0006Kn-My
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 07:26:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nKfR1-0004jW-Gj
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 06:58:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nKfQz-0001AV-Dw
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 06:58:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645099132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JJGnGuAqxcXfReonFjCCgHslcz3pX1mYMkTYEQGCM20=;
 b=LqFGtz09y5NO9G4Q5StMrxXeTmrv18zxksBOMrnDAzLS+oOu2JQ5g6oEk17Zf9eNvRwx+D
 oH48J5HW7/P75nFM6ZyNouHZw9TcJxSSh7xikih1IULMO0qDbro/ZvJkNNweuva6W80Aeu
 n8EPrGbPaikhYhitPkfA9etnSORRd/s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-mfIzWhpUOlWYHpWDSkHMWg-1; Thu, 17 Feb 2022 06:58:51 -0500
X-MC-Unique: mfIzWhpUOlWYHpWDSkHMWg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78FD6185302C;
 Thu, 17 Feb 2022 11:58:50 +0000 (UTC)
Received: from localhost (unknown [10.39.208.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C200A7C0CB;
 Thu, 17 Feb 2022 11:58:32 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/12] GL & D-Bus display related fixes
Date: Thu, 17 Feb 2022 15:58:17 +0400
Message-Id: <20220217115829.2314347-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 kraxel@redhat.com, akihiko.odaki@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

Hi,=0D
=0D
In the thread "[PATCH 0/6] ui/dbus: Share one listener for a console", Akih=
iko=0D
Odaki reported a number of issues with the GL and D-Bus display. His series=
=0D
propose a different design, and reverting some of my previous generic conso=
le=0D
changes to fix those issues.=0D
=0D
However, as I work through the issue so far, they can be solved by reasonab=
le=0D
simple fixes while keeping the console changes generic (not specific to the=
=0D
D-Bus display backend). I belive a shared infrastructure is more beneficial=
 long=0D
term than having GL-specific code in the DBus code (in particular, the=0D
egl-headless & VNC combination could potentially use it)=0D
=0D
Thanks a lot Akihiko for reporting the issues proposing a different approac=
h!=0D
Please test this alternative series and let me know of any further issues. =
My=0D
understanding is that you are mainly concerned with the Cocoa backend, and =
I=0D
don't have a way to test it, so please check it. If necessary, we may well =
have=0D
to revert my earlier changes and go your way, eventually.=0D
=0D
Marc-Andr=C3=A9 Lureau (12):=0D
  ui/console: fix crash when using gl context with non-gl listeners=0D
  ui/console: fix texture leak when calling surface_gl_create_texture()=0D
  ui: do not create a surface when resizing a GL scanout=0D
  ui/console: move check for compatible GL context=0D
  ui/console: move dcl compatiblity check to a callback=0D
  ui/console: egl-headless is compatible with non-gl listeners=0D
  ui/dbus: associate the DBusDisplayConsole listener with the given=0D
    console=0D
  ui/console: move console compatibility check to dcl_display_console()=0D
  ui/shader: fix potential leak of shader on error=0D
  ui/shader: free associated programs=0D
  ui/console: add a dpy_gfx_switch callback helper=0D
  ui/dbus: fix texture sharing=0D
=0D
 include/ui/console.h |  19 ++++---=0D
 ui/dbus.h            |   3 ++=0D
 ui/console-gl.c      |   4 ++=0D
 ui/console.c         | 119 ++++++++++++++++++++++++++-----------------=0D
 ui/dbus-console.c    |  27 +++++-----=0D
 ui/dbus-listener.c   |  11 ----=0D
 ui/dbus.c            |  33 +++++++++++-=0D
 ui/egl-headless.c    |  17 ++++++-=0D
 ui/gtk.c             |  18 ++++++-=0D
 ui/sdl2.c            |   9 +++-=0D
 ui/shader.c          |   9 +++-=0D
 ui/spice-display.c   |   9 +++-=0D
 12 files changed, 192 insertions(+), 86 deletions(-)=0D
=0D
--=20=0D
2.34.1.428.gdcc0cd074f0c=0D
=0D


