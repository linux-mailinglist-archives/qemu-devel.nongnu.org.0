Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECE2332BAE
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 17:13:46 +0100 (CET)
Received: from localhost ([::1]:44538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJezR-0000zf-Ab
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 11:13:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJefG-0004Am-RL
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:52:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJeey-00010B-4f
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:52:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615305154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MgMhVCXkfRHZO1PG5U77+yHl+aw+vu6yfdM7Xctm6X0=;
 b=DlkeWnTDTZew/OIYoSp2rf3YpC0dRkz5/klLHoWbT3qyr+gF6B/7E5hh7kX90zoTgrfxny
 fXfJ1vtUMNK5ENq86yWr0p+se/IxryZ4M5hqohRc+poL3EDWouRITImoQjehm2DD4gYzLK
 kgHrYyihV8OewRkiGoITv8NlRCcvHZc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-1JV74jIKOWaNPQtKTlIkvg-1; Tue, 09 Mar 2021 10:52:32 -0500
X-MC-Unique: 1JV74jIKOWaNPQtKTlIkvg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2778D1018F64;
 Tue,  9 Mar 2021 15:52:31 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E94A19714;
 Tue,  9 Mar 2021 15:52:30 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/17] block/qcow2-bitmap: return status from
 qcow2_store_persistent_dirty_bitmaps
Date: Tue,  9 Mar 2021 09:51:58 -0600
Message-Id: <20210309155202.1312571-14-eblake@redhat.com>
In-Reply-To: <20210309155202.1312571-1-eblake@redhat.com>
References: <20210309155202.1312571-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>,
 "open list:Dirty Bitmaps" <qemu-block@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

It's better to return status together with setting errp. It makes
possible to avoid error propagation.

While being here, put ERRP_GUARD() to fix error_prepend(errp, ...)
usage inside qcow2_store_persistent_dirty_bitmaps() (see the comment
above ERRP_GUARD() definition in include/qapi/error.h)

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Message-Id: <20210202124956.63146-11-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/qcow2.h        |  2 +-
 block/qcow2-bitmap.c | 13 ++++++-------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index d19c8832062e..0fe5f74ed3ea 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -984,7 +984,7 @@ bool qcow2_get_bitmap_info_list(BlockDriverState *bs,
                                 Qcow2BitmapInfoList **info_list, Error **errp);
 int qcow2_reopen_bitmaps_rw(BlockDriverState *bs, Error **errp);
 int qcow2_truncate_bitmaps_check(BlockDriverState *bs, Error **errp);
-void qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
+bool qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
                                           bool release_stored, Error **errp);
 int qcow2_reopen_bitmaps_ro(BlockDriverState *bs, Error **errp);
 bool qcow2_co_can_store_new_dirty_bitmap(BlockDriverState *bs,
diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index 9452e9fe76c3..f417f9ccb195 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -1531,9 +1531,10 @@ out:
  * readonly to begin with, and whether we opened directly or reopened to that
  * state shouldn't matter for the state we get afterward.
  */
-void qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
+bool qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
                                           bool release_stored, Error **errp)
 {
+    ERRP_GUARD();
     BdrvDirtyBitmap *bitmap;
     BDRVQcow2State *s = bs->opaque;
     uint32_t new_nb_bitmaps = s->nb_bitmaps;
@@ -1553,7 +1554,7 @@ void qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
         bm_list = bitmap_list_load(bs, s->bitmap_directory_offset,
                                    s->bitmap_directory_size, errp);
         if (bm_list == NULL) {
-            return;
+            return false;
         }
     }

@@ -1668,7 +1669,7 @@ success:
     }

     bitmap_list_free(bm_list);
-    return;
+    return true;

 fail:
     QSIMPLEQ_FOREACH(bm, bm_list, entry) {
@@ -1686,16 +1687,14 @@ fail:
     }

     bitmap_list_free(bm_list);
+    return false;
 }

 int qcow2_reopen_bitmaps_ro(BlockDriverState *bs, Error **errp)
 {
     BdrvDirtyBitmap *bitmap;
-    Error *local_err = NULL;

-    qcow2_store_persistent_dirty_bitmaps(bs, false, &local_err);
-    if (local_err != NULL) {
-        error_propagate(errp, local_err);
+    if (!qcow2_store_persistent_dirty_bitmaps(bs, false, errp)) {
         return -EINVAL;
     }

-- 
2.30.1


