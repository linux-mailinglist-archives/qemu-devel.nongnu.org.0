Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0681A157
	for <lists+qemu-devel@lfdr.de>; Fri, 10 May 2019 18:23:03 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46213 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hP8IY-0000Tf-Ns
	for lists+qemu-devel@lfdr.de; Fri, 10 May 2019 12:23:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40055)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hP8CQ-0004Cn-4n
	for qemu-devel@nongnu.org; Fri, 10 May 2019 12:16:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hP8CP-0008LN-Bs
	for qemu-devel@nongnu.org; Fri, 10 May 2019 12:16:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35824)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hP8CN-0008IX-AA; Fri, 10 May 2019 12:16:39 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9A88889AC2;
	Fri, 10 May 2019 16:16:38 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-116-183.ams2.redhat.com
	[10.36.116.183])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B6E9117791;
	Fri, 10 May 2019 16:16:37 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Fri, 10 May 2019 18:16:04 +0200
Message-Id: <20190510161614.23236-6-kwolf@redhat.com>
In-Reply-To: <20190510161614.23236-1-kwolf@redhat.com>
References: <20190510161614.23236-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 10 May 2019 16:16:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 05/15] blockjob: Fix coroutine thread after
 AioContext change
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 463e0be10 ('blockjob: add AioContext attached callback') tried to
make block jobs robust against AioContext changes of their main node,
but it never made sure that the job coroutine actually runs in the new
thread.

Instead of waking up the job coroutine in whatever thread it ran before,
let's always pass the AioContext where it should be running now.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 job.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/job.c b/job.c
index da8e4b7bf2..2167d53717 100644
--- a/job.c
+++ b/job.c
@@ -432,7 +432,7 @@ void job_enter_cond(Job *job, bool(*fn)(Job *job))
     timer_del(&job->sleep_timer);
     job->busy =3D true;
     job_unlock();
-    aio_co_wake(job->co);
+    aio_co_enter(job->aio_context, job->co);
 }
=20
 void job_enter(Job *job)
--=20
2.20.1


