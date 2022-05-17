Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CE052A34D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 15:25:35 +0200 (CEST)
Received: from localhost ([::1]:60530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqxCg-0000uE-PV
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 09:25:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqvXs-0001bZ-VO
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:39:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqvXr-00039v-8t
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:39:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652787558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hxOUHMZMmu/4q4OF5Ul5T0x6eryF0yzszdtPqGch5nE=;
 b=QXf7zdXwjy0RgVj5smQfCUqQ/32KTEKsqfk05YhHrBzOZ90487wpmnPvpVfzUprZQv3ChL
 NOquvsno993tYhS07fWfIqppoDTpTSTc2l6HPm12/GkbJm3LeXGzZO8UyvzRDH6aH3RO22
 xAkIukS0Yn97r/nbhFDcc/BQV219KZo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-l9RWOuETPDiTsSN8tTAf0w-1; Tue, 17 May 2022 07:39:17 -0400
X-MC-Unique: l9RWOuETPDiTsSN8tTAf0w-1
Received: by mail-wm1-f72.google.com with SMTP id
 q128-20020a1c4386000000b003942fe15835so8066420wma.6
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 04:39:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hxOUHMZMmu/4q4OF5Ul5T0x6eryF0yzszdtPqGch5nE=;
 b=X9ORvjB2q53B3Od0qZuEljKMV77Lk9JaRbevIjheyNdBfF93CW2bL3ApjKMKF5yKJO
 737OQBvProkPaZAa7/I+4gKobhtsUl+41UpDw4HZoPdtm9KK2x8C55tgsOExh4sncfeY
 4desCZS+EsfNk/dRI+xpywRo3f+Qi9qvmjFvIsRdnwDDTMbHCPndr6zWMEvn4Wnkon8v
 2FzagPwn9S8Wt7gARJB4kCD2LRXMWVearhHc8U0O89l3RO87rDKr48pPlCDJcr2tt+NR
 WhQFSFuHBTWbi1nOLaTRgrGfETgUFN5DyuQOh7tksZ8qTGPyMrzbHfudJHSSMRL9eA01
 X2jQ==
X-Gm-Message-State: AOAM533q5/u5jbLe4ioG+ZLEuKNVVFIl61SiAplOrq1pbFxZMuBa9HSe
 DvLr95rhfClHPQAOA+P3gohpdkwGj/UOnPRbC/9TTx3ZPixcMKOqpmiinVDhJJ+FZ0P/oE3bS5i
 fs/NijqRSvm77/VibwW+DqY3p37DqlUOZDmxlDhuhYWwgIHy2N7Rcbf1LXzhaFREU
X-Received: by 2002:adf:e70a:0:b0:20d:e3e:f79f with SMTP id
 c10-20020adfe70a000000b0020d0e3ef79fmr6189725wrm.105.1652787556177; 
 Tue, 17 May 2022 04:39:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHe2drs2W5VYjKFKknTW9e2yR/X2GF73MpKKlpTwr+Y5WNNgdVLN1EORC3Nka+CfyXia1bgQ==
X-Received: by 2002:adf:e70a:0:b0:20d:e3e:f79f with SMTP id
 c10-20020adfe70a000000b0020d0e3ef79fmr6189700wrm.105.1652787555895; 
 Tue, 17 May 2022 04:39:15 -0700 (PDT)
Received: from fedora.redhat.com ([2001:8a0:f4d9:2101:a4fa:5f93:755f:6249])
 by smtp.gmail.com with ESMTPSA id
 x9-20020adfae09000000b0020c5253d8edsm12093321wrc.57.2022.05.17.04.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 04:39:15 -0700 (PDT)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Alberto Faria <afaria@redhat.com>
Subject: [PATCH 18/18] block: Remove remaining unused symbols in coroutines.h
Date: Tue, 17 May 2022 12:39:07 +0100
Message-Id: <20220517113907.200001-7-afaria@redhat.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220517113524.197910-1-afaria@redhat.com>
References: <20220517113524.197910-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Some can be made static, others are unused generated_co_wrappers.

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 block/block-backend.c |  6 +++---
 block/coroutines.h    | 19 -------------------
 2 files changed, 3 insertions(+), 22 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 920ba0dd1f..bf63f187ef 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1358,7 +1358,7 @@ int coroutine_fn blk_co_preadv_part(BlockBackend *blk, int64_t offset,
 }
 
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
-int coroutine_fn
+static int coroutine_fn
 blk_co_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
                        QEMUIOVector *qiov, size_t qiov_offset,
                        BdrvRequestFlags flags)
@@ -1691,7 +1691,7 @@ BlockAIOCB *blk_aio_ioctl(BlockBackend *blk, unsigned long int req, void *buf,
 }
 
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
-int coroutine_fn
+static int coroutine_fn
 blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes)
 {
     int ret;
@@ -1739,7 +1739,7 @@ int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
 }
 
 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
-int coroutine_fn blk_co_do_flush(BlockBackend *blk)
+static int coroutine_fn blk_co_do_flush(BlockBackend *blk)
 {
     blk_wait_while_drained(blk);
     IO_CODE();
diff --git a/block/coroutines.h b/block/coroutines.h
index d66551a277..3a2bad564f 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -63,17 +63,6 @@ nbd_co_do_establish_connection(BlockDriverState *bs, bool blocking,
                                Error **errp);
 
 
-int coroutine_fn
-blk_co_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
-                       QEMUIOVector *qiov, size_t qiov_offset,
-                       BdrvRequestFlags flags);
-
-int coroutine_fn
-blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
-
-int coroutine_fn blk_co_do_flush(BlockBackend *blk);
-
-
 /*
  * "I/O or GS" API functions. These functions can run without
  * the BQL, but only in one specific iothread/main loop.
@@ -82,14 +71,6 @@ int coroutine_fn blk_co_do_flush(BlockBackend *blk);
  * the "I/O or GS" API.
  */
 
-int generated_co_wrapper
-bdrv_preadv(BdrvChild *child, int64_t offset, int64_t bytes,
-            QEMUIOVector *qiov, BdrvRequestFlags flags);
-
-int generated_co_wrapper
-bdrv_pwritev(BdrvChild *child, int64_t offset, int64_t bytes,
-             QEMUIOVector *qiov, BdrvRequestFlags flags);
-
 int generated_co_wrapper
 bdrv_common_block_status_above(BlockDriverState *bs,
                                BlockDriverState *base,
-- 
2.35.3


