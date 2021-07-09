Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A653C240A
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 15:10:55 +0200 (CEST)
Received: from localhost ([::1]:34290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1qHO-0002r1-JU
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 09:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pz9-0004nk-NA
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:52:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pz4-0003gF-OK
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:52:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625835118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Oa33kb0ChKLxUkuz+ELX45fYSNMxN2cB0tfcg9tRRA=;
 b=RigVYpNYj5JPFUbUWVrvBvKszuAhXTbL/n/LCwXgyFXy9/K6T1mLILAkynm9pq+idiVzc3
 1cjqQcpAESZPCyC7uABnPWzd9ud7ThE1HDe/WJ+XTBxp1cxZYDE3eOrlSIRtqaSoGaWGxk
 B2bFUGdzcWHljfHe7dKRXuerSNPk2Rs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-Tzhhfn1rPbWbj9E3tzSnjg-1; Fri, 09 Jul 2021 08:51:56 -0400
X-MC-Unique: Tzhhfn1rPbWbj9E3tzSnjg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8A9E362FB;
 Fri,  9 Jul 2021 12:51:55 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-203.ams2.redhat.com [10.36.113.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C698560843;
 Fri,  9 Jul 2021 12:51:54 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 19/28] blockdev: fix drive-backup transaction endless drained
 section
Date: Fri,  9 Jul 2021 14:50:26 +0200
Message-Id: <20210709125035.191321-20-kwolf@redhat.com>
In-Reply-To: <20210709125035.191321-1-kwolf@redhat.com>
References: <20210709125035.191321-1-kwolf@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

drive_backup_prepare() does bdrv_drained_begin() in hope that
bdrv_drained_end() will be called in drive_backup_clean(). Still we
need to set state->bs for this to work. That's done too late: a lot of
failure paths in drive_backup_prepare() miss setting state->bs. Fix
that.

Fixes: 2288ccfac96281c316db942d10e3f921c1373064
Fixes: https://gitlab.com/qemu-project/qemu/-/issues/399
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210608171852.250775-1-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 blockdev.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index f08192deda..094c085962 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1714,6 +1714,7 @@ static void drive_backup_prepare(BlkActionState *common, Error **errp)
     aio_context = bdrv_get_aio_context(bs);
     aio_context_acquire(aio_context);
 
+    state->bs = bs;
     /* Paired with .clean() */
     bdrv_drained_begin(bs);
 
@@ -1813,8 +1814,6 @@ static void drive_backup_prepare(BlkActionState *common, Error **errp)
         }
     }
 
-    state->bs = bs;
-
     state->job = do_backup_common(qapi_DriveBackup_base(backup),
                                   bs, target_bs, aio_context,
                                   common->block_job_txn, errp);
-- 
2.31.1


