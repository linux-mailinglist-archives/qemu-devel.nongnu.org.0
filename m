Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C58C3CFD34
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:15:06 +0200 (CEST)
Received: from localhost ([::1]:54778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5rSb-00015J-96
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m5rPZ-0003vx-QP
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:11:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m5rPY-0001Qu-33
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:11:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626793915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M3HROl9BRYOuFMUsoaT/3RcLt0CF31WE+GS2Km1/kiA=;
 b=MLTztOun1qQQfoUlw14hhMW1pyF/jp/0TQC/5eLwB9lmkVXcIoW5hjSUK32AA1EyjVaBae
 wyxQ5iRhlxx2vUAE6cVd0WVwmsUEAyHdfuqg26qULe2+DNGPmx/mKgLOLax0X/yb1p1mE7
 EF4jvwZg+4nETTuo1Jt1yUxf/1HG9cY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-_MvBZVohNuWCXBQgZvl0SQ-1; Tue, 20 Jul 2021 11:11:44 -0400
X-MC-Unique: _MvBZVohNuWCXBQgZvl0SQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9B47CC626;
 Tue, 20 Jul 2021 15:11:14 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-81.ams2.redhat.com [10.36.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D07F60843;
 Tue, 20 Jul 2021 15:11:13 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 10/11] block/export: Conditionally ignore set-context error
Date: Tue, 20 Jul 2021 17:10:52 +0200
Message-Id: <20210720151053.226144-11-kwolf@redhat.com>
In-Reply-To: <20210720151053.226144-1-kwolf@redhat.com>
References: <20210720151053.226144-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

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
Message-Id: <20210624083825.29224-2-mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
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


