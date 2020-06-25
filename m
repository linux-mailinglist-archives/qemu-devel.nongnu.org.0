Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 904AD20A257
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 17:47:51 +0200 (CEST)
Received: from localhost ([::1]:45124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joU6O-0006VM-R5
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 11:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1joTjA-0006kh-Hb
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 11:23:48 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:37876
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1joTj8-0001Px-BG
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 11:23:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593098625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+IEs/J5V97t+K7qXqSnYOoZJv1OiExIbkpNL2hKSuJU=;
 b=OqGKHS9PnZL2yjVnAbiAlxYntu9/5o3T/4sk2VDyrY3GQwV5zJQLKtQgNrXMx/+VDDp2gY
 nJORgeXCzMFG7NFmzbNTiO53GVO6ZdqrQ3Til5skvtCtmW5en3SO3N9HqBz/y58VAaXRAR
 oA64fl4Oljf3kh6UjG8MQc7qZoxUrBw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-mqWUYolmMuaqDH1nTFhnHw-1; Thu, 25 Jun 2020 11:23:43 -0400
X-MC-Unique: mqWUYolmMuaqDH1nTFhnHw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D64C0464;
 Thu, 25 Jun 2020 15:23:42 +0000 (UTC)
Received: from localhost (ovpn-113-182.ams2.redhat.com [10.36.113.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BD4E579A3;
 Thu, 25 Jun 2020 15:23:42 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 38/47] block: Drop backing_bs()
Date: Thu, 25 Jun 2020 17:22:06 +0200
Message-Id: <20200625152215.941773-39-mreitz@redhat.com>
In-Reply-To: <20200625152215.941773-1-mreitz@redhat.com>
References: <20200625152215.941773-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 00:45:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to make it explicit where bs->backing is used, and we have done
so.  The old role of backing_bs() is now effectively taken by
bdrv_cow_bs().

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index c963ee9f28..6e09e15ed4 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -991,11 +991,6 @@ typedef enum BlockMirrorBackingMode {
     MIRROR_LEAVE_BACKING_CHAIN,
 } BlockMirrorBackingMode;
 
-static inline BlockDriverState *backing_bs(BlockDriverState *bs)
-{
-    return bs->backing ? bs->backing->bs : NULL;
-}
-
 
 /* Essential block drivers which must always be statically linked into qemu, and
  * which therefore can be accessed without using bdrv_find_format() */
-- 
2.26.2


