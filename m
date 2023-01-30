Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD27B681D73
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:54:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMc6e-0007pe-UZ; Mon, 30 Jan 2023 16:54:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pMc6b-0007nx-Jm
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:54:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pMc6Z-0006iA-S7
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:54:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675115662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WQVpeMXP1h73OtaSCkyIrLWvskBz5GqMlPav9joLA0o=;
 b=QUfnabktoQx0e1XxZ2/KY8D9lew5n9+rwEz0oa+HjARTHSAfxVxvt/7h+seZZi8eGKnxJl
 GQXZTvUCXpGMip0JgfTikyZStYd0GLYDwdehcoz9WCGtV3/f4hphfWscxPW5UuoWtIn8Fq
 NSsyX6MrZM/bamweMk2h0MBIVwTz81Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-zBvhta_jNMGjbkhI7PfjNg-1; Mon, 30 Jan 2023 16:54:21 -0500
X-MC-Unique: zBvhta_jNMGjbkhI7PfjNg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE5CB181E3EE;
 Mon, 30 Jan 2023 21:54:20 +0000 (UTC)
Received: from localhost (unknown [10.39.195.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C865140EBF6;
 Mon, 30 Jan 2023 21:54:19 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: <qemu-block@nongnu.org>, Fam Zheng <fam@euphon.net>,
 Fiona Ebner <f.ebner@proxmox.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-stable@nongnu.org
Subject: [PATCH v2 1/4] block: fix detect-zeroes= with BDRV_REQ_REGISTERED_BUF
Date: Mon, 30 Jan 2023 16:54:12 -0500
Message-Id: <20230130215415.919494-2-stefanha@redhat.com>
In-Reply-To: <20230130215415.919494-1-stefanha@redhat.com>
References: <20230130215415.919494-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When a write request is converted into a write zeroes request by the
detect-zeroes= feature, it is no longer associated with an I/O buffer.
The BDRV_REQ_REGISTERED_BUF flag doesn't make sense without an I/O
buffer and must be cleared because bdrv_co_do_pwrite_zeroes() fails with
-EINVAL when it's set.

Fiona Ebner <f.ebner@proxmox.com> bisected and diagnosed this QEMU 7.2
regression where writes containing zeroes to a blockdev with
discard=unmap,detect-zeroes=unmap fail.

Buglink: https://gitlab.com/qemu-project/qemu/-/issues/1404
Fixes: e8b6535533be ("block: add BDRV_REQ_REGISTERED_BUF request flag")
Tested-by: Fiona Ebner <f.ebner@proxmox.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/io.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/block/io.c b/block/io.c
index a09a19f7a7..24a2bc42d3 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1926,6 +1926,9 @@ static int coroutine_fn bdrv_aligned_pwritev(BdrvChild *child,
         if (bs->detect_zeroes == BLOCKDEV_DETECT_ZEROES_OPTIONS_UNMAP) {
             flags |= BDRV_REQ_MAY_UNMAP;
         }
+
+        /* Can't use optimization hint with bufferless zero write */
+        flags &= ~BDRV_REQ_REGISTERED_BUF;
     }
 
     if (ret < 0) {
-- 
2.39.1


