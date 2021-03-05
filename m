Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDF732F0FB
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:18:24 +0100 (CET)
Received: from localhost ([::1]:42326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIE5n-00076X-OA
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:18:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDkT-0007Bt-Eu
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDkB-0007Du-3z
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614963357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Z2AuwW/9GaMnMEUouEm1irTTlYSgTpDzabvvMAMFtI=;
 b=HNk9dnn4Nt332sl+YdEdx88PXwUxM5CpVVhAzdpB527Mlb2+ksjjWbk5sBHXoqcN4fe0z9
 UDvZXXWbe0oDZepuymCvpKBnoNOIsqspPUEZtvMFp0Ntq5tyiUxaVRZT1imq1ftsYEJsMe
 8ayjl+niQ+WcDmoGDVd58S67I7boOTk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-nSDxR5OTNJitZN52Rs1f5A-1; Fri, 05 Mar 2021 11:55:55 -0500
X-MC-Unique: nSDxR5OTNJitZN52Rs1f5A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59DCE18BEF9F;
 Fri,  5 Mar 2021 16:55:11 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C32B60BF3;
 Fri,  5 Mar 2021 16:55:10 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 03/31] backup-top: Refuse I/O in inactive state
Date: Fri,  5 Mar 2021 17:54:26 +0100
Message-Id: <20210305165454.356840-4-kwolf@redhat.com>
In-Reply-To: <20210305165454.356840-1-kwolf@redhat.com>
References: <20210305165454.356840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

From: Max Reitz <mreitz@redhat.com>

When the backup-top node transitions from active to inactive in
bdrv_backup_top_drop(), the BlockCopyState is freed and the filtered
child is removed, so the node effectively becomes unusable.

However, noone told its I/O functions this, so they will happily
continue accessing bs->backing and s->bcs.  Prevent that by aborting
early when s->active is false.

(After the preceding patch, the node should be gone after
bdrv_backup_top_drop(), so this should largely be a theoretical problem.
But still, better to be safe than sorry, and also I think it just makes
sense to check s->active in the I/O functions.)

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210219153348.41861-3-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/backup-top.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/block/backup-top.c b/block/backup-top.c
index d1253e1aa6..589e8b651d 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -45,6 +45,12 @@ static coroutine_fn int backup_top_co_preadv(
         BlockDriverState *bs, uint64_t offset, uint64_t bytes,
         QEMUIOVector *qiov, int flags)
 {
+    BDRVBackupTopState *s = bs->opaque;
+
+    if (!s->active) {
+        return -EIO;
+    }
+
     return bdrv_co_preadv(bs->backing, offset, bytes, qiov, flags);
 }
 
@@ -54,6 +60,10 @@ static coroutine_fn int backup_top_cbw(BlockDriverState *bs, uint64_t offset,
     BDRVBackupTopState *s = bs->opaque;
     uint64_t off, end;
 
+    if (!s->active) {
+        return -EIO;
+    }
+
     if (flags & BDRV_REQ_WRITE_UNCHANGED) {
         return 0;
     }
-- 
2.29.2


