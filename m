Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 731D5706F0
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 19:27:43 +0200 (CEST)
Received: from localhost ([::1]:36302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpc6A-00045X-6s
	for lists+qemu-devel@lfdr.de; Mon, 22 Jul 2019 13:27:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51350)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hpc5i-0002d1-Ok
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 13:27:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hpc5h-0004e9-P6
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 13:27:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38420)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hpc5f-0004ce-JX; Mon, 22 Jul 2019 13:27:11 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D7B1D87638;
 Mon, 22 Jul 2019 17:27:10 +0000 (UTC)
Received: from localhost (unknown [10.40.205.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BE1960148;
 Mon, 22 Jul 2019 17:27:10 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 22 Jul 2019 19:26:15 +0200
Message-Id: <20190722172616.28797-5-mreitz@redhat.com>
In-Reply-To: <20190722172616.28797-1-mreitz@redhat.com>
References: <20190722172616.28797-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Mon, 22 Jul 2019 17:27:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 4/5] block: Dec. drained_end_counter before
 bdrv_wakeup
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Decrementing drained_end_counter after bdrv_dec_in_flight() (which in
turn invokes bdrv_wakeup() and thus aio_wait_kick()) is not very clever.
We should decrement it beforehand, so that any waiting aio_poll() that
is woken by bdrv_dec_in_flight() sees the decremented
drained_end_counter.

Because the time window between decrementing drained_end_counter and
aio_wait_kick() is very small, I cannot supply a reliable regression
test.  However, running e.g. the /bdrv-drain/blockjob/iothread/drain_all
test in test-bdrv-drain has a small chance of hanging without this
patch (about 1/200 or so; it gets to nearly 100 % if you add e.g. an
fputc(' ', stderr); after the bdrv_dec_in_flight()).

Fixes: e037c09c78520cbdb6da7cfc6ad0256d5870b814
Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-id: 20190722133054.21781-2-mreitz@redhat.com
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/io.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/block/io.c b/block/io.c
index b89e155d21..06305c6ea6 100644
--- a/block/io.c
+++ b/block/io.c
@@ -217,13 +217,12 @@ static void coroutine_fn bdrv_drain_invoke_entry(vo=
id *opaque)
         bs->drv->bdrv_co_drain_end(bs);
     }
=20
-    /* Set data->done before reading bs->wakeup.  */
+    /* Set data->done and decrement drained_end_counter before bdrv_wake=
up() */
     atomic_mb_set(&data->done, true);
-    bdrv_dec_in_flight(bs);
-
     if (!data->begin) {
         atomic_dec(data->drained_end_counter);
     }
+    bdrv_dec_in_flight(bs);
=20
     g_free(data);
 }
--=20
2.21.0


