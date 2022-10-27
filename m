Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA6A610089
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 20:43:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7g6-0001He-J4; Thu, 27 Oct 2022 14:32:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7g3-0001B5-OT
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7g0-0002PC-7y
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Cf/X7gQtfuOmGLbxm4ouPN4MTl69jYTN+3EneXyksQ=;
 b=C7SehuAqfQM/jtipHOHyjQk9pJDLcstxD6Qs3+ATHWCet8UcBCycb12RCPMV+nJHOvKszY
 Jfnvdt4r2ChgyN33J2iLNT8DuQAWSliY/yVXzGYH0EWOz3UBtLmoqSVlhXnXNtAxFlrfeq
 6fQV6NuGPRL/mhuSA8ANUAVHhX0Oidw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-xPj04jeOPLGmlkLWaWvDCg-1; Thu, 27 Oct 2022 14:32:22 -0400
X-MC-Unique: xPj04jeOPLGmlkLWaWvDCg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EF65101AA79;
 Thu, 27 Oct 2022 18:32:21 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0477E1121320;
 Thu, 27 Oct 2022 18:32:10 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 08/58] block: BlockDriver: add .filtered_child_is_backing field
Date: Thu, 27 Oct 2022 20:30:56 +0200
Message-Id: <20221027183146.463129-9-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Unfortunately not all filters use .file child as filtered child. Two
exclusions are mirror_top and commit_top. Happily they both are private
filters. Bad thing is that this inconsistency is observable through qmp
commands query-block / query-named-block-nodes. So, could we just
change mirror_top and commit_top to use file child as all other filter
driver is an open question. Probably, we could do that with some kind
of deprecation period, but how to warn users during it?

For now, let's just add a field so we can distinguish them in generic
code, it will be used in further commits.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220726201134.924743-2-vsementsov@yandex-team.ru>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block_int-common.h | 13 +++++++++++++
 block/commit.c                   |  1 +
 block/mirror.c                   |  1 +
 3 files changed, 15 insertions(+)

diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index d7c0a7e96f..95392052c9 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -119,6 +119,19 @@ struct BlockDriver {
      * (And this filtered child must then be bs->file or bs->backing.)
      */
     bool is_filter;
+    /*
+     * Only make sense for filter drivers, for others must be false.
+     * If true, filtered child is bs->backing. Otherwise it's bs->file.
+     * Only two internal filters use bs->backing as filtered child and has this
+     * field set to true: mirror_top and commit_top.
+     *
+     * Never create any more such filters!
+     *
+     * TODO: imagine how to deprecate this behavior and make all filters work
+     * similarly using bs->file as filtered child.
+     */
+    bool filtered_child_is_backing;
+
     /*
      * Set to true if the BlockDriver is a format driver.  Format nodes
      * generally do not expect their children to be other format nodes
diff --git a/block/commit.c b/block/commit.c
index 38571510cb..e210e86bac 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -238,6 +238,7 @@ static BlockDriver bdrv_commit_top = {
     .bdrv_child_perm            = bdrv_commit_top_child_perm,
 
     .is_filter                  = true,
+    .filtered_child_is_backing  = true,
 };
 
 void commit_start(const char *job_id, BlockDriverState *bs,
diff --git a/block/mirror.c b/block/mirror.c
index 80c0109d39..f9432af3df 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1587,6 +1587,7 @@ static BlockDriver bdrv_mirror_top = {
     .bdrv_child_perm            = bdrv_mirror_top_child_perm,
 
     .is_filter                  = true,
+    .filtered_child_is_backing  = true,
 };
 
 static BlockJob *mirror_start_job(
-- 
2.37.3


