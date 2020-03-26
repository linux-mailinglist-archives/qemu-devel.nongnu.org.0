Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 547BC1943B0
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Mar 2020 16:58:30 +0100 (CET)
Received: from localhost ([::1]:55888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHUtp-0002ra-D8
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 11:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57223)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <s.reiter@proxmox.com>) id 1jHUs5-0000qz-WF
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 11:56:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <s.reiter@proxmox.com>) id 1jHUs4-0002eM-S0
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 11:56:41 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:36170)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <s.reiter@proxmox.com>)
 id 1jHUs2-0002Yu-F2; Thu, 26 Mar 2020 11:56:38 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 201EA42EB1;
 Thu, 26 Mar 2020 16:56:35 +0100 (CET)
From: Stefan Reiter <s.reiter@proxmox.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH v2 2/3] job: take each job's lock individually in job_txn_apply
Date: Thu, 26 Mar 2020 16:56:27 +0100
Message-Id: <20200326155628.859862-3-s.reiter@proxmox.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200326155628.859862-1-s.reiter@proxmox.com>
References: <20200326155628.859862-1-s.reiter@proxmox.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.186.127.180
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, slp@redhat.com,
 mreitz@redhat.com, stefanha@redhat.com, jsnow@redhat.com, dietmar@proxmox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All callers of job_txn_apply hold a single job's lock, but different
jobs within a transaction can have different contexts, thus we need to
lock each one individually before applying the callback function.

Similar to job_completed_txn_abort this also requires releasing the
caller's context before and reacquiring it after to avoid recursive
locks which might break AIO_WAIT_WHILE in the callback.

Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
---
 job.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/job.c b/job.c
index 134a07b92e..e0966162fa 100644
--- a/job.c
+++ b/job.c
@@ -136,17 +136,33 @@ static void job_txn_del_job(Job *job)
     }
 }
=20
-static int job_txn_apply(JobTxn *txn, int fn(Job *))
+static int job_txn_apply(Job *job, int fn(Job *))
 {
-    Job *job, *next;
+    AioContext *outer_ctx =3D job->aio_context;
+    AioContext *inner_ctx;
+    Job *other_job, *next;
+    JobTxn *txn =3D job->txn;
     int rc =3D 0;
=20
-    QLIST_FOREACH_SAFE(job, &txn->jobs, txn_list, next) {
-        rc =3D fn(job);
+    /*
+     * Similar to job_completed_txn_abort, we take each job's lock befor=
e
+     * applying fn, but since we assume that outer_ctx is held by the ca=
ller,
+     * we need to release it here to avoid holding the lock twice - whic=
h would
+     * break AIO_WAIT_WHILE from within fn.
+     */
+    aio_context_release(outer_ctx);
+
+    QLIST_FOREACH_SAFE(other_job, &txn->jobs, txn_list, next) {
+        inner_ctx =3D other_job->aio_context;
+        aio_context_acquire(inner_ctx);
+        rc =3D fn(other_job);
+        aio_context_release(inner_ctx);
         if (rc) {
             break;
         }
     }
+
+    aio_context_acquire(outer_ctx);
     return rc;
 }
=20
@@ -774,11 +790,11 @@ static void job_do_finalize(Job *job)
     assert(job && job->txn);
=20
     /* prepare the transaction to complete */
-    rc =3D job_txn_apply(job->txn, job_prepare);
+    rc =3D job_txn_apply(job, job_prepare);
     if (rc) {
         job_completed_txn_abort(job);
     } else {
-        job_txn_apply(job->txn, job_finalize_single);
+        job_txn_apply(job, job_finalize_single);
     }
 }
=20
@@ -824,10 +840,10 @@ static void job_completed_txn_success(Job *job)
         assert(other_job->ret =3D=3D 0);
     }
=20
-    job_txn_apply(txn, job_transition_to_pending);
+    job_txn_apply(job, job_transition_to_pending);
=20
     /* If no jobs need manual finalization, automatically do so */
-    if (job_txn_apply(txn, job_needs_finalize) =3D=3D 0) {
+    if (job_txn_apply(job, job_needs_finalize) =3D=3D 0) {
         job_do_finalize(job);
     }
 }
--=20
2.26.0



