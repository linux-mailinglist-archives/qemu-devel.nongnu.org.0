Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B9F3B1D1F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 17:04:26 +0200 (CEST)
Received: from localhost ([::1]:58546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw4QT-0008Gq-K4
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 11:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lw4O8-0004om-52
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:02:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lw4O6-0004m3-5M
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:01:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624460517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Egj7iDznbXv1swyJTjX1OYn4yl6Dt2WIO3tRfvdXgXw=;
 b=L2xvWlSC6Xyx0v/1eOWHKxlNnlJB5NCSrHs9S2Efsq9hN9LSF2dBncoZb6jZAUjMZarSe5
 WrQTwWye5oyShUTNNWUgAeeToVUzVM8P/tSztPrRl+IkA7by5TiGRexqyOAGF+6izzQgTm
 xrGs1b/LGJeLLHizBaHksTymOKq1R7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-uYZOC0grNkibQ2n6CVH6Vg-1; Wed, 23 Jun 2021 11:01:53 -0400
X-MC-Unique: uYZOC0grNkibQ2n6CVH6Vg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81ECE1084F75;
 Wed, 23 Jun 2021 15:01:52 +0000 (UTC)
Received: from localhost (ovpn-113-73.ams2.redhat.com [10.36.113.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2331A10016F8;
 Wed, 23 Jun 2021 15:01:51 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 3/6] block: Clarify that @bytes is no limit on *pnum
Date: Wed, 23 Jun 2021 17:01:40 +0200
Message-Id: <20210623150143.188184-4-mreitz@redhat.com>
In-Reply-To: <20210623150143.188184-1-mreitz@redhat.com>
References: <20210623150143.188184-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
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
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block_int.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index fcb599dd1c..f85b96ed99 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -347,6 +347,11 @@ struct BlockDriver {
      * clamped to bdrv_getlength() and aligned to request_alignment,
      * as well as non-NULL pnum, map, and file; in turn, the driver
      * must return an error or set pnum to an aligned non-zero value.
+     *
+     * Note that @bytes is just a hint on how big of a region the
+     * caller wants to inspect.  It is not a limit on *pnum.
+     * Implementations are free to return larger values of *pnum if
+     * doing so does not incur a performance penalty.
      */
     int coroutine_fn (*bdrv_co_block_status)(BlockDriverState *bs,
         bool want_zero, int64_t offset, int64_t bytes, int64_t *pnum,
-- 
2.31.1


