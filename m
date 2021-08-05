Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BB43E1520
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 14:55:17 +0200 (CEST)
Received: from localhost ([::1]:40812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBcu4-0004YF-Tp
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 08:55:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBcsa-0002oY-K8
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 08:53:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBcsY-0003j4-Uo
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 08:53:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628168021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZiXsq2DHzlMMrpoYk3hCFpE0q94o/40cYV/sUCawREs=;
 b=M5JOeYbpZJQxXf/oCMYzuyqaukwFzycrlPhJrKetiwwlyvuHGterbUDW+7cccDFWwNhrjp
 BJ7nPR1oiAksHd4mGp+lsoqT3lhINtMkmlLTK0ZXuF2ksTdhcY6N0ojxGj9xYwJQOefCul
 pZk+5ZAdZScsJFmpBgSYfBndaVbKuAs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-szclMZCuPJKFD2poMg318Q-1; Thu, 05 Aug 2021 08:53:40 -0400
X-MC-Unique: szclMZCuPJKFD2poMg318Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86CED801B3D;
 Thu,  5 Aug 2021 12:53:39 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0709917CC8;
 Thu,  5 Aug 2021 12:53:34 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 0/8] chardev fixes for 6.1
Date: Thu,  5 Aug 2021 16:53:23 +0400
Message-Id: <20210805125331.826741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

The following changes since commit bccabb3a5d60182645c7749e89f21a9ff307a9eb=
:=0D
=0D
  Update version for v6.1.0-rc2 release (2021-08-04 16:56:14 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git@gitlab.com:marcandre.lureau/qemu.git tags/chr-fix-pull-request=0D
=0D
for you to fetch changes up to a68403b0a6843f106e381b0bbeaacb29f6d27255:=0D
=0D
  chardev: report a simpler error about duplicated id (2021-08-05 16:15:33 =
+0400)=0D
=0D
----------------------------------------------------------------=0D
Chardev-related fixes=0D
=0D
Hi=0D
=0D
Here are some bug fixes worthy for 6.1.=0D
=0D
thanks=0D
=0D
----------------------------------------------------------------=0D
=0D
Marc-Andr=C3=A9 Lureau (8):=0D
  util: fix abstract socket path copy=0D
  chardev/socket: print a more correct command-line address=0D
  chardev: mark explicitly first argument as poisoned=0D
  chardev: fix fd_chr_add_watch() when in !=3D out=0D
  chardev: fix qemu_chr_open_fd() being called with fd=3D-1=0D
  chardev: fix qemu_chr_open_fd() with fd_in=3D=3Dfd_out=0D
  chardev: give some context on chardev-add error=0D
  chardev: report a simpler error about duplicated id=0D
=0D
 include/chardev/char-fe.h |   8 ++-=0D
 chardev/char-fd.c         | 119 ++++++++++++++++++++++++++++++++++----=0D
 chardev/char-fe.c         |   2 +-=0D
 chardev/char-socket.c     |   4 +-=0D
 chardev/char.c            |  20 +++++--=0D
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
 16 files changed, 146 insertions(+), 34 deletions(-)=0D
=0D
--=20=0D
2.32.0.264.g75ae10bc75=0D
=0D


