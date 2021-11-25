Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9713745DBC3
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 14:58:05 +0100 (CET)
Received: from localhost ([::1]:40016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqFGG-0000ek-Hs
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 08:58:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mqFBs-00031U-L3
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 08:53:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mqFBr-0000OI-2g
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 08:53:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637848410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DW6mnFoKl4Tr6p5LoW3lzBoW8GmYZ/8HM6fQnbgibzE=;
 b=f67n5snU4TeAwuScwwkoS8j8g05dc/HUn9/bEsLz51zwoSk8CpQr42J5z2b3ZOFiM01p6A
 X/pmcn+xekR9tS1z8QcuLbF0snxVCPohdEFGOFSrksP2JpsqOwl0CECMIjk+YI5Q42cfJ2
 ZnlfEJD3850lS0z8hpnMt83iMpdA30M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-QstCObGKNbOXc7obWK1DLg-1; Thu, 25 Nov 2021 08:53:27 -0500
X-MC-Unique: QstCObGKNbOXc7obWK1DLg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CA8810144E1;
 Thu, 25 Nov 2021 13:53:26 +0000 (UTC)
Received: from localhost (unknown [10.39.193.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39EBC5D6B1;
 Thu, 25 Nov 2021 13:53:23 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/2] block-backend: Retain permissions after migration
Date: Thu, 25 Nov 2021 14:53:16 +0100
Message-Id: <20211125135317.186576-2-hreitz@redhat.com>
In-Reply-To: <20211125135317.186576-1-hreitz@redhat.com>
References: <20211125135317.186576-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peng Liang <liangpeng10@huawei.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After migration, the permissions the guest device wants to impose on its
BlockBackend are stored in blk->perm and blk->shared_perm.  In
blk_root_activate(), we take our permissions, but keep all shared
permissions open by calling `blk_set_perm(blk->perm, BLK_PERM_ALL)`.

Only afterwards (immediately or later, depending on the runstate) do we
restrict the shared permissions by calling
`blk_set_perm(blk->perm, blk->shared_perm)`.  Unfortunately, our first
call with shared_perm=BLK_PERM_ALL has overwritten blk->shared_perm to
be BLK_PERM_ALL, so this is a no-op and the set of shared permissions is
not restricted.

Fix this bug by saving the set of shared permissions before invoking
blk_set_perm() with BLK_PERM_ALL and restoring it afterwards.

Fixes: 5f7772c4d0cf32f4e779fcd5a69ae4dae24aeebf
       ("block-backend: Defer shared_perm tightening migration
       completion")
Reported-by: Peng Liang <liangpeng10@huawei.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/block-backend.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/block/block-backend.c b/block/block-backend.c
index 12ef80ea17..41e388fe1f 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -190,6 +190,7 @@ static void blk_root_activate(BdrvChild *child, Error **errp)
 {
     BlockBackend *blk = child->opaque;
     Error *local_err = NULL;
+    uint64_t saved_shared_perm;
 
     if (!blk->disable_perm) {
         return;
@@ -197,12 +198,22 @@ static void blk_root_activate(BdrvChild *child, Error **errp)
 
     blk->disable_perm = false;
 
+    /*
+     * blk->shared_perm contains the permissions we want to share once
+     * migration is really completely done.  For now, we need to share
+     * all; but we also need to retain blk->shared_perm, which is
+     * overwritten by a successful blk_set_perm() call.  Save it and
+     * restore it below.
+     */
+    saved_shared_perm = blk->shared_perm;
+
     blk_set_perm(blk, blk->perm, BLK_PERM_ALL, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         blk->disable_perm = true;
         return;
     }
+    blk->shared_perm = saved_shared_perm;
 
     if (runstate_check(RUN_STATE_INMIGRATE)) {
         /* Activation can happen when migration process is still active, for
-- 
2.33.1


