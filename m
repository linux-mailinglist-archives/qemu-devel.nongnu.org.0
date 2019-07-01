Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D0C4E475
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 11:46:17 +0200 (CEST)
Received: from localhost ([::1]:57520 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heG7c-0000Pv-No
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 05:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49552)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@redhat.com>) id 1heG2a-0005Ep-2H
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 05:41:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1heG2X-0002YN-0C
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 05:41:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48606)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1heG2W-0002Xa-Qm
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 05:41:00 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 252FD3082B68;
 Fri, 21 Jun 2019 09:41:00 +0000 (UTC)
Received: from localhost (ovpn-117-248.ams2.redhat.com [10.36.117.248])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 773AF1001B30;
 Fri, 21 Jun 2019 09:40:50 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 21 Jun 2019 10:40:05 +0100
Message-Id: <20190621094005.4134-5-stefanha@redhat.com>
In-Reply-To: <20190621094005.4134-1-stefanha@redhat.com>
References: <20190621094005.4134-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Fri, 21 Jun 2019 09:41:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 4/4] docs: avoid vhost-user-net specifics in
 multiqueue section
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

The "Multiple queue support" section makes references to vhost-user-net
"queue pairs".  This is confusing for two reasons:
1. This actually applies to all device types, not just vhost-user-net.
2. VHOST_USER_GET_QUEUE_NUM returns the number of virtqueues, not the
   number of queue pairs.

Reword the section so that the vhost-user-net specific part is relegated
to the very end: we acknowledge that vhost-user-net historically
automatically enabled the first queue pair.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 docs/interop/vhost-user.rst | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index dc0ff9211f..5750668aba 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -324,19 +324,20 @@ must support changing some configuration aspects on=
 the fly.
 Multiple queue support
 ----------------------
=20
-Multiple queue is treated as a protocol extension, hence the slave has
-to implement protocol features first. The multiple queues feature is
-supported only when the protocol feature ``VHOST_USER_PROTOCOL_F_MQ``
-(bit 0) is set.
+Multiple queue support allows the slave to advertise the maximum number =
of
+queues.  This is treated as a protocol extension, hence the slave has to
+implement protocol features first. The multiple queues feature is suppor=
ted
+only when the protocol feature ``VHOST_USER_PROTOCOL_F_MQ`` (bit 0) is s=
et.
=20
-The max number of queue pairs the slave supports can be queried with
-message ``VHOST_USER_GET_QUEUE_NUM``. Master should stop when the
-number of requested queues is bigger than that.
+The max number of queues the slave supports can be queried with message
+``VHOST_USER_GET_QUEUE_NUM``. Master should stop when the number of requ=
ested
+queues is bigger than that.
=20
 As all queues share one connection, the master uses a unique index for e=
ach
-queue in the sent message to identify a specified queue. One queue pair
-is enabled initially. More queues are enabled dynamically, by sending
-message ``VHOST_USER_SET_VRING_ENABLE``.
+queue in the sent message to identify a specified queue.
+
+The master enables queues by sending message ``VHOST_USER_SET_VRING_ENAB=
LE``.
+vhost-user-net has historically automatically enabled the first queue pa=
ir.
=20
 Migration
 ---------
--=20
2.21.0


