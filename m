Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF052CDC75
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 18:32:56 +0100 (CET)
Received: from localhost ([::1]:44812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kksTP-00044M-AY
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 12:32:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kksKM-0006jD-9s
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:23:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kksKG-0003Sl-Tw
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:23:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607016208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cJuOJ0YpElwIyA8jgvKL1/m4MWictfzGOeNLaNfyDow=;
 b=gI4eSUxt05c2SlMn2P9dpw3E638HnIE1u2WPbQtC6+6FJ81ViKxXZtDGp8f3EWHj+5e9vN
 GZZjlO7iTalctWV4S/WHfsvKlhzQyVV2uhypK2l8U646agFpb1LmngnHLABgSApMBxknt8
 aen6xPC+nxIiCv1FapgKVz9IIrwv2oE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-mFT4B12KNzutC4pWd_gBmg-1; Thu, 03 Dec 2020 12:23:26 -0500
X-MC-Unique: mFT4B12KNzutC4pWd_gBmg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 722CF107ACE4;
 Thu,  3 Dec 2020 17:23:25 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 319DA5B4A0;
 Thu,  3 Dec 2020 17:23:24 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/3] block: Fix locking in qmp_block_resize()
Date: Thu,  3 Dec 2020 18:23:10 +0100
Message-Id: <20201203172311.68232-3-kwolf@redhat.com>
In-Reply-To: <20201203172311.68232-1-kwolf@redhat.com>
References: <20201203172311.68232-1-kwolf@redhat.com>
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
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 stefanha@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The drain functions assume that we hold the AioContext lock of the
drained block node. Make sure to actually take the lock.

Cc: qemu-stable@nongnu.org
Fixes: eb94b81a94bce112e6b206df846c1551aaf6cab6
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 blockdev.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/blockdev.c b/blockdev.c
index 229d2cce1b..0535a8dc9e 100644
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
2.28.0


