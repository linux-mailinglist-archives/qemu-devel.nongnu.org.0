Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B94E5E37C1
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 18:22:15 +0200 (CEST)
Received: from localhost ([::1]:46594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNfsM-000306-BC
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 12:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44897)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iNefs-0005fm-Pr
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 11:05:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iNefr-0004ZP-E1
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 11:05:16 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46050
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iNefr-0004ZC-AU
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 11:05:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571929514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tuw7jPVAC8t9b7fUJpfhTX1lKd/eBhDThuf6fJzMH6k=;
 b=A5ziBp6uWnUJFxdvy8EcpWMei57LHWge7kAEb3wmGDVDGiXz48RVOxrfwCTfGou4Vc+T9a
 7REw65kY0/KzB6mYt/F44oij+ri6+2pV9fza2pLZelPK27YWGqofiCsL/VBj+ihR4OFTyn
 I48LBvOflwS2J3fR3Qnd9bZmnkMYWfM=
Received: from mimecast-mx01.redhat.com (209.132.183.4 [209.132.183.4])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-YR5yCBgfMc2s9v2MlTELUA-1; Thu, 24 Oct 2019 11:05:01 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E56508797DC;
 Thu, 24 Oct 2019 14:27:19 +0000 (UTC)
Received: from linux.fritz.box.com (unknown [10.36.118.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B001854560;
 Thu, 24 Oct 2019 14:27:17 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 2/2] qcow2: Fix corruption bug in
 qcow2_detect_metadata_preallocation()
Date: Thu, 24 Oct 2019 16:26:58 +0200
Message-Id: <20191024142658.22306-3-kwolf@redhat.com>
In-Reply-To: <20191024142658.22306-1-kwolf@redhat.com>
References: <20191024142658.22306-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: YR5yCBgfMc2s9v2MlTELUA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: kwolf@redhat.com, psyhomb@gmail.com, michael@weiser.dinsnail.net,
 vsementsov@virtuozzo.com, den@virtuozzo.com, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, dgilbert@redhat.com, mreitz@redhat.com,
 lersek@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qcow2_detect_metadata_preallocation() calls qcow2_get_refcount() which
requires s->lock to be taken to protect its accesses to the refcount
table and refcount blocks. However, nothing in this code path actually
took the lock. This could cause the same cache entry to be used by two
requests at the same time, for different tables at different offsets,
resulting in image corruption.

As it would be preferable to base the detection on consistent data (even
though it's just heuristics), let's take the lock not only around the
qcow2_get_refcount() calls, but around the whole function.

This patch takes the lock in qcow2_co_block_status() earlier and asserts
in qcow2_detect_metadata_preallocation() that we hold the lock.

Fixes: 69f47505ee66afaa513305de0c1895a224e52c45
Cc: qemu-stable@nongnu.org
Reported-by: Michael Weiser <michael@weiser.dinsnail.net>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2-refcount.c | 2 ++
 block/qcow2.c          | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index ef965d7895..0d64bf5a5e 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -3455,6 +3455,8 @@ int qcow2_detect_metadata_preallocation(BlockDriverSt=
ate *bs)
     int64_t i, end_cluster, cluster_count =3D 0, threshold;
     int64_t file_length, real_allocation, real_clusters;
=20
+    qemu_co_mutex_assert_locked(&s->lock);
+
     file_length =3D bdrv_getlength(bs->file->bs);
     if (file_length < 0) {
         return file_length;
diff --git a/block/qcow2.c b/block/qcow2.c
index 8b05933565..0bc69e6996 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1916,6 +1916,8 @@ static int coroutine_fn qcow2_co_block_status(BlockDr=
iverState *bs,
     unsigned int bytes;
     int status =3D 0;
=20
+    qemu_co_mutex_lock(&s->lock);
+
     if (!s->metadata_preallocation_checked) {
         ret =3D qcow2_detect_metadata_preallocation(bs);
         s->metadata_preallocation =3D (ret =3D=3D 1);
@@ -1923,7 +1925,6 @@ static int coroutine_fn qcow2_co_block_status(BlockDr=
iverState *bs,
     }
=20
     bytes =3D MIN(INT_MAX, count);
-    qemu_co_mutex_lock(&s->lock);
     ret =3D qcow2_get_cluster_offset(bs, offset, &bytes, &cluster_offset);
     qemu_co_mutex_unlock(&s->lock);
     if (ret < 0) {
--=20
2.20.1


