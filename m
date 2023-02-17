Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DCC69AF2E
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 16:12:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT2Nv-0005KF-Dw; Fri, 17 Feb 2023 10:10:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pT2NZ-0004uf-5K
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:10:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pT2NX-0007aQ-GM
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:10:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676646626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e9pesRi52NWVqzkxxHLhZ4GSCgta0zCVM487/CixNY8=;
 b=QdDACYUbTVYPd/Wqlb6/ArIM2jOjeEmGIqIhUM5BFCEP1NBcJUPYl8IDkdKYLoCfajE6no
 lH7v+TINEOq3DlDIW7mhf1NoJ53BgN7nn72xvhGbJXKhYYHtMiwHPrfNQACAA4WyPgDn8P
 sQ53AOJSyq0sDu40ABcRJw7DdIDKD7E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-wUMuEyi5OwOOoK6AYC_EnA-1; Fri, 17 Feb 2023 10:10:23 -0500
X-MC-Unique: wUMuEyi5OwOOoK6AYC_EnA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0885F100F908;
 Fri, 17 Feb 2023 15:10:23 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B076492C14;
 Fri, 17 Feb 2023 15:10:22 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 22/22] hbitmap: fix hbitmap_status() return value for first
 dirty bit case
Date: Fri, 17 Feb 2023 16:09:54 +0100
Message-Id: <20230217150954.283920-22-kwolf@redhat.com>
In-Reply-To: <20230217150954.283920-1-kwolf@redhat.com>
References: <20230217150829.283583-1-kwolf@redhat.com>
 <20230217150954.283920-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

From: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>

The last return statement should return true, as we already evaluated that
start == next_dirty

Also, fix hbitmap_status() description in header

Cc: qemu-stable@nongnu.org
Fixes: a6426475a75 ("block/dirty-bitmap: introduce bdrv_dirty_bitmap_status()")
Signed-off-by: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
Message-Id: <20230202181523.423131-1-andrey.zhadchenko@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/qemu/hbitmap.h | 2 +-
 util/hbitmap.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/qemu/hbitmap.h b/include/qemu/hbitmap.h
index af4e4ab746..8136e33674 100644
--- a/include/qemu/hbitmap.h
+++ b/include/qemu/hbitmap.h
@@ -330,7 +330,7 @@ bool hbitmap_next_dirty_area(const HBitmap *hb, int64_t start, int64_t end,
                              int64_t *dirty_start, int64_t *dirty_count);
 
 /*
- * bdrv_dirty_bitmap_status:
+ * hbitmap_status:
  * @hb: The HBitmap to operate on
  * @start: The bit to start from
  * @count: Number of bits to proceed
diff --git a/util/hbitmap.c b/util/hbitmap.c
index 297db35fb1..6d6e1b595d 100644
--- a/util/hbitmap.c
+++ b/util/hbitmap.c
@@ -331,7 +331,7 @@ bool hbitmap_status(const HBitmap *hb, int64_t start, int64_t count,
 
     assert(next_zero > start);
     *pnum = next_zero - start;
-    return false;
+    return true;
 }
 
 bool hbitmap_empty(const HBitmap *hb)
-- 
2.39.2


