Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8DB41A2A8
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 00:08:00 +0200 (CEST)
Received: from localhost ([::1]:56660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUyn1-0006Q3-8h
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 18:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUybe-0002f5-IJ
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:56:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUybZ-0002tH-TN
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:56:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632779768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NxO4OylQBnHRwBakwTpZ1GdVAMFwP5cZPLLTPb9c9fg=;
 b=aYk7Hvg4/8fG/8cQXEdvNFGwyJapDPFhHkbP0as3/bpP5qGofG0WTm7he63+/vLEqU94ph
 MOfQ20CCEstQsVoMECBek9LDt+rsOkivXHTSEXuESE8kxtsQ4k16ejs/ufWXLqAWNmCy8F
 N41UQyg6Z8VG1Y3V/xjpYkux5l2cToA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-xa-DHGLCMxmZkFJ78-BGjA-1; Mon, 27 Sep 2021 17:56:07 -0400
X-MC-Unique: xa-DHGLCMxmZkFJ78-BGjA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B24518125C2;
 Mon, 27 Sep 2021 21:56:06 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-87.phx2.redhat.com [10.3.113.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4EB4B5D9D5;
 Mon, 27 Sep 2021 21:56:04 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/20] block: make BlockLimits::max_pwrite_zeroes 64bit
Date: Mon, 27 Sep 2021 16:55:32 -0500
Message-Id: <20210927215545.3930309-8-eblake@redhat.com>
In-Reply-To: <20210927215545.3930309-1-eblake@redhat.com>
References: <20210927215545.3930309-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block I/O path" <qemu-block@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We are going to support 64 bit write-zeroes requests. Now update the
limit variable. It's absolutely safe. The variable is set in some
drivers, and used in bdrv_co_do_pwrite_zeroes().

Update also max_write_zeroes variable in bdrv_co_do_pwrite_zeroes(), so
that bdrv_co_do_pwrite_zeroes() is now prepared to 64bit requests. The
remaining logic including num, offset and bytes variables is already
supporting 64bit requests.

So the only thing that prevents 64 bit requests is limiting
max_write_zeroes variable to INT_MAX in bdrv_co_do_pwrite_zeroes().
We'll drop this limitation after updating all block drivers.

Ah, we also have bdrv_check_request32() in bdrv_co_pwritev_part(). It
will be modified to do bdrv_check_request() for write-zeroes path.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210903102807.27127-7-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/block/block_int.h | 9 +++++----
 block/io.c                | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 5536f49bc67c..24958acd33f4 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -686,10 +686,11 @@ typedef struct BlockLimits {
      * that is set. May be 0 if bl.request_alignment is good enough */
     uint32_t pdiscard_alignment;

-    /* Maximum number of bytes that can zeroized at once (since it is
-     * signed, it must be < 2G, if set). Must be multiple of
-     * pwrite_zeroes_alignment. May be 0 if no inherent 32-bit limit */
-    int32_t max_pwrite_zeroes;
+    /*
+     * Maximum number of bytes that can zeroized at once. Must be multiple of
+     * pwrite_zeroes_alignment. 0 means no limit.
+     */
+    int64_t max_pwrite_zeroes;

     /* Optimal alignment for write zeroes requests in bytes. A power
      * of 2 is best but not mandatory.  Must be a multiple of
diff --git a/block/io.c b/block/io.c
index aa6f7b075e78..0090224603f5 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1869,7 +1869,7 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
     int head = 0;
     int tail = 0;

-    int max_write_zeroes = MIN_NON_ZERO(bs->bl.max_pwrite_zeroes, INT_MAX);
+    int64_t max_write_zeroes = MIN_NON_ZERO(bs->bl.max_pwrite_zeroes, INT_MAX);
     int alignment = MAX(bs->bl.pwrite_zeroes_alignment,
                         bs->bl.request_alignment);
     int max_transfer = MIN_NON_ZERO(bs->bl.max_transfer, MAX_BOUNCE_BUFFER);
-- 
2.31.1


