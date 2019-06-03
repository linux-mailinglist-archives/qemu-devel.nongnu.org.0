Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6163351A
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jun 2019 18:38:17 +0200 (CEST)
Received: from localhost ([127.0.0.1]:37796 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXpyS-0001Wb-Ta
	for lists+qemu-devel@lfdr.de; Mon, 03 Jun 2019 12:38:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33918)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hXpus-0007Mh-AN
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 12:34:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hXpmA-0002Aq-7W
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 12:25:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60780)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1hXpm9-0001Zc-2t; Mon, 03 Jun 2019 12:25:33 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BD0FA7F746;
	Mon,  3 Jun 2019 16:25:14 +0000 (UTC)
Received: from localhost (unknown [10.40.205.221])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5646218239;
	Mon,  3 Jun 2019 16:25:14 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Mon,  3 Jun 2019 18:25:10 +0200
Message-Id: <20190603162512.30422-1-mreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 03 Jun 2019 16:25:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/2] blockdev: Overlays are not snapshots
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU=E2=80=99s always been confused over what a snapshot is: Is it the ov=
erlay?
Is it the backing image?

Confusion is rarely a good thing.  I can=E2=80=99t think of any objective=
 reason
why the overlay would be a snapshot.  A snapshot is something that does
not change over time; the overlay does.

(I suppose historically the reason is that =E2=80=9CTaking an overlay=E2=80=
=9D makes no
sense, so the operations are called =E2=80=9CTaking a snapshot=E2=80=9D. =
 Somehow, this
meaning carried over to the new file that is created during that
operation; if =E2=80=9CCreating a snapshot=E2=80=9D creates a file, that =
file must be
the snapshot, right?  Well, no, it isn=E2=80=99t.)

Let=E2=80=99s fix this as best as we can.  Better Nate than lever.


Mae Reitz (2):
  qapi/block-core: Overlays are not snapshots
  blockdev: Overlays are not snapshots

 qapi/block-core.json | 20 ++++++++++----------
 blockdev.c           | 10 +++++-----
 2 files changed, 15 insertions(+), 15 deletions(-)

--=20
2.21.0


