Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7795F4DA1B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 21:23:28 +0200 (CEST)
Received: from localhost ([::1]:52376 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1he2ec-0005m3-5p
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 15:23:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49774)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1he26f-0003ce-Ez
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 14:48:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1he26Y-0000li-7z
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 14:48:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33306)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1he26U-0008H8-RS
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 14:48:11 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 33CCF3001835
 for <qemu-devel@nongnu.org>; Thu, 20 Jun 2019 18:47:12 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-203.ams2.redhat.com
 [10.36.117.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0D685D71C;
 Thu, 20 Jun 2019 18:47:08 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, jasowang@redhat.com, eblake@redhat.com,
 armbru@redhat.com, laine@redhat.com
Date: Thu, 20 Jun 2019 19:47:01 +0100
Message-Id: <20190620184706.19988-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Thu, 20 Jun 2019 18:47:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 0/5] network announce;
 interface selection & IDs
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

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Up until now, the 'announce' feature has mainly been used
for migration where we announce on all interfaces.  Another
use for 'announce' is in cases of network topology changes.

Since network topology changes may only affect a subset
of the interfaces, we add an 'interface list' to announce
to restrict the announcment to the interfaces we're interested
in.

Multiple topology changes might happen in close succession,
so we allow multiple timers, each with their own parameters
(including the interface list).

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

v5
  Minor review fixes [Jason]=20

Dr. David Alan Gilbert (5):
  net/announce: Allow optional list of interfaces
  net/announce: Add HMP optional interface list
  net/announce: Add optional ID
  net/announce: Add HMP optional ID
  net/announce: Expand test for stopping self announce

 hmp-commands.hx         |  7 +++-
 hw/net/virtio-net.c     |  4 +-
 include/net/announce.h  |  8 +++-
 monitor/hmp-cmds.c      | 41 ++++++++++++++++++-
 net/announce.c          | 89 +++++++++++++++++++++++++++++++++++------
 net/trace-events        |  3 +-
 qapi/net.json           | 16 ++++++--
 tests/virtio-net-test.c | 57 ++++++++++++++++++++++++--
 8 files changed, 198 insertions(+), 27 deletions(-)

--=20
2.21.0


