Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 874887618F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jul 2019 11:11:33 +0200 (CEST)
Received: from localhost ([::1]:37586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqwGB-0004J2-Uk
	for lists+qemu-devel@lfdr.de; Fri, 26 Jul 2019 05:11:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59821)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@redhat.com>) id 1hqwFx-0003ug-TA
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 05:11:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1hqwFt-00044B-OH
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 05:11:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40676)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1hqwFt-0003qD-G2
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 05:11:13 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 12B5D3022460
 for <qemu-devel@nongnu.org>; Fri, 26 Jul 2019 09:11:10 +0000 (UTC)
Received: from localhost (ovpn-117-212.ams2.redhat.com [10.36.117.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 089965DE80;
 Fri, 26 Jul 2019 09:11:04 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: virtio-fs@redhat.com,
	qemu-devel@nongnu.org
Date: Fri, 26 Jul 2019 10:10:58 +0100
Message-Id: <20190726091103.23503-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Fri, 26 Jul 2019 09:11:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/5] virtiofsd: multithreading preparation
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

virtiofsd is not ready for multithreading yet.  This patch series starts =
to
make the code capable of processing multiple FUSE requests simultaneously=
.  I'm
sending these fixes split into several patch series as I make progress au=
diting
the code for thread-safety issues.  The final patch series will use a
threadpool to process requests from a virtqueue in parallel and it will a=
lso
enable multiqueue.

Patches 1 & 2 are cleanups discovered when auditing the code.  They are n=
ot
related to multithreading.

Stefan Hajnoczi (5):
  virtiofsd: skip unnecessary vu_queue_get_avail_bytes()
  virtiofsd: prevent lo_lookup() NULL pointer dereference
  virtiofsd: make lo_release() atomic
  virtiofsd: drop lo_dirp->fd field
  virtiofsd: prevent races with lo_dirp_put()

 contrib/virtiofsd/fuse_virtio.c    | 13 +++---
 contrib/virtiofsd/passthrough_ll.c | 71 +++++++++++++++++++++++-------
 2 files changed, 60 insertions(+), 24 deletions(-)

--=20
2.21.0


