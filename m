Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6209352937A
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 00:15:47 +0200 (CEST)
Received: from localhost ([::1]:41124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqj0E-0000YM-GT
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 18:15:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nqhuI-0003s5-GI
 for qemu-devel@nongnu.org; Mon, 16 May 2022 17:05:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nqhuF-0000Mk-3o
 for qemu-devel@nongnu.org; Mon, 16 May 2022 17:05:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652735128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=e8PAD/llK1gB9vId31uIa7olnIuZCrjH2aDtrKBSRwI=;
 b=EPU0szTLdcLwIAPdHtVUI6veT7+8bMMfVNDEU5lNg/9/ejx/Ku+Z/H4Ln1ebnwI21p+Yef
 kWicvjSQErNL+lKOhuWBEXmc78C+fnsd+UFZvGxlQgDYMZtRCwWLYOsw7ujyLRkuy1tVBo
 XTge75TE01DRMiDRZVgCRPB80ID32vg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-5RS5ijZIPp2LrhdMAxMltA-1; Mon, 16 May 2022 17:05:25 -0400
X-MC-Unique: 5RS5ijZIPp2LrhdMAxMltA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B04D100BAAB;
 Mon, 16 May 2022 21:05:24 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.17.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C0DA401E77;
 Mon, 16 May 2022 21:05:23 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org (open list:Network Block Dev...)
Subject: [PATCH] nbd: Drop dead code spotted by Coverity
Date: Mon, 16 May 2022 16:05:19 -0500
Message-Id: <20220516210519.76135-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CID 1488362 points out that the second 'rc >= 0' check is now dead
code.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Fixes: 172f5f1a40(nbd: remove peppering of nbd_client_connected)
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 6085ab1d2c..7f5f50ec46 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -521,12 +521,8 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
     if (qiov) {
         qio_channel_set_cork(s->ioc, true);
         rc = nbd_send_request(s->ioc, request);
-        if (rc >= 0) {
-            if (qio_channel_writev_all(s->ioc, qiov->iov, qiov->niov,
-                                       NULL) < 0) {
-                rc = -EIO;
-            }
-        } else if (rc >= 0) {
+        if (rc >= 0 && qio_channel_writev_all(s->ioc, qiov->iov, qiov->niov,
+                                              NULL) < 0) {
             rc = -EIO;
         }
         qio_channel_set_cork(s->ioc, false);
-- 
2.36.1


