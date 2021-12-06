Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C81B469D36
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 16:30:01 +0100 (CET)
Received: from localhost ([::1]:38410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muFwG-0001dN-4M
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 10:30:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1muFuI-0008Jf-NJ
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 10:27:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1muFuF-0003Rn-G2
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 10:27:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638804474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8/m2YbbrBa3xjZf+vivM7vix+7rO/zzccTJK+/ymCvU=;
 b=DnJuuZWoZWVfWOHYS6i2rCPJ6eIW8iJVnSSsFzoWieAlSj130FRrgu7PEwX76ruexRUc+k
 FjBy3BhxVYIVzq1q5Tydr4XN1hn4CTM2q/a7Z4JxwjiqiFD3jLDu5kNRRYK4A34IkM70CZ
 wsCEV6fKRBMTPkOp08UqDYXvQn1AWNw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-hUN0j6nhNN-o8ExiKvyrfw-1; Mon, 06 Dec 2021 10:27:53 -0500
X-MC-Unique: hUN0j6nhNN-o8ExiKvyrfw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 950521853036;
 Mon,  6 Dec 2021 15:27:52 +0000 (UTC)
Received: from localhost (unknown [10.39.193.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 711F619D9B;
 Mon,  6 Dec 2021 15:27:39 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 1/1] virtio-blk: Fix clean up of host notifiers for single MR
 transaction.
Date: Mon,  6 Dec 2021 15:27:24 +0000
Message-Id: <20211206152724.121030-2-stefanha@redhat.com>
In-Reply-To: <20211206152724.121030-1-stefanha@redhat.com>
References: <20211206152724.121030-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Mark Mielke <mark.mielke@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Mielke <mark.mielke@gmail.com>

The code that introduced "virtio-blk: Configure all host notifiers in
a single MR transaction" introduced a second loop variable to perform
cleanup in second loop, but mistakenly still refers to the first
loop variable within the second loop body.

Fixes: d0267da61489 ("virtio-blk: Configure all host notifiers in a single MR transaction")
Signed-off-by: Mark Mielke <mark.mielke@gmail.com>
Message-id: CALm7yL08qarOu0dnQkTN+pa=BSRC92g31YpQQNDeAiT4yLZWQQ@mail.gmail.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/block/dataplane/virtio-blk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
index 252c3a7a23..ee5a5352dc 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -222,7 +222,7 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
             memory_region_transaction_commit();
 
             while (j--) {
-                virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), i);
+                virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), j);
             }
             goto fail_host_notifiers;
         }
-- 
2.33.1


