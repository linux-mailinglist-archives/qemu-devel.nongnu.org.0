Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7D56A0FCC
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 19:53:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVGhG-0006kD-Mc; Thu, 23 Feb 2023 13:52:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhF-0006jJ-3k
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhD-0002r8-7P
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677178317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5FvBBZeRjtNw67/DCFkZuO/ETPX1qY4CPmmC2EXKCEM=;
 b=FhXQNs4R78qWhqH/lMIM7I45RTpAZp+806mxA7K52xxqXFkAsnlPpw74Lg40sLGRGgC6/W
 IUyAJQqhS2EM5il8G/wbPT1HK9g47gV7/vF8JjjZyNUklmMZVtA2d53kiG5mUIPVotxbRe
 Ot/Nl/HlGTkeMooYkC1kU8s4l+nOrnA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-UwEU6hyRP56YyUkO-aPf1A-1; Thu, 23 Feb 2023 13:51:52 -0500
X-MC-Unique: UwEU6hyRP56YyUkO-aPf1A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8CB3B802D38;
 Thu, 23 Feb 2023 18:51:52 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D26BB1121314;
 Thu, 23 Feb 2023 18:51:51 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 01/29] block: Make bdrv_can_set_read_only() static
Date: Thu, 23 Feb 2023 19:51:18 +0100
Message-Id: <20230223185146.306454-2-kwolf@redhat.com>
In-Reply-To: <20230223185146.306454-1-kwolf@redhat.com>
References: <20230223185146.306454-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

It is never called outside of block.c.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230203152202.49054-2-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h | 2 --
 block.c                  | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index 614cbd7eda..f9fa88204d 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -134,8 +134,6 @@ int bdrv_is_allocated_above(BlockDriverState *top, BlockDriverState *base,
 int coroutine_fn bdrv_co_is_zero_fast(BlockDriverState *bs, int64_t offset,
                                       int64_t bytes);
 
-int bdrv_can_set_read_only(BlockDriverState *bs, bool read_only,
-                           bool ignore_allow_rdw, Error **errp);
 int bdrv_apply_auto_read_only(BlockDriverState *bs, const char *errmsg,
                               Error **errp);
 bool bdrv_is_read_only(BlockDriverState *bs);
diff --git a/block.c b/block.c
index 0c807d15cd..31f13092cb 100644
--- a/block.c
+++ b/block.c
@@ -277,8 +277,8 @@ bool bdrv_is_read_only(BlockDriverState *bs)
     return !(bs->open_flags & BDRV_O_RDWR);
 }
 
-int bdrv_can_set_read_only(BlockDriverState *bs, bool read_only,
-                           bool ignore_allow_rdw, Error **errp)
+static int bdrv_can_set_read_only(BlockDriverState *bs, bool read_only,
+                                  bool ignore_allow_rdw, Error **errp)
 {
     IO_CODE();
 
-- 
2.39.2


