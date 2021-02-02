Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE3830CF56
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 23:49:52 +0100 (CET)
Received: from localhost ([::1]:52052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l74UZ-0003D4-TM
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 17:49:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74Qd-0007PR-UK
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:45:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74QY-0005py-CQ
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:45:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612305941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U3meOJeMiHk2LHiN9lb1ouJTqvIhP7nhbEdBc4j5thY=;
 b=EhvAIKdvXbNCFkHo+dv1pvEG6hLkavN8u9S0o298NG/XeVSjNNMd+03YjoCz33d6unqzuQ
 WVE/2ECwrl6vlYGmvBV4RgivWrBBz9mDaVo+oduyVNl2gUPkhVzRLDehTtiI/wjjVvOcEs
 wsUacWsdPlZkWdUEiYeuQPQZ0W2OhX0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-xULsyNkrO-quvNdHg1kzAg-1; Tue, 02 Feb 2021 17:45:39 -0500
X-MC-Unique: xULsyNkrO-quvNdHg1kzAg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 188F659;
 Tue,  2 Feb 2021 22:45:38 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FD1610016F5;
 Tue,  2 Feb 2021 22:45:37 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/20] block: fix theoretical overflow in bdrv_init_padding()
Date: Tue,  2 Feb 2021 16:45:13 -0600
Message-Id: <20210202224529.642055-5-eblake@redhat.com>
In-Reply-To: <20210202224529.642055-1-eblake@redhat.com>
References: <20210202224529.642055-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block I/O path" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Calculation of sum may theoretically overflow, so use 64bit type and
add some good assertions.

Use int64_t constantly.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201211183934.169161-4-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
[eblake: tweak assertion order]
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/io.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/block/io.c b/block/io.c
index ab953bd58f48..c8c9dea55466 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1565,8 +1565,12 @@ static bool bdrv_init_padding(BlockDriverState *bs,
                               int64_t offset, int64_t bytes,
                               BdrvRequestPadding *pad)
 {
-    uint64_t align = bs->bl.request_alignment;
-    size_t sum;
+    int64_t align = bs->bl.request_alignment;
+    int64_t sum;
+
+    bdrv_check_request(offset, bytes, &error_abort);
+    assert(align <= INT_MAX); /* documented in block/block_int.h */
+    assert(align <= SIZE_MAX / 2); /* so we can allocate the buffer */

     memset(pad, 0, sizeof(*pad));

-- 
2.30.0


