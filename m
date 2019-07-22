Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0DB70127
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 15:35:28 +0200 (CEST)
Received: from localhost ([::1]:33659 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpYTQ-000264-2A
	for lists+qemu-devel@lfdr.de; Mon, 22 Jul 2019 09:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52894)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hpYSU-0007uL-GC
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 09:34:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hpYST-0005MA-4I
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 09:34:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57308)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hpYSQ-0005Io-6K; Mon, 22 Jul 2019 09:34:26 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8184E330265;
 Mon, 22 Jul 2019 13:34:25 +0000 (UTC)
Received: from localhost (unknown [10.40.205.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA2DF600C4;
 Mon, 22 Jul 2019 13:34:23 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 22 Jul 2019 15:33:45 +0200
Message-Id: <20190722133347.15122-4-mreitz@redhat.com>
In-Reply-To: <20190722133347.15122-1-mreitz@redhat.com>
References: <20190722133347.15122-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Mon, 22 Jul 2019 13:34:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 3/5] tests: Test polling in
 bdrv_drop_intermediate()
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

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/test-bdrv-drain.c | 167 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 167 insertions(+)

diff --git a/tests/test-bdrv-drain.c b/tests/test-bdrv-drain.c
index 03fa1142a1..1600d41e9a 100644
--- a/tests/test-bdrv-drain.c
+++ b/tests/test-bdrv-drain.c
@@ -100,6 +100,13 @@ static void bdrv_test_child_perm(BlockDriverState *b=
s, BdrvChild *c,
                               nperm, nshared);
 }
=20
+static int bdrv_test_change_backing_file(BlockDriverState *bs,
+                                         const char *backing_file,
+                                         const char *backing_fmt)
+{
+    return 0;
+}
+
 static BlockDriver bdrv_test =3D {
     .format_name            =3D "test",
     .instance_size          =3D sizeof(BDRVTestState),
@@ -111,6 +118,8 @@ static BlockDriver bdrv_test =3D {
     .bdrv_co_drain_end      =3D bdrv_test_co_drain_end,
=20
     .bdrv_child_perm        =3D bdrv_test_child_perm,
+
+    .bdrv_change_backing_file =3D bdrv_test_change_backing_file,
 };
=20
 static void aio_ret_cb(void *opaque, int ret)
@@ -1671,6 +1680,161 @@ static void test_blockjob_commit_by_drained_end(v=
oid)
     bdrv_unref(bs_child);
 }
=20
+
+typedef struct TestSimpleBlockJob {
+    BlockJob common;
+    bool should_complete;
+    bool *did_complete;
+} TestSimpleBlockJob;
+
+static int coroutine_fn test_simple_job_run(Job *job, Error **errp)
+{
+    TestSimpleBlockJob *s =3D container_of(job, TestSimpleBlockJob, comm=
on.job);
+
+    while (!s->should_complete) {
+        job_sleep_ns(job, 0);
+    }
+
+    return 0;
+}
+
+static void test_simple_job_clean(Job *job)
+{
+    TestSimpleBlockJob *s =3D container_of(job, TestSimpleBlockJob, comm=
on.job);
+    *s->did_complete =3D true;
+}
+
+static const BlockJobDriver test_simple_job_driver =3D {
+    .job_driver =3D {
+        .instance_size  =3D sizeof(TestSimpleBlockJob),
+        .free           =3D block_job_free,
+        .user_resume    =3D block_job_user_resume,
+        .drain          =3D block_job_drain,
+        .run            =3D test_simple_job_run,
+        .clean          =3D test_simple_job_clean,
+    },
+};
+
+static int drop_intermediate_poll_update_filename(BdrvChild *child,
+                                                  BlockDriverState *new_=
base,
+                                                  const char *filename,
+                                                  Error **errp)
+{
+    /*
+     * We are free to poll here, which may change the block graph, if
+     * it is not drained.
+     */
+
+    /* If the job is not drained: Complete it, schedule job_exit() */
+    aio_poll(qemu_get_current_aio_context(), false);
+    /* If the job is not drained: Run job_exit(), finish the job */
+    aio_poll(qemu_get_current_aio_context(), false);
+
+    return 0;
+}
+
+/**
+ * Test a poll in the midst of bdrv_drop_intermediate().
+ *
+ * bdrv_drop_intermediate() calls BdrvChildRole.update_filename(),
+ * which can yield or poll.  This may lead to graph changes, unless
+ * the whole subtree in question is drained.
+ *
+ * We test this on the following graph:
+ *
+ *                    Job
+ *
+ *                     |
+ *                  job-node
+ *                     |
+ *                     v
+ *
+ *                  job-node
+ *
+ *                     |
+ *                  backing
+ *                     |
+ *                     v
+ *
+ * node-2 --chain--> node-1 --chain--> node-0
+ *
+ * We drop node-1 with bdrv_drop_intermediate(top=3Dnode-1, base=3Dnode-=
0).
+ *
+ * This first updates node-2's backing filename by invoking
+ * drop_intermediate_poll_update_filename(), which polls twice.  This
+ * causes the job to finish, which in turns causes the job-node to be
+ * deleted.
+ *
+ * bdrv_drop_intermediate() uses a QLIST_FOREACH_SAFE() loop, so it
+ * already has a pointer to the BdrvChild edge between job-node and
+ * node-1.  When it tries to handle that edge, we probably get a
+ * segmentation fault because the object no longer exists.
+ *
+ *
+ * The solution is for bdrv_drop_intermediate() to drain top's
+ * subtree.  This prevents graph changes from happening just because
+ * BdrvChildRole.update_filename() yields or polls.  Thus, the block
+ * job is paused during that drained section and must finish before or
+ * after.
+ *
+ * (In addition, bdrv_replace_child() must keep the job paused.)
+ */
+static void test_drop_intermediate_poll(void)
+{
+    static BdrvChildRole chain_child_role;
+    BlockDriverState *chain[3];
+    TestSimpleBlockJob *job;
+    BlockDriverState *job_node;
+    bool job_has_completed =3D false;
+    int i;
+    int ret;
+
+    chain_child_role =3D child_backing;
+    chain_child_role.update_filename =3D drop_intermediate_poll_update_f=
ilename;
+
+    for (i =3D 0; i < 3; i++) {
+        char name[32];
+        snprintf(name, 32, "node-%i", i);
+
+        chain[i] =3D bdrv_new_open_driver(&bdrv_test, name, 0, &error_ab=
ort);
+    }
+
+    job_node =3D bdrv_new_open_driver(&bdrv_test, "job-node", BDRV_O_RDW=
R,
+                                    &error_abort);
+    bdrv_set_backing_hd(job_node, chain[1], &error_abort);
+
+    /*
+     * Establish the chain last, so the chain links are the first
+     * elements in the BDS.parents lists
+     */
+    for (i =3D 0; i < 3; i++) {
+        if (i) {
+            /* Takes the reference to chain[i - 1] */
+            chain[i]->backing =3D bdrv_attach_child(chain[i], chain[i - =
1],
+                                                  "chain", &chain_child_=
role,
+                                                  &error_abort);
+        }
+    }
+
+    job =3D block_job_create("job", &test_simple_job_driver, NULL, job_n=
ode,
+                           0, BLK_PERM_ALL, 0, 0, NULL, NULL, &error_abo=
rt);
+
+    /* The job has a reference now */
+    bdrv_unref(job_node);
+
+    job->did_complete =3D &job_has_completed;
+
+    job_start(&job->common.job);
+    job->should_complete =3D true;
+
+    g_assert(!job_has_completed);
+    ret =3D bdrv_drop_intermediate(chain[1], chain[0], NULL);
+    g_assert(ret =3D=3D 0);
+    g_assert(job_has_completed);
+
+    bdrv_unref(chain[2]);
+}
+
 int main(int argc, char **argv)
 {
     int ret;
@@ -1757,6 +1921,9 @@ int main(int argc, char **argv)
     g_test_add_func("/bdrv-drain/blockjob/commit_by_drained_end",
                     test_blockjob_commit_by_drained_end);
=20
+    g_test_add_func("/bdrv-drain/bdrv_drop_intermediate/poll",
+                    test_drop_intermediate_poll);
+
     ret =3D g_test_run();
     qemu_event_destroy(&done_event);
     return ret;
--=20
2.21.0


