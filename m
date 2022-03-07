Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9C24CF2EC
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 08:49:23 +0100 (CET)
Received: from localhost ([::1]:38320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR87O-0006Eg-8V
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 02:49:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nR84u-0003vO-Mk
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:46:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nR84t-00076M-6i
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:46:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646639206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HN8lHK+jQ5LWkY4EhuOIwOr9GBiRofx1nRSc2V5g1kg=;
 b=fQ6619w5HB+3y+n+X+fHewB16orCLamdSt3jb3DEIcPgtPojX1G6j6NqsmJduWM3TvaJNB
 4gBlFTtOkgyrVAhg1RRIy9F1i1Pl9HjjSldXLkHsvChSHKrXpLi68Wdil04XNRq6Vi0uRd
 h0kax8StitS+m79zHoWrUupGZ75y16Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-ujzRPOXxPsC9dc-8DIQorg-1; Mon, 07 Mar 2022 02:46:45 -0500
X-MC-Unique: ujzRPOXxPsC9dc-8DIQorg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70F1D1091DA0;
 Mon,  7 Mar 2022 07:46:44 +0000 (UTC)
Received: from localhost (unknown [10.39.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA78279445;
 Mon,  7 Mar 2022 07:46:36 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/12] GL & D-Bus display related fixes
Date: Mon,  7 Mar 2022 11:46:20 +0400
Message-Id: <20220307074632.238049-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 Gerd Hoffmann <kraxel@redhat.com>, akihiko.odaki@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

Hi,=0D
=0D
Here are pending fixes related to D-Bus and GL, most of them reported thank=
s to=0D
Akihiko Odaki.=0D
=0D
v3:=0D
 - rebased=0D
 - add "ui/dbus: do not send 2d scanout until gfx_update" & "ui/console: ca=
ll=0D
   gfx_switch() even if the current scanout is GL"=0D
=0D
Marc-Andr=C3=A9 Lureau (12):=0D
  ui/console: move check for compatible GL context=0D
  ui/console: move dcl compatiblity check to a callback=0D
  ui/console: egl-headless is compatible with non-gl listeners=0D
  ui/dbus: associate the DBusDisplayConsole listener with the given=0D
    console=0D
  ui/console: move console compatibility check to dcl_display_console()=0D
  ui/shader: fix potential leak of shader on error=0D
  ui/shader: free associated programs=0D
  ui/console: add a dpy_gfx_switch callback helper=0D
  ui/console: optionally update after gfx switch=0D
  ui/dbus: fix texture sharing=0D
  ui/dbus: do not send 2d scanout until gfx_update=0D
  ui/console: call gfx_switch() even if the current scanout is GL=0D
=0D
 include/ui/console.h |  19 +++++---=0D
 ui/dbus.h            |   3 ++=0D
 ui/console.c         | 102 ++++++++++++++++++++++++++-----------------=0D
 ui/dbus-console.c    |  27 ++++++------=0D
 ui/dbus-listener.c   |  48 +++++++++-----------=0D
 ui/dbus.c            |  35 ++++++++++++++-=0D
 ui/egl-headless.c    |  17 +++++++-=0D
 ui/gtk.c             |  18 +++++++-=0D
 ui/sdl2.c            |   9 +++-=0D
 ui/shader.c          |   9 +++-=0D
 ui/spice-display.c   |   9 +++-=0D
 11 files changed, 200 insertions(+), 96 deletions(-)=0D
=0D
--=20=0D
2.35.1.273.ge6ebfd0e8cbb=0D
=0D


