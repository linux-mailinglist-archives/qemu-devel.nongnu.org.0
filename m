Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E24E169C93
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 22:20:19 +0200 (CEST)
Received: from localhost ([::1]:42604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hn7SM-00054b-9x
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 16:20:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55216)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@redhat.com>) id 1hn7S6-0004dt-GU
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 16:20:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1hn7S5-0007OD-Es
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 16:20:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47010)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>)
 id 1hn7S3-0007LZ-Eq; Mon, 15 Jul 2019 16:19:59 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1BE73C036744;
 Mon, 15 Jul 2019 20:19:57 +0000 (UTC)
Received: from localhost (ovpn-117-120.ams2.redhat.com [10.36.117.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50F21600C1;
 Mon, 15 Jul 2019 20:19:51 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 15 Jul 2019 21:19:47 +0100
Message-Id: <20190715201950.9444-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Mon, 15 Jul 2019 20:19:57 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/3] block/io_uring: fix EINTR and resubmit
 short reads
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Stefan Hajnoczi <stefan@redhat.com>, Julia Suvorova <jusual@mail.ru>,
 Aarushi Mehta <mehta.aaru20@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Short reads are possible with cache=3Dwriteback (see Patch 3 for details)=
.
Handle this by resubmitting requests until the read is completed.

Patch 1 adds trace events useful for debugging io_uring.

Patch 2 fixes EINTR.  This lays the groundwork for resubmitting requests =
in
Patch 3.

Aarushi: Feel free to squash this into your patch series if you are happy=
 with
the code, I don't mind if the authorship information is lost.  After appl=
ying
these patches I can successfully boot a Fedora 30 guest qcow2 file with
cache=3Dwriteback.

Based-on: <20190610134905.22294-1-mehta.aaru20@gmail.com>

Stefan Hajnoczi (3):
  block/io_uring: add submission and completion trace events
  block/io_uring: fix EINTR request resubmission
  block/io_uring: resubmit short buffered reads

 block/io_uring.c   | 136 ++++++++++++++++++++++++++++++++++-----------
 block/trace-events |   6 +-
 2 files changed, 108 insertions(+), 34 deletions(-)

--=20
2.21.0


