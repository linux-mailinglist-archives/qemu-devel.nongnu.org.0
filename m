Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C049E41A2BD
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 00:11:17 +0200 (CEST)
Received: from localhost ([::1]:35654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUyqC-0002rT-QK
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 18:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUybl-0002j7-Qp
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:56:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mUybh-0002yy-6o
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 17:56:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632779776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nYcY8/gPpGTrFbLOdoGvl9L1U7nOty+5ARQWlo+lWf0=;
 b=ERpVzBVSzluS3HmPVTfVk3oVYmHHJJPqpR1l/N/6wvHcQb+wvoDa53XcR9tH2HGcxvPkex
 7lUYiKq5kUQ/qRMfzF32RM/2UVEgRIPf0JGr7vNRaR/aZKPTe2dDSn2gMb1CZ9k0wd+aFg
 qHj03RjqCD9MrfF8NaOz5Q2LbIWWbXY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-EFklq3HmMlGbWrNtvPru_w-1; Mon, 27 Sep 2021 17:56:15 -0400
X-MC-Unique: EFklq3HmMlGbWrNtvPru_w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02ED6801E72;
 Mon, 27 Sep 2021 21:56:14 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-87.phx2.redhat.com [10.3.113.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2F2E5D9D5;
 Mon, 27 Sep 2021 21:56:10 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/20] block/io: allow 64bit discard requests
Date: Mon, 27 Sep 2021 16:55:37 -0500
Message-Id: <20210927215545.3930309-13-eblake@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block I/O path" <qemu-block@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Now that all drivers are updated by the previous commit, we can drop
the last limiter on pdiscard path: INT_MAX in bdrv_co_pdiscard().

Now everything is prepared for implementing incredibly cool and fast
big-discard requests in NBD and qcow2. And any other driver which wants
it of course.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210903102807.27127-12-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/io.c b/block/io.c
index 3846e2ed961b..18d345a87af3 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3104,7 +3104,7 @@ int coroutine_fn bdrv_co_pdiscard(BdrvChild *child, int64_t offset,
         goto out;
     }

-    max_pdiscard = QEMU_ALIGN_DOWN(MIN_NON_ZERO(bs->bl.max_pdiscard, INT_MAX),
+    max_pdiscard = QEMU_ALIGN_DOWN(MIN_NON_ZERO(bs->bl.max_pdiscard, INT64_MAX),
                                    align);
     assert(max_pdiscard >= bs->bl.request_alignment);

-- 
2.31.1


