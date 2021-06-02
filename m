Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 914C3398B2F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:57:43 +0200 (CEST)
Received: from localhost ([::1]:51216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loRNO-0002AR-KW
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRCg-0002a5-Si
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:46:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRCf-0007VY-1Q
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:46:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622641596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xH+zSztoc1mlNU11g0Z4uJrazThA21J7My8TwQ7Tiy4=;
 b=N6lc+th6B4jt5YFcKnahitpldJxyEFbO2Uv/JKNa2162Wn6+D4mxfkSHp99Fyk5Jh7G2a8
 4/RA5bLpIeQ+WdI5DOxIWJyTv0lPMDITrKL5m+PHwLlFTaCqHtkKX8/5O0R1qFn41yNB06
 07CmSpFzUVOMfu9xQOHiBfI+6AGKAcM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-zRDiTk3kM2m-VY2SxoRa4w-1; Wed, 02 Jun 2021 09:46:34 -0400
X-MC-Unique: zRDiTk3kM2m-VY2SxoRa4w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 959471927831;
 Wed,  2 Jun 2021 13:45:54 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-240.ams2.redhat.com [10.36.114.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2A512DAD0;
 Wed,  2 Jun 2021 13:45:53 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 16/20] block-backend: add drained_poll
Date: Wed,  2 Jun 2021 15:45:25 +0200
Message-Id: <20210602134529.231756-17-kwolf@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

From: Sergio Lopez <slp@redhat.com>

Allow block backends to poll their devices/users to check if they have
been quiesced when entering a drained section.

This will be used in the next patch to wait for the NBD server to be
completely quiesced.

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Sergio Lopez <slp@redhat.com>
Message-Id: <20210602060552.17433-2-slp@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/sysemu/block-backend.h | 4 ++++
 block/block-backend.c          | 7 ++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 880e903293..5423e3d9c6 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -66,6 +66,10 @@ typedef struct BlockDevOps {
      * Runs when the backend's last drain request ends.
      */
     void (*drained_end)(void *opaque);
+    /*
+     * Is the device still busy?
+     */
+    bool (*drained_poll)(void *opaque);
 } BlockDevOps;
 
 /* This struct is embedded in (the private) BlockBackend struct and contains
diff --git a/block/block-backend.c b/block/block-backend.c
index 5be32c0c42..15f1ea4288 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2386,8 +2386,13 @@ static void blk_root_drained_begin(BdrvChild *child)
 static bool blk_root_drained_poll(BdrvChild *child)
 {
     BlockBackend *blk = child->opaque;
+    bool busy = false;
     assert(blk->quiesce_counter);
-    return !!blk->in_flight;
+
+    if (blk->dev_ops && blk->dev_ops->drained_poll) {
+        busy = blk->dev_ops->drained_poll(blk->dev_opaque);
+    }
+    return busy || !!blk->in_flight;
 }
 
 static void blk_root_drained_end(BdrvChild *child, int *drained_end_counter)
-- 
2.30.2


