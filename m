Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4969492BA8
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 17:54:18 +0100 (CET)
Received: from localhost ([::1]:56394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9rkP-0007H4-UC
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 11:54:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n9rTq-0003sv-T7
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:37:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n9rTp-0005vQ-Ca
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:37:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642523827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZQgl8oN+/Auu1+Z3PypozVm42DQuUmaIhnOqXTYhhQI=;
 b=WJJhfNHGomm1ufxkBQlTDjhvznzBi03pTkZvNRXnp97aiiX/f87OyPOxi9LHWRfGJvWgFS
 FCPq/oSugnpcBNZ0yQigwYroUOXMZrwkgw9Pg7R5kUWHfa9BvmiUSF4giHG/CkmJ6xuzPo
 HYLm5uZFf9fDuH4Tt8nbLQcEBQArNHo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-2iXkCnDjNzaZxRoa82yVkg-1; Tue, 18 Jan 2022 11:36:53 -0500
X-MC-Unique: 2iXkCnDjNzaZxRoa82yVkg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7408886A8D3;
 Tue, 18 Jan 2022 16:28:19 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FB54348F8;
 Tue, 18 Jan 2022 16:28:09 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 01/12] introduce BDRV_POLL_WHILE_UNLOCKED
Date: Tue, 18 Jan 2022 11:27:27 -0500
Message-Id: <20220118162738.1366281-2-eesposit@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Same as BDRV_POLL_WHILE, but uses AIO_WAIT_WHILE_UNLOCKED.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/block/block-global-state.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index 419fe8427f..7ad9496f56 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -158,6 +158,11 @@ void bdrv_drain_all(void);
     AIO_WAIT_WHILE(bdrv_get_aio_context(bs_),              \
                    cond); })
 
+#define BDRV_POLL_WHILE_UNLOCKED(bs, cond) ({              \
+    BlockDriverState *bs_ = (bs);                          \
+    AIO_WAIT_WHILE_UNLOCKED(bdrv_get_aio_context(bs_),     \
+                            cond); })
+
 int bdrv_has_zero_init_1(BlockDriverState *bs);
 int bdrv_has_zero_init(BlockDriverState *bs);
 int bdrv_can_set_read_only(BlockDriverState *bs, bool read_only,
-- 
2.31.1


