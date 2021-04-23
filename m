Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8D6368EEA
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 10:36:08 +0200 (CEST)
Received: from localhost ([::1]:52910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZrIF-000208-5Q
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 04:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lZrGP-0000Yd-AL
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 04:34:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lZrGI-0001IR-Th
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 04:34:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619166845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9oCTLap447icp7bg56r5GYZ3ib7wsi2EbKqB3PJggBg=;
 b=WpaLPf4Zu7j47F7jUJvnShI3D4MSZ//iZzIO1+1sqYxbS0amijbkZCmSPawnS/AEfvJwnP
 di8alFZg3AeTxdU4+8pceozS+5UCYXKvCo+WGJIcewM0fs3YDdLZDNExwzvqxlZvxLDoI2
 zyl7H7w9+eT35TNRvcF7+gIIaqB+7Ec=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-VNy5GvIEMLqqtmCy8icyZA-1; Fri, 23 Apr 2021 04:34:01 -0400
X-MC-Unique: VNy5GvIEMLqqtmCy8icyZA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB39C107ACC7
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 08:34:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-178.ams2.redhat.com
 [10.36.112.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CA275D9C6;
 Fri, 23 Apr 2021 08:33:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D290F1800604; Fri, 23 Apr 2021 10:33:51 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/9] ui: add vdagent implementation and clipboard support.
Date: Fri, 23 Apr 2021 10:33:42 +0200
Message-Id: <20210423083351.2096734-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fist sketch of cut+paste support for vnc.  On the guest side we are=0D
going to reuse the spice vdagent, so things should work out-of-the-box=0D
with guests in the wild.  So this patch set brings a qemu implemenation=0D
of the vdagent protocol.=0D
=0D
Beside that there is the clipboard infrastructure of course.  For now=0D
only text support is there.  The design allows adding more data types,=0D
so we can add image support and maybe more later on.  So far vdagent,=0D
vnc server and gtk ui are hooked up.=0D
=0D
Usage: qemu \=0D
  -chardev vdagent,id=3Dvdagent,clipboard=3Don \=0D
  -device virtio-serial-pci \=0D
  -device virtserialport,chardev=3Dvdagent,name=3Dcom.redhat.spice.0=0D
=0D
v3:=0D
 - rebase to latest master.=0D
 - make spice-protocol a separate build dependency.=0D
 - update qapi version annotation.=0D
 - add documentatin for qemu clipboard.=0D
 - misc little tweaks.=0D
v2:=0D
 - add a bunch of sanity checks.=0D
 - add proper chunking.=0D
 - use autofree.=0D
v3:=0D
 - support agents without VD_AGENT_CAP_CLIPBOARD_SELECTION.=0D
 - properly parse chunked messages.=0D
 - test with windows guests, minor fixes.=0D
 - set display_id for agent mouse events.=0D
=0D
Gerd Hoffmann (9):=0D
  build: add separate spice-protocol config option=0D
  ui: add clipboard infrastructure=0D
  ui: add clipboard documentation=0D
  ui/vdagent: core infrastructure=0D
  ui/vdagent: add mouse support=0D
  ui/vdagent: add clipboard support=0D
  ui/vnc: clipboard support=0D
  ui/gtk: move struct GtkDisplayState to ui/gtk.h=0D
  ui/gtk: add clipboard support=0D
=0D
 configure              |  36 +-=0D
 include/ui/clipboard.h | 193 +++++++++++=0D
 include/ui/gtk.h       |  67 ++++=0D
 ui/vnc.h               |  24 ++=0D
 chardev/char.c         |   6 +=0D
 ui/clipboard.c         |  92 +++++=0D
 ui/gtk-clipboard.c     | 192 +++++++++++=0D
 ui/gtk.c               |  56 +--=0D
 ui/vdagent.c           | 756 +++++++++++++++++++++++++++++++++++++++++=0D
 ui/vnc-clipboard.c     | 323 ++++++++++++++++++=0D
 ui/vnc.c               |  20 +-=0D
 docs/devel/index.rst   |   1 +=0D
 docs/devel/ui.rst      |   8 +=0D
 meson.build            |   4 +=0D
 qapi/char.json         |  21 +-=0D
 ui/meson.build         |   5 +-=0D
 ui/trace-events        |  10 +=0D
 17 files changed, 1747 insertions(+), 67 deletions(-)=0D
 create mode 100644 include/ui/clipboard.h=0D
 create mode 100644 ui/clipboard.c=0D
 create mode 100644 ui/gtk-clipboard.c=0D
 create mode 100644 ui/vdagent.c=0D
 create mode 100644 ui/vnc-clipboard.c=0D
 create mode 100644 docs/devel/ui.rst=0D
=0D
--=20=0D
2.30.2=0D
=0D


