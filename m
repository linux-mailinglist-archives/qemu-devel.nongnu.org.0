Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D44C41A277
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 00:05:24 +0200 (CEST)
Received: from localhost ([::1]:47268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUykV-0008RJ-BU
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 18:05:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUybf-0002fI-Mu
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:56:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUybc-0002vd-Ah
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:56:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632779771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Db7uj7BlWuB4tMfhYSbJArnzVFeptnWsZIkoFWOBWos=;
 b=IKjA2WyvhjuUdxibD1KrVaBa6kuwTzufevlJVvelbVKsqkSo8lBp0t+E9FeImgJu52j6Yl
 Ww7GjWr0rIR43CJHuLVS+JsLb1oQinhYpBchrf/H39O2Qz87VRBzU9CUyXUOb7baKTtakt
 9o1k592GaUS12TFwMHmsDhGJX1JR3UE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-6pfP5iedON2e1J4bvQaZEg-1; Mon, 27 Sep 2021 17:56:10 -0400
X-MC-Unique: 6pfP5iedON2e1J4bvQaZEg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4351B18125C3;
 Mon, 27 Sep 2021 21:56:09 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-87.phx2.redhat.com [10.3.113.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB22B5D9D5;
 Mon, 27 Sep 2021 21:56:08 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/20] block: make BlockLimits::max_pdiscard 64bit
Date: Mon, 27 Sep 2021 16:55:35 -0500
Message-Id: <20210927215545.3930309-11-eblake@redhat.com>
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
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block I/O path" <qemu-block@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We are going to support 64 bit discard requests. Now update the
limit variable. It's absolutely safe. The variable is set in some
drivers, and used in bdrv_co_pdiscard().

Update also max_pdiscard variable in bdrv_co_pdiscard(), so that
bdrv_co_pdiscard() is now prepared for 64bit requests. The remaining
logic including num, offset and bytes variables is already
supporting 64bit requests.

So the only thing that prevents 64 bit requests is limiting
max_pdiscard variable to INT_MAX in bdrv_co_pdiscard().
We'll drop this limitation after updating all block drivers.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210903102807.27127-10-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/block/block_int.h | 11 ++++++-----
 block/io.c                |  3 ++-
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index d518703e3e59..9b4e0748bc86 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -674,11 +674,12 @@ typedef struct BlockLimits {
      * otherwise. */
     uint32_t request_alignment;

-    /* Maximum number of bytes that can be discarded at once (since it
-     * is signed, it must be < 2G, if set). Must be multiple of
-     * pdiscard_alignment, but need not be power of 2. May be 0 if no
-     * inherent 32-bit limit */
-    int32_t max_pdiscard;
+    /*
+     * Maximum number of bytes that can be discarded at once. Must be multiple
+     * of pdiscard_alignment, but need not be power of 2. May be 0 if no
+     * inherent 64-bit limit.
+     */
+    int64_t max_pdiscard;

     /* Optimal alignment for discard requests in bytes. A power of 2
      * is best but not mandatory.  Must be a multiple of
diff --git a/block/io.c b/block/io.c
index e40462742ea1..3846e2ed961b 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3056,7 +3056,8 @@ int coroutine_fn bdrv_co_pdiscard(BdrvChild *child, int64_t offset,
                                   int64_t bytes)
 {
     BdrvTrackedRequest req;
-    int max_pdiscard, ret;
+    int ret;
+    int64_t max_pdiscard;
     int head, tail, align;
     BlockDriverState *bs = child->bs;

-- 
2.31.1


