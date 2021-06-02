Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 443E0398B00
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:48:29 +0200 (CEST)
Received: from localhost ([::1]:43844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loRES-0003Xc-8C
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRBq-0007ut-T6
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:45:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRBn-0006vD-JB
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:45:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622641542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xG0Z68ORK5zXT+w46I4w/BY01xYr5gUode7xyH2he9Y=;
 b=EW5riP8cu+oNlqR0ezcdg5Jz5l8OGkc4t9QL0xnv9mwHJBSPfLjhosvIWF147+9d1IeubX
 NsBhwTbGVjb2ty79c90jjHSpu0sZf3qLPdpUznpwFnP2U4KLXsGt85ZVZ8oNWOXQogkyG/
 I6zuTiEE0gCh7UM19O3tzxOgbHEFr8g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-vWc6n08KNXePzuUn44RLsA-1; Wed, 02 Jun 2021 09:45:39 -0400
X-MC-Unique: vWc6n08KNXePzuUn44RLsA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 384C11034B04;
 Wed,  2 Jun 2021 13:45:36 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-240.ams2.redhat.com [10.36.114.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 120527596A;
 Wed,  2 Jun 2021 13:45:34 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 01/20] block/quorum: Provide .bdrv_co_flush instead of
 .bdrv_co_flush_to_disk
Date: Wed,  2 Jun 2021 15:45:10 +0200
Message-Id: <20210602134529.231756-2-kwolf@redhat.com>
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

From: Lukas Straub <lukasstraub2@web.de>

The quorum block driver uses a custom flush callback to handle the
case when some children return io errors. In that case it still
returns success if enough children are healthy.
However, it provides it as the .bdrv_co_flush_to_disk callback, not
as .bdrv_co_flush. This causes the block layer to do it's own
generic flushing for the children instead, which doesn't handle
errors properly.

Fix this by providing .bdrv_co_flush instead of
.bdrv_co_flush_to_disk so the block layer uses the custom flush
callback.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reported-by: Minghao Yuan <meeho@qq.com>
Message-Id: <20210518134214.11ccf05f@gecko.fritz.box>
Tested-by: Zhang Chen <chen.zhang@intel.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/quorum.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/quorum.c b/block/quorum.c
index cfc1436abb..f2c0805000 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -1279,7 +1279,7 @@ static BlockDriver bdrv_quorum = {
     .bdrv_dirname                       = quorum_dirname,
     .bdrv_co_block_status               = quorum_co_block_status,
 
-    .bdrv_co_flush_to_disk              = quorum_co_flush,
+    .bdrv_co_flush                      = quorum_co_flush,
 
     .bdrv_getlength                     = quorum_getlength,
 
-- 
2.30.2


