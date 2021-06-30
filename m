Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C0A3B86D6
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 18:10:51 +0200 (CEST)
Received: from localhost ([::1]:59384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lycna-0000V6-QT
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 12:10:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycfO-0002aL-I0
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:02:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycfJ-0006uZ-KW
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:02:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625068936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z8X3FKADVp/gBsZl3Z9T0lIT3DesjSNTXgZSYcBtxaE=;
 b=REh/O3A3ZTQjprvA7VsZmMGVQoe85+S97cu7ZTzfu+fe46oz8LI0CQhV20XFzVNuZ1aIPo
 UZNO13czHbAUwCzgcrFslMe9g7lz3+jOg12HEjfMv9V+zvsg/VQOrc/Qz0pxtmzWqNakio
 uA6fGoSnTxcw9P5ooZzcERUoNwmQkoY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-qm4CmJYsNn6bTvlvIde1EA-1; Wed, 30 Jun 2021 12:02:14 -0400
X-MC-Unique: qm4CmJYsNn6bTvlvIde1EA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED08DA40C5;
 Wed, 30 Jun 2021 16:02:13 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-114.ams2.redhat.com [10.36.114.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0571B604CD;
 Wed, 30 Jun 2021 16:02:12 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 02/24] block: Move read-only check during truncation earlier
Date: Wed, 30 Jun 2021 18:01:44 +0200
Message-Id: <20210630160206.276439-3-kwolf@redhat.com>
In-Reply-To: <20210630160206.276439-1-kwolf@redhat.com>
References: <20210630160206.276439-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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

From: Eric Blake <eblake@redhat.com>

No need to start a tracked request that will always fail.  The choice
to check read-only after bdrv_inc_in_flight() predates 1bc5f09f2e
(block: Use tracked request for truncate), but waiting for serializing
requests can make the effect more noticeable.

Signed-off-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210609163034.997943-1-eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/io.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/block/io.c b/block/io.c
index dd93364258..cf177a9d2d 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3392,6 +3392,11 @@ int coroutine_fn bdrv_co_truncate(BdrvChild *child, int64_t offset, bool exact,
         return old_size;
     }
 
+    if (bdrv_is_read_only(bs)) {
+        error_setg(errp, "Image is read-only");
+        return -EACCES;
+    }
+
     if (offset > old_size) {
         new_bytes = offset - old_size;
     } else {
@@ -3408,11 +3413,6 @@ int coroutine_fn bdrv_co_truncate(BdrvChild *child, int64_t offset, bool exact,
     if (new_bytes) {
         bdrv_make_request_serialising(&req, 1);
     }
-    if (bdrv_is_read_only(bs)) {
-        error_setg(errp, "Image is read-only");
-        ret = -EACCES;
-        goto out;
-    }
     ret = bdrv_co_write_req_prepare(child, offset - new_bytes, new_bytes, &req,
                                     0);
     if (ret < 0) {
-- 
2.31.1


