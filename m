Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 211483CFD6F
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:24:23 +0200 (CEST)
Received: from localhost ([::1]:56518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5rba-0004Vv-5E
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:24:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m5rPP-0003ne-8H
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:11:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m5rPL-0001Fx-Gt
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:11:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626793902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=06Cz+eWQpXPVbffk6f06b6I8mG2bgliggygM46peeWI=;
 b=cnv6LH8ls12gSX3u4BDkW6RcYJN6/17dKUIjEcCB/QLJ+LVIaDnrrGOt436xmUO3ooDosB
 MDQGNx3fdiXYxFM1Sx5Vkw9cpF2De8i2ct11sA5Yocz6ZgMRSeSx2wA5/T6ZQiex5pQk/f
 KhfTsGJ0kSfx7S4mXurbLAkmgeFeQdg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-izX9ox-5P-az05JtabAe_w-1; Tue, 20 Jul 2021 11:11:41 -0400
X-MC-Unique: izX9ox-5P-az05JtabAe_w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 086CC1017990;
 Tue, 20 Jul 2021 15:11:12 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-81.ams2.redhat.com [10.36.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 158A860843;
 Tue, 20 Jul 2021 15:11:10 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 08/11] replication: Remove workaround
Date: Tue, 20 Jul 2021 17:10:50 +0200
Message-Id: <20210720151053.226144-9-kwolf@redhat.com>
In-Reply-To: <20210720151053.226144-1-kwolf@redhat.com>
References: <20210720151053.226144-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lukas Straub <lukasstraub2@web.de>

Remove the workaround introduced in commit
6ecbc6c52672db5c13805735ca02784879ce8285
"replication: Avoid blk_make_empty() on read-only child".

It is not needed anymore since s->hidden_disk is guaranteed to be
writable when secondary_do_checkpoint() runs. Because replication_start(),
_do_checkpoint() and _stop() are only called by COLO migration code
and COLO-migration activates all disks via bdrv_invalidate_cache_all()
before it calls these functions.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <d3acfad43879e9f376bffa7dd797ae74d0a7c81a.1626619393.git.lukasstraub2@web.de>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/replication.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/block/replication.c b/block/replication.c
index b74192f795..32444b9a8f 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -346,17 +346,7 @@ static void secondary_do_checkpoint(BlockDriverState *bs, Error **errp)
         return;
     }
 
-    BlockBackend *blk = blk_new(qemu_get_current_aio_context(),
-                                BLK_PERM_WRITE, BLK_PERM_ALL);
-    blk_insert_bs(blk, s->hidden_disk->bs, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        blk_unref(blk);
-        return;
-    }
-
-    ret = blk_make_empty(blk, errp);
-    blk_unref(blk);
+    ret = bdrv_make_empty(s->hidden_disk, errp);
     if (ret < 0) {
         return;
     }
-- 
2.31.1


