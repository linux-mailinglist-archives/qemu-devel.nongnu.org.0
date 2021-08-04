Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D48193E06F8
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 19:52:56 +0200 (CEST)
Received: from localhost ([::1]:51486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBL4Z-0001qM-Tq
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 13:52:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBJ8n-0000ph-Gh
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 11:49:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBJ8h-0005yU-U8
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 11:49:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628092140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xmhssaHGKTGvycWi9tCeSFuNy8WHpKhxlaDH2+JiN+w=;
 b=a/p0Ncww7dr90MndWUWtQ07Lhng7InmJ3gkmDR4rrs5JlFZO1YM/G+ApwQFXC/g6IjdvRg
 90+EqvgTQETyNDFkV3ghqeSHDsbqDUPDSDqA2VKxYXYTgnzY/sTAsHif9ihYecn19nwi2T
 iNxz6sDuwVhL6QFBAm9Bnjl/sa3PnSQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-JoeuE0AYMMe7gZzp3Ffiyg-1; Wed, 04 Aug 2021 11:48:59 -0400
X-MC-Unique: JoeuE0AYMMe7gZzp3Ffiyg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B287B190A7A0
 for <qemu-devel@nongnu.org>; Wed,  4 Aug 2021 15:48:58 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FEC010372DD;
 Wed,  4 Aug 2021 15:48:50 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/11] chardev related fixes
Date: Wed,  4 Aug 2021 19:48:37 +0400
Message-Id: <20210804154848.557328-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.699, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

Hi,=0D
=0D
Those patches have been sent earlier. I compiled them here, as I intend to =
send=0D
a pull request for 6.1. We may want to drop the last 2/3 patches since we a=
re=0D
in freeze though.=0D
=0D
Marc-Andr=C3=A9 Lureau (11):=0D
  util: fix abstract socket path copy=0D
  chardev/socket: print a more correct command-line address=0D
  chardev: remove needless class method=0D
  chardev: add some comments about the class methods=0D
  chardev: mark explicitly first argument as poisoned=0D
  chardev: fix fd_chr_add_watch() when in !=3D out=0D
  chardev: fix qemu_chr_open_fd() being called with fd=3D-1=0D
  chardev: fix qemu_chr_open_fd() with fd_in=3D=3Dfd_out=0D
  chardev: give some context on chardev-add error=0D
  chardev: report a simpler error about duplicated id=0D
  chardev: reuse qmp_chardev_new()=0D
=0D
 include/chardev/char-fe.h |   8 ++-=0D
 include/chardev/char.h    |  34 ++++++++++-=0D
 chardev/char-fd.c         | 119 ++++++++++++++++++++++++++++++++++----=0D
 chardev/char-fe.c         |   2 +-=0D
 chardev/char-mux.c        |   6 +-=0D
 chardev/char-socket.c     |   4 +-=0D
 chardev/char.c            |  33 ++++++-----=0D
 hw/char/cadence_uart.c    |   2 +-=0D
 hw/char/cmsdk-apb-uart.c  |   2 +-=0D
 hw/char/ibex_uart.c       |   2 +-=0D
 hw/char/nrf51_uart.c      |   2 +-=0D
 hw/char/serial.c          |   2 +-=0D
 hw/char/virtio-console.c  |   2 +-=0D
 hw/usb/redirect.c         |   2 +-=0D
 hw/virtio/vhost-user.c    |   2 +-=0D
 monitor/monitor.c         |   2 +-=0D
 net/vhost-user.c          |   4 +-=0D
 util/qemu-sockets.c       |   5 +-=0D
 18 files changed, 184 insertions(+), 49 deletions(-)=0D
=0D
--=20=0D
2.32.0.264.g75ae10bc75=0D
=0D


