Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A712492B87
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 17:50:54 +0100 (CET)
Received: from localhost ([::1]:49086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9rh6-00029z-4C
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 11:50:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n9rVW-0007Pp-Fg
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:38:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n9rVU-00066x-Kx
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:38:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642523932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hKHLrZHyUcnoBxO5vObGu0F6VvFauzwbCCLT3dnhHGs=;
 b=i+1Z0xAa49l3o6YDIOGweYj/IreCjjmiCrOAMJsJ0mpPKIRxR2WOCefYvCiSXpp7IzEsZP
 HVPFy7sqVFSiJHT8yw855eI70s3yFfNbZihf0AOUXXuunXJr2BlKwRmAt4JuOxexuPpA+6
 rGOOriftMQamYmCFXcc7YXOORDJfoig=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-sVX_1yfUOiuEalazIhX0tg-1; Tue, 18 Jan 2022 11:38:48 -0500
X-MC-Unique: sVX_1yfUOiuEalazIhX0tg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 747DC108668D;
 Tue, 18 Jan 2022 16:28:29 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB170348F8;
 Tue, 18 Jan 2022 16:28:28 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 11/12] block/io.c: fully enable assert_bdrv_graph_writable
Date: Tue, 18 Jan 2022 11:27:37 -0500
Message-Id: <20220118162738.1366281-12-eesposit@redhat.com>
In-Reply-To: <20220118162738.1366281-1-eesposit@redhat.com>
References: <20220118162738.1366281-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As explained in the TODO, complete the function by checking
that the node is also drained.

In this way, we can ensure that modify the bs is thread safe,
as the drain makes sure that no I/O concurrently reads the field,
and all writes are under BQL.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/io.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/block/io.c b/block/io.c
index 9d5167f64a..d7b0707662 100644
--- a/block/io.c
+++ b/block/io.c
@@ -765,12 +765,7 @@ void bdrv_drain_all(void)
 
 void assert_bdrv_graph_writable(BlockDriverState *bs)
 {
-    /*
-     * TODO: this function is incomplete. Because the users of this
-     * assert lack the necessary drains, check only for BQL.
-     * Once the necessary drains are added,
-     * assert also for qatomic_read(&bs->quiesce_counter) > 0
-     */
+    assert(qatomic_read(&bs->quiesce_counter) > 0);
     assert(qemu_in_main_thread());
 }
 
-- 
2.31.1


