Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF9267D321
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 18:27:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL5zx-0005lb-K2; Thu, 26 Jan 2023 12:25:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pL5zp-0005iG-Jm
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 12:25:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pL5zn-0006NT-C7
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 12:25:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674753905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qwZqVhO5mgih2lxqXqOvu1E7lteqTYsMWPIsuUqXc84=;
 b=f9DIxc7G0bpzRNEpPfQnd8GIMYXibuoR+jS6AHbim7yOYny6mG4mS7axhh1PPL60VcUbHy
 E07QsL1bUXV8WKH+HofaSB0fHUmyfPPcA0YerjRFX/KN0AR9jAjpxM8RwDDw/8fRJah1uB
 qaj6gVpGevStnQ/551PBnjy40S6W3kw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-167-7LFmHMK4PrOaPOUMwzpbXQ-1; Thu, 26 Jan 2023 12:25:03 -0500
X-MC-Unique: 7LFmHMK4PrOaPOUMwzpbXQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F5D3183B3D3;
 Thu, 26 Jan 2023 17:25:03 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 18379492C14;
 Thu, 26 Jan 2023 17:25:01 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 12/13] block: Fix bdrv_co_create_opts_simple() to open images
 with no_co_wrapper
Date: Thu, 26 Jan 2023 18:24:31 +0100
Message-Id: <20230126172432.436111-13-kwolf@redhat.com>
In-Reply-To: <20230126172432.436111-1-kwolf@redhat.com>
References: <20230126172432.436111-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

bdrv_co_create_opts_simpl() runs in a coroutine. Therefore it is not
allowed to open images directly. Fix the call to use the corresponding
no_co_wrapper instead.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index aa9062f2c1..6eac16eac5 100644
--- a/block.c
+++ b/block.c
@@ -657,8 +657,8 @@ int coroutine_fn bdrv_co_create_opts_simple(BlockDriver *drv,
     options = qdict_new();
     qdict_put_str(options, "driver", drv->format_name);
 
-    blk = blk_new_open(filename, NULL, options,
-                       BDRV_O_RDWR | BDRV_O_RESIZE, errp);
+    blk = blk_co_new_open(filename, NULL, options,
+                          BDRV_O_RDWR | BDRV_O_RESIZE, errp);
     if (!blk) {
         error_prepend(errp, "Protocol driver '%s' does not support image "
                       "creation, and opening the image failed: ",
-- 
2.38.1


