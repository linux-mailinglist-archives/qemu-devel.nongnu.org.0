Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 741C242FD43
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 23:13:00 +0200 (CEST)
Received: from localhost ([::1]:56764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbUVf-00028f-G9
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 17:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mbUTC-0007Sw-2u
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 17:10:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mbUT6-0000al-9n
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 17:10:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634332218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ZRle+JZn4ejZdQH4RYOeKHUzM/Dg2KEG8y7izHl4Do=;
 b=d0AdCzflC4yv7WdUr74sxiM3SybEwMbTaqShSO4U6y+DZPHviDceOSr/PdPU91OUTtItdj
 HQdJZkW6BqAxBJZP1ltk6J5iyz6WhAQO15IDw/gdbGxOg9NVQZ/+9cjJ6X2pIFgkmQzbOT
 ydWEg1At/sAjjs4VpuaO3ADCVdRFUfw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-AwapESOwNfuFAIEpNc8Dcg-1; Fri, 15 Oct 2021 17:10:16 -0400
X-MC-Unique: AwapESOwNfuFAIEpNc8Dcg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 022F0802575;
 Fri, 15 Oct 2021 21:10:16 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-130.phx2.redhat.com [10.3.114.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5CD7E19739;
 Fri, 15 Oct 2021 21:10:15 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/15] block-backend: blk_check_byte_request(): int64_t bytes
Date: Fri, 15 Oct 2021 16:09:57 -0500
Message-Id: <20211015211011.1272011-3-eblake@redhat.com>
In-Reply-To: <20211015211011.1272011-1-eblake@redhat.com>
References: <20211015211011.1272011-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Rename size and make it int64_t to correspond to modern block layer,
which always uses int64_t for offset and bytes (not in blk layer yet,
which is a task for following commits).

All callers pass int or unsigned int.

So, for bytes in [0, INT_MAX] nothing is changed, for negative bytes we
now fail on "bytes < 0" check instead of "bytes > INT_MAX" check.

Note, that blk_check_byte_request() still doesn't allow requests
exceeding INT_MAX.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20211006131718.214235-2-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/block-backend.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index ba2b5ebb1008..2c62210687e7 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1161,11 +1161,11 @@ void blk_set_disable_request_queuing(BlockBackend *blk, bool disable)
 }

 static int blk_check_byte_request(BlockBackend *blk, int64_t offset,
-                                  size_t size)
+                                  int64_t bytes)
 {
     int64_t len;

-    if (size > INT_MAX) {
+    if (bytes < 0 || bytes > INT_MAX) {
         return -EIO;
     }

@@ -1183,7 +1183,7 @@ static int blk_check_byte_request(BlockBackend *blk, int64_t offset,
             return len;
         }

-        if (offset > len || len - offset < size) {
+        if (offset > len || len - offset < bytes) {
             return -EIO;
         }
     }
-- 
2.31.1


