Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35381610055
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 20:35:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7ia-0006Nr-NL; Thu, 27 Oct 2022 14:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gV-0001sk-Kq
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:33:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gO-0002Wj-AT
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6W2XdDwgrDxRQH6xa34ZCjOrtnLEjWiAI/mlAxDuD7I=;
 b=C1W8DpIb9ClG6ikjm7MfFmoUKdHjmBVbxIkcuSSH3OLeRUMaO3pgYwKvOgEitOYZIhnV25
 0vVPZOsPFiT1a7XSLAb0mArmhiLgHHCXEy/81A1TzTKQ9A65gQEOT7rgawGrX1/HqKT6GX
 MtVqghjBaxIPUHQh23FxxDNDyP1inmw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-hdWow3-LMxS3-jtItyFxxQ-1; Thu, 27 Oct 2022 14:32:43 -0400
X-MC-Unique: hdWow3-LMxS3-jtItyFxxQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5AEB185A78B;
 Thu, 27 Oct 2022 18:32:43 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E07D6112132D;
 Thu, 27 Oct 2022 18:32:42 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 33/58] block/nfs: Fix 32-bit Windows build
Date: Thu, 27 Oct 2022 20:31:21 +0200
Message-Id: <20221027183146.463129-34-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bin.meng@windriver.com>

libnfs.h declares nfs_fstat() as the following for win32:

  int nfs_fstat(struct nfs_context *nfs, struct nfsfh *nfsfh,
                struct __stat64 *st);

The 'st' parameter should be of type 'struct __stat64'. The
codes happen to build successfully for 64-bit Windows, but it
does not build for 32-bit Windows.

Fixes: 6542aa9c75bc ("block: add native support for NFS")
Fixes: 18a8056e0bc7 ("block/nfs: cache allocated filesize for read-only files")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <20220908132817.1831008-6-bmeng.cn@gmail.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/nfs.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/block/nfs.c b/block/nfs.c
index 596ebe98cb..ece22353ac 100644
--- a/block/nfs.c
+++ b/block/nfs.c
@@ -418,7 +418,11 @@ static int64_t nfs_client_open(NFSClient *client, BlockdevOptionsNfs *opts,
                                int flags, int open_flags, Error **errp)
 {
     int64_t ret = -EINVAL;
+#ifdef _WIN32
+    struct __stat64 st;
+#else
     struct stat st;
+#endif
     char *file = NULL, *strp = NULL;
 
     qemu_mutex_init(&client->mutex);
@@ -781,7 +785,11 @@ static int nfs_reopen_prepare(BDRVReopenState *state,
                               BlockReopenQueue *queue, Error **errp)
 {
     NFSClient *client = state->bs->opaque;
+#ifdef _WIN32
+    struct __stat64 st;
+#else
     struct stat st;
+#endif
     int ret = 0;
 
     if (state->flags & BDRV_O_RDWR && bdrv_is_read_only(state->bs)) {
-- 
2.37.3


