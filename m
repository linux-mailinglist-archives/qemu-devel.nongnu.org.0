Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9A354549E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 21:06:29 +0200 (CEST)
Received: from localhost ([::1]:42286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzNUB-0002EZ-Fk
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 15:06:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nzLrq-0007zf-4F
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 13:22:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nzLrn-0003hX-7z
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 13:22:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654795350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sd8VhQGWEpTDiSLevFE7jFgiFqnrOHTPUJ08CRqL42Q=;
 b=Ub193l/4NaA/9m/8ACHKiOK01Z34ZxWNIkg1kil4CARQULGAljokScy4DPz3FyGeIhD9HO
 +bG8HP2slwYkdAXFYCVdR9Qgieyj4k5TsUOu7XJE423EO22kipjl51+tHqAPpZWDeNN9QL
 UYnsQKG1mCE/fJadnk9z9Xa21tOqQhw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-Bs3B0cnBPb6X5aP38UjpEA-1; Thu, 09 Jun 2022 13:22:27 -0400
X-MC-Unique: Bs3B0cnBPb6X5aP38UjpEA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A203E3C02181;
 Thu,  9 Jun 2022 17:22:26 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.195.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1134B40D2827;
 Thu,  9 Jun 2022 17:22:25 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 16/18] block/gluster: correctly set max_pdiscard
Date: Thu,  9 Jun 2022 19:21:47 +0200
Message-Id: <20220609172149.293877-17-kwolf@redhat.com>
In-Reply-To: <20220609172149.293877-1-kwolf@redhat.com>
References: <20220609172149.293877-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Fabian Ebner <f.ebner@proxmox.com>

On 64-bit platforms, assigning SIZE_MAX to the int64_t max_pdiscard
results in a negative value, and the following assertion would trigger
down the line (it's not the same max_pdiscard, but computed from the
other one):
qemu-system-x86_64: ../block/io.c:3166: bdrv_co_pdiscard: Assertion
`max_pdiscard >= bs->bl.request_alignment' failed.

On 32-bit platforms, it's fine to keep using SIZE_MAX.

The assertion in qemu_gluster_co_pdiscard() is checking that the value
of 'bytes' can safely be passed to glfs_discard_async(), which takes a
size_t for the argument in question, so it is kept as is. And since
max_pdiscard is still <= SIZE_MAX, relying on max_pdiscard is still
fine.

Fixes: 0c8022876f ("block: use int64_t instead of int in driver discard handlers")
Cc: qemu-stable@nongnu.org
Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
Message-Id: <20220520075922.43972-1-f.ebner@proxmox.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/gluster.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/gluster.c b/block/gluster.c
index 398976bc66..b60213ab80 100644
--- a/block/gluster.c
+++ b/block/gluster.c
@@ -891,7 +891,7 @@ out:
 static void qemu_gluster_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     bs->bl.max_transfer = GLUSTER_MAX_TRANSFER;
-    bs->bl.max_pdiscard = SIZE_MAX;
+    bs->bl.max_pdiscard = MIN(SIZE_MAX, INT64_MAX);
 }
 
 static int qemu_gluster_reopen_prepare(BDRVReopenState *state,
-- 
2.35.3


