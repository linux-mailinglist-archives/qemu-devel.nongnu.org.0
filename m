Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A499689E1A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 16:25:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNxtm-0007KC-FS; Fri, 03 Feb 2023 10:22:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pNxtk-0007JJ-IF
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 10:22:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pNxtj-0005HD-40
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 10:22:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675437762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9FWIxIX0VhSeabhTBkO39/gJmbAWNLg0jACV2soe1Yg=;
 b=WDTY9NjKbx4TuS5vf7BAKPiuYa9Gubwbv5eo4P0ZDFPYsSS6IBe+6tQsHKm4APGpgfFTTm
 k+yReASMDELAfcRaf8AEGzMeFNohZ0SRHJ7jCSWYOgBGbStB8Ho8/Abkid6qitJnMoF12n
 THkYL8AdxGoA92UQmAU83iZbOUu+Q8A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-345-Ccw1MxUBM62M79Ix9Ve1EA-1; Fri, 03 Feb 2023 10:22:36 -0500
X-MC-Unique: Ccw1MxUBM62M79Ix9Ve1EA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6083101B429;
 Fri,  3 Feb 2023 15:22:35 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC230410B1AD;
 Fri,  3 Feb 2023 15:22:34 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, pbonzini@redhat.com, stefanha@redhat.com,
 eesposit@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 02/23] mirror: Fix access of uninitialised fields during start
Date: Fri,  3 Feb 2023 16:21:41 +0100
Message-Id: <20230203152202.49054-3-kwolf@redhat.com>
In-Reply-To: <20230203152202.49054-1-kwolf@redhat.com>
References: <20230203152202.49054-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

bdrv_mirror_top_pwritev() accesses the job object when active mirroring
is enabled. It disables this code during early initialisation while
s->job isn't set yet.

However, s->job is still set way too early when the job object isn't
fully initialised. For example, &s->ops_in_flight isn't initialised yet
and the in_flight bitmap doesn't exist yet. This causes crashes when a
write request comes in too early.

Move the assignment of s->job to when the mirror job is actually fully
initialised to make sure that the mirror_top driver doesn't access it
too early.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/mirror.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/block/mirror.c b/block/mirror.c
index ab326b67c9..fbbb4f619e 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -896,6 +896,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
 {
     MirrorBlockJob *s = container_of(job, MirrorBlockJob, common.job);
     BlockDriverState *bs = s->mirror_top_bs->backing->bs;
+    MirrorBDSOpaque *mirror_top_opaque = s->mirror_top_bs->opaque;
     BlockDriverState *target_bs = blk_bs(s->target);
     bool need_drain = true;
     BlockDeviceIoStatus iostatus;
@@ -985,6 +986,12 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
         }
     }
 
+    /*
+     * Only now the job is fully initialised and mirror_top_bs should start
+     * accessing it.
+     */
+    mirror_top_opaque->job = s;
+
     assert(!s->dbi);
     s->dbi = bdrv_dirty_iter_new(s->dirty_bitmap);
     for (;;) {
@@ -1704,7 +1711,6 @@ static BlockJob *mirror_start_job(
     if (!s) {
         goto fail;
     }
-    bs_opaque->job = s;
 
     /* The block job now has a reference to this node */
     bdrv_unref(mirror_top_bs);
-- 
2.38.1


