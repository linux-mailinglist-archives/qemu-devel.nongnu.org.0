Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 867AE2D7CC6
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:27:27 +0100 (CET)
Received: from localhost ([::1]:47102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmCU-0000YZ-Gs
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:27:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knlvX-0004lf-NA
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:09:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knluo-0002Mm-5l
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:09:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jndb6B5lBHrI91u/GDfiNUD87XHYMBIRDIRaz9pfsmo=;
 b=TbvqPMQyesyf0ToimHQPOjSHoclpvL/ppVU9yaU12mGfoUu1eCjCpPMzw9tNkjRUKtUmL5
 UTCw6u66cMvmM9h3abaD2ThbTXvt95kWVdiFz1hhTAe8DyLpJ90ius0OyMr5qCSiPE1z1n
 x730aV50WJSF661F1I5acnJgs6zZnrk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-zT_5xmelMlCXcE3sl8G1RA-1; Fri, 11 Dec 2020 12:09:03 -0500
X-MC-Unique: zT_5xmelMlCXcE3sl8G1RA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C04751005504;
 Fri, 11 Dec 2020 17:09:02 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDE045D6A8;
 Fri, 11 Dec 2020 17:09:01 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 33/34] block: Fix locking in qmp_block_resize()
Date: Fri, 11 Dec 2020 18:08:11 +0100
Message-Id: <20201211170812.228643-34-kwolf@redhat.com>
In-Reply-To: <20201211170812.228643-1-kwolf@redhat.com>
References: <20201211170812.228643-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The drain functions assume that we hold the AioContext lock of the
drained block node. Make sure to actually take the lock.

Cc: qemu-stable@nongnu.org
Fixes: eb94b81a94bce112e6b206df846c1551aaf6cab6
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20201203172311.68232-3-kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 blockdev.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/blockdev.c b/blockdev.c
index 660c735c81..412354b4b6 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2481,13 +2481,16 @@ void coroutine_fn qmp_block_resize(bool has_device, const char *device,
         return;
     }
 
+    bdrv_co_lock(bs);
     bdrv_drained_begin(bs);
+    bdrv_co_unlock(bs);
+
     old_ctx = bdrv_co_enter(bs);
     blk_truncate(blk, size, false, PREALLOC_MODE_OFF, 0, errp);
     bdrv_co_leave(bs, old_ctx);
-    bdrv_drained_end(bs);
 
     bdrv_co_lock(bs);
+    bdrv_drained_end(bs);
     blk_unref(blk);
     bdrv_co_unlock(bs);
 }
-- 
2.29.2


