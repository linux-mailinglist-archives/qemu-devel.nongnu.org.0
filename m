Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4E31B45E3
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Apr 2020 15:09:09 +0200 (CEST)
Received: from localhost ([::1]:50250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRF7k-0005MJ-OY
	for lists+qemu-devel@lfdr.de; Wed, 22 Apr 2020 09:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46786)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jRF67-0003j7-98
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 09:07:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jRF65-0003js-WC
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 09:07:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35616
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jRF65-0003hB-IP
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 09:07:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587560844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6nKXoFtxKcb6XPk5wG8Z5HyrttHvtNaGWsXEGtlh4/k=;
 b=BGUtHRnJ/dThWPl86YrXEgnQVesnt3qCD6ARPjqRFeufgXCuteGoXrgm2Fp5dufC2meDmo
 /+gPIMUHLNCo0Eobwuy7mrPptA02Tl/awq6PCPUMWxF4XufKcCK9bYUY0ghSTf3sU4J5FJ
 aw0TZpP6e315HGwYwWP44247F8UIgw4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-zs2-01iqOFuPxkpEKRsaxQ-1; Wed, 22 Apr 2020 09:07:22 -0400
X-MC-Unique: zs2-01iqOFuPxkpEKRsaxQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9F588015CE
 for <qemu-devel@nongnu.org>; Wed, 22 Apr 2020 13:07:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 84E6227BD7
 for <qemu-devel@nongnu.org>; Wed, 22 Apr 2020 13:07:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F2F9011358BC; Wed, 22 Apr 2020 15:07:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/14] Miscellaneous error handling fixes
Date: Wed, 22 Apr 2020 15:07:05 +0200
Message-Id: <20200422130719.28225-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 09:07:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.120
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Maintainers decide whether any of these are serious enough to still go
into 5.0.  I doubt it.

v2:
* PATCH 12-14: New

Markus Armbruster (14):
  cryptodev: Fix cryptodev_builtin_cleanup() error API violation
  block/file-posix: Fix check_cache_dropped() error handling
  cpus: Fix configure_icount() error API violation
  cpus: Proper range-checking for -icount shift=3DN
  arm/virt: Fix virt_machine_device_plug_cb() error API violation
  fdc: Fix fallback=3Dauto error handling
  bochs-display: Fix vgamem=3DSIZE error handling
  virtio-net: Fix duplex=3D... and speed=3D... error handling
  xen/pt: Fix flawed conversion to realize()
  io: Fix qio_channel_socket_close() error handling
  migration/colo: Fix qmp_xen_colo_do_checkpoint() error handling
  tests/test-logging: Fix test for -dfilter 0..0xffffffffffffffff
  qga: Fix qmp_guest_get_memory_blocks() error handling
  qga: Fix qmp_guest_suspend_{disk,ram}() error handling

 backends/cryptodev-builtin.c | 10 ++-----
 block/file-posix.c           |  5 +++-
 cpus.c                       | 52 +++++++++++++++++++++---------------
 hw/arm/virt.c                |  4 +--
 hw/block/fdc.c               |  1 +
 hw/display/bochs-display.c   |  6 +++--
 hw/net/virtio-net.c          |  5 +++-
 hw/xen/xen_pt.c              | 12 ++++-----
 io/channel-socket.c          |  5 ++--
 migration/colo.c             |  8 +++++-
 qga/commands-posix.c         |  3 +++
 qga/commands-win32.c         | 14 ++++++++++
 tests/test-logging.c         |  4 +--
 13 files changed, 82 insertions(+), 47 deletions(-)

--=20
2.21.1


