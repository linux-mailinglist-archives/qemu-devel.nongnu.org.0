Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E15E04C8D9C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 15:24:35 +0100 (CET)
Received: from localhost ([::1]:47460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP3QY-0003cx-O1
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 09:24:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nP3NY-0000SC-22
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 09:21:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nP3NV-000733-6k
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 09:21:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646144484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ornUYVqO1+q7KCQvgPzm6a778AlxlhjrSuXhmQ9+Vg=;
 b=eqkdxKfUiN2hkBTi6SXQfekPyivgDJntJW/d4OhXlP7IDH5cGAg/7xJU5z8XcVa2Xrj2Rw
 8zQp/COtEjedtrKmTRSUI+kLRmuyKAaPKiNGcUukSgNEp1OrMWvLIauRaruoi1rJPLvTZI
 sQHzi3eqcM/wSkxqSiwTkNtf94W+s/4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-w15McBwsPV-nuSyloAEwVA-1; Tue, 01 Mar 2022 09:21:21 -0500
X-MC-Unique: w15McBwsPV-nuSyloAEwVA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4764E1854E2A;
 Tue,  1 Mar 2022 14:21:20 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 839BB8497D;
 Tue,  1 Mar 2022 14:21:19 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 2/5] introduce BDRV_POLL_WHILE_UNLOCKED
Date: Tue,  1 Mar 2022 09:21:10 -0500
Message-Id: <20220301142113.163174-3-eesposit@redhat.com>
In-Reply-To: <20220301142113.163174-1-eesposit@redhat.com>
References: <20220301142113.163174-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Same as BDRV_POLL_WHILE, but uses AIO_WAIT_WHILE_UNLOCKED.
See doc comment for more info.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/block/block.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/block/block.h b/include/block/block.h
index e1713ee306..5a7a850c16 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -512,6 +512,11 @@ void bdrv_drain_all(void);
     AIO_WAIT_WHILE(bdrv_get_aio_context(bs_),              \
                    cond); })
 
+#define BDRV_POLL_WHILE_UNLOCKED(bs, cond) ({              \
+    BlockDriverState *bs_ = (bs);                          \
+    AIO_WAIT_WHILE_UNLOCKED(bdrv_get_aio_context(bs_),     \
+                            cond); })
+
 int generated_co_wrapper bdrv_pdiscard(BdrvChild *child, int64_t offset,
                                        int64_t bytes);
 int bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes);
-- 
2.31.1


