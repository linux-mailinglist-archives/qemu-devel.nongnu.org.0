Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D19D3EA0C8
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 10:44:22 +0200 (CEST)
Received: from localhost ([::1]:38300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE6K5-0007rL-4X
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 04:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mE6Hr-0004fm-5c
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 04:42:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mE6Hp-0004hT-62
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 04:42:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628757719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AJc/JbhYorjEy4i7jmhVfBMpq2Saco4d+IvoYw2Dqps=;
 b=TS9hSyGqlcTVLVrkbFjLDUvP48D+B8CAmFfGrh30Ew6Y0peUHOwK9YGsR3dcjwzrlUyTZz
 VSX0PDiNg/2WiRsJLQkKqSlbRUrl1Cv3XFM9wiS23Ry1QWti5g/pI4uVh5viyELmRjdJdi
 D/2YQGwKRUIQOsH38mLlYsAgXHnbRP8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-AubHUzSAOs6GytN2BhLrtg-1; Thu, 12 Aug 2021 04:41:57 -0400
X-MC-Unique: AubHUzSAOs6GytN2BhLrtg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5FE7190B2A2;
 Thu, 12 Aug 2021 08:41:56 +0000 (UTC)
Received: from localhost (unknown [10.39.193.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CB9A4536;
 Thu, 12 Aug 2021 08:41:56 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 3/6] block: Clarify that @bytes is no limit on *pnum
Date: Thu, 12 Aug 2021 10:41:45 +0200
Message-Id: <20210812084148.14458-4-hreitz@redhat.com>
In-Reply-To: <20210812084148.14458-1-hreitz@redhat.com>
References: <20210812084148.14458-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.7, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

.bdrv_co_block_status() implementations are free to return a *pnum that
exceeds @bytes, because bdrv_co_block_status() in block/io.c will clamp
*pnum as necessary.

On the other hand, if drivers' implementations return values for *pnum
that are as large as possible, our recently introduced block-status
cache will become more effective.

So, make a note in block_int.h that @bytes is no upper limit for *pnum.

Suggested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 437d746733..5451f89b8d 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -348,6 +348,15 @@ struct BlockDriver {
      * clamped to bdrv_getlength() and aligned to request_alignment,
      * as well as non-NULL pnum, map, and file; in turn, the driver
      * must return an error or set pnum to an aligned non-zero value.
+     *
+     * Note that @bytes is just a hint on how big of a region the
+     * caller wants to inspect.  It is not a limit on *pnum.
+     * Implementations are free to return larger values of *pnum if
+     * doing so does not incur a performance penalty.
+     *
+     * block/io.c's bdrv_co_block_status() will utilize an unclamped
+     * *pnum value for the block-status cache on protocol nodes, prior
+     * to clamping *pnum for return to its caller.
      */
     int coroutine_fn (*bdrv_co_block_status)(BlockDriverState *bs,
         bool want_zero, int64_t offset, int64_t bytes, int64_t *pnum,
-- 
2.31.1


