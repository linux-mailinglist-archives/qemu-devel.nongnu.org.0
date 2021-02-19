Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C00231F9DE
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 14:24:57 +0100 (CET)
Received: from localhost ([::1]:49838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD5mC-0003l7-Ks
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 08:24:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lD5bh-0004Cp-Ln
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:14:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lD5bf-0006Oo-D9
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:14:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613740442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zQ2hJwfYBzzfkQXu+muAOvP35Q/ovmW8b86tbNjeq80=;
 b=Tt0varUJCYKMNiuwpjH53Sb5JVgju0imxVxNWGHFlfVr1vUsuoDSezhfDeFHksPGPy9Cgx
 1XbRmTViJ3OVDdK2rDhIZtB0PkpPYBEfhULm3aYZwpIeOBe0WvieR/f391Zq/TeBv6EHw/
 HcnWBwNXtw80hmAxUHQvPflT+Vtm4ms=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-5uNk6P_LPhmdzGEnkZbxWg-1; Fri, 19 Feb 2021 08:14:00 -0500
X-MC-Unique: 5uNk6P_LPhmdzGEnkZbxWg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E50A0801991
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 13:13:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CFF119D9B;
 Fri, 19 Feb 2021 13:13:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E2EC618000A2; Fri, 19 Feb 2021 14:13:49 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] ui: add vdagent implementation and clipboard support.
Date: Fri, 19 Feb 2021 14:13:42 +0100
Message-Id: <20210219131349.3993192-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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
Enjoy!=0D
=0D
Gerd Hoffmann (7):=0D
  ui: add clipboard infrastructure=0D
  ui/vdagent: core infrastructure=0D
  ui/vdagent: add mouse support=0D
  ui/vdagent: add clipboard support=0D
  ui/vnc: clipboard support=0D
  ui/gtk: move struct GtkDisplayState to ui/gtk.h=0D
  ui/gtk: add clipboard support=0D
=0D
 include/ui/clipboard.h |  68 +++++=0D
 include/ui/gtk.h       |  66 +++++=0D
 ui/vnc.h               |  24 ++=0D
 chardev/char.c         |   6 +=0D
 ui/clipboard.c         |  92 ++++++=0D
 ui/gtk-clipboard.c     | 124 ++++++++=0D
 ui/gtk.c               |  56 +---=0D
 ui/vdagent.c           | 624 +++++++++++++++++++++++++++++++++++++++++=0D
 ui/vnc-clipboard.c     | 326 +++++++++++++++++++++=0D
 ui/vnc.c               |  20 +-=0D
 qapi/char.json         |  17 ++=0D
 ui/meson.build         |   5 +-=0D
 ui/trace-events        |   9 +=0D
 13 files changed, 1375 insertions(+), 62 deletions(-)=0D
 create mode 100644 include/ui/clipboard.h=0D
 create mode 100644 ui/clipboard.c=0D
 create mode 100644 ui/gtk-clipboard.c=0D
 create mode 100644 ui/vdagent.c=0D
 create mode 100644 ui/vnc-clipboard.c=0D
=0D
--=20=0D
2.29.2=0D
=0D


