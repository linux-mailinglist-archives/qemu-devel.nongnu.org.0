Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D9A48A3F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 19:35:42 +0200 (CEST)
Received: from localhost ([::1]:50416 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcvXh-0002ke-S2
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 13:35:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33067)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hcuy2-0005xH-Lc
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 12:58:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hcuy1-0001eB-K4
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 12:58:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:22971)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hcuxz-0001XH-7Q; Mon, 17 Jun 2019 12:58:47 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F2DF63088DB5;
 Mon, 17 Jun 2019 16:58:45 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-99.ams2.redhat.com [10.36.117.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 249087DDA0;
 Mon, 17 Jun 2019 16:58:39 +0000 (UTC)
Date: Mon, 17 Jun 2019 18:58:38 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <20190617165838.GN7397@linux.fritz.box>
References: <20190606154132.153330-1-vsementsov@virtuozzo.com>
 <20190606154132.153330-5-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190606154132.153330-5-vsementsov@virtuozzo.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Mon, 17 Jun 2019 16:58:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 4/4] block: drop bs->job
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
Cc: qemu-block@nongnu.org, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org, mreitz@redhat.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 06.06.2019 um 17:41 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Drop remaining users of bs->job:
> 1. assertions actually duplicated by assert(!bs->refcnt)
> 2. trace-point seems not enough reason to change stream_start to return
>    BlockJob pointer
> 3. Restricting creation of two jobs based on same bs is bad idea, as
>    3.1 Some jobs creates filters to be their main node, so, this check
>    don't actually prevent creating second job on same real node (which
>    will create another filter node) (but I hope it is restricted by
>    other mechanisms)
>    3.2 Even without bs->job we have two systems of permissions:
>    op-blockers and BLK_PERM
>    3.3 We may want to run several jobs on one node one day

This made make check break (test-blockjob tests that you can't create
two block jobs on the same node). So I need to squash in the following,
if you agree.

Kevin


diff --git a/tests/test-blockjob.c b/tests/test-blockjob.c
index 8c91980c70..b33f899873 100644
--- a/tests/test-blockjob.c
+++ b/tests/test-blockjob.c
@@ -122,8 +122,9 @@ static void test_job_ids(void)
     /* This one is valid */
     job[0] = do_test_id(blk[0], "id0", true);

-    /* We cannot have two jobs in the same BDS */
-    do_test_id(blk[0], "id1", false);
+    /* We can have two jobs in the same BDS */
+    job[1] = do_test_id(blk[0], "id1", true);
+    job_early_fail(&job[1]->job);

     /* Duplicate job IDs are not allowed */
     job[1] = do_test_id(blk[1], "id0", false);

