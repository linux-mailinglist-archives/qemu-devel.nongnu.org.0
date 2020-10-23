Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BD1296D05
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 12:45:53 +0200 (CEST)
Received: from localhost ([::1]:44268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVua0-0005u4-OP
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 06:45:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kVuWO-0004eb-0w
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 06:42:09 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:39445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kVuWK-0003tm-Fk
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 06:42:05 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-74-kFnqikVFNqu4hdg0g-AdDw-1; Fri, 23 Oct 2020 06:41:41 -0400
X-MC-Unique: kFnqikVFNqu4hdg0g-AdDw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A27F6804B6E;
 Fri, 23 Oct 2020 10:41:40 +0000 (UTC)
Received: from bahia.lan (ovpn-115-53.ams2.redhat.com [10.36.115.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68B3E10013D7;
 Fri, 23 Oct 2020 10:41:33 +0000 (UTC)
Subject: [PATCH] block: End quiescent sections when a BDS is deleted
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 23 Oct 2020 12:41:32 +0200
Message-ID: <160344969243.4091343.14371338409686732879.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 06:41:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If a BDS gets deleted during blk_drain_all(), it might miss a
call to bdrv_do_drained_end(). This means missing a call to
aio_enable_external() and the AIO context remains disabled for
ever. This can cause a device to become irresponsive and to
disrupt the guest execution, ie. hang, loop forever or worse.

This scenario is quite easy to encounter with virtio-scsi
on POWER when punching multiple blockdev-create QMP commands
while the guest is booting and it is still running the SLOF
firmware. This happens because SLOF disables/re-enables PCI
devices multiple times via IO/MEM/MASTER bits of PCI_COMMAND
register after the initial probe/feature negotiation, as it
tends to work with a single device at a time at various stages
like probing and running block/network bootloaders without
doing a full reset in-between. This naturally generates many
dataplane stops and starts, and thus many drain sections that
can race with blockdev_create_run(). In the end, SLOF bails
out.

It is somehow reproducible on x86 but it requires to generate
articial dataplane start/stop activity with stop/cont QMP
commands. In this case, seabios ends up looping for ever,
waiting for the virtio-scsi device to send a response to
a command it never received.

Add a helper that pairs all previously called bdrv_do_drained_begin()
with a bdrv_do_drained_end() and call it from bdrv_close().
While at it, update the "/bdrv-drain/graph-change/drain_all"
test in test-bdrv-drain so that it can catch the issue.

BugId: https://bugzilla.redhat.com/show_bug.cgi?id=3D1874441
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 block.c                 |    9 +++++++++
 block/io.c              |   13 +++++++++++++
 include/block/block.h   |    6 ++++++
 tests/test-bdrv-drain.c |    1 +
 4 files changed, 29 insertions(+)

diff --git a/block.c b/block.c
index 430edf79bb10..ddcb36dd48a8 100644
--- a/block.c
+++ b/block.c
@@ -4458,6 +4458,15 @@ static void bdrv_close(BlockDriverState *bs)
     }
     QLIST_INIT(&bs->aio_notifiers);
     bdrv_drained_end(bs);
+
+    /*
+     * If we're still inside some bdrv_drain_all_begin()/end() sections, e=
nd
+     * them now since this BDS won't exist anymore when bdrv_drain_all_end=
()
+     * gets called.
+     */
+    if (bs->quiesce_counter) {
+        bdrv_drained_end_quiesce(bs);
+    }
 }
=20
 void bdrv_close_all(void)
diff --git a/block/io.c b/block/io.c
index 54f0968aee27..8a0da06bbb14 100644
--- a/block/io.c
+++ b/block/io.c
@@ -633,6 +633,19 @@ void bdrv_drain_all_begin(void)
     }
 }
=20
+void bdrv_drained_end_quiesce(BlockDriverState *bs)
+{
+    int drained_end_counter =3D 0;
+
+    g_assert_cmpint(bs->quiesce_counter, >, 0);
+    g_assert_cmpint(bs->refcnt, =3D=3D, 0);
+
+    while (bs->quiesce_counter) {
+        bdrv_do_drained_end(bs, false, NULL, true, &drained_end_counter);
+    }
+    BDRV_POLL_WHILE(bs, qatomic_read(&drained_end_counter) > 0);
+}
+
 void bdrv_drain_all_end(void)
 {
     BlockDriverState *bs =3D NULL;
diff --git a/include/block/block.h b/include/block/block.h
index d16c401cb44e..c0ce6e690081 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -779,6 +779,12 @@ void bdrv_drained_end(BlockDriverState *bs);
  */
 void bdrv_drained_end_no_poll(BlockDriverState *bs, int *drained_end_count=
er);
=20
+/**
+ * End all quiescent sections started by bdrv_drain_all_begin(). This is
+ * only needed when deleting a BDS before bdrv_drain_all_end() is called.
+ */
+void bdrv_drained_end_quiesce(BlockDriverState *bs);
+
 /**
  * End a quiescent section started by bdrv_subtree_drained_begin().
  */
diff --git a/tests/test-bdrv-drain.c b/tests/test-bdrv-drain.c
index 1595bbc92e9e..8a29e33e004a 100644
--- a/tests/test-bdrv-drain.c
+++ b/tests/test-bdrv-drain.c
@@ -594,6 +594,7 @@ static void test_graph_change_drain_all(void)
=20
     g_assert_cmpint(bs_b->quiesce_counter, =3D=3D, 0);
     g_assert_cmpint(b_s->drain_count, =3D=3D, 0);
+    g_assert_cmpint(qemu_get_aio_context()->external_disable_cnt, =3D=3D, =
0);
=20
     bdrv_unref(bs_b);
     blk_unref(blk_b);



