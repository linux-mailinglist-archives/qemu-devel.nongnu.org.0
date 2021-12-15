Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8555D4758A7
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 13:15:41 +0100 (CET)
Received: from localhost ([::1]:37950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxTC8-0003th-8L
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 07:15:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mxT99-0001ZU-SV
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 07:12:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mxT97-00089e-M7
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 07:12:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639570353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TRsCPk24GR1ZhF0bBamMlV5Ah/bsMWyGSP4T9gCxMrk=;
 b=drS+4MprdD8Yef0UXuE5RHk3XyBv5iUQl7ZiSjjTh3LqX+tMisaqNu8yQc/LAFQ/sMW6DF
 ebKhdujqBsKDFFgpmf2e9UeCK36S50LZ1lY2jcOCchZBv+05PbOrP1I+XhEUh7eAdswlez
 kd4OLQamtv8l/51U6nic3iT1a/KW/hI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-5rPOZbFaMHabzVCjuYtE0w-1; Wed, 15 Dec 2021 07:12:32 -0500
X-MC-Unique: 5rPOZbFaMHabzVCjuYtE0w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D60F9801B0C;
 Wed, 15 Dec 2021 12:12:30 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB2E87A469;
 Wed, 15 Dec 2021 12:12:19 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 1/3] block_int: make bdrv_backing_overridden static
Date: Wed, 15 Dec 2021 07:11:38 -0500
Message-Id: <20211215121140.456939-2-eesposit@redhat.com>
In-Reply-To: <20211215121140.456939-1-eesposit@redhat.com>
References: <20211215121140.456939-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bdrv_backing_overridden is only used in block.c, so there is
no need to leave it in block_int.h

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block.c                   | 4 +++-
 include/block/block_int.h | 3 ---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/block.c b/block.c
index 0ac5b163d2..10346b5011 100644
--- a/block.c
+++ b/block.c
@@ -103,6 +103,8 @@ static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
 static void bdrv_reopen_commit(BDRVReopenState *reopen_state);
 static void bdrv_reopen_abort(BDRVReopenState *reopen_state);
 
+static bool bdrv_backing_overridden(BlockDriverState *bs);
+
 /* If non-zero, use only whitelisted block drivers */
 static int use_bdrv_whitelist;
 
@@ -7475,7 +7477,7 @@ static bool append_strong_runtime_options(QDict *d, BlockDriverState *bs)
 /* Note: This function may return false positives; it may return true
  * even if opening the backing file specified by bs's image header
  * would result in exactly bs->backing. */
-bool bdrv_backing_overridden(BlockDriverState *bs)
+static bool bdrv_backing_overridden(BlockDriverState *bs)
 {
     if (bs->backing) {
         return strcmp(bs->auto_backing_file,
diff --git a/include/block/block_int.h b/include/block/block_int.h
index f4c75e8ba9..27008cfb22 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1122,9 +1122,6 @@ BlockDriver *bdrv_probe_all(const uint8_t *buf, int buf_size,
 void bdrv_parse_filename_strip_prefix(const char *filename, const char *prefix,
                                       QDict *options);
 
-bool bdrv_backing_overridden(BlockDriverState *bs);
-
-
 /**
  * bdrv_add_aio_context_notifier:
  *
-- 
2.31.1


