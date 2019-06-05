Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C01360EB
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 18:13:37 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45708 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYYXg-0008Lu-83
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 12:13:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59881)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hYYVh-0007PF-Nv
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 12:11:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1hYYVf-0002Tv-0n
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 12:11:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39396)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1hYYVc-0002MC-Mh; Wed, 05 Jun 2019 12:11:28 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 98852308338F;
	Wed,  5 Jun 2019 16:11:22 +0000 (UTC)
Received: from localhost (unknown [10.40.205.15])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EFFB25F7C0;
	Wed,  5 Jun 2019 16:11:19 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Wed,  5 Jun 2019 18:11:14 +0200
Message-Id: <20190605161118.14544-1-mreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Wed, 05 Jun 2019 16:11:22 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/4] block: Keep track of parent quiescing
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We currently do not keep track of how many times a child has quiesced
its parent.  We just guess based on the child=E2=80=99s quiesce_counter. =
 That
keeps biting us when we try to leave drained sections or detach children
(see e.g. commit 5cb2737e925042e).

I think we need an explicit counter to keep track of how many times a
parent has been quiesced (patch 1).  That just makes the code more
resilient.

Actually, no, we don=E2=80=99t need a counter, we need a boolean.  See pa=
tch 2
for the explanation.

Yes, it is a bit weird to introduce a counter first (patch 1) and then
immediately make it a boolean (patch 2).  But I believe this to be the
most logical change set.

(=E2=80=9COur current model relies on counting, so adding an explicit cou=
nter
makes sense.  It then turns out that counting is probably not the best
idea, so why not make it a boolean?=E2=80=9D)


Max Reitz (4):
  block: Introduce BdrvChild.parent_quiesce_counter
  block: Make @parent_quiesced a bool
  iotests: Add @has_quit to vm.shutdown()
  iotests: Test commit with a filter on the chain

 include/block/block.h      |  9 +++---
 include/block/block_int.h  |  6 ++++
 block.c                    | 18 ++++-------
 block/io.c                 | 61 +++++++++++++++++++++++++++++---------
 tests/test-bdrv-drain.c    | 31 +++++++++++--------
 python/qemu/__init__.py    |  5 ++--
 tests/qemu-iotests/040     | 40 ++++++++++++++++++++++++-
 tests/qemu-iotests/040.out |  4 +--
 tests/qemu-iotests/255     |  2 +-
 9 files changed, 126 insertions(+), 50 deletions(-)

--=20
2.21.0


