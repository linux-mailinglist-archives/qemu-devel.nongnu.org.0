Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB4B6DAFBA
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 17:33:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pko5d-0007hg-2F; Fri, 07 Apr 2023 11:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pko5b-0007h0-0m
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 11:33:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pko5Y-0003hX-52
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 11:33:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680881599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rMGB44GjwTSeWHp8nz33XjPowAu3Zq2W6k1C8KD5A/0=;
 b=hs1BWdoboWLIxD+d/zBTYja1ONLCvo4Y3piaiW3fp98HxO6KwgM1KATBW70UDDJwmUhaGT
 q9RP0ceKz+PGb1imnnuT/pnG13mw7f2JCo7xV7ifAh9H2PerUqIM+RBM76XvAxbaNCwZTN
 BpBMT3MCcm44+9Lm2WPMSyWwuUQJBXY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-FfEJniDiP4C3YyKyPSeJaw-1; Fri, 07 Apr 2023 11:33:18 -0400
X-MC-Unique: FfEJniDiP4C3YyKyPSeJaw-1
Received: by mail-wm1-f69.google.com with SMTP id
 m7-20020a05600c4f4700b003ee7e120bdfso19252454wmq.6
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 08:33:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680881596; x=1683473596;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rMGB44GjwTSeWHp8nz33XjPowAu3Zq2W6k1C8KD5A/0=;
 b=iWCaj4t/kmdDGI8Sr0Ycv9/N82j48UzR98mit+7u7yYvXF6M8gvvwYPK+bFkYInaoL
 5Bs/OZT23ih7kxPApUpCjQIQlT/14zfJ+TaosDRDR1Apt7WqGMMR9oBpcwc9nqjnJCPA
 qYqjor0sHHZ68/0E2LvilpJc3tZR5R/qnuGQl7ov6orfRf5yyul5+u8RoJuj1CxgIbRA
 lyQ0sxCQcdGnNKk05SmzHkn8EeOZHC8j82i8ZxxOlfWN3oQmB7tbUdZoIIi0fq/7JuxG
 9kv9e1U3/EY9hkWQP9y7JrjPTLZykaiRttEA7G4LswBzC2jtrxy98pMNd760TzY1+ZIU
 t9Eg==
X-Gm-Message-State: AAQBX9dtPyv6MAHrMMqUpn0LBVxxiwC4RKj5PFzcPIr0AqmV1rur7BBj
 +Xp4PbHm1DcbaNjy2ckaTjMDbzH7kHTJs2FYwDWxMTVTaGJ17jhMo2IRgowpyQgYBRZv7VDsSR7
 5yGDd+64Pt5y+bgpyVZHMRnUDXhJLk0mV9DPTkm8oiEKHU/fIfwNWwBGlQ1Sjlk8YGcbhuOO+d7
 U=
X-Received: by 2002:a7b:c302:0:b0:3ea:f6c4:305e with SMTP id
 k2-20020a7bc302000000b003eaf6c4305emr1623480wmj.38.1680881596693; 
 Fri, 07 Apr 2023 08:33:16 -0700 (PDT)
X-Google-Smtp-Source: AKy350aT84d1hm9VG8ZVyTk5BMbbmOOrk9y6/sdBSZCkx4/ZHrdp24bc2OE10LVNbsUfR3vTsh5zEQ==
X-Received: by 2002:a7b:c302:0:b0:3ea:f6c4:305e with SMTP id
 k2-20020a7bc302000000b003eaf6c4305emr1623468wmj.38.1680881596483; 
 Fri, 07 Apr 2023 08:33:16 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a5d4c83000000b002e55cc69169sm4742937wrs.38.2023.04.07.08.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 08:33:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, kwolf@redhat.com, qemu-block@nongnu.org,
 hreitz@redhat.com
Subject: [PATCH 6/8] block-backend: inline bdrv_co_get_geometry
Date: Fri,  7 Apr 2023 17:33:01 +0200
Message-Id: <20230407153303.391121-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230407153303.391121-1-pbonzini@redhat.com>
References: <20230407153303.391121-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

bdrv_co_get_geometry is only used in blk_co_get_geometry.  Inline it in
there, to reduce the number of wrappers for bs->total_sectors.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block.c                  | 10 ----------
 block/block-backend.c    |  8 ++++++--
 include/block/block-io.h |  3 ---
 3 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/block.c b/block.c
index 9de50ac7c811..dbbc8de30c24 100644
--- a/block.c
+++ b/block.c
@@ -5879,16 +5879,6 @@ int64_t coroutine_fn bdrv_co_getlength(BlockDriverState *bs)
     return ret * BDRV_SECTOR_SIZE;
 }
 
-/* return 0 as number of sectors if no device present or error */
-void coroutine_fn bdrv_co_get_geometry(BlockDriverState *bs,
-                                       uint64_t *nb_sectors_ptr)
-{
-    int64_t nb_sectors = bdrv_co_nb_sectors(bs);
-    IO_CODE();
-
-    *nb_sectors_ptr = nb_sectors < 0 ? 0 : nb_sectors;
-}
-
 bool bdrv_is_sg(BlockDriverState *bs)
 {
     IO_CODE();
diff --git a/block/block-backend.c b/block/block-backend.c
index 7d331d93ebbc..f159cc51d264 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1627,16 +1627,20 @@ int64_t coroutine_fn blk_co_getlength(BlockBackend *blk)
     return bdrv_co_getlength(blk_bs(blk));
 }
 
+/* return 0 as number of sectors if no device present or error */
 void coroutine_fn blk_co_get_geometry(BlockBackend *blk,
                                       uint64_t *nb_sectors_ptr)
 {
+    BlockDriverState *bs = blk_bs(blk);
+
     IO_CODE();
     GRAPH_RDLOCK_GUARD();
 
-    if (!blk_bs(blk)) {
+    if (!bs) {
         *nb_sectors_ptr = 0;
     } else {
-        bdrv_co_get_geometry(blk_bs(blk), nb_sectors_ptr);
+        int64_t nb_sectors = bdrv_co_nb_sectors(bs);
+        *nb_sectors_ptr = nb_sectors < 0 ? 0 : nb_sectors;
     }
 }
 
diff --git a/include/block/block-io.h b/include/block/block-io.h
index dbc034b7288e..9e2248a295a6 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -90,9 +90,6 @@ int64_t co_wrapper bdrv_get_allocated_file_size(BlockDriverState *bs);
 BlockMeasureInfo *bdrv_measure(BlockDriver *drv, QemuOpts *opts,
                                BlockDriverState *in_bs, Error **errp);
 
-void coroutine_fn GRAPH_RDLOCK
-bdrv_co_get_geometry(BlockDriverState *bs, uint64_t *nb_sectors_ptr);
-
 int coroutine_fn GRAPH_RDLOCK
 bdrv_co_delete_file(BlockDriverState *bs, Error **errp);
 
-- 
2.39.2


