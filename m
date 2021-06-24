Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A90E3B2A81
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 10:39:41 +0200 (CEST)
Received: from localhost ([::1]:39030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwKtg-0006NR-5Z
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 04:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwKsc-0004e4-UU
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 04:38:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwKsa-0005aA-Lk
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 04:38:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624523912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dYCYMyjeywWXfNqYhITp5HutawL5KubLshBdG0MKGaI=;
 b=ZLHIRFKwO/tlklNLgfmoaX9u3YPeXBt1sCRfkLaaQuRGqjWhPaAHJoVWkxjjWF5d6BNvON
 DRqAKvMTQSYn5KIvXsoZj6YmMoV8NZRgGwQWwlAe7ePrP36uwq9MZH+L/xi9r4fs70z7jG
 fDgw/M87LaX8lyJyHhlEug6OTdDfAyE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-8Q8WQ9JrO82egk8CqmsGvQ-1; Thu, 24 Jun 2021 04:38:30 -0400
X-MC-Unique: 8Q8WQ9JrO82egk8CqmsGvQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 747D9362FB;
 Thu, 24 Jun 2021 08:38:29 +0000 (UTC)
Received: from localhost (ovpn-112-15.ams2.redhat.com [10.36.112.15])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 164EE60583;
 Thu, 24 Jun 2021 08:38:28 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 1/2] block/export: Conditionally ignore set-context error
Date: Thu, 24 Jun 2021 10:38:24 +0200
Message-Id: <20210624083825.29224-2-mreitz@redhat.com>
In-Reply-To: <20210624083825.29224-1-mreitz@redhat.com>
References: <20210624083825.29224-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When invoking block-export-add with some iothread and
fixed-iothread=false, and changing the node's iothread fails, the error
is supposed to be ignored.

However, it is still stored in *errp, which is wrong.  If a second error
occurs, the "*errp must be NULL" assertion in error_setv() fails:

  qemu-system-x86_64: ../util/error.c:59: error_setv: Assertion
  `*errp == NULL' failed.

So if fixed-iothread=false, we should ignore the error by passing NULL
to bdrv_try_set_aio_context().

Fixes: f51d23c80af73c95e0ce703ad06a300f1b3d63ef
       ("block/export: add iothread and fixed-iothread options")
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/export/export.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/block/export/export.c b/block/export/export.c
index fec7d9f738..6d3b9964c8 100644
--- a/block/export/export.c
+++ b/block/export/export.c
@@ -111,6 +111,7 @@ BlockExport *blk_exp_add(BlockExportOptions *export, Error **errp)
     if (export->has_iothread) {
         IOThread *iothread;
         AioContext *new_ctx;
+        Error **set_context_errp;
 
         iothread = iothread_by_id(export->iothread);
         if (!iothread) {
@@ -120,7 +121,9 @@ BlockExport *blk_exp_add(BlockExportOptions *export, Error **errp)
 
         new_ctx = iothread_get_aio_context(iothread);
 
-        ret = bdrv_try_set_aio_context(bs, new_ctx, errp);
+        /* Ignore errors with fixed-iothread=false */
+        set_context_errp = fixed_iothread ? errp : NULL;
+        ret = bdrv_try_set_aio_context(bs, new_ctx, set_context_errp);
         if (ret == 0) {
             aio_context_release(ctx);
             aio_context_acquire(new_ctx);
-- 
2.31.1


