Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F9364DC0D
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 14:15:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5nsz-0001uS-D6; Thu, 15 Dec 2022 08:02:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p5nsj-0001pN-VQ
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 08:02:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p5nsi-0000c1-0Y
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 08:02:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671109354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=S88iisk2rVx/joUpIu7uRvFZbl6W8Gd6z2tStNQLVz8=;
 b=CvYoP9tlGVHpUEked3oHTUBPaDXlvq8nEHlsCiWHF8uTWsnA0osxXWNQCcggOkJbMG4woJ
 ZWc7hoV5VZxQDVzE5rl7x4pTle0lst8p4vahITlJHRaAqLpgpnc9nRtd4pvIdmhsn5P8BL
 JKK0GJEjrEVSH+axnj/Kqn7EQxjan0s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-392-EzI-SozZPDGaL9XxrE1pxQ-1; Thu, 15 Dec 2022 08:02:33 -0500
X-MC-Unique: EzI-SozZPDGaL9XxrE1pxQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 g9-20020a7bc4c9000000b003d214cffa4eso743621wmk.5
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 05:02:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S88iisk2rVx/joUpIu7uRvFZbl6W8Gd6z2tStNQLVz8=;
 b=UyqTC+fHZY7CrixvbCrDPiT7ObO8WLpcyohLAUFUYacSyPFfdMC9bEV2v4DaBmEQ/Z
 QPcuHDN2UkhTPf0I7CdAvBwZL7yanfGf5mWrrw+GxfxlySrc5n2YlQK1wHUhvl57Ye6V
 xZOtkc/n18csYY7W5k3/HP6XWde4DmfrNJbm+uYRB+j4+ww1UyYJNanTuj4EVtKewgvN
 dLrgky79/uwGQoLLqxNNqMHDT1+9T/7jWMBdSaliTGiqohPp0SVCUNqc8zQ/d56g0OTF
 tEHvwTIX2aZKQNCsi/5oEcqKQkuAK71ydkHwwHlVyYct/FRaQNCowZFUW7hkJRddJPPB
 9aZQ==
X-Gm-Message-State: ANoB5pkBtC9XpIVmrQtdvAhfg9kIcABs4nCWPPF4tjzYfg/MSlF1LZog
 JXDnxKCdWjymNIFkxnbeNKVEcaBZzVzoWx9MJ+7sPd6VXHgZO5noVSc7GzL9MzWNMiNlDNDPVLK
 wzZC5VwT4Fh0AYUH0I637FqSKn0Jce7cEXhcLiWOEylvfwCgKelIteNmvfQFyJni4w7c=
X-Received: by 2002:a05:600c:a56:b0:3d1:d396:1adc with SMTP id
 c22-20020a05600c0a5600b003d1d3961adcmr29288098wmq.14.1671109351693; 
 Thu, 15 Dec 2022 05:02:31 -0800 (PST)
X-Google-Smtp-Source: AA0mqf71TW4dY8sWfkTdPPc7FUIPtGc1mU9I4uHMrpOiArUPMJ/zIwgg6Y8JKiqjkzVTyNdNM0xbxA==
X-Received: by 2002:a05:600c:a56:b0:3d1:d396:1adc with SMTP id
 c22-20020a05600c0a5600b003d1d3961adcmr29288057wmq.14.1671109351337; 
 Thu, 15 Dec 2022 05:02:31 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 p18-20020a05600c1d9200b003cf4ec90938sm6535928wms.21.2022.12.15.05.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 05:02:30 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	kwolf@redhat.com
Subject: [PATCH] block: remove bdrv_coroutine_enter
Date: Thu, 15 Dec 2022 14:02:24 +0100
Message-Id: <20221215130225.476477-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

It has only one caller---inline it and remove the function.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block.c                  | 6 ------
 block/block-backend.c    | 2 +-
 include/block/block-io.h | 5 -----
 3 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/block.c b/block.c
index 9c2ac757e495..3f2bd128570e 100644
--- a/block.c
+++ b/block.c
@@ -7177,12 +7177,6 @@ void coroutine_fn bdrv_co_unlock(BlockDriverState *bs)
     }
 }
 
-void bdrv_coroutine_enter(BlockDriverState *bs, Coroutine *co)
-{
-    IO_CODE();
-    aio_co_enter(bdrv_get_aio_context(bs), co);
-}
-
 static void bdrv_do_remove_aio_context_notifier(BdrvAioNotifier *ban)
 {
     GLOBAL_STATE_CODE();
diff --git a/block/block-backend.c b/block/block-backend.c
index 2852a892de6c..a3e7901f291e 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1555,7 +1555,7 @@ static BlockAIOCB *blk_aio_prwv(BlockBackend *blk, int64_t offset,
     acb->has_returned = false;
 
     co = qemu_coroutine_create(co_entry, acb);
-    bdrv_coroutine_enter(blk_bs(blk), co);
+    aio_co_enter(blk_get_aio_context(blk), co);
 
     acb->has_returned = true;
     if (acb->rwco.ret != NOT_DONE) {
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 2ed6214909d8..1fa717a545a0 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -210,11 +210,6 @@ AioContext *coroutine_fn bdrv_co_enter(BlockDriverState *bs);
  */
 void coroutine_fn bdrv_co_leave(BlockDriverState *bs, AioContext *old_ctx);
 
-/**
- * Transfer control to @co in the aio context of @bs
- */
-void bdrv_coroutine_enter(BlockDriverState *bs, Coroutine *co);
-
 AioContext *child_of_bds_get_parent_aio_context(BdrvChild *c);
 
 void bdrv_io_plug(BlockDriverState *bs);
-- 
2.38.1


