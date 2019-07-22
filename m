Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C1D70109
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 15:31:27 +0200 (CEST)
Received: from localhost ([::1]:33572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpYPV-0003Fy-Sr
	for lists+qemu-devel@lfdr.de; Mon, 22 Jul 2019 09:31:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51805)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hpYPD-0002kK-D0
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 09:31:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hpYPC-0001wA-Ba
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 09:31:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34102)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hpYPA-0001qe-35; Mon, 22 Jul 2019 09:31:04 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 99B88308212D;
 Mon, 22 Jul 2019 13:31:02 +0000 (UTC)
Received: from localhost (unknown [10.40.205.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FBFF5D967;
 Mon, 22 Jul 2019 13:30:59 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 22 Jul 2019 15:30:52 +0200
Message-Id: <20190722133054.21781-1-mreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Mon, 22 Jul 2019 13:31:02 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH for-4.1 0/2] block: bdrv_drained_end() changes
 fallout
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I noted that test-bdrv-drain sometimgs hangs (very rarely, though), and
tried to write a test that triggers the issue.  I failed to do so (there
is a good reason for that, see patch 1), but on my way I noticed that
calling bdrv_set_aio_context_ignore() from any AioContext but the main
one is a bad idea.  Hence patch 2.

Anyway, I found the problem, which is fixed by patch 1 -- I think it=E2=80=
=99s
rather obvious.  There is no dedicated test because I don=E2=80=99t think=
 it=E2=80=99s
possible to write one, as I explain there.


Max Reitz (2):
  block: Dec. drained_end_counter before bdrv_wakeup
  block: Only the main loop can change AioContexts

 include/block/block.h |  8 +++-----
 block.c               | 13 ++++++++-----
 block/io.c            |  5 ++---
 3 files changed, 13 insertions(+), 13 deletions(-)

--=20
2.21.0


