Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9C040CC3B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 20:01:09 +0200 (CEST)
Received: from localhost ([::1]:36390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQZDY-0003Fo-J8
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 14:01:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6H-0005pX-Cl
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:53:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6D-0006Rw-Kl
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:53:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631728412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xEmsIsVZJ1b5hOCrP/lM8Zro4QPWjantR9Q31P7XTqs=;
 b=TgLHxRh1Hxa6SOo3WJBjAKV2Dsqn8zxek8EvPrxCRydGd1wkseGIJNC6Ijwmusk2K8AzBl
 mAH15ZUOq6uMytWku/oIFnH5y2gR7X7FEXlunUbeHdRcpMf71B8E54OAmxJc+TTkb37hZU
 l+rgB0ijQ80MG6cgkS3u83BwnB5tla8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-Di7TYAicO26HA0Kz2FFSLQ-1; Wed, 15 Sep 2021 13:53:30 -0400
X-MC-Unique: Di7TYAicO26HA0Kz2FFSLQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C96F684A5E0;
 Wed, 15 Sep 2021 17:53:29 +0000 (UTC)
Received: from localhost (unknown [10.39.192.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7202D5D9D3;
 Wed, 15 Sep 2021 17:53:29 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 04/32] block: Clarify that @bytes is no limit on *pnum
Date: Wed, 15 Sep 2021 19:52:50 +0200
Message-Id: <20210915175318.853225-5-hreitz@redhat.com>
In-Reply-To: <20210915175318.853225-1-hreitz@redhat.com>
References: <20210915175318.853225-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.39, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
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
Message-Id: <20210812084148.14458-4-hreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
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


