Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFC7563B6
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jun 2019 09:52:53 +0200 (CEST)
Received: from localhost ([::1]:37378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hg2jc-0004pw-MS
	for lists+qemu-devel@lfdr.de; Wed, 26 Jun 2019 03:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36641)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@redhat.com>) id 1hg2fk-0008BB-L7
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 03:48:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1hg2fg-0004qj-SN
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 03:48:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52256)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1hg2fg-0004bh-Kn
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 03:48:48 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B15E12F8BD0;
 Wed, 26 Jun 2019 07:48:29 +0000 (UTC)
Received: from localhost (ovpn-116-164.ams2.redhat.com [10.36.116.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C898A1001B04;
 Wed, 26 Jun 2019 07:48:16 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 26 Jun 2019 08:48:11 +0100
Message-Id: <20190626074815.19994-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Wed, 26 Jun 2019 07:48:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 0/4] libvhost-user: VHOST_USER_PROTOCOL_F_MQ
 support
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:
 * Add missing dev->max_queues =3D max_queues assignment in vu_init() [dg=
ilbert]
 * Folded in Marc-Andr=C3=A9's Reviewed-By

Sebastien Boeuf <sebastien.boeuf@intel.com> pointed out that libvhost-use=
r
doesn't advertise VHOST_USER_PROTOCOL_F_MQ.  Today this prevents vhost-us=
er-net
multiqueue from working.

In virtio-fs we also want to support multiqueue so I'm sending patches to=
 add
this.  It's free to advertise VHOST_USER_PROTOCOL_F_MQ for all devices so=
 we
can do it unconditionally in libvhost-user.

Several related improvements are included:
Patch 1 - clean up duplicated and risky VhostUserMsg reply building code
Patch 2 - remove hardcoded 8 virtqueue limit in libvhost-user
Patch 4 - clarify vhost-user multiqueue specification

Stefan Hajnoczi (4):
  libvhost-user: add vmsg_set_reply_u64() helper
  libvhost-user: support many virtqueues
  libvhost-user: implement VHOST_USER_PROTOCOL_F_MQ
  docs: avoid vhost-user-net specifics in multiqueue section

 contrib/libvhost-user/libvhost-user-glib.h |  2 +-
 contrib/libvhost-user/libvhost-user.h      | 10 +++-
 contrib/libvhost-user/libvhost-user-glib.c | 12 +++-
 contrib/libvhost-user/libvhost-user.c      | 66 ++++++++++++++--------
 contrib/vhost-user-blk/vhost-user-blk.c    | 16 +++---
 contrib/vhost-user-gpu/main.c              |  9 ++-
 contrib/vhost-user-input/main.c            | 11 +++-
 contrib/vhost-user-scsi/vhost-user-scsi.c  | 21 +++----
 tests/vhost-user-bridge.c                  | 42 +++++++++-----
 docs/interop/vhost-user.rst                | 21 +++----
 10 files changed, 133 insertions(+), 77 deletions(-)

--=20
2.21.0


