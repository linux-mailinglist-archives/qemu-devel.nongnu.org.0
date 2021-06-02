Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB64398B26
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:55:37 +0200 (CEST)
Received: from localhost ([::1]:45204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loRLM-0006Re-HD
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:55:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRCP-0001WY-Lt
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:46:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRCN-0007Jw-TE
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:46:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622641579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mkpp5OqanXbInZTG+8hUEoObj4JueAq7ykXfwjTDSKo=;
 b=BgUHn22dLnyXBx3JYZxhTG6iWOxrnapPUYx8ykEF4gSTftyErLgqEDfFhmR0obnZ2g0kR7
 5P7YqL5M0MkzoHFAI0QXMOslZk02FBMZ1FyHhfxOfGm+BpxRgyYkvNv8drY+x7KizQEpUE
 9NZocflQr2ESZwmSY+y0Y9Xp+i5qMvs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-Pbtj5aLYN7-qhE6Xi-QAug-1; Wed, 02 Jun 2021 09:46:17 -0400
X-MC-Unique: Pbtj5aLYN7-qhE6Xi-QAug-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A8A71922965;
 Wed,  2 Jun 2021 13:45:48 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-240.ams2.redhat.com [10.36.114.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BAD360BD9;
 Wed,  2 Jun 2021 13:45:47 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 11/20] block-backend: improve blk_root_get_parent_desc()
Date: Wed,  2 Jun 2021 15:45:20 +0200
Message-Id: <20210602134529.231756-12-kwolf@redhat.com>
In-Reply-To: <20210602134529.231756-1-kwolf@redhat.com>
References: <20210602134529.231756-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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

We have different types of parents: block nodes, block backends and
jobs. So, it makes sense to specify type together with name.

While being here also use g_autofree.

iotest 307 output is updated.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Message-Id: <20210601075218.79249-3-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/block-backend.c      | 9 ++++-----
 tests/qemu-iotests/307.out | 2 +-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index d1a33a2c8e..5be32c0c42 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -141,19 +141,18 @@ static void blk_root_set_aio_ctx(BdrvChild *child, AioContext *ctx,
 static char *blk_root_get_parent_desc(BdrvChild *child)
 {
     BlockBackend *blk = child->opaque;
-    char *dev_id;
+    g_autofree char *dev_id = NULL;
 
     if (blk->name) {
-        return g_strdup(blk->name);
+        return g_strdup_printf("block device '%s'", blk->name);
     }
 
     dev_id = blk_get_attached_dev_id(blk);
     if (*dev_id) {
-        return dev_id;
+        return g_strdup_printf("block device '%s'", dev_id);
     } else {
         /* TODO Callback into the BB owner for something more detailed */
-        g_free(dev_id);
-        return g_strdup("a block device");
+        return g_strdup("an unnamed block device");
     }
 }
 
diff --git a/tests/qemu-iotests/307.out b/tests/qemu-iotests/307.out
index daa8ad2da0..66bf2ddb74 100644
--- a/tests/qemu-iotests/307.out
+++ b/tests/qemu-iotests/307.out
@@ -53,7 +53,7 @@ exports available: 1
 
 === Add a writable export ===
 {"execute": "block-export-add", "arguments": {"description": "This is the writable second export", "id": "export1", "name": "export1", "node-name": "fmt", "type": "nbd", "writable": true, "writethrough": true}}
-{"error": {"class": "GenericError", "desc": "Conflicts with use by sda as 'root', which does not allow 'write' on fmt"}}
+{"error": {"class": "GenericError", "desc": "Conflicts with use by block device 'sda' as 'root', which does not allow 'write' on fmt"}}
 {"execute": "device_del", "arguments": {"id": "sda"}}
 {"return": {}}
 {"data": {"device": "sda", "path": "/machine/peripheral/sda"}, "event": "DEVICE_DELETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
-- 
2.30.2


