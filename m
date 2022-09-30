Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E43215F105E
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 18:58:56 +0200 (CEST)
Received: from localhost ([::1]:37220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeJLj-0005AR-Ug
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 12:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeJFm-0006Ue-0z
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:52:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeJFk-0006e1-56
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:52:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664556763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6pMmep7PWB+aSfIEAgniUl9WD8UZqg+jMpGBJcavwE8=;
 b=ZixuififPgXtz9IALaSu9aDcuQGIbMl2kfTkLm+A/3Vf4XXaDeo+02ez88vszxvT02cS7T
 fOr/IHCUCpj+QqSLiMXNAXviAkqw0OBsplYP/3u71hFnlCVthz3sTxpOpGV/eMnjCK4YX7
 w+kGPBMOUtDeeuYq16+DFNeRcSEhPjY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-mRcPOxBiOdiUKaf0JngCcg-1; Fri, 30 Sep 2022 12:52:40 -0400
X-MC-Unique: mRcPOxBiOdiUKaf0JngCcg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0426F1019C8F;
 Fri, 30 Sep 2022 16:52:40 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 445D217582;
 Fri, 30 Sep 2022 16:52:39 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 06/18] block: use bdrv_is_sg() helper instead of raw bs->sg
 reading
Date: Fri, 30 Sep 2022 18:52:10 +0200
Message-Id: <20220930165222.249716-7-kwolf@redhat.com>
In-Reply-To: <20220930165222.249716-1-kwolf@redhat.com>
References: <20220930165222.249716-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Denis V. Lunev" <den@openvz.org>

I believe that if the helper exists, it must be used always for reading
of the value. It breaks expectations in the other case.

Signed-off-by: Denis V. Lunev <den@openvz.org>
CC: Kevin Wolf <kwolf@redhat.com>
CC: Hanna Reitz <hreitz@redhat.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>
CC: Fam Zheng <fam@euphon.net>
CC: Ronnie Sahlberg <ronniesahlberg@gmail.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Peter Lieven <pl@kamp.de>
CC: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Message-Id: <20220817083736.40981-2-den@openvz.org>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/file-posix.c | 2 +-
 block/iscsi.c      | 2 +-
 block/raw-format.c | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 48cd096624..256de1f456 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1295,7 +1295,7 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
     }
 #endif
 
-    if (bs->sg || S_ISBLK(st.st_mode)) {
+    if (bdrv_is_sg(bs) || S_ISBLK(st.st_mode)) {
         int ret = hdev_get_max_hw_transfer(s->fd, &st);
 
         if (ret > 0 && ret <= BDRV_REQUEST_MAX_BYTES) {
diff --git a/block/iscsi.c b/block/iscsi.c
index d707d0b354..612de127e5 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -2065,7 +2065,7 @@ static void iscsi_refresh_limits(BlockDriverState *bs, Error **errp)
     uint64_t max_xfer_len = iscsilun->use_16_for_rw ? 0xffffffff : 0xffff;
     unsigned int block_size = MAX(BDRV_SECTOR_SIZE, iscsilun->block_size);
 
-    assert(iscsilun->block_size >= BDRV_SECTOR_SIZE || bs->sg);
+    assert(iscsilun->block_size >= BDRV_SECTOR_SIZE || bdrv_is_sg(bs));
 
     bs->bl.request_alignment = block_size;
 
diff --git a/block/raw-format.c b/block/raw-format.c
index 69fd650eaf..c7278e348e 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -463,7 +463,7 @@ static int raw_open(BlockDriverState *bs, QDict *options, int flags,
         return -EINVAL;
     }
 
-    bs->sg = bs->file->bs->sg;
+    bs->sg = bdrv_is_sg(bs->file->bs);
     bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
         (BDRV_REQ_FUA & bs->file->bs->supported_write_flags);
     bs->supported_zero_flags = BDRV_REQ_WRITE_UNCHANGED |
@@ -489,7 +489,7 @@ static int raw_open(BlockDriverState *bs, QDict *options, int flags,
         return ret;
     }
 
-    if (bs->sg && (s->offset || s->has_size)) {
+    if (bdrv_is_sg(bs) && (s->offset || s->has_size)) {
         error_setg(errp, "Cannot use offset/size with SCSI generic devices");
         return -EINVAL;
     }
-- 
2.37.3


