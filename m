Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E035A413761
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 18:19:23 +0200 (CEST)
Received: from localhost ([::1]:36294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSiUM-00009H-Ty
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 12:19:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mSiSP-0006Tu-8l
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 12:17:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mSiSN-0001vX-Qo
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 12:17:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632241039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eUZareu40yc3LfoZKtmzupV/LoF0ScfTB+CIPfGwpao=;
 b=VQhO9Qk2OBAVDP9J9PKaC3x3L0WqcR++TxI0tu3ntyvw/ChkIXxchLZZARMyycZs0L5CmI
 NoFC4g3bMGXhPY77AIl3KrB23QeaStlfTRWDoV+PkK6p+MiQ/QacMrNOs5wPGceEj5C2pp
 dmiDCVW+fBKNbHE+5jMj+PE4zhWeveI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-CRnai8WyOnKgHegpII-z5A-1; Tue, 21 Sep 2021 12:17:18 -0400
X-MC-Unique: CRnai8WyOnKgHegpII-z5A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F7F083DD1B;
 Tue, 21 Sep 2021 16:17:17 +0000 (UTC)
Received: from blue.redhat.com (ovpn-115-8.phx2.redhat.com [10.3.115.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A1915C23A;
 Tue, 21 Sep 2021 16:17:06 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] nbd/client: Request larger block status by default
Date: Tue, 21 Sep 2021 11:17:03 -0500
Message-Id: <20210921161703.2682802-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
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
Cc: Kevin Wolf <kwolf@redhat.com>, hreitz@redhat.com, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that commit 5a1cfd21 has clarified that a driver's block_status
can report larger *pnum than in the original request, we can take
advantage of that in the NBD driver.  Rather that limiting our request
to the server based on the maximum @bytes our caller mentioned, we
instead ask for as much status as possible (the minimum of our 4G
limit or the rest of the export); the server will still only give us
one extent in its answer (because we are using NBD_CMD_FLAG_REQ_ONE),
but now the block layer's caching of data areas can take advantage of
cases where the server gives us a large answer to avoid the need for
future NBD_CMD_BLOCK_STATUS calls.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/block/nbd.c b/block/nbd.c
index f6ff1c4fb472..7c4ec058b0aa 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1479,10 +1479,15 @@ static int coroutine_fn nbd_client_co_block_status(
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     Error *local_err = NULL;

+    /*
+     * No need to limit our over-the-wire request to @bytes; rather,
+     * ask the server for as much as it can send in one go, and the
+     * block layer will then cap things.
+     */
     NBDRequest request = {
         .type = NBD_CMD_BLOCK_STATUS,
         .from = offset,
         .len = MIN(QEMU_ALIGN_DOWN(INT_MAX, bs->bl.request_alignment),
-                   MIN(bytes, s->info.size - offset)),
+                   s->info.size - offset),
         .flags = NBD_CMD_FLAG_REQ_ONE,
     };

-- 
2.31.1


