Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B636F6AAD
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 14:00:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puXbd-0003rn-3Q; Thu, 04 May 2023 07:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puXbS-0003Kq-Ed
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:58:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puXbC-0004DM-Ry
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:58:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683201494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GxkK5CZ4aQrNPUciTwgsAV6ozk6+OUv0xyYpufbraCg=;
 b=ArzGbhqhlS7K7NOa6bOi+T0LKzFwCx/aCFdgNTOrHo7Jo6tbtV3MBw3+Ir56VYeQm/rvbt
 kPfxXZOdwL2qWLFOMI2w89mG+wN0cSYn56kXQ/ROaOwNuLhxw6wnchh3Wampndo0aLH9eN
 tkNFXBPbUvL3GO4K9VnBXg6HgHPXDPM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-OwAkV7baMVGSELoYANUwOw-1; Thu, 04 May 2023 07:58:13 -0400
X-MC-Unique: OwAkV7baMVGSELoYANUwOw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE2A1800B35;
 Thu,  4 May 2023 11:58:12 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90F6DC15BAD;
 Thu,  4 May 2023 11:58:11 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, stefanha@redhat.com, eblake@redhat.com,
 eesposit@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v2 09/20] nbd: Remove nbd_co_flush() wrapper function
Date: Thu,  4 May 2023 13:57:39 +0200
Message-Id: <20230504115750.54437-10-kwolf@redhat.com>
In-Reply-To: <20230504115750.54437-1-kwolf@redhat.com>
References: <20230504115750.54437-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The only thing nbd_co_flush() does is call nbd_client_co_flush(). Just
use that function directly in the BlockDriver definitions and remove the
wrapper.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/nbd.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index bf2894ad5c..d3ee256844 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1920,11 +1920,6 @@ fail:
     return ret;
 }
 
-static int coroutine_fn nbd_co_flush(BlockDriverState *bs)
-{
-    return nbd_client_co_flush(bs);
-}
-
 static void nbd_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
@@ -2120,7 +2115,7 @@ static BlockDriver bdrv_nbd = {
     .bdrv_co_pwritev            = nbd_client_co_pwritev,
     .bdrv_co_pwrite_zeroes      = nbd_client_co_pwrite_zeroes,
     .bdrv_close                 = nbd_close,
-    .bdrv_co_flush_to_os        = nbd_co_flush,
+    .bdrv_co_flush_to_os        = nbd_client_co_flush,
     .bdrv_co_pdiscard           = nbd_client_co_pdiscard,
     .bdrv_refresh_limits        = nbd_refresh_limits,
     .bdrv_co_truncate           = nbd_co_truncate,
@@ -2148,7 +2143,7 @@ static BlockDriver bdrv_nbd_tcp = {
     .bdrv_co_pwritev            = nbd_client_co_pwritev,
     .bdrv_co_pwrite_zeroes      = nbd_client_co_pwrite_zeroes,
     .bdrv_close                 = nbd_close,
-    .bdrv_co_flush_to_os        = nbd_co_flush,
+    .bdrv_co_flush_to_os        = nbd_client_co_flush,
     .bdrv_co_pdiscard           = nbd_client_co_pdiscard,
     .bdrv_refresh_limits        = nbd_refresh_limits,
     .bdrv_co_truncate           = nbd_co_truncate,
@@ -2176,7 +2171,7 @@ static BlockDriver bdrv_nbd_unix = {
     .bdrv_co_pwritev            = nbd_client_co_pwritev,
     .bdrv_co_pwrite_zeroes      = nbd_client_co_pwrite_zeroes,
     .bdrv_close                 = nbd_close,
-    .bdrv_co_flush_to_os        = nbd_co_flush,
+    .bdrv_co_flush_to_os        = nbd_client_co_flush,
     .bdrv_co_pdiscard           = nbd_client_co_pdiscard,
     .bdrv_refresh_limits        = nbd_refresh_limits,
     .bdrv_co_truncate           = nbd_co_truncate,
-- 
2.40.1


