Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6641844D946
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 16:38:12 +0100 (CET)
Received: from localhost ([::1]:37100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlC9T-0002x7-HZ
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 10:38:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mlC5c-0004Rh-RM; Thu, 11 Nov 2021 10:34:13 -0500
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:40848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mlC5T-00040m-UG; Thu, 11 Nov 2021 10:34:07 -0500
Received: from iva8-d2cd82b7433e.qloud-c.yandex.net
 (iva8-d2cd82b7433e.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:a88e:0:640:d2cd:82b7])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id C8D812E1E9C;
 Thu, 11 Nov 2021 18:33:56 +0300 (MSK)
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net [2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by iva8-d2cd82b7433e.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 OmDzIFb9ez-XtsS8QN1; Thu, 11 Nov 2021 18:33:56 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1636644836; bh=P415Pnp2Q53kRr3ekH8mFM4DFA8+5p2tUcDgCjtFogE=;
 h=Message-Id:Date:Subject:To:From:Cc;
 b=kOfAUcdL+dpyjYA29DeIn7C06gOAEc521VGnpLTFwCi1zLE0gOvICPli+XVfb0CB7
 0XKkGklZS0XIdfiXmt2845FzfeNgTUDANdhlr9fWAwq77HWNuZLtOhWECXD59qpYAd
 Dy4KSoB+w7xHjsdJJ0rkfkOPIQ47hLoIB/3fJHrg=
Authentication-Results: iva8-d2cd82b7433e.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from rvkaganb.lan (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:8830::1:2d])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPS id
 WgGv8YbvMJ-XtwCqDe7; Thu, 11 Nov 2021 18:33:55 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/10] vhost: stick to -errno error return convention
Date: Thu, 11 Nov 2021 18:33:44 +0300
Message-Id: <20211111153354.18807-1-rvkagan@yandex-team.ru>
X-Mailer: git-send-email 2.33.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=5.45.199.163; envelope-from=rvkagan@yandex-team.ru;
 helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, Hanna Reitz <hreitz@redhat.com>,
 yc-core@yandex-team.ru,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Error propagation between the generic vhost code and the specific backends =
is=0D
not quite consistent: some places follow "return -1 and set errno" conventi=
on,=0D
while others assume "return negated errno".  Furthermore, not enough care i=
s=0D
taken not to clobber errno.=0D
=0D
As a result, on certain code paths the errno resulting from a failure may g=
et=0D
overridden by another function call, and then that zero errno inidicating=0D
success is propagated up the stack, leading to failures being lost.  In=0D
particular, we've seen errors in the communication with a vhost-user-blk sl=
ave=0D
not trigger an immediate connection drop and reconnection, leaving it in a=
=0D
broken state.=0D
=0D
Rework error propagation to always return negated errno on errors and=0D
correctly pass it up the stack.=0D
=0D
Roman Kagan (10):=0D
  vhost-user-blk: reconnect on any error during realize=0D
  chardev/char-socket: tcp_chr_recv: don't clobber errno=0D
  chardev/char-socket: tcp_chr_sync_read: don't clobber errno=0D
  chardev/char-fe: don't allow EAGAIN from blocking read=0D
  vhost-backend: avoid overflow on memslots_limit=0D
  vhost-backend: stick to -errno error return convention=0D
  vhost-vdpa: stick to -errno error return convention=0D
  vhost-user: stick to -errno error return convention=0D
  vhost: stick to -errno error return convention=0D
  vhost-user-blk: propagate error return from generic vhost=0D
=0D
 chardev/char-fe.c         |   7 +-=0D
 chardev/char-socket.c     |  17 +-=0D
 hw/block/vhost-user-blk.c |   4 +-=0D
 hw/virtio/vhost-backend.c |   4 +-=0D
 hw/virtio/vhost-user.c    | 401 +++++++++++++++++++++-----------------=0D
 hw/virtio/vhost-vdpa.c    |  37 ++--=0D
 hw/virtio/vhost.c         |  98 +++++-----=0D
 7 files changed, 307 insertions(+), 261 deletions(-)=0D
=0D
-- =0D
2.33.1=0D
=0D

