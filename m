Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 129BF6EE6D1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 19:34:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prMX2-0007cm-75; Tue, 25 Apr 2023 13:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prMWc-0006j1-36
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:32:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prMWZ-0004GQ-Tv
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 13:32:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682443939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ErL9ajbmnuMApCqEwvcK/UJaxFGZdKvpw5ixEZxO5zE=;
 b=EUehM7kMZiCSfResPKNXwiA88HEEbhifP8/w9tVmnOYP5d9EWSC3qoWkmado0gsPh9OAIZ
 XuuTe0hrOk8aCA8b7nh9khEuVIca2GfiWZ5nf07iIcA6KWnBWA5sneaxJYyTlhH3zSD9E3
 eCK10F90M/vNLCDFeuVWqxmD5hPLGkY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-O_ubGj9xPO65JTa90mEdhQ-1; Tue, 25 Apr 2023 13:32:15 -0400
X-MC-Unique: O_ubGj9xPO65JTa90mEdhQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DDFC28082A6;
 Tue, 25 Apr 2023 17:32:15 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 670E2492B03;
 Tue, 25 Apr 2023 17:32:14 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 eesposit@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 09/20] nbd: Remove nbd_co_flush() wrapper function
Date: Tue, 25 Apr 2023 19:31:47 +0200
Message-Id: <20230425173158.574203-10-kwolf@redhat.com>
In-Reply-To: <20230425173158.574203-1-kwolf@redhat.com>
References: <20230425173158.574203-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

The only thing nbd_co_flush() does is calling nbd_client_co_flush().
Just use that function directly in the BlockDriver definitions and
remove the wrapper.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
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
2.40.0


