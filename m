Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 577A1396D15
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 07:59:22 +0200 (CEST)
Received: from localhost ([::1]:60864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnxQv-0001nh-E9
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 01:59:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lnxPN-00086t-NX
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 01:57:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lnxPK-00021C-Ma
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 01:57:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622527062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qxYh9HqsIPi/lsW5JtdpMe4diqRXLiDe943ozkPv/Zw=;
 b=bEixVPbJQf7SpymxVwr9HuuxD3TWWJJgcnPZA2lvalggTs8JH6WtFaP3TEsK2pGeLNAclt
 lWz1NHSK3IF83WaVn/j9P+FMZrQg7ionuf51psnAd3Jo3B5zhgSaLYmD6qBkwvHTYdB8Od
 m7XdyacIxig8yux0vNjeNTZeSlDDjak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-VEwVkrWLMDi7MFnvjLR55Q-1; Tue, 01 Jun 2021 01:57:40 -0400
X-MC-Unique: VEwVkrWLMDi7MFnvjLR55Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4D15501E0;
 Tue,  1 Jun 2021 05:57:39 +0000 (UTC)
Received: from toolbox.redhat.com (unknown [10.33.36.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2C5569FA4;
 Tue,  1 Jun 2021 05:57:37 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] block-backend: add drained_poll
Date: Tue,  1 Jun 2021 07:57:27 +0200
Message-Id: <20210601055728.90849-2-slp@redhat.com>
In-Reply-To: <20210601055728.90849-1-slp@redhat.com>
References: <20210601055728.90849-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Sergio Lopez <slp@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Nir Soffer <nsoffer@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow block backends to poll their devices/users to check if they have
been quiesced when entering a drained section.

This will be used in the next patch to wait for the NBD server to be
completely quiesced.

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 block/block-backend.c          | 7 ++++++-
 include/sysemu/block-backend.h | 4 ++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index de5496af66..163ca05b97 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2393,8 +2393,13 @@ static void blk_root_drained_begin(BdrvChild *child)
 static bool blk_root_drained_poll(BdrvChild *child)
 {
     BlockBackend *blk = child->opaque;
+    int ret = 0;
     assert(blk->quiesce_counter);
-    return !!blk->in_flight;
+
+    if (blk->dev_ops && blk->dev_ops->drained_poll) {
+        ret = blk->dev_ops->drained_poll(blk->dev_opaque);
+    }
+    return ret || !!blk->in_flight;
 }
 
 static void blk_root_drained_end(BdrvChild *child, int *drained_end_counter)
diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 880e903293..9992072e18 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -66,6 +66,10 @@ typedef struct BlockDevOps {
      * Runs when the backend's last drain request ends.
      */
     void (*drained_end)(void *opaque);
+    /*
+     * Is the device drained?
+     */
+    bool (*drained_poll)(void *opaque);
 } BlockDevOps;
 
 /* This struct is embedded in (the private) BlockBackend struct and contains
-- 
2.26.2


